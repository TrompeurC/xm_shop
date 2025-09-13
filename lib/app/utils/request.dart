import 'package:dio/dio.dart';

const IMAGE_URL = "https://miapp.itying.com";
const BASE_URL = "https://miapp.itying.com/api";

Dio request = Dio(
  BaseOptions(
    baseUrl: BASE_URL,
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
  ),
);


String getUri (String url) {
  return '${IMAGE_URL}/${url.replaceAll("\\", "/")}';
}