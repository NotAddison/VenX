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
    'price': 1.50,
    'qty': 20,
    'description':
        "High in fiber, promoting digestive health and providing essential nutrients."
  },
  {
    'name': 'Lentils',
    'price': 1.20,
    'qty': 15,
    'description':
        "Excellent source of plant-based protein, essential for muscle repair and overall health."
  },
  {
    'name': 'Quinoa',
    'price': 2.00,
    'qty': 10,
    'description':
        "Complete protein source with all essential amino acids, supporting muscle growth."
  },
  {
    'name': 'Oats',
    'price': 1.80,
    'qty': 8,
    'description':
        "Rich in beta-glucans, supporting heart health and maintaining cholesterol levels."
  },
  {
    'name': 'Whole Wheat Pasta',
    'price': 2.50,
    'qty': 12,
    'description':
        "High in complex carbohydrates for sustained energy during physical activities."
  },
  {
    'name': 'Dried Chickpeas',
    'price': 1.50,
    'qty': 18,
    'description':
        "Excellent plant-based protein source, aiding in muscle development and repair."
  },
  {
    'name': 'Tomato Sauce',
    'price': 2.00,
    'qty': 15,
    'description':
        "Contains lycopene, a powerful antioxidant with potential health benefits."
  },
  {
    'name': 'Mixed Vegetables',
    'price': 1.20,
    'qty': 10,
    'description':
        "Diverse vitamins and minerals for immune support and overall well-being."
  },
  {
    'name': 'Canned Salmon',
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
    'stocks': stock,
  },
  {
    'id': 2,
    'image': 'Placeholder',
    'title': 'Elephant',
    'address': '69 Redhill Cl, Singapore 150069',
    'location': [1.287216811317267, 103.81646122232127],
    'distance': null,
    'stocks': stock,
  },
  {
    'id': 3,
    'image': 'Placeholder',
    'title': 'Elephant',
    'address': '69 Redhill Cl, Singapore 150069',
    'location': [1.287216811317267, 103.81646122232127],
    'distance': null,
    'stocks': stock,
  },
  {
    'id': 4,
    'image': 'Placeholder',
    'title': 'Elephant',
    'address': '69 Redhill Cl, Singapore 150069',
    'location': [1.287216811317267, 103.81646122232127],
    'distance': null,
    'stocks': stock,
  },
  {
    'id': 5,
    'image': 'Placeholder',
    'title': 'Elephant',
    'address': '69 Redhill Cl, Singapore 150069',
    'location': [1.287216811317267, 103.81646122232127],
    'distance': null,
    'stocks': stock,
  },
  {
    'id': 6,
    'image': 'Placeholder',
    'title': 'Elephant',
    'address': '69 Redhill Cl, Singapore 150069',
    'location': [1.287216811317267, 103.81646122232127],
    'distance': null,
    'stocks': stock,
  },
  {
    'id': 7,
    'image': 'Placeholder',
    'title': 'Elephant',
    'address': '69 Redhill Cl, Singapore 150069',
    'location': [1.287216811317267, 103.81646122232127],
    'distance': null,
    'stocks': stock,
  },
  {
    'id': 8,
    'image': 'Placeholder',
    'title': 'Elephant',
    'address': '69 Redhill Cl, Singapore 150069',
    'location': [1.287216811317267, 103.81646122232127],
    'distance': null,
    'stocks': stock,
  },
];

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
