import 'package:contacts_bloc/model/contact.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ContactState{}

class InitialContactState extends ContactState{}

class LoadingContactState extends ContactState{}

class LoadedContactSate extends ContactState{
  List<Contact> contacts;

  LoadedContactSate(this.contacts);
}

class ErorLoadContact extends ContactState{}