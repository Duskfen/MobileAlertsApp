// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measurementid02.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetMeasurementID02Collection on Isar {
  IsarCollection<MeasurementID02> get measurementID02s => this.collection();
}

const MeasurementID02Schema = CollectionSchema(
  name: r'MeasurementID02',
  id: -4301283153483198394,
  properties: {
    r'hashCode': PropertySchema(
      id: 0,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'lowBattery': PropertySchema(
      id: 1,
      name: r'lowBattery',
      type: IsarType.bool,
    ),
    r'measureTime': PropertySchema(
      id: 2,
      name: r'measureTime',
      type: IsarType.dateTime,
    ),
    r'measurementId': PropertySchema(
      id: 3,
      name: r'measurementId',
      type: IsarType.long,
    ),
    r'serverReceiveTime': PropertySchema(
      id: 4,
      name: r'serverReceiveTime',
      type: IsarType.dateTime,
    ),
    r'temperature': PropertySchema(
      id: 5,
      name: r'temperature',
      type: IsarType.double,
    )
  },
  estimateSize: _measurementID02EstimateSize,
  serialize: _measurementID02Serialize,
  deserialize: _measurementID02Deserialize,
  deserializeProp: _measurementID02DeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _measurementID02GetId,
  getLinks: _measurementID02GetLinks,
  attach: _measurementID02Attach,
  version: '3.0.5',
);

int _measurementID02EstimateSize(
  MeasurementID02 object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _measurementID02Serialize(
  MeasurementID02 object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.hashCode);
  writer.writeBool(offsets[1], object.lowBattery);
  writer.writeDateTime(offsets[2], object.measureTime);
  writer.writeLong(offsets[3], object.measurementId);
  writer.writeDateTime(offsets[4], object.serverReceiveTime);
  writer.writeDouble(offsets[5], object.temperature);
}

MeasurementID02 _measurementID02Deserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MeasurementID02(
    lowBattery: reader.readBool(offsets[1]),
    measureTime: reader.readDateTime(offsets[2]),
    measurementId: reader.readLong(offsets[3]),
    serverReceiveTime: reader.readDateTime(offsets[4]),
    temperature: reader.readDouble(offsets[5]),
  );
  object.id = id;
  return object;
}

P _measurementID02DeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _measurementID02GetId(MeasurementID02 object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _measurementID02GetLinks(MeasurementID02 object) {
  return [];
}

void _measurementID02Attach(
    IsarCollection<dynamic> col, Id id, MeasurementID02 object) {
  object.id = id;
}

extension MeasurementID02QueryWhereSort
    on QueryBuilder<MeasurementID02, MeasurementID02, QWhere> {
  QueryBuilder<MeasurementID02, MeasurementID02, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MeasurementID02QueryWhere
    on QueryBuilder<MeasurementID02, MeasurementID02, QWhereClause> {
  QueryBuilder<MeasurementID02, MeasurementID02, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterWhereClause> idBetween(
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

extension MeasurementID02QueryFilter
    on QueryBuilder<MeasurementID02, MeasurementID02, QFilterCondition> {
  QueryBuilder<MeasurementID02, MeasurementID02, QAfterFilterCondition>
      hashCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterFilterCondition>
      hashCodeGreaterThan(
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

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterFilterCondition>
      hashCodeLessThan(
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

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterFilterCondition>
      hashCodeBetween(
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

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterFilterCondition>
      lowBatteryEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lowBattery',
        value: value,
      ));
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterFilterCondition>
      measureTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'measureTime',
        value: value,
      ));
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterFilterCondition>
      measureTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'measureTime',
        value: value,
      ));
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterFilterCondition>
      measureTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'measureTime',
        value: value,
      ));
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterFilterCondition>
      measureTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'measureTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterFilterCondition>
      measurementIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'measurementId',
        value: value,
      ));
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterFilterCondition>
      measurementIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'measurementId',
        value: value,
      ));
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterFilterCondition>
      measurementIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'measurementId',
        value: value,
      ));
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterFilterCondition>
      measurementIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'measurementId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterFilterCondition>
      serverReceiveTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serverReceiveTime',
        value: value,
      ));
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterFilterCondition>
      serverReceiveTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'serverReceiveTime',
        value: value,
      ));
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterFilterCondition>
      serverReceiveTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'serverReceiveTime',
        value: value,
      ));
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterFilterCondition>
      serverReceiveTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'serverReceiveTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterFilterCondition>
      temperatureEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'temperature',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterFilterCondition>
      temperatureGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'temperature',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterFilterCondition>
      temperatureLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'temperature',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterFilterCondition>
      temperatureBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'temperature',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension MeasurementID02QueryObject
    on QueryBuilder<MeasurementID02, MeasurementID02, QFilterCondition> {}

