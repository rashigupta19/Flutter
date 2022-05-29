import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_app/modules/models/product.dart';
import 'package:shop_app/utils/constants.dart';

class ProductRepository {
  FirebaseFirestore db = FirebaseFirestore.instance;
  add(Product product) {
    Future<DocumentReference> future =
        db.collection(Collections.PRODUCT).add(product.toJSON());
    return future;
  }

  Stream<QuerySnapshot> readRealTime() {
    Stream<QuerySnapshot> stream =
        db.collection(Collections.PRODUCT).snapshots();
    return stream;
  }

  Future<List<Product>> read() async {
    QuerySnapshot querySnapShot =
        await db.collection(Collections.PRODUCT).get(); // read all the products
    List<QueryDocumentSnapshot> list = querySnapShot.docs; // product docs
    // traverse each doc (JSON)
    List<Product> products = list.map((QueryDocumentSnapshot doc) {
      print("#######  DOC VALUE ${doc.id}");
      return Product.takeProduct(
          id: doc.id,
          name: doc['name'],
          desc: doc['desc'],
          price: doc['price'],
          qty: doc['qty'],
          url: doc['url']);
    }).toList();
    return products;
    // List of Products
    // View in List View
    // CircularProgressIndicator
  }
}
