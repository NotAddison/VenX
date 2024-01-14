// Schema
import '../models/post_schema.dart';
import '../models/machine_schema.dart';

// NOTE:
// Yes, I know. This code is not clean and optimized
// This is just for a quick demo, so I'm not going to spend too much time on it :(

// Sample data
List samplePosts = [
  {
    'title': 'Healthy Cooking Made Easy',
    'body':
        "Transform your meals with nutritious and delicious recipes! Explore new cooking techniques, incorporate whole foods, and experiment with herbs and spices. Eating healthy doesn't have to be boring – make it an enjoyable culinary adventure!",
    'image': 'https://source.unsplash.com/random/200x200?sig=1',
    'author': 'KitchenExplorer',
    'date': '11/10/2024',
  },
  {
    'title': 'The Power of Green Smoothies',
    'body':
        "Discover the amazing benefits of green smoothies! Packed with vitamins and nutrients, these delicious drinks can boost your energy, improve digestion, and support overall well-being. Start your day right with a refreshing green smoothie.",
    'image': 'https://source.unsplash.com/random/200x200?sig=2',
    'author': 'WellnessEnthusiast',
    'date': '11/2/2024',
  },
  {
    'title': 'Mindful Eating for a Healthier You',
    'body':
        "Practice mindful eating to foster a healthier relationship with food. Slow down, savor each bite, and pay attention to your body's hunger and fullness cues. This simple habit can lead to better digestion and weight management.",
    'image': 'https://source.unsplash.com/random/200x200?sig=3',
    'author': 'MindfulEater',
    'date': '11/3/2024',
  },
  {
    'title': 'Fuel Your Body with Colorful Foods',
    'body':
        "Add a burst of color to your plate! Eating a variety of fruits and vegetables ensures you get a wide range of nutrients. Aim for a rainbow of colors to maximize the health benefits and support your immune system.",
    'image': 'https://source.unsplash.com/random/200x200?sig=5',
    'author': 'NutritionNinja',
    'date': '11/5/2024',
  },
  {
    'title': 'Healthy Snacking Habits',
    'body':
        "Say goodbye to unhealthy snacks! Opt for nutritious alternatives like fresh fruits, nuts, and yogurt. These snacks not only satisfy your cravings but also provide essential nutrients to keep you energized throughout the day.",
    'image': 'https://source.unsplash.com/random/200x200?sig=7',
    'author': 'SnackSmart',
    'date': '11/7/2024',
  },
  {
    'title': 'Hydration Tips for a Healthier You',
    'body':
        "Stay hydrated for optimal health! Drinking enough water is essential for digestion, skin health, and overall well-being. Carry a reusable water bottle and aim to drink at least 8 glasses of water a day.",
    'image': 'https://source.unsplash.com/random/200x200?sig=8',
    'author': 'HydrationHero',
    'date': '11/8/2024',
  },
];

List<dynamic> stock = [
  {
    'name': 'Brown Rice',
    'image': 'brown_rice.png',
    'price': 1.50,
    'qty': 20,
    'description':
        "High in fiber, promoting digestive health and providing essential nutrients."
  },
  {
    'name': 'Lentils',
    'image': 'lentils.png',
    'price': 2.00,
    'qty': 15,
    'description':
        "Excellent source of plant-based protein, essential for muscle repair and overall health."
  },
  {
    'name': 'Quinoa',
    'image': 'quinoa.png',
    'price': 2.00,
    'qty': 10,
    'description':
        "Complete protein source with all essential amino acids, supporting muscle growth."
  },
  {
    'name': 'Oats',
    'image': 'oats.png',
    'price': 1.80,
    'qty': 8,
    'description':
        "Rich in beta-glucans, supporting heart health and maintaining cholesterol levels."
  },
  {
    'name': 'Dried Chickpeas',
    'image': 'chickpeas.png',
    'price': 1.50,
    'qty': 18,
    'description':
        "Excellent plant-based protein source, aiding in muscle development and repair."
  },
  {
    'name': 'Tomato Sauce',
    'image': 'tomato.png',
    'price': 1.00,
    'qty': 15,
    'description':
        "Contains lycopene, a powerful antioxidant with potential health benefits."
  },
  {
    'name': 'Mixed Vegetables',
    'image': 'mixed_vegetables.png',
    'price': 1.00,
    'qty': 10,
    'description':
        "Diverse vitamins and minerals for immune support and overall well-being."
  },
  {
    'name': 'Canned Salmon',
    'image': 'salmon.png',
    'price': 3.00,
    'qty': 12,
    'description':
        "High in omega-3 fatty acids, promoting brain health and reducing inflammation."
  }
];

