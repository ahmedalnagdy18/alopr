// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Get Started with ALOPR`
  String get getStartedwithALOPR {
    return Intl.message(
      'Get Started with ALOPR',
      name: 'getStartedwithALOPR',
      desc: '',
      args: [],
    );
  }

  /// `Create your account`
  String get createyouraccount {
    return Intl.message(
      'Create your account',
      name: 'createyouraccount',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your full name`
  String get enteryourfullname {
    return Intl.message(
      'Enter your full name',
      name: 'enteryourfullname',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address`
  String get pleaseEnterValidEmail {
    return Intl.message(
      'Please enter a valid email address',
      name: 'pleaseEnterValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number`
  String get enterYourPhoneNumber {
    return Intl.message(
      'Enter your phone number',
      name: 'enterYourPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enterYourPassword {
    return Intl.message(
      'Enter your password',
      name: 'enterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Re-enter your password`
  String get reenteryourpassword {
    return Intl.message(
      'Re-enter your password',
      name: 'reenteryourpassword',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `I already have an account,`
  String get iAlreadyHaveAccount {
    return Intl.message(
      'I already have an account,',
      name: 'iAlreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Verify Your Email`
  String get verifyYourEmail {
    return Intl.message(
      'Verify Your Email',
      name: 'verifyYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `We’ve sent a 4-digit code to your email. Please enter it below to verify your account.`
  String get otpMessage {
    return Intl.message(
      'We’ve sent a 4-digit code to your email. Please enter it below to verify your account.',
      name: 'otpMessage',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message(
      'Verify',
      name: 'verify',
      desc: '',
      args: [],
    );
  }

  /// `Didn't receive the code?`
  String get didReceiveCode {
    return Intl.message(
      'Didn\'t receive the code?',
      name: 'didReceiveCode',
      desc: '',
      args: [],
    );
  }

  /// `Click Resend`
  String get clickResend {
    return Intl.message(
      'Click Resend',
      name: 'clickResend',
      desc: '',
      args: [],
    );
  }

  /// `Resend in,`
  String get resendIn {
    return Intl.message(
      'Resend in,',
      name: 'resendIn',
      desc: '',
      args: [],
    );
  }

  /// `Verification Successful!`
  String get verificationSuccessful {
    return Intl.message(
      'Verification Successful!',
      name: 'verificationSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Your email has been verified. Welcome to ALOPR!`
  String get verifiedMessage {
    return Intl.message(
      'Your email has been verified. Welcome to ALOPR!',
      name: 'verifiedMessage',
      desc: '',
      args: [],
    );
  }

  /// `Continue to Home`
  String get continueToHome {
    return Intl.message(
      'Continue to Home',
      name: 'continueToHome',
      desc: '',
      args: [],
    );
  }

  /// `Follower`
  String get follower {
    return Intl.message(
      'Follower',
      name: 'follower',
      desc: '',
      args: [],
    );
  }

  /// `Patient`
  String get patient {
    return Intl.message(
      'Patient',
      name: 'patient',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back!`
  String get welcomeBack {
    return Intl.message(
      'Welcome Back!',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Log in to ALOPR`
  String get logInToALOPR {
    return Intl.message(
      'Log in to ALOPR',
      name: 'logInToALOPR',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don’t have an account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Complete Your Profile`
  String get completeYourProfile {
    return Intl.message(
      'Complete Your Profile',
      name: 'completeYourProfile',
      desc: '',
      args: [],
    );
  }

  /// `Please provide the following details to personalise your ALOPR experience.`
  String get completeProfileSubTitle {
    return Intl.message(
      'Please provide the following details to personalise your ALOPR experience.',
      name: 'completeProfileSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Caregiver Name`
  String get caregiverName {
    return Intl.message(
      'Caregiver Name',
      name: 'caregiverName',
      desc: '',
      args: [],
    );
  }

  /// `Name of the person taking care of the patient`
  String get caregiverField {
    return Intl.message(
      'Name of the person taking care of the patient',
      name: 'caregiverField',
      desc: '',
      args: [],
    );
  }

  /// `Caregiver Phone Number`
  String get caregiverPhoneNumber {
    return Intl.message(
      'Caregiver Phone Number',
      name: 'caregiverPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Condition`
  String get condition {
    return Intl.message(
      'Condition',
      name: 'condition',
      desc: '',
      args: [],
    );
  }

  /// `e.g., Mild memory loss, Moderate Alzheimer’s, Advanced Alzheimer’s`
  String get conditionField {
    return Intl.message(
      'e.g., Mild memory loss, Moderate Alzheimer’s, Advanced Alzheimer’s',
      name: 'conditionField',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Do you have chronic diseases ?`
  String get doYouHaveChronicDiseases {
    return Intl.message(
      'Do you have chronic diseases ?',
      name: 'doYouHaveChronicDiseases',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `specify`
  String get specify {
    return Intl.message(
      'specify',
      name: 'specify',
      desc: '',
      args: [],
    );
  }

  /// `Are you pregnant ?`
  String get areYouPregnant {
    return Intl.message(
      'Are you pregnant ?',
      name: 'areYouPregnant',
      desc: '',
      args: [],
    );
  }

  /// `Finish`
  String get finish {
    return Intl.message(
      'Finish',
      name: 'finish',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to ALOPR Follower Dashboard`
  String get welcomeToAloprFollowerDashboard {
    return Intl.message(
      'Welcome to ALOPR Follower Dashboard',
      name: 'welcomeToAloprFollowerDashboard',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to ALOPR`
  String get welcomeToALOPR {
    return Intl.message(
      'Welcome to ALOPR',
      name: 'welcomeToALOPR',
      desc: '',
      args: [],
    );
  }

  /// `Upload Test`
  String get uploadTest {
    return Intl.message(
      'Upload Test',
      name: 'uploadTest',
      desc: '',
      args: [],
    );
  }

  /// `Upload your latest medical test results for review`
  String get upload1Subtitle {
    return Intl.message(
      'Upload your latest medical test results for review',
      name: 'upload1Subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Upload MRI`
  String get uploadMRI {
    return Intl.message(
      'Upload MRI',
      name: 'uploadMRI',
      desc: '',
      args: [],
    );
  }

  /// `Share your brain MRI for analysis`
  String get upload2Subtitle {
    return Intl.message(
      'Share your brain MRI for analysis',
      name: 'upload2Subtitle',
      desc: '',
      args: [],
    );
  }

  /// `ALOPR Cognitive Test`
  String get aloprCognitiveTest {
    return Intl.message(
      'ALOPR Cognitive Test',
      name: 'aloprCognitiveTest',
      desc: '',
      args: [],
    );
  }

  /// `Try our in-app cognitive test to check your memory and focus`
  String get upload3Subtitle {
    return Intl.message(
      'Try our in-app cognitive test to check your memory and focus',
      name: 'upload3Subtitle',
      desc: '',
      args: [],
    );
  }

  /// `You have no patients yet. Once a patient connects with you, they will appear here`
  String get emptyDocWidgetTitle {
    return Intl.message(
      'You have no patients yet. Once a patient connects with you, they will appear here',
      name: 'emptyDocWidgetTitle',
      desc: '',
      args: [],
    );
  }

  /// `Upload File`
  String get uploadFile {
    return Intl.message(
      'Upload File',
      name: 'uploadFile',
      desc: '',
      args: [],
    );
  }

  /// `Upload Your Test`
  String get uploadYourTest {
    return Intl.message(
      'Upload Your Test',
      name: 'uploadYourTest',
      desc: '',
      args: [],
    );
  }

  /// `Upload Scan`
  String get uploadScan {
    return Intl.message(
      'Upload Scan',
      name: 'uploadScan',
      desc: '',
      args: [],
    );
  }

  /// `Upload Your MRI`
  String get uploadYourMRI {
    return Intl.message(
      'Upload Your MRI',
      name: 'uploadYourMRI',
      desc: '',
      args: [],
    );
  }

  /// `Please upload your latest medical test results in PDF or image format`
  String get uploadPageSubtitle1 {
    return Intl.message(
      'Please upload your latest medical test results in PDF or image format',
      name: 'uploadPageSubtitle1',
      desc: '',
      args: [],
    );
  }

  /// `Please upload your brain MRI image for analysis`
  String get uploadPageSubtitle2 {
    return Intl.message(
      'Please upload your brain MRI image for analysis',
      name: 'uploadPageSubtitle2',
      desc: '',
      args: [],
    );
  }

  /// `Take our quick memory and focus test to evaluate your cognitive skills`
  String get uploadPageSubtitle3 {
    return Intl.message(
      'Take our quick memory and focus test to evaluate your cognitive skills',
      name: 'uploadPageSubtitle3',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Accessibility`
  String get accessibility {
    return Intl.message(
      'Accessibility',
      name: 'accessibility',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message(
      'Dark Mode',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get deleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logOut {
    return Intl.message(
      'Log Out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get termsAndConditions {
    return Intl.message(
      'Terms and Conditions',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `From Alzheimer’s Prediction`
  String get fromAlzheimersPrediction {
    return Intl.message(
      'From Alzheimer’s Prediction',
      name: 'fromAlzheimersPrediction',
      desc: '',
      args: [],
    );
  }

  /// `Full Name is required`
  String get fullNameRequired {
    return Intl.message(
      'Full Name is required',
      name: 'fullNameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Name must be at least 3 characters`
  String get nameTooShort {
    return Intl.message(
      'Name must be at least 3 characters',
      name: 'nameTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Email is required`
  String get emailRequired {
    return Intl.message(
      'Email is required',
      name: 'emailRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address`
  String get invalidEmail {
    return Intl.message(
      'Please enter a valid email address',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Phone number is required`
  String get phoneRequired {
    return Intl.message(
      'Phone number is required',
      name: 'phoneRequired',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid phone number`
  String get invalidPhone {
    return Intl.message(
      'Enter a valid phone number',
      name: 'invalidPhone',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get passwordRequired {
    return Intl.message(
      'Password is required',
      name: 'passwordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters`
  String get passwordTooShort {
    return Intl.message(
      'Password must be at least 8 characters',
      name: 'passwordTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password is required`
  String get confirmPasswordRequired {
    return Intl.message(
      'Confirm Password is required',
      name: 'confirmPasswordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Name must be at least 3 characters`
  String get nameMinLength {
    return Intl.message(
      'Name must be at least 3 characters',
      name: 'nameMinLength',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid phone number`
  String get phoneInvalid {
    return Intl.message(
      'Enter a valid phone number',
      name: 'phoneInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Condition is required`
  String get conditionRequired {
    return Intl.message(
      'Condition is required',
      name: 'conditionRequired',
      desc: '',
      args: [],
    );
  }

  /// `Specify is required`
  String get specifyRequired {
    return Intl.message(
      'Specify is required',
      name: 'specifyRequired',
      desc: '',
      args: [],
    );
  }

  /// `تم تغيير اللغة بنجاح`
  String get langSnakBar {
    return Intl.message(
      'تم تغيير اللغة بنجاح',
      name: 'langSnakBar',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message(
      'Loading...',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Patient Details`
  String get patientDetails {
    return Intl.message(
      'Patient Details',
      name: 'patientDetails',
      desc: '',
      args: [],
    );
  }

  /// `Basic information provided by the patient.`
  String get patientDetailsSubTitle {
    return Intl.message(
      'Basic information provided by the patient.',
      name: 'patientDetailsSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Change image`
  String get uploadNewone {
    return Intl.message(
      'Change image',
      name: 'uploadNewone',
      desc: '',
      args: [],
    );
  }

  /// `Please complete your profile`
  String get pleaseCompleteYourProfile {
    return Intl.message(
      'Please complete your profile',
      name: 'pleaseCompleteYourProfile',
      desc: '',
      args: [],
    );
  }

  /// `Image uploaded successfully`
  String get imageUploadedSuccessfully {
    return Intl.message(
      'Image uploaded successfully',
      name: 'imageUploadedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Complete your profile first`
  String get completeYourProfileFirst {
    return Intl.message(
      'Complete your profile first',
      name: 'completeYourProfileFirst',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logoutTitle {
    return Intl.message(
      'Logout',
      name: 'logoutTitle',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to log out?`
  String get logoutMessage {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'logoutMessage',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get deleteAccountTitle {
    return Intl.message(
      'Delete Account',
      name: 'deleteAccountTitle',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete your account? This action cannot be undone.`
  String get deleteAccountMessage {
    return Intl.message(
      'Are you sure you want to delete your account? This action cannot be undone.',
      name: 'deleteAccountMessage',
      desc: '',
      args: [],
    );
  }

  /// `The patient hasn’t completed their profile yet`
  String get patientNotCompletProfile {
    return Intl.message(
      'The patient hasn’t completed their profile yet',
      name: 'patientNotCompletProfile',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
