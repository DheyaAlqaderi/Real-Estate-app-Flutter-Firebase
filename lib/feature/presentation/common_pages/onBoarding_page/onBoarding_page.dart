import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_real_estate_firebase/feature/presentation/client_ui/pages/authentication_pages/both_pages.dart';
import '../../controller/onBoarding/onBoarding_controller.dart';
import '../../../domain/entities/onBoarding/onBoarding_entity.dart';
import '../first_pages/select_user_screen.dart';

class OnBoardingPage extends GetView<OnBoardingController> {

// Initialize the OnBoardingController
  @override
  final controller = Get.put(OnBoardingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, right: 5, left: 5),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      height: 38,
                      width: 90,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.nextPage();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFDFDFDF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: const Text(
                          'تخطي',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            height: 0.15,
                            letterSpacing: 0.36,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: controller.pageController,
                  itemCount: contents.length,
                  onPageChanged: (int index) {
                    controller.updatePageIndicator(index);
                  },
                  itemBuilder: (_, i) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            contents[i].title,
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            contents[i].discription,
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 40),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Image.asset(
                                contents[i].image,
                                fit: BoxFit.fill,
                                height: double.infinity,
                                width: double.infinity,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),

          Positioned(
            top: 255, // Adjust the bottom margin as needed
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                margin: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    contents.length,
                        (index) => buildDot(index, context),
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 20.0, // Adjust the bottom margin as needed
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                height: 60,
                margin: const EdgeInsets.all(40),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (controller.currentPageIndex.value ==
                        contents.length - 1) {

                      // Handle the action when on the last page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SelectUserScreen()),
                      );
                    } else {
                      // Move to the next page
                      controller.nextPage();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFF1F4C6B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Obx(() {
                    return Text(
                      controller.currentPageIndex.value ==
                          contents.length - 1
                          ? "أستمرار"
                          : "التالي",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w700,
                        height: 0,
                        letterSpacing: 0.48,
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 6,
      width: controller.currentPageIndex.value == index ? 12 : 6,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFF252B5C),
      ),
    );
  }
}
