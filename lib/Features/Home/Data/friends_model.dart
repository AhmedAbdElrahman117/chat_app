class FriendsModel {
  final String id;
  final String name;

  FriendsModel({required this.id, required this.name});

  factory FriendsModel.fromMap(Map data, String id) {
    return FriendsModel(id: id, name: data['name']);
  }
}
