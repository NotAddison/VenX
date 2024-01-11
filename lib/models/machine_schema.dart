class Machine {
  final int id;
  String? distance;
  final String image, title, address;
  final List<double> location; // lat, long
  final List<Object> stocks;

  Machine({
    required this.id,
    required this.title,
    required this.image,
    required this.address,
    required this.location,
    this.distance = "0km",
    required this.stocks,
  });

  factory Machine.fromJson(Map<String, dynamic> json) {
    return Machine(
      id: json['id'],
      address: json['address'],
      image: json['image'],
      title: json['title'],
      location: json['location'],
      distance: json['distance'],
      stocks: json['stocks'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'address': address,
        'title': title,
        'location': location,
        'distance': distance,
        'stocks': stocks,
      };
}
