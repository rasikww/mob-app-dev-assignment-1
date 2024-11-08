import 'package:lms/book.dart';
import 'package:lms/input.dart';
import 'package:lms/view.dart';

class Controller {
  static Map<String, Book> bookShelf = {};

  var view = View();
  var input = Input();

  void flow() {
    L7:
    while (true) {
      view.printMainMenu();
      int optionNumber;
      while (true) {
        try {
          optionNumber = int.parse(input.getInput());
          break;
        } on Exception {
          view.printErrorEnter();
        }
      }
      switch (optionNumber) {
        L2:
        case 0:
          input.systemExit();
        L3:
        case 1:
          {
            Book? newBook;
            L1:
            while (true) {
              newBook = createBook();
              if (newBook == null) {
                continue;
              } else {
                break;
              }
            }
            addBookToShelf(newBook);
            print("book added, ${newBook.title}");
            view.printAddAgain();
            int optNum = int.parse(input.getInput());
            if (optNum == 0) {
              continue L2;
            } else if (optNum == 1) {
              continue L3;
            } else if (optNum == 2) {
              continue L7;
            } else {
              continue L6;
            }
          }
        L4:
        case 2:
          {
            R1:
            while (true) {
              view.printRemoveMenu();
              String removeIsbn;
              try {
                removeIsbn = input.getInput();
                if (!bookShelf.containsKey(removeIsbn)) {
                  view.printErrorNoBook();
                  continue R1;
                } else {
                  Book? removedBook = bookShelf[removeIsbn];
                  bookShelf.remove(removeIsbn);
                  print("Book titled: ${removedBook?.title} was deleted");
                  R2:
                  while (true) {
                    view.printRemoveSubMenu();
                    int optRemove;
                    try {
                      optRemove = int.parse(input.getInput());
                      if (optRemove == 0) {
                        continue L2;
                      } else if (optRemove == 1) {
                        continue L7;
                      }
                    } on Exception {
                      view.printErrorEnter();
                      continue R2;
                    }
                  }
                }
              } on Exception {
                view.printErrorEnter();
                continue R1;
              }
            }
          }
        L5:
        case 3:
          {
            V1:
            while (true) {
              view.printViewBooksMenu();
              showShelf();
              view.printViewBooksSubMenu();
              try {
                var viewOption = int.parse(input.getInput());
                if (viewOption == 0) {
                  input.systemExit();
                } else if (viewOption == 1) {
                  continue L7;
                } else {
                  view.printErrorEnter();
                  continue V1;
                }
              } on Exception {
                view.printErrorEnter();
                continue V1;
              }
            }
          }
        L6:
        default:
          view.printErrorEnter();
          continue L7;
      }
      break L7;
    }
  }

  Book? createBook() {
    Book? book;
    view.printAddBookMenu();
    view.printAddIsbn();
    String isbn = input.getInput();
    view.printAddTitle();
    String title = input.getInput();
    view.printAddAuthor();
    String author = input.getInput();
    view.printAddPageCount();
    String pageCount = input.getInput();
    view.printAddRating();
    String rating = input.getInput();
    view.printAddGenre();
    String genre = input.getInput();
    try {
      book = Book(isbn, title, author, int.parse(pageCount),
          double.parse(rating), genre);
    } on Exception {
      print("Error Occurred");
    }
    return book;
  }

  void addBookToShelf(Book book) {
    bookShelf[book.isbn] = book;
  }

  void showShelf() {
    if (bookShelf.isEmpty) {
      print("-- No books available --");
    } else {
      Controller.bookShelf.forEach((key, value) => print(
          "$key, Book: ${value.title} by Author ${value.author} of ${value.genre} Genre with rating of ${value.rating}"));
    }
  }
}
