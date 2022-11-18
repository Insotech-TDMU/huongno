import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huongno/constant/app_colors.dart';
import 'package:huongno/constant/app_font_size.dart';
import 'package:huongno/screen/blocFilebook/filebook_bloc.dart';
import 'package:huongno/screen/blocFilebook/search_filebook_page.dart';
import 'package:huongno/screen/detail_filebook_page.dart';
import 'package:huongno/widgets/app_button.dart';
import 'package:huongno/widgets/app_dialog.dart';
import 'package:huongno/widgets/master_layout.dart';

class FileBookPage extends StatefulWidget {
  const FileBookPage({Key? key}) : super(key: key);

  @override
  State<FileBookPage> createState() => _FileBookPageState();
}

class _FileBookPageState extends State<FileBookPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FileBookBloc()..add(const getAllFileBookEvent()),
      child: MasterLayout(
        title:  Text('Hồ sơ bệnh'.toUpperCase()),
         backgroundColor: Colors.white,
         bottomNavigationBar: Container(
           padding: const EdgeInsets.all(10),
           color: Colors.white,
           child: AppButtons.elevatedButton(
             onPressed: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SearchFileBookPage()));
             },
             title: 'Tìm kiếm hồ sơ'.toUpperCase(),
           ),
         ),
        body: BlocListener<FileBookBloc,FileBookState>(
          listener: (context, state){
            if(state is FileBookLoadingState){
              AppDialog.showLoading(
                  context,
                  content: 'Vui lòng chờ !'
              );

            }
            if(state is FileBookLoadedState){
              BlocProvider.of<FileBookBloc>(context).add(const getAllFileBookEvent());
            }
          },
          child: BlocBuilder<FileBookBloc,FileBookState>(
            builder: (context, state){
              if(state is FileBookLoadedState){
                return ListView.builder(
                    itemCount: state.filebook.length,
                    itemBuilder: (context, index){
                      return InkWell(
                        onTap: () async {
                          Navigator.of(context).push(MaterialPageRoute(builder: (_)=> DetailFileBookPage(fileBook: state.filebook[index]!)));

                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.lightBlue,
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          state.filebook[index].customer!.name!,
                                          style:const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black
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
                                          state.filebook[index].customer!.phone!,
                                          style:const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.yellowAccent
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
                                          state.filebook[index].animal!.nameAnimal!,
                                          style:const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            color: Colors.yellowAccent
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
                                          state.filebook[index].doctor!.name!,
                                          style:const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            color: Colors.yellowAccent
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5,),
                                    Row(
                                      children: [
                                        const Text(
                                          'Ngày giờ khám  :',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white
                                          ),
                                        ),
                                        const SizedBox(width: 10,),
                                        Text(
                                          state.filebook[index].datetime!,
                                          style:const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.yellowAccent
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Phát đồ điều trị :',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white
                                          ),
                                        ),
                                        const SizedBox(width: 10,),
                                        for(var el in state.filebook[index].bill!.billinfo)
                                      Text(
                                          '-   ${el.productname}',
                                          style:const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.yellowAccent
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                          ),
                        ),
                      );
                    }
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
