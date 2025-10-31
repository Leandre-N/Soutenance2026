import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/membre_card.dart';
import '../models/models_menbre.dart';
import '../models/account.dart';

class FamilyDashboardScreen extends StatefulWidget {
  const FamilyDashboardScreen({super.key});

  @override
  State<FamilyDashboardScreen> createState() => _FamilyDashboardScreenState();
}

class _FamilyDashboardScreenState extends State<FamilyDashboardScreen> {
  late FamilyAccount account;
  late List<FamilyMember> members;

  @override
  void initState() {
    super.initState();
    account = FamilyAccount(
      name: "Leandre Randy",
      members: 4,
      totalTreatments: 7,
      alerts: 1,
    );

    members = [
      FamilyMember(
        id: '1',
        name: 'Marie Dubois',
        role: 'Mère',
        age: 68,
        photo: 'assets/images/marie.png',
        totalTreatments: 3,
        takenTreatments: 2,
        nextDoseTime: '14:00',
        adherencePercent: 40,
        hasAlerts: true,
      ),
      FamilyMember(
        id: '2',
        name: 'Jean Dubois',
        role: 'Père',
        age: 72,
        photo: 'assets/images/jean.png',
        totalTreatments: 4,
        takenTreatments: 4,
        nextDoseTime: '20:00',
        adherencePercent: 100,
      ),
      FamilyMember(
        id: '3',
        name: 'Sophie Martin',
        role: 'Fille',
        age: 28,
        photo: 'assets/images/sophie.png',
        totalTreatments: 1,
        takenTreatments: 1,
        nextDoseTime: '--',
        adherencePercent: 100,
      ),
      FamilyMember(
        id: '4',
        name: 'Lucas Martin',
        role: 'Fils',
        age: 18,
        photo: 'assets/images/lucas.png',
        totalTreatments: 3,
        takenTreatments: 2,
        nextDoseTime: '22:00',
        adherencePercent: 67,
      ),
    ];
  }

  void _openAddMember() {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Formulaire ajout membre à venir')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            // partie haute déjà créée
            FamilyHeader(
              account: account,
              onOpenNotifications: () {},
              onOpenSettings: () {},
            ),

            // titre + bouton ajouter
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Membres",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: _openAddMember,
                    icon: const Icon(Icons.add, size: 18),
                    label: const Text("Ajouter"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ],
              ),
            ),

            // liste des membres
            Expanded(
              child: ListView.builder(
                itemCount: members.length,
                itemBuilder: (context, index) {
                  return MembreCard(member: members[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
