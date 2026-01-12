import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todays_movie/features/screens/payment_method.dart';

import 'package:todays_movie/firebase_options.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todays_movie/services/jason_movies.dart';
import 'package:todays_movie/util/themes/themesData.dart';

import 'features/controllers/auth_controller.dart';
import 'features/controllers/downloading_controller.dart';
import 'features/controllers/user_controller.dart';
import 'features/screens/homePages.dart';
import 'features/screens/home_pages/homeMainPage.dart';
import 'features/screens/home_pages/settings/saved_and_bookmarks.dart';
import 'features/screens/home_pages/settings/manage_profile.dart';
import 'features/screens/mainWelcome.dart';
import 'features/screens/movie.dart';
import 'features/screens/payment.dart';
import 'features/screens/play_movie.dart';
import 'features/screens/search.dart';
import 'features/screens/sign_in.dart';
import 'features/screens/sign_up.dart';
import 'features/screens/subscription.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  Get.put(AuthController());
  Get.put(UserController());
  Get.put(DownloadingController());
  JasonService.getJasonFiles();
  runApp(const MyApp());

  await Supabase.initialize(
    url: "https://yintwvfoovprywajvtrw.supabase.co",
    anonKey: "sb_publishable_wKpsoD5iuIL7oRI06-T4Bg_XueHdcu_",
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(

      theme: MAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: Welcome(),
      getPages: [
        GetPage(name: "/signIn", page: () => SignIn(),),
        GetPage(name: "/signUp", page: () => SignUp(),),
        GetPage(name: "/home", page: () => Home(),),
        GetPage(name: "/subscription", page: () => Subscription(),),
        GetPage(name: "/payment", page: () => Payment(),),
        GetPage(name: "/paymentMethod", page: () => PaymentMethod(),),
        GetPage(name: "/search", page: () => Search(),),
        GetPage(name: "/savedAndBookmarks", page: () => SavedAndBookmarks(pageName: Get.arguments,),),
        GetPage(name: "/movie", page: () => MoviePage(name:Get.arguments),),
        GetPage(name: "/homePages", page: () => HomePages(),),
        GetPage(name: "/playMovie", page: () => MoviePlayerScreen(videoUrl:Get.arguments[0],movieName:Get.arguments[1] ,),),
        GetPage(name: "/manageProfile", page: () => ManageProfile(),),
      ],
    );
  }
}

// dynamic width=MediaQuery.of(context).size.width;
// dynamic height=MediaQuery.of(context).size.height;
// print('height'+height.toString());
// print('width'+width.toString());
