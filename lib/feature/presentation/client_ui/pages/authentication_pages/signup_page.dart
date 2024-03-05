import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


final _formKey = GlobalKey<FormState>();


class SignupPage extends StatefulWidget {
  const SignupPage({
    super.key,
  });

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  // final UserAuthCase _authUseCase = UserAuthCase();

  String? validateEmail(String? email) {
    // Regular expression for email validation
    final RegExp emailRegex =
    RegExp(r"^[a-zA-Z0-9.!#$%&\'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$");

    if (email!.isEmpty) {
      return 'Please enter an email address.';
    } else if (!emailRegex.hasMatch(email)) {
      return 'Please enter a valid email address.';
    }

    return null; // Return empty string if email is valid
  }
  String? validateYemeniPhoneNumber(String? phoneNumber) {
    // Regular expression for Yemeni phone number validation
    final RegExp phoneRegex = RegExp(r'^009677[3,7,8,1,0]{1}[0-9]{7}$');

    if (phoneNumber!.isEmpty) {
      return 'Please enter a phone number.';
    } else if (!phoneRegex.hasMatch(phoneNumber)) {
      return 'Please enter a valid Yemeni phone number';
    }

    return null; // Return empty string if phone number is valid
  }

  @override
  void initState() {
    super.initState();
    // _authUseCase.setOnLoadingStateChanged(() {
    //   setState(() {
    //     // Refresh the UI when the loading state changes
    //   });
    // });
  }


  bool isConditionAccepted = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'name', // Arabic: 'Name'
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    validator: (name) => (name!.isEmpty)?'please enter your name':null,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        labelText: 'phone', // Arabic: 'Phone Number'
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        prefixText: '+967'
                    ),
                    validator: (value) {
                      final formattedPhoneNumber = "00967$value"; // Remove '+967' before validation
                      return validateYemeniPhoneNumber(formattedPhoneNumber);
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'email', // Arabic: 'Email'
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    validator: validateEmail,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'password', // Arabic: 'Password'
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    validator: (password) => (password!.isEmpty)?'please enter a password':null,
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'أوافق على جميع الشروط',
                        style: TextStyle(
                          color: Color(0xFF939CA4),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0.12,
                          letterSpacing: -0.24,
                        ),
                      ),
                      Checkbox(
                        value: isConditionAccepted,
                        onChanged: (value) {
                          setState(() {
                            isConditionAccepted = value!;
                          });
                        },
                      ),

                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    width: double.infinity,
                    height: 58,
                    child: ElevatedButton(
                      onPressed: (){
                        if(_formKey.currentState!.validate()){
                          // _authUseCase.createAccount(
                          //   context,
                          //   nameController.text.trim(),
                          //   phoneController.text.trim(),
                          //   emailController.text.trim(),
                          //   passwordController.text.trim(),
                          // );
                        }


                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1F4C6B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0), // Corner radius
                        ),
                      ),
                      child:const Text(
                        'أنشاء حساب',
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
                  const SizedBox(height: 30.0),
                  const Text(
                    'او',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 0.09,
                      letterSpacing: -0.24,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 158.50,
                          height: 70,
                          padding: const EdgeInsets.only(top: 22, bottom: 23),
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF5F4F7),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      width: 25,
                                      height: 25,
                                      child:
                                      SvgPicture.asset("assets/images/svg_images/google-icon.svg")

                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 158.50,
                          height: 70,
                          padding: const EdgeInsets.only(top: 22, bottom: 23),
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF5F4F7),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      width: 25,
                                      height: 25,
                                      child:
                                      SvgPicture.asset(
                                        "assets/images/svg_images/facebook-icon.svg",
                                        height: 25,
                                        width: 25,
                                      )
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}