void main() {
  //takeOrder(); // 2 Sec
  giveData();
}

giveData() {
  Stream st = Stream.periodic(Duration(seconds: 2), (int value) {
    print("Value is $value");
  });
  st.listen((data) {
    print("Listen the Data $data");
  }, onError: (err) {
    print("Error is $err");
  }, onDone: () {
    print("Done...");
  });
}

takeOrder() {
  Future.delayed(Duration(seconds: 2), () {
    print("Order Booked ....");
  });
}
