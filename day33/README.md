# day33

## 33일차 & 7주차 주간과제 - 비밀듣는고양이(최종)


## 33일차 과제


1. 비밀듣는고양이를 secret_cat_sdk를 사용하지 않고 제작하시오.
2. 아래의 API 명세서를 보고, 플러터에서 과제풀이에 활용할 수 있도록 하시오.
3. 아래의 필수 기능을 포함해야 함.
    1. 로그인/회원가입 기능
    2. 유저 인증상태가 바뀌면 자동 페이지 리다이렉트 기능
    3. **디자인을 반드시 포함할 것**

## 👉 Users

### 📄 Read 유저리스트를 불러오는 기능

- **GET** http://52.79.115.43:8090/api/collections/users/records?sort=-created

### 📄 Login 로그인

- **POST** http://52.79.115.43:8090/api/collections/users/auth-with-password
- **Request**
    - identity (String - required)
    - password (String -required, 9글자 이상)


### 📄 **SignUp**  회원가입

- **POST** http://52.79.115.43:8090/api/collections/users/records
- **REQUEST**
    - email (String - required, 올바른 이메일형식일 것)
    - password (String - required, 9자 이상일 것)
    - passwordConfirm (String - required, 9자 이상일 것)
    - username (String)

## 👉 Secrets

### 📄 Read 비밀리스트를 불러오는 기능

- **GET** http://52.79.115.43:8090/api/collections/secrets/records?sort=-created

### 📄 Upload 비밀을 업로드하는 기능

- **POST** [http://52.79.115.43:8090/api/collections/secrets/record](http://52.79.115.43:8090/api/collections/secrets/records?sort=-created)s
- **Request**
    - secret (String)
    - author (String, (optional))
        - 해당 author는 User Record ID를 입력할 것
    - authorName (String, (optional))
        - 해당 authorName은 닉네임을 입력할 것

## 7주차 주간과제 (비밀듣는고양이 업데이트)

<aside>
**33일차 과제, 비밀듣는고양이앱에 추가 기능을 구현하는 과제가 일부 포함되어 있습니다.
따라서 33일차 과제를 선행해주세요.**

</aside>

**1. 로그인페이지에서 다음과 같이 [로그인정보 저장] 기능을 구현한다.**



- 체크박스를 누르고 로그인을 진행하면, 앱을 재시작해도 (새로고침하여도) 자동으로 로그인이 진행되도록 한다.
- 이 때, 로그인시 얻은 token값을 저장해야 하며, 아래 API를 사용하여 유저정보를 가져올 수 있다.
    - **POST** http://52.79.115.43:8090/api/collections/users/auth-refresh
        - header에 Authorization값으로 “Bearer $token”을 보내면 다음의 결과를 얻을 수 있다.
            
            ```dart
            // 성공시 Response
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
            
1. **비밀을 업로드할 때 작성자를 남길 수 있다. 
[내이름 공개하기] 체크버튼이 활성화 된 상태라면 현재 사용자의 이름을 함께 남길 수 있도록 하시오.**
    
    
    
    - **이 때 필요시 Upload API를 확인한다. (33일차 과제의 내용과 같음)**
        
        ### 📄 Upload 비밀을 업로드하는 기능
        
        - **POST** [http://52.79.115.43:8090/api/collections/secrets/record](http://52.79.115.43:8090/api/collections/secrets/records?sort=-created)s
        - **Request**
            - secret (String)
            - author (String, (optional))
                - 해당 author는 User Record ID를 입력할 것
            - authorName (String, (optional))
                - 해당 authorName은 닉네임을 입력할 것
        - **Success Response**
            
            ```dart
            {
              "id": "RECORD_ID",
              "collectionId": "5647cebjvtwtcu1",
              "collectionName": "secrets",
              "created": "2022-01-01 01:00:00Z",
              "updated": "2022-01-01 23:59:59Z",
              "secret": "test",
              "author": "RELATION_RECORD_ID",
            	"authorName":"test"
            }
            ```
            

1. **Singleton이라는 디자인 패턴에 대해 학습하고, 내용을 정리하며 Dart 코드를 제시하시오.**
    - 이 때, Singleton의 코드는 검색을 통해 참고할 수 있도록 한다.
    - 어떠한 경우에 Singleton 디자인 패턴이 유용하게 쓰일 수 있을지 고민하고 정리하시오.
    
2. 기존의 비밀듣는고양이의 앱은 각 컨트롤러에서 네트워크 통신이 필요하면 서로 다른 Dio객체를 각각 생성해야 했었다. Singleton으로 단일 객체를 사용하기 위하여 **Dio를 Singleton을 통해 사용할 수 있는 방법에 대한 코드를 OpenAI의 ChatGPT를 활용하여** **생성하시오.**
    - 이 때 클래스의 이름은 CustomDio로 정의한다.
    - 얻은 코드를 사용하여 비밀듣는고양이 앱에 사용되는 다음의 Controller에 각각 적용하고 
    과정을 설명하시오.
        - **AuthController의 Login, Signup기능**
        - **SecretController의 비밀읽기 기능**
        - **UploadController의 비밀업로드 기능**
    - 이 때 Dio를 사용한 CustomDio를 만들어 Singleton으로 사용하면 어떠한 이점이 있는지 고민하고 정리하시오
    

> **OpenAI의 ChatGPT는 공개형 인공지능으로, 간편한 로그인을 통하여 인공지능 모델을 사용할 수 있는 대화형 기반의 봇이다.**
>

## 🧑‍💻 결과

