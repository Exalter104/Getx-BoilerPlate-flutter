import 'package:getx_boilerplate/data/networks/network_api_services.dart';
import 'package:getx_boilerplate/resources/app_url/app_url.dart';

class LoginRepository {
  final _apiServices = NetworkApiService();
  Future<dynamic> loginApi(var data) {
    dynamic response = _apiServices.postApi(data, AppUrl.loginUrl);
    print(response.toString());
    return response;
  }
}
