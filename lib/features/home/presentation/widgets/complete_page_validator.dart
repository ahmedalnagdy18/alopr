class CompletePageValidator {
  static String? name(String? val) {
    if (val == null || val.isEmpty) return 'Full Name is required';
    if (val.length < 3) return 'Name must be at least 3 characters';
    return null;
  }

  static String? phone(String? val) {
    if (val == null || val.isEmpty) {
      return 'Phone number is required';
    } else if (val.length < 11) {
      return 'Enter a valid phone number';
    } else {
      return null;
    }
  }

  static String? condation(String? val) {
    if (val == null || val.isEmpty) return 'Condation is required';

    return null;
  }

  static String? specify(String? val) {
    if (val == null || val.isEmpty) {
      return 'Specify is required';
    } else {
      return null;
    }
  }
}
