import 'dart:core';

String getFavIcon(String url) {
  RegExp regex = RegExp(r'https?://(?:www\.)?([^/]+)');
  String baseUrl = regex.firstMatch(url)?.group(0) ?? '';
  return baseUrl;
}
