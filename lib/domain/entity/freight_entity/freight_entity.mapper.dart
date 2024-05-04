// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'freight_entity.dart';

class FreightStatusMapper extends EnumMapper<FreightStatus> {
  FreightStatusMapper._();

  static FreightStatusMapper? _instance;
  static FreightStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FreightStatusMapper._());
    }
    return _instance!;
  }

  static FreightStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  FreightStatus decode(dynamic value) {
    switch (value) {
      case 'pending':
        return FreightStatus.pending;
      case 'readyForDispatch':
        return FreightStatus.readyForDispatch;
      case 'inTransit':
        return FreightStatus.inTransit;
      case 'delivered':
        return FreightStatus.delivered;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(FreightStatus self) {
    switch (self) {
      case FreightStatus.pending:
        return 'pending';
      case FreightStatus.readyForDispatch:
        return 'readyForDispatch';
      case FreightStatus.inTransit:
        return 'inTransit';
      case FreightStatus.delivered:
        return 'delivered';
    }
  }
}

extension FreightStatusMapperExtension on FreightStatus {
  String toValue() {
    FreightStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<FreightStatus>(this) as String;
  }
}

class FreightEntityMapper extends ClassMapperBase<FreightEntity> {
  FreightEntityMapper._();

  static FreightEntityMapper? _instance;
  static FreightEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FreightEntityMapper._());
      EntityMapper.ensureInitialized();
      FreightStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'FreightEntity';

  static int? _$id(FreightEntity v) => v.id;
  static const Field<FreightEntity, int> _f$id = Field('id', _$id, opt: true);
  static String _$origin(FreightEntity v) => v.origin;
  static const Field<FreightEntity, String> _f$origin =
      Field('origin', _$origin);
  static String _$destination(FreightEntity v) => v.destination;
  static const Field<FreightEntity, String> _f$destination =
      Field('destination', _$destination);
  static FreightStatus _$status(FreightEntity v) => v.status;
  static const Field<FreightEntity, FreightStatus> _f$status =
      Field('status', _$status, opt: true, def: FreightStatus.pending);
  static String _$loadOwnerName(FreightEntity v) => v.loadOwnerName;
  static const Field<FreightEntity, String> _f$loadOwnerName =
      Field('loadOwnerName', _$loadOwnerName);
  static String _$loadOwnerPhone(FreightEntity v) => v.loadOwnerPhone;
  static const Field<FreightEntity, String> _f$loadOwnerPhone =
      Field('loadOwnerPhone', _$loadOwnerPhone);

  @override
  final MappableFields<FreightEntity> fields = const {
    #id: _f$id,
    #origin: _f$origin,
    #destination: _f$destination,
    #status: _f$status,
    #loadOwnerName: _f$loadOwnerName,
    #loadOwnerPhone: _f$loadOwnerPhone,
  };

  static FreightEntity _instantiate(DecodingData data) {
    return FreightEntity(
        id: data.dec(_f$id),
        origin: data.dec(_f$origin),
        destination: data.dec(_f$destination),
        status: data.dec(_f$status),
        loadOwnerName: data.dec(_f$loadOwnerName),
        loadOwnerPhone: data.dec(_f$loadOwnerPhone));
  }

  @override
  final Function instantiate = _instantiate;

  static FreightEntity fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FreightEntity>(map);
  }

  static FreightEntity fromJsonString(String json) {
    return ensureInitialized().decodeJson<FreightEntity>(json);
  }
}

mixin FreightEntityMappable {
  String toJsonString() {
    return FreightEntityMapper.ensureInitialized()
        .encodeJson<FreightEntity>(this as FreightEntity);
  }

  Map<String, dynamic> toJson() {
    return FreightEntityMapper.ensureInitialized()
        .encodeMap<FreightEntity>(this as FreightEntity);
  }

  FreightEntityCopyWith<FreightEntity, FreightEntity, FreightEntity>
      get copyWith => _FreightEntityCopyWithImpl(
          this as FreightEntity, $identity, $identity);
  @override
  String toString() {
    return FreightEntityMapper.ensureInitialized()
        .stringifyValue(this as FreightEntity);
  }

  @override
  bool operator ==(Object other) {
    return FreightEntityMapper.ensureInitialized()
        .equalsValue(this as FreightEntity, other);
  }

  @override
  int get hashCode {
    return FreightEntityMapper.ensureInitialized()
        .hashValue(this as FreightEntity);
  }
}

extension FreightEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FreightEntity, $Out> {
  FreightEntityCopyWith<$R, FreightEntity, $Out> get $asFreightEntity =>
      $base.as((v, t, t2) => _FreightEntityCopyWithImpl(v, t, t2));
}

