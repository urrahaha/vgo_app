import 'package:flutter/material.dart';
import '../models/marketplace_item.dart';
import '../models/live_channel.dart';

class MarketplacePage extends StatefulWidget {
  const MarketplacePage({super.key});

  @override
  State<MarketplacePage> createState() => _MarketplacePageState();
}

class _MarketplacePageState extends State<MarketplacePage> {
  String _selectedCategory = 'All';
  final _searchController = TextEditingController();
  bool _showLiveChannels = false;

  final List<String> _categories = [
    'All',
    'Sports & Outdoors',
    'Home & Garden',
    'Furniture',
    'Musical Instruments',
    'Food & Beverages',
  ];

  List<MarketplaceItem> get _filteredItems {
    return sampleItems.where((item) {
      final matchesCategory =
          _selectedCategory == 'All' || item.category == _selectedCategory;
      final matchesSearch =
          _searchController.text.isEmpty ||
              item.title.toLowerCase().contains(
                _searchController.text.toLowerCase(),
              ) ||
              item.description.toLowerCase().contains(
                _searchController.text.toLowerCase(),
              );
      return matchesCategory && matchesSearch;
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Local Marketplace'), centerTitle: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Search Bar
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search items...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: (value) => setState(() {}),
                ),
                const SizedBox(height: 16),
                // Categories
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _categories.length,
                    itemBuilder: (context, index) {
                      final category = _categories[index];
                      final isSelected = category == _selectedCategory;
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: FilterChip(
                          selected: isSelected,
                          label: Text(category),
                          onSelected: (selected) {
                            setState(() {
                              _selectedCategory = category;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                // Live Channels Toggle
                Row(
                  children: [
                    Text(
                      'Live Product Promotions',
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleMedium,
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Theme
                            .of(context)
                            .colorScheme
                            .primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'LIVE',
                        style: Theme
                            .of(context)
                            .textTheme
                            .labelSmall
                            ?.copyWith(
                          color: Theme
                              .of(context)
                              .colorScheme
                              .onPrimary,
                        ),
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _showLiveChannels = !_showLiveChannels;
                        });
                      },
                      child: Row(
                        children: [
                          Text(_showLiveChannels ? 'Hide' : 'Show'),
                          Icon(
                            _showLiveChannels
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // Live Channels List
                if (_showLiveChannels) ...[
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 220,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: sampleLiveChannels.length,
                      itemBuilder: (context, index) {
                        final channel = sampleLiveChannels[index];
                        return Card(
                          margin: const EdgeInsets.only(right: 16),
                          child: InkWell(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Live stream feature coming soon!',
                                  ),
                                ),
                              );
                            },
                            child: SizedBox(
                              width: 280,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Thumbnail
                                  Container(
                                    height: 120,
                                    decoration: BoxDecoration(
                                      color:
                                      Theme
                                          .of(
                                        context,
                                      )
                                          .colorScheme
                                          .primaryContainer,
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(12),
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Center(
                                          child: Icon(
                                            Icons.play_circle,
                                            size: 48,
                                            color:
                                            Theme
                                                .of(
                                              context,
                                            )
                                                .colorScheme
                                                .primary,
                                          ),
                                        ),
                                        Positioned(
                                          top: 8,
                                          right: 8,
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 4,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                              BorderRadius.circular(12),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const Icon(
                                                  Icons.remove_red_eye,
                                                  size: 16,
                                                  color: Colors.white,
                                                ),
                                                const SizedBox(width: 4),
                                                Text(
                                                  '${channel.viewerCount}',
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 8,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          channel.title,
                                          style:
                                          Theme
                                              .of(
                                            context,
                                          )
                                              .textTheme
                                              .titleMedium,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          channel.sellerName,
                                          style:
                                          Theme
                                              .of(
                                            context,
                                          )
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          'Promoting: ${channel
                                              .promotedItemName} - \$${channel
                                              .promotedItemPrice
                                              .toStringAsFixed(2)}',
                                          style: Theme
                                              .of(
                                            context,
                                          )
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                            color:
                                            Theme
                                                .of(
                                              context,
                                            )
                                                .colorScheme
                                                .primary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ],
            ),
          ),
          // Items List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _filteredItems.length,
              itemBuilder: (context, index) {
                final item = _filteredItems[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: InkWell(
                    onTap: () => _showItemDetails(context, item),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Item Image
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color:
                              Theme
                                  .of(
                                context,
                              )
                                  .colorScheme
                                  .primaryContainer,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.image,
                              size: 40,
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .primary,
                            ),
                          ),
                          const SizedBox(width: 16),
                          // Item Details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.title,
                                  style:
                                  Theme
                                      .of(context)
                                      .textTheme
                                      .titleMedium,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '\$${item.price.toStringAsFixed(2)}',
                                  style: Theme
                                      .of(
                                    context,
                                  )
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                    color:
                                    Theme
                                        .of(context)
                                        .colorScheme
                                        .primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  item.location,
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .bodyMedium,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  _getTimeAgo(item.postedDate),
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .bodySmall,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: const Icon(Icons.add_box_outlined),
                      title: const Text('Post New Item'),
                      onTap: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Post item feature coming soon!'),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.live_tv),
                      title: const Text('Start Livestream'),
                      onTap: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Post item feature coming soon!'),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  String _getTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }

  void _showItemDetails(BuildContext context, MarketplaceItem item) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder:
          (context) =>
          DraggableScrollableSheet(
            initialChildSize: 0.9,
            maxChildSize: 0.9,
            minChildSize: 0.5,
            builder:
                (context, scrollController) =>
                Container(
                  decoration: BoxDecoration(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .surface,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: ListView(
                    controller: scrollController,
                    padding: const EdgeInsets.all(24),
                    children: [
                      // Image Placeholder
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: Theme
                              .of(context)
                              .colorScheme
                              .primaryContainer,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.image,
                          size: 64,
                          color: Theme
                              .of(context)
                              .colorScheme
                              .primary,
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Title and Price
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              item.title,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headlineSmall,
                            ),
                          ),
                          Text(
                            '\$${item.price.toStringAsFixed(2)}',
                            style: Theme
                                .of(
                              context,
                            )
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Location and Category
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 16,
                            color: Theme
                                .of(context)
                                .colorScheme
                                .primary,
                          ),
                          const SizedBox(width: 4),
                          Text(item.location),
                          const SizedBox(width: 16),
                          Icon(
                            Icons.category,
                            size: 16,
                            color: Theme
                                .of(context)
                                .colorScheme
                                .primary,
                          ),
                          const SizedBox(width: 4),
                          Text(item.category),
                        ],
                      ),
                      const SizedBox(height: 24),
                      // Description
                      Text(
                        'Description',
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item.description,
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyMedium,
                      ),
                      const SizedBox(height: 24),
                      // Seller Info
                      Text(
                        'Seller Information',
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor:
                            Theme
                                .of(context)
                                .colorScheme
                                .primary,
                            child: const Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.seller,
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .titleSmall,
                              ),
                              Text(
                                'Member since Jan 2025',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .bodySmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      // Contact Button
                      FilledButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Contact seller feature coming soon!',
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.message),
                        label: const Text('Contact Seller'),
                      ),
                    ],
                  ),
                ),
          ),
    );
  }
}