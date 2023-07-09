class Operation {
  late  String _value;


  String get value => _value;

  set value(String value) {
    _value = value;
  }

  Operation(String value) {
    _value = value;
  }

  @override
  String toString() {
    return "$_value";
  }

  Map<String, dynamic> toMap() {
    return {
      'value': value,
    };
  }
}

