import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../utils/app_string.dart';

class RemoteService {
  var loginDetails = GetStorage().read("gs_login_data") != ''
      ? GetStorage().read("gs_login_data")
      : '';
  var baseUrl = AppString.baseUrl;

  login(data) async {
    try {
      print(data);
      final uri = Uri.parse('$baseUrl/login').replace(queryParameters: data);
      print(uri);
      var response = await http.post(uri);
      return response;
    } catch (err) {
      return null;
    }
  }

  getCheckListForm(id) async {
    try {
      //var quaryParams = {"id": id, "token": loginDetails["token"]};
      final uri = Uri.parse('$baseUrl/campuses/$id');
      print("-------> url $uri");
      var response = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginDetails["token"]}',
      });
      return response;
    } catch (err) {
      return null;
    }
  }

  getAllHistory() async {
    try {
      final uri = Uri.parse('$baseUrl/feedbacks');
      print("url <---------------> $uri");
      print("${loginDetails["token"]}");
      var response = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginDetails["token"]}',
      });
      return response;
    } catch (err) {
      return null;
    }
  }

  viewHistory(id) async {
    try {
      final uri = Uri.parse('$baseUrl/feedbacks/$id/$loginDetails["token"]');
      var response = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginDetails["token"]}',
      });
      return response;
    } catch (err) {
      return null;
    }
  }

  getMyTeamService() async {
    try {
      final uri = Uri.parse('$baseUrl/assignments');
      print("url <---------------> $uri");
      print("${loginDetails["token"]}");
      var response = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginDetails["token"]}',
      });
      return response;
    } catch (err) {
      return null;
    }
  }

  getMyChecklistService() async {
    try {
      final uri = Uri.parse('$baseUrl/checklists');
      print("url <---------------> $uri");
      print("${loginDetails["token"]}");
      var response = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginDetails["token"]}',
      });
      return response;
    } catch (err) {
      return null;
    }
  }

  getMyHistoryService() async {
    try {
      final uri = Uri.parse('$baseUrl/myfeedbacks');
      print("url <---------------> $uri");
      print("${loginDetails["token"]}");
      var response = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginDetails["token"]}',
      });
      return response;
    } catch (err) {
      return null;
    }
  }

  getDashboardService() async {
    try {
      final uri = Uri.parse('$baseUrl/apps/dashboard');
      print("url <---------------> $uri");
      print("${loginDetails["token"]}");
      var response = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginDetails["token"]}',
      });
      return response;
    } catch (err) {
      return null;
    }
  }

  getOverRideService() async {
    try {
      final uri = Uri.parse('$baseUrl/override');
      print("url <---------------> $uri");
      print("${loginDetails["token"]}");
      var response = await http.get(uri, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${loginDetails["token"]}',
      });
      return response;
    } catch (err) {
      return null;
    }
  }
}
