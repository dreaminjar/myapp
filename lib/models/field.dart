class Field {
  final String id;
  final String name;
  final String variety;
  final String plantingDate;
  final double area;
  final String tasselCutDate;
  final String sprayingDate;

  Field({
    required this.id,
    required this.name,
    required this.variety,
    required this.plantingDate,
    required this.area,
    required this.tasselCutDate,
    required this.sprayingDate,
  });

  factory Field.fromJson(Map<String, dynamic> json) {
    return Field(
      id: json['id'],
      name: json['name'],
      variety: json['variety'],
      plantingDate: json['plantingDate'],
      area: json['area'].toDouble(),
      tasselCutDate: json['tasselCutDate'],
      sprayingDate: json['sprayingDate'],
    );
  }
}