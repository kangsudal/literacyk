import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final usersCollection = FirebaseFirestore.instance.collection('users');
final postCollection = FirebaseFirestore.instance.collection('posts');
final fbAuth = FirebaseAuth.instance;