import 'package:firebase_auth/firebase_auth.dart';

abstract interface class ProfileRepository {
  User get currentUserData;


}