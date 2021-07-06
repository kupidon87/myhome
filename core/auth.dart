import 'package:cloud_firestore/cloud_firestore.dart';
import '../import.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final CollectionReference _userDataCollection = Firestore.instance.collection('users');

  Future<User> signInWithEmailAndPassword(String email, String password)async{
    try{
      AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return User.fromFirebase(user);
    }catch(e){
      print(e);
      return null;
    }
  }

  Future<User> registerInWithEmailAndPassword(String email, String password)async{
    try{
      AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser firebaseUser = result.user;
      var user = User.fromFirebase(firebaseUser);
      var userData = UserData();
      await _userDataCollection.document(user.id).setData(userData.toMap());

      return user;
    }catch(e){
      print(e);
      return null;
    }
  }

  Future logOut()async {
    await _firebaseAuth.signOut();
  }

  Stream<User> get currentUser{
    return _firebaseAuth.onAuthStateChanged.map((FirebaseUser user) => user !=null ? User.fromFirebase(user):null);
  }

  Stream<User> getCurrentUserWithData(User user){
    return _userDataCollection.document(user?.id).snapshots().map((snapshot) {
      if(snapshot?.data == null) return null;
      var userData = UserData.fromJson(snapshot.documentID, snapshot.data);
      return user;
    });
  }
}