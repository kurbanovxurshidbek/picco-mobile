class MessageModel {
  final int id;
  final String name;
  final String img;


  const MessageModel({
    required this.id,
    required this.name,
    required this.img,
  });
}

///! data
List<MessageModel> messages = const [];
