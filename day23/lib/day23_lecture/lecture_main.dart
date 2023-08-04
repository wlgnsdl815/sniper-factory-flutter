// ignore_for_file: public_member_api_docs, sort_constructors_first
class Word {
  // 멤버 변수
  String word;
  String meaning;
  String example;

  // 기본 생성자
  Word({
    required this.word,
    required this.meaning,
    required this.example,
  });

  // 이름있는 생성자 (fromMap)
  Word.fromMap(Map<String, dynamic> map)
      : word = map['word'],
        meaning = map['meaning'],
        example = map['example'];

  // 멤버 함수 (override)
  @override
  String toString() => 'Word($word / $meaning / $example)';

  // 멤버 함수 (override)
  @override
  operator ==(Object other) => other is Word && word == other.word;

  Map<String, dynamic> toMap() => {
        'word': word,
        'meaning': meaning,
        'example': example,
      };
}

void main() {
  Map<String, dynamic> networkData = {
    'word': 'Apple',
    'meaning': '사과',
    'example': 'Can I get an Apple?',
  };

  // 객체 생성
  var word = Word.fromMap(networkData);

  Word wordA = Word(word: 'Apple', meaning: '사과', example: 'Give me an apple');
  Word wordB = Word(word: 'Apple', meaning: '사과', example: 'Give me an apple');
}
