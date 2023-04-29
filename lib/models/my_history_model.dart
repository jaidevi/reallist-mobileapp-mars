class MyHistoryModel {
  dynamic _status;
  dynamic _success;
  dynamic _message;
  List<Data>? _data;

  MyHistoryModel(
      {dynamic status, dynamic success, dynamic message, List<Data>? data}) {
    if (status != null) {
      this._status = status;
    }
    if (success != null) {
      this._success = success;
    }
    if (message != null) {
      this._message = message;
    }
    if (data != null) {
      this._data = data;
    }
  }

  dynamic get status => _status;
  set status(dynamic status) => _status = status;
  dynamic get success => _success;
  set success(dynamic success) => _success = success;
  dynamic get message => _message;
  set message(dynamic message) => _message = message;
  List<Data>? get data => _data;
  set data(List<Data>? data) => _data = data;

  MyHistoryModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _success = json['success'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = <Data>[];
      json['data'].forEach((v) {
        _data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['success'] = this._success;
    data['message'] = this._message;
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  dynamic _id;
  dynamic _checklistId;
  dynamic _createdAt;
  dynamic _updatedAt;
  dynamic _deletedAt;
  dynamic _campusId;
  dynamic _userId;
  Checklist? _checklist;
  User? _user;
  Campus? _campus;

  Data(
      {dynamic id,
      dynamic checklistId,
      dynamic createdAt,
      dynamic updatedAt,
      dynamic deletedAt,
      dynamic campusId,
      dynamic userId,
      Checklist? checklist,
      User? user,
      Campus? campus}) {
    if (id != null) {
      this._id = id;
    }
    if (checklistId != null) {
      this._checklistId = checklistId;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (deletedAt != null) {
      this._deletedAt = deletedAt;
    }
    if (campusId != null) {
      this._campusId = campusId;
    }
    if (userId != null) {
      this._userId = userId;
    }
    if (checklist != null) {
      this._checklist = checklist;
    }
    if (user != null) {
      this._user = user;
    }
    if (campus != null) {
      this._campus = campus;
    }
  }

  dynamic get id => _id;
  set id(dynamic id) => _id = id;
  dynamic get checklistId => _checklistId;
  set checklistId(dynamic checklistId) => _checklistId = checklistId;
  dynamic get createdAt => _createdAt;
  set createdAt(dynamic createdAt) => _createdAt = createdAt;
  dynamic get updatedAt => _updatedAt;
  set updatedAt(dynamic updatedAt) => _updatedAt = updatedAt;
  dynamic get deletedAt => _deletedAt;
  set deletedAt(dynamic deletedAt) => _deletedAt = deletedAt;
  dynamic get campusId => _campusId;
  set campusId(dynamic campusId) => _campusId = campusId;
  dynamic get userId => _userId;
  set userId(dynamic userId) => _userId = userId;
  Checklist? get checklist => _checklist;
  set checklist(Checklist? checklist) => _checklist = checklist;
  User? get user => _user;
  set user(User? user) => _user = user;
  Campus? get campus => _campus;
  set campus(Campus? campus) => _campus = campus;

  Data.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _checklistId = json['checklist_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _deletedAt = json['deleted_at'];
    _campusId = json['campus_id'];
    _userId = json['user_id'];
    _checklist = json['checklist'] != null
        ? new Checklist.fromJson(json['checklist'])
        : null;
    _user = json['user'] != null ? new User.fromJson(json['user']) : null;
    _campus =
        json['campus'] != null ? new Campus.fromJson(json['campus']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['checklist_id'] = this._checklistId;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['deleted_at'] = this._deletedAt;
    data['campus_id'] = this._campusId;
    data['user_id'] = this._userId;
    if (this._checklist != null) {
      data['checklist'] = this._checklist!.toJson();
    }
    if (this._user != null) {
      data['user'] = this._user!.toJson();
    }
    if (this._campus != null) {
      data['campus'] = this._campus!.toJson();
    }
    return data;
  }
}

class Checklist {
  dynamic _id;
  dynamic _title;
  dynamic _icon;
  dynamic _isActive;
  dynamic _departmentId;
  dynamic _divisionId;
  dynamic _createdAt;
  dynamic _updatedAt;
  dynamic _deletedAt;

  Checklist(
      {dynamic id,
      dynamic title,
      dynamic icon,
      dynamic isActive,
      dynamic departmentId,
      dynamic divisionId,
      dynamic createdAt,
      dynamic updatedAt,
      dynamic deletedAt}) {
    if (id != null) {
      this._id = id;
    }
    if (title != null) {
      this._title = title;
    }
    if (icon != null) {
      this._icon = icon;
    }
    if (isActive != null) {
      this._isActive = isActive;
    }
    if (departmentId != null) {
      this._departmentId = departmentId;
    }
    if (divisionId != null) {
      this._divisionId = divisionId;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (deletedAt != null) {
      this._deletedAt = deletedAt;
    }
  }

  dynamic get id => _id;
  set id(dynamic id) => _id = id;
  dynamic get title => _title;
  set title(dynamic title) => _title = title;
  dynamic get icon => _icon;
  set icon(dynamic icon) => _icon = icon;
  dynamic get isActive => _isActive;
  set isActive(dynamic isActive) => _isActive = isActive;
  dynamic get departmentId => _departmentId;
  set departmentId(dynamic departmentId) => _departmentId = departmentId;
  dynamic get divisionId => _divisionId;
  set divisionId(dynamic divisionId) => _divisionId = divisionId;
  dynamic get createdAt => _createdAt;
  set createdAt(dynamic createdAt) => _createdAt = createdAt;
  dynamic get updatedAt => _updatedAt;
  set updatedAt(dynamic updatedAt) => _updatedAt = updatedAt;
  dynamic get deletedAt => _deletedAt;
  set deletedAt(dynamic deletedAt) => _deletedAt = deletedAt;

  Checklist.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _icon = json['icon'];
    _isActive = json['is_active'];
    _departmentId = json['department_id'];
    _divisionId = json['division_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['title'] = this._title;
    data['icon'] = this._icon;
    data['is_active'] = this._isActive;
    data['department_id'] = this._departmentId;
    data['division_id'] = this._divisionId;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['deleted_at'] = this._deletedAt;
    return data;
  }
}

class User {
  dynamic _id;
  dynamic _email;
  dynamic _emailVerifiedAt;
  dynamic _name;
  dynamic _lname;
  dynamic _empId;
  dynamic _doj;
  dynamic _phone;
  dynamic _departmentId;
  dynamic _divisionId;
  dynamic _locationId;
  dynamic _createdAt;
  dynamic _updatedAt;
  dynamic _deletedAt;

  User(
      {dynamic id,
      dynamic email,
      dynamic emailVerifiedAt,
      dynamic name,
      dynamic lname,
      dynamic empId,
      dynamic doj,
      dynamic phone,
      dynamic departmentId,
      dynamic divisionId,
      dynamic locationId,
      dynamic createdAt,
      dynamic updatedAt,
      dynamic deletedAt}) {
    if (id != null) {
      this._id = id;
    }
    if (email != null) {
      this._email = email;
    }
    if (emailVerifiedAt != null) {
      this._emailVerifiedAt = emailVerifiedAt;
    }
    if (name != null) {
      this._name = name;
    }
    if (lname != null) {
      this._lname = lname;
    }
    if (empId != null) {
      this._empId = empId;
    }
    if (doj != null) {
      this._doj = doj;
    }
    if (phone != null) {
      this._phone = phone;
    }
    if (departmentId != null) {
      this._departmentId = departmentId;
    }
    if (divisionId != null) {
      this._divisionId = divisionId;
    }
    if (locationId != null) {
      this._locationId = locationId;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (deletedAt != null) {
      this._deletedAt = deletedAt;
    }
  }

  dynamic get id => _id;
  set id(dynamic id) => _id = id;
  dynamic get email => _email;
  set email(dynamic email) => _email = email;
  dynamic get emailVerifiedAt => _emailVerifiedAt;
  set emailVerifiedAt(dynamic emailVerifiedAt) =>
      _emailVerifiedAt = emailVerifiedAt;
  dynamic get name => _name;
  set name(dynamic name) => _name = name;
  dynamic get lname => _lname;
  set lname(dynamic lname) => _lname = lname;
  dynamic get empId => _empId;
  set empId(dynamic empId) => _empId = empId;
  dynamic get doj => _doj;
  set doj(dynamic doj) => _doj = doj;
  dynamic get phone => _phone;
  set phone(dynamic phone) => _phone = phone;
  dynamic get departmentId => _departmentId;
  set departmentId(dynamic departmentId) => _departmentId = departmentId;
  dynamic get divisionId => _divisionId;
  set divisionId(dynamic divisionId) => _divisionId = divisionId;
  dynamic get locationId => _locationId;
  set locationId(dynamic locationId) => _locationId = locationId;
  dynamic get createdAt => _createdAt;
  set createdAt(dynamic createdAt) => _createdAt = createdAt;
  dynamic get updatedAt => _updatedAt;
  set updatedAt(dynamic updatedAt) => _updatedAt = updatedAt;
  dynamic get deletedAt => _deletedAt;
  set deletedAt(dynamic deletedAt) => _deletedAt = deletedAt;

  User.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _email = json['email'];
    _emailVerifiedAt = json['email_verified_at'];
    _name = json['name'];
    _lname = json['lname'];
    _empId = json['emp_id'];
    _doj = json['doj'];
    _phone = json['phone'];
    _departmentId = json['department_id'];
    _divisionId = json['division_id'];
    _locationId = json['location_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['email'] = this._email;
    data['email_verified_at'] = this._emailVerifiedAt;
    data['name'] = this._name;
    data['lname'] = this._lname;
    data['emp_id'] = this._empId;
    data['doj'] = this._doj;
    data['phone'] = this._phone;
    data['department_id'] = this._departmentId;
    data['division_id'] = this._divisionId;
    data['location_id'] = this._locationId;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['deleted_at'] = this._deletedAt;
    return data;
  }
}

class Campus {
  dynamic _id;
  dynamic _locationId;
  dynamic _buildingId;
  dynamic _floorId;
  dynamic _zoneId;
  dynamic _spotId;
  dynamic _createdAt;
  dynamic _updatedAt;
  Location? _location;
  Building? _building;
  Floor? _floor;
  Zone? _zone;
  Spot? _spot;

  Campus(
      {dynamic id,
      dynamic locationId,
      dynamic buildingId,
      dynamic floorId,
      dynamic zoneId,
      dynamic spotId,
      dynamic createdAt,
      dynamic updatedAt,
      Location? location,
      Building? building,
      Floor? floor,
      Zone? zone,
      Spot? spot}) {
    if (id != null) {
      this._id = id;
    }
    if (locationId != null) {
      this._locationId = locationId;
    }
    if (buildingId != null) {
      this._buildingId = buildingId;
    }
    if (floorId != null) {
      this._floorId = floorId;
    }
    if (zoneId != null) {
      this._zoneId = zoneId;
    }
    if (spotId != null) {
      this._spotId = spotId;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (location != null) {
      this._location = location;
    }
    if (building != null) {
      this._building = building;
    }
    if (floor != null) {
      this._floor = floor;
    }
    if (zone != null) {
      this._zone = zone;
    }
    if (spot != null) {
      this._spot = spot;
    }
  }

  dynamic get id => _id;
  set id(dynamic id) => _id = id;
  dynamic get locationId => _locationId;
  set locationId(dynamic locationId) => _locationId = locationId;
  dynamic get buildingId => _buildingId;
  set buildingId(dynamic buildingId) => _buildingId = buildingId;
  dynamic get floorId => _floorId;
  set floorId(dynamic floorId) => _floorId = floorId;
  dynamic get zoneId => _zoneId;
  set zoneId(dynamic zoneId) => _zoneId = zoneId;
  dynamic get spotId => _spotId;
  set spotId(dynamic spotId) => _spotId = spotId;
  dynamic get createdAt => _createdAt;
  set createdAt(dynamic createdAt) => _createdAt = createdAt;
  dynamic get updatedAt => _updatedAt;
  set updatedAt(dynamic updatedAt) => _updatedAt = updatedAt;
  Location? get location => _location;
  set location(Location? location) => _location = location;
  Building? get building => _building;
  set building(Building? building) => _building = building;
  Floor? get floor => _floor;
  set floor(Floor? floor) => _floor = floor;
  Zone? get zone => _zone;
  set zone(Zone? zone) => _zone = zone;
  Spot? get spot => _spot;
  set spot(Spot? spot) => _spot = spot;

  Campus.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _locationId = json['location_id'];
    _buildingId = json['building_id'];
    _floorId = json['floor_id'];
    _zoneId = json['zone_id'];
    _spotId = json['spot_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    _building = json['building'] != null
        ? new Building.fromJson(json['building'])
        : null;
    _floor = json['floor'] != null ? new Floor.fromJson(json['floor']) : null;
    _zone = json['zone'] != null ? new Zone.fromJson(json['zone']) : null;
    _spot = json['spot'] != null ? new Spot.fromJson(json['spot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['location_id'] = this._locationId;
    data['building_id'] = this._buildingId;
    data['floor_id'] = this._floorId;
    data['zone_id'] = this._zoneId;
    data['spot_id'] = this._spotId;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    if (this._location != null) {
      data['location'] = this._location!.toJson();
    }
    if (this._building != null) {
      data['building'] = this._building!.toJson();
    }
    if (this._floor != null) {
      data['floor'] = this._floor!.toJson();
    }
    if (this._zone != null) {
      data['zone'] = this._zone!.toJson();
    }
    if (this._spot != null) {
      data['spot'] = this._spot!.toJson();
    }
    return data;
  }
}

class Location {
  dynamic _id;
  dynamic _name;
  dynamic _createdAt;
  dynamic _updatedAt;
  dynamic _deletedAt;

  Location(
      {dynamic id,
      dynamic name,
      dynamic createdAt,
      dynamic updatedAt,
      dynamic deletedAt}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (deletedAt != null) {
      this._deletedAt = deletedAt;
    }
  }

  dynamic get id => _id;
  set id(dynamic id) => _id = id;
  dynamic get name => _name;
  set name(dynamic name) => _name = name;
  dynamic get createdAt => _createdAt;
  set createdAt(dynamic createdAt) => _createdAt = createdAt;
  dynamic get updatedAt => _updatedAt;
  set updatedAt(dynamic updatedAt) => _updatedAt = updatedAt;
  dynamic get deletedAt => _deletedAt;
  set deletedAt(dynamic deletedAt) => _deletedAt = deletedAt;

  Location.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['deleted_at'] = this._deletedAt;
    return data;
  }
}

class Building {
  dynamic _id;
  dynamic _name;
  dynamic _locationId;
  dynamic _createdAt;
  dynamic _updatedAt;

  Building(
      {dynamic id,
      dynamic name,
      dynamic locationId,
      dynamic createdAt,
      dynamic updatedAt}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (locationId != null) {
      this._locationId = locationId;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
  }

  dynamic get id => _id;
  set id(dynamic id) => _id = id;
  dynamic get name => _name;
  set name(dynamic name) => _name = name;
  dynamic get locationId => _locationId;
  set locationId(dynamic locationId) => _locationId = locationId;
  dynamic get createdAt => _createdAt;
  set createdAt(dynamic createdAt) => _createdAt = createdAt;
  dynamic get updatedAt => _updatedAt;
  set updatedAt(dynamic updatedAt) => _updatedAt = updatedAt;

  Building.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _locationId = json['location_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['location_id'] = this._locationId;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}

class Floor {
  dynamic _id;
  dynamic _name;
  dynamic _buildingId;
  dynamic _createdAt;
  dynamic _updatedAt;

  Floor(
      {dynamic id,
      dynamic name,
      dynamic buildingId,
      dynamic createdAt,
      dynamic updatedAt}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (buildingId != null) {
      this._buildingId = buildingId;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
  }

  dynamic get id => _id;
  set id(dynamic id) => _id = id;
  dynamic get name => _name;
  set name(dynamic name) => _name = name;
  dynamic get buildingId => _buildingId;
  set buildingId(dynamic buildingId) => _buildingId = buildingId;
  dynamic get createdAt => _createdAt;
  set createdAt(dynamic createdAt) => _createdAt = createdAt;
  dynamic get updatedAt => _updatedAt;
  set updatedAt(dynamic updatedAt) => _updatedAt = updatedAt;

  Floor.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _buildingId = json['building_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['building_id'] = this._buildingId;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}

class Zone {
  dynamic _id;
  dynamic _name;
  dynamic _floorId;
  dynamic _createdAt;
  dynamic _updatedAt;

  Zone(
      {dynamic id,
      dynamic name,
      dynamic floorId,
      dynamic createdAt,
      dynamic updatedAt}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (floorId != null) {
      this._floorId = floorId;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
  }

  dynamic get id => _id;
  set id(dynamic id) => _id = id;
  dynamic get name => _name;
  set name(dynamic name) => _name = name;
  dynamic get floorId => _floorId;
  set floorId(dynamic floorId) => _floorId = floorId;
  dynamic get createdAt => _createdAt;
  set createdAt(dynamic createdAt) => _createdAt = createdAt;
  dynamic get updatedAt => _updatedAt;
  set updatedAt(dynamic updatedAt) => _updatedAt = updatedAt;

  Zone.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _floorId = json['floor_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['floor_id'] = this._floorId;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}

class Spot {
  dynamic _id;
  dynamic _name;
  dynamic _zoneId;
  dynamic _createdAt;
  dynamic _updatedAt;

  Spot(
      {dynamic id,
      dynamic name,
      dynamic zoneId,
      dynamic createdAt,
      dynamic updatedAt}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (zoneId != null) {
      this._zoneId = zoneId;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
  }

  dynamic get id => _id;
  set id(dynamic id) => _id = id;
  dynamic get name => _name;
  set name(dynamic name) => _name = name;
  dynamic get zoneId => _zoneId;
  set zoneId(dynamic zoneId) => _zoneId = zoneId;
  dynamic get createdAt => _createdAt;
  set createdAt(dynamic createdAt) => _createdAt = createdAt;
  dynamic get updatedAt => _updatedAt;
  set updatedAt(dynamic updatedAt) => _updatedAt = updatedAt;

  Spot.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _zoneId = json['zone_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['zone_id'] = this._zoneId;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}
