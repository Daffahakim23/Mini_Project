class WatchlistTable {
  final int id;
  final String productName;
  final String image;

  WatchlistTable({
    required this.id,
    required this.productName,
    required this.image,
  });

  factory WatchlistTable.fromMap(Map<String, dynamic> map) => WatchlistTable(
        id: map["id"],
        productName: map["productName"],
        image: map["image"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "productName": productName,
        "image": image,
      };
}
