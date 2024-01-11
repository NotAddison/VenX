import 'package:http/http.dart' as http;
import 'dart:convert';

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
  {
    'title': 'Benefits of Regular Exercise',
    'body':
        "Make exercise a regular part of your routine! Whether it's brisk walking, jogging, or hitting the gym, regular physical activity improves cardiovascular health, boosts mood, and helps maintain a healthy weight. Find an activity you enjoy and make it a habit!",
    'image': 'https://source.unsplash.com/random/200x200?sig=1',
    'author': 'FitLifestyle',
    'date': '11/11/2024',
  },
  {
    'title': 'Sleep Well for a Healthy Life',
    'body':
        "Prioritize quality sleep for overall well-being. Create a relaxing bedtime routine, limit screen time before bed, and ensure your sleep environment is comfortable. Quality sleep is essential for physical and mental health.",
    'image': 'https://source.unsplash.com/random/200x200?sig=1',
    'author': 'SleepWell',
    'date': '11/12/2024',
  },
  {
    'title': 'The Art of Gratitude',
    'body':
        "Cultivate a grateful mindset for a healthier and happier life. Take time each day to reflect on the positive aspects of your life. Practicing gratitude has been linked to improved mental well-being and a more positive outlook on life.",
    'image': 'https://source.unsplash.com/random/200x200?sig=1',
    'author': 'GratitudeGuru',
    'date': '11/13/2024',
  },
  {
    'title': 'Healthy Habits for a Strong Immune System',
    'body':
        "Support your immune system with healthy habits. Eat a balanced diet, exercise regularly, get enough sleep, and manage stress. These lifestyle choices contribute to a robust immune system, helping you stay well.",
    'image': 'https://source.unsplash.com/random/200x200?sig=1',
    'author': 'ImmuneWarrior',
    'date': '11/14/2024',
  },
  {
    'title': 'Embrace the Power of Positive Thinking',
    'body':
        "Positive thinking can impact your health and well-being. Focus on the good in your life, practice self-compassion, and surround yourself with positivity. A positive mindset can lead to better mental and physical health.",
    'image': 'https://source.unsplash.com/random/200x200?sig=1',
    'author': 'PositivityChampion',
    'date': '11/15/2024',
  },
];

List sampleMachines = [
  {
    'id': 1,
    'image': 'Placeholder',
    'title': 'Elephant',
    'address': 'address',
    'location': [1.3521, 103.8198],
    'distance': null,
    'stocks': [
      {'name': 'Brown Rice', 'price': 1.5, 'qty': 20},
      {'name': 'Lentils', 'price': 1.2, 'qty': 15},
      {'name': 'Quinoa', 'price': 2.0, 'qty': 10},
      {'name': 'Oats', 'price': 1.8, 'qty': 8},
      {'name': 'Whole Wheat Pasta', 'price': 2.5, 'qty': 12},
      {'name': 'Dried Chickpeas', 'price': 1.5, 'qty': 18},
      {'name': 'Tomato Sauce', 'price': 2.0, 'qty': 15},
      {'name': 'Mixed Vegetables', 'price': 1.2, 'qty': 10},
      {'name': 'Canned Salmon', 'price': 3.0, 'qty': 12}
    ]
  },
  {
    'id': 2,
    'image': 'Placeholder',
    'title': 'Phoenix',
    'address': 'address',
    'location': [1.2956, 103.8936],
    'distance': null,
    'stocks': [
      {'name': 'Quinoa', 'price': 2.0, 'qty': 20},
      {'name': 'Brown Lentils', 'price': 1.2, 'qty': 15},
      {'name': 'Whole Wheat Couscous', 'price': 1.5, 'qty': 10},
      {'name': 'Buckwheat', 'price': 2.5, 'qty': 8},
      {'name': 'Chia Seeds', 'price': 3.0, 'qty': 12},
      {'name': 'Black Beans', 'price': 1.8, 'qty': 18},
      {'name': 'Soy Sauce', 'price': 1.0, 'qty': 15},
      {'name': 'Dried Seaweed', 'price': 1.5, 'qty': 10},
      {'name': 'Sesame Oil', 'price': 2.2, 'qty': 12}
    ]
  },
  {
    'id': 3,
    'image': 'Placeholder',
    'title': 'Lion',
    'address': 'address',
    'location': [1.2904, 103.8514],
    'distance': null,
    'stocks': [
      {'name': 'Couscous', 'price': 1.8, 'qty': 20},
      {'name': 'Split Peas', 'price': 1.2, 'qty': 15},
      {'name': 'Bulgur', 'price': 2.0, 'qty': 10},
      {'name': 'Wild Rice', 'price': 2.5, 'qty': 8},
      {'name': 'Barley', 'price': 2.2, 'qty': 12},
      {'name': 'Red Lentils', 'price': 1.5, 'qty': 18},
      {'name': 'Salsa', 'price': 1.0, 'qty': 15},
      {'name': 'Olive Oil', 'price': 2.5, 'qty': 10},
      {'name': 'Dried Herbs Mix', 'price': 1.2, 'qty': 12}
    ]
  }
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
