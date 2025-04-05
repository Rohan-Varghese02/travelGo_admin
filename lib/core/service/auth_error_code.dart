String getErrorMessage(String errorCode) {
  switch (errorCode) {
    case 'invalid-credential':
      return 'Email and Password are incorrect.';
    case 'not-admin':
      return 'Access denied. You are not an admin.';
    default:
      return 'Email and Password are incorrect';
  }
}
