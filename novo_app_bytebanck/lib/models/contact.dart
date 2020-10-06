class Contact{
  final int id;
  final String name;
  final int accontNumber;

  Contact(this.id, this.name, this.accontNumber);

  @override
  String toString() {
    return 'Contact{id = $id, name: $name, accontNumber: $accontNumber}';
  }
}