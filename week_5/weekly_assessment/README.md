# weekly_assessment

## 5주차 주간평가 & 도전과제

### 주간평가
1. **아래는 Nature의 웹사이트를 휴대폰으로 봤을 때의 화면이다.
어떻게 클래스를 제작할 것인지 고민하고 플러터로 구현하도록 하시오.**
    
    - 7개 이상의 News Article을 포함하도록 하시오.
        
        ```bash
        Journals adopt AI to spot duplicated images in manuscripts
        /articles/d41586-021-03830-7
        Smriti Mallapaty
        23 Dec 2021
        
        Fatal lab explosion in China highlights wider safety fears
        /articles/d41586-021-03589-x
        Andrew Silver
        22 Dec 2021
        
        Journals adopt AI to spot duplicated images in manuscripts
        /articles/d41586-021-03807-6
        Richard Van Noorden
        21 Dec 2021
        ```
        
    - 이 때 사용되는 뉴스 제목을 포함한 모든 데이터는 다음과 같다.
        - 3개만 제공되며, 그 외에 본인이 원하는 기사는 다음의 URL 에서 수집할 수 있도록 한다.
            - [https://www.nature.com/nature/articles?type=news](https://www.nature.com/nature/articles?type=news&year=2021)

2. **다음 JSON으로 받아오는 네트워크 데이터를 이름있는 생성자 (fromMap)을 만드시오.
이 때, 제공되는 소스코드에서 빈 공간을 채워 다음의 화면을 구성할 수 있도록 하시오.**
    - https://sfacassignment23-default-rtdb.europe-west1.firebasedatabase.app/.json
    - **해당 API에는 중복되는 네트워크 데이터가 포함되어있다. 
    operator ==를 재정의하고 함수인 dismissDuplicatedData에 내용을 채워서 
    중복된 값은 리스트에 출력되지 않게 하시오.**
    

    **lib/model/userdata.dart**


    ```dart
    class UserData {
    
    	///이곳 채우기.
    
    }
    ```

    **lib/assignment23_page.dart**

    ```dart
    class Assignment23 extends StatefulWidget {
	const Assignment23({super.key});
	@override
	State<Assignment23> createState() => _Assignment23State();
    }

    class _Assignment23State extends State<Assignment23> {

	Future<Map<String, dynamic>> getJsonData() async {

		///이곳 채우기.

	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(title: Text('23일차 과제')),
			body: Center(
				child: FutureBuilder(
					future: getJsonData(),
					builder: (context, snapshot) {
						if (snapshot.connectionState == ConnectionState.waiting) {
							return const CupertinoActivityIndicator();
						}
						if (!snapshot.hasData) return const Text("데이터가 없습니다");
	
						Map<String, dynamic> data = snapshot.data as Map<String, dynamic>;
						List<dynamic> users = data['users'];
						List<dynamic> dismissDuplicatedUsers = _dismissDuplicatedData(users);
						return ListView.separated(
							itemBuilder: (context, index) {
								UserData userData = UserData.fromMap(dismissDuplicatedUsers[index]);
								return _buildItemWidget(userData);
							},
							separatorBuilder: (context, index) {
								return const Divider();
							},
							itemCount: dismissDuplicatedUsers.length,
						);
					}
				)
			),
		);
	}

	Widget _buildItemWidget(UserData userData) {
		return ListTile(
			leading: Image.network(userData.imageUrl),
			title: Text('${userData.firstName} ${userData.lastName}'),
			subtitle: Text('${userData.phoneNumber}'),
		);
	}

	List<dynamic> _dismissDuplicatedData(List<dynamic> data) {

		///이곳 채우기.

	    }
    }
    ```
   

## 🧑‍💻 결과

### 1번 결과
![Alt text](<Simulator Screenshot - iPhone 14 Pro Max - 2023-08-05 at 01.37.27.png>)

### 2번 결과

![Alt text](<Simulator Screenshot - iPhone 14 Pro Max - 2023-08-05 at 17.55.27.png>)