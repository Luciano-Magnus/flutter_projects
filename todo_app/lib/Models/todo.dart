class Todo {
  int _id;
  String _barcode;
  String _desc;
  String _date;

  Todo(this._barcode, this._date, [this._desc]);
  Todo.comId(this._id, this._barcode, this._date, [this._desc]);

  int get id => _id;

  String get barcode => _barcode;

  String get desc => _desc;

  String get date => _date;

  set barcode(String newTitle) {
    if (newTitle.length <= 255) {
      this._barcode = newTitle;
    }
  }

  set description(String newDesc) {
    if (newDesc.length <= 255) {
      this._desc = newDesc;
    }
  }

  set date(String newDate) {
    this._date = newDate;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['barcode'] = _barcode;
    map['desc'] = _desc;
    map['date'] = _date;

    return map;
  }

  Todo.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._barcode = map['barcode'];
    this._desc = map['desc'];
    this._date = map['date'];
  }
}
