import 'package:alopr/generated/l10n.dart';
import 'package:flutter/material.dart';

class CompletePageValidator {
  static String? name(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return S.of(context).fullNameRequired;
    }
    if (val.length < 3) {
      return S.of(context).nameMinLength;
    }
    return null;
  }

  static String? phone(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return S.of(context).phoneRequired;
    } else if (val.length < 11) {
      return S.of(context).phoneInvalid;
    } else {
      return null;
    }
  }

  static String? condition(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return S.of(context).conditionRequired;
    }
    return null;
  }

  static String? specify(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return S.of(context).specifyRequired;
    }
    return null;
  }
}
