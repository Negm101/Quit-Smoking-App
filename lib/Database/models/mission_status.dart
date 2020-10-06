class MissionStatus {
  int userID;
  int missionID;
  String status;

  MissionStatus({
    this.userID,
    this.missionID,
    this.status,
  });

  MissionStatus.fromMap(Map<dynamic, dynamic> map) {
    this.userID = map['userID'];
    this.missionID = map['missionsID'];
    this.status = map['status'];
  }

  Map<dynamic, dynamic> toMap() {
    return <dynamic, dynamic>{
      this.userID: 'userID',
      this.missionID: 'missionsID',
      this.status: 'status',
    };
  }
}
