Future<int> cube(num) {
  return Future.value(num * num * num);
}

asynTask() {
  print("i am in asyn first line ");
  Future.delayed(Duration(seconds: 5), () {
    //Future(seconds , callback function())
    print("will call after 5 seconds");
  });

  print("i am in last od asyn function");
}

void main() {
  //asynTask();
  print("I am first ");

  Future<int> future = cube(3);

  future.then((value) => print(value)).catchError((err) => print(err));
  print("main is ended ");
}
