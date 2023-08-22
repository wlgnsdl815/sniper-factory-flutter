import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day34/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        print('회원가입 됐거나 유저가 들어왔다');
        return;
      }
      print('회원가입이나 로그인이 필요하다');
    });
  }

  var instance = FirebaseFirestore.instance;
  List items = [];

  // CloudFireStore에서 데이터 가져오기
  readFromCloudFireStore() async {
    var res = await instance.collection('memo').get();

    setState(() {
      items = res.docs.map((e) => e.data()).toList();
      print(items);
    });
  }

  // 데이터 하나만 가져오기
  getDocument(String documentId) async {
    var instance = FirebaseFirestore.instance;
    var res = await instance.collection('memo').doc(documentId).get();
    print(res.data());
  }

  // isFinished가 true인 것만 가져오기
  readFinishedDocuments() async {
    var res = await instance
        .collection('memo')
        .where('isFinished', isEqualTo: true)
        .get();
    print(res.docs.first.data()); // res.docs는 List타입이라서 예시로 이렇게 작성했다.
    print(res.size); // true인게 1개라 1출력
  }

  // 문서 추가
  createDocument(String title) async {
    var res = await instance.collection('memo').add({
      'title': title,
      'isFinished': false,
    });
  }

  // 지정 ID로 문서 추가
  createDocumentById(String docId, String title) async {
    var res = await instance.collection('memo').doc(docId).set({
      'title': title,
      'isFinished': false,
    });
  }

  // 문서 업데이트하기
  updateDocument(String docId, Map<String, dynamic> data) {
    instance.collection('memo').doc(docId).update(data);
  }

  // 문서 삭제하기
  deleteDocument(String docId) {
    instance.collection('memo').doc(docId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: readFromCloudFireStore,
              child: Text('가져오기'),
            ),
            TextButton(
              onPressed: () {
                getDocument('RGS2R9n6ROmHOMYN5gBq');
                getDocument('EmBG1gWcGtBA2MtGUTtb');
              },
              child: Text('하나만 가져오기'),
            ),
            TextButton(
              onPressed: readFinishedDocuments,
              child: Text('finished만 가져오기'),
            ),
            TextButton(
              onPressed: () {
                createDocument('책방가서 책읽기');
              },
              child: Text('문서 추가'),
            ),
            TextButton(
              onPressed: () {
                createDocumentById('123456789', '노래방가서 노래부르기');
              },
              child: Text('문서 추가 (지정 아이디)'),
            ),
            TextButton(
              onPressed: () {
                updateDocument('123456789', {'isFinished': true});
              },
              child: Text('문서 수정'),
            ),
            TextButton(
              onPressed: () {
                deleteDocument('123456789');
              },
              child: Text('문서 삭제'),
            ),
            if (items.isNotEmpty)
              ...items.map((e) => Text(e['title'])).toList(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => LoginScreen(),
                  ),
                );
              },
              child: Text('로그인 화면으로 이동'),
            ),
          ],
        ),
      ),
    );
  }
}
