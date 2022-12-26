import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shamo/models/message_model.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/models/user_model.dart';

class MessageService {
  // Koneksi ke FirebaseFirestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Fungsi untuk menampilkan message yang sudah dikirim
  Stream<List<MessageModel>?> getMessageByUserId({int? userId}) {
    try {
      return firestore
          .collection('messages')
          .where('userId', isEqualTo: userId)
          .snapshots()
          .map((QuerySnapshot list) {
        var result = list.docs.map<MessageModel>((DocumentSnapshot message) {
          print(message.data());
          return MessageModel.fromJson(message.data() as Map<String, dynamic>);
        }).toList();
        result.sort(
          (MessageModel a, MessageModel b) =>
              a.createdAt!.compareTo(b.createdAt!),
        );

        return result;
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  // Function untuk menambahkan dan menyimpan message ke collection di firebase
  Future<void> addMessage({
    UserModel? user,
    bool? isFromUser,
    String? message,
    ProductModel? product,
  }) async {
    try {
      firestore.collection('messages').add({
        'userId': user!.id,
        'username': user.name,
        'userImg': user.profilePhotoUrl,
        'isFromUser': isFromUser,
        'message': message,
        // Mengecek apakah productnya masuk ke chat atau tidak
        'product':
            product is UninitializedProductModel ? {} : product!.toJson(),
        'createdAt': DateTime.now().toString(),
        'updateAt': DateTime.now().toString(),
      }).then((value) => print('Pesan Berhasil Dikirim!'));
    } catch (e) {
      throw Exception('Pesan Gagal Dikirim');
    }
  }
}
