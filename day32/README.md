# day32

## 📄 배운내용
페이지별 GetxController, binding, Design Pattern, MVC, GetX AuthController

## 32일차 과제

<aside>
⚠️ 과제 난이도가 매우 어려울 수 있습니다.
팀원과의 소통을 통해 해결할 수 있도록 합니다.

</aside>

- **Getx AuthController 강의를 보고 따라서 제작하시오.**

- **AuthController에는 User의 정보만을 담고있다. 
로그인을 하면 유저를 식별할 수 있는 Token 값도 함께 받아볼 수 있는데, 해당 Token 값을 AuthController 내에 저장할 수 있도록 하고, 코드를 제시하시오.**
    - **해당 API의 정보는 다음과 같다**
        - **API URL**
            
            ```json
            // http://52.79.115.43:8090/api/collections/users/auth-with-password
            ```
            
        - **API Request**
            
            ```dart
            // Method : POST
            // data : identity(String), password(String)
            // Teddy/sfac12341234
            ```
            
        - **API Response**
            
            ```json
            {
              "token": "JWT_TOKEN",
              "record": {
                "id": "RECORD_ID",
                "collectionId": "_pb_users_auth_",
                "collectionName": "users",
                "created": "2022-01-01 01:00:00Z",
                "updated": "2022-01-01 23:59:59Z",
                "username": "username123",
                "verified": false,
                "emailVisibility": true,
                "email": "test@example.com",
                "name": "test",
                "avatar": "filename.jpg"
              }
            }
            ```
            
- **MainController에는 readDocuments라는 멤버 함수(메서드)를 제작하시오.**
    - **해당 API의 정보는 다음과 같다**
    *이 때, AuthController를 find하여 Token값이 존재하면 (로그인 되었다면) 실행할 수 있도록 한다.*
        - **API URL**
            
            ```json
            // http://52.79.115.43:8090/api/collections/documents/records
            ```
            
        - **API Request (필수)**
            
            ```dart
            // Method: GET
            // 해당 API는 인증된 사용자만 사용할 수 있기 때문에
            // 로그인 시 획득한 Token을 반드시 Request 헤더에 Authorization을 포함시켜야만합니다.
            ```
            
        - **API Response (성공시)**
            
            ```json
            {
              "page": 1,
              "perPage": 30,
              "totalPages": 1,
              "totalItems": 2,
              "items": [
                {
                  "id": "RECORD_ID",
                  "collectionId": "bjqjkp8usyz0lpb",
                  "collectionName": "documents",
                  "created": "2022-01-01 01:00:00Z",
                  "updated": "2022-01-01 23:59:59Z",
                  "title": "test",
                  "content": "test",
                  "sec_level": "high",
                  "attachment": "filename.jpg",
                  "attachment_url": "test"
                },
                {
                  "id": "RECORD_ID",
                  "collectionId": "bjqjkp8usyz0lpb",
                  "collectionName": "documents",
                  "created": "2022-01-01 01:00:00Z",
                  "updated": "2022-01-01 23:59:59Z",
                  "title": "test",
                  "content": "test",
                  "sec_level": "high",
                  "attachment": "filename.jpg",
                  "attachment_url": "test"
                }
              ]
            }
            ```
            
    - **위 API 정보를 토대로 응답 데이터형식에 맞게 Document 커스텀 클래스를 제작하고, 
    MainPage의 Home이 다음과 같이 출력되도록 한다.**
        
      
        
    - **아래 FAB를 누르면 readDocuments를 실행하고 결과를 화면에 출력한다.**
        - document리스트는 MainController 멤버변수로 저장한다.
    - **다음의 제공되는 코드를 사용할 수 있도록 한다.**
        - **/lib/model/document.dart**
            
            ```dart
            // ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
            
            class Document {
              String title;
              String content;
              String sec_level;
              String? attachment_url;
              Document({
                required this.title,
                required this.content,
                required this.sec_level,
                this.attachment_url,
              });
            
              factory Document.fromMap(Map<String, dynamic> map) {
                return Document(
                  title: map['title'] as String,
                  content: map['content'] as String,
                  sec_level: map['sec_level'] as String,
                  attachment_url:
                      map['attachment_url'] != '' ? map['attachment_url'] : null,
                );
              }
            }
            ```
            
    - **개발팀 사원리스트(최신) 게시글의 attachment_url에는 해당 이미지의 URL이 담겨있다.
    ”김스팩의 비고란에 무엇이 써져있는지 비밀”을 알아내도록 한다.**
    - (앱 디자인 방식은 자유로, 평가요소에 포함되어있지 않음)

## 🧑‍💻 결과

![Alt text](<Simulator Screen Recording - iPhone 14 Pro Max - 2023-08-18 at 04.08.29.gif>)