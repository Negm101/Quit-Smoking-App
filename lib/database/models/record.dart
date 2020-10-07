class Record {
  int userID;
  int recordID;
  String dateTime;
  int totalCig;

  Record({this.userID, this.recordID, this.dateTime, this.totalCig});

  Record.fromMap(Map<dynamic, dynamic> map) {
    this.userID = map['userID'];
    this.recordID = map['recordID'];
    this.dateTime = map['recordDateTime'];
    this.totalCig = map['recordTotalCig'];
  }

  Map<dynamic, dynamic> toMap() {
    return <dynamic, dynamic>{
      this.userID: 'userID',
      this.recordID: 'recordID',
      this.dateTime: 'recordDateTime',
      this.totalCig: 'recordTotalCig'
    };
  }
}
