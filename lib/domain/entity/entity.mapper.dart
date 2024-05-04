// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'entity.dart';

class EntityMapper extends ClassMapperBase<Entity> {
  EntityMapper._();

  static EntityMapper? _instance;
  static EntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = EntityMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Entity';

  @override
  final MappableFields<Entity> fields = const {};

  static Entity _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('Entity');
  }

  @override
  final Function instantiate = _instantiate;

  static Entity fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Entity>(map);
  }

  static Entity fromJsonString(String json) {
    return ensureInitialized().decodeJson<Entity>(json);
  }
}

mixin EntityMappable {
  String toJsonString();
  Map<String, dynamic> toJson();
  EntityCopyWith<Entity, Entity, Entity> get copyWith;
}

abstract class EntityCopyWith<$R, $In extends Entity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  EntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class EntityFilterMapper extends ClassMapperBase<EntityFilter> {
  EntityFilterMapper._();

  static EntityFilterMapper? _instance;
  static EntityFilterMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = EntityFilterMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'EntityFilter';

  static int _$offset(EntityFilter v) => v.offset;
  static const Field<EntityFilter, int> _f$offset =
      Field('offset', _$offset, opt: true, def: 0);

  @override
  final MappableFields<EntityFilter> fields = const {
    #offset: _f$offset,
  };

  static EntityFilter _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('EntityFilter');
  }

  @override
  final Function instantiate = _instantiate;

  static EntityFilter fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<EntityFilter>(map);
  }

  static EntityFilter fromJsonString(String json) {
    return ensureInitialized().decodeJson<EntityFilter>(json);
  }
}

mixin EntityFilterMappable {
  String toJsonString();
  Map<String, dynamic> toJson();
  EntityFilterCopyWith<EntityFilter, EntityFilter, EntityFilter> get copyWith;
}

abstract class EntityFilterCopyWith<$R, $In extends EntityFilter, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? offset});
  EntityFilterCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}
