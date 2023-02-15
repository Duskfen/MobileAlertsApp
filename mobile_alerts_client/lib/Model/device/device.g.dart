// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetDeviceCollection on Isar {
  IsarCollection<Device> get devices => this.collection();
}

const DeviceSchema = CollectionSchema(
  name: r'Device',
  id: 3491430514663294648,
  properties: {
    r'deviceType': PropertySchema(
      id: 0,
      name: r'deviceType',
      type: IsarType.byte,
      enumMap: _DevicedeviceTypeEnumValueMap,
    ),
    r'deviceid': PropertySchema(
      id: 1,
      name: r'deviceid',
      type: IsarType.string,
    ),
    r'getName': PropertySchema(
      id: 2,
      name: r'getName',
      type: IsarType.string,
    ),
    r'hasListeners': PropertySchema(
      id: 3,
      name: r'hasListeners',
      type: IsarType.bool,
    ),
    r'hashCode': PropertySchema(
      id: 4,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'lastseen': PropertySchema(
      id: 5,
      name: r'lastseen',
      type: IsarType.long,
    ),
    r'lowbattery': PropertySchema(
      id: 6,
      name: r'lowbattery',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 7,
      name: r'name',
      type: IsarType.string,
    ),
    r'order': PropertySchema(
      id: 8,
      name: r'order',
      type: IsarType.long,
    )
  },
  estimateSize: _deviceEstimateSize,
  serialize: _deviceSerialize,
  deserialize: _deviceDeserialize,
  deserializeProp: _deviceDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'measurements': LinkSchema(
      id: -3881096300237170209,
      name: r'measurements',
      target: r'Measurement',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _deviceGetId,
  getLinks: _deviceGetLinks,
  attach: _deviceAttach,
  version: '3.0.5',
);

int _deviceEstimateSize(
  Device object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.deviceid.length * 3;
  {
    final value = object.getName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _deviceSerialize(
  Device object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByte(offsets[0], object.deviceType.index);
  writer.writeString(offsets[1], object.deviceid);
  writer.writeString(offsets[2], object.getName);
  writer.writeBool(offsets[3], object.hasListeners);
  writer.writeLong(offsets[4], object.hashCode);
  writer.writeLong(offsets[5], object.lastseen);
  writer.writeBool(offsets[6], object.lowbattery);
  writer.writeString(offsets[7], object.name);
  writer.writeLong(offsets[8], object.order);
}

Device _deviceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Device(
    deviceid: reader.readString(offsets[1]),
    name: reader.readStringOrNull(offsets[7]),
    order: reader.readLong(offsets[8]),
  );
  object.deviceType =
      _DevicedeviceTypeValueEnumMap[reader.readByteOrNull(offsets[0])] ??
          DeviceType.id01;
  object.id = id;
  object.lastseen = reader.readLongOrNull(offsets[5]);
  object.lowbattery = reader.readBoolOrNull(offsets[6]);
  return object;
}

P _deviceDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_DevicedeviceTypeValueEnumMap[reader.readByteOrNull(offset)] ??
          DeviceType.id01) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readBoolOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _DevicedeviceTypeEnumValueMap = {
  'id01': 0,
  'id02': 1,
  'id03': 2,
  'id04': 3,
  'id05': 4,
  'id06': 5,
  'id07': 6,
  'id08': 7,
  'id09': 8,
  'id0A': 9,
  'id0B': 10,
  'id0E': 11,
  'id0F': 12,
  'id10': 13,
  'id11': 14,
  'id12': 15,
  'id15': 16,
  'id17': 17,
  'id18': 18,
  'id20': 19,
};
const _DevicedeviceTypeValueEnumMap = {
  0: DeviceType.id01,
  1: DeviceType.id02,
  2: DeviceType.id03,
  3: DeviceType.id04,
  4: DeviceType.id05,
  5: DeviceType.id06,
  6: DeviceType.id07,
  7: DeviceType.id08,
  8: DeviceType.id09,
  9: DeviceType.id0A,
  10: DeviceType.id0B,
  11: DeviceType.id0E,
  12: DeviceType.id0F,
  13: DeviceType.id10,
  14: DeviceType.id11,
  15: DeviceType.id12,
  16: DeviceType.id15,
  17: DeviceType.id17,
  18: DeviceType.id18,
  19: DeviceType.id20,
};

Id _deviceGetId(Device object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _deviceGetLinks(Device object) {
  return [object.measurements];
}

void _deviceAttach(IsarCollection<dynamic> col, Id id, Device object) {
  object.id = id;
  object.measurements
      .attach(col, col.isar.collection<Measurement>(), r'measurements', id);
}

extension DeviceQueryWhereSort on QueryBuilder<Device, Device, QWhere> {
  QueryBuilder<Device, Device, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DeviceQueryWhere on QueryBuilder<Device, Device, QWhereClause> {
  QueryBuilder<Device, Device, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Device, Device, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Device, Device, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Device, Device, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DeviceQueryFilter on QueryBuilder<Device, Device, QFilterCondition> {
  QueryBuilder<Device, Device, QAfterFilterCondition> deviceTypeEqualTo(
      DeviceType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceType',
        value: value,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> deviceTypeGreaterThan(
    DeviceType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deviceType',
        value: value,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> deviceTypeLessThan(
    DeviceType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deviceType',
        value: value,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> deviceTypeBetween(
    DeviceType lower,
    DeviceType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deviceType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> deviceidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> deviceidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deviceid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> deviceidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deviceid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> deviceidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deviceid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> deviceidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'deviceid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> deviceidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'deviceid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> deviceidContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> deviceidMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deviceid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> deviceidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceid',
        value: '',
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> deviceidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceid',
        value: '',
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> getNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'getName',
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> getNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'getName',
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> getNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'getName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> getNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'getName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> getNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'getName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> getNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'getName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> getNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'getName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> getNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'getName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> getNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'getName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> getNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'getName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> getNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'getName',
        value: '',
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> getNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'getName',
        value: '',
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> hasListenersEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasListeners',
        value: value,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> hashCodeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> hashCodeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> hashCodeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> hashCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hashCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> lastseenIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastseen',
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> lastseenIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastseen',
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> lastseenEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastseen',
        value: value,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> lastseenGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastseen',
        value: value,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> lastseenLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastseen',
        value: value,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> lastseenBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastseen',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> lowbatteryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lowbattery',
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> lowbatteryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lowbattery',
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> lowbatteryEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lowbattery',
        value: value,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> orderEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'order',
        value: value,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> orderGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'order',
        value: value,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> orderLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'order',
        value: value,
      ));
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> orderBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'order',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DeviceQueryObject on QueryBuilder<Device, Device, QFilterCondition> {}

extension DeviceQueryLinks on QueryBuilder<Device, Device, QFilterCondition> {
  QueryBuilder<Device, Device, QAfterFilterCondition> measurements(
      FilterQuery<Measurement> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'measurements');
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> measurementsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'measurements', length, true, length, true);
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> measurementsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'measurements', 0, true, 0, true);
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> measurementsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'measurements', 0, false, 999999, true);
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition>
      measurementsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'measurements', 0, true, length, include);
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition>
      measurementsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'measurements', length, include, 999999, true);
    });
  }

  QueryBuilder<Device, Device, QAfterFilterCondition> measurementsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'measurements', lower, includeLower, upper, includeUpper);
    });
  }
}

