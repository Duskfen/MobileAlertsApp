// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measurement.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetMeasurementCollection on Isar {
  IsarCollection<Measurement> get measurements => this.collection();
}

const MeasurementSchema = CollectionSchema(
  name: r'Measurement',
  id: -8666549389298478361,
  properties: {
    r'fetchTime': PropertySchema(
      id: 0,
      name: r'fetchTime',
      type: IsarType.dateTime,
    ),
    r'hashCode': PropertySchema(
      id: 1,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'lowBattery': PropertySchema(
      id: 2,
      name: r'lowBattery',
      type: IsarType.bool,
    ),
    r'measureTime': PropertySchema(
      id: 3,
      name: r'measureTime',
      type: IsarType.dateTime,
    ),
    r'measurementId': PropertySchema(
      id: 4,
      name: r'measurementId',
      type: IsarType.long,
    ),
    r'rawData': PropertySchema(
      id: 5,
      name: r'rawData',
      type: IsarType.string,
    ),
    r'serverReceiveTime': PropertySchema(
      id: 6,
      name: r'serverReceiveTime',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _measurementEstimateSize,
  serialize: _measurementSerialize,
  deserialize: _measurementDeserialize,
  deserializeProp: _measurementDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _measurementGetId,
  getLinks: _measurementGetLinks,
  attach: _measurementAttach,
  version: '3.0.5',
);

int _measurementEstimateSize(
  Measurement object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.rawData.length * 3;
  return bytesCount;
}

void _measurementSerialize(
  Measurement object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.fetchTime);
  writer.writeLong(offsets[1], object.hashCode);
  writer.writeBool(offsets[2], object.lowBattery);
  writer.writeDateTime(offsets[3], object.measureTime);
  writer.writeLong(offsets[4], object.measurementId);
  writer.writeString(offsets[5], object.rawData);
  writer.writeDateTime(offsets[6], object.serverReceiveTime);
}

Measurement _measurementDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Measurement(
    fetchTime: reader.readDateTime(offsets[0]),
    lowBattery: reader.readBool(offsets[2]),
    measureTime: reader.readDateTime(offsets[3]),
    measurementId: reader.readLong(offsets[4]),
    rawData: reader.readString(offsets[5]),
    serverReceiveTime: reader.readDateTime(offsets[6]),
  );
  object.id = id;
  return object;
}

P _measurementDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _measurementGetId(Measurement object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _measurementGetLinks(Measurement object) {
  return [];
}

void _measurementAttach(
    IsarCollection<dynamic> col, Id id, Measurement object) {
  object.id = id;
}

extension MeasurementQueryWhereSort
    on QueryBuilder<Measurement, Measurement, QWhere> {
  QueryBuilder<Measurement, Measurement, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MeasurementQueryWhere
    on QueryBuilder<Measurement, Measurement, QWhereClause> {
  QueryBuilder<Measurement, Measurement, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<Measurement, Measurement, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterWhereClause> idBetween(
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

extension MeasurementQueryFilter
    on QueryBuilder<Measurement, Measurement, QFilterCondition> {
  QueryBuilder<Measurement, Measurement, QAfterFilterCondition>
      fetchTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fetchTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterFilterCondition>
      fetchTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fetchTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterFilterCondition>
      fetchTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fetchTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterFilterCondition>
      fetchTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fetchTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterFilterCondition> hashCodeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterFilterCondition>
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

  QueryBuilder<Measurement, Measurement, QAfterFilterCondition>
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

  QueryBuilder<Measurement, Measurement, QAfterFilterCondition> hashCodeBetween(
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

  QueryBuilder<Measurement, Measurement, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Measurement, Measurement, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Measurement, Measurement, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Measurement, Measurement, QAfterFilterCondition>
      lowBatteryEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lowBattery',
        value: value,
      ));
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterFilterCondition>
      measureTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'measureTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterFilterCondition>
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

  QueryBuilder<Measurement, Measurement, QAfterFilterCondition>
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

  QueryBuilder<Measurement, Measurement, QAfterFilterCondition>
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

  QueryBuilder<Measurement, Measurement, QAfterFilterCondition>
      measurementIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'measurementId',
        value: value,
      ));
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterFilterCondition>
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

  QueryBuilder<Measurement, Measurement, QAfterFilterCondition>
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

  QueryBuilder<Measurement, Measurement, QAfterFilterCondition>
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

  QueryBuilder<Measurement, Measurement, QAfterFilterCondition> rawDataEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rawData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterFilterCondition>
      rawDataGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rawData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterFilterCondition> rawDataLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rawData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterFilterCondition> rawDataBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rawData',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterFilterCondition>
      rawDataStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rawData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterFilterCondition> rawDataEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rawData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterFilterCondition> rawDataContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rawData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterFilterCondition> rawDataMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rawData',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterFilterCondition>
      rawDataIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rawData',
        value: '',
      ));
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterFilterCondition>
      rawDataIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rawData',
        value: '',
      ));
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterFilterCondition>
      serverReceiveTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serverReceiveTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterFilterCondition>
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

  QueryBuilder<Measurement, Measurement, QAfterFilterCondition>
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

  QueryBuilder<Measurement, Measurement, QAfterFilterCondition>
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
}

