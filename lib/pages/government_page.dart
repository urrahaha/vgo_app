import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'public_services_page.dart';
import 'community_programs_page.dart';

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
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PublicServicesPage()),
            );
          },
        ),
        _buildServiceCard(
          context,
          'Community Programs',
          'NGO and government-sponsored programs',
          Icons.group_work,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CommunityProgramsPage()),
            );
          },
        ),
        _buildServiceCard(
          context,
          'Emergency Services',
          'Contact local emergency services',
          CupertinoIcons.exclamationmark_circle,
        ),
      ],
    );
  }

  Widget _buildServiceCard(
    BuildContext context,
    String title,
    String description,
    IconData icon, {
    VoidCallback? onTap,
  }) {
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
        onTap: onTap ?? () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Opening $title...')),
          );
        },
      ),
    );
  }
}
