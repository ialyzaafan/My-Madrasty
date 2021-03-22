import 'package:madrasty/models/user.dart';

class Book {
  int id;
  String name;
  DateTime borrowedDate;
  DateTime returnDate;
  bool status;
  Book(this.id, this.name, this.borrowedDate, this.returnDate, this.status);
}

final Book avengers = new Book(
    1,
    'End Game',
    DateTime(DateTime.now().year, 02, 04),
    DateTime(DateTime.now().year, 02, 14),
    false);
final Book avengers2 = new Book(
    1,
    'Infinty War',
    DateTime(DateTime.now().year, 02, 04),
    DateTime(DateTime.now().year, 02, 14),
    false);
final Book avengers3 = new Book(
    1,
    'Iron Man',
    DateTime(DateTime.now().year, 02, 04),
    DateTime(DateTime.now().year, 02, 14),
    false);

class Library {
  int id;
  User user;
  List<Book> books;
  Library(this.id, this.books, this.user);
}

final Library schoolLibrary =
    new Library(1, [avengers, avengers2, avengers3], spiderMan);
