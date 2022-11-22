import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huongno/constant/app_colors.dart';
import 'package:huongno/constant/app_font_size.dart';
import 'package:huongno/main.dart';
import 'package:huongno/screen/camera_page.dart';
import 'package:huongno/screen/home_page.dart';
import 'package:huongno/screen/update/bloc/update_bloc.dart';
import 'package:huongno/widgets/app_button.dart';
import 'package:huongno/widgets/app_card.dart';
import 'package:huongno/widgets/app_dialog.dart';
import 'package:huongno/widgets/master_layout.dart';

import '../../model/filebook.dart';

class UpdateFileBookPage extends StatefulWidget {
  UpdateFileBookPage({Key? key, required this.fileBook}) : super(key: key);
  late  FileBook? fileBook;
  @override
  State<UpdateFileBookPage> createState() => _UpdateFileBookPageState();
}

class _UpdateFileBookPageState extends State<UpdateFileBookPage> {

  final _formKey = GlobalKey<FormState>();
  late  String name;
  int? id;
  String _Image1 = '';
  String _Image2 = '';
  String _Image3 = '';
  final ValueNotifier<String> _personalImage = ValueNotifier('');
  final ValueNotifier<String> _personalImage1 = ValueNotifier('');
  final ValueNotifier<String> _personalImage2 = ValueNotifier('');

  @override
  void initState() {
    id = widget.fileBook!.id;
    name = widget.fileBook!.customer!.name!;
    super.initState();
  }


  void _onCapture() async {
    List<CameraDescription> cameras = await availableCameras();
    _openCameraView(cameras);
  }
  void _onCapture1() async {
    List<CameraDescription> cameras = await availableCameras();
    _openCameraView1(cameras);
  }
  void _onCapture2() async {
    List<CameraDescription> cameras = await availableCameras();
    _openCameraView2(cameras);
  }


