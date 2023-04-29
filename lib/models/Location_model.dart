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
