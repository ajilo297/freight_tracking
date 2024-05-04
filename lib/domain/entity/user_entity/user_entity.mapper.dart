// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user_entity.dart';

class UserEntityMapper extends ClassMapperBase<UserEntity> {
  UserEntityMapper._();

  static UserEntityMapper? _instance;
  static UserEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserEntityMapper._());
      EntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UserEntity';

  static String _$email(UserEntity v) => v.email;
  static const Field<UserEntity, String> _f$email = Field('email', _$email);
  static String _$hashedPassword(UserEntity v) => v.hashedPassword;
  static const Field<UserEntity, String> _f$hashedPassword =
      Field('hashedPassword', _$hashedPassword);
  static String _$name(UserEntity v) => v.name;
  static const Field<UserEntity, String> _f$name = Field('name', _$name);

  @override
  final MappableFields<UserEntity> fields = const {
    #email: _f$email,
    #hashedPassword: _f$hashedPassword,
    #name: _f$name,
  };

  static UserEntity _instantiate(DecodingData data) {
    return UserEntity(
        email: data.dec(_f$email),
        hashedPassword: data.dec(_f$hashedPassword),
        name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static UserEntity fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserEntity>(map);
  }

  static UserEntity fromJsonString(String json) {
    return ensureInitialized().decodeJson<UserEntity>(json);
  }
}

mixin UserEntityMappable {
  String toJsonString() {
    return UserEntityMapper.ensureInitialized()
        .encodeJson<UserEntity>(this as UserEntity);
  }

  Map<String, dynamic> toJson() {
    return UserEntityMapper.ensureInitialized()
        .encodeMap<UserEntity>(this as UserEntity);
  }

  UserEntityCopyWith<UserEntity, UserEntity, UserEntity> get copyWith =>
      _UserEntityCopyWithImpl(this as UserEntity, $identity, $identity);
  @override
  String toString() {
    return UserEntityMapper.ensureInitialized()
        .stringifyValue(this as UserEntity);
  }

  @override
  bool operator ==(Object other) {
    return UserEntityMapper.ensureInitialized()
        .equalsValue(this as UserEntity, other);
  }

  @override
  int get hashCode {
    return UserEntityMapper.ensureInitialized().hashValue(this as UserEntity);
  }
}

extension UserEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserEntity, $Out> {
  UserEntityCopyWith<$R, UserEntity, $Out> get $asUserEntity =>
      $base.as((v, t, t2) => _UserEntityCopyWithImpl(v, t, t2));
}

abstract class UserEntityCopyWith<$R, $In extends UserEntity, $Out>
    implements EntityCopyWith<$R, $In, $Out> {
  @override
  $R call({String? email, String? hashedPassword, String? name});
  UserEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserEntity, $Out>
    implements UserEntityCopyWith<$R, UserEntity, $Out> {
  _UserEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserEntity> $mapper =
      UserEntityMapper.ensureInitialized();
  @override
  $R call({String? email, String? hashedPassword, String? name}) =>
      $apply(FieldCopyWithData({
        if (email != null) #email: email,
        if (hashedPassword != null) #hashedPassword: hashedPassword,
        if (name != null) #name: name
      }));
  @override
  UserEntity $make(CopyWithData data) => UserEntity(
      email: data.get(#email, or: $value.email),
      hashedPassword: data.get(#hashedPassword, or: $value.hashedPassword),
      name: data.get(#name, or: $value.name));

  @override
  UserEntityCopyWith<$R2, UserEntity, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _UserEntityCopyWithImpl($value, $cast, t);
}
