import 'package:flutter/material.dart';
import '../models/account.dart';
import '../theme.dart';

class FamilyHeader extends StatelessWidget {
  final FamilyAccount account;
  final VoidCallback onOpenNotifications;
  final VoidCallback onOpenSettings;

  const FamilyHeader({
    super.key,
    required this.account,
    required this.onOpenNotifications,
    required this.onOpenSettings,
  });

  Widget _badgeIcon({required IconData icon, required String? badge, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white24),
            child: Icon(icon, color: Colors.white, size: 20),
          ),
          if (badge != null && badge.isNotEmpty)
            Positioned(
              right: -6,
              top: -6,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.alert,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white, width: 1.2),
                ),
                child: Text(badge, style: const TextStyle(color: Colors.white, fontSize: 11)),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // hauteur ajustable selon design ; ici responsive
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, Color(0xFF16A085)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ligne du haut : titre + icônes
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("SantéVibes",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text("Suivi médical familial",
                        style: TextStyle(color: Colors.white70, fontSize: 13)),
                  ],
                ),
              ),

              // notifications + settings
              Row(
                children: [
                  _badgeIcon(
                    icon: Icons.notifications,
                    badge: account.alerts > 0 ? "${account.alerts}" : null,
                    onTap: onOpenNotifications,
                  ),
                  const SizedBox(width: 12),
                  _badgeIcon(
                    icon: Icons.settings,
                    badge: null,
                    onTap: onOpenSettings,
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 16),

          // carte du chef de famille
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.12),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.white.withOpacity(0.14)),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 26,
                  backgroundColor: Colors.white24,
                  child: Icon(Icons.person, color: Colors.white, size: 30),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // nom du compte (modifié plus tard par backend)
                      Text(account.name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      const Text("Compte Chef de Famille",
                          style: TextStyle(color: Colors.white70, fontSize: 12)),
                      const SizedBox(height: 8),
                      Text(
                        "${account.members} membres • ${account.totalTreatments} traitements",
                        style: const TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 14),

          // 3 petites cartes de stats (patients / traitements / alertes)
          Row(
            children: [
              _smallStat(label: "Malades", value: "${account.members}", color: Colors.white),
              const SizedBox(width: 10),
              _smallStat(label: "Traitements", value: "${account.totalTreatments}", color: Colors.white),
              const SizedBox(width: 10),
              _smallStat(label: "Alertes", value: "${account.alerts}", color: AppColors.alert),
            ],
          ),
        ],
      ),
    );
  }

  Widget _smallStat({required String label, required String value, required Color color}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.12),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color)),
            const SizedBox(height: 10),
            Text(label, style: const TextStyle(fontSize: 15, color: Colors.white70)),
          ],
        ),
      ),
    );
  }
}
