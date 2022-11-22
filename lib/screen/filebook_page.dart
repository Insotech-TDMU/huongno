import 'dart:async';

import 'package:flutter/material.dart';
import 'package:huongno/controller/filebook_controller.dart';
import 'package:huongno/model/filebook.dart';
import 'package:huongno/screen/blocFilebook/search_filebook_page.dart';
import 'package:huongno/screen/detail_filebook_page.dart';
import 'package:huongno/screen/update/update_filebook_page.dart';
import 'package:huongno/widgets/app_button.dart';
import 'package:huongno/widgets/master_layout.dart';
import 'package:huongno/widgets/search_widget.dart';

class FileBookPage extends StatefulWidget {
  const FileBookPage({Key? key}) : super(key: key);

  @override
  State<FileBookPage> createState() => _FileBookPageState();
}

class _FileBookPageState extends State<FileBookPage> {

  final FileBookController _customerController = FileBookController();
  String query = '';
  List<FileBook> customers = [];
  Timer? time;

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    time?.cancel();
    super.dispose();
  }

  void debounce(
      VoidCallback callback, {
        Duration duration = const Duration(milliseconds: 1000),
      }) {
    if (time != null) {
      time!.cancel();
    }

    time = Timer(duration, callback);
  }

  Future init() async{
    final customers = await _customerController.searchFileBook(query);
    setState(() {
      this.customers = customers;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      title:  Text('Hồ sơ bệnh'.toUpperCase()),
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
           padding: const EdgeInsets.all(10),
           color: Colors.white,
           child: AppButtons.elevatedButton(
             onPressed: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SearchFileBookPage()));
             },
             title: 'Tìm kiếm và cập nhật hồ sơ'.toUpperCase(),
           ),
         ),
      body: Column(
        children: [
          buildSearch(),
          Expanded(
            child: ListView.builder(
                itemCount: customers.length,
                itemBuilder: (context,index){
                  final customer = customers[index];
                  return buildCustomer(customer);
                }
            ),
          ),

        ],
      ),
    );
  }
  Widget buildSearch() => SearchWidget(
    text: query,
    onChanged: searchCustomer,
    hintText: 'Số điện thoại ? ',
  );

  Future searchCustomer(String query) async => debounce(() async {
    final customers = await _customerController.searchFileBook(query);

    setState(() {
      this.query = query;
      this.customers = customers;
    });
  });

  Widget buildCustomer(FileBook fileBook) => ListTile(
      title: InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => DetailFileBookPage(fileBook: fileBook)));
        },
        child: Container(
            decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(
                  color: Colors.blue,
                ),
                borderRadius: BorderRadius.circular(10.0)
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        'Tên khách hàng  :',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Text(
                        fileBook.customer!.name!,
                        style:const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  Row(
                    children: [
                      const Text(
                        'Số điện thoại  :',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Text(
                        fileBook.customer!.phone!,
                        style:const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  Row(
                    children: [
                      const Text(
                        'Tên thú cưng  :',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Text(
                        fileBook.animal!.nameAnimal!,
                        style:const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  Row(
                    children: [
                      const Text(
                        'Bác sĩ khám  :',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Text(
                        fileBook.doctor!.name!,
                        style:const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  Row(
                    children: [
                      const Text(
                        'Ngày giờ khám :',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Text(
                        fileBook.datetime!,
                        style:const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow
                        ),
                      ),
                    ],
                  ),



                ],
              ),
            )
        ),
      )
  );
}
