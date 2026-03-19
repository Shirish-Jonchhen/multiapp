class AppConstants {
  AppConstants._();

  static const String appName = 'Flutter Showcase';
  static const String fakeStoreBaseUrl = 'https://fakestoreapi.com';
  static const int defaultPageSize = 10;

  // Method Channel names
  static const String deviceInfoChannel = 'com.example.multiapp/device_info';
  static const String batteryRefreshChannel =
      'com.example.multiapp/battery_refresh';
  static const String platformViewType = 'com.example.multiapp/native_button';
}
