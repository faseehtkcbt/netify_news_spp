import 'package:news_app/core/exception/exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../model/user_model.dart';

abstract interface class AuthDataSource {
  Future<UserModel> registerUser(
      {required String email,
      required String password,
      required String username});
  Future<UserModel> loginUser(
      {required String email, required String password});
}

class AuthDatasouceImpl implements AuthDataSource {
  final SupabaseClient supabaseClient;
  AuthDatasouceImpl(this.supabaseClient);
  @override
  Future<UserModel> loginUser(
      {required String email, required String password}) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        password: password,
        email: email,
      );
      if (response.user == null) {
        throw ServerExceptions("Invalid User");
      }
      return UserModel.fromJson(response.user!.toJson());
    } catch (e) {
      throw ServerExceptions(e.toString());
    }
  }

  @override
  Future<UserModel> registerUser(
      {required String email,
      required String password,
      required String username}) async {
    try {
      final response = await supabaseClient.auth
          .signUp(password: password, email: email, data: {'name': username});
      if (response.user == null) {
        throw ServerExceptions("User is Null");
      }
      return UserModel.fromJson(response.user!.toJson());
    } catch (e) {
      throw ServerExceptions(e.toString());
    }
  }
}
