import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huongno/constant/app_colors.dart';
import 'package:huongno/constant/app_font_size.dart';
import 'package:huongno/screen/camera_page.dart';
import 'package:huongno/widgets/app_button.dart';
import 'package:huongno/widgets/app_card.dart';
import 'package:huongno/widgets/gird_image.dart';
import 'package:huongno/widgets/master_layout.dart';

class UpdateFileBookPage extends StatefulWidget {
  UpdateFileBookPage({Key? key, required this.id}) : super(key: key);
  late  int? id;
  @override
  State<UpdateFileBookPage> createState() => _UpdateFileBookPageState();
}

class _UpdateFileBookPageState extends State<UpdateFileBookPage> {
  final ValueNotifier<List<String>> _images = ValueNotifier([]);
   int? _idController;

  @override
  void initState() {
   _idController = widget.id;
    super.initState();
  }

  void _callbackNavigation(List<CameraDescription> cameras) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => CameraPage(
          cameras: cameras,
          onCaptured: (value, front) {
            _images.value = List<String>.from(_images.value)..addAll(value);
          },
        ),
      ),
    );
  }

  void _handlePersonalImage() async {
    List<CameraDescription> cameras = await availableCameras();
    _callbackNavigation(cameras);
  }

  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      title: const Text('Đánh giá Hoàn thành'),
      bottomNavigationBar:  Row(
        children: [
          Expanded(
            child: AppButtons.elevatedButton(
              onPressed: () {

              },
              title: 'Gửi đánh giá & Kết thúc đơn',
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(
              height: 10,
            ),
            const Divider(),
            AppCard(
              child: Column(
                children: [
                  const Text(
                    'Bác sĩ lưu ý chụp chuẩn xác để trong quá trình cập nhật cũng như xem lại không để xảy ra lỗi hoặc xem lại'
                        ' không bị nhoè hình !',
                    style: TextStyle(
                      fontSize: AppFontSize.medium,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Center(
                    child :Text(
                      'Cảm ơn !',
                    style: TextStyle(
                      fontSize: AppFontSize.medium,
                      fontWeight: FontWeight.bold,

                    )
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: AppButtons.outlinedButton(
                      title: 'Chụp ảnh',
                      onPressed: () {
                        _handlePersonalImage();
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15, bottom: 10),
              child: const Text(
                'Ảnh đã chụp',
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 200,
              child: ValueListenableBuilder(
                valueListenable: _images,
                builder: (_, __, ___) {
                  return GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 3 / 4,
                    children: List.generate(
                      _images.value.length,
                          (index) => Stack(
                        children: [
                          GridImageCard(
                            imagePath: _images.value[index],
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              icon: const Icon(Icons.remove_circle_outline_rounded),
                              color: AppColor.secondary,
                              onPressed: () {
                                _images.value = List<String>.from(_images.value)..removeAt(index);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
