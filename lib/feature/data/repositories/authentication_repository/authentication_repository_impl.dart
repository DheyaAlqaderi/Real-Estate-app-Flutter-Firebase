


import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_real_estate_firebase/feature/domain/entities/user/user_entity.dart';
import 'package:smart_real_estate_firebase/feature/domain/repositories/authentication_repository/authentication_repository.dart';
import 'package:smart_real_estate_firebase/feature/presentation/client_ui/pages/authentication_pages/both_pages.dart';
import 'package:smart_real_estate_firebase/feature/presentation/common_pages/first_pages/splash_screen.dart';

class AuthenticationRepositoryImpl
    extends GetxController
    implements AuthenticationRepository{
  static AuthenticationRepositoryImpl get instance => Get.find();


  /// Variables
  final deviceStorage = GetStorage();

  /// Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// function to show Relevant Screen
  screenRedirect() async{
    // local storage
    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => const BothSigninSignupPage())
        : Get.offAll(const SplashScreen());
  }



  /* --- functions for auth --- */
  @override
  Future<void> getCreateCurrentUser(UserEntity user) {
    // TODO: implement getCreateCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<String> getCurrentUId() {
    // TODO: implement getCurrentUId
    throw UnimplementedError();
  }

  @override
  Future<bool> isSignIn() {
    // TODO: implement isSignIn
    throw UnimplementedError();
  }

  @override
  Future<void> signIn(UserEntity user) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<void> signUp(UserEntity user) {
    // TODO: implement signUp
    throw UnimplementedError();
  }


}