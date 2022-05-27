import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:contacts_bloc/bloc/load_contact/contact_event.dart';
import 'package:contacts_bloc/bloc/load_contact/contact_state.dart';
import 'package:contacts_bloc/model/contact.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(InitialContactState()) {
    on<LoadContactsEvent>((event, emit) async {
      emit(LoadingContactState());
      var box = await Hive.openBox('contacts');
      List<Contact> contacts = box.values.toList().cast<Contact>();
      emit(LoadedContactSate(contacts));
      print("contatcs::::::::::::::::");
      print(contacts);
    });
    on<AddContactEvent>((event, emit) async {
      emit(LoadingContactState());
      var box = Hive.box('contacts');
      box.put(Random().nextInt(10000), Contact(firstName: "Alisa", lastName: "Yandex", phoneNumber: "Google"));
      List<Contact> contacts = box.values.toList().cast<Contact>();
      emit(LoadedContactSate(contacts));
    });
    // http.Client client = http.Client();
    // on<LoadContactsEvent>((event, emit) async {
    //   emit(LoadingContactState());
    //   http.Response response =  await client.get(
    //       Uri.parse("https://628f193e0e69410599d5289f.mockapi.io/api/contact"));
    //   print(response);
    //   emit(LoadedContactSate([]));
    // });
  }
}
