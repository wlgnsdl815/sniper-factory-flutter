// ignore_for_file: file_names

void main() {
  List myFriends = ['Teddy', 'Chris', 'Juno'];
  print(myFriends); // [Teddy, Chris, Juno]
  print(myFriends.asMap().entries.map((e) =>
      e.value +
      "'s house (${e.key})")); // (Teddy's house (0), Chris's house (1), Juno's house (2))
  print(myFriends.map((e) =>
      e +
      "'s house (0)")); // (Teddy's house (0), Chris's house (0), Juno's house (0))
}
