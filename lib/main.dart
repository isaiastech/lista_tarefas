import 'package:flutter/material.dart';
import 'pages/list_page.dart';

void main(){
  runApp( MyApp());
}

 class MyApp extends StatelessWidget {  //usar atalho stless
   const MyApp ({super.key});

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       theme: ThemeData(
         primarySwatch: Colors.grey,
       ),
       home: ListPage(),
     );
   }
   
 }
