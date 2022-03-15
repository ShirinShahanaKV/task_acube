import 'package:flutter/material.dart';
import 'package:login_mobile_app/models/item_elements.dart';
import 'package:login_mobile_app/models/login_response.dart';
import 'package:login_mobile_app/models/menu_response.dart';
import 'package:login_mobile_app/services/login_service.dart';


class LoginSuccess extends StatefulWidget {
  const LoginSuccess({Key? key}) : super(key: key);

  @override
  _LoginSuccessState createState() => _LoginSuccessState();
}

class _LoginSuccessState extends State<LoginSuccess> {
  final _loginService = LoginService();
  List<MenuResponse>? response;
  List<ItemElements>? items;
 // late ItemElements itemElement;
  @override
  void initState()  {
    super.initState();

    callMenuItems();
  }

  void callMenuItems() async{

 response = await _loginService.menu();
    print("response is $response");
 items = await _loginService.items();
// itemElement =items![0].itemName as ItemElements;
 print("response is $items");
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.center, colors: [
              Colors.orange[900]!,
              Colors.orange[700]!,
              Colors.orange[400]!
            ])),
        child: Column(
          children: [
            Container(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemCount:response != null ? response!.length :0,
                  itemBuilder: (context, index){
                    return Card(color:Colors.orangeAccent[100],
                      child: Container(
                          padding:
                          EdgeInsets.all(10.0),
                          child: Center(child: Text("${response![index].menuName}"))),
                    );
                  },
                  separatorBuilder: (context, index){
                    return Divider(
                      thickness: 2,
                    );
                  }
              ),
            ),
         /*   DropdownButton<ItemElements>(
              focusColor:Colors.white,
              value: itemElement,
              //elevation: 5,
              style: TextStyle(color: Colors.white),
              iconEnabledColor:Colors.black,
              items: items!.map<DropdownMenuItem<ItemElements>>((ItemElements value) {
                return DropdownMenuItem<ItemElements>(
                  value: value,
                  child: Text(value.itemName,style:TextStyle(color:Colors.black),),
                );
              }).toList(),
              hint:Text(
                "Please choose a langauage",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            onChanged: (ItemElements){},
            ),*/
          ],
        ),
      ),
    );
  }
}
