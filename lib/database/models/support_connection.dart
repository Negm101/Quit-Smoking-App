class SupportConnection {
  int id;
  String title;
  String details;
  String facebookLink;
  String telegramLink;
  String whatsAppLink;
  String email;
  String websiteLink;
  String twitterLink;
  String phone;
  String instagramLink;

  SupportConnection({
    this.id,
    this.title,
    this.details,
    this.facebookLink,
    this.telegramLink,
    this.whatsAppLink,
    this.email,
    this.websiteLink,
    this.twitterLink,
    this.phone,
    this.instagramLink,
  });

  SupportConnection.fromMap(Map<dynamic, dynamic> map) {
    this.id = map['userID'];
    this.title = map['supportConnectionTitle'];
    this.details = map['supportConnectionDetails'];
    this.facebookLink = map['supportConnectionFacebookLink'];
    this.telegramLink = map['supportConnectionTelegramLink'];
    this.websiteLink = map['supportConnectionWhatsAppLink'];
    this.email = map['supportConnectionEmail'];
    this.websiteLink = map['supportConnectionWebsiteLink'];
    this.twitterLink = map['supportConnectionTwitterLink'];
    this.phone = map['supportConnectionPhone'];
    this.instagramLink = map['supportConnectionInstagramLink'];
  }

  Map<dynamic, dynamic> toMap() {
    return <dynamic, dynamic>{
      this.id: 'userID',
      this.title: 'supportConnectionTitle',
      this.details: 'supportConnectionDetails',
      this.facebookLink: 'supportConnectionFacebookLink',
      this.telegramLink: 'supportConnectionTelegramLink',
      this.whatsAppLink: 'supportConnectionWhatsAppLink',
      this.email: 'supportConnectionEmail',
      this.websiteLink: 'supportConnectionWebsiteLink',
      this.twitterLink: 'supportConnectionTwitterLink',
      this.phone: 'supportConnectionPhone',
      this.instagramLink: 'supportConnectionInstagramLink',
    };
  }
}
