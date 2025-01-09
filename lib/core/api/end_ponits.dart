class EndPoint {
  static const String baseUrl = "https://test.catalystegy.com/api/";
  static const String users = "users";
  static const String properties = "properties";
  static const String bookings = "bookings";
  static  String getUserDataEndPoint(int id) {
    return "$users/$id";
  }

  static String getPropertyEndPoint(int id) {
    return "$properties/$id";
  }

  static String getBookingEndPoint(int id) {
    return "$bookings/$id";
  }
}