extension MeasurementQueryObject
    on QueryBuilder<Measurement, Measurement, QFilterCondition> {}

extension MeasurementQueryLinks
    on QueryBuilder<Measurement, Measurement, QFilterCondition> {}

extension MeasurementQuerySortBy
    on QueryBuilder<Measurement, Measurement, QSortBy> {
  QueryBuilder<Measurement, Measurement, QAfterSortBy> sortByFetchTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fetchTime', Sort.asc);
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterSortBy> sortByFetchTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fetchTime', Sort.desc);
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterSortBy> sortByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterSortBy> sortByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterSortBy> sortByLowBattery() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lowBattery', Sort.asc);
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterSortBy> sortByLowBatteryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lowBattery', Sort.desc);
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterSortBy> sortByMeasureTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'measureTime', Sort.asc);
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterSortBy> sortByMeasureTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'measureTime', Sort.desc);
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterSortBy> sortByMeasurementId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'measurementId', Sort.asc);
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterSortBy>
      sortByMeasurementIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'measurementId', Sort.desc);
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterSortBy> sortByRawData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rawData', Sort.asc);
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterSortBy> sortByRawDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rawData', Sort.desc);
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterSortBy>
      sortByServerReceiveTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverReceiveTime', Sort.asc);
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterSortBy>
      sortByServerReceiveTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverReceiveTime', Sort.desc);
    });
  }
}

extension MeasurementQuerySortThenBy
    on QueryBuilder<Measurement, Measurement, QSortThenBy> {
  QueryBuilder<Measurement, Measurement, QAfterSortBy> thenByFetchTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fetchTime', Sort.asc);
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterSortBy> thenByFetchTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fetchTime', Sort.desc);
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterSortBy> thenByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterSortBy> thenByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterSortBy> thenByLowBattery() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lowBattery', Sort.asc);
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterSortBy> thenByLowBatteryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lowBattery', Sort.desc);
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterSortBy> thenByMeasureTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'measureTime', Sort.asc);
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterSortBy> thenByMeasureTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'measureTime', Sort.desc);
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterSortBy> thenByMeasurementId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'measurementId', Sort.asc);
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterSortBy>
      thenByMeasurementIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'measurementId', Sort.desc);
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterSortBy> thenByRawData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rawData', Sort.asc);
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterSortBy> thenByRawDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rawData', Sort.desc);
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterSortBy>
      thenByServerReceiveTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverReceiveTime', Sort.asc);
    });
  }

  QueryBuilder<Measurement, Measurement, QAfterSortBy>
      thenByServerReceiveTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverReceiveTime', Sort.desc);
    });
  }
}

extension MeasurementQueryWhereDistinct
    on QueryBuilder<Measurement, Measurement, QDistinct> {
  QueryBuilder<Measurement, Measurement, QDistinct> distinctByFetchTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fetchTime');
    });
  }

  QueryBuilder<Measurement, Measurement, QDistinct> distinctByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashCode');
    });
  }

  QueryBuilder<Measurement, Measurement, QDistinct> distinctByLowBattery() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lowBattery');
    });
  }

  QueryBuilder<Measurement, Measurement, QDistinct> distinctByMeasureTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'measureTime');
    });
  }

  QueryBuilder<Measurement, Measurement, QDistinct> distinctByMeasurementId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'measurementId');
    });
  }

  QueryBuilder<Measurement, Measurement, QDistinct> distinctByRawData(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rawData', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Measurement, Measurement, QDistinct>
      distinctByServerReceiveTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serverReceiveTime');
    });
  }
}

extension MeasurementQueryProperty
    on QueryBuilder<Measurement, Measurement, QQueryProperty> {
  QueryBuilder<Measurement, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Measurement, DateTime, QQueryOperations> fetchTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fetchTime');
    });
  }

  QueryBuilder<Measurement, int, QQueryOperations> hashCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashCode');
    });
  }

  QueryBuilder<Measurement, bool, QQueryOperations> lowBatteryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lowBattery');
    });
  }

  QueryBuilder<Measurement, DateTime, QQueryOperations> measureTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'measureTime');
    });
  }

  QueryBuilder<Measurement, int, QQueryOperations> measurementIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'measurementId');
    });
  }

  QueryBuilder<Measurement, String, QQueryOperations> rawDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rawData');
    });
  }

  QueryBuilder<Measurement, DateTime, QQueryOperations>
      serverReceiveTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serverReceiveTime');
    });
  }
}
