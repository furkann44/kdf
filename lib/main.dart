import 'package:flutter/material.dart'; 
import 'package:kdf/film/scoped_models/app_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kdf/mainPage.dart';
 

 void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  runApp(ScopedModel<AppModel>(
      model: AppModel(sharedPreferences), child: KdfApp()));
}