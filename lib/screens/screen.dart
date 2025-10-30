import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../models/account.dart';

class FamilyDashboardScreen extends StatelessWidget {
  const FamilyDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final account = FamilyAccount(
      name: "Leandre Randy",
      members: 4,
      totalTreatments: 7,
      alerts: 1,
    );

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            FamilyHeader(
              account: account,
              onOpenNotifications: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Notifications')));
              },
              onOpenSettings: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Paramètres')));
              },
            ),
            // placeholder pour le reste de l'écran
            Expanded(
              child: Center(child: Text('Contenu principal (liste des membres)')),
            ),
          ],
        ),
      ),
    );
  }
}
