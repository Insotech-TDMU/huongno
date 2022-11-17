import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:huongno/widgets/camera_overlay.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({
    Key? key,
    required this.cameras,
    this.identityCaptureMode = false,
    this.normalMode = true,
    required this.onCaptured,
  }) : super(key: key);

  final List<CameraDescription> cameras;
  final bool identityCaptureMode;
  final bool normalMode;
  final void Function(List<String> value, bool front) onCaptured;

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  final ValueNotifier<List<String>> _imageCaptured = ValueNotifier([]);
  int _currentCamera = 0;
  bool _isFlashOn = false;

  @override
  void initState() {
    initCameraState();
    super.initState();
  }

  void onCapture() {
    widget.onCaptured(_imageCaptured.value, _currentCamera == 1 ? true : false);
    Navigator.pop(context);
  }

  void initCameraState() async {
    _controller = CameraController(widget.cameras[_currentCamera], ResolutionPreset.max);
    _initializeControllerFuture = _controller.initialize();
    await _controller.lockCaptureOrientation(DeviceOrientation.portraitUp);
  }

  Future<void> _onCameraSwitch() async {
    _currentCamera = _currentCamera == 0 ? 1 : 0;
    await _controller.dispose();

    _controller = CameraController(widget.cameras[_currentCamera], ResolutionPreset.medium);
    _controller.addListener(() {
      if (mounted) setState(() {});
      if (_controller.value.hasError) {
        debugPrint(_controller.value.errorDescription);
      }
    });

    try {
      await _controller.initialize();
    } on CameraException catch (e) {
      debugPrint(e.toString());
    }

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: SizedBox.expand(
        child: FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done || !_controller.value.isInitialized) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Stack(
                alignment: FractionalOffset.center,
                children: [
                  Positioned.fill(
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: CameraPreview(
                        _controller,
                      ),
                    ),
                  ),
                  if (!widget.normalMode)
                    ValueListenableBuilder(
                      valueListenable: _imageCaptured,
                      builder: (_, __, ___) {
                        return CameraOverlay(
                          imageCaptured: _imageCaptured.value.length,
                          ratio: widget.identityCaptureMode ? 1.44 : 1,
                        );
                      },
                    ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      height: 120.0,
                      padding: const EdgeInsets.all(20.0),
                      color: const Color.fromRGBO(00, 00, 00, 0.7),
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.center,
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () async {
                                  final image = await _controller.takePicture();
                                  _imageCaptured.value = List<String>.from(_imageCaptured.value)..add(image.path);

                                  if (!widget.identityCaptureMode || _imageCaptured.value.length == 2) {
                                    print("Osin path: " + image.path);
                                    onCapture();
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(4.0),
                                  child: const Center(
                                    child: Icon(
                                      Icons.camera_alt_rounded,
                                      color: Colors.white,
                                      size: 50,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (!widget.identityCaptureMode)
                            Align(
                              alignment: Alignment.centerRight,
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(50.0),
                                  ),
                                  onTap: () {
                                    _onCameraSwitch();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(4.0),
                                    child: const Icon(
                                      Icons.flip_camera_android_rounded,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(50.0),
                                ),
                                onTap: () {
                                  if (_isFlashOn) {
                                    _controller.setFlashMode(FlashMode.off);
                                  } else {
                                    _controller.setFlashMode(FlashMode.torch);
                                  }

                                  setState(() {
                                    _isFlashOn = !_isFlashOn;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(4.0),
                                  child: const Icon(
                                    Icons.flash_on_rounded,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}