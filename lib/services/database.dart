import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  //collection reference
  final CollectionReference dataCollection =
      Firestore.instance.collection('data');

  Future<void> updateUserData(int sampleData) async {
    return await dataCollection
        .document(uid)
        .setData({'sampleData': sampleData});
  }

  // getting the current mode
  Stream<QuerySnapshot> get currentMode {
    return dataCollection.snapshots();
  }
}