List sampleMachines = [
  {
    'id': 1,
    'image': 'Placeholder',
    'title': 'Elephant',
    'address': '69 Redhill Cl, Singapore 150069',
    'location': [1.287216811317267, 103.81646122232127],
    'distance': null,
    'stocks': cloneStockList(stock),
  },
  {
    'id': 2,
    'image': 'Placeholder',
    'title': 'Pheonix',
    'address': '11 Lor 3 Toa Payoh, Block D 01-42, Singapore 319579',
    'location': [1.3367956795714648, 103.84942359664112],
    'distance': null,
    'stocks': cloneStockList(stock),
  },
  {
    'id': 3,
    'image': 'Placeholder',
    'title': 'Lion',
    'address': '3D Upper Boon Keng Rd, Singapore 384003',
    'location': [1.3135303600362163, 103.87278147510393],
    'distance': null,
    'stocks': cloneStockList(stock),
  },
  {
    'id': 4,
    'image': 'Placeholder',
    'title': 'Add',
    'address': '570 Hougang St 51, Singapore 530570',
    'location': [1.3811643596381038, 103.88974611769578],
    'distance': null,
    'stocks': cloneStockList(stock),
  },
  {
    'id': 5,
    'image': 'Placeholder',
    'title': 'Wolf',
    'address': '9 Toh Yi Dr, Singapore 590009',
    'location': [1.3384951786570325, 103.77347409840742],
    'distance': null,
    'stocks': cloneStockList(stock),
  },
  {
    'id': 6,
    'image': 'Placeholder',
    'title': 'Fubuki',
    'address': '308 Woodlands Ave 1, Singapore 730308',
    'location': [1.429804924836768, 103.77646612390481],
    'distance': null,
    'stocks': cloneStockList(stock),
  },
  {
    'id': 7,
    'image': 'Placeholder',
    'title': 'Hashimoto Nagasaki',
    'address': '132 Yishun Street 11, Singapore 760132',
    'location': [1.4335441271092835, 103.83149945419166],
    'distance': null,
    'stocks': cloneStockList(stock),
  },
  {
    'id': 8,
    'image': 'Placeholder',
    'title': 'Nagi',
    'address': '308 Jurong East Street 32, Singapore 600308',
    'location': [1.347479155351851, 103.73464003673377],
    'distance': null,
    'stocks': cloneStockList(stock),
  },
  {
    'id': 9,
    'image': 'Placeholder',
    'title': 'Kagi',
    'address': '450F Tampines Street 42, Singapore 526450',
    'location': [1.3576468579408312, 103.95303008918617],
    'distance': null,
    'stocks': cloneStockList(stock),
  },
  // {
  //   'id': 10,
  //   'image': 'Placeholder',
  //   'title': 'Hashi',
  //   'address': '472 Jurong West Street 41, Singapore 640472',
  //   'location': [1.348165258454928, 103.72234511026434],
  //   'distance': null,
  //   'stocks': stock,
  // },
];

List<dynamic> cloneStockList(List<dynamic> originalStock) {
  // Function to create a deep copy of the stock list
  return originalStock.map((stockItem) => Map.from(stockItem)).toList();
}

// ignore: non_constant_identifier_names
List<Machine> MACHINES_CACHE = [];
// ignore: non_constant_identifier_names
List<Machine> FAVORITES_CACHE = [];
// ignore: non_constant_identifier_names
List<Post> POSTS_CACHE = [];

// Get all posts
Future<List<Post>> getPosts() async {
  if (POSTS_CACHE.isEmpty) {
    var res = samplePosts;
    List<Post> posts = [];
    for (var i = 0; i < res.length; i++) {
      posts.add(Post.fromJson(res[i]));
    }
    POSTS_CACHE = posts;
  }
  return POSTS_CACHE;
}

// Get all machines
Future<List<Machine>> getMachines() async {
  if (MACHINES_CACHE.isEmpty) {
    var res = sampleMachines;
    List<Machine> machines = [];
    for (var i = 0; i < res.length; i++) {
      machines.add(Machine.fromJson(res[i]));
    }
    MACHINES_CACHE = machines;
  }
  return MACHINES_CACHE;
}

// Update stock
Future<void> updateStock({
  required int machineId,
  required String name,
  required int qty,
}) async {
  // Get machine
  Machine machine =
      MACHINES_CACHE.firstWhere((machine) => machine.id == machineId);

  // Get stock (dynamic)
  var stock = machine.stocks.firstWhere((stock) => stock['name'] == name);

  // Update qty
  stock['qty'] = qty;

  // Update machine
  MACHINES_CACHE.firstWhere((machine) => machine.id == machineId).stocks =
      machine.stocks;
}

// Get all favorites
Future<List<Machine>> getFavorites() async {
  return FAVORITES_CACHE;
}

// Manage favorites
Future<void> manageFavorites({required Machine machine}) async {
  if (FAVORITES_CACHE.contains(machine)) {
    FAVORITES_CACHE.remove(machine);
  } else {
    FAVORITES_CACHE.add(machine);
  }
}

// Check if machine is favorited
Future<bool> isFavorited({required Machine machine}) async {
  return FAVORITES_CACHE.contains(machine);
}

// Add post
Future<void> addPost({required Post post}) async {
  POSTS_CACHE.insert(0, post);
}
