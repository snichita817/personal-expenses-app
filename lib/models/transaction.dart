class Transaction {
  final String id; // "dsadewq"
   String title; // Transaction title
   double amountSpent; // sum spent
   DateTime dateOfTransaction; // when spent
  bool isDismissed = false;
  Transaction({
    required this.id, 
    required this.title, 
    required this.amountSpent, 
    required this.dateOfTransaction
  });
}
