class TxtResponse {
  late String version;
  late String pa;
  late String pb;
  late String url;
  late String md;

  TxtResponse();

  factory TxtResponse.fromTxtString(String txtResponse) {
    TxtResponse response = TxtResponse();

    List<String> keyValuePairs = txtResponse.split(';');

    for (String pair in keyValuePairs) {
      List<String> keyValue = pair.trim().split('=');

      if (keyValue.length == 2) {
        // Assign values based on the key
        switch (keyValue[0].trim()) {
          case 'pa':
            response.pa = keyValue[1].trim();
            break;
          case 'pn':
            response.pb = keyValue[1].trim();
            break;
          case 'url':
            response.url = keyValue[1].trim();
            break;
          case 'md':
            response.md = keyValue[1].trim();
            break;
        }
      }
    }

    return response;
  }
}