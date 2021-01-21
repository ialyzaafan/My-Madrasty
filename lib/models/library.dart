import 'package:madrasty/models/user.dart';

class Book {
  int id;
  String name;
  int borrowedDate;
  int returnDate;
  bool status;
  Book(this.id, this.name, this.borrowedDate, this.returnDate, this.status);
}

final Book avengers = new Book(1, 'End Game', 30, 20, false);
final Book avengers2 = new Book(1, 'Infinty War', 6, 50, false);
final Book avengers3 = new Book(1, 'Iron Man', 2, 30, false);

class Library {
  int id;
  User user;
  List<Book> books;
  Library(this.id, this.books, this.user);
}

final Library schoolLibrary =
    new Library(1, [avengers, avengers2, avengers3], spiderMan);
