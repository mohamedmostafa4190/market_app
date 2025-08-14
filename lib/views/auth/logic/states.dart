abstract class AppAuthStates {}

final class AuthInitial extends AppAuthStates {}

final class PasswordVisibilityState extends AppAuthStates {}

final class LoginScreenSuccess extends AppAuthStates {}

final class LoginScreenLoading extends AppAuthStates {}

final class LoginScreenError extends AppAuthStates {
  final String error;

  LoginScreenError(this.error);
}

final class RegisterScreenLoading extends AppAuthStates {}

final class RegisterScreenSuccess extends AppAuthStates {}

final class RegisterScreenError extends AppAuthStates {
  final String error;

  RegisterScreenError(this.error);
}

final class LoginWithGoogleLoading extends AppAuthStates {}

final class LoginWithGoogleSuccess extends AppAuthStates {}

final class LoginWithGoogleError extends AppAuthStates {
  final String error;

  LoginWithGoogleError(this.error);
}

final class ResetPasswordLoading extends AppAuthStates {}

final class ResetPasswordSuccess extends AppAuthStates {}

final class ResetPasswordError extends AppAuthStates {
  final String error;

  ResetPasswordError(this.error);
}

final class AddUserDataSuccess extends AppAuthStates {}

final class AddUserDataError extends AppAuthStates {
  final String error;

  AddUserDataError(this.error);
}
final class SignOutSuccess extends AppAuthStates {}

final class SignOutError extends AppAuthStates {
  final String error;

  SignOutError(this.error);
}
