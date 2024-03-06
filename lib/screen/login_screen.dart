import 'package:api_calling/provider/authentication_provider.dart';
import 'package:api_calling/services/base_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  bool nameValidate=false;
  bool surnameValidate=false;
  String nameErrorMsg="";
  String surnameErrorMsg="";
  @override
  Widget build(BuildContext context) {
    return BaseView(builder: (BuildContext context,AuthenticationProvider model,Widget child){
      return Scaffold(
        appBar: AppBar(
          title: const Text("Login Here"),
        ),
        body: Material(
          type: MaterialType.transparency,
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height*0.50,
              width: MediaQuery.of(context).size.width*0.85,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(6))),
              child: Center(
                child: Column(
                  children: [
                    TextField(
                      controller: nameController,
                      decoration:InputDecoration(
                        labelText: 'Enter Name',
                        errorText: nameValidate ? nameErrorMsg:"",
                      ),
                    ),
                    TextField(
                      controller: surnameController,
                      decoration:InputDecoration(
                        labelText: 'Enter Mobile Number',
                        errorText: surnameValidate ? surnameErrorMsg:"",
                      ),
                    ),
                    ElevatedButton(onPressed: (){
                      if(nameController.text.isNotEmpty && surnameController.text.isNotEmpty)
                      {
                        if (kDebugMode) {
                          print("Done");
                        }

                        model.loginUser(context, surnameController.text.toString());
                        /*UserData userData=UserData(name: nameController.text.toString(), surname: surnameController.text.toString());
                        model.addUserData(context,userData);*/
                      }
                      else
                      {
                        if(nameController.text.isEmpty && surnameController.text.isEmpty)
                        {
                          setState((){
                            nameErrorMsg="not null";
                            surnameErrorMsg="not null";
                            nameValidate=true;
                            surnameValidate=true;
                          });
                        }
                        else
                        {
                          if(surnameController.text.isEmpty)
                          {
                            setState((){
                              surnameErrorMsg="not null";
                              nameValidate=false;
                              surnameValidate=true;
                            });
                          }
                          else
                          {
                            setState((){
                              nameErrorMsg="not null";
                              nameValidate=true;
                              surnameValidate=false;
                            });
                          }
                        }
                      }
                    },child: model.showLoading?const CircularProgressIndicator():const Text("  Login  ")
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },onModelReady: (model){}, onModelDispose: (model){},isConsumerAdded: true);
  }
}
