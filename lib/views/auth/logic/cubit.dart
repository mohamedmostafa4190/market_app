import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:market_app/core/constant.dart';
import 'package:market_app/views/auth/logic/states.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppAuthCubit extends Cubit<AppAuthStates> {
  AppAuthCubit() : super(AuthInitial());

  static AppAuthCubit get(context) => BlocProvider.of<AppAuthCubit>(context);
  bool isPasswordVisible = true;

  void passwordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(PasswordVisibilityState());
  }

  Future<void> login({required String email, required String password}) async {
    try {
      emit(LoginScreenLoading());
      await supabaseClient.auth.signInWithPassword(
        password: password,
        email: email,
      );
      emit(LoginScreenSuccess());
    } on AuthException catch (e) {
      log(e.toString());
      emit(LoginScreenError(e.toString()));
    } catch (e) {
      log(e.toString());
      emit(LoginScreenError(e.toString()));
    }
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(RegisterScreenLoading());
    try {
      await supabaseClient.auth.signUp(email: email, password: password);
      await addUserData(email: email, name: name);
      log('User registered successfully: $name, $email');
      emit(RegisterScreenSuccess());
    } catch (e) {
      emit(RegisterScreenError(e.toString()));
      log(e.toString());
    }
  }

  GoogleSignInAccount? googleUser;

  Future<AuthResponse> googleSignIn() async {
    emit(LoginWithGoogleLoading());
    final GoogleSignIn googleSignIn = GoogleSignIn(serverClientId: webClientId);
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      return AuthResponse();
    }
    final googleAuth = await googleUser.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null || idToken == null) {
      emit(LoginWithGoogleError('Access token or ID token is null'));
      log('Access token or ID token is null');
      return AuthResponse();
    }

    var response = await supabaseClient.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
    await addUserData(email: googleUser.email, name: googleUser.displayName!);
    emit(LoginWithGoogleSuccess());
    return response;
  }

  Future<void> resetPassword(String email) async {
    emit(ResetPasswordLoading());
    try {
      await supabaseClient.auth.resetPasswordForEmail(email);
      emit(ResetPasswordSuccess());
      log('Password reset email sent to $email');
    } catch (e) {
      emit(ResetPasswordError(e.toString()));
      log('Error sending password reset email: $e');
    }
  }

  Future<void> addUserData({
    required String email,
    required String name,
  }) async {
    try {
      await supabaseClient.from('users').upsert({
        "id": supabaseClient.auth.currentUser!.id,
        "email": email,
        "name": name,
      });
      emit(AddUserDataSuccess());
    } catch (e) {
      emit(AddUserDataError(e.toString()));
    }
  }

  Future<void> signOut() async {
    try {
      await supabaseClient.auth.signOut();
      if (supabaseClient.auth.currentUser == null) {
        log('User signed out successfully');
        emit(SignOutSuccess());
      }
    } catch (e) {
      log('Error signing out: $e');
      emit(SignOutError(e.toString()));
    }
  }
}
