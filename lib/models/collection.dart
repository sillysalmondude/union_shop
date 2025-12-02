class Collection {
  final String id;
  final String name;
  final String description;
  final String asset;

  Collection({
    required this.id,
    required this.name,
    required this.description,
    required this.asset,
  });

  factory Collection.fromJson(Map<String, dynamic> json) {
    return Collection(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      asset: json['asset'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'asset': asset,
    };
  }
}
