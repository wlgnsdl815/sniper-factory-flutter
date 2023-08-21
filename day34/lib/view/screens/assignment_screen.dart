import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day34/models/post.dart';
import 'package:flutter/material.dart';

class AssignmentPage extends StatefulWidget {
  const AssignmentPage({super.key});

  @override
  State<AssignmentPage> createState() => _AssignmentPageState();
}

class _AssignmentPageState extends State<AssignmentPage> {
  var ref = FirebaseFirestore.instance.collection('post').withConverter(
        fromFirestore: (snapshot, _) => Post.fromMap(snapshot.data()!),
        toFirestore: (data, _) => data.toMap(),
      );

  Future<List<QueryDocumentSnapshot<Post>>> readData() async {
    var items = await ref.get();
    return items.docs;
  }

  // 하트를 누르면 1씩 likes가 증가
  likesUp(String id) => ref.doc(id).update({'likes': FieldValue.increment(1)});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List<QueryDocumentSnapshot<Post>>>(
          future: readData(),
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(snapshot.data![index].data().title),
                  subtitle: Text(snapshot.data![index].data().content),
                  trailing: IconButton(
                    icon: const Icon(Icons.favorite),
                    // onPressed: () {},
                    onPressed: () => likesUp(snapshot.data![index].id),
                  ),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
