
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

 class MyHomePage extends StatefulWidget {
   @override
   _MyHomePageState createState() => _MyHomePageState();
 }
 
 class _MyHomePageState extends State<MyHomePage> {

   File _image;
   final picker = ImagePicker();

   Future getImagefromcamera() async{
     final pickedImage = await picker.getImage(source: ImageSource.camera);

     setState(() {
       if(pickedImage != null){
         _image = File(pickedImage.path);
       }else{
         print("No image selected");
       }
     });

   }

   Future getImagefromGallery() async{
     final pickedImage = await picker.getImage(source: ImageSource.gallery);

     setState(() {
       if(pickedImage != null){
         _image = File(pickedImage.path);
       }else{
         print("No image selected");
       }
     });

   }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text('Image Picker'),
       ),
       body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Center(
             child: Text('Image picker'),

           ),
           Padding(
             padding: const EdgeInsets.all(16.0),
             child: Container(
               width: MediaQuery.of(context).size.width,
               height: 450.0,
               child: Center(
                 child: _image == null ? Text('No image selected'): Image.file( _image),
               ),
             ),
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               FloatingActionButton(
                   onPressed: getImagefromcamera,
                 tooltip: "Pick Image from camera",
                 child: Icon(Icons.camera_alt_outlined),
               ),
               FloatingActionButton(
                 onPressed: getImagefromGallery,
                 tooltip: "Pick Image from gallery",
                 child: Icon(Icons.folder_outlined),
               ),
             ],
           )
         ],
       ),
     );
   }
 }
 








