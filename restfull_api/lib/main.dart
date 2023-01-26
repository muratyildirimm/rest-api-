import 'package:flutter/material.dart';
import 'package:restfull_api/model/user_model.dart';
import 'package:restfull_api/service/user_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  UserService _service=UserService();
  List<Data?> users=[];
  bool? _isLoading;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _service.fetchUsers().then((value) {

if(value!= null && value.data!= null){
  print("dogur");
 setState(() {
        users=value.data!;
        _isLoading=false;
      });
}
else{
  setState(() {
    _isLoading=true;
     print("yanlis");
  });
 
  
}
     
    });

   
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _isLoading== true ? CircularProgressIndicator(color: Colors.red,) :  ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
        return ListTile(
          
          title: Text("${users[index]!.firstName! + users[index]!.lastName!}" ),
          subtitle: Text(users[index]!.email ?? " "),
          leading: CircleAvatar(
backgroundImage: NetworkImage(users[index]!.avatar ?? ""),

          ),
          );
      },)
    );
  }
}
