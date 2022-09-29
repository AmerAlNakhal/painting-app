import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:painting_app/models/painting.dart';
import 'package:painting_app/widgets/helper.dart';

class PaintingFireStoreController {
  PaintingFireStoreController._();

  static PaintingFireStoreController _instance = PaintingFireStoreController._();
  FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  BuildContext? context;

  static PaintingFireStoreController get instance {
    return _instance;
  }

  PaintingFireStoreController setContext(BuildContext context) {
    this.context = context;
    return this;
  }

  Future<bool> create(Painting painting) async {
    try {
      DocumentReference documentReference =
          await _fireStore.collection('Paintings').add(painting.toMap());
      if (context != null)
        HelperS.showMessage(context!, 'ID ; ${documentReference.id}');
      return true;
    } on FirebaseFirestore catch (e) {
      if (context != null) HelperS.showMessage(context!, '$e', error: true);
    } catch (e) {
      if (context != null) HelperS.showMessage(context!, '$e', error: true);
    }
    return false;
  }

  Stream<QuerySnapshot> readStream() async* {
    yield* _fireStore.collection('Paintings').snapshots();
  }

  Future<bool> update(Painting painting) async {
    try {
      await _fireStore
          .collection('Paintings')
          .doc(painting.id)
          .update(painting.toMap());
      return true;
    } on FirebaseFirestore catch (e) {
      if (context != null) HelperS.showMessage(context!, '$e', error: true);
    } catch (e) {
      if (context != null) HelperS.showMessage(context!, '$e', error: true);
    }
    return false;
  }

  Future<bool> delete(String id) async {
    try {
      await _fireStore.collection('Paintings').doc(id).delete();
      return true;
    } on FirebaseFirestore catch (e) {
      if (context != null) HelperS.showMessage(context!, '$e', error: true);
    } catch (e) {
      if (context != null) HelperS.showMessage(context!, '$e', error: true);
    }
    return false;
  }
}
