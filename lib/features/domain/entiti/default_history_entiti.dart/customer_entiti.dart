class CustomerEntiti {
  final String type;
  final String id;
  final String name;
  final String surname;
  final dynamic comment;
  final String gender;
  final bool inBlacklist;
  final dynamic blacklistReason;
  final dynamic birthdate;

  CustomerEntiti({
    required this.type,
    required this.id,
    required this.name,
    required this.surname,
    required this.comment,
    required this.gender,
    required this.inBlacklist,
    required this.blacklistReason,
    required this.birthdate,
  });
}