extension MeasurementID02QueryLinks
    on QueryBuilder<MeasurementID02, MeasurementID02, QFilterCondition> {}

extension MeasurementID02QuerySortBy
    on QueryBuilder<MeasurementID02, MeasurementID02, QSortBy> {
  QueryBuilder<MeasurementID02, MeasurementID02, QAfterSortBy>
      sortByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterSortBy>
      sortByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterSortBy>
      sortByLowBattery() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lowBattery', Sort.asc);
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterSortBy>
      sortByLowBatteryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lowBattery', Sort.desc);
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterSortBy>
      sortByMeasureTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'measureTime', Sort.asc);
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterSortBy>
      sortByMeasureTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'measureTime', Sort.desc);
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterSortBy>
      sortByMeasurementId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'measurementId', Sort.asc);
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterSortBy>
      sortByMeasurementIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'measurementId', Sort.desc);
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterSortBy>
      sortByServerReceiveTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverReceiveTime', Sort.asc);
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterSortBy>
      sortByServerReceiveTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverReceiveTime', Sort.desc);
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterSortBy>
      sortByTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperature', Sort.asc);
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterSortBy>
      sortByTemperatureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperature', Sort.desc);
    });
  }
}

extension MeasurementID02QuerySortThenBy
    on QueryBuilder<MeasurementID02, MeasurementID02, QSortThenBy> {
  QueryBuilder<MeasurementID02, MeasurementID02, QAfterSortBy>
      thenByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterSortBy>
      thenByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterSortBy>
      thenByLowBattery() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lowBattery', Sort.asc);
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterSortBy>
      thenByLowBatteryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lowBattery', Sort.desc);
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterSortBy>
      thenByMeasureTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'measureTime', Sort.asc);
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterSortBy>
      thenByMeasureTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'measureTime', Sort.desc);
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterSortBy>
      thenByMeasurementId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'measurementId', Sort.asc);
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterSortBy>
      thenByMeasurementIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'measurementId', Sort.desc);
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterSortBy>
      thenByServerReceiveTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverReceiveTime', Sort.asc);
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterSortBy>
      thenByServerReceiveTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverReceiveTime', Sort.desc);
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterSortBy>
      thenByTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperature', Sort.asc);
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QAfterSortBy>
      thenByTemperatureDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'temperature', Sort.desc);
    });
  }
}

extension MeasurementID02QueryWhereDistinct
    on QueryBuilder<MeasurementID02, MeasurementID02, QDistinct> {
  QueryBuilder<MeasurementID02, MeasurementID02, QDistinct>
      distinctByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashCode');
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QDistinct>
      distinctByLowBattery() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lowBattery');
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QDistinct>
      distinctByMeasureTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'measureTime');
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QDistinct>
      distinctByMeasurementId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'measurementId');
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QDistinct>
      distinctByServerReceiveTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serverReceiveTime');
    });
  }

  QueryBuilder<MeasurementID02, MeasurementID02, QDistinct>
      distinctByTemperature() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'temperature');
    });
  }
}

extension MeasurementID02QueryProperty
    on QueryBuilder<MeasurementID02, MeasurementID02, QQueryProperty> {
  QueryBuilder<MeasurementID02, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MeasurementID02, int, QQueryOperations> hashCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashCode');
    });
  }

  QueryBuilder<MeasurementID02, bool, QQueryOperations> lowBatteryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lowBattery');
    });
  }

  QueryBuilder<MeasurementID02, DateTime, QQueryOperations>
      measureTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'measureTime');
    });
  }

  QueryBuilder<MeasurementID02, int, QQueryOperations> measurementIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'measurementId');
    });
  }

  QueryBuilder<MeasurementID02, DateTime, QQueryOperations>
      serverReceiveTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serverReceiveTime');
    });
  }

  QueryBuilder<MeasurementID02, double, QQueryOperations>
      temperatureProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'temperature');
    });
  }
}
