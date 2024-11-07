class Book {
  String _isbn;
  String _title;
  String _author;
  int _pageCount;
  double _rating;
  String? _genre;

  Book(this._isbn, this._title, this._author, this._pageCount, this._rating,
      this._genre);

  String? get genre {
    return _genre?.isNotEmpty == true ? _genre : null;
  }

  set genre(String? value) {
    _genre = value;
  }

  double get rating => _rating;

  set rating(double value) {
    _rating = value;
  }

  int get pageCount => _pageCount;

  set pageCount(int value) {
    _pageCount = value;
  }

  String get author => _author;

  set author(String value) {
    _author = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  String get isbn => _isbn;

  set isbn(String value) {
    _isbn = value;
  }
}
