import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class FieldControl {
  final controller = TextEditingController();
  final focus = FocusNode();

  void dispose() {
    controller.dispose();
    focus.dispose();
  }
}

// validations
class Validators {
  static String? fullName(String? val) {
    if (val == null || val.isEmpty) return 'Full Name is required';
    if (val.length < 3) return 'Name must be at least 3 characters';
    return null;
  }

  static String? email(String? val) {
    if (val == null || val.isEmpty) return 'Email is required';
    if (!EmailValidator.validate(val)) {
      return 'Please enter a valid email address';
    }
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

  static String? password(String? val) {
    if (val == null || val.isEmpty) {
      return 'Password is required';
    } else if (val.length < 8) {
      return 'Password must be at least 8 characters';
    } else {
      return null;
    }
  }

  static String? confirmPassword(String? val, String password) {
    if (val == null || val.isEmpty) {
      return 'Confirm Password is required';
    } else if (val != password) {
      return 'Passwords do not match';
    }
    return null;
  }
}
