// Schema
import '../models/post_schema.dart';
import '../models/machine_schema.dart';

// Sample data
List samplePosts = [
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
    'title': 'Outdoor Activities for Fitness Fun',
    'body':
        "Ditch the gym and embrace outdoor activities! Whether it's hiking, biking, or a simple jog in the park, staying active in nature can improve your physical and mental well-being. Get moving and enjoy the great outdoors!",
    'image': 'https://source.unsplash.com/random/200x200?sig=4',
    'author': 'ActiveLifestyle',
    'date': '11/4/2024',
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
    'title': 'Morning Yoga Routine for Flexibility',
    'body':
        "Start your day with a rejuvenating yoga routine! Stretching and breathing exercises can improve flexibility, reduce stress, and enhance your overall well-being. Set aside a few minutes each morning for a mindful yoga session.",
    'image': 'https://source.unsplash.com/random/200x200?sig=6',
    'author': 'YogaEnthusiast',
    'date': '11/6/2024',
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
  {
    'title': 'Discover the Benefits of Meditation',
    'body':
        "Take a moment to quiet your mind through meditation. Regular meditation can reduce stress, improve focus, and enhance mental clarity. Find a comfortable space, close your eyes, and let the calming effects of meditation wash over you.",
    'image': 'https://source.unsplash.com/random/200x200?sig=9',
    'author': 'ZenMaster',
    'date': '11/9/2024',
  },
  {
    'title': 'Healthy Cooking Made Easy',
    'body':
        "Transform your meals with nutritious and delicious recipes! Explore new cooking techniques, incorporate whole foods, and experiment with herbs and spices. Eating healthy doesn't have to be boring – make it an enjoyable culinary adventure!",
    'image': 'https://source.unsplash.com/random/200x200?sig=1',
    'author': 'KitchenExplorer',
    'date': '11/10/2024',
  },
];

List sampleMachines = [
  {
    'id': 1,
    'image': 'Placeholder',
    'title': 'Elephant',
    'address': '69 Redhill Cl, Singapore 150069',
    'location': [1.287216811317267, 103.81646122232127],
    'distance': null,
    'stocks': [
      {'name': 'Brown Rice', 'price': 1.50, 'qty': 20},
      {'name': 'Lentils', 'price': 1.20, 'qty': 15},
      {'name': 'Quinoa', 'price': 2.00, 'qty': 10},
      {'name': 'Oats', 'price': 1.80, 'qty': 8},
      {'name': 'Whole Wheat Pasta', 'price': 2.50, 'qty': 12},
      {'name': 'Dried Chickpeas', 'price': 1.50, 'qty': 18},
      {'name': 'Tomato Sauce', 'price': 2.00, 'qty': 15},
      {'name': 'Mixed Vegetables', 'price': 1.20, 'qty': 10},
      {'name': 'Canned Salmon', 'price': 3.00, 'qty': 12}
    ]
  },
];

// Get all posts
Future<List<Post>> getPosts() async {
  // TODO: API Request
  var res = samplePosts;

  // Create list of posts
  List<Post> posts = [];
  for (var i = 0; i < res.length; i++) {
    posts.add(Post.fromJson(res[i]));
  }
  return posts;
}

// Get all machines
Future<List<Machine>> getMachines() async {
  // TODO: API Request
  var res = sampleMachines;

  // Create list of machines
  List<Machine> machines = [];
  for (var i = 0; i < res.length; i++) {
    machines.add(Machine.fromJson(res[i]));
  }
  return machines;
}
