
class Endpoint {
  // static String _baseURL = "https://leeyurani.com/restofood/public/api";
  // static String baseFoods = "${_baseURL}/foods";

  static String _baseURL = "http://192.168.43.251/restofood_api-master/public/api";
  // static String _baseURL = "http://192.168.43.251/restofood/public/api";

  static String baseFoods = "${_baseURL}/foods";
  static String baseCity = "${_baseURL}/city";
  static String register = "${_baseURL}/auth/register";
  static String login = "${_baseURL}/auth/login";
}