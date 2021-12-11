import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomtest/AllConsts.dart';
import 'package:ecomtest/models/products.dart' ;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class APIServices{
final _firestore=FirebaseFirestore.instance;
final String namePath;
late CollectionReference _ref;

APIServices(this.namePath){
  _ref= _firestore.collection(namePath);
}

Future<QuerySnapshot> getDataCollection()=> _ref.get();
Stream<QuerySnapshot> getStreamDataCollection()=>_ref.snapshots();
Future<DocumentSnapshot> getDocuments(path)=>_ref.doc(path).get();
Stream<DocumentSnapshot> getStreamDocuments(path)=>_ref.doc(path).snapshots();
Future<QuerySnapshot> searchDocuments(searchKey,key)=>_ref.orderBy(key)
    .startAt([searchKey])
    .endAt([searchKey + '\uf8ff']).get();

}