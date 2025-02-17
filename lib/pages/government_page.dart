import 'package:flutter/material.dart';

class GovernmentAndNGOPage extends StatelessWidget {
  const GovernmentAndNGOPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildServiceCard(
          context,
          'Public Services',
          'Access local government services and information',
          Icons.account_balance,
        ),
        _buildServiceCard(
          context,
          'Community Programs',
          'NGO and government-sponsored programs',
          Icons.group_work,
        ),
        _buildServiceCard(
          context,
          'Emergency Services',
          'Contact local emergency services',
          Icons.emergency,
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
