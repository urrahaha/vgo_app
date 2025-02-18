class MarketplaceItem {
  final String id;
  final String title;
  final String description;
  final double price;
  final String seller;
  final String category;
  final String location;
  final String imageUrl;
  final DateTime postedDate;

  const MarketplaceItem({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.seller,
    required this.category,
    required this.location,
    required this.imageUrl,
    required this.postedDate,
  });
}

// Sample marketplace items
final List<MarketplaceItem> sampleItems = [
  MarketplaceItem(
    id: '1',
    title: 'Mountain Bike',
    description: 'Barely used mountain bike in excellent condition. Perfect for trails and city riding.',
    price: 299.99,
    seller: 'John Smith',
    category: 'Sports & Outdoors',
    location: 'Downtown',
    imageUrl: 'https://example.com/bike.jpg',
    postedDate: DateTime.now().subtract(const Duration(days: 2)),
  ),
  MarketplaceItem(
    id: '2',
    title: 'Handmade Pottery Set',
    description: 'Beautiful 4-piece pottery set, locally made. Includes bowls and plates.',
    price: 89.99,
    seller: 'Sarah Chen',
    category: 'Home & Garden',
    location: 'Artisan District',
    imageUrl: 'https://example.com/pottery.jpg',
    postedDate: DateTime.now().subtract(const Duration(days: 1)),
  ),
  MarketplaceItem(
    id: '3',
    title: 'Study Desk',
    description: 'Wooden study desk with drawers. Good condition, minor wear.',
    price: 150.00,
    seller: 'Mike Johnson',
    category: 'Furniture',
    location: 'University Area',
    imageUrl: 'https://example.com/desk.jpg',
    postedDate: DateTime.now().subtract(const Duration(hours: 12)),
  ),
  MarketplaceItem(
    id: '4',
    title: 'Guitar with Case',
    description: 'Acoustic guitar with hard case. Great for beginners.',
    price: 199.99,
    seller: 'Emma Wilson',
    category: 'Musical Instruments',
    location: 'Music District',
    imageUrl: 'https://example.com/guitar.jpg',
    postedDate: DateTime.now().subtract(const Duration(hours: 5)),
  ),
  MarketplaceItem(
    id: '5',
    title: 'Fresh Local Honey',
    description: 'Organic honey from local beekeepers. 500ml jar.',
    price: 12.99,
    seller: 'Local Bee Farm',
    category: 'Food & Beverages',
    location: 'Farmers Market',
    imageUrl: 'https://example.com/honey.jpg',
    postedDate: DateTime.now().subtract(const Duration(hours: 1)),
  ),
];
