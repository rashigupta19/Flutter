class Message {
  late String message;
  late int code;
  Message() {}
  Message.takeMessage({required this.message, required this.code});
  @override
  String toString() {
    return "Message $message and Code is $code";
  }
}
