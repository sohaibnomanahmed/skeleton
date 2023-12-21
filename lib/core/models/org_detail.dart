class OrgDetail {
  final String id;
  final String name;
  final String address;
  final String site;
  final int antallAnsatte;
  final String stiftelseDato;

  const OrgDetail(
      {required this.id,
      required this.name,
      required this.address,
      required this.site,
      required this.antallAnsatte,
      required this.stiftelseDato});

  factory OrgDetail.fromJson(Map<String, dynamic> json) {
    final dateFromJson = json['stiftelsesdato'];
    DateTime? date;
    if (dateFromJson != null) {
      date = DateTime.parse(dateFromJson);
    }

    return OrgDetail(
        id: json['organisasjonsnummer'], // TODO should not be null
        name: json['navn'] ?? '',
        address: json['forretningsadresse']?['adresse']?[0] ?? '',
        site: json['hjemmeside'] ?? '',
        antallAnsatte: json['antallAnsatte'] ?? -1,
        stiftelseDato:
            date == null ? '' : "${date.day}/${date.month}/${date.year}");
  }
}
