class UserIdGenerator 
{
  String generateId() {
    return 'user_${DateTime.now().millisecondsSinceEpoch}';
  }
}