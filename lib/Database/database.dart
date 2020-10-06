import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
}

Database _database;

Future<Database> get database async {
  if (_database != null)
    return _database;

  // if _database is null we instantiate it
  _database = await initDB();
  return _database;
}


initDB() async {
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String path = join(documentsDirectory.path, "QUIT.db");
  return await openDatabase(path, version: 1, onOpen: (db) {
  }, onCreate: (Database db, int version) async {
    await db.execute("CREATE TABLE USER ("
        "userID                  INT auto_increment unique not null primary key,"
        "userEmail               VARCHAR(320),"
        "userPassword            VARCHAR(20),"
        "userProfileType         VARCHAR(20),"
        "userProfileName         VARCHAR(50),"
        "userProfileCurrency     VARCHAR(3),"
        "userProfilePricePerPack DECIMAL(19, 2),"
        "userProfileCigPerPack   INT,"
        "userProfileCigPerDay    int,"
        "userProfileQuitDate     VARCHAR(20)"
        ");");
    
    await db.execute("CREATE TABLE MISSIONS ("
        "missionID      int auto_increment unique not null primary key,"
        "missionTitle   varchar(20),"
        "missionDetails varchar(280)"
        ");");
    
    await db.execute("CREATE TABLE MISSION_STATUS ("
        "userID     int not null,"
        "missionsID int not null,"
        "status     varchar(20),"
        "primary key (userId, missionsId),"
        "foreign key (userID) references USER (userID),"
        "foreign key (missionsId) references MISSIONS (missionID)"
        ");");

    await db.execute("CREATE TABLE RECORD ("
        "recordID         int auto_increment unique not null primary key,"
        "userID           int not null,"
        "recordDateTime   varchar(30) not null,"
        "recordTotalCig   int not null,"
        "foreign key (userID) references USER(userID)"
        ");");

    await db.execute("CREATE TABLE SUPPORT_CONNECTION ("
        "supportConnectionID            int auto_increment unique not null primary key,"
        "supportConnectionTitle         varchar(20) not null,"
        "supportConnectionDetails       varchar(280),"
        "supportConnectionFacebookLink  varchar(2083),"
        "supportConnectionTelegramLink  varchar(2083),"
        "supportConnectionWhatsAppLink  varchar(2083),"
        "supportConnectionEmail         varchar(324),"
        "supportConnectionWebsiteLink   varchar(2083),"
        "supportConnectionTwitterLink   varchar(2083),"
        "supportConnectionPhone         varchar(16),"
        "supportConnectionInstagramLink varchar(2083)"
        ");");

    await db.execute("CREATE TABLE TIPS_MOTIVATIONS ("
        "tipsMotivationsID int unique auto_increment not null primary key,"
        "tipsMotivationsTitle varchar(20) not null,"
        "tipsMotivationsDetails VARCHAR(280),"
        "tipsMotivationsImage MEDIUMBLOB"
        ");");
  });
}
/*
"CREATE TABLE USER
("
    "userID                  INT auto_increment unique not null primary key,"
    "userEmail               VARCHAR(320),"
    "userPassword            VARCHAR(20),"
    "userProfileType         VARCHAR(20),"
    "userProfileName         VARCHAR(50),"
    "userProfileCurrency     VARCHAR(3),"
    "userProfilePricePerPack DECIMAL(19, 2),"
    "userProfileCigPerPack   INT,"
    "userProfileCigPerDay    int,"
    "userProfileQuitDate     VARCHAR(20)"
");"

"CREATE TABLE MISSIONS
("
    "missionID      int auto_increment unique not null primary key,"
    "missionTitle   varchar(20),"
   "missionDetails varchar(280)"
");"

"CREATE TABLE MISSION_STATUS
("
    "userID     int not null,"
    "missionsID int not null,"
    "status     varchar(20),"
    "primary key (userId, missionsId),"
    "foreign key (userID) references USER (userID),"
    "foreign key (missionsId) references MISSIONS (missionID)"
");"

"CREATE TABLE RECORD
("
    "recordID  int auto_increment unique not null primary key,"
    "userID  int not null,"
    "recordDateTime varchar(30) not null,"
    "recordTotalCig int not null,"
    "recordLastAlert varchar(30) not null,"
    "foreign key (userID) references USER(userID)"
");"

"CREATE TABLE SUPPORT_CONNECTION
("
    "supportConnectionID int auto_increment unique not null primary key,"
    "supportConnectionTitle varchar(20) not null,"
    "supportConnectionDetails varchar(280),"
    "supportConnectionFacebookLink varchar(2083),"
    "supportConnectionTelegramLink varchar(2083),"
    "supportConnectionWhatsAppLink varchar(2083),"
    "supportConnectionEmail varchar(324),"
    "supportConnectionWebsiteLink varchar(2083),"
    "supportConnectionTwitterLink varchar(2083),"
    "supportConnectionPhone varchar(16),"
    "supportConnectionInstagramLink varchar(2083)"
");"

"CREATE TABLE TIPS_MOTIVATIONS
("
    "tipsMotivationsID int unique auto_increment not null primary key,"
    "tipsMotivationsTitle varchar(20) not null,"
    "tipsMotivationsDetails VARCHAR(280),"
    "tipsMotivationsImageLink VARCHAR(1024)"
");"
*/