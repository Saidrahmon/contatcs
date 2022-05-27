import 'package:contacts_bloc/app.dart';
import 'package:contacts_bloc/model/contact.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await openBox();
  runApp(const MyApp());
}

Future openBox() async {
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(ContactAdapter());
  //final box = await Hive.openBox<Contact>('contacts');
  //return box;
}
