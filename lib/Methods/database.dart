import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money/Data/data.dart';

class DatabaseMethods {
  static CreateGroup(String name) async {
    String Id = ID! +"_" + name;
    FirebaseFirestore.instance
        .collection(Id)
        .doc(Id)
        .set({'array':FieldValue.arrayUnion([USERNAME! + "_" + USERNAME!])});
  }
}