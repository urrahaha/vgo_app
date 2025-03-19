import 'package:flutter/material.dart';

class CommunityProgramsPage extends StatefulWidget {
  const CommunityProgramsPage({super.key});

  @override
  State<CommunityProgramsPage> createState() => _CommunityProgramsPageState();
}

class _CommunityProgramsPageState extends State<CommunityProgramsPage> {
  // Set to keep track of expanded program cards
  final Set<String> _expandedCards = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community Programs'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildProgramCard(
            context,
            'Financial Assistance',
            'Apply for financial aid and subsidies',
            Icons.monetization_on,
            [
              'Low-Income Support',
              'Housing Subsidies',
              'Utility Bill Assistance',
              'Education Grants',
            ],
          ),
          _buildProgramCard(
            context,
            'Healthcare Programs',
            'Medical assistance and healthcare services',
            Icons.local_hospital,
            [
              'Medical Care Subsidies',
              'Vaccination Programs',
              'Mental Health Services',
              'Disability Support',
            ],
          ),
          _buildProgramCard(
            context,
            'Education & Training',
            'Education grants and skill development',
            Icons.school,
            [
              'Scholarship Programs',
              'Vocational Training',
              'Adult Education',
              'Student Loans',
            ],
          ),
          _buildProgramCard(
            context,
            'Employment Support',
            'Job placement and career development',
            Icons.work,
            [
              'Job Search Assistance',
              'Resume Building',
              'Career Coaching',
              'Unemployment Benefits',
            ],
          ),
          _buildProgramCard(
            context,
            'Family Services',
            'Support for families and children',
            Icons.family_restroom,
            [
              'Childcare Assistance',
              'Parenting Resources',
              'Family Counseling',
              'Child Welfare Services',
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProgramCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    List<String> programs,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final isExpanded = _expandedCards.contains(title);
    
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header - now clickable to expand/collapse
          InkWell(
            onTap: () {
              setState(() {
                if (isExpanded) {
                  _expandedCards.remove(title);
                } else {
                  _expandedCards.add(title);
                }
              });
            },
            child: Container(
              color: colorScheme.primaryContainer,
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(
                    icon,
                    size: 40,
                    color: colorScheme.onPrimaryContainer,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: colorScheme.onPrimaryContainer,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          description,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onPrimaryContainer,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: colorScheme.onPrimaryContainer,
                  ),
                ],
              ),
            ),
          ),
          
          // Programs List with animation
          AnimatedCrossFade(
            firstChild: const SizedBox(height: 0),
            secondChild: Column(
              children: programs.map((program) => ListTile(
                title: Text(program),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  _showApplicationDialog(context, program);
                },
              )).toList(),
            ),
            crossFadeState: isExpanded 
                ? CrossFadeState.showSecond 
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          ),
        ],
      ),
    );
  }

  void _showApplicationDialog(BuildContext context, String program) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(program),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Apply for $program assistance through our government portal.'),
              const SizedBox(height: 16),
              const Text('Required documents:'),
              const SizedBox(height: 8),
              const Text('• Valid ID or Passport'),
              const Text('• Proof of Address'),
              const Text('• Income Statement'),
              const Text('• Supporting Documents'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Show application submission confirmation
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Opening $program application portal...'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              child: const Text('Apply Now'),
            ),
          ],
        );
      },
    );
  }
} 