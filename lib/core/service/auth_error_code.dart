String getErrorMessage(String errorCode) {
  switch (errorCode) {
    case 'invalid-credential':
      return 'The email address is not valid.';
    case 'user-not-found':
      return 'No user found with this email.';
    case 'wrong-password':
      return 'Incorrect password.';
    case 'user-disabled':
      return 'This user has been disabled.';
    case 'not-admin':
      return 'Access denied. You are not an admin.';
    default:
      return 'Email and Password are incorrect';
  }
}
