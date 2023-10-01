class OrgItem {
  final String id;
  final String name;
  final String address;
  final String site;

  const OrgItem({
    required this.id,
    required this.name,
    required this.address,
    required this.site
  });

  factory OrgItem.fromJson(Map<String, dynamic> json) {
    return OrgItem(
      id: json['organisasjonsnummer'],
      name: json['navn'],
      address: json['forretningsadresse']?['adresse']?[0] ?? '',
      site: json['hjemmeside'] ?? ''
    );
  }
}
