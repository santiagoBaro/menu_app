class Availability {
  final List<bool> monday;
  final List<bool> tuesday;
  final List<bool> wednesday;
  final List<bool> thursday;
  final List<bool> friday;
  final List<bool> saturday;
  final List<bool> sunday;
  final List<AvailabilityException> exceptions;

  Availability(
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
    this.exceptions,
  );

  Availability.fromJson(Map json)
      : monday = json['monday'],
        tuesday = json['tuesday'],
        wednesday = json['wednesday'],
        thursday = json['thursday'],
        friday = json['friday'],
        saturday = json['saturday'],
        sunday = json['sunday'],
        exceptions = json['exceptions'];
}

class AvailabilityException {
  final DateTime date;
  final List<bool> hours;

  AvailabilityException(
    this.date,
    this.hours,
  );

  AvailabilityException.fromJson(Map json)
      : date = json['date'],
        hours = json['hours'];
}
