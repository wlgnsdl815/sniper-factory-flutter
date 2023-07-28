// ignore_for_file: avoid_print

void main() {
  var myMoney = 4500;
  var accountMoney = 4000000;
  var minTaxiFare = 4800;
  var iPadPrice = 1000000;
  var iPhonePrice = 960000;
  var friend1Name = "Teddy";
  var friend2Name = "Chris";
  var friend3Name = "Juno";
  var mathScore = [59, 24, 62, 44, 94, 61, 42];
  var minPassScore = 80;
  var emailAddress = 'dkanrjskclrl';
  var phoneNum = '010-1000-';
  var password = '1234';

  // 1.
  if (myMoney >= minTaxiFare) {
    print('1. 가능');
  } else {
    print('1. 불가능');
  }

  // 2.
  if (myMoney >= iPadPrice) {
    print('2. 가능');
  } else {
    print('2. 불가능');
  }

  // 3.
  if (accountMoney >= iPadPrice + iPhonePrice) {
    print('3. 가능');
  } else {
    print('3. 불가능');
  }

  // 4.
  if (accountMoney > iPadPrice * 5) {
    print('4. 가능');
  } else {
    print('4. 불가능');
  }

  // 5.
  String names = friend1Name + friend2Name + friend3Name;
  int namesLength = names.length;
  if (namesLength > 10) {
    print('5. ${namesLength - 10}글자 넘습니다.');
  } else {
    print('5. 넘지 않습니다.');
  }

  // 6.
  if (mathScore[0] > minPassScore) {
    print('6. 합격');
  } else {
    print('6. 불합격');
  }

  // 7.
  if (mathScore[0] + mathScore[1] > mathScore[4]) {
    print('7. 0번째 점수와 1번째 점수 합이 높습니다.');
  } else {
    print('7. 4번째 점수가 높습니다.');
  }

  // 8.
  if (emailAddress.contains('@')) {
    print('8. @가 있습니다. 확인완료');
  } else {
    print('8. @가 없습니다.');
  }

  // 9.
  int phoneNumLength = phoneNum.length;
  if (phoneNumLength == 13 && phoneNum.contains('-')) {
    print('9. 글자 수가 맞습니다.');
  } else {
    print('9. 글자 수가 부족합니다.');
  }

  // 10.
  bool phoneNumCheck(String phonNum) {
    var regExp = RegExp(r'^010-([0-9]{4})-([0-9]{4})$');
    // RegExp()함수는 정규식을 사용하기 위한 함수이다.
    // r을 앞에 붙여서 ''를 원시 문자열로 나타낼 수 있다.
    // ^는 문자열의 시작, $는 문자열의 끝을 나타낸다
    // 해석하면 위 정규식은 010-(0부터 9까지 숫자){4개}-(0부터 9까지 숫자){4개}를 나타낸다.

    var filteredNum = phoneNum.replaceAll(RegExp(r'[^\d-]'), '');
    // replaceAll()은 첫번째 매개변수(RegExp(r'[^\d-]'))를 찾아서 두번째 매개변수('')로 전부 바꾼다.
    // RegExp(r'[^\d-]')에서  \d는 숫자, -은 -을 나타낸다. 또한 [] 괄호는 반대를 의미한다.
    // 즉 RegExp(r'[^\d-]')의 뜻은 "숫자와 -를 제외한" 이라는 뜻이 된다.
    // 결과적으로 filteredNum은 phoneNum에서 숫자와 하이픈을 제외한 모든 것을 제거한 결과가 담겨있다.

    if (regExp.hasMatch(filteredNum) && filteredNum.length == 13) {
      return true;
    } else {
      return false;
    }
  }

  print(phoneNumCheck(phoneNum));

  // 11.
  if (password.length < 8) {
    print('11. 비밀번호는 최소 8자 이상을 입력해주세요.');
  } else {
    print('11. 비밀번호 자리 수가 충분합니다.');
  }

  // 12.
  bool passwordValidator(String password) {
    if (password.length > 8) {
      return true;
    } else {
      return false;
    }
  }

  print(passwordValidator(password));
}
