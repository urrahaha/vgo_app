import 'package:flutter/material.dart';

class TransportAndDeliveryPage extends StatelessWidget {
  const TransportAndDeliveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildServiceCard(
          context,
          'Local Delivery',
          'Request delivery services within your community',
          Icons.local_shipping,
        ),
        _buildServiceCard(
          context,
          'Ride Sharing',
          'Share rides with community members',
          Icons.directions_car,
        ),
        _buildServiceCard(
          context,
          'Public Transport',
          'Local bus and transport schedules',
          Icons.directions_bus,
        ),
      ],
    );
  }

  Widget _buildServiceCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Icon(
          icon,
          size: 48,
          color: colorScheme.primary,
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          description,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Opening $title...')),
          );
        },
      ),
    );
  }
}
