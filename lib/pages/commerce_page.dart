import 'package:flutter/material.dart';

class CommerceAndTradePage extends StatelessWidget {
  const CommerceAndTradePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildServiceCard(
          context,
          'Local Marketplace',
          'Buy and sell items within your community',
          Icons.shopping_cart,
        ),
        _buildServiceCard(
          context,
          'Business Directory',
          'Find local businesses and services',
          Icons.business,
        ),
        _buildServiceCard(
          context,
          'Job Board',
          'Local job opportunities and skilled workers',
          Icons.work,
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
