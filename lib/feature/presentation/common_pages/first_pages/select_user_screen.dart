import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../client_ui/pages/authentication_pages/both_pages.dart';

class SelectUserScreen extends StatefulWidget {
  const SelectUserScreen({super.key});

  @override
  State<SelectUserScreen> createState() => _SelectUserScreenState();
}

class _SelectUserScreenState extends State<SelectUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SvgPicture.asset(
              "assets/images/svg_images/welcome_image_client.svg",
              fit: BoxFit.fitWidth,
              height: 175,
              width: double.infinity,
            ),
            const Padding(padding: EdgeInsets.all(10)),
            const Text(
              'مرحبا بكم في تطبيق العقارات الذكي',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F4C6B),
                fontFamily: 'Inter',
              ),
            ),
            const Text(
              'الرجاء إدخال التفاصيل الخاصة بك للتسجيل.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF000000)
              ),
            ),

            Container(
              width: 223,
              height: 210,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/logo_text.jpg"),
                ),
              ),
            ),

            const Padding(padding: EdgeInsets.all(9.5)),


            GestureDetector(
              onTap: (){},
              child: Container(
                margin: const EdgeInsets.all(5.0),
                width: double.infinity,
                height: 58,
                child: ElevatedButton(
                  onPressed: (){
                    final storage = GetStorage();
                    storage.write('IsFirstTime', false);
                    Get.offAll(const BothSigninSignupPage());
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => const BothSigninSignupPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1F4C6B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0), // Corner radius
                    ),
                  ),
                  child: const Text(
                    'انضم كعميل',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ),



            Container(
              margin: const EdgeInsets.all(5.0),
              width: double.infinity,
              height: 58,
              child: ElevatedButton(
                onPressed: (){
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => onBoarding()),
                  // );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFF1F4C6B)),
                    borderRadius: BorderRadius.circular(30.0), // Corner radius
                  ),
                ),
                child: const Text(
                  'انضم كمروج',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
            ),

            const Padding(padding: EdgeInsets.all(9.5)),

          ],
        ),
      ),
    );
  }

}
