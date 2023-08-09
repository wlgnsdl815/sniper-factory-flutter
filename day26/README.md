# day26

## 📄 공부내용

Todos API serialization

## 26일차 과제

# 25일차 과제[2] - Todo 활용

1. **다음의 공개된 API를 분석하고, 클래스를 활용하여 적용 후 
해야할 일을 보여주는 앱을 다음과 같이 만드시오.**
https://jsonplaceholder.typicode.com/todos
    

    - **반드시 Todo 클래스를 만들고 Serialization을 진행할 수 있도록 하시오.**
    - **AppBar는 다음의 조건을 따라 만들도록 하시오**
        1. Blur 효과를 넣어 body의 내용이 흐릿하게 보여질 수 있도록 디자인하시오.
        2. Actions에는 다음의 기능이 포함되어있는 아이콘을 제작하시오
            - Filter 아이콘 :
                - 클릭시 아래서 필터를 설정할 수 있도록 시트 위젯이 켜진다.
                - 필터가 적용되면 화면에 보이는 데이터의 종류가 바뀐다.
                - (필터선택시 아래에서 올라오는 안내문구는 선택사항임)
            - Refresh 아이콘 :
                - 클릭시 네트워크에 데이터를 한 번 더 요청하여 리스트에 재적용한다.
    - **각 Post를 보여주는 Widget은 다음의 조건을 따라 만들도록 하시오**
        1. 완료된 상태의 Post라면, 초록색 배경에 체크버튼의 아이콘이 보여지도록 한다.
        2. Dismissable 위젯을 활용하여 옆으로 슬라이드 했을 때, 리스트에서 사라지도록 한다.
            1. **추가적으로, Dismissable 위젯의 key 속성이 의미하는 바를 정리하시오.**
    - **제공되는 소스코드를 활용할 수 있도록 하시오.**
        - **widget/filter_bottom_sheet.dart**
            - **필터 아이콘 누를 시 하단에 출력되는 위젯입니다.**
            - **enum에 대해 학습을 따로 진행하는 것을 추천드립니다.**
            
```dart
import 'package:flutter/material.dart';

enum TodoFilter { all, completed, incompleted }

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet(
      {Key? key, required this.filter, required this.onApply})
      : super(key: key);
  final TodoFilter filter;
  final Function(TodoFilter) onApply;

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  onApply(TodoFilter filter) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Filter applied: $filter'),
      ),
    );
    widget.onApply(filter);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text('All'),
            trailing: Checkbox(
              value: widget.filter == TodoFilter.all,
              onChanged: (value) {
                if (value == true) onApply(TodoFilter.all);
              },
            ),
          ),
          ListTile(
            title: const Text('Completed'),
            trailing: Checkbox(
              value: widget.filter == TodoFilter.completed,
              onChanged: (value) {
                if (value == true) onApply(TodoFilter.completed);
              },
            ),
          ),
          ListTile(
            title: const Text('InCompleted'),
            trailing: Checkbox(
              value: widget.filter == TodoFilter.incompleted,
              onChanged: (value) {
                if (value == true) onApply(TodoFilter.incompleted);
              },
            ),
          ),
        ],
      ),
    );
  }
}
```            

**widget/todo_card.dart**

**(model 폴더에 todo클래스를 만들어놓을 것)**

        

```dart
           import 'package:flutter/material.dart';

import '../model/todo.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({super.key, required this.todo});
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(todo.id.toString()),
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: todo.completed ? Colors.green.shade100 : null,
          border: todo.completed
              ? Border.all(
                  color: Colors.green,
                )
              : null,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          title: Text(
            todo.title,
            style: TextStyle(
              color: todo.completed ? Colors.green : null,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: todo.completed
              ? const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                )
              : null,
        ),
      ),
    );
  }
} 
```

## 🧑‍💻 결과            

![Alt text](<Simulator Screen Recording - iPhone 14 Pro Max - 2023-08-09 at 17.15.31.gif>)