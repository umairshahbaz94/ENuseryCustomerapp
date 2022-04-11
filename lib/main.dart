import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Category/AddCategory.dart';
import 'package:shop_app/Custom/CuatomScreen.dart';
import 'package:shop_app/ProductManage/AddProduct.dart';
import 'package:shop_app/Provider/CartProvider.dart';
import 'package:shop_app/routes.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'package:shop_app/selectplant.dart';
import 'package:shop_app/services/AddServices.dart';
import 'package:shop_app/theme.dart';

import 'package:shop_app/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'Provider/Productprovider.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
        ChangeNotifierProvider(create: (_) => Productprovider()),
        ChangeNotifierProvider(create: (_) => CartProvider())
      ],
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme(),
        builder: EasyLoading.init(),
        // home: SplashScreen(),
        // We use routeName so that
        // we dont need to remember the name
        initialRoute: SplashScreen.routeName,
        routes: routes,
        // home: Selectplant(),
      ),
    );
  }
}
