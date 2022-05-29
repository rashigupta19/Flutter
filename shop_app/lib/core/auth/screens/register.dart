import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shop_app/core/auth/models/message.dart';
import 'package:shop_app/core/auth/models/user.dart';
import 'package:shop_app/core/auth/services/user_operations.dart';
import 'package:shop_app/utils/constants.dart';
import 'package:shop_app/utils/toast.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  _register() async {
    String message = "";
    String userid = useridCtrl.text;
    String password = passwordCtrl.text;
    String appId = appIdCtrl.text;
    if (appId != Constants.APP_ID) {
      message = "Wrong App Id ";
      createToast(message, context);
      return;
    } else {
      User userObject =
          User.takeInput(userid: userid, password: password, appId: appId);
      UserOperations opr = UserOperations();
      Message messageObject = await opr.add(userObject);
      print("Register.....");
      createToast(messageObject.message, context);
    }
  }

  late TextEditingController useridCtrl;
  late TextEditingController passwordCtrl;
  late TextEditingController appIdCtrl;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    useridCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
    appIdCtrl = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Register Here'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Register',
                  style: TextStyle(fontSize: 40),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    controller: useridCtrl,
                    decoration: InputDecoration(
                        hintText: 'Type Userid here',
                        prefixIcon: Icon(Icons.app_registration),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                      controller: passwordCtrl,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Type Password Here',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          prefixIcon: Icon(Icons.password))),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                      controller: appIdCtrl,
                      decoration: InputDecoration(
                          hintText: 'Type App ID',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          prefixIcon: Icon(Icons.password))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.all(10),
                        child: ElevatedButton(
                            onPressed: () {
                              _register();
                            },
                            child: Text('Register'))),
                    Container(
                        margin: EdgeInsets.all(10),
                        child: ElevatedButton(
                            onPressed: () {}, child: Text('Cancel')))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
