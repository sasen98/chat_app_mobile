class ChatMessageModel {
  final int senderId;
  final int conversationId;
  final String? imageUrl;
  final String? videoUrl;
  final String? message;
  final String? voiceMessageUrl;
  const ChatMessageModel({
    required this.senderId,
    required this.conversationId,
    this.imageUrl,
    this.videoUrl,
    this.message,
    this.voiceMessageUrl,
  });
}

List<ChatMessageModel> dummyChatList = [
  const ChatMessageModel(
    conversationId: 1,
    senderId: 1,
    message: 'I am other person',
  ),
  const ChatMessageModel(
    conversationId: 1,
    senderId: 1,
    message: 'I am other person',
  ),
  const ChatMessageModel(
    conversationId: 1,
    senderId: 1,
    message: 'I am other person',
  ),
  const ChatMessageModel(
    conversationId: 1,
    senderId: 1,
    message: 'I am other person',
  ),
  const ChatMessageModel(
    conversationId: 1,
    senderId: 2,
    message: 'I am the person',
  ),
  const ChatMessageModel(
    conversationId: 1,
    senderId: 2,
    message: 'My account',
  ),
  const ChatMessageModel(
    conversationId: 1,
    senderId: 1,
    message: 'Not my account',
  ),
  const ChatMessageModel(
    conversationId: 1,
    senderId: 1,
    message: 'Eh lala thik cha',
  ),
  const ChatMessageModel(
      conversationId: 1, senderId: 1, message: 'gajab ko chat cha'),
  const ChatMessageModel(conversationId: 1, senderId: 2, message: 'thanks'),
  const ChatMessageModel(
      conversationId: 1,
      senderId: 2,
      imageUrl:
          'https://images.ctfassets.net/hrltx12pl8hq/4f6DfV5DbqaQUSw0uo0mWi/6fbcf889bdef65c5b92ffee86b13fc44/shutterstock_376532611.jpg?fit=fill&w=800&h=300'),
  const ChatMessageModel(
    conversationId: 1,
    senderId: 1,
    message: 'Shike bala ka bou',
  ),
  const ChatMessageModel(
    conversationId: 1,
    senderId: 2,
    message: 'Khattam ka Bou',
  ),
  const ChatMessageModel(
    conversationId: 1,
    senderId: 2,
    message: 'Maampakha khattam ka Bou',
  ),
  const ChatMessageModel(
    conversationId: 1,
    senderId: 1,
    message: 'Mwola ka Bou',
  ),
];
