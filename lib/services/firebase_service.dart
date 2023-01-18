import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  // class call na garesi chahi static rakhdaa huncha before FirebaseFirestore
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static FirebaseFirestore db = FirebaseFirestore.instance;
// static Reference storageRef = FirebaseStorage.instance.ref();
}
