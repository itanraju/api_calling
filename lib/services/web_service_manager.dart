import 'package:api_calling/services/dio_client.dart';
import 'package:dio/dio.dart';

class WebServiceManager{
    DioClient? dioClient;
    var option;

    WebServiceManager() {
        dioClient = DioClient(Dio());
        option = Options(headers: {
            "Content-Type": "application/json",
        });
    }

    Future<dynamic> loginUserApi(String mobileNumber) async
    {
        var body = {
            "mobile_no": mobileNumber
        };
        var response;
        try {
            response = await dioClient!.post("https://api.trust11.in/api/v1/user/login",
                options: option, data: body);
            return response;
        } on DioError catch (e) {
            // showToastMessage(e.response!.data['message']);
            return (e.response!.data);
        }
    }
}