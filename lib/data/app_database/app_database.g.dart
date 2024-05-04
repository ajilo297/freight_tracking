// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UserTable extends User with TableInfo<$UserTable, UserData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _hashedPasswordMeta =
      const VerificationMeta('hashedPassword');
  @override
  late final GeneratedColumn<String> hashedPassword = GeneratedColumn<String>(
      'hashed_password', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isLoggedInMeta =
      const VerificationMeta('isLoggedIn');
  @override
  late final GeneratedColumn<bool> isLoggedIn = GeneratedColumn<bool>(
      'is_logged_in', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_logged_in" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [email, hashedPassword, name, isLoggedIn];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user';
  @override
  VerificationContext validateIntegrity(Insertable<UserData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('hashed_password')) {
      context.handle(
          _hashedPasswordMeta,
          hashedPassword.isAcceptableOrUnknown(
              data['hashed_password']!, _hashedPasswordMeta));
    } else if (isInserting) {
      context.missing(_hashedPasswordMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('is_logged_in')) {
      context.handle(
          _isLoggedInMeta,
          isLoggedIn.isAcceptableOrUnknown(
              data['is_logged_in']!, _isLoggedInMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {email};
  @override
  UserData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserData(
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      hashedPassword: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}hashed_password'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      isLoggedIn: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_logged_in'])!,
    );
  }

  @override
  $UserTable createAlias(String alias) {
    return $UserTable(attachedDatabase, alias);
  }
}

class UserData extends DataClass implements Insertable<UserData> {
  final String email;
  final String hashedPassword;
  final String name;
  final bool isLoggedIn;
  const UserData(
      {required this.email,
      required this.hashedPassword,
      required this.name,
      required this.isLoggedIn});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['email'] = Variable<String>(email);
    map['hashed_password'] = Variable<String>(hashedPassword);
    map['name'] = Variable<String>(name);
    map['is_logged_in'] = Variable<bool>(isLoggedIn);
    return map;
  }

  UserCompanion toCompanion(bool nullToAbsent) {
    return UserCompanion(
      email: Value(email),
      hashedPassword: Value(hashedPassword),
      name: Value(name),
      isLoggedIn: Value(isLoggedIn),
    );
  }

  factory UserData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserData(
      email: serializer.fromJson<String>(json['email']),
      hashedPassword: serializer.fromJson<String>(json['hashedPassword']),
      name: serializer.fromJson<String>(json['name']),
      isLoggedIn: serializer.fromJson<bool>(json['isLoggedIn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'email': serializer.toJson<String>(email),
      'hashedPassword': serializer.toJson<String>(hashedPassword),
      'name': serializer.toJson<String>(name),
      'isLoggedIn': serializer.toJson<bool>(isLoggedIn),
    };
  }

  UserData copyWith(
          {String? email,
          String? hashedPassword,
          String? name,
          bool? isLoggedIn}) =>
      UserData(
        email: email ?? this.email,
        hashedPassword: hashedPassword ?? this.hashedPassword,
        name: name ?? this.name,
        isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      );
  @override
  String toString() {
    return (StringBuffer('UserData(')
          ..write('email: $email, ')
          ..write('hashedPassword: $hashedPassword, ')
          ..write('name: $name, ')
          ..write('isLoggedIn: $isLoggedIn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(email, hashedPassword, name, isLoggedIn);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserData &&
          other.email == this.email &&
          other.hashedPassword == this.hashedPassword &&
          other.name == this.name &&
          other.isLoggedIn == this.isLoggedIn);
}

class UserCompanion extends UpdateCompanion<UserData> {
  final Value<String> email;
  final Value<String> hashedPassword;
  final Value<String> name;
  final Value<bool> isLoggedIn;
  final Value<int> rowid;
  const UserCompanion({
    this.email = const Value.absent(),
    this.hashedPassword = const Value.absent(),
    this.name = const Value.absent(),
    this.isLoggedIn = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserCompanion.insert({
    required String email,
    required String hashedPassword,
    required String name,
    this.isLoggedIn = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : email = Value(email),
        hashedPassword = Value(hashedPassword),
        name = Value(name);
  static Insertable<UserData> custom({
    Expression<String>? email,
    Expression<String>? hashedPassword,
    Expression<String>? name,
    Expression<bool>? isLoggedIn,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (email != null) 'email': email,
      if (hashedPassword != null) 'hashed_password': hashedPassword,
      if (name != null) 'name': name,
      if (isLoggedIn != null) 'is_logged_in': isLoggedIn,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserCompanion copyWith(
      {Value<String>? email,
      Value<String>? hashedPassword,
      Value<String>? name,
      Value<bool>? isLoggedIn,
      Value<int>? rowid}) {
    return UserCompanion(
      email: email ?? this.email,
      hashedPassword: hashedPassword ?? this.hashedPassword,
      name: name ?? this.name,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (hashedPassword.present) {
      map['hashed_password'] = Variable<String>(hashedPassword.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (isLoggedIn.present) {
      map['is_logged_in'] = Variable<bool>(isLoggedIn.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserCompanion(')
          ..write('email: $email, ')
          ..write('hashedPassword: $hashedPassword, ')
          ..write('name: $name, ')
          ..write('isLoggedIn: $isLoggedIn, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FreightTable extends Freight with TableInfo<$FreightTable, FreightData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FreightTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _originMeta = const VerificationMeta('origin');
  @override
  late final GeneratedColumn<String> origin = GeneratedColumn<String>(
      'origin', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _destinationMeta =
      const VerificationMeta('destination');
  @override
  late final GeneratedColumn<String> destination = GeneratedColumn<String>(
      'destination', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _loadOwnerNameMeta =
      const VerificationMeta('loadOwnerName');
  @override
  late final GeneratedColumn<String> loadOwnerName = GeneratedColumn<String>(
      'load_owner_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _loadOwnerPhoneMeta =
      const VerificationMeta('loadOwnerPhone');
  @override
  late final GeneratedColumn<String> loadOwnerPhone = GeneratedColumn<String>(
      'load_owner_phone', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumnWithTypeConverter<FreightStatus, String> status =
      GeneratedColumn<String>('status', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<FreightStatus>($FreightTable.$converterstatus);
  @override
  List<GeneratedColumn> get $columns =>
      [id, origin, destination, loadOwnerName, loadOwnerPhone, status];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'freight';
  @override
  VerificationContext validateIntegrity(Insertable<FreightData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('origin')) {
      context.handle(_originMeta,
          origin.isAcceptableOrUnknown(data['origin']!, _originMeta));
    } else if (isInserting) {
      context.missing(_originMeta);
    }
    if (data.containsKey('destination')) {
      context.handle(
          _destinationMeta,
          destination.isAcceptableOrUnknown(
              data['destination']!, _destinationMeta));
    } else if (isInserting) {
      context.missing(_destinationMeta);
    }
    if (data.containsKey('load_owner_name')) {
      context.handle(
          _loadOwnerNameMeta,
          loadOwnerName.isAcceptableOrUnknown(
              data['load_owner_name']!, _loadOwnerNameMeta));
    } else if (isInserting) {
      context.missing(_loadOwnerNameMeta);
    }
    if (data.containsKey('load_owner_phone')) {
      context.handle(
          _loadOwnerPhoneMeta,
          loadOwnerPhone.isAcceptableOrUnknown(
              data['load_owner_phone']!, _loadOwnerPhoneMeta));
    } else if (isInserting) {
      context.missing(_loadOwnerPhoneMeta);
    }
    context.handle(_statusMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FreightData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FreightData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      origin: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}origin'])!,
      destination: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}destination'])!,
      loadOwnerName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}load_owner_name'])!,
      loadOwnerPhone: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}load_owner_phone'])!,
      status: $FreightTable.$converterstatus.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!),
    );
  }

  @override
  $FreightTable createAlias(String alias) {
    return $FreightTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<FreightStatus, String, String> $converterstatus =
      const EnumNameConverter<FreightStatus>(FreightStatus.values);
}

class FreightData extends DataClass implements Insertable<FreightData> {
  final int id;
  final String origin;
  final String destination;
  final String loadOwnerName;
  final String loadOwnerPhone;
  final FreightStatus status;
  const FreightData(
      {required this.id,
      required this.origin,
      required this.destination,
      required this.loadOwnerName,
      required this.loadOwnerPhone,
      required this.status});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['origin'] = Variable<String>(origin);
    map['destination'] = Variable<String>(destination);
    map['load_owner_name'] = Variable<String>(loadOwnerName);
    map['load_owner_phone'] = Variable<String>(loadOwnerPhone);
    {
      map['status'] =
          Variable<String>($FreightTable.$converterstatus.toSql(status));
    }
    return map;
  }

  FreightCompanion toCompanion(bool nullToAbsent) {
    return FreightCompanion(
      id: Value(id),
      origin: Value(origin),
      destination: Value(destination),
      loadOwnerName: Value(loadOwnerName),
      loadOwnerPhone: Value(loadOwnerPhone),
      status: Value(status),
    );
  }

  factory FreightData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FreightData(
      id: serializer.fromJson<int>(json['id']),
      origin: serializer.fromJson<String>(json['origin']),
      destination: serializer.fromJson<String>(json['destination']),
      loadOwnerName: serializer.fromJson<String>(json['loadOwnerName']),
      loadOwnerPhone: serializer.fromJson<String>(json['loadOwnerPhone']),
      status: $FreightTable.$converterstatus
          .fromJson(serializer.fromJson<String>(json['status'])),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'origin': serializer.toJson<String>(origin),
      'destination': serializer.toJson<String>(destination),
      'loadOwnerName': serializer.toJson<String>(loadOwnerName),
      'loadOwnerPhone': serializer.toJson<String>(loadOwnerPhone),
      'status': serializer
          .toJson<String>($FreightTable.$converterstatus.toJson(status)),
    };
  }

  FreightData copyWith(
          {int? id,
          String? origin,
          String? destination,
          String? loadOwnerName,
          String? loadOwnerPhone,
          FreightStatus? status}) =>
      FreightData(
        id: id ?? this.id,
        origin: origin ?? this.origin,
        destination: destination ?? this.destination,
        loadOwnerName: loadOwnerName ?? this.loadOwnerName,
        loadOwnerPhone: loadOwnerPhone ?? this.loadOwnerPhone,
        status: status ?? this.status,
      );
  @override
  String toString() {
    return (StringBuffer('FreightData(')
          ..write('id: $id, ')
          ..write('origin: $origin, ')
          ..write('destination: $destination, ')
          ..write('loadOwnerName: $loadOwnerName, ')
          ..write('loadOwnerPhone: $loadOwnerPhone, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, origin, destination, loadOwnerName, loadOwnerPhone, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FreightData &&
          other.id == this.id &&
          other.origin == this.origin &&
          other.destination == this.destination &&
          other.loadOwnerName == this.loadOwnerName &&
          other.loadOwnerPhone == this.loadOwnerPhone &&
          other.status == this.status);
}

class FreightCompanion extends UpdateCompanion<FreightData> {
  final Value<int> id;
  final Value<String> origin;
  final Value<String> destination;
  final Value<String> loadOwnerName;
  final Value<String> loadOwnerPhone;
  final Value<FreightStatus> status;
  const FreightCompanion({
    this.id = const Value.absent(),
    this.origin = const Value.absent(),
    this.destination = const Value.absent(),
    this.loadOwnerName = const Value.absent(),
    this.loadOwnerPhone = const Value.absent(),
    this.status = const Value.absent(),
  });
  FreightCompanion.insert({
    this.id = const Value.absent(),
    required String origin,
    required String destination,
    required String loadOwnerName,
    required String loadOwnerPhone,
    required FreightStatus status,
  })  : origin = Value(origin),
        destination = Value(destination),
        loadOwnerName = Value(loadOwnerName),
        loadOwnerPhone = Value(loadOwnerPhone),
        status = Value(status);
  static Insertable<FreightData> custom({
    Expression<int>? id,
    Expression<String>? origin,
    Expression<String>? destination,
    Expression<String>? loadOwnerName,
    Expression<String>? loadOwnerPhone,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (origin != null) 'origin': origin,
      if (destination != null) 'destination': destination,
      if (loadOwnerName != null) 'load_owner_name': loadOwnerName,
      if (loadOwnerPhone != null) 'load_owner_phone': loadOwnerPhone,
      if (status != null) 'status': status,
    });
  }

  FreightCompanion copyWith(
      {Value<int>? id,
      Value<String>? origin,
      Value<String>? destination,
      Value<String>? loadOwnerName,
      Value<String>? loadOwnerPhone,
      Value<FreightStatus>? status}) {
    return FreightCompanion(
      id: id ?? this.id,
      origin: origin ?? this.origin,
      destination: destination ?? this.destination,
      loadOwnerName: loadOwnerName ?? this.loadOwnerName,
      loadOwnerPhone: loadOwnerPhone ?? this.loadOwnerPhone,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (origin.present) {
      map['origin'] = Variable<String>(origin.value);
    }
    if (destination.present) {
      map['destination'] = Variable<String>(destination.value);
    }
    if (loadOwnerName.present) {
      map['load_owner_name'] = Variable<String>(loadOwnerName.value);
    }
    if (loadOwnerPhone.present) {
      map['load_owner_phone'] = Variable<String>(loadOwnerPhone.value);
    }
    if (status.present) {
      map['status'] =
          Variable<String>($FreightTable.$converterstatus.toSql(status.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FreightCompanion(')
          ..write('id: $id, ')
          ..write('origin: $origin, ')
          ..write('destination: $destination, ')
          ..write('loadOwnerName: $loadOwnerName, ')
          ..write('loadOwnerPhone: $loadOwnerPhone, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $UserTable user = $UserTable(this);
  late final $FreightTable freight = $FreightTable(this);
  late final UserDao userDao = UserDao(this as AppDatabase);
  late final FreightDao freightDao = FreightDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [user, freight];
}
