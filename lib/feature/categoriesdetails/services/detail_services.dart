import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mechine___test/feature/categoriesdetails/model/detail_model.dart';

class DetailServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addDetail(
      String userId, String todoId, DetailModel detail) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('todos')
        .doc(todoId)
        .collection('detail')
        .doc(detail.id)
        .set(detail.toJson());
  }

  Stream<List<DetailModel>> getDetails(String userId, String todoId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('todos')
        .doc(todoId)
        .collection('detail')
        .withConverter<DetailModel>(
          fromFirestore: (snapshot, _) =>
              DetailModel.fromJson({'id': snapshot.id, ...snapshot.data()!}),
          toFirestore: (detail, _) => detail.toJson(),
        )
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }


}
