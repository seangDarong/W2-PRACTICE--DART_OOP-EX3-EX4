class CustomDuration {
  final int _milliseconds;

  const CustomDuration._(this._milliseconds);

  //constructor
  CustomDuration.fromHours(int hours) : _milliseconds = hours * 60 * 60 * 1000 {
    if (hours < 0)
      throw ArgumentError("Hour must be greataer or equal to zero");
  }

  CustomDuration.fromMinutes(int minutes)
    : _milliseconds = minutes * 60 * 1000 {
    if (minutes < 0)
      throw ArgumentError("minutes must be greataer or equal to zero");
  }

  CustomDuration.fromSeconds(int seconds) : _milliseconds = seconds * 1000 {
    if (seconds < 0)
      throw ArgumentError("seconds must be greataer or equal to zero");
  }

  //overloading operator
  bool operator >(CustomDuration other) {
    return _milliseconds > other._milliseconds;
  }

  CustomDuration operator +(CustomDuration other) {
    return CustomDuration._(_milliseconds + other._milliseconds);
  }

  CustomDuration operator -(CustomDuration other) {
    
      if (_milliseconds < other._milliseconds) {
        throw Exception("Cannot substract bigger number");
      }else{
        return CustomDuration._(_milliseconds - other._milliseconds);
      }
    
  }

  @override
  String toString() {
    return '$_milliseconds ms';
  }
}

main() {
  CustomDuration a = CustomDuration.fromHours(2);
  CustomDuration b = CustomDuration.fromHours(2);
  print(a > b);

  var sum = a + b;
  print(sum);

  var sub = a - b;
  print(sub);
}
