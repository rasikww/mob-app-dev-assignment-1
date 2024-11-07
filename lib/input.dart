import 'dart:io';

class Input{
  String getInput(){
    String? dataIn = stdin.readLineSync();
    if (dataIn == null) throw Exception("No input");
    return dataIn;
  }
  void systemExit(){
    exit(0);
  }
}