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


  @override
  void initState() {
   name = widget.fileBook!.customer!.name;
   phone = widget.fileBook!.customer!.phone;
   nameAnimal = widget.fileBook!.animal!.nameAnimal;
   datetime = widget.fileBook!.datetime!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      title:  Text('Chi tiết khách hàng'.toUpperCase()),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.black54,

              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.people,color: Colors.amberAccent,),
                        Text(
                          ' $name',
                          style:const TextStyle(
                              fontSize: AppFontSize.medium,
                              fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.phone,color: Colors.amberAccent,),
                        Text(
                          ': $phone',
                          style:const TextStyle(
                              fontSize: AppFontSize.medium,
                              fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.pets,color: Colors.amberAccent,),
                        Text(
                          ' $nameAnimal',
                          style:const TextStyle(
                              fontSize: AppFontSize.medium,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.update,color: Colors.amberAccent,),
                        Text(
                          ': $datetime',
                          style:const TextStyle(
                              fontSize: AppFontSize.medium,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )

          ],
        ),
      )
    );
  }
}
