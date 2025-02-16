import 'package:flutter/material.dart';

class CommunityDevelopmentPage extends StatelessWidget {
  const CommunityDevelopmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildServiceCard(
          context,
          'Events',
          'Local community events and gatherings',
          Icons.event,
        ),
        _buildServiceCard(
          context,
          'Volunteer',
          'Find volunteering opportunities',
          Icons.volunteer_activism,
        ),
        _buildServiceCard(
          context,
          'Education',
          'Local educational programs and workshops',
          Icons.school,
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
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Icon(icon, size: 48, color: Theme.of(context).primaryColor),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          description,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        onTap: () {
          // TODO: Implement service details page
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Opening $title...')),
          );
        },
      ),
    );
  }
}
