class MenuItem {
  final int id;
  final String name;
  final String category;
  final int price;
  final String description;
  final double rating;
  final String badgeText;
  final String icon;

  const MenuItem({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.description,
    required this.rating,
    required this.badgeText,
    required this.icon,
  });
}

// DATA MENU ZECOFFE

const List<MenuItem> menuItems = [

  // COFFEE

  MenuItem(
    id: 1,
    name: 'Butterscotch',
    category: 'Coffee',
    price: 17000,
    description:
        'Kopi dengan perpaduan rasa butterscotch yang manis dan creamy.',
    rating: 4.8,
    badgeText: 'FAVORIT',
    icon: '☕',
  ),

  MenuItem(
    id: 2,
    name: 'Americano',
    category: 'Coffee',
    price: 18000,
    description:
        'Espresso dengan air mineral yang ringan dan menyegarkan.',
    rating: 4.7,
    badgeText: '',
    icon: '☕',
  ),

  MenuItem(
    id: 3,
    name: 'Dirty Latte',
    category: 'Coffee',
    price: 27000,
    description:
        'Perpaduan susu creamy dengan espresso yang kuat dan khas.',
    rating: 4.9,
    badgeText: 'BEST SELLER',
    icon: '☕',
  ),

  MenuItem(
    id: 4,
    name: 'Caramel Latte',
    category: 'Coffee',
    price: 20000,
    description:
        'Espresso dengan susu creamy dan sirup caramel yang manis.',
    rating: 4.8,
    badgeText: 'FAVORIT',
    icon: '☕',
  ),

  MenuItem(
    id: 5,
    name: 'Cafe Latte',
    category: 'Coffee',
    price: 15000,
    description:
        'Espresso dengan perpaduan susu steamed yang lembut dan creamy.',
    rating: 4.7,
    badgeText: '',
    icon: '☕',
  ),

  MenuItem(
    id: 6,
    name: 'Cappuccino',
    category: 'Coffee',
    price: 15000,
    description:
        'Espresso dengan susu steamed dan foam lembut di atasnya.',
    rating: 4.8,
    badgeText: 'FAVORIT',
    icon: '☕',
  ),

  // NON-COFFEE

  MenuItem(
    id: 7,
    name: 'Matcha Latte',
    category: 'Non-Coffee',
    price: 17000,
    description:
        'Minuman matcha creamy dengan rasa khas yang lembut.',
    rating: 4.9,
    badgeText: 'FAVORIT',
    icon: '🍵',
  ),

  MenuItem(
    id: 8,
    name: 'Chocolate Milk',
    category: 'Non-Coffee',
    price: 15000,
    description:
        'Susu cokelat dengan rasa manis dan tekstur creamy.',
    rating: 4.6,
    badgeText: '',
    icon: '🥛',
  ),

  MenuItem(
    id: 9,
    name: 'Strawberry Milk',
    category: 'Non-Coffee',
    price: 15000,
    description:
        'Susu creamy dengan rasa strawberry yang manis dan segar.',
    rating: 4.7,
    badgeText: 'FAVORIT',
    icon: '🍓',
  ),

  MenuItem(
    id: 10,
    name: 'Taro Latte',
    category: 'Non-Coffee',
    price: 23000,
    description:
        'Minuman taro creamy dengan rasa manis dan aroma khas.',
    rating: 4.6,
    badgeText: '',
    icon: '🥤',
  ),

  MenuItem(
    id: 11,
    name: 'Red Velvet',
    category: 'Non-Coffee',
    price: 25000,
    description:
        'Minuman red velvet creamy dengan rasa manis yang lembut.',
    rating: 4.8,
    badgeText: 'BARU',
    icon: '🍷',
  ),

  // BAKERY

  MenuItem(
    id: 12,
    name: 'Butter Croissant',
    category: 'Bakery',
    price: 20000,
    description:
        'Croissant renyah dengan aroma butter yang harum.',
    rating: 4.8,
    badgeText: 'FAVORIT',
    icon: '🥐',
  ),

  MenuItem(
    id: 13,
    name: 'Chocolate Muffin',
    category: 'Bakery',
    price: 15000,
    description:
        'Muffin cokelat lembut dengan taburan chocolate chips.',
    rating: 4.7,
    badgeText: 'BARU',
    icon: '🧁',
  ),

  // MAKANAN

  MenuItem(
    id: 14,
    name: 'Piscok',
    category: 'Makanan',
    price: 12000,
    description:
        'Pisang cokelat dengan kulit renyah yang cocok sebagai teman ngopi.',
    rating: 4.8,
    badgeText: 'FAVORIT',
    icon: '🍌',
  ),

  MenuItem(
    id: 15,
    name: 'Tahu Walik',
    category: 'Makanan',
    price: 12000,
    description:
        'Tahu walik renyah dengan isian gurih dan cocok untuk camilan.',
    rating: 4.7,
    badgeText: 'BARU',
    icon: '🍢',
  ),

  MenuItem(
    id: 16,
    name: 'French Fries',
    category: 'Makanan',
    price: 12000,
    description:
        'Kentang goreng renyah dengan rasa gurih yang cocok untuk sharing.',
    rating: 4.7,
    badgeText: '',
    icon: '🍟',
  ),

  MenuItem(
    id: 17,
    name: 'Chicken Wings',
    category: 'Makanan',
    price: 25000,
    description:
        'Potongan sayap ayam berbumbu dengan rasa gurih dan juicy.',
    rating: 4.8,
    badgeText: 'FAVORIT',
    icon: '🍗',
  ),

  MenuItem(
    id: 18,
    name: 'Beef Burger',
    category: 'Makanan',
    price: 30000,
    description:
        'Burger dengan patty beef juicy, sayuran segar, dan saus spesial.',
    rating: 4.9,
    badgeText: 'BEST SELLER',
    icon: '🍔',
  ),

  MenuItem(
    id: 19,
    name: 'Spaghetti Bolognese',
    category: 'Makanan',
    price: 18000,
    description:
        'Spaghetti dengan saus bolognese gurih dan daging cincang.',
    rating: 4.8,
    badgeText: '',
    icon: '🍝',
  ),

  MenuItem(
    id: 20,
    name: 'Chicken Sandwich',
    category: 'Makanan',
    price: 22000,
    description:
        'Roti lembut dengan ayam, sayuran segar, dan saus creamy.',
    rating: 4.7,
    badgeText: '',
    icon: '🥪',
  ),
];