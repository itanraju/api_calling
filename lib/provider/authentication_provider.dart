import 'package:api_calling/model/login_response.dart';
import 'package:api_calling/services/web_service_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AuthenticationProvider extends ChangeNotifier{
  bool _showLoading = false;
bool get showLoading => _showLoading;

set showLoading(bool value) {
  _showLoading = value;
  notifyListeners();
}

Future<bool> loginUser(BuildContext context,String mobileNumber) async
{
  showLoading=true;
  var response=await WebServiceManager().loginUserApi(mobileNumber);
  if(response['status']==true)
    {
        LoginResponse loginResponse=LoginResponse.fromJson(response);
        showLoading=false;
        notifyListeners();
        if (kDebugMode) {
          print("Login Successfully");
        }
        return true;
    }else
      {
        Navigator.pop(context);
        showLoading=false;
        notifyListeners();
        if (kDebugMode) {
          print("Login Failed");
        }
        return false;
      }
}
}