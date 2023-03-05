class Transaction {
  final String id; // "dsadewq"
  final String title; // Transaction title
  final double amountSpent; // sum spent
  final DateTime dateOfTransaction; // when spent

  Transaction({
    required this.id, 
    required this.title, 
    required this.amountSpent, 
    required this.dateOfTransaction
  });
}
