class Machine {
  final int? id;
  final String? image, title, distance;
  final List<String>? location; // lat, long
  final List<Object> stocks; // items in the machine {name, price, qty}

  Machine({
    required this.id,
    required this.image,
    required this.title,
    required this.location,
    required this.distance,
    required this.stocks,
  });

  factory Machine.fromJson(Map<String, dynamic> json) {
    return Machine(
      id: json['id'],
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
        'title': title,
        'location': location,
        'distance': distance,
        'stocks': stocks,
      };

  static List<Machine> getMachines() {
    return [];
  }

  // Sample data
  List sampleMachines = [
    {
      'id': 1,
      'image': 'assets/images/machine1.png',
      'title': 'Machine 1',
      'location': [1.3764566939567504, 103.80547380680981],
      'distance': '1.2km',
      'stocks': [
        {'name': 'Coke', 'price': 1.5, 'qty': 10},
        {'name': 'Sprite', 'price': 1.5, 'qty': 10},
        {'name': 'Fanta', 'price': 1.5, 'qty': 10},
        {'name': 'Pepsi', 'price': 1.5, 'qty': 10},
        {'name': 'Mountain Dew', 'price': 1.5, 'qty': 10},
        {'name': '7-Up', 'price': 1.5, 'qty': 10},
        {'name': 'Dr. Pepper', 'price': 1.5, 'qty': 10},
        {'name': 'A&W', 'price': 1.5, 'qty': 10},
        {'name': 'Root Beer', 'price': 1.5, 'qty': 10},
        {'name': 'Coke Zero', 'price': 1.5, 'qty': 10},
        {'name': 'Sprite Zero', 'price': 1.5, 'qty': 10},
        {'name': 'Fanta Zero', 'price': 1.5, 'qty': 10},
        {'name': 'Pepsi Zero', 'price': 1.5, 'qty': 10},
        {'name': 'Mountain Dew Zero', 'price': 1.5, 'qty': 10},
        {'name': '7-Up Zero', 'price': 1.5, 'qty': 10},
        {'name': 'Dr. Pepper Zero', 'price': 1.5, 'qty': 10},
        {'name': 'A&W Zero', 'price': 1.5, 'qty': 10},
        {'name': 'Root Beer Zero', 'price': 1.5, 'qty': 10},
      ],
    },
    {
      'id': 2,
      'image': 'assets/images/machine1.png',
      'title': 'Machine 2',
      'location': [1.3764566939567504, 103.80547380680981],
      'distance': '1.2km',
      'stocks': [
        {'name': 'Coke', 'price': 1.5, 'qty': 10},
        {'name': 'Sprite', 'price': 1.5, 'qty': 10},
        {'name': 'Fanta', 'price': 1.5, 'qty': 10},
        {'name': 'Pepsi', 'price': 1.5, 'qty': 10},
        {'name': 'Mountain Dew', 'price': 1.5, 'qty': 10},
        {'name': '7-Up', 'price': 1.5, 'qty': 10},
      ],
    },
  ];
}
