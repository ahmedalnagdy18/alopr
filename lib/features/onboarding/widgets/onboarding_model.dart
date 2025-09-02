class OnboardingModel {
  final String image;
  final String mainTitle;
  final String title;
  final String subTitle;

  OnboardingModel({
    required this.image,
    required this.mainTitle,
    required this.title,
    required this.subTitle,
  });
}

final List<OnboardingModel> onboardingData = [
  OnboardingModel(
    image: 'images/rafiki.svg',
    mainTitle: 'Welcome',
    title: 'Your Personalised Alzheimer’s Prediction App',
    subTitle:
        'Get early detection insights, track your health data, and take steps towards better brain care.',
  ),
  OnboardingModel(
    image: 'images/onboarding1.svg',
    mainTitle: 'Features',
    title: 'Peace of mind for you and your loved ones',
    subTitle:
        'Stay on track with your daily plans, medications, and appointments — never miss what matters.',
  ),
  OnboardingModel(
    image: 'images/onboarding2.svg',
    mainTitle: 'Memory Enhancement',
    title: 'Boost your memory and cognitive skills with ALOPR',
    subTitle:
        'Enjoy brain exercises, memory challenges, and activities that keep your mind sharp.',
  ),
  OnboardingModel(
    image: 'images/onboarding3.svg',
    mainTitle: 'Communication',
    title: 'Stay connected with your caregivers and doctors',
    subTitle:
        'ALOPR offers secure messaging to share updates and get the support you need.',
  ),
  OnboardingModel(
    image: 'images/onboarding4.svg',
    mainTitle: 'Location',
    title: 'Stay safe and independent with the “Where Am I?” map',
    subTitle: 'ALOPR helps you find your location and guides you home safely.',
  ),
  OnboardingModel(
    image: 'images/onboarding5.svg',
    mainTitle: 'Make ALOPR your own',
    title: 'We ensure your preferences and privacy come first',
    subTitle:
        'With ALOPR, customise reminders, notifications, and accessibility settings your way.',
  ),
  OnboardingModel(
    image: 'images/onboarding6.svg',
    mainTitle: 'Secure & Privacy',
    title: 'We’re here to make your experience seamless',
    subTitle:
        'ALOPR keeps your data secure, backed up, and gives you useful app stats.',
  ),
  OnboardingModel(
    image: 'images/onboarding7.svg',
    mainTitle: 'Ready to Begin?',
    title: 'You’re all set to start your journey with ALOPR',
    subTitle:
        'Designed to make life easier and boost your well-being — let’s make every day count!',
  ),
];
