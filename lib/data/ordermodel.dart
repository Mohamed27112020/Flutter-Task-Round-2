import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String desc;
  final String name;
  final String price;
  final String imageUrl;

  Product({
    required this.desc,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  factory Product.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Product(
      desc: data['desc'] ?? 'No desc',
      name: data['name'] ?? 'No Name',
      price: (data['price'] ?? 'No Price'),
      imageUrl: data['imageUrl'] ?? 'Uncategorized',
    );
  }
}
