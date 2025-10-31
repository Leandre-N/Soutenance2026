class FamilyMember {
  final String id;
  final String name;
  final String role;
  final int age;
  final String photo;
  final int totalTreatments;
  final int takenTreatments;
  final String nextDoseTime;
  final int adherencePercent;
  final bool hasAlerts;

  FamilyMember({
    required this.id,
    required this.name,
    required this.role,
    required this.age,
    required this.photo,
    required this.totalTreatments,
    required this.takenTreatments,
    required this.nextDoseTime,
    required this.adherencePercent,
    this.hasAlerts = false,
  });
}
