import 'package:flutter/material.dart';
import 'package:shop_app/core/auth/models/message.dart';
import 'package:shop_app/utils/constants.dart';
import 'package:shop_app/core/auth/services/user_operations.dart';
import 'package:shop_app/core/auth/models/user.dart';
import 'package:shop_app/utils/toast.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  _moveToRegister() {
    //Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => Register()));
    Navigator.pushNamed(
      context,
      RouteConstants.REGISTER,
    );
  }

  late TextEditingController useridCtrl;
  late TextEditingController passwordCtrl;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    useridCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
  }

  _doLogin() async {
    String userid = useridCtrl.text;
    String password = passwordCtrl.text;
    User user = User.takeInput(
        userid: userid, password: password, appId: Constants.APP_ID);
    UserOperations opr = UserOperations();
    Message messageObject = await opr.read(user);
    print("Message Object $messageObject");
    createToast(messageObject.message, context);
    if (messageObject.code == Constants.FAIL) {
      return;
    }
    Navigator.pushNamed(context, RouteConstants.DASHBOARD,
        arguments: {'userid': useridCtrl.text});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Image.network(Constants.LOGIN_IMAGE),
            Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: useridCtrl,
                decoration: InputDecoration(
                    hintText: 'Type Userid here',
                    prefixIcon: Icon(Icons.login),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.all(10),
                    child: ElevatedButton(
                        onPressed: () {
                          _doLogin();
                        },
                        child: Text('Login'))),
                Container(
                    margin: EdgeInsets.all(10),
                    child: ElevatedButton(
                        onPressed: () {
                          _moveToRegister();
                        },
                        child: Text('Register')))
              ],
            )
          ],
        ),
      ),
    ));
  }
}
