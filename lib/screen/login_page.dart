import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:huongno/constant/app_colors.dart';
import 'package:huongno/constant/app_font_size.dart';
import 'package:huongno/constant/app_secure_storage.dart';
import 'package:huongno/screen/bloc/authentication_bloc.dart';
import 'package:huongno/screen/home_page.dart';
import 'package:huongno/widgets/app_button.dart';
import 'package:huongno/widgets/app_dialog.dart';
import 'package:huongno/widgets/label_text_field.dart';
import 'package:huongno/widgets/loading_page.dart';
import 'package:huongno/widgets/master_layout.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  bool _showPassword = true;
  final _formKey = GlobalKey<FormState>();




  @override
  Widget build(BuildContext context) {
    BuildContext alertContext = context;
    return MasterLayout(
      title:  Text('Đăng nhập'.toUpperCase()),
      backgroundColor: Colors.white,
      bottomNavigationBar:  Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10),
        child: BlocProvider<AuthenticationBloc>(
          create: (_) => AuthenticationBloc(),
          child: BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              if (state is AuthenticationLoading) {
                AppDialog.showLoading(
                  alertContext,
                  content: 'Vui lòng chờ !',
                );
              }

              if (state is AuthenticationError) {
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

              if (state is AuthenticationSuccess) {
                Navigator.pop(alertContext);
                AppDialog.show(
                  alertContext,
                  title: 'Thành công',
                  content: 'Đăng nhập thành công',
                  primaryButtonTitle: 'Đồng ý',
                  onPrimaryTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> const HomePage()));
                  },
                );
              }
            },
            child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
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
                          if (_formKey.currentState!.validate()) {
                            BlocProvider.of<AuthenticationBloc>(context).add(
                              GetLoginAccountEvent(
                                _usernameController.text,
                                _passwordController.text,
                              ),
                            );
                          } else {
                            AppDialog.show(
                              context,
                              title: 'Thất bại',
                              content: 'Đã có lỗi xảy ra vui lòng kiểm tra lại !',
                              primaryButtonTitle: 'Đồng ý',
                              onPrimaryTap: () {
                                Navigator.pop(context);
                              },
                            );
                          }
                        },
                        title:'Đăng nhập'.toUpperCase(),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  height: 200,
                  child: Image.asset('assets/images/logo-home.png'),
                ),

                LabelTextField(
                  controller: _usernameController,
                  title: 'Tên đăng nhập',
                ),
                LabelTextField(
                  controller: _passwordController,
                  title: 'Mật khẩu',
                  maxCharacter: 100,
                  maxLine: 1,
                  obscureText: _showPassword,
                  suffix: SizedBox(
                    height: 20,
                    width: 20,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                      icon: Icon(
                        _showPassword ? Icons.visibility : Icons.visibility_off,
                        color: _showPassword == false ? AppColor.primary : Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                Image.asset('assets/images/thuy.jpg')
              ],
            ),
          )
        ),
      ),
    );
  }
}
