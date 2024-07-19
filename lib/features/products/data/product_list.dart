import 'package:http/http.dart' as http;

Future<http.Response> getProductList() async => await http.get(
      Uri.parse(
          "https://s3-eu-west-1.amazonaws.com/api.themeshplatform.com/products.json"),
    );
