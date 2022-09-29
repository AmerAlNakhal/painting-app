import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:painting_app/models/cart.dart';
import 'package:painting_app/models/painting.dart';
import 'package:painting_app/widgets/helper.dart';

class CartFireStoreController {
  CartFireStoreController._();

  static CartFireStoreController _instance = CartFireStoreController._();
  FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  BuildContext? context;

  static CartFireStoreController get instance {
    return _instance;
  }

  CartFireStoreController setContext(BuildContext context) {
    this.context = context;
    return this;
  }

  Future<bool> create(Cart cart) async {
    try {
      DocumentReference documentReference =
      await _fireStore.collection('Cart').add(cart.toMap());
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
    yield* _fireStore.collection('Cart').snapshots();
  }

  Future<bool> update(Cart likes) async {
    try {
      await _fireStore
          .collection('Cart')
          .doc(likes.id)
          .update(likes.toMap());
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
      await _fireStore.collection('Cart').doc(id).delete();
      return true;
    } on FirebaseFirestore catch (e) {
      if (context != null) HelperS.showMessage(context!, '$e', error: true);
    } catch (e) {
      if (context != null) HelperS.showMessage(context!, '$e', error: true);
    }
    return false;
  }
}
