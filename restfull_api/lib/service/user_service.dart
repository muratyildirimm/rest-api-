import 'dart:convert';

import 'package:restfull_api/model/user_model.dart';


import 'package:http/http.dart' as http;
class UserService{

final String url="https://reqres.in/api/users?page=2";

 Future<UsersModel?> fetchUsers() async {

  var response=await http.get(Uri.parse(url));
  if(response.statusCode==200){
var jsonBody=UsersModel.fromJson(jsonDecode(response.body));
return jsonBody;
  }else{
print("a");
  }



 }


}