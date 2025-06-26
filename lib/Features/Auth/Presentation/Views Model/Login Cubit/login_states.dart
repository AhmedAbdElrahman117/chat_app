class LoginStates {}

class LoginInitial extends LoginStates {}

class LoginLoading extends LoginStates {}

class LoginFailure extends LoginStates {
  final String errorMessage;

  LoginFailure({required this.errorMessage});
}

class LoginSuccess extends LoginStates {}

class LoginPending extends LoginStates {}
