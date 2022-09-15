import 'dart:io';

class CheckInOutModel {
  bool isCheckIn;
  String? location;
  String? notes;
  File? image;
  DateTime? time;
  int? id;

  CheckInOutModel(
      {required this.isCheckIn, this.location, this.image, this.notes, this.time, this.id});
}
