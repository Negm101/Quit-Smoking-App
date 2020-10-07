class Missions {
  int id;
  String title;
  String details;

  Missions({this.id, this.title, this.details});

  Missions.fromMap(Map<dynamic, dynamic> map) {
    this.id = map['missionID'];
    this.title = map['missionTitle'];
    this.details = map['missionDetails'];
  }

  Map<dynamic, dynamic> toMap() {
    return <dynamic, dynamic>{
      this.id: 'userID',
      this.title: 'missionTitle',
      this.details: 'missionDetails',
    };
  }
}
