class SignUpStates {}

class SignUpInitial extends SignUpStates {}

class SignUpFailure extends SignUpStates {
  final String errorMessage;

  SignUpFailure({required this.errorMessage});
}

class SignUpLoading extends SignUpStates {}

class SignUpSuccess extends SignUpStates {}