extension DeviceQuerySortBy on QueryBuilder<Device, Device, QSortBy> {
  QueryBuilder<Device, Device, QAfterSortBy> sortByDeviceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceType', Sort.asc);
    });
  }

  QueryBuilder<Device, Device, QAfterSortBy> sortByDeviceTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceType', Sort.desc);
    });
  }

  QueryBuilder<Device, Device, QAfterSortBy> sortByDeviceid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceid', Sort.asc);
    });
  }

  QueryBuilder<Device, Device, QAfterSortBy> sortByDeviceidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceid', Sort.desc);
    });
  }

  QueryBuilder<Device, Device, QAfterSortBy> sortByGetName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'getName', Sort.asc);
    });
  }

  QueryBuilder<Device, Device, QAfterSortBy> sortByGetNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'getName', Sort.desc);
    });
  }

  QueryBuilder<Device, Device, QAfterSortBy> sortByHasListeners() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasListeners', Sort.asc);
    });
  }

  QueryBuilder<Device, Device, QAfterSortBy> sortByHasListenersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasListeners', Sort.desc);
    });
  }

  QueryBuilder<Device, Device, QAfterSortBy> sortByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<Device, Device, QAfterSortBy> sortByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<Device, Device, QAfterSortBy> sortByLastseen() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastseen', Sort.asc);
    });
  }

  QueryBuilder<Device, Device, QAfterSortBy> sortByLastseenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastseen', Sort.desc);
    });
  }

  QueryBuilder<Device, Device, QAfterSortBy> sortByLowbattery() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lowbattery', Sort.asc);
    });
  }

  QueryBuilder<Device, Device, QAfterSortBy> sortByLowbatteryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lowbattery', Sort.desc);
    });
  }

  QueryBuilder<Device, Device, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Device, Device, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Device, Device, QAfterSortBy> sortByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.asc);
    });
  }

  QueryBuilder<Device, Device, QAfterSortBy> sortByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.desc);
    });
  }
}

