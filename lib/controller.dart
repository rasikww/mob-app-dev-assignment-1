import 'package:lms/book.dart';
import 'package:lms/input.dart';
import 'package:lms/view.dart';

class Controller{
  static Map<String,Book> bookShelf = {};

  var view = View();
  var input = Input();

  void flow(){
    view.printMainMenu();
    int optionNumber;
    while (true) {
      try{
        optionNumber = int.parse(input.getInput());
        break;
      }on Exception {
        view.printErrorEnter();
      }
    }
    switch(optionNumber){
      case 0 :  input.systemExit();
      case 1 :  {
        Book? newBook;
        while (true) {
          newBook = createBook();
          if (newBook == null) {
            continue;
          }else{
            break;
          }
        }
        addBookToShelf(newBook);
        print("book added, ${newBook.title}");
      }
      case 2 :  {

      }
      default : view.printErrorEnter();
    }

    showShelf();

  }

  Book? createBook(){
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
      book = Book(isbn, title, author, int.parse(pageCount), double.parse(rating), genre);
    } on Exception {
      print("Error Occurred");
    }
      return book;
  }

  void addBookToShelf(Book book){
    bookShelf[book.isbn] = book;

  }
  void showShelf(){
    Controller.bookShelf.forEach((key, value) => print("$key, Book: ${value.title} by ${value.author}"));
  }
}