import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huongno/constant/app_colors.dart';
import 'package:huongno/constant/app_font_size.dart';
import 'package:huongno/screen/blocFilebook/filebook_bloc.dart';
import 'package:huongno/screen/blocFilebook/search_filebook_page.dart';
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
      create: (_) => FileBookBloc()..add(getAllFileBookEvent()),
      child: MasterLayout(
        title:  Text('Hồ sơ bệnh'.toUpperCase()),
         backgroundColor: Colors.white,
         bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Flexible(
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SearchFileBookPage()));
                    // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:  Text('Đang làm chức năng này')));
                  },
                  child: Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.blue
                      ),
                      child:Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Tìm kiếm hồ sơ bệnh'.toUpperCase(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white

                            ),
                          )
                        ],
                      )
                  ),
                ),
              ),
              const SizedBox(width: 5,),
            ],
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
                          // await Navigator.of(context).push(MaterialPageRoute(builder: (_) =>  EditCustomerPage(
                          //   customer: state.customer[index],
                          // ))).whenComplete(() {
                          //   BlocProvider.of<CustomerBloc>(context).add(getAllCustomerEvent());
                          // });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                  border: Border.all(
                                    color: Colors.black,
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
                                          state.filebook[index].id.toString(),
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
