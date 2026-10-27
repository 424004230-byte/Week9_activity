class VendingMachine {
  String location;
  double _balance = 0.0;
  Map<String, double> _inventory = {};

  VendingMachine(this.location, Map<String, double> initialInventory) {
    _inventory = Map.from(initialInventory);
  }

  double get balance => _balance;

  void insertMoney(double amount) {
    if (amount > 0) {
      _balance += amount;
      print("[$location] Inserted: \$$amount. Current balance: \$$_balance");
    }
  }

  void purchaseItem(String itemName) {
    if (!_inventory.containsKey(itemName)) {
      print("[$location] Item '$itemName' is not available.");
      return;
    }

    double price = _inventory[itemName]!;

    if (_balance >= price) {
      _balance -= price;
      print("[$location] Dispensing $itemName. Remaining balance: \$$_balance");
    } else {
      print("[$location] Insufficient funds for $itemName. Price: \$$price, Balance: \$$_balance");
    }
  }
}

void main() {
  Map<String, double> campusStock = {'Chips': 1.50, 'Soda': 2.00, 'Candy': 1.00};
  Map<String, double> officeStock = {'Coffee': 2.50, 'Water': 1.00, 'Sandwich': 4.50};

  List<VendingMachine> machines = [
    VendingMachine('Library Hall', campusStock),
    VendingMachine('Main Lobby', officeStock),
  ];

  machines[0].insertMoney(3.00);
  machines[0].purchaseItem('Soda');
  print("Library Machine Balance Check: \$${machines[0].balance}\n");

  machines[1].insertMoney(2.00);
  machines[1].purchaseItem('Sandwich');
  machines[1].purchaseItem('Water');
}
