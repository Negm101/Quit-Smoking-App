class User {
  int id;
  String email;
  String password;
  String type;
  String name;
  String currency;
  double pricePerPack;
  int cigPerPack;
  int cigPerDay;
  String quitDate;

  User(
      {this.id,
      this.email,
      this.password,
      this.type,
      this.name,
      this.currency,
      this.pricePerPack,
      this.cigPerPack,
      this.cigPerDay,
      this.quitDate});

  User.fromMap(Map<dynamic, dynamic> map) {
    this.id = map['userID'];
    this.email = map['userEmail'];
    this.password = map['userPassword'];
    this.type = map['userProfileType'];
    this.name = map['userProfileName'];
    this.currency = map['userProfileCurrency'];
    this.pricePerPack = map['userProfilePricePerPack'];
    this.cigPerPack = map['userProfileCigPerPack'];
    this.cigPerDay = map['userProfileCigPerDay'];
    this.quitDate = map['userProfileQuitDate'];
  }

  Map<dynamic, dynamic> toMap() {
    return <dynamic, dynamic>{
      this.id: 'userID',
      this.email: 'userEmail',
      this.password: 'userPassword',
      this.type: 'userProfileType',
      this.name: 'userProfileName',
      this.currency: 'userProfileCurrency',
      this.pricePerPack: 'userProfilePricePerPack',
      this.cigPerPack: 'userProfileCigPerPack',
      this.cigPerDay: 'userProfileCigPerDay',
      this.quitDate: 'userProfileQuitDate',
    };
  }
}