extension DeviceQuerySortThenBy on QueryBuilder<Device, Device, QSortThenBy> {
  QueryBuilder<Device, Device, QAfterSortBy> thenByDeviceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceType', Sort.asc);
    });
  }

  QueryBuilder<Device, Device, QAfterSortBy> thenByDeviceTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceType', Sort.desc);
    });
  }

  QueryBuilder<Device, Device, QAfterSortBy> thenByDeviceid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceid', Sort.asc);
    });
  }

  QueryBuilder<Device, Device, QAfterSortBy> thenByDeviceidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceid', Sort.desc);
    });
  }

  QueryBuilder<Device, Device, QAfterSortBy> thenByGetName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'getName', Sort.asc);
    });
  }

  QueryBuilder<Device, Device, QAfterSortBy> thenByGetNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'getName', Sort.desc);
    });
  }

  QueryBuilder<Device, Device, QAfterSortBy> thenByHasListeners() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasListeners', Sort.asc);
    });
  }

  QueryBuilder<Device, Device, QAfterSortBy> thenByHasListenersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasListeners', Sort.desc);
    });
  }

  QueryBuilder<Device, Device, QAfterSortBy> thenByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<Device, Device, QAfterSortBy> thenByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<Device, Device, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Device, Device, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Device, Device, QAfterSortBy> thenByLastseen() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastseen', Sort.asc);
    });
  }

  QueryBuilder<Device, Device, QAfterSortBy> thenByLastseenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastseen', Sort.desc);
    });
  }

  QueryBuilder<Device, Device, QAfterSortBy> thenByLowbattery() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lowbattery', Sort.asc);
    });
  }

  QueryBuilder<Device, Device, QAfterSortBy> thenByLowbatteryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lowbattery', Sort.desc);
    });
  }

  QueryBuilder<Device, Device, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Device, Device, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Device, Device, QAfterSortBy> thenByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.asc);
    });
  }

  QueryBuilder<Device, Device, QAfterSortBy> thenByOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'order', Sort.desc);
    });
  }
}

extension DeviceQueryWhereDistinct on QueryBuilder<Device, Device, QDistinct> {
  QueryBuilder<Device, Device, QDistinct> distinctByDeviceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceType');
    });
  }

  QueryBuilder<Device, Device, QDistinct> distinctByDeviceid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Device, Device, QDistinct> distinctByGetName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'getName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Device, Device, QDistinct> distinctByHasListeners() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasListeners');
    });
  }

  QueryBuilder<Device, Device, QDistinct> distinctByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashCode');
    });
  }

  QueryBuilder<Device, Device, QDistinct> distinctByLastseen() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastseen');
    });
  }

  QueryBuilder<Device, Device, QDistinct> distinctByLowbattery() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lowbattery');
    });
  }

  QueryBuilder<Device, Device, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Device, Device, QDistinct> distinctByOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'order');
    });
  }
}

extension DeviceQueryProperty on QueryBuilder<Device, Device, QQueryProperty> {
  QueryBuilder<Device, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Device, DeviceType, QQueryOperations> deviceTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceType');
    });
  }

  QueryBuilder<Device, String, QQueryOperations> deviceidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceid');
    });
  }

  QueryBuilder<Device, String?, QQueryOperations> getNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'getName');
    });
  }

  QueryBuilder<Device, bool, QQueryOperations> hasListenersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasListeners');
    });
  }

  QueryBuilder<Device, int, QQueryOperations> hashCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashCode');
    });
  }

  QueryBuilder<Device, int?, QQueryOperations> lastseenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastseen');
    });
  }

  QueryBuilder<Device, bool?, QQueryOperations> lowbatteryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lowbattery');
    });
  }

  QueryBuilder<Device, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Device, int, QQueryOperations> orderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'order');
    });
  }
}
