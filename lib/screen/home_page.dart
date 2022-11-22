import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huongno/main.dart';
import 'package:huongno/screen/detail_checkout_page.dart';
import 'package:huongno/screen/filebook_page.dart';
import 'package:huongno/screen/logout/logout_bloc.dart';
import 'package:huongno/screen/logout/logout_event.dart';
import 'package:huongno/screen/logout/logout_state.dart';
import 'package:huongno/widgets/app_button.dart';
import 'package:huongno/widgets/app_dialog.dart';
import 'package:huongno/widgets/loading_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String? title;
  Widget page = const LoadingPage();

  @override
  Widget build(BuildContext context) {
    BuildContext alertContext = context;

    return Scaffold(
      appBar: AppBar(
        title:  Text('TRang chủ'.toUpperCase()),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'PHÒNG KHÁM THÚ Y HƯƠNG NỞ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white
                ),
              ),
            ),
            ListTile(
              title: const Text(
                '         TẬN TÂM',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.red
                ),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text(
                '         TẬN TỤY',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.red
                ),
              ),
              onTap: () {
              },
            ),
            ListTile(
              title: const Text(
                '         TẬN TÌNH',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.red
                ),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            const SizedBox(height: 50,),
            ListTile(
              title: Container(
                width: 150,
                color: Colors.white,
                padding: const EdgeInsets.all(10),
                child: BlocProvider<LogoutBloc>(
                  create: (_) => LogoutBloc(),
                  child: BlocListener<LogoutBloc, LogOutState>(
                    listener: (context, state) {
                      if (state is LogOutLoadingState) {
                        AppDialog.showLoading(
                          alertContext,
                          content: 'Vui lòng chờ !',
                        );
                      }

                      if (state is LogOutErrorState) {
                        print(state.errorMessage);
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

                      if (state is LogOutSuccess) {
                        Navigator.pop(alertContext);
                        AppDialog.show(
                          alertContext,
                          title: 'Thành công',
                          content: 'Đăng xuất thành công',
                          primaryButtonTitle: 'Đồng ý',
                          onPrimaryTap: () {
                            Navigator.pop(context);
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const MyApp()));
                          },
                        );
                      }
                    },
                    child: BlocBuilder<LogoutBloc, LogOutState>(
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
                                  BlocProvider.of<LogoutBloc>(context).add(
                                      const LogOutLoadedEvent());
                                },
                                title:'Đăng xuất'.toUpperCase(),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 30,),
            Image.asset('assets/images/logo-home.png'),
            const SizedBox(height: 30,),
            Center(
                child:InkWell(
                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const DetailCheckoutPage()));
                  },
                  child:  Container(
                    // height: MediaQuery.of(context).size.height * 1 / 10,
                    // width: MediaQuery.of(context).size.width * 3 / 5,
                    height: 150,
                    width: 300,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.blue,
                            Colors.deepOrange,
                          ]),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(""),
                        const Text(
                          "Bảng giá dịch vụ",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: const Icon(
                              Icons.arrow_right_alt_outlined,
                              size: 25.0,
                              color: Colors.green,
                            ))
                      ],
                    ),
                  ),
                )
            ),
            const SizedBox(height: 50,),
            Center(
                child:InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const FileBookPage()));
                  },
                  child:  Container(
                    height: 150,
                    width: 300,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.blue,
                            Colors.deepOrange,
                          ]),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(""),
                        const Text(
                          "Hồ sơ bệnh",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: const Icon(
                              Icons.arrow_right_alt_outlined,
                              size: 25.0,
                              color: Colors.green,
                            ))
                      ],
                    ),
                  ),
                )
            ),

          ],
        ),
      )
    );
  }
}
