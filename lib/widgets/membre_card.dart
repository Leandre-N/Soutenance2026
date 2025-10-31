import 'package:flutter/material.dart';
import '../models/models_menbre.dart';
import '../theme.dart';

class MembreCard extends StatefulWidget {
  final FamilyMember member;

  const MembreCard({super.key, required this.member});

  @override
  State<MembreCard> createState() => _MembreCardState();
}

class _MembreCardState extends State<MembreCard> {
  bool _isHovered = false; // pour l'effet d'ombre verte

  @override
  Widget build(BuildContext context) {
    final m = widget.member;
    final double percent = m.adherencePercent.toDouble();
    final bool good = percent >= 80;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? AppColors.primary.withOpacity(0.4)
                  : Colors.black12,
              blurRadius: _isHovered ? 10 : 4,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            // photo
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage(m.photo),
                ),
                if (m.hasAlerts)
                  Positioned(
                    right: -4,
                    top: -4,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: const BoxDecoration(
                        color: AppColors.alert,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 12),

            // infos
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "${m.name}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Text(
                        "${m.adherencePercent}%",
                        style: TextStyle(
                          color: good ? AppColors.primary : AppColors.alert,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text("${m.role} • ${m.age} ans",
                      style:
                          const TextStyle(fontSize: 13, color: Colors.black54)),
                  const SizedBox(height: 6),
                  Text(
                    "${m.takenTreatments}/${m.totalTreatments} prises  •  ${m.totalTreatments} traitement(s)",
                    style: const TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.access_time,
                          size: 14, color: AppColors.primary),
                      const SizedBox(width: 4),
                      Text("Prochaine prise : ${m.nextDoseTime}",
                          style: const TextStyle(
                              fontSize: 13, color: AppColors.primary)),
                    ],
                  ),
                  if (m.hasAlerts) ...[
                    const SizedBox(height: 4),
                    Row(
                      children: const [
                        Icon(Icons.error_outline,
                            size: 14, color: AppColors.alert),
                        SizedBox(width: 4),
                        Text("Prise(s) manquée(s) aujourd’hui",
                            style: TextStyle(
                                color: AppColors.alert, fontSize: 13)),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
