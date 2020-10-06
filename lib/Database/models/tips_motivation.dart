class Tips {
  int id;
  String title;
  String details;
  String imageLink;

  Tips({this.id, this.title, this.details, this.imageLink});

  Tips.fromMap(Map<dynamic, dynamic> map) {
    this.id = map['tipsMotivationsID'];
    this.title = map['tipsMotivationsTitle'];
    this.details = map['tipsMotivationsDetails'];
    this.imageLink = map['tipsMotivationsImageLink'];
  }

  Map<dynamic, dynamic> toMap() {
    return <dynamic, dynamic>{
      this.id: 'tipsMotivationsID',
      this.title: 'tipsMotivationsTitle',
      this.details: 'tipsMotivationsDetails',
      this.imageLink: 'tipsMotivationsImageLink',
    };
  }
}
