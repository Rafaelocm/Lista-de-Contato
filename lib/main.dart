import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:projeto_lista_contato/my_app.dart';

void main() async {
  await dotenv.load(); 
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}


