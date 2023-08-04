// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intl/intl.dart';

class Article {
  String title;
  String thumbnailImg;
  String author;
  DateTime createdAt;

  Article({
    required this.title,
    required this.thumbnailImg,
    required this.author,
    required this.createdAt,
  });

  factory Article.fromMap(Map<String, dynamic> map) => Article(
        title: map['title'],
        thumbnailImg: map['thumbnailImg'],
        author: map['author'],
        createdAt: map['createdAt'],
      );

  String DateFormatting(DateTime date) {
    return DateFormat('d MMM y').format(date);
  }
}

List<Map<String, dynamic>> articleDataList = [
  {
    'title':
        'Webb telescope blasts off successfully — launching a new era in astronomy',
    'thumbnailImg':
        'https://media.springernature.com/w290h158/magazine-assets/d41586-021-03655-4/d41586-021-03655-4_19975876.jpg?as=webp',
    'author': 'Alexandra Witze',
    'createdAt': DateTime(2021, 12, 25),
  },
  {
    'title':
        'Researchers fear growing COVID vaccine hesitancy in developing nations',
    'thumbnailImg':
        'https://media.springernature.com/w290h158/magazine-assets/d41586-021-03830-7/d41586-021-03830-7_19972468.jpg?as=webp',
    'author': 'Smriti Mallapaty',
    'createdAt': DateTime(2021, 12, 23),
  },
  {
    'title': 'Fatal lab explosion in China highlights wider safety fears',
    'thumbnailImg':
        'https://media.springernature.com/w290h158/magazine-assets/d41586-021-03589-x/d41586-021-03589-x_19914054.jpg?as=webp',
    'author': 'Andrew Silver',
    'createdAt': DateTime(2021, 12, 22),
  },
  {
    'title': 'Journals adopt AI to spot duplicated images in manuscripts',
    'thumbnailImg':
        'https://media.springernature.com/w290h158/magazine-assets/d41586-021-03807-6/d41586-021-03807-6_19969476.jpg?as=webp',
    'author': 'Richard Van Noorden',
    'createdAt': DateTime(2021, 12, 21),
  },
  {
    'title': 'Omicron overpowers key COVID antibody treatments in early tests',
    'thumbnailImg':
        'https://media.springernature.com/w290h158/magazine-assets/d41586-021-03829-0/d41586-021-03829-0_19971406.jpg?as=webp',
    'author': 'Max Kozlov',
    'createdAt': DateTime(2021, 12, 21),
  },
  {
    'title': 'Afghanistan’s academics despair months after Taliban takeover',
    'thumbnailImg':
        'https://media.springernature.com/w290h158/magazine-assets/d41586-021-03787-7/d41586-021-03787-7_19966524.jpg?as=webp',
    'author': 'Smriti Mallapaty',
    'createdAt': DateTime(2021, 12, 17),
  },
  {
    'title': 'The science events to watch for in 2022',
    'thumbnailImg':
        'https://media.springernature.com/w290h158/magazine-assets/d41586-021-03772-0/d41586-021-03772-0_19962228.jpg?as=webp',
    'author': 'Davide Castelvecchi',
    'createdAt': DateTime(2021, 12, 17),
  },
];
