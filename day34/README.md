# day34

## 🧑‍💻 배운내용 

BaaS, Firebase, Firebase Flutter연동(FlutterFire), cloud_firestore CRUD

## 34일차 과제

<aside>
 **과제를 진행하기 위해서 아래의 설정을 맞춰주세요.**

프로젝트에 컬렉션 (post)를 만들고 2가지 Document를 만들어 다음의 값을 넣도록 한다.



- 문서명은 자동생성할 수 있도록 한다.
- 필드값은 content, likes, title를 갖도록 하며, 데이터타입은 다음과 같다.
    - content - string
    - title - string
    - likes - number
</aside>

1. **지금까지 JSON 데이터를 불러와서 Class에 적용시키기 위해 Serialization을 진행하였다.
Firebase에서 이를 편하게 적용시킬 수 있도록하는 메서드 (withConverter)를 제공하는데,** 
    
    다음의 코드들을 확인하고, 실행해본 뒤 동작 원리를 설명하시오.
    
    - lib/model/post.dart
        
        ```dart
        // ignore_for_file: public_member_api_docs, sort_constructors_first
        import 'dart:convert';
        
        class Post {
          String? id;
          String title;
          String content;
          int likes;
          Post({
            required this.id,
            required this.title,
            required this.content,
            required this.likes,
          });
        
          Map<String, dynamic> toMap() {
            return <String, dynamic>{
              'id': id,
              'title': title,
              'content': content,
              'likes': likes,
            };
          }
        
          factory Post.fromMap(Map<String, dynamic> map) {
            return Post(
              id: map['id'] as String?,
              title: map['title'] as String,
              content: map['content'] as String,
              likes: map['likes'] as int,
            );
          }
        
          String toJson() => json.encode(toMap());
        
          factory Post.fromJson(String source) =>
              Post.fromMap(json.decode(source) as Map<String, dynamic>);
        }
        ```
        
    - lib/view/page/assignment_page.dart
        
        ```dart
        import 'package:cloud_firestore/cloud_firestore.dart';
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
        
          // likesUp(String id) => ref.doc(id).update(...);
        
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
                            onPressed: (){},
                            // onPressed: () => likesUp(snapshot.data![index].id),
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
        ```
        
    
    이때, withConverter 부분의 코드를 중점적으로 설명할 것
    
2. **위의 제공된 코드의 주석을 처리하면 다음과 같이 구현이 가능하다.
trailing의 IconButton을 클릭하면 해당 포스트의 좋아요 수가 +1만큼 올라간다.
주석을 해제하고, 코드를 알맞게 작성하시오.**
    
    
    - FieldValue를 사용하여 해결할 것

## 🧑‍💻 결과

- 버튼을 누르기 전


![Alt text](<스크린샷 2023-08-22 오전 3.10.10.png>)


- 버튼을 다섯번 누른 후


![Alt text](<스크린샷 2023-08-22 오전 3.09.01.png>)

- 동작 영상


![Alt text](<Simulator Screen Recording - iPhone 14 Pro Max - 2023-08-22 at 03.10.17.gif>)