import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vba_crypto_signal/core/bloc/login_bloc.dart';
import 'package:vba_crypto_signal/core/constants/assets.dart';
import 'package:vba_crypto_signal/core/router/router.dart';
import 'package:vba_crypto_signal/core/services/navigation_service.dart';
import 'package:vba_crypto_signal/core/utils/colors.dart';
import 'package:vba_crypto_signal/core/utils/locator.dart';
import 'package:vba_crypto_signal/views/authentication/login/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  void _precacheImages(BuildContext context) {
    precacheImage(
      const AssetImage(PngAssets.background),
      context,
    );
    precacheImage(
      const AssetImage(PngAssets.maleProfilePic),
      context,
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    _precacheImages(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return LoginBloc();
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'VBA Crypto Signal',
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
          primarySwatch: AppColors.gold,
        ),
        navigatorKey: NavigationService.instance.navigatorKey,
        onGenerateRoute: AppRouter.generateRoute,
        home: const LoginView(),
      ),
    );
  }
}
