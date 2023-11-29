class LogInWithEmailAndPasswordFailure {
  final String message;
  const LogInWithEmailAndPasswordFailure(
      [this.message = "An uknown errorr occurred"]);

  factory LogInWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const LogInWithEmailAndPasswordFailure(
            'Please enter a stronger password.');
      case 'invalid-email':
        return const LogInWithEmailAndPasswordFailure(
            'Email is not valid or badly formatted. ');

      case 'email-already-in-case':
        return const LogInWithEmailAndPasswordFailure(
            'Please enter a stronger password.');
      case 'operation-not-allowed':
        return const LogInWithEmailAndPasswordFailure(
            'Email is not valid or badly formatted. ');
      case 'user-disabled':
        return const LogInWithEmailAndPasswordFailure(
            'Email is not valid or badly formatted. ');

      default:
        return const LogInWithEmailAndPasswordFailure();
    }
  }
}

class SignUpWithEmailAndPasswordfailure {
  final String message;
  const SignUpWithEmailAndPasswordfailure(
      [this.message = "An uknown errorr occurred"]);

  factory SignUpWithEmailAndPasswordfailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignUpWithEmailAndPasswordfailure(
            'Please enter a stronger password.');
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordfailure(
            'Email is not valid or badly formatted. ');

      case 'email-already-in-case':
        return const SignUpWithEmailAndPasswordfailure(
            'Please enter a stronger password.');
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordfailure(
            'Email is not valid or badly formatted. ');
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordfailure(
            'Email is not valid or badly formatted. ');

      default:
        return const SignUpWithEmailAndPasswordfailure();
    }
  }
}
