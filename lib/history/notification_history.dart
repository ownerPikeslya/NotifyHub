class NotificationHistory {
  static final NotificationHistory _instance = NotificationHistory._();
  NotificationHistory._();
  factory NotificationHistory() => _instance;


  final List<String> _history = [];
  List<String> get history => _history;

  void add(String text) => _history.add(text);

  void clear() => _history.clear();

  void showAll() => _history.forEach(print);



}
