import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/models/user_model.dart';

class MessageService {
  // Koneksi ke FirebaseFirestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;

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
        'isFromUser': true,
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
