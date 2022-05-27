import 'package:hive/hive.dart';

part 'contact.g.dart';

@HiveType(typeId: 0)
class Contact{
  @HiveField(0)
  int? id;
  @HiveField(1)
  String firstName;
  @HiveField(2)
  String lastName;
  @HiveField(3)
  String phoneNumber;

  Contact({required this.firstName, required this.lastName, required this.phoneNumber});
}