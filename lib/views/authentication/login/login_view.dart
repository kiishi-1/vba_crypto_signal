import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vba_crypto_signal/core/bloc/login_bloc.dart';
import 'package:vba_crypto_signal/core/constants/assets.dart';
import 'package:vba_crypto_signal/core/constants/routing_constants.dart';
import 'package:vba_crypto_signal/core/services/navigation_service.dart';
import 'package:vba_crypto_signal/core/utils/colors.dart';
import 'package:vba_crypto_signal/core/utils/text.dart';
import 'package:vba_crypto_signal/core/utils/validators.dart';
import 'package:vba_crypto_signal/widgets/app_button.dart';
import 'package:vba_crypto_signal/widgets/app_flush_bar.dart';
import 'package:vba_crypto_signal/widgets/app_text_field.dart';
import 'package:vba_crypto_signal/widgets/gap.dart';
import 'package:vba_crypto_signal/widgets/loader_page.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginFailed) {
            AppFlushBar.showFailure(
              failure: state.error,
            );
          } else if (state is LoginSuccessful) {
            NavigationService.instance.navigateToReplace(NavigatorRoutes.home);
            AppFlushBar.showSuccess(
              title: state.title,
              message: state.message,
            );
          }
        },
        builder: (context, state) {
          return LoaderPage(
            busy: state is RequestingLogin,
            child: Form(
              key: loginForm,
              child: Column(
                children: [
                  Gap.s20,
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 15,
                        ),
                        AppText.mont1(
                          "Log In",
                          color: Colors.white,
                        ),
                        const SizedBox()
                      ],
                    ),
                  ),
                  Expanded(
                      child: ListView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    children: [
                      Gap.s16,
                      Container(
                        padding: const EdgeInsets.all(20),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: AppColors.scaffoldBackgroundSecondary,
                        ),
                        child: Column(
                          children: [
                            AppTextField(
                              controller: emailController,
                              title: "Email Address",
                              hint: "you@example.com",
                              validator: Validator.email,
                            ),
                            Gap.s24,
                            AppTextField(
                              controller: passwordController,
                              title: "Password",
                              hint: "Not less than 8 characters",
                              isPassword: true,
                              validator: Validator.password,
                            ),
                            Gap.s32,
                            AppButton(
                              text: "Log In",
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                if (loginForm.currentState!.validate()) {
                                  BlocProvider.of<LoginBloc>(context).add(
                                    LoginUserEvent(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    ),
                                  );
                                }
                              },
                            )
                          ],
                        ),
                      ),
                      Gap.s24,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width / 4,
                            color: AppColors.scaffoldBackgroundSecondary,
                          ),
                          Gap.s20,
                          AppText.mont2(
                            "OR",
                            fontSize: 16,
                            color: AppColors.grey,
                          ),
                          Gap.s20,
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.width / 4,
                            color: AppColors.scaffoldBackgroundSecondary,
                          ),
                        ],
                      ),
                      Gap.s8,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            SvgAssets.google,
                            width: 32,
                            height: 32,
                          ),
                          Gap.s32,
                          SvgPicture.asset(
                            SvgAssets.apple,
                            width: 32,
                            height: 32,
                          ),
                        ],
                      ),
                      Gap.s12,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText.nunito2(
                            "Don’t have an account?  ",
                            color: AppColors.grey,
                          ),
                          AppText.nunito1(
                            "Sign up",
                            color: AppColors.gold,
                          )
                        ],
                      )
                    ],
                  ))
                ],
              ),
            ),
          );
        },
      )),
    );
  }
}
