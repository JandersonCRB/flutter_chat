class Network {
  static final String _baseUrl = "http://5915b3ae.ngrok.io/";

  Network();

  String getBaseUrl() {
    return _baseUrl;
  }

  static get baseUrl => _baseUrl;
}