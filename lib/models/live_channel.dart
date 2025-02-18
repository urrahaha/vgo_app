class LiveChannel {
  final String id;
  final String title;
  final String sellerName;
  final String thumbnailUrl;
  final int viewerCount;
  final List<String> tags;
  final bool isPromoting;
  final String promotedItemName;
  final double promotedItemPrice;

  const LiveChannel({
    required this.id,
    required this.title,
    required this.sellerName,
    required this.thumbnailUrl,
    required this.viewerCount,
    required this.tags,
    required this.isPromoting,
    required this.promotedItemName,
    required this.promotedItemPrice,
  });
}

// Sample live channels
final List<LiveChannel> sampleLiveChannels = [
  LiveChannel(
    id: '1',
    title: '🔥 Flash Sale - Handmade Jewelry',
    sellerName: 'Artisan Crafts',
    thumbnailUrl: 'https://example.com/jewelry_stream.jpg',
    viewerCount: 127,
    tags: ['Jewelry', 'Handmade', 'Sale'],
    isPromoting: true,
    promotedItemName: 'Silver Pendant Necklace',
    promotedItemPrice: 49.99,
  ),
  LiveChannel(
    id: '2',
    title: 'Local Farm Fresh Products! 🌾',
    sellerName: 'Green Valley Farm',
    thumbnailUrl: 'https://example.com/farm_stream.jpg',
    viewerCount: 85,
    tags: ['Organic', 'Local', 'Fresh'],
    isPromoting: true,
    promotedItemName: 'Organic Vegetable Box',
    promotedItemPrice: 35.00,
  ),
  LiveChannel(
    id: '3',
    title: 'Vintage Collection Showcase 📚',
    sellerName: 'Retro Treasures',
    thumbnailUrl: 'https://example.com/vintage_stream.jpg',
    viewerCount: 64,
    tags: ['Vintage', 'Collectibles', 'Rare'],
    isPromoting: true,
    promotedItemName: 'Vintage Vinyl Records',
    promotedItemPrice: 75.00,
  ),
];
