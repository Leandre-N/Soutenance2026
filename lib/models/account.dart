class FamilyAccount {
  final String name;
  final int members;
  final int totalTreatments;
  final int alerts;

  FamilyAccount({
    required this.name,
    required this.members,
    required this.totalTreatments,
    required this.alerts,
  });

  FamilyAccount copyWith({
    String? name,
    int? members,
    int? totalTreatments,
    int? alerts,
  }) {
    return FamilyAccount(
      name: name ?? this.name,
      members: members ?? this.members,
      totalTreatments: totalTreatments ?? this.totalTreatments,
      alerts: alerts ?? this.alerts,
    );
  }
}
