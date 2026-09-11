import 'package:flutter/material.dart';
import 'package:ema_greenlink_app/l10n/app_localizations.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00A86B),
        foregroundColor: Colors.white,
        title: Semantics(
          label: 'Profil utilisateur',
          child: Text(l10n.profile),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Semantics(
              label: 'Avatar de Marc ADOKINSSI',
              child: const CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xFF00A86B),
                child: Icon(Icons.person, size: 60, color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Marc ADOKINSSI',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text('marc@emadigital.bj',
                style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 24),
            _buildInfoCard(
                icon: Icons.location_on,
                title: l10n.location,
                value: 'Houègbo, Bénin'),
            _buildInfoCard(
                icon: Icons.business,
                title: l10n.company,
                value: 'EMA Digital'),
            _buildInfoCard(icon: Icons.star, title: l10n.plan, value: 'Pro'),
            _buildInfoCard(
                icon: Icons.shopping_bag,
                title: l10n.orders,
                value: '12 commandes'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Semantics(
      label: '$title: $value',
      child: Card(
        margin: const EdgeInsets.only(bottom: 12),
        child: ListTile(
          leading: Icon(icon, color: const Color(0xFF00A86B)),
          title:
              Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          subtitle: Text(value),
        ),
      ),
    );
  }
}
