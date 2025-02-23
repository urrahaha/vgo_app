import 'package:flutter/material.dart';

class TransportAndDeliveryPage extends StatelessWidget {
  const TransportAndDeliveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildFoodDeliverySection(context),
        const SizedBox(height: 24),
        _buildRideSharingSection(context),
      ],
    );
  }

  Widget _buildFoodDeliverySection(BuildContext context) {
    final restaurants = [
      {
        'name': 'Burger Express',
        'rating': 4.5,
        'deliveryTime': '20-30 min',
        'image': Icons.lunch_dining,
        'cuisine': 'Fast Food',
      },
      {
        'name': 'Sushi Master',
        'rating': 4.8,
        'deliveryTime': '25-35 min',
        'image': Icons.set_meal,
        'cuisine': 'Japanese',
      },
      {
        'name': 'Pizza Palace',
        'rating': 4.3,
        'deliveryTime': '30-40 min',
        'image': Icons.local_pizza,
        'cuisine': 'Italian',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Food Delivery',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: restaurants.length,
          itemBuilder: (context, index) {
            final restaurant = restaurants[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                leading: Icon(
                  restaurant['image'] as IconData,
                  size: 40,
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: Text(restaurant['name'] as String),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(restaurant['cuisine'] as String),
                    Row(
                      children: [
                        Icon(Icons.star, size: 16, color: Colors.amber),
                        Text(' ${restaurant['rating']} • '),
                        Text(restaurant['deliveryTime'] as String),
                      ],
                    ),
                  ],
                ),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Opening ${restaurant['name']}...'),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildRideSharingSection(BuildContext context) {
    final rides = [
      {
        'type': 'Economy',
        'price': '\$12-15',
        'time': '3 min away',
        'icon': Icons.directions_car,
      },
      {
        'type': 'Comfort',
        'price': '\$18-22',
        'time': '5 min away',
        'icon': Icons.directions_car_filled,
      },
      {
        'type': 'Premium',
        'price': '\$25-30',
        'time': '7 min away',
        'icon': Icons.local_taxi,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ride Sharing',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        TextField(
          decoration: InputDecoration(
            hintText: 'Where to?',
            prefixIcon: Icon(Icons.location_on),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: rides.length,
          itemBuilder: (context, index) {
            final ride = rides[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                leading: Icon(
                  ride['icon'] as IconData,
                  size: 40,
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: Text(ride['type'] as String),
                subtitle: Text(ride['time'] as String),
                trailing: Text(
                  ride['price'] as String,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Booking ${ride['type']} ride...'),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
