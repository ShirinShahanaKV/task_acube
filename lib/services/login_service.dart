
import 'package:login_mobile_app/models/item_elements.dart';
import 'package:login_mobile_app/models/login_response.dart';
import 'package:login_mobile_app/models/menu_response.dart';
import 'package:login_mobile_app/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginService  {
  Map<String, String> authHeader = {
    "Content-type": "application/json",
    "Authorization": ""
  };

  @override
  Future<LoginResponse?> login(String email, String password) async {

    User loginUser= new User(userName: email,
    password: password,
    applicationID: "MOBILEAPP",
    companyID: "HOST");
    final api = Uri.parse('http://acuberfid.fortiddns.com:4480/lmsapi/lms/User/Authenticate');
    const data = "{\"companyID\":\"HOST\",\"applicationID\":\"MOBILEAPP\",\"userName\":\"Admin\",\"password\":\"Admin@acube\"}";
    // final dio = Dio();
    http.Response response;
    response = await http.post(api, body:json.encode(loginUser),headers: {"content-type": "application/json"});
    if (response.statusCode == 200) {
      SharedPreferences storage = await SharedPreferences.getInstance();
      final body = json.decode(response.body);
      await storage.setString('TOKEN', body['token']);
      //await storage.setString('EMAIL', email);
      return LoginResponse.fromJson(body);
    } else {
      return null;
    }
  }

  @override
  Future<List<MenuResponse>?> menu() async {
    final api = Uri.parse('http://acuberfid.fortiddns.com:4480/lmsapi/lms/AppRoleMenu/GetMenuDetails/MOBILEAPP/1');
    SharedPreferences storage = await SharedPreferences.getInstance();
    String? token =  storage.getString("TOKEN");
    //authHeader["Authorization"] = "bearer $token";
    Map<String, String> headers123 = {
      "Content-type": "application/json",
      "Authorization": "Bearer $token"
    };
    http.Response response;
    response = await http.get(api, headers:headers123);
    if (response.statusCode == 200) {
     // SharedPreferences storage = await SharedPreferences.getInstance();
      final body = json.decode(response.body);
      //await storage.setString('TOKEN', body['token']);
      //await storage.setString('EMAIL', email);
      var response1 = List<MenuResponse>.from(body.map((i) => MenuResponse.fromJson(i)));
      return response1;

      //return LoginResponse.fromJson(body);
    } else {
      return null;
    }
  }

  @override
  Future<List<ItemElements>?> items() async {
    final api = Uri.parse('http://acuberfid.fortiddns.com:4480/lmsapi/lms/Item');
    SharedPreferences storage = await SharedPreferences.getInstance();
    String? token =  storage.getString("TOKEN");
    //authHeader["Authorization"] = "bearer $token";
    Map<String, String> headers123 = {
      "Content-type": "application/json",
      "Authorization": "Bearer $token"
    };
    http.Response response;
    response = await http.get(api, headers:headers123);
    if (response.statusCode == 200) {
      // SharedPreferences storage = await SharedPreferences.getInstance();
      final body = json.decode(response.body);
      //await storage.setString('TOKEN', body['token']);
      //await storage.setString('EMAIL', email);
      var response1 = List<ItemElements>.from(body.map((i) => MenuResponse.fromJson(i)));
      return response1;

      //return LoginResponse.fromJson(body);
    } else {
      return null;
    }
  }

  @override
  Future<String?> getToken() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    final token = storage.getString('TOKEN');

    if (token != null ) {
      return token;
    } else {
      return null;
    }
  }

  @override
  Future<bool> logout() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    final token = storage.getString('TOKEN');
    if (token != null) {
      await storage.remove('TOKEN');
      return true;
    } else {
      return false;
    }
  }
}