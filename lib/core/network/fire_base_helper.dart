import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:onlyproject/core/network/constant_collection_fb.dart';

class FBHelper {
  // add note
  static Future<void> addNote({
    required String title,
    required String subTitle,
    required String fBD,
    required String fBC,
  }) async {
    final int notificationId = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    var notes = FirebaseFirestore.instance
        .collection(FB.notes)
        .doc(fBD)
        .collection(fBC);
    await notes.add({
      "noteId": notificationId,
      "id": FirebaseAuth.instance.currentUser!.uid,
      "title": title,
      "subtitle": subTitle,
      "createdAt": FieldValue.serverTimestamp(),
    });
  }

  // delete note
  static Future<void> deleteNote({
    required String id,
    required String fBD,
    required String fBC,
  }) async {
    await FirebaseFirestore.instance
        .collection(FB.notes)
        .doc(fBD)
        .collection(fBC)
        .doc(id)
        .delete();
  }

  // update note
  static Future<void> updateNote({
    required String editTitle,
    required String editSubTitle,
    required String fBD,
    required String fBC,
    required String id,
  }) async {
    await FirebaseFirestore.instance
        .collection(FB.notes)
        .doc(fBD)
        .collection(fBC)
        .doc(id)
        .update({"title": editTitle, "subtitle": editSubTitle});
  }

  // get notes
  static Future<List<QueryDocumentSnapshot<Object?>>> getNote({
    required String fBD,
    required String fBC,
  }) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(FB.notes)
        .doc(fBD)
        .collection(fBC)
        .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .orderBy("createdAt", descending: true)
        .get();
    return querySnapshot.docs;
  }
}