  void _openCameraView(List<CameraDescription> cameras) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) {
        return CameraPage(
          cameras: cameras,
          normalMode: false,
          onCaptured: (value, front) async {
            if (value.isNotEmpty) {
              _Image1 = '';
              _personalImage.value = base64Encode(File(value.first).readAsBytesSync());
            } else {

            }
          },
        );
      }),
    );
  }
  void _openCameraView1(List<CameraDescription> cameras) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) {
        return CameraPage(
          cameras: cameras,
          normalMode: false,
          onCaptured: (value, front) async {
            if (value.isNotEmpty) {
              _Image2 = '';
              _personalImage1.value = base64Encode(File(value.first).readAsBytesSync());
            } else {

            }
          },
        );
      }),
    );
  }
  void _openCameraView2(List<CameraDescription> cameras) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) {
        return CameraPage(
          cameras: cameras,
          normalMode: false,
          onCaptured: (value, front) async {
            if (value.isNotEmpty) {
              _Image3 = '';
              _personalImage2.value = base64Encode(File(value.first).readAsBytesSync());
            } else {

            }
          },
        );
      }),
    );
  }



  @override
  Widget build(BuildContext context) {
    BuildContext alertContext = context;
    return MasterLayout(
      title: const Text('CẬP NHẬT HỒ SƠ BỆNH'),
      bottomNavigationBar:
      Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10),
        child: BlocProvider<UpdateBloc>(
          create: (_) => UpdateBloc(),
          child: BlocListener<UpdateBloc, UpdateState>(
            listener: (context, state) {
              if (state is UpdateLoadingState) {
                AppDialog.showLoading(
                  alertContext,
                  content: 'Vui lòng chờ !',
                );
              }

              if (state is UpdateErrorState) {
                Navigator.pop(alertContext);
                AppDialog.show(
                  alertContext,
                  title: 'Lỗi',
                  content: 'Đã có lỗi xảy ra ',
                  primaryButtonTitle: 'Đồng ý',
                  onPrimaryTap: () {
                    Navigator.pop(context);
                  },
                );
              }

              if (state is UpdateSuccessState) {
                Navigator.pop(alertContext);
                AppDialog.show(
                  alertContext,
                  title: 'Thành công',
                  content: 'Cập nhật hình thành công!',
                  primaryButtonTitle: 'Đồng ý',
                  onPrimaryTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const HomePage()));
                  },
                );
              }
            },
            child: BlocBuilder<UpdateBloc, UpdateState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: AppButtons.elevatedButton(
                        onPressed: () async {
                          if(_personalImage.value.isNotEmpty || _personalImage1.value.isNotEmpty) {
                            BlocProvider.of<UpdateBloc>(context).add(
                            UpdateLoadedEvent(
                              id!,
                              _personalImage.value,
                              _personalImage1.value,
                              _personalImage2.value,
                            ),
                          );
                          }
                          else{
                            String content = '';

                            if (_personalImage.value.isEmpty || _personalImage1.value.isEmpty) {
                              content += 'Vui lòng chụp ảnh để cập nhật';
                              content += ' ';
                            }AppDialog.show(
                              context,
                              title: 'Cảnh báo',
                              content: content,
                              primaryButtonTitle: 'Đồng ý',
                              onPrimaryTap: () {
                                Navigator.pop(context);
                              },
                            );
                          }
                        },
                        title:'Cập nhật'.toUpperCase(),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppCard(
              child: Column(
                children:const [
                  Divider(color: Colors.black,indent: 10,endIndent: 10),
                  SizedBox(
                    width: 350,
                    child: Text(
                      'Bác sĩ lưu ý chụp hình cho rõ nét và canh chỉnh đúng tỉ lệ trong qua trình chụp ! '
                          'để khi xem lại hình ảnh không bị nhoè và mất chữ ! '
                          '\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tCẢM ƠN',
                      style: TextStyle(
                        fontSize: AppFontSize.medium,
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                  ),

                  Divider(color: Colors.black,indent: 10,endIndent: 10,),

                ],
              ),
            ),
            AppCard(
              child: Column(
                children: [
                  const Text('Tên khách hàng',style: TextStyle(
                    fontSize: AppFontSize.medium, fontWeight: FontWeight.bold,
                  ),),
                  const Divider(color: Colors.black,indent: 10,endIndent: 10,),
                  SizedBox(
                    width: 350,
                    child:Container(
                      width: double.infinity,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Text(
                        name!,
                        style:const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: AppFontSize.medium,
                            color: Colors.black
                        ),
                      ),
                    ),
                  ),

                  const Divider(color: Colors.black,indent: 10,endIndent: 10,),

                ],
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child:Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ValueListenableBuilder(
                        valueListenable: _personalImage,
                        builder: (_, __, ___) {
                          return InkWell(
                            onTap: () => _onCapture(),
                            child: _Image1.isNotEmpty
                                ?
                            SizedBox(
                              height: 200.0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.memory(
                                  base64Decode(_Image1),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )
                                : _personalImage.value.isNotEmpty
                                ?
                            SizedBox(
                              height: 200.0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.memory(
                                  base64Decode(_personalImage.value),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                                : CircleAvatar(
                              radius: 50,
                              backgroundColor: AppColor.lightGrey.withOpacity(0.5),
                              child: const Icon(
                                Icons.camera_alt_rounded,
                                color: Colors.grey,
                              ),
                            ),
                          );
                        }
                    ),
                    const SizedBox(width: 20,),
                    ValueListenableBuilder(
                        valueListenable: _personalImage1,
                        builder: (_, __, ___) {
                          return InkWell(
                            onTap: () => _onCapture1(),
                            child: _Image2.isNotEmpty
                                ?
                            SizedBox(
                              height: 200.0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.memory(
                                  base64Decode(_Image2),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                                : _personalImage1.value.isNotEmpty
                                ?
                            SizedBox(
                              height: 200.0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.memory(
                                  base64Decode(_personalImage1.value),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                                : CircleAvatar(
                              radius: 50,
                              backgroundColor: AppColor.lightGrey.withOpacity(0.5),
                              child: const Icon(
                                Icons.camera_alt_rounded,
                                color: Colors.grey,
                              ),
                            ),
                          );
                        }
                    ),
                  ],
                ),
            )
          ],
        ),
      ),
    );
  }
}
