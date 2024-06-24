class Constants {
  Constants._();

  static const String appName = 'Netify';

  static const List<String> categories = [
    'All',
    'Business',
    'Entertainment',
    'Health',
    'Science',
    'Sports',
    'Technology'
  ];
  static const List<String> countryCodeList = [
    'ae',
    'ar',
    'at',
    'au',
    'be',
    'bg',
    'br',
    'ca',
    'ch',
    'cn',
    'co',
    'cu',
    'cz',
    'de',
    'eg',
    'fr',
    'gb',
    'gr',
    'hk',
    'hu',
    'id',
    'ie',
    'il',
    'in',
    'it',
    'jp',
    'kr',
    'lt',
    'lv',
    'ma',
    'mx',
    'my',
    'ng',
    'nl',
    'no',
    'nz',
    'ph',
    'pl',
    'pt',
    'ro',
    'rs',
    'ru',
    'sa',
    'se',
    'sg',
    'si',
    'sk',
    'th',
    'tr',
    'tw',
    'ua',
    'us',
    've',
    'za'
  ];

  /// --------------------- Api Constants ---------------------- ///
  static const String baseUrl = 'https://newsapi.org/v2';

  static const String everything = '$baseUrl/everything';
  static const String topHeadLines = '$baseUrl/top-headlines';
  static const String sources = '$topHeadLines/sources';
  static const String countryUrl = 'https://restcountries.com/v3.1/alpha';
  static const String defaultCountry = 'in';

  ///----------------------------------------------------------- ///
  /// --------------------- image declaration ------------------ ///

  static const String appIcon = 'assets/images/app_icon.png';
  static const String splashImage_1 = 'assets/images/splash_image_1.png';
  static const String splashImage_2 = 'assets/images/splash_image_2.png';
  static const String splashImage_3 = 'assets/images/splash_image_3.png';
  static const String demoImage = 'assets/images/download.jpeg';

  ///-----------------------------------------------------------///

  static const splashImages = [splashImage_1, splashImage_2, splashImage_3];
}
