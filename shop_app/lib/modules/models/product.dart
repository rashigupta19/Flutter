class Product {
  late String id;
  late String name;
  late double price;
  late double qty;
  late String desc;
  late String url;
  Product() {}

  Map<String, dynamic> toJSON() {
    return {"name": name, "desc": desc, "price": price, "qty": qty, "url": url};
  }

  Product.takeProduct(
      {this.id = "0",
      required this.name,
      required this.price,
      required this.qty,
      required this.desc,
      this.url =
          "https://d316acfc88wber.cloudfront.net/global/phones/spark8T/SPARK8T-blue.png"});
  @override
  String toString() {
    return "Id $id Name $name Price $price Qty $qty Desc $desc URL $url";
  }
}
