import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:huongno/constant/app_font_size.dart';
import 'package:huongno/model/filebook.dart';
import 'package:huongno/widgets/master_layout.dart';
class DetailFileBookPage extends StatefulWidget {
  const DetailFileBookPage({Key? key, required this.fileBook}) : super(key: key);
  final FileBook? fileBook;

  @override
  State<DetailFileBookPage> createState() => _DetailFileBookPageState();
}

class _DetailFileBookPageState extends State<DetailFileBookPage> {
  String? name;
  String? phone;
  String? nameAnimal;
  String? datetime;
  String? _image1;
  String? _image2;
  String? _clinical_symptoms;

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    name = widget.fileBook!.customer!.name;
    phone = widget.fileBook!.customer!.phone;
    nameAnimal = widget.fileBook!.animal!.nameAnimal;
    datetime = widget.fileBook!.datetime!;
    _image1 = widget.fileBook!.image_1!;
    _image2 = widget.fileBook!.image_2!;
    _clinical_symptoms = widget.fileBook!.clinical_symptoms;
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return MasterLayout(
        title: Text('Chi tiết hồ sơ bệnh'.toUpperCase()),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.blue,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Tên khách hàng :',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: AppFontSize.normal,
                                    color: Colors.white
                                ),
                              ),
                              Text(
                                ' $name',
                                style: const TextStyle(fontSize: AppFontSize.medium, fontWeight: FontWeight.bold, color: Colors.yellow),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            children: [
                              const Text(
                                'Số điện thoại :',
                                style: TextStyle(
                                    fontSize:AppFontSize.normal,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),
                              ),
                              Text(
                                ' $phone',
                                style: const TextStyle(fontSize: AppFontSize.medium, fontWeight: FontWeight.bold, color: Colors.yellow),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            children: [
                              const Text(
                                'Ngày giờ khám :',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: AppFontSize.normal,
                                    color: Colors.white
                                ),
                              ),
                              Text(
                                ' $datetime',
                                style: const TextStyle(fontSize: AppFontSize.medium, fontWeight: FontWeight.bold, color: Colors.yellow),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            children: [
                              const Text(
                                'Triệu chứng lâm sàn : ',
                                style: TextStyle(
                                    fontSize: AppFontSize.normal,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),
                              ),
                              Text(
                                '$_clinical_symptoms',
                                style: const TextStyle(fontSize: AppFontSize.medium, fontWeight: FontWeight.bold, color: Colors.yellow),
                              )

                            ],
                          ),
                          const SizedBox(height: 10,),
                          Column(
                            children: [
                              const Text(
                                'Phát đồ điều trị :',
                                style: TextStyle(
                                    fontSize: AppFontSize.medium,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),
                              ),

                              for (var el in widget.fileBook!.bill!.billinfo!)
                                Text('- ${el.productname}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: AppFontSize.medium,
                                      color: Colors.yellow
                                  ),
                                ),
                            ],
                          ),

                          const SizedBox(height: 40,),
                          const Text(
                            'Hình ảnh:',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: AppFontSize.medium,
                                color: Colors.white
                            ),
                          ),
                          const SizedBox(height: 20,),
                            SizedBox(
                            height: 300,
                            width: 400,
                            child: InteractiveViewer(
                                panEnabled: false, // Set it to false
                                boundaryMargin:const EdgeInsets.all(100),
                                minScale: 0.5,
                                maxScale: 2,
                                child: Image.network('https://datlich.thuybinhduong.com/storage/Image/${_image1!}',
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.cover,
                                )
                            ) ,

                          ),
                          const SizedBox(height: 5,),
                          SizedBox(
                            height: 300,
                            width: 400,
                            child: InteractiveViewer(
                                panEnabled: false, // Set it to false
                                boundaryMargin: EdgeInsets.all(100),
                                minScale: 0.5,
                                maxScale: 2,
                                child: Image.network('https://datlich.thuybinhduong.com/storage/Image/${_image2!}',
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.cover,
                                )
                            ),

                          ),

                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          )
        )
    );
  }

}
