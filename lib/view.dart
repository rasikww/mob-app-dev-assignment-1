class View{

  View();

  void printMainMenu(){
    print("--Library Management System--");
    print(" 0 - Exit");
    print(" 1 - Add A Book");
    print(" 2 - Remove A Book");
    print(" 3 - View Books");
    print(" Enter Option : ");
  }

  void printAddBookMenu(){
    print("--Add A Book--");
  }

  void printAddIsbn(){
    print("Enter ISBN No: ");
  }

  void printAddTitle(){
    print("Enter Title: ");
  }

  void printAddAuthor(){
    print("Enter Author: ");
  }

  void printAddPageCount(){
    print("Enter Page Count: ");
  }
  void printAddRating(){
    print("Enter Rating: ");
  }

  void printAddGenre(){
    print("Enter Genre: ");
  }

  void printRemoveMenu(){
    print("--Remove A Book--");
    print("Enter ISBN No: ");
  }

  void printErrorNoBook(){
    print(" Error : No such book");
  }

  void printErrorEnter(){
    print(" Error : Please enter correct values");
  }
  void printAddAgain(){
    print("Do you want to add another book?");
    print(" 0 - Exit");
    print(" 1 - Add A Book");
    print(" 2 - To Main Menu");
  }
  void printRemoveSubMenu(){
    print(" 0 - Exit");
    print(" 1 - Go back to Main Menu");
  }
  void printViewBooksMenu(){
    print("-- BookShelf -- ");
    print("following books are available");
  }
  void printViewBooksSubMenu(){
    print(" 0 - Exit");
    print(" 1 - Go back to Main Menu");
  }
}