abstract class FreightEntityCopyWith<$R, $In extends FreightEntity, $Out>
    implements EntityCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {int? id,
      String? origin,
      String? destination,
      FreightStatus? status,
      String? loadOwnerName,
      String? loadOwnerPhone});
  FreightEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _FreightEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FreightEntity, $Out>
    implements FreightEntityCopyWith<$R, FreightEntity, $Out> {
  _FreightEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FreightEntity> $mapper =
      FreightEntityMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          String? origin,
          String? destination,
          FreightStatus? status,
          String? loadOwnerName,
          String? loadOwnerPhone}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (origin != null) #origin: origin,
        if (destination != null) #destination: destination,
        if (status != null) #status: status,
        if (loadOwnerName != null) #loadOwnerName: loadOwnerName,
        if (loadOwnerPhone != null) #loadOwnerPhone: loadOwnerPhone
      }));
  @override
  FreightEntity $make(CopyWithData data) => FreightEntity(
      id: data.get(#id, or: $value.id),
      origin: data.get(#origin, or: $value.origin),
      destination: data.get(#destination, or: $value.destination),
      status: data.get(#status, or: $value.status),
      loadOwnerName: data.get(#loadOwnerName, or: $value.loadOwnerName),
      loadOwnerPhone: data.get(#loadOwnerPhone, or: $value.loadOwnerPhone));

  @override
  FreightEntityCopyWith<$R2, FreightEntity, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _FreightEntityCopyWithImpl($value, $cast, t);
}

class FreightEntityFilterMapper extends ClassMapperBase<FreightEntityFilter> {
  FreightEntityFilterMapper._();

  static FreightEntityFilterMapper? _instance;
  static FreightEntityFilterMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FreightEntityFilterMapper._());
      EntityFilterMapper.ensureInitialized();
      FreightStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'FreightEntityFilter';

  static int? _$id(FreightEntityFilter v) => v.id;
  static const Field<FreightEntityFilter, int> _f$id =
      Field('id', _$id, opt: true);
  static FreightStatus? _$status(FreightEntityFilter v) => v.status;
  static const Field<FreightEntityFilter, FreightStatus> _f$status =
      Field('status', _$status, opt: true);
  static String? _$origin(FreightEntityFilter v) => v.origin;
  static const Field<FreightEntityFilter, String> _f$origin =
      Field('origin', _$origin, opt: true);
  static String? _$destination(FreightEntityFilter v) => v.destination;
  static const Field<FreightEntityFilter, String> _f$destination =
      Field('destination', _$destination, opt: true);
  static int _$offset(FreightEntityFilter v) => v.offset;
  static const Field<FreightEntityFilter, int> _f$offset =
      Field('offset', _$offset, opt: true, def: 0);

  @override
  final MappableFields<FreightEntityFilter> fields = const {
    #id: _f$id,
    #status: _f$status,
    #origin: _f$origin,
    #destination: _f$destination,
    #offset: _f$offset,
  };

  static FreightEntityFilter _instantiate(DecodingData data) {
    return FreightEntityFilter(
        id: data.dec(_f$id),
        status: data.dec(_f$status),
        origin: data.dec(_f$origin),
        destination: data.dec(_f$destination),
        offset: data.dec(_f$offset));
  }

  @override
  final Function instantiate = _instantiate;

  static FreightEntityFilter fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FreightEntityFilter>(map);
  }

  static FreightEntityFilter fromJsonString(String json) {
    return ensureInitialized().decodeJson<FreightEntityFilter>(json);
  }
}

mixin FreightEntityFilterMappable {
  String toJsonString() {
    return FreightEntityFilterMapper.ensureInitialized()
        .encodeJson<FreightEntityFilter>(this as FreightEntityFilter);
  }

  Map<String, dynamic> toJson() {
    return FreightEntityFilterMapper.ensureInitialized()
        .encodeMap<FreightEntityFilter>(this as FreightEntityFilter);
  }

  FreightEntityFilterCopyWith<FreightEntityFilter, FreightEntityFilter,
          FreightEntityFilter>
      get copyWith => _FreightEntityFilterCopyWithImpl(
          this as FreightEntityFilter, $identity, $identity);
  @override
  String toString() {
    return FreightEntityFilterMapper.ensureInitialized()
        .stringifyValue(this as FreightEntityFilter);
  }

  @override
  bool operator ==(Object other) {
    return FreightEntityFilterMapper.ensureInitialized()
        .equalsValue(this as FreightEntityFilter, other);
  }

  @override
  int get hashCode {
    return FreightEntityFilterMapper.ensureInitialized()
        .hashValue(this as FreightEntityFilter);
  }
}

extension FreightEntityFilterValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FreightEntityFilter, $Out> {
  FreightEntityFilterCopyWith<$R, FreightEntityFilter, $Out>
      get $asFreightEntityFilter =>
          $base.as((v, t, t2) => _FreightEntityFilterCopyWithImpl(v, t, t2));
}

abstract class FreightEntityFilterCopyWith<$R, $In extends FreightEntityFilter,
    $Out> implements EntityFilterCopyWith<$R, $In, $Out> {
  @override
  $R call(
      {int? id,
      FreightStatus? status,
      String? origin,
      String? destination,
      int? offset});
  FreightEntityFilterCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _FreightEntityFilterCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FreightEntityFilter, $Out>
    implements FreightEntityFilterCopyWith<$R, FreightEntityFilter, $Out> {
  _FreightEntityFilterCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FreightEntityFilter> $mapper =
      FreightEntityFilterMapper.ensureInitialized();
  @override
  $R call(
          {Object? id = $none,
          Object? status = $none,
          Object? origin = $none,
          Object? destination = $none,
          int? offset}) =>
      $apply(FieldCopyWithData({
        if (id != $none) #id: id,
        if (status != $none) #status: status,
        if (origin != $none) #origin: origin,
        if (destination != $none) #destination: destination,
        if (offset != null) #offset: offset
      }));
  @override
  FreightEntityFilter $make(CopyWithData data) => FreightEntityFilter(
      id: data.get(#id, or: $value.id),
      status: data.get(#status, or: $value.status),
      origin: data.get(#origin, or: $value.origin),
      destination: data.get(#destination, or: $value.destination),
      offset: data.get(#offset, or: $value.offset));

  @override
  FreightEntityFilterCopyWith<$R2, FreightEntityFilter, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _FreightEntityFilterCopyWithImpl($value, $cast, t);
}
