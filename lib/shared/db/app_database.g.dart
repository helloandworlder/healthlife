// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UserProfilesTable extends UserProfiles
    with TableInfo<$UserProfilesTable, UserProfile> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
    'gender',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<double> height = GeneratedColumn<double>(
    'height',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
    'weight',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _birthdayMeta = const VerificationMeta(
    'birthday',
  );
  @override
  late final GeneratedColumn<DateTime> birthday = GeneratedColumn<DateTime>(
    'birthday',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _activityLevelMeta = const VerificationMeta(
    'activityLevel',
  );
  @override
  late final GeneratedColumn<String> activityLevel = GeneratedColumn<String>(
    'activity_level',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('sedentary'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    gender,
    height,
    weight,
    birthday,
    activityLevel,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_profiles';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserProfile> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('gender')) {
      context.handle(
        _genderMeta,
        gender.isAcceptableOrUnknown(data['gender']!, _genderMeta),
      );
    }
    if (data.containsKey('height')) {
      context.handle(
        _heightMeta,
        height.isAcceptableOrUnknown(data['height']!, _heightMeta),
      );
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    }
    if (data.containsKey('birthday')) {
      context.handle(
        _birthdayMeta,
        birthday.isAcceptableOrUnknown(data['birthday']!, _birthdayMeta),
      );
    }
    if (data.containsKey('activity_level')) {
      context.handle(
        _activityLevelMeta,
        activityLevel.isAcceptableOrUnknown(
          data['activity_level']!,
          _activityLevelMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserProfile map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserProfile(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      gender: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gender'],
      ),
      height: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}height'],
      ),
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight'],
      ),
      birthday: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}birthday'],
      ),
      activityLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}activity_level'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $UserProfilesTable createAlias(String alias) {
    return $UserProfilesTable(attachedDatabase, alias);
  }
}

class UserProfile extends DataClass implements Insertable<UserProfile> {
  final int id;
  final String? gender;
  final double? height;
  final double? weight;
  final DateTime? birthday;
  final String activityLevel;
  final DateTime createdAt;
  final DateTime updatedAt;
  const UserProfile({
    required this.id,
    this.gender,
    this.height,
    this.weight,
    this.birthday,
    required this.activityLevel,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || gender != null) {
      map['gender'] = Variable<String>(gender);
    }
    if (!nullToAbsent || height != null) {
      map['height'] = Variable<double>(height);
    }
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<double>(weight);
    }
    if (!nullToAbsent || birthday != null) {
      map['birthday'] = Variable<DateTime>(birthday);
    }
    map['activity_level'] = Variable<String>(activityLevel);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  UserProfilesCompanion toCompanion(bool nullToAbsent) {
    return UserProfilesCompanion(
      id: Value(id),
      gender: gender == null && nullToAbsent
          ? const Value.absent()
          : Value(gender),
      height: height == null && nullToAbsent
          ? const Value.absent()
          : Value(height),
      weight: weight == null && nullToAbsent
          ? const Value.absent()
          : Value(weight),
      birthday: birthday == null && nullToAbsent
          ? const Value.absent()
          : Value(birthday),
      activityLevel: Value(activityLevel),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory UserProfile.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserProfile(
      id: serializer.fromJson<int>(json['id']),
      gender: serializer.fromJson<String?>(json['gender']),
      height: serializer.fromJson<double?>(json['height']),
      weight: serializer.fromJson<double?>(json['weight']),
      birthday: serializer.fromJson<DateTime?>(json['birthday']),
      activityLevel: serializer.fromJson<String>(json['activityLevel']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'gender': serializer.toJson<String?>(gender),
      'height': serializer.toJson<double?>(height),
      'weight': serializer.toJson<double?>(weight),
      'birthday': serializer.toJson<DateTime?>(birthday),
      'activityLevel': serializer.toJson<String>(activityLevel),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  UserProfile copyWith({
    int? id,
    Value<String?> gender = const Value.absent(),
    Value<double?> height = const Value.absent(),
    Value<double?> weight = const Value.absent(),
    Value<DateTime?> birthday = const Value.absent(),
    String? activityLevel,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => UserProfile(
    id: id ?? this.id,
    gender: gender.present ? gender.value : this.gender,
    height: height.present ? height.value : this.height,
    weight: weight.present ? weight.value : this.weight,
    birthday: birthday.present ? birthday.value : this.birthday,
    activityLevel: activityLevel ?? this.activityLevel,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  UserProfile copyWithCompanion(UserProfilesCompanion data) {
    return UserProfile(
      id: data.id.present ? data.id.value : this.id,
      gender: data.gender.present ? data.gender.value : this.gender,
      height: data.height.present ? data.height.value : this.height,
      weight: data.weight.present ? data.weight.value : this.weight,
      birthday: data.birthday.present ? data.birthday.value : this.birthday,
      activityLevel: data.activityLevel.present
          ? data.activityLevel.value
          : this.activityLevel,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserProfile(')
          ..write('id: $id, ')
          ..write('gender: $gender, ')
          ..write('height: $height, ')
          ..write('weight: $weight, ')
          ..write('birthday: $birthday, ')
          ..write('activityLevel: $activityLevel, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    gender,
    height,
    weight,
    birthday,
    activityLevel,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserProfile &&
          other.id == this.id &&
          other.gender == this.gender &&
          other.height == this.height &&
          other.weight == this.weight &&
          other.birthday == this.birthday &&
          other.activityLevel == this.activityLevel &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class UserProfilesCompanion extends UpdateCompanion<UserProfile> {
  final Value<int> id;
  final Value<String?> gender;
  final Value<double?> height;
  final Value<double?> weight;
  final Value<DateTime?> birthday;
  final Value<String> activityLevel;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const UserProfilesCompanion({
    this.id = const Value.absent(),
    this.gender = const Value.absent(),
    this.height = const Value.absent(),
    this.weight = const Value.absent(),
    this.birthday = const Value.absent(),
    this.activityLevel = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  UserProfilesCompanion.insert({
    this.id = const Value.absent(),
    this.gender = const Value.absent(),
    this.height = const Value.absent(),
    this.weight = const Value.absent(),
    this.birthday = const Value.absent(),
    this.activityLevel = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  static Insertable<UserProfile> custom({
    Expression<int>? id,
    Expression<String>? gender,
    Expression<double>? height,
    Expression<double>? weight,
    Expression<DateTime>? birthday,
    Expression<String>? activityLevel,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (gender != null) 'gender': gender,
      if (height != null) 'height': height,
      if (weight != null) 'weight': weight,
      if (birthday != null) 'birthday': birthday,
      if (activityLevel != null) 'activity_level': activityLevel,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  UserProfilesCompanion copyWith({
    Value<int>? id,
    Value<String?>? gender,
    Value<double?>? height,
    Value<double?>? weight,
    Value<DateTime?>? birthday,
    Value<String>? activityLevel,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return UserProfilesCompanion(
      id: id ?? this.id,
      gender: gender ?? this.gender,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      birthday: birthday ?? this.birthday,
      activityLevel: activityLevel ?? this.activityLevel,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (height.present) {
      map['height'] = Variable<double>(height.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (birthday.present) {
      map['birthday'] = Variable<DateTime>(birthday.value);
    }
    if (activityLevel.present) {
      map['activity_level'] = Variable<String>(activityLevel.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserProfilesCompanion(')
          ..write('id: $id, ')
          ..write('gender: $gender, ')
          ..write('height: $height, ')
          ..write('weight: $weight, ')
          ..write('birthday: $birthday, ')
          ..write('activityLevel: $activityLevel, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $PlansTable extends Plans with TableInfo<$PlansTable, Plan> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlansTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _initialWeightMeta = const VerificationMeta(
    'initialWeight',
  );
  @override
  late final GeneratedColumn<double> initialWeight = GeneratedColumn<double>(
    'initial_weight',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _targetWeightMeta = const VerificationMeta(
    'targetWeight',
  );
  @override
  late final GeneratedColumn<double> targetWeight = GeneratedColumn<double>(
    'target_weight',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _durationDaysMeta = const VerificationMeta(
    'durationDays',
  );
  @override
  late final GeneratedColumn<int> durationDays = GeneratedColumn<int>(
    'duration_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dailyCalorieDeficitMeta =
      const VerificationMeta('dailyCalorieDeficit');
  @override
  late final GeneratedColumn<int> dailyCalorieDeficit = GeneratedColumn<int>(
    'daily_calorie_deficit',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(500),
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
    'end_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    initialWeight,
    targetWeight,
    durationDays,
    dailyCalorieDeficit,
    startDate,
    endDate,
    isActive,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'plans';
  @override
  VerificationContext validateIntegrity(
    Insertable<Plan> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('initial_weight')) {
      context.handle(
        _initialWeightMeta,
        initialWeight.isAcceptableOrUnknown(
          data['initial_weight']!,
          _initialWeightMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_initialWeightMeta);
    }
    if (data.containsKey('target_weight')) {
      context.handle(
        _targetWeightMeta,
        targetWeight.isAcceptableOrUnknown(
          data['target_weight']!,
          _targetWeightMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_targetWeightMeta);
    }
    if (data.containsKey('duration_days')) {
      context.handle(
        _durationDaysMeta,
        durationDays.isAcceptableOrUnknown(
          data['duration_days']!,
          _durationDaysMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_durationDaysMeta);
    }
    if (data.containsKey('daily_calorie_deficit')) {
      context.handle(
        _dailyCalorieDeficitMeta,
        dailyCalorieDeficit.isAcceptableOrUnknown(
          data['daily_calorie_deficit']!,
          _dailyCalorieDeficitMeta,
        ),
      );
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    } else if (isInserting) {
      context.missing(_endDateMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Plan map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Plan(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      initialWeight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}initial_weight'],
      )!,
      targetWeight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}target_weight'],
      )!,
      durationDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_days'],
      )!,
      dailyCalorieDeficit: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}daily_calorie_deficit'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      )!,
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_date'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $PlansTable createAlias(String alias) {
    return $PlansTable(attachedDatabase, alias);
  }
}

class Plan extends DataClass implements Insertable<Plan> {
  final int id;
  final double initialWeight;
  final double targetWeight;
  final int durationDays;
  final int dailyCalorieDeficit;
  final DateTime startDate;
  final DateTime endDate;
  final bool isActive;
  final DateTime createdAt;
  const Plan({
    required this.id,
    required this.initialWeight,
    required this.targetWeight,
    required this.durationDays,
    required this.dailyCalorieDeficit,
    required this.startDate,
    required this.endDate,
    required this.isActive,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['initial_weight'] = Variable<double>(initialWeight);
    map['target_weight'] = Variable<double>(targetWeight);
    map['duration_days'] = Variable<int>(durationDays);
    map['daily_calorie_deficit'] = Variable<int>(dailyCalorieDeficit);
    map['start_date'] = Variable<DateTime>(startDate);
    map['end_date'] = Variable<DateTime>(endDate);
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PlansCompanion toCompanion(bool nullToAbsent) {
    return PlansCompanion(
      id: Value(id),
      initialWeight: Value(initialWeight),
      targetWeight: Value(targetWeight),
      durationDays: Value(durationDays),
      dailyCalorieDeficit: Value(dailyCalorieDeficit),
      startDate: Value(startDate),
      endDate: Value(endDate),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
    );
  }

  factory Plan.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Plan(
      id: serializer.fromJson<int>(json['id']),
      initialWeight: serializer.fromJson<double>(json['initialWeight']),
      targetWeight: serializer.fromJson<double>(json['targetWeight']),
      durationDays: serializer.fromJson<int>(json['durationDays']),
      dailyCalorieDeficit: serializer.fromJson<int>(
        json['dailyCalorieDeficit'],
      ),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime>(json['endDate']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'initialWeight': serializer.toJson<double>(initialWeight),
      'targetWeight': serializer.toJson<double>(targetWeight),
      'durationDays': serializer.toJson<int>(durationDays),
      'dailyCalorieDeficit': serializer.toJson<int>(dailyCalorieDeficit),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime>(endDate),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Plan copyWith({
    int? id,
    double? initialWeight,
    double? targetWeight,
    int? durationDays,
    int? dailyCalorieDeficit,
    DateTime? startDate,
    DateTime? endDate,
    bool? isActive,
    DateTime? createdAt,
  }) => Plan(
    id: id ?? this.id,
    initialWeight: initialWeight ?? this.initialWeight,
    targetWeight: targetWeight ?? this.targetWeight,
    durationDays: durationDays ?? this.durationDays,
    dailyCalorieDeficit: dailyCalorieDeficit ?? this.dailyCalorieDeficit,
    startDate: startDate ?? this.startDate,
    endDate: endDate ?? this.endDate,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt ?? this.createdAt,
  );
  Plan copyWithCompanion(PlansCompanion data) {
    return Plan(
      id: data.id.present ? data.id.value : this.id,
      initialWeight: data.initialWeight.present
          ? data.initialWeight.value
          : this.initialWeight,
      targetWeight: data.targetWeight.present
          ? data.targetWeight.value
          : this.targetWeight,
      durationDays: data.durationDays.present
          ? data.durationDays.value
          : this.durationDays,
      dailyCalorieDeficit: data.dailyCalorieDeficit.present
          ? data.dailyCalorieDeficit.value
          : this.dailyCalorieDeficit,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Plan(')
          ..write('id: $id, ')
          ..write('initialWeight: $initialWeight, ')
          ..write('targetWeight: $targetWeight, ')
          ..write('durationDays: $durationDays, ')
          ..write('dailyCalorieDeficit: $dailyCalorieDeficit, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    initialWeight,
    targetWeight,
    durationDays,
    dailyCalorieDeficit,
    startDate,
    endDate,
    isActive,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Plan &&
          other.id == this.id &&
          other.initialWeight == this.initialWeight &&
          other.targetWeight == this.targetWeight &&
          other.durationDays == this.durationDays &&
          other.dailyCalorieDeficit == this.dailyCalorieDeficit &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt);
}

class PlansCompanion extends UpdateCompanion<Plan> {
  final Value<int> id;
  final Value<double> initialWeight;
  final Value<double> targetWeight;
  final Value<int> durationDays;
  final Value<int> dailyCalorieDeficit;
  final Value<DateTime> startDate;
  final Value<DateTime> endDate;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  const PlansCompanion({
    this.id = const Value.absent(),
    this.initialWeight = const Value.absent(),
    this.targetWeight = const Value.absent(),
    this.durationDays = const Value.absent(),
    this.dailyCalorieDeficit = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  PlansCompanion.insert({
    this.id = const Value.absent(),
    required double initialWeight,
    required double targetWeight,
    required int durationDays,
    this.dailyCalorieDeficit = const Value.absent(),
    required DateTime startDate,
    required DateTime endDate,
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : initialWeight = Value(initialWeight),
       targetWeight = Value(targetWeight),
       durationDays = Value(durationDays),
       startDate = Value(startDate),
       endDate = Value(endDate);
  static Insertable<Plan> custom({
    Expression<int>? id,
    Expression<double>? initialWeight,
    Expression<double>? targetWeight,
    Expression<int>? durationDays,
    Expression<int>? dailyCalorieDeficit,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (initialWeight != null) 'initial_weight': initialWeight,
      if (targetWeight != null) 'target_weight': targetWeight,
      if (durationDays != null) 'duration_days': durationDays,
      if (dailyCalorieDeficit != null)
        'daily_calorie_deficit': dailyCalorieDeficit,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  PlansCompanion copyWith({
    Value<int>? id,
    Value<double>? initialWeight,
    Value<double>? targetWeight,
    Value<int>? durationDays,
    Value<int>? dailyCalorieDeficit,
    Value<DateTime>? startDate,
    Value<DateTime>? endDate,
    Value<bool>? isActive,
    Value<DateTime>? createdAt,
  }) {
    return PlansCompanion(
      id: id ?? this.id,
      initialWeight: initialWeight ?? this.initialWeight,
      targetWeight: targetWeight ?? this.targetWeight,
      durationDays: durationDays ?? this.durationDays,
      dailyCalorieDeficit: dailyCalorieDeficit ?? this.dailyCalorieDeficit,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (initialWeight.present) {
      map['initial_weight'] = Variable<double>(initialWeight.value);
    }
    if (targetWeight.present) {
      map['target_weight'] = Variable<double>(targetWeight.value);
    }
    if (durationDays.present) {
      map['duration_days'] = Variable<int>(durationDays.value);
    }
    if (dailyCalorieDeficit.present) {
      map['daily_calorie_deficit'] = Variable<int>(dailyCalorieDeficit.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlansCompanion(')
          ..write('id: $id, ')
          ..write('initialWeight: $initialWeight, ')
          ..write('targetWeight: $targetWeight, ')
          ..write('durationDays: $durationDays, ')
          ..write('dailyCalorieDeficit: $dailyCalorieDeficit, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $WeightRecordsTable extends WeightRecords
    with TableInfo<$WeightRecordsTable, WeightRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WeightRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
    'weight',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recordedAtMeta = const VerificationMeta(
    'recordedAt',
  );
  @override
  late final GeneratedColumn<DateTime> recordedAt = GeneratedColumn<DateTime>(
    'recorded_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('manual'),
  );
  @override
  List<GeneratedColumn> get $columns => [id, weight, recordedAt, source];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'weight_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<WeightRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    if (data.containsKey('recorded_at')) {
      context.handle(
        _recordedAtMeta,
        recordedAt.isAcceptableOrUnknown(data['recorded_at']!, _recordedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_recordedAtMeta);
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WeightRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WeightRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight'],
      )!,
      recordedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}recorded_at'],
      )!,
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
    );
  }

  @override
  $WeightRecordsTable createAlias(String alias) {
    return $WeightRecordsTable(attachedDatabase, alias);
  }
}

class WeightRecord extends DataClass implements Insertable<WeightRecord> {
  final int id;
  final double weight;
  final DateTime recordedAt;
  final String source;
  const WeightRecord({
    required this.id,
    required this.weight,
    required this.recordedAt,
    required this.source,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['weight'] = Variable<double>(weight);
    map['recorded_at'] = Variable<DateTime>(recordedAt);
    map['source'] = Variable<String>(source);
    return map;
  }

  WeightRecordsCompanion toCompanion(bool nullToAbsent) {
    return WeightRecordsCompanion(
      id: Value(id),
      weight: Value(weight),
      recordedAt: Value(recordedAt),
      source: Value(source),
    );
  }

  factory WeightRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WeightRecord(
      id: serializer.fromJson<int>(json['id']),
      weight: serializer.fromJson<double>(json['weight']),
      recordedAt: serializer.fromJson<DateTime>(json['recordedAt']),
      source: serializer.fromJson<String>(json['source']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'weight': serializer.toJson<double>(weight),
      'recordedAt': serializer.toJson<DateTime>(recordedAt),
      'source': serializer.toJson<String>(source),
    };
  }

  WeightRecord copyWith({
    int? id,
    double? weight,
    DateTime? recordedAt,
    String? source,
  }) => WeightRecord(
    id: id ?? this.id,
    weight: weight ?? this.weight,
    recordedAt: recordedAt ?? this.recordedAt,
    source: source ?? this.source,
  );
  WeightRecord copyWithCompanion(WeightRecordsCompanion data) {
    return WeightRecord(
      id: data.id.present ? data.id.value : this.id,
      weight: data.weight.present ? data.weight.value : this.weight,
      recordedAt: data.recordedAt.present
          ? data.recordedAt.value
          : this.recordedAt,
      source: data.source.present ? data.source.value : this.source,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WeightRecord(')
          ..write('id: $id, ')
          ..write('weight: $weight, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('source: $source')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, weight, recordedAt, source);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WeightRecord &&
          other.id == this.id &&
          other.weight == this.weight &&
          other.recordedAt == this.recordedAt &&
          other.source == this.source);
}

class WeightRecordsCompanion extends UpdateCompanion<WeightRecord> {
  final Value<int> id;
  final Value<double> weight;
  final Value<DateTime> recordedAt;
  final Value<String> source;
  const WeightRecordsCompanion({
    this.id = const Value.absent(),
    this.weight = const Value.absent(),
    this.recordedAt = const Value.absent(),
    this.source = const Value.absent(),
  });
  WeightRecordsCompanion.insert({
    this.id = const Value.absent(),
    required double weight,
    required DateTime recordedAt,
    this.source = const Value.absent(),
  }) : weight = Value(weight),
       recordedAt = Value(recordedAt);
  static Insertable<WeightRecord> custom({
    Expression<int>? id,
    Expression<double>? weight,
    Expression<DateTime>? recordedAt,
    Expression<String>? source,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (weight != null) 'weight': weight,
      if (recordedAt != null) 'recorded_at': recordedAt,
      if (source != null) 'source': source,
    });
  }

  WeightRecordsCompanion copyWith({
    Value<int>? id,
    Value<double>? weight,
    Value<DateTime>? recordedAt,
    Value<String>? source,
  }) {
    return WeightRecordsCompanion(
      id: id ?? this.id,
      weight: weight ?? this.weight,
      recordedAt: recordedAt ?? this.recordedAt,
      source: source ?? this.source,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (recordedAt.present) {
      map['recorded_at'] = Variable<DateTime>(recordedAt.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WeightRecordsCompanion(')
          ..write('id: $id, ')
          ..write('weight: $weight, ')
          ..write('recordedAt: $recordedAt, ')
          ..write('source: $source')
          ..write(')'))
        .toString();
  }
}

class $MealLogsTable extends MealLogs with TableInfo<$MealLogsTable, MealLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MealLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _mealTypeMeta = const VerificationMeta(
    'mealType',
  );
  @override
  late final GeneratedColumn<String> mealType = GeneratedColumn<String>(
    'meal_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _foodNameMeta = const VerificationMeta(
    'foodName',
  );
  @override
  late final GeneratedColumn<String> foodName = GeneratedColumn<String>(
    'food_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _caloriesMeta = const VerificationMeta(
    'calories',
  );
  @override
  late final GeneratedColumn<int> calories = GeneratedColumn<int>(
    'calories',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _loggedAtMeta = const VerificationMeta(
    'loggedAt',
  );
  @override
  late final GeneratedColumn<DateTime> loggedAt = GeneratedColumn<DateTime>(
    'logged_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    mealType,
    foodName,
    calories,
    loggedAt,
    note,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'meal_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<MealLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('meal_type')) {
      context.handle(
        _mealTypeMeta,
        mealType.isAcceptableOrUnknown(data['meal_type']!, _mealTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_mealTypeMeta);
    }
    if (data.containsKey('food_name')) {
      context.handle(
        _foodNameMeta,
        foodName.isAcceptableOrUnknown(data['food_name']!, _foodNameMeta),
      );
    } else if (isInserting) {
      context.missing(_foodNameMeta);
    }
    if (data.containsKey('calories')) {
      context.handle(
        _caloriesMeta,
        calories.isAcceptableOrUnknown(data['calories']!, _caloriesMeta),
      );
    } else if (isInserting) {
      context.missing(_caloriesMeta);
    }
    if (data.containsKey('logged_at')) {
      context.handle(
        _loggedAtMeta,
        loggedAt.isAcceptableOrUnknown(data['logged_at']!, _loggedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_loggedAtMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MealLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MealLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      mealType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}meal_type'],
      )!,
      foodName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}food_name'],
      )!,
      calories: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}calories'],
      )!,
      loggedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}logged_at'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
    );
  }

  @override
  $MealLogsTable createAlias(String alias) {
    return $MealLogsTable(attachedDatabase, alias);
  }
}

class MealLog extends DataClass implements Insertable<MealLog> {
  final int id;
  final String mealType;
  final String foodName;
  final int calories;
  final DateTime loggedAt;
  final String? note;
  const MealLog({
    required this.id,
    required this.mealType,
    required this.foodName,
    required this.calories,
    required this.loggedAt,
    this.note,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['meal_type'] = Variable<String>(mealType);
    map['food_name'] = Variable<String>(foodName);
    map['calories'] = Variable<int>(calories);
    map['logged_at'] = Variable<DateTime>(loggedAt);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    return map;
  }

  MealLogsCompanion toCompanion(bool nullToAbsent) {
    return MealLogsCompanion(
      id: Value(id),
      mealType: Value(mealType),
      foodName: Value(foodName),
      calories: Value(calories),
      loggedAt: Value(loggedAt),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
    );
  }

  factory MealLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MealLog(
      id: serializer.fromJson<int>(json['id']),
      mealType: serializer.fromJson<String>(json['mealType']),
      foodName: serializer.fromJson<String>(json['foodName']),
      calories: serializer.fromJson<int>(json['calories']),
      loggedAt: serializer.fromJson<DateTime>(json['loggedAt']),
      note: serializer.fromJson<String?>(json['note']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'mealType': serializer.toJson<String>(mealType),
      'foodName': serializer.toJson<String>(foodName),
      'calories': serializer.toJson<int>(calories),
      'loggedAt': serializer.toJson<DateTime>(loggedAt),
      'note': serializer.toJson<String?>(note),
    };
  }

  MealLog copyWith({
    int? id,
    String? mealType,
    String? foodName,
    int? calories,
    DateTime? loggedAt,
    Value<String?> note = const Value.absent(),
  }) => MealLog(
    id: id ?? this.id,
    mealType: mealType ?? this.mealType,
    foodName: foodName ?? this.foodName,
    calories: calories ?? this.calories,
    loggedAt: loggedAt ?? this.loggedAt,
    note: note.present ? note.value : this.note,
  );
  MealLog copyWithCompanion(MealLogsCompanion data) {
    return MealLog(
      id: data.id.present ? data.id.value : this.id,
      mealType: data.mealType.present ? data.mealType.value : this.mealType,
      foodName: data.foodName.present ? data.foodName.value : this.foodName,
      calories: data.calories.present ? data.calories.value : this.calories,
      loggedAt: data.loggedAt.present ? data.loggedAt.value : this.loggedAt,
      note: data.note.present ? data.note.value : this.note,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MealLog(')
          ..write('id: $id, ')
          ..write('mealType: $mealType, ')
          ..write('foodName: $foodName, ')
          ..write('calories: $calories, ')
          ..write('loggedAt: $loggedAt, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, mealType, foodName, calories, loggedAt, note);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MealLog &&
          other.id == this.id &&
          other.mealType == this.mealType &&
          other.foodName == this.foodName &&
          other.calories == this.calories &&
          other.loggedAt == this.loggedAt &&
          other.note == this.note);
}

class MealLogsCompanion extends UpdateCompanion<MealLog> {
  final Value<int> id;
  final Value<String> mealType;
  final Value<String> foodName;
  final Value<int> calories;
  final Value<DateTime> loggedAt;
  final Value<String?> note;
  const MealLogsCompanion({
    this.id = const Value.absent(),
    this.mealType = const Value.absent(),
    this.foodName = const Value.absent(),
    this.calories = const Value.absent(),
    this.loggedAt = const Value.absent(),
    this.note = const Value.absent(),
  });
  MealLogsCompanion.insert({
    this.id = const Value.absent(),
    required String mealType,
    required String foodName,
    required int calories,
    required DateTime loggedAt,
    this.note = const Value.absent(),
  }) : mealType = Value(mealType),
       foodName = Value(foodName),
       calories = Value(calories),
       loggedAt = Value(loggedAt);
  static Insertable<MealLog> custom({
    Expression<int>? id,
    Expression<String>? mealType,
    Expression<String>? foodName,
    Expression<int>? calories,
    Expression<DateTime>? loggedAt,
    Expression<String>? note,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (mealType != null) 'meal_type': mealType,
      if (foodName != null) 'food_name': foodName,
      if (calories != null) 'calories': calories,
      if (loggedAt != null) 'logged_at': loggedAt,
      if (note != null) 'note': note,
    });
  }

  MealLogsCompanion copyWith({
    Value<int>? id,
    Value<String>? mealType,
    Value<String>? foodName,
    Value<int>? calories,
    Value<DateTime>? loggedAt,
    Value<String?>? note,
  }) {
    return MealLogsCompanion(
      id: id ?? this.id,
      mealType: mealType ?? this.mealType,
      foodName: foodName ?? this.foodName,
      calories: calories ?? this.calories,
      loggedAt: loggedAt ?? this.loggedAt,
      note: note ?? this.note,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (mealType.present) {
      map['meal_type'] = Variable<String>(mealType.value);
    }
    if (foodName.present) {
      map['food_name'] = Variable<String>(foodName.value);
    }
    if (calories.present) {
      map['calories'] = Variable<int>(calories.value);
    }
    if (loggedAt.present) {
      map['logged_at'] = Variable<DateTime>(loggedAt.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MealLogsCompanion(')
          ..write('id: $id, ')
          ..write('mealType: $mealType, ')
          ..write('foodName: $foodName, ')
          ..write('calories: $calories, ')
          ..write('loggedAt: $loggedAt, ')
          ..write('note: $note')
          ..write(')'))
        .toString();
  }
}

class $DailyMetricsTable extends DailyMetrics
    with TableInfo<$DailyMetricsTable, DailyMetric> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DailyMetricsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stepsMeta = const VerificationMeta('steps');
  @override
  late final GeneratedColumn<int> steps = GeneratedColumn<int>(
    'steps',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _activeMinutesMeta = const VerificationMeta(
    'activeMinutes',
  );
  @override
  late final GeneratedColumn<int> activeMinutes = GeneratedColumn<int>(
    'active_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _caloriesBurnedMeta = const VerificationMeta(
    'caloriesBurned',
  );
  @override
  late final GeneratedColumn<int> caloriesBurned = GeneratedColumn<int>(
    'calories_burned',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _sleepHoursMeta = const VerificationMeta(
    'sleepHours',
  );
  @override
  late final GeneratedColumn<double> sleepHours = GeneratedColumn<double>(
    'sleep_hours',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _avgHeartRateMeta = const VerificationMeta(
    'avgHeartRate',
  );
  @override
  late final GeneratedColumn<int> avgHeartRate = GeneratedColumn<int>(
    'avg_heart_rate',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _hrvMeta = const VerificationMeta('hrv');
  @override
  late final GeneratedColumn<int> hrv = GeneratedColumn<int>(
    'hrv',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    date,
    steps,
    activeMinutes,
    caloriesBurned,
    sleepHours,
    avgHeartRate,
    hrv,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'daily_metrics';
  @override
  VerificationContext validateIntegrity(
    Insertable<DailyMetric> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('steps')) {
      context.handle(
        _stepsMeta,
        steps.isAcceptableOrUnknown(data['steps']!, _stepsMeta),
      );
    }
    if (data.containsKey('active_minutes')) {
      context.handle(
        _activeMinutesMeta,
        activeMinutes.isAcceptableOrUnknown(
          data['active_minutes']!,
          _activeMinutesMeta,
        ),
      );
    }
    if (data.containsKey('calories_burned')) {
      context.handle(
        _caloriesBurnedMeta,
        caloriesBurned.isAcceptableOrUnknown(
          data['calories_burned']!,
          _caloriesBurnedMeta,
        ),
      );
    }
    if (data.containsKey('sleep_hours')) {
      context.handle(
        _sleepHoursMeta,
        sleepHours.isAcceptableOrUnknown(data['sleep_hours']!, _sleepHoursMeta),
      );
    }
    if (data.containsKey('avg_heart_rate')) {
      context.handle(
        _avgHeartRateMeta,
        avgHeartRate.isAcceptableOrUnknown(
          data['avg_heart_rate']!,
          _avgHeartRateMeta,
        ),
      );
    }
    if (data.containsKey('hrv')) {
      context.handle(
        _hrvMeta,
        hrv.isAcceptableOrUnknown(data['hrv']!, _hrvMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {date},
  ];
  @override
  DailyMetric map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DailyMetric(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      steps: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}steps'],
      )!,
      activeMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}active_minutes'],
      )!,
      caloriesBurned: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}calories_burned'],
      )!,
      sleepHours: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}sleep_hours'],
      )!,
      avgHeartRate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}avg_heart_rate'],
      ),
      hrv: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}hrv'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $DailyMetricsTable createAlias(String alias) {
    return $DailyMetricsTable(attachedDatabase, alias);
  }
}

class DailyMetric extends DataClass implements Insertable<DailyMetric> {
  final int id;
  final DateTime date;
  final int steps;
  final int activeMinutes;
  final int caloriesBurned;
  final double sleepHours;
  final int? avgHeartRate;
  final int? hrv;
  final DateTime updatedAt;
  const DailyMetric({
    required this.id,
    required this.date,
    required this.steps,
    required this.activeMinutes,
    required this.caloriesBurned,
    required this.sleepHours,
    this.avgHeartRate,
    this.hrv,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['steps'] = Variable<int>(steps);
    map['active_minutes'] = Variable<int>(activeMinutes);
    map['calories_burned'] = Variable<int>(caloriesBurned);
    map['sleep_hours'] = Variable<double>(sleepHours);
    if (!nullToAbsent || avgHeartRate != null) {
      map['avg_heart_rate'] = Variable<int>(avgHeartRate);
    }
    if (!nullToAbsent || hrv != null) {
      map['hrv'] = Variable<int>(hrv);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  DailyMetricsCompanion toCompanion(bool nullToAbsent) {
    return DailyMetricsCompanion(
      id: Value(id),
      date: Value(date),
      steps: Value(steps),
      activeMinutes: Value(activeMinutes),
      caloriesBurned: Value(caloriesBurned),
      sleepHours: Value(sleepHours),
      avgHeartRate: avgHeartRate == null && nullToAbsent
          ? const Value.absent()
          : Value(avgHeartRate),
      hrv: hrv == null && nullToAbsent ? const Value.absent() : Value(hrv),
      updatedAt: Value(updatedAt),
    );
  }

  factory DailyMetric.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DailyMetric(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      steps: serializer.fromJson<int>(json['steps']),
      activeMinutes: serializer.fromJson<int>(json['activeMinutes']),
      caloriesBurned: serializer.fromJson<int>(json['caloriesBurned']),
      sleepHours: serializer.fromJson<double>(json['sleepHours']),
      avgHeartRate: serializer.fromJson<int?>(json['avgHeartRate']),
      hrv: serializer.fromJson<int?>(json['hrv']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'steps': serializer.toJson<int>(steps),
      'activeMinutes': serializer.toJson<int>(activeMinutes),
      'caloriesBurned': serializer.toJson<int>(caloriesBurned),
      'sleepHours': serializer.toJson<double>(sleepHours),
      'avgHeartRate': serializer.toJson<int?>(avgHeartRate),
      'hrv': serializer.toJson<int?>(hrv),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  DailyMetric copyWith({
    int? id,
    DateTime? date,
    int? steps,
    int? activeMinutes,
    int? caloriesBurned,
    double? sleepHours,
    Value<int?> avgHeartRate = const Value.absent(),
    Value<int?> hrv = const Value.absent(),
    DateTime? updatedAt,
  }) => DailyMetric(
    id: id ?? this.id,
    date: date ?? this.date,
    steps: steps ?? this.steps,
    activeMinutes: activeMinutes ?? this.activeMinutes,
    caloriesBurned: caloriesBurned ?? this.caloriesBurned,
    sleepHours: sleepHours ?? this.sleepHours,
    avgHeartRate: avgHeartRate.present ? avgHeartRate.value : this.avgHeartRate,
    hrv: hrv.present ? hrv.value : this.hrv,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  DailyMetric copyWithCompanion(DailyMetricsCompanion data) {
    return DailyMetric(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      steps: data.steps.present ? data.steps.value : this.steps,
      activeMinutes: data.activeMinutes.present
          ? data.activeMinutes.value
          : this.activeMinutes,
      caloriesBurned: data.caloriesBurned.present
          ? data.caloriesBurned.value
          : this.caloriesBurned,
      sleepHours: data.sleepHours.present
          ? data.sleepHours.value
          : this.sleepHours,
      avgHeartRate: data.avgHeartRate.present
          ? data.avgHeartRate.value
          : this.avgHeartRate,
      hrv: data.hrv.present ? data.hrv.value : this.hrv,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DailyMetric(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('steps: $steps, ')
          ..write('activeMinutes: $activeMinutes, ')
          ..write('caloriesBurned: $caloriesBurned, ')
          ..write('sleepHours: $sleepHours, ')
          ..write('avgHeartRate: $avgHeartRate, ')
          ..write('hrv: $hrv, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    date,
    steps,
    activeMinutes,
    caloriesBurned,
    sleepHours,
    avgHeartRate,
    hrv,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DailyMetric &&
          other.id == this.id &&
          other.date == this.date &&
          other.steps == this.steps &&
          other.activeMinutes == this.activeMinutes &&
          other.caloriesBurned == this.caloriesBurned &&
          other.sleepHours == this.sleepHours &&
          other.avgHeartRate == this.avgHeartRate &&
          other.hrv == this.hrv &&
          other.updatedAt == this.updatedAt);
}

class DailyMetricsCompanion extends UpdateCompanion<DailyMetric> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<int> steps;
  final Value<int> activeMinutes;
  final Value<int> caloriesBurned;
  final Value<double> sleepHours;
  final Value<int?> avgHeartRate;
  final Value<int?> hrv;
  final Value<DateTime> updatedAt;
  const DailyMetricsCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.steps = const Value.absent(),
    this.activeMinutes = const Value.absent(),
    this.caloriesBurned = const Value.absent(),
    this.sleepHours = const Value.absent(),
    this.avgHeartRate = const Value.absent(),
    this.hrv = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  DailyMetricsCompanion.insert({
    this.id = const Value.absent(),
    required DateTime date,
    this.steps = const Value.absent(),
    this.activeMinutes = const Value.absent(),
    this.caloriesBurned = const Value.absent(),
    this.sleepHours = const Value.absent(),
    this.avgHeartRate = const Value.absent(),
    this.hrv = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : date = Value(date);
  static Insertable<DailyMetric> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<int>? steps,
    Expression<int>? activeMinutes,
    Expression<int>? caloriesBurned,
    Expression<double>? sleepHours,
    Expression<int>? avgHeartRate,
    Expression<int>? hrv,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (steps != null) 'steps': steps,
      if (activeMinutes != null) 'active_minutes': activeMinutes,
      if (caloriesBurned != null) 'calories_burned': caloriesBurned,
      if (sleepHours != null) 'sleep_hours': sleepHours,
      if (avgHeartRate != null) 'avg_heart_rate': avgHeartRate,
      if (hrv != null) 'hrv': hrv,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  DailyMetricsCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? date,
    Value<int>? steps,
    Value<int>? activeMinutes,
    Value<int>? caloriesBurned,
    Value<double>? sleepHours,
    Value<int?>? avgHeartRate,
    Value<int?>? hrv,
    Value<DateTime>? updatedAt,
  }) {
    return DailyMetricsCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      steps: steps ?? this.steps,
      activeMinutes: activeMinutes ?? this.activeMinutes,
      caloriesBurned: caloriesBurned ?? this.caloriesBurned,
      sleepHours: sleepHours ?? this.sleepHours,
      avgHeartRate: avgHeartRate ?? this.avgHeartRate,
      hrv: hrv ?? this.hrv,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (steps.present) {
      map['steps'] = Variable<int>(steps.value);
    }
    if (activeMinutes.present) {
      map['active_minutes'] = Variable<int>(activeMinutes.value);
    }
    if (caloriesBurned.present) {
      map['calories_burned'] = Variable<int>(caloriesBurned.value);
    }
    if (sleepHours.present) {
      map['sleep_hours'] = Variable<double>(sleepHours.value);
    }
    if (avgHeartRate.present) {
      map['avg_heart_rate'] = Variable<int>(avgHeartRate.value);
    }
    if (hrv.present) {
      map['hrv'] = Variable<int>(hrv.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DailyMetricsCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('steps: $steps, ')
          ..write('activeMinutes: $activeMinutes, ')
          ..write('caloriesBurned: $caloriesBurned, ')
          ..write('sleepHours: $sleepHours, ')
          ..write('avgHeartRate: $avgHeartRate, ')
          ..write('hrv: $hrv, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $GoalsTable extends Goals with TableInfo<$GoalsTable, Goal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GoalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
    'icon',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('🎯'),
  );
  static const VerificationMeta _periodMeta = const VerificationMeta('period');
  @override
  late final GeneratedColumn<String> period = GeneratedColumn<String>(
    'period',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _targetMeta = const VerificationMeta('target');
  @override
  late final GeneratedColumn<int> target = GeneratedColumn<int>(
    'target',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _reminderTimeMeta = const VerificationMeta(
    'reminderTime',
  );
  @override
  late final GeneratedColumn<String> reminderTime = GeneratedColumn<String>(
    'reminder_time',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _enabledMeta = const VerificationMeta(
    'enabled',
  );
  @override
  late final GeneratedColumn<bool> enabled = GeneratedColumn<bool>(
    'enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    icon,
    period,
    target,
    reminderTime,
    enabled,
    sortOrder,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'goals';
  @override
  VerificationContext validateIntegrity(
    Insertable<Goal> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
        _iconMeta,
        icon.isAcceptableOrUnknown(data['icon']!, _iconMeta),
      );
    }
    if (data.containsKey('period')) {
      context.handle(
        _periodMeta,
        period.isAcceptableOrUnknown(data['period']!, _periodMeta),
      );
    } else if (isInserting) {
      context.missing(_periodMeta);
    }
    if (data.containsKey('target')) {
      context.handle(
        _targetMeta,
        target.isAcceptableOrUnknown(data['target']!, _targetMeta),
      );
    } else if (isInserting) {
      context.missing(_targetMeta);
    }
    if (data.containsKey('reminder_time')) {
      context.handle(
        _reminderTimeMeta,
        reminderTime.isAcceptableOrUnknown(
          data['reminder_time']!,
          _reminderTimeMeta,
        ),
      );
    }
    if (data.containsKey('enabled')) {
      context.handle(
        _enabledMeta,
        enabled.isAcceptableOrUnknown(data['enabled']!, _enabledMeta),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Goal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Goal(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      icon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon'],
      )!,
      period: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}period'],
      )!,
      target: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}target'],
      )!,
      reminderTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reminder_time'],
      ),
      enabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}enabled'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $GoalsTable createAlias(String alias) {
    return $GoalsTable(attachedDatabase, alias);
  }
}

class Goal extends DataClass implements Insertable<Goal> {
  final int id;
  final String name;
  final String icon;
  final String period;
  final int target;
  final String? reminderTime;
  final bool enabled;
  final int sortOrder;
  final DateTime createdAt;
  const Goal({
    required this.id,
    required this.name,
    required this.icon,
    required this.period,
    required this.target,
    this.reminderTime,
    required this.enabled,
    required this.sortOrder,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['icon'] = Variable<String>(icon);
    map['period'] = Variable<String>(period);
    map['target'] = Variable<int>(target);
    if (!nullToAbsent || reminderTime != null) {
      map['reminder_time'] = Variable<String>(reminderTime);
    }
    map['enabled'] = Variable<bool>(enabled);
    map['sort_order'] = Variable<int>(sortOrder);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  GoalsCompanion toCompanion(bool nullToAbsent) {
    return GoalsCompanion(
      id: Value(id),
      name: Value(name),
      icon: Value(icon),
      period: Value(period),
      target: Value(target),
      reminderTime: reminderTime == null && nullToAbsent
          ? const Value.absent()
          : Value(reminderTime),
      enabled: Value(enabled),
      sortOrder: Value(sortOrder),
      createdAt: Value(createdAt),
    );
  }

  factory Goal.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Goal(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      icon: serializer.fromJson<String>(json['icon']),
      period: serializer.fromJson<String>(json['period']),
      target: serializer.fromJson<int>(json['target']),
      reminderTime: serializer.fromJson<String?>(json['reminderTime']),
      enabled: serializer.fromJson<bool>(json['enabled']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'icon': serializer.toJson<String>(icon),
      'period': serializer.toJson<String>(period),
      'target': serializer.toJson<int>(target),
      'reminderTime': serializer.toJson<String?>(reminderTime),
      'enabled': serializer.toJson<bool>(enabled),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Goal copyWith({
    int? id,
    String? name,
    String? icon,
    String? period,
    int? target,
    Value<String?> reminderTime = const Value.absent(),
    bool? enabled,
    int? sortOrder,
    DateTime? createdAt,
  }) => Goal(
    id: id ?? this.id,
    name: name ?? this.name,
    icon: icon ?? this.icon,
    period: period ?? this.period,
    target: target ?? this.target,
    reminderTime: reminderTime.present ? reminderTime.value : this.reminderTime,
    enabled: enabled ?? this.enabled,
    sortOrder: sortOrder ?? this.sortOrder,
    createdAt: createdAt ?? this.createdAt,
  );
  Goal copyWithCompanion(GoalsCompanion data) {
    return Goal(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      icon: data.icon.present ? data.icon.value : this.icon,
      period: data.period.present ? data.period.value : this.period,
      target: data.target.present ? data.target.value : this.target,
      reminderTime: data.reminderTime.present
          ? data.reminderTime.value
          : this.reminderTime,
      enabled: data.enabled.present ? data.enabled.value : this.enabled,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Goal(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('icon: $icon, ')
          ..write('period: $period, ')
          ..write('target: $target, ')
          ..write('reminderTime: $reminderTime, ')
          ..write('enabled: $enabled, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    icon,
    period,
    target,
    reminderTime,
    enabled,
    sortOrder,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Goal &&
          other.id == this.id &&
          other.name == this.name &&
          other.icon == this.icon &&
          other.period == this.period &&
          other.target == this.target &&
          other.reminderTime == this.reminderTime &&
          other.enabled == this.enabled &&
          other.sortOrder == this.sortOrder &&
          other.createdAt == this.createdAt);
}

class GoalsCompanion extends UpdateCompanion<Goal> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> icon;
  final Value<String> period;
  final Value<int> target;
  final Value<String?> reminderTime;
  final Value<bool> enabled;
  final Value<int> sortOrder;
  final Value<DateTime> createdAt;
  const GoalsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.icon = const Value.absent(),
    this.period = const Value.absent(),
    this.target = const Value.absent(),
    this.reminderTime = const Value.absent(),
    this.enabled = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  GoalsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.icon = const Value.absent(),
    required String period,
    required int target,
    this.reminderTime = const Value.absent(),
    this.enabled = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : name = Value(name),
       period = Value(period),
       target = Value(target);
  static Insertable<Goal> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? icon,
    Expression<String>? period,
    Expression<int>? target,
    Expression<String>? reminderTime,
    Expression<bool>? enabled,
    Expression<int>? sortOrder,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (icon != null) 'icon': icon,
      if (period != null) 'period': period,
      if (target != null) 'target': target,
      if (reminderTime != null) 'reminder_time': reminderTime,
      if (enabled != null) 'enabled': enabled,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  GoalsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? icon,
    Value<String>? period,
    Value<int>? target,
    Value<String?>? reminderTime,
    Value<bool>? enabled,
    Value<int>? sortOrder,
    Value<DateTime>? createdAt,
  }) {
    return GoalsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      period: period ?? this.period,
      target: target ?? this.target,
      reminderTime: reminderTime ?? this.reminderTime,
      enabled: enabled ?? this.enabled,
      sortOrder: sortOrder ?? this.sortOrder,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (period.present) {
      map['period'] = Variable<String>(period.value);
    }
    if (target.present) {
      map['target'] = Variable<int>(target.value);
    }
    if (reminderTime.present) {
      map['reminder_time'] = Variable<String>(reminderTime.value);
    }
    if (enabled.present) {
      map['enabled'] = Variable<bool>(enabled.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GoalsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('icon: $icon, ')
          ..write('period: $period, ')
          ..write('target: $target, ')
          ..write('reminderTime: $reminderTime, ')
          ..write('enabled: $enabled, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $GoalLogsTable extends GoalLogs with TableInfo<$GoalLogsTable, GoalLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GoalLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _goalIdMeta = const VerificationMeta('goalId');
  @override
  late final GeneratedColumn<int> goalId = GeneratedColumn<int>(
    'goal_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES goals (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _progressMeta = const VerificationMeta(
    'progress',
  );
  @override
  late final GeneratedColumn<int> progress = GeneratedColumn<int>(
    'progress',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, goalId, date, progress, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'goal_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<GoalLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('goal_id')) {
      context.handle(
        _goalIdMeta,
        goalId.isAcceptableOrUnknown(data['goal_id']!, _goalIdMeta),
      );
    } else if (isInserting) {
      context.missing(_goalIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('progress')) {
      context.handle(
        _progressMeta,
        progress.isAcceptableOrUnknown(data['progress']!, _progressMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {goalId, date},
  ];
  @override
  GoalLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GoalLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      goalId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}goal_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      progress: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}progress'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $GoalLogsTable createAlias(String alias) {
    return $GoalLogsTable(attachedDatabase, alias);
  }
}

class GoalLog extends DataClass implements Insertable<GoalLog> {
  final int id;
  final int goalId;
  final DateTime date;
  final int progress;
  final DateTime updatedAt;
  const GoalLog({
    required this.id,
    required this.goalId,
    required this.date,
    required this.progress,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['goal_id'] = Variable<int>(goalId);
    map['date'] = Variable<DateTime>(date);
    map['progress'] = Variable<int>(progress);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  GoalLogsCompanion toCompanion(bool nullToAbsent) {
    return GoalLogsCompanion(
      id: Value(id),
      goalId: Value(goalId),
      date: Value(date),
      progress: Value(progress),
      updatedAt: Value(updatedAt),
    );
  }

  factory GoalLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GoalLog(
      id: serializer.fromJson<int>(json['id']),
      goalId: serializer.fromJson<int>(json['goalId']),
      date: serializer.fromJson<DateTime>(json['date']),
      progress: serializer.fromJson<int>(json['progress']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'goalId': serializer.toJson<int>(goalId),
      'date': serializer.toJson<DateTime>(date),
      'progress': serializer.toJson<int>(progress),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  GoalLog copyWith({
    int? id,
    int? goalId,
    DateTime? date,
    int? progress,
    DateTime? updatedAt,
  }) => GoalLog(
    id: id ?? this.id,
    goalId: goalId ?? this.goalId,
    date: date ?? this.date,
    progress: progress ?? this.progress,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  GoalLog copyWithCompanion(GoalLogsCompanion data) {
    return GoalLog(
      id: data.id.present ? data.id.value : this.id,
      goalId: data.goalId.present ? data.goalId.value : this.goalId,
      date: data.date.present ? data.date.value : this.date,
      progress: data.progress.present ? data.progress.value : this.progress,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GoalLog(')
          ..write('id: $id, ')
          ..write('goalId: $goalId, ')
          ..write('date: $date, ')
          ..write('progress: $progress, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, goalId, date, progress, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GoalLog &&
          other.id == this.id &&
          other.goalId == this.goalId &&
          other.date == this.date &&
          other.progress == this.progress &&
          other.updatedAt == this.updatedAt);
}

class GoalLogsCompanion extends UpdateCompanion<GoalLog> {
  final Value<int> id;
  final Value<int> goalId;
  final Value<DateTime> date;
  final Value<int> progress;
  final Value<DateTime> updatedAt;
  const GoalLogsCompanion({
    this.id = const Value.absent(),
    this.goalId = const Value.absent(),
    this.date = const Value.absent(),
    this.progress = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  GoalLogsCompanion.insert({
    this.id = const Value.absent(),
    required int goalId,
    required DateTime date,
    this.progress = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : goalId = Value(goalId),
       date = Value(date);
  static Insertable<GoalLog> custom({
    Expression<int>? id,
    Expression<int>? goalId,
    Expression<DateTime>? date,
    Expression<int>? progress,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (goalId != null) 'goal_id': goalId,
      if (date != null) 'date': date,
      if (progress != null) 'progress': progress,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  GoalLogsCompanion copyWith({
    Value<int>? id,
    Value<int>? goalId,
    Value<DateTime>? date,
    Value<int>? progress,
    Value<DateTime>? updatedAt,
  }) {
    return GoalLogsCompanion(
      id: id ?? this.id,
      goalId: goalId ?? this.goalId,
      date: date ?? this.date,
      progress: progress ?? this.progress,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (goalId.present) {
      map['goal_id'] = Variable<int>(goalId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (progress.present) {
      map['progress'] = Variable<int>(progress.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GoalLogsCompanion(')
          ..write('id: $id, ')
          ..write('goalId: $goalId, ')
          ..write('date: $date, ')
          ..write('progress: $progress, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $PetStatesTable extends PetStates
    with TableInfo<$PetStatesTable, PetState> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PetStatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('TATA'),
  );
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<int> level = GeneratedColumn<int>(
    'level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _expMeta = const VerificationMeta('exp');
  @override
  late final GeneratedColumn<int> exp = GeneratedColumn<int>(
    'exp',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _companionDaysMeta = const VerificationMeta(
    'companionDays',
  );
  @override
  late final GeneratedColumn<int> companionDays = GeneratedColumn<int>(
    'companion_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _currentSkinMeta = const VerificationMeta(
    'currentSkin',
  );
  @override
  late final GeneratedColumn<String> currentSkin = GeneratedColumn<String>(
    'current_skin',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('default'),
  );
  static const VerificationMeta _lastActiveDateMeta = const VerificationMeta(
    'lastActiveDate',
  );
  @override
  late final GeneratedColumn<DateTime> lastActiveDate =
      GeneratedColumn<DateTime>(
        'last_active_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    level,
    exp,
    companionDays,
    currentSkin,
    lastActiveDate,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pet_states';
  @override
  VerificationContext validateIntegrity(
    Insertable<PetState> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('level')) {
      context.handle(
        _levelMeta,
        level.isAcceptableOrUnknown(data['level']!, _levelMeta),
      );
    }
    if (data.containsKey('exp')) {
      context.handle(
        _expMeta,
        exp.isAcceptableOrUnknown(data['exp']!, _expMeta),
      );
    }
    if (data.containsKey('companion_days')) {
      context.handle(
        _companionDaysMeta,
        companionDays.isAcceptableOrUnknown(
          data['companion_days']!,
          _companionDaysMeta,
        ),
      );
    }
    if (data.containsKey('current_skin')) {
      context.handle(
        _currentSkinMeta,
        currentSkin.isAcceptableOrUnknown(
          data['current_skin']!,
          _currentSkinMeta,
        ),
      );
    }
    if (data.containsKey('last_active_date')) {
      context.handle(
        _lastActiveDateMeta,
        lastActiveDate.isAcceptableOrUnknown(
          data['last_active_date']!,
          _lastActiveDateMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PetState map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PetState(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      level: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}level'],
      )!,
      exp: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}exp'],
      )!,
      companionDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}companion_days'],
      )!,
      currentSkin: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}current_skin'],
      )!,
      lastActiveDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_active_date'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $PetStatesTable createAlias(String alias) {
    return $PetStatesTable(attachedDatabase, alias);
  }
}

class PetState extends DataClass implements Insertable<PetState> {
  final int id;
  final String name;
  final int level;
  final int exp;
  final int companionDays;
  final String currentSkin;
  final DateTime? lastActiveDate;
  final DateTime createdAt;
  const PetState({
    required this.id,
    required this.name,
    required this.level,
    required this.exp,
    required this.companionDays,
    required this.currentSkin,
    this.lastActiveDate,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['level'] = Variable<int>(level);
    map['exp'] = Variable<int>(exp);
    map['companion_days'] = Variable<int>(companionDays);
    map['current_skin'] = Variable<String>(currentSkin);
    if (!nullToAbsent || lastActiveDate != null) {
      map['last_active_date'] = Variable<DateTime>(lastActiveDate);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PetStatesCompanion toCompanion(bool nullToAbsent) {
    return PetStatesCompanion(
      id: Value(id),
      name: Value(name),
      level: Value(level),
      exp: Value(exp),
      companionDays: Value(companionDays),
      currentSkin: Value(currentSkin),
      lastActiveDate: lastActiveDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastActiveDate),
      createdAt: Value(createdAt),
    );
  }

  factory PetState.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PetState(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      level: serializer.fromJson<int>(json['level']),
      exp: serializer.fromJson<int>(json['exp']),
      companionDays: serializer.fromJson<int>(json['companionDays']),
      currentSkin: serializer.fromJson<String>(json['currentSkin']),
      lastActiveDate: serializer.fromJson<DateTime?>(json['lastActiveDate']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'level': serializer.toJson<int>(level),
      'exp': serializer.toJson<int>(exp),
      'companionDays': serializer.toJson<int>(companionDays),
      'currentSkin': serializer.toJson<String>(currentSkin),
      'lastActiveDate': serializer.toJson<DateTime?>(lastActiveDate),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  PetState copyWith({
    int? id,
    String? name,
    int? level,
    int? exp,
    int? companionDays,
    String? currentSkin,
    Value<DateTime?> lastActiveDate = const Value.absent(),
    DateTime? createdAt,
  }) => PetState(
    id: id ?? this.id,
    name: name ?? this.name,
    level: level ?? this.level,
    exp: exp ?? this.exp,
    companionDays: companionDays ?? this.companionDays,
    currentSkin: currentSkin ?? this.currentSkin,
    lastActiveDate: lastActiveDate.present
        ? lastActiveDate.value
        : this.lastActiveDate,
    createdAt: createdAt ?? this.createdAt,
  );
  PetState copyWithCompanion(PetStatesCompanion data) {
    return PetState(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      level: data.level.present ? data.level.value : this.level,
      exp: data.exp.present ? data.exp.value : this.exp,
      companionDays: data.companionDays.present
          ? data.companionDays.value
          : this.companionDays,
      currentSkin: data.currentSkin.present
          ? data.currentSkin.value
          : this.currentSkin,
      lastActiveDate: data.lastActiveDate.present
          ? data.lastActiveDate.value
          : this.lastActiveDate,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PetState(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('level: $level, ')
          ..write('exp: $exp, ')
          ..write('companionDays: $companionDays, ')
          ..write('currentSkin: $currentSkin, ')
          ..write('lastActiveDate: $lastActiveDate, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    level,
    exp,
    companionDays,
    currentSkin,
    lastActiveDate,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PetState &&
          other.id == this.id &&
          other.name == this.name &&
          other.level == this.level &&
          other.exp == this.exp &&
          other.companionDays == this.companionDays &&
          other.currentSkin == this.currentSkin &&
          other.lastActiveDate == this.lastActiveDate &&
          other.createdAt == this.createdAt);
}

class PetStatesCompanion extends UpdateCompanion<PetState> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> level;
  final Value<int> exp;
  final Value<int> companionDays;
  final Value<String> currentSkin;
  final Value<DateTime?> lastActiveDate;
  final Value<DateTime> createdAt;
  const PetStatesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.level = const Value.absent(),
    this.exp = const Value.absent(),
    this.companionDays = const Value.absent(),
    this.currentSkin = const Value.absent(),
    this.lastActiveDate = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  PetStatesCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.level = const Value.absent(),
    this.exp = const Value.absent(),
    this.companionDays = const Value.absent(),
    this.currentSkin = const Value.absent(),
    this.lastActiveDate = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  static Insertable<PetState> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? level,
    Expression<int>? exp,
    Expression<int>? companionDays,
    Expression<String>? currentSkin,
    Expression<DateTime>? lastActiveDate,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (level != null) 'level': level,
      if (exp != null) 'exp': exp,
      if (companionDays != null) 'companion_days': companionDays,
      if (currentSkin != null) 'current_skin': currentSkin,
      if (lastActiveDate != null) 'last_active_date': lastActiveDate,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  PetStatesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int>? level,
    Value<int>? exp,
    Value<int>? companionDays,
    Value<String>? currentSkin,
    Value<DateTime?>? lastActiveDate,
    Value<DateTime>? createdAt,
  }) {
    return PetStatesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      level: level ?? this.level,
      exp: exp ?? this.exp,
      companionDays: companionDays ?? this.companionDays,
      currentSkin: currentSkin ?? this.currentSkin,
      lastActiveDate: lastActiveDate ?? this.lastActiveDate,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    if (exp.present) {
      map['exp'] = Variable<int>(exp.value);
    }
    if (companionDays.present) {
      map['companion_days'] = Variable<int>(companionDays.value);
    }
    if (currentSkin.present) {
      map['current_skin'] = Variable<String>(currentSkin.value);
    }
    if (lastActiveDate.present) {
      map['last_active_date'] = Variable<DateTime>(lastActiveDate.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PetStatesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('level: $level, ')
          ..write('exp: $exp, ')
          ..write('companionDays: $companionDays, ')
          ..write('currentSkin: $currentSkin, ')
          ..write('lastActiveDate: $lastActiveDate, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $WeeklySummariesTable extends WeeklySummaries
    with TableInfo<$WeeklySummariesTable, WeeklySummary> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WeeklySummariesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _weekStartMeta = const VerificationMeta(
    'weekStart',
  );
  @override
  late final GeneratedColumn<DateTime> weekStart = GeneratedColumn<DateTime>(
    'week_start',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _avgSleepHoursMeta = const VerificationMeta(
    'avgSleepHours',
  );
  @override
  late final GeneratedColumn<double> avgSleepHours = GeneratedColumn<double>(
    'avg_sleep_hours',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _avgHrvMeta = const VerificationMeta('avgHrv');
  @override
  late final GeneratedColumn<int> avgHrv = GeneratedColumn<int>(
    'avg_hrv',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _totalStepsMeta = const VerificationMeta(
    'totalSteps',
  );
  @override
  late final GeneratedColumn<int> totalSteps = GeneratedColumn<int>(
    'total_steps',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalCaloriesBurnedMeta =
      const VerificationMeta('totalCaloriesBurned');
  @override
  late final GeneratedColumn<int> totalCaloriesBurned = GeneratedColumn<int>(
    'total_calories_burned',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _exerciseMinutesMeta = const VerificationMeta(
    'exerciseMinutes',
  );
  @override
  late final GeneratedColumn<int> exerciseMinutes = GeneratedColumn<int>(
    'exercise_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _waterDaysMeta = const VerificationMeta(
    'waterDays',
  );
  @override
  late final GeneratedColumn<int> waterDays = GeneratedColumn<int>(
    'water_days',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _goalCompletionRateMeta =
      const VerificationMeta('goalCompletionRate');
  @override
  late final GeneratedColumn<int> goalCompletionRate = GeneratedColumn<int>(
    'goal_completion_rate',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _generatedAtMeta = const VerificationMeta(
    'generatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> generatedAt = GeneratedColumn<DateTime>(
    'generated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    weekStart,
    avgSleepHours,
    avgHrv,
    totalSteps,
    totalCaloriesBurned,
    exerciseMinutes,
    waterDays,
    goalCompletionRate,
    title,
    generatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'weekly_summaries';
  @override
  VerificationContext validateIntegrity(
    Insertable<WeeklySummary> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('week_start')) {
      context.handle(
        _weekStartMeta,
        weekStart.isAcceptableOrUnknown(data['week_start']!, _weekStartMeta),
      );
    } else if (isInserting) {
      context.missing(_weekStartMeta);
    }
    if (data.containsKey('avg_sleep_hours')) {
      context.handle(
        _avgSleepHoursMeta,
        avgSleepHours.isAcceptableOrUnknown(
          data['avg_sleep_hours']!,
          _avgSleepHoursMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_avgSleepHoursMeta);
    }
    if (data.containsKey('avg_hrv')) {
      context.handle(
        _avgHrvMeta,
        avgHrv.isAcceptableOrUnknown(data['avg_hrv']!, _avgHrvMeta),
      );
    }
    if (data.containsKey('total_steps')) {
      context.handle(
        _totalStepsMeta,
        totalSteps.isAcceptableOrUnknown(data['total_steps']!, _totalStepsMeta),
      );
    } else if (isInserting) {
      context.missing(_totalStepsMeta);
    }
    if (data.containsKey('total_calories_burned')) {
      context.handle(
        _totalCaloriesBurnedMeta,
        totalCaloriesBurned.isAcceptableOrUnknown(
          data['total_calories_burned']!,
          _totalCaloriesBurnedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_totalCaloriesBurnedMeta);
    }
    if (data.containsKey('exercise_minutes')) {
      context.handle(
        _exerciseMinutesMeta,
        exerciseMinutes.isAcceptableOrUnknown(
          data['exercise_minutes']!,
          _exerciseMinutesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_exerciseMinutesMeta);
    }
    if (data.containsKey('water_days')) {
      context.handle(
        _waterDaysMeta,
        waterDays.isAcceptableOrUnknown(data['water_days']!, _waterDaysMeta),
      );
    } else if (isInserting) {
      context.missing(_waterDaysMeta);
    }
    if (data.containsKey('goal_completion_rate')) {
      context.handle(
        _goalCompletionRateMeta,
        goalCompletionRate.isAcceptableOrUnknown(
          data['goal_completion_rate']!,
          _goalCompletionRateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_goalCompletionRateMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('generated_at')) {
      context.handle(
        _generatedAtMeta,
        generatedAt.isAcceptableOrUnknown(
          data['generated_at']!,
          _generatedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {weekStart},
  ];
  @override
  WeeklySummary map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WeeklySummary(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      weekStart: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}week_start'],
      )!,
      avgSleepHours: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}avg_sleep_hours'],
      )!,
      avgHrv: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}avg_hrv'],
      ),
      totalSteps: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_steps'],
      )!,
      totalCaloriesBurned: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_calories_burned'],
      )!,
      exerciseMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}exercise_minutes'],
      )!,
      waterDays: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}water_days'],
      )!,
      goalCompletionRate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}goal_completion_rate'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      generatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}generated_at'],
      )!,
    );
  }

  @override
  $WeeklySummariesTable createAlias(String alias) {
    return $WeeklySummariesTable(attachedDatabase, alias);
  }
}

class WeeklySummary extends DataClass implements Insertable<WeeklySummary> {
  final int id;
  final DateTime weekStart;
  final double avgSleepHours;
  final int? avgHrv;
  final int totalSteps;
  final int totalCaloriesBurned;
  final int exerciseMinutes;
  final int waterDays;
  final int goalCompletionRate;
  final String title;
  final DateTime generatedAt;
  const WeeklySummary({
    required this.id,
    required this.weekStart,
    required this.avgSleepHours,
    this.avgHrv,
    required this.totalSteps,
    required this.totalCaloriesBurned,
    required this.exerciseMinutes,
    required this.waterDays,
    required this.goalCompletionRate,
    required this.title,
    required this.generatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['week_start'] = Variable<DateTime>(weekStart);
    map['avg_sleep_hours'] = Variable<double>(avgSleepHours);
    if (!nullToAbsent || avgHrv != null) {
      map['avg_hrv'] = Variable<int>(avgHrv);
    }
    map['total_steps'] = Variable<int>(totalSteps);
    map['total_calories_burned'] = Variable<int>(totalCaloriesBurned);
    map['exercise_minutes'] = Variable<int>(exerciseMinutes);
    map['water_days'] = Variable<int>(waterDays);
    map['goal_completion_rate'] = Variable<int>(goalCompletionRate);
    map['title'] = Variable<String>(title);
    map['generated_at'] = Variable<DateTime>(generatedAt);
    return map;
  }

  WeeklySummariesCompanion toCompanion(bool nullToAbsent) {
    return WeeklySummariesCompanion(
      id: Value(id),
      weekStart: Value(weekStart),
      avgSleepHours: Value(avgSleepHours),
      avgHrv: avgHrv == null && nullToAbsent
          ? const Value.absent()
          : Value(avgHrv),
      totalSteps: Value(totalSteps),
      totalCaloriesBurned: Value(totalCaloriesBurned),
      exerciseMinutes: Value(exerciseMinutes),
      waterDays: Value(waterDays),
      goalCompletionRate: Value(goalCompletionRate),
      title: Value(title),
      generatedAt: Value(generatedAt),
    );
  }

  factory WeeklySummary.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WeeklySummary(
      id: serializer.fromJson<int>(json['id']),
      weekStart: serializer.fromJson<DateTime>(json['weekStart']),
      avgSleepHours: serializer.fromJson<double>(json['avgSleepHours']),
      avgHrv: serializer.fromJson<int?>(json['avgHrv']),
      totalSteps: serializer.fromJson<int>(json['totalSteps']),
      totalCaloriesBurned: serializer.fromJson<int>(
        json['totalCaloriesBurned'],
      ),
      exerciseMinutes: serializer.fromJson<int>(json['exerciseMinutes']),
      waterDays: serializer.fromJson<int>(json['waterDays']),
      goalCompletionRate: serializer.fromJson<int>(json['goalCompletionRate']),
      title: serializer.fromJson<String>(json['title']),
      generatedAt: serializer.fromJson<DateTime>(json['generatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'weekStart': serializer.toJson<DateTime>(weekStart),
      'avgSleepHours': serializer.toJson<double>(avgSleepHours),
      'avgHrv': serializer.toJson<int?>(avgHrv),
      'totalSteps': serializer.toJson<int>(totalSteps),
      'totalCaloriesBurned': serializer.toJson<int>(totalCaloriesBurned),
      'exerciseMinutes': serializer.toJson<int>(exerciseMinutes),
      'waterDays': serializer.toJson<int>(waterDays),
      'goalCompletionRate': serializer.toJson<int>(goalCompletionRate),
      'title': serializer.toJson<String>(title),
      'generatedAt': serializer.toJson<DateTime>(generatedAt),
    };
  }

  WeeklySummary copyWith({
    int? id,
    DateTime? weekStart,
    double? avgSleepHours,
    Value<int?> avgHrv = const Value.absent(),
    int? totalSteps,
    int? totalCaloriesBurned,
    int? exerciseMinutes,
    int? waterDays,
    int? goalCompletionRate,
    String? title,
    DateTime? generatedAt,
  }) => WeeklySummary(
    id: id ?? this.id,
    weekStart: weekStart ?? this.weekStart,
    avgSleepHours: avgSleepHours ?? this.avgSleepHours,
    avgHrv: avgHrv.present ? avgHrv.value : this.avgHrv,
    totalSteps: totalSteps ?? this.totalSteps,
    totalCaloriesBurned: totalCaloriesBurned ?? this.totalCaloriesBurned,
    exerciseMinutes: exerciseMinutes ?? this.exerciseMinutes,
    waterDays: waterDays ?? this.waterDays,
    goalCompletionRate: goalCompletionRate ?? this.goalCompletionRate,
    title: title ?? this.title,
    generatedAt: generatedAt ?? this.generatedAt,
  );
  WeeklySummary copyWithCompanion(WeeklySummariesCompanion data) {
    return WeeklySummary(
      id: data.id.present ? data.id.value : this.id,
      weekStart: data.weekStart.present ? data.weekStart.value : this.weekStart,
      avgSleepHours: data.avgSleepHours.present
          ? data.avgSleepHours.value
          : this.avgSleepHours,
      avgHrv: data.avgHrv.present ? data.avgHrv.value : this.avgHrv,
      totalSteps: data.totalSteps.present
          ? data.totalSteps.value
          : this.totalSteps,
      totalCaloriesBurned: data.totalCaloriesBurned.present
          ? data.totalCaloriesBurned.value
          : this.totalCaloriesBurned,
      exerciseMinutes: data.exerciseMinutes.present
          ? data.exerciseMinutes.value
          : this.exerciseMinutes,
      waterDays: data.waterDays.present ? data.waterDays.value : this.waterDays,
      goalCompletionRate: data.goalCompletionRate.present
          ? data.goalCompletionRate.value
          : this.goalCompletionRate,
      title: data.title.present ? data.title.value : this.title,
      generatedAt: data.generatedAt.present
          ? data.generatedAt.value
          : this.generatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WeeklySummary(')
          ..write('id: $id, ')
          ..write('weekStart: $weekStart, ')
          ..write('avgSleepHours: $avgSleepHours, ')
          ..write('avgHrv: $avgHrv, ')
          ..write('totalSteps: $totalSteps, ')
          ..write('totalCaloriesBurned: $totalCaloriesBurned, ')
          ..write('exerciseMinutes: $exerciseMinutes, ')
          ..write('waterDays: $waterDays, ')
          ..write('goalCompletionRate: $goalCompletionRate, ')
          ..write('title: $title, ')
          ..write('generatedAt: $generatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    weekStart,
    avgSleepHours,
    avgHrv,
    totalSteps,
    totalCaloriesBurned,
    exerciseMinutes,
    waterDays,
    goalCompletionRate,
    title,
    generatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WeeklySummary &&
          other.id == this.id &&
          other.weekStart == this.weekStart &&
          other.avgSleepHours == this.avgSleepHours &&
          other.avgHrv == this.avgHrv &&
          other.totalSteps == this.totalSteps &&
          other.totalCaloriesBurned == this.totalCaloriesBurned &&
          other.exerciseMinutes == this.exerciseMinutes &&
          other.waterDays == this.waterDays &&
          other.goalCompletionRate == this.goalCompletionRate &&
          other.title == this.title &&
          other.generatedAt == this.generatedAt);
}

class WeeklySummariesCompanion extends UpdateCompanion<WeeklySummary> {
  final Value<int> id;
  final Value<DateTime> weekStart;
  final Value<double> avgSleepHours;
  final Value<int?> avgHrv;
  final Value<int> totalSteps;
  final Value<int> totalCaloriesBurned;
  final Value<int> exerciseMinutes;
  final Value<int> waterDays;
  final Value<int> goalCompletionRate;
  final Value<String> title;
  final Value<DateTime> generatedAt;
  const WeeklySummariesCompanion({
    this.id = const Value.absent(),
    this.weekStart = const Value.absent(),
    this.avgSleepHours = const Value.absent(),
    this.avgHrv = const Value.absent(),
    this.totalSteps = const Value.absent(),
    this.totalCaloriesBurned = const Value.absent(),
    this.exerciseMinutes = const Value.absent(),
    this.waterDays = const Value.absent(),
    this.goalCompletionRate = const Value.absent(),
    this.title = const Value.absent(),
    this.generatedAt = const Value.absent(),
  });
  WeeklySummariesCompanion.insert({
    this.id = const Value.absent(),
    required DateTime weekStart,
    required double avgSleepHours,
    this.avgHrv = const Value.absent(),
    required int totalSteps,
    required int totalCaloriesBurned,
    required int exerciseMinutes,
    required int waterDays,
    required int goalCompletionRate,
    required String title,
    this.generatedAt = const Value.absent(),
  }) : weekStart = Value(weekStart),
       avgSleepHours = Value(avgSleepHours),
       totalSteps = Value(totalSteps),
       totalCaloriesBurned = Value(totalCaloriesBurned),
       exerciseMinutes = Value(exerciseMinutes),
       waterDays = Value(waterDays),
       goalCompletionRate = Value(goalCompletionRate),
       title = Value(title);
  static Insertable<WeeklySummary> custom({
    Expression<int>? id,
    Expression<DateTime>? weekStart,
    Expression<double>? avgSleepHours,
    Expression<int>? avgHrv,
    Expression<int>? totalSteps,
    Expression<int>? totalCaloriesBurned,
    Expression<int>? exerciseMinutes,
    Expression<int>? waterDays,
    Expression<int>? goalCompletionRate,
    Expression<String>? title,
    Expression<DateTime>? generatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (weekStart != null) 'week_start': weekStart,
      if (avgSleepHours != null) 'avg_sleep_hours': avgSleepHours,
      if (avgHrv != null) 'avg_hrv': avgHrv,
      if (totalSteps != null) 'total_steps': totalSteps,
      if (totalCaloriesBurned != null)
        'total_calories_burned': totalCaloriesBurned,
      if (exerciseMinutes != null) 'exercise_minutes': exerciseMinutes,
      if (waterDays != null) 'water_days': waterDays,
      if (goalCompletionRate != null)
        'goal_completion_rate': goalCompletionRate,
      if (title != null) 'title': title,
      if (generatedAt != null) 'generated_at': generatedAt,
    });
  }

  WeeklySummariesCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? weekStart,
    Value<double>? avgSleepHours,
    Value<int?>? avgHrv,
    Value<int>? totalSteps,
    Value<int>? totalCaloriesBurned,
    Value<int>? exerciseMinutes,
    Value<int>? waterDays,
    Value<int>? goalCompletionRate,
    Value<String>? title,
    Value<DateTime>? generatedAt,
  }) {
    return WeeklySummariesCompanion(
      id: id ?? this.id,
      weekStart: weekStart ?? this.weekStart,
      avgSleepHours: avgSleepHours ?? this.avgSleepHours,
      avgHrv: avgHrv ?? this.avgHrv,
      totalSteps: totalSteps ?? this.totalSteps,
      totalCaloriesBurned: totalCaloriesBurned ?? this.totalCaloriesBurned,
      exerciseMinutes: exerciseMinutes ?? this.exerciseMinutes,
      waterDays: waterDays ?? this.waterDays,
      goalCompletionRate: goalCompletionRate ?? this.goalCompletionRate,
      title: title ?? this.title,
      generatedAt: generatedAt ?? this.generatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (weekStart.present) {
      map['week_start'] = Variable<DateTime>(weekStart.value);
    }
    if (avgSleepHours.present) {
      map['avg_sleep_hours'] = Variable<double>(avgSleepHours.value);
    }
    if (avgHrv.present) {
      map['avg_hrv'] = Variable<int>(avgHrv.value);
    }
    if (totalSteps.present) {
      map['total_steps'] = Variable<int>(totalSteps.value);
    }
    if (totalCaloriesBurned.present) {
      map['total_calories_burned'] = Variable<int>(totalCaloriesBurned.value);
    }
    if (exerciseMinutes.present) {
      map['exercise_minutes'] = Variable<int>(exerciseMinutes.value);
    }
    if (waterDays.present) {
      map['water_days'] = Variable<int>(waterDays.value);
    }
    if (goalCompletionRate.present) {
      map['goal_completion_rate'] = Variable<int>(goalCompletionRate.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (generatedAt.present) {
      map['generated_at'] = Variable<DateTime>(generatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WeeklySummariesCompanion(')
          ..write('id: $id, ')
          ..write('weekStart: $weekStart, ')
          ..write('avgSleepHours: $avgSleepHours, ')
          ..write('avgHrv: $avgHrv, ')
          ..write('totalSteps: $totalSteps, ')
          ..write('totalCaloriesBurned: $totalCaloriesBurned, ')
          ..write('exerciseMinutes: $exerciseMinutes, ')
          ..write('waterDays: $waterDays, ')
          ..write('goalCompletionRate: $goalCompletionRate, ')
          ..write('title: $title, ')
          ..write('generatedAt: $generatedAt')
          ..write(')'))
        .toString();
  }
}

class $HealthSyncStatesTable extends HealthSyncStates
    with TableInfo<$HealthSyncStatesTable, HealthSyncState> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HealthSyncStatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _metricTypeMeta = const VerificationMeta(
    'metricType',
  );
  @override
  late final GeneratedColumn<String> metricType = GeneratedColumn<String>(
    'metric_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastSyncedAtMeta = const VerificationMeta(
    'lastSyncedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastSyncedAt = GeneratedColumn<DateTime>(
    'last_synced_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, metricType, lastSyncedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'health_sync_states';
  @override
  VerificationContext validateIntegrity(
    Insertable<HealthSyncState> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('metric_type')) {
      context.handle(
        _metricTypeMeta,
        metricType.isAcceptableOrUnknown(data['metric_type']!, _metricTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_metricTypeMeta);
    }
    if (data.containsKey('last_synced_at')) {
      context.handle(
        _lastSyncedAtMeta,
        lastSyncedAt.isAcceptableOrUnknown(
          data['last_synced_at']!,
          _lastSyncedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastSyncedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {metricType},
  ];
  @override
  HealthSyncState map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HealthSyncState(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      metricType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}metric_type'],
      )!,
      lastSyncedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_synced_at'],
      )!,
    );
  }

  @override
  $HealthSyncStatesTable createAlias(String alias) {
    return $HealthSyncStatesTable(attachedDatabase, alias);
  }
}

class HealthSyncState extends DataClass implements Insertable<HealthSyncState> {
  final int id;
  final String metricType;
  final DateTime lastSyncedAt;
  const HealthSyncState({
    required this.id,
    required this.metricType,
    required this.lastSyncedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['metric_type'] = Variable<String>(metricType);
    map['last_synced_at'] = Variable<DateTime>(lastSyncedAt);
    return map;
  }

  HealthSyncStatesCompanion toCompanion(bool nullToAbsent) {
    return HealthSyncStatesCompanion(
      id: Value(id),
      metricType: Value(metricType),
      lastSyncedAt: Value(lastSyncedAt),
    );
  }

  factory HealthSyncState.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HealthSyncState(
      id: serializer.fromJson<int>(json['id']),
      metricType: serializer.fromJson<String>(json['metricType']),
      lastSyncedAt: serializer.fromJson<DateTime>(json['lastSyncedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'metricType': serializer.toJson<String>(metricType),
      'lastSyncedAt': serializer.toJson<DateTime>(lastSyncedAt),
    };
  }

  HealthSyncState copyWith({
    int? id,
    String? metricType,
    DateTime? lastSyncedAt,
  }) => HealthSyncState(
    id: id ?? this.id,
    metricType: metricType ?? this.metricType,
    lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
  );
  HealthSyncState copyWithCompanion(HealthSyncStatesCompanion data) {
    return HealthSyncState(
      id: data.id.present ? data.id.value : this.id,
      metricType: data.metricType.present
          ? data.metricType.value
          : this.metricType,
      lastSyncedAt: data.lastSyncedAt.present
          ? data.lastSyncedAt.value
          : this.lastSyncedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HealthSyncState(')
          ..write('id: $id, ')
          ..write('metricType: $metricType, ')
          ..write('lastSyncedAt: $lastSyncedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, metricType, lastSyncedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HealthSyncState &&
          other.id == this.id &&
          other.metricType == this.metricType &&
          other.lastSyncedAt == this.lastSyncedAt);
}

class HealthSyncStatesCompanion extends UpdateCompanion<HealthSyncState> {
  final Value<int> id;
  final Value<String> metricType;
  final Value<DateTime> lastSyncedAt;
  const HealthSyncStatesCompanion({
    this.id = const Value.absent(),
    this.metricType = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
  });
  HealthSyncStatesCompanion.insert({
    this.id = const Value.absent(),
    required String metricType,
    required DateTime lastSyncedAt,
  }) : metricType = Value(metricType),
       lastSyncedAt = Value(lastSyncedAt);
  static Insertable<HealthSyncState> custom({
    Expression<int>? id,
    Expression<String>? metricType,
    Expression<DateTime>? lastSyncedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (metricType != null) 'metric_type': metricType,
      if (lastSyncedAt != null) 'last_synced_at': lastSyncedAt,
    });
  }

  HealthSyncStatesCompanion copyWith({
    Value<int>? id,
    Value<String>? metricType,
    Value<DateTime>? lastSyncedAt,
  }) {
    return HealthSyncStatesCompanion(
      id: id ?? this.id,
      metricType: metricType ?? this.metricType,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (metricType.present) {
      map['metric_type'] = Variable<String>(metricType.value);
    }
    if (lastSyncedAt.present) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HealthSyncStatesCompanion(')
          ..write('id: $id, ')
          ..write('metricType: $metricType, ')
          ..write('lastSyncedAt: $lastSyncedAt')
          ..write(')'))
        .toString();
  }
}

class $AppSettingsTable extends AppSettings
    with TableInfo<$AppSettingsTable, AppSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppSetting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {key},
  ];
  @override
  AppSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSetting(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $AppSettingsTable createAlias(String alias) {
    return $AppSettingsTable(attachedDatabase, alias);
  }
}

class AppSetting extends DataClass implements Insertable<AppSetting> {
  final int id;
  final String key;
  final String value;
  const AppSetting({required this.id, required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  AppSettingsCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsCompanion(
      id: Value(id),
      key: Value(key),
      value: Value(value),
    );
  }

  factory AppSetting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSetting(
      id: serializer.fromJson<int>(json['id']),
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  AppSetting copyWith({int? id, String? key, String? value}) => AppSetting(
    id: id ?? this.id,
    key: key ?? this.key,
    value: value ?? this.value,
  );
  AppSetting copyWithCompanion(AppSettingsCompanion data) {
    return AppSetting(
      id: data.id.present ? data.id.value : this.id,
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSetting(')
          ..write('id: $id, ')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSetting &&
          other.id == this.id &&
          other.key == this.key &&
          other.value == this.value);
}

class AppSettingsCompanion extends UpdateCompanion<AppSetting> {
  final Value<int> id;
  final Value<String> key;
  final Value<String> value;
  const AppSettingsCompanion({
    this.id = const Value.absent(),
    this.key = const Value.absent(),
    this.value = const Value.absent(),
  });
  AppSettingsCompanion.insert({
    this.id = const Value.absent(),
    required String key,
    required String value,
  }) : key = Value(key),
       value = Value(value);
  static Insertable<AppSetting> custom({
    Expression<int>? id,
    Expression<String>? key,
    Expression<String>? value,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (key != null) 'key': key,
      if (value != null) 'value': value,
    });
  }

  AppSettingsCompanion copyWith({
    Value<int>? id,
    Value<String>? key,
    Value<String>? value,
  }) {
    return AppSettingsCompanion(
      id: id ?? this.id,
      key: key ?? this.key,
      value: value ?? this.value,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsCompanion(')
          ..write('id: $id, ')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UserProfilesTable userProfiles = $UserProfilesTable(this);
  late final $PlansTable plans = $PlansTable(this);
  late final $WeightRecordsTable weightRecords = $WeightRecordsTable(this);
  late final $MealLogsTable mealLogs = $MealLogsTable(this);
  late final $DailyMetricsTable dailyMetrics = $DailyMetricsTable(this);
  late final $GoalsTable goals = $GoalsTable(this);
  late final $GoalLogsTable goalLogs = $GoalLogsTable(this);
  late final $PetStatesTable petStates = $PetStatesTable(this);
  late final $WeeklySummariesTable weeklySummaries = $WeeklySummariesTable(
    this,
  );
  late final $HealthSyncStatesTable healthSyncStates = $HealthSyncStatesTable(
    this,
  );
  late final $AppSettingsTable appSettings = $AppSettingsTable(this);
  late final Index idxDailyMetricsDate = Index(
    'idx_daily_metrics_date',
    'CREATE INDEX idx_daily_metrics_date ON daily_metrics (date)',
  );
  late final Index idxGoalLogsDate = Index(
    'idx_goal_logs_date',
    'CREATE INDEX idx_goal_logs_date ON goal_logs (date)',
  );
  late final Index idxGoalLogsGoalDate = Index(
    'idx_goal_logs_goal_date',
    'CREATE INDEX idx_goal_logs_goal_date ON goal_logs (goal_id, date)',
  );
  late final UserProfileDao userProfileDao = UserProfileDao(
    this as AppDatabase,
  );
  late final PlanDao planDao = PlanDao(this as AppDatabase);
  late final WeightDao weightDao = WeightDao(this as AppDatabase);
  late final MealDao mealDao = MealDao(this as AppDatabase);
  late final MetricsDao metricsDao = MetricsDao(this as AppDatabase);
  late final GoalDao goalDao = GoalDao(this as AppDatabase);
  late final PetDao petDao = PetDao(this as AppDatabase);
  late final WeeklySummaryDao weeklySummaryDao = WeeklySummaryDao(
    this as AppDatabase,
  );
  late final SettingsDao settingsDao = SettingsDao(this as AppDatabase);
  late final HealthSyncDao healthSyncDao = HealthSyncDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    userProfiles,
    plans,
    weightRecords,
    mealLogs,
    dailyMetrics,
    goals,
    goalLogs,
    petStates,
    weeklySummaries,
    healthSyncStates,
    appSettings,
    idxDailyMetricsDate,
    idxGoalLogsDate,
    idxGoalLogsGoalDate,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'goals',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('goal_logs', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$UserProfilesTableCreateCompanionBuilder =
    UserProfilesCompanion Function({
      Value<int> id,
      Value<String?> gender,
      Value<double?> height,
      Value<double?> weight,
      Value<DateTime?> birthday,
      Value<String> activityLevel,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$UserProfilesTableUpdateCompanionBuilder =
    UserProfilesCompanion Function({
      Value<int> id,
      Value<String?> gender,
      Value<double?> height,
      Value<double?> weight,
      Value<DateTime?> birthday,
      Value<String> activityLevel,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

class $$UserProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get birthday => $composableBuilder(
    column: $table.birthday,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get activityLevel => $composableBuilder(
    column: $table.activityLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UserProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get birthday => $composableBuilder(
    column: $table.birthday,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get activityLevel => $composableBuilder(
    column: $table.activityLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<double> get height =>
      $composableBuilder(column: $table.height, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<DateTime> get birthday =>
      $composableBuilder(column: $table.birthday, builder: (column) => column);

  GeneratedColumn<String> get activityLevel => $composableBuilder(
    column: $table.activityLevel,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$UserProfilesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserProfilesTable,
          UserProfile,
          $$UserProfilesTableFilterComposer,
          $$UserProfilesTableOrderingComposer,
          $$UserProfilesTableAnnotationComposer,
          $$UserProfilesTableCreateCompanionBuilder,
          $$UserProfilesTableUpdateCompanionBuilder,
          (
            UserProfile,
            BaseReferences<_$AppDatabase, $UserProfilesTable, UserProfile>,
          ),
          UserProfile,
          PrefetchHooks Function()
        > {
  $$UserProfilesTableTableManager(_$AppDatabase db, $UserProfilesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> gender = const Value.absent(),
                Value<double?> height = const Value.absent(),
                Value<double?> weight = const Value.absent(),
                Value<DateTime?> birthday = const Value.absent(),
                Value<String> activityLevel = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => UserProfilesCompanion(
                id: id,
                gender: gender,
                height: height,
                weight: weight,
                birthday: birthday,
                activityLevel: activityLevel,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> gender = const Value.absent(),
                Value<double?> height = const Value.absent(),
                Value<double?> weight = const Value.absent(),
                Value<DateTime?> birthday = const Value.absent(),
                Value<String> activityLevel = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => UserProfilesCompanion.insert(
                id: id,
                gender: gender,
                height: height,
                weight: weight,
                birthday: birthday,
                activityLevel: activityLevel,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserProfilesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserProfilesTable,
      UserProfile,
      $$UserProfilesTableFilterComposer,
      $$UserProfilesTableOrderingComposer,
      $$UserProfilesTableAnnotationComposer,
      $$UserProfilesTableCreateCompanionBuilder,
      $$UserProfilesTableUpdateCompanionBuilder,
      (
        UserProfile,
        BaseReferences<_$AppDatabase, $UserProfilesTable, UserProfile>,
      ),
      UserProfile,
      PrefetchHooks Function()
    >;
typedef $$PlansTableCreateCompanionBuilder =
    PlansCompanion Function({
      Value<int> id,
      required double initialWeight,
      required double targetWeight,
      required int durationDays,
      Value<int> dailyCalorieDeficit,
      required DateTime startDate,
      required DateTime endDate,
      Value<bool> isActive,
      Value<DateTime> createdAt,
    });
typedef $$PlansTableUpdateCompanionBuilder =
    PlansCompanion Function({
      Value<int> id,
      Value<double> initialWeight,
      Value<double> targetWeight,
      Value<int> durationDays,
      Value<int> dailyCalorieDeficit,
      Value<DateTime> startDate,
      Value<DateTime> endDate,
      Value<bool> isActive,
      Value<DateTime> createdAt,
    });

class $$PlansTableFilterComposer extends Composer<_$AppDatabase, $PlansTable> {
  $$PlansTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get initialWeight => $composableBuilder(
    column: $table.initialWeight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get targetWeight => $composableBuilder(
    column: $table.targetWeight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationDays => $composableBuilder(
    column: $table.durationDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dailyCalorieDeficit => $composableBuilder(
    column: $table.dailyCalorieDeficit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PlansTableOrderingComposer
    extends Composer<_$AppDatabase, $PlansTable> {
  $$PlansTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get initialWeight => $composableBuilder(
    column: $table.initialWeight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get targetWeight => $composableBuilder(
    column: $table.targetWeight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationDays => $composableBuilder(
    column: $table.durationDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dailyCalorieDeficit => $composableBuilder(
    column: $table.dailyCalorieDeficit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PlansTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlansTable> {
  $$PlansTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get initialWeight => $composableBuilder(
    column: $table.initialWeight,
    builder: (column) => column,
  );

  GeneratedColumn<double> get targetWeight => $composableBuilder(
    column: $table.targetWeight,
    builder: (column) => column,
  );

  GeneratedColumn<int> get durationDays => $composableBuilder(
    column: $table.durationDays,
    builder: (column) => column,
  );

  GeneratedColumn<int> get dailyCalorieDeficit => $composableBuilder(
    column: $table.dailyCalorieDeficit,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$PlansTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PlansTable,
          Plan,
          $$PlansTableFilterComposer,
          $$PlansTableOrderingComposer,
          $$PlansTableAnnotationComposer,
          $$PlansTableCreateCompanionBuilder,
          $$PlansTableUpdateCompanionBuilder,
          (Plan, BaseReferences<_$AppDatabase, $PlansTable, Plan>),
          Plan,
          PrefetchHooks Function()
        > {
  $$PlansTableTableManager(_$AppDatabase db, $PlansTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlansTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlansTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlansTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<double> initialWeight = const Value.absent(),
                Value<double> targetWeight = const Value.absent(),
                Value<int> durationDays = const Value.absent(),
                Value<int> dailyCalorieDeficit = const Value.absent(),
                Value<DateTime> startDate = const Value.absent(),
                Value<DateTime> endDate = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PlansCompanion(
                id: id,
                initialWeight: initialWeight,
                targetWeight: targetWeight,
                durationDays: durationDays,
                dailyCalorieDeficit: dailyCalorieDeficit,
                startDate: startDate,
                endDate: endDate,
                isActive: isActive,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required double initialWeight,
                required double targetWeight,
                required int durationDays,
                Value<int> dailyCalorieDeficit = const Value.absent(),
                required DateTime startDate,
                required DateTime endDate,
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PlansCompanion.insert(
                id: id,
                initialWeight: initialWeight,
                targetWeight: targetWeight,
                durationDays: durationDays,
                dailyCalorieDeficit: dailyCalorieDeficit,
                startDate: startDate,
                endDate: endDate,
                isActive: isActive,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PlansTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PlansTable,
      Plan,
      $$PlansTableFilterComposer,
      $$PlansTableOrderingComposer,
      $$PlansTableAnnotationComposer,
      $$PlansTableCreateCompanionBuilder,
      $$PlansTableUpdateCompanionBuilder,
      (Plan, BaseReferences<_$AppDatabase, $PlansTable, Plan>),
      Plan,
      PrefetchHooks Function()
    >;
typedef $$WeightRecordsTableCreateCompanionBuilder =
    WeightRecordsCompanion Function({
      Value<int> id,
      required double weight,
      required DateTime recordedAt,
      Value<String> source,
    });
typedef $$WeightRecordsTableUpdateCompanionBuilder =
    WeightRecordsCompanion Function({
      Value<int> id,
      Value<double> weight,
      Value<DateTime> recordedAt,
      Value<String> source,
    });

class $$WeightRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $WeightRecordsTable> {
  $$WeightRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WeightRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $WeightRecordsTable> {
  $$WeightRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WeightRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WeightRecordsTable> {
  $$WeightRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<DateTime> get recordedAt => $composableBuilder(
    column: $table.recordedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);
}

class $$WeightRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WeightRecordsTable,
          WeightRecord,
          $$WeightRecordsTableFilterComposer,
          $$WeightRecordsTableOrderingComposer,
          $$WeightRecordsTableAnnotationComposer,
          $$WeightRecordsTableCreateCompanionBuilder,
          $$WeightRecordsTableUpdateCompanionBuilder,
          (
            WeightRecord,
            BaseReferences<_$AppDatabase, $WeightRecordsTable, WeightRecord>,
          ),
          WeightRecord,
          PrefetchHooks Function()
        > {
  $$WeightRecordsTableTableManager(_$AppDatabase db, $WeightRecordsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WeightRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WeightRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WeightRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<double> weight = const Value.absent(),
                Value<DateTime> recordedAt = const Value.absent(),
                Value<String> source = const Value.absent(),
              }) => WeightRecordsCompanion(
                id: id,
                weight: weight,
                recordedAt: recordedAt,
                source: source,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required double weight,
                required DateTime recordedAt,
                Value<String> source = const Value.absent(),
              }) => WeightRecordsCompanion.insert(
                id: id,
                weight: weight,
                recordedAt: recordedAt,
                source: source,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WeightRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WeightRecordsTable,
      WeightRecord,
      $$WeightRecordsTableFilterComposer,
      $$WeightRecordsTableOrderingComposer,
      $$WeightRecordsTableAnnotationComposer,
      $$WeightRecordsTableCreateCompanionBuilder,
      $$WeightRecordsTableUpdateCompanionBuilder,
      (
        WeightRecord,
        BaseReferences<_$AppDatabase, $WeightRecordsTable, WeightRecord>,
      ),
      WeightRecord,
      PrefetchHooks Function()
    >;
typedef $$MealLogsTableCreateCompanionBuilder =
    MealLogsCompanion Function({
      Value<int> id,
      required String mealType,
      required String foodName,
      required int calories,
      required DateTime loggedAt,
      Value<String?> note,
    });
typedef $$MealLogsTableUpdateCompanionBuilder =
    MealLogsCompanion Function({
      Value<int> id,
      Value<String> mealType,
      Value<String> foodName,
      Value<int> calories,
      Value<DateTime> loggedAt,
      Value<String?> note,
    });

class $$MealLogsTableFilterComposer
    extends Composer<_$AppDatabase, $MealLogsTable> {
  $$MealLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mealType => $composableBuilder(
    column: $table.mealType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get foodName => $composableBuilder(
    column: $table.foodName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get calories => $composableBuilder(
    column: $table.calories,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get loggedAt => $composableBuilder(
    column: $table.loggedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MealLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $MealLogsTable> {
  $$MealLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mealType => $composableBuilder(
    column: $table.mealType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get foodName => $composableBuilder(
    column: $table.foodName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get calories => $composableBuilder(
    column: $table.calories,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get loggedAt => $composableBuilder(
    column: $table.loggedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MealLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MealLogsTable> {
  $$MealLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get mealType =>
      $composableBuilder(column: $table.mealType, builder: (column) => column);

  GeneratedColumn<String> get foodName =>
      $composableBuilder(column: $table.foodName, builder: (column) => column);

  GeneratedColumn<int> get calories =>
      $composableBuilder(column: $table.calories, builder: (column) => column);

  GeneratedColumn<DateTime> get loggedAt =>
      $composableBuilder(column: $table.loggedAt, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);
}

class $$MealLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MealLogsTable,
          MealLog,
          $$MealLogsTableFilterComposer,
          $$MealLogsTableOrderingComposer,
          $$MealLogsTableAnnotationComposer,
          $$MealLogsTableCreateCompanionBuilder,
          $$MealLogsTableUpdateCompanionBuilder,
          (MealLog, BaseReferences<_$AppDatabase, $MealLogsTable, MealLog>),
          MealLog,
          PrefetchHooks Function()
        > {
  $$MealLogsTableTableManager(_$AppDatabase db, $MealLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MealLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MealLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MealLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> mealType = const Value.absent(),
                Value<String> foodName = const Value.absent(),
                Value<int> calories = const Value.absent(),
                Value<DateTime> loggedAt = const Value.absent(),
                Value<String?> note = const Value.absent(),
              }) => MealLogsCompanion(
                id: id,
                mealType: mealType,
                foodName: foodName,
                calories: calories,
                loggedAt: loggedAt,
                note: note,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String mealType,
                required String foodName,
                required int calories,
                required DateTime loggedAt,
                Value<String?> note = const Value.absent(),
              }) => MealLogsCompanion.insert(
                id: id,
                mealType: mealType,
                foodName: foodName,
                calories: calories,
                loggedAt: loggedAt,
                note: note,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MealLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MealLogsTable,
      MealLog,
      $$MealLogsTableFilterComposer,
      $$MealLogsTableOrderingComposer,
      $$MealLogsTableAnnotationComposer,
      $$MealLogsTableCreateCompanionBuilder,
      $$MealLogsTableUpdateCompanionBuilder,
      (MealLog, BaseReferences<_$AppDatabase, $MealLogsTable, MealLog>),
      MealLog,
      PrefetchHooks Function()
    >;
typedef $$DailyMetricsTableCreateCompanionBuilder =
    DailyMetricsCompanion Function({
      Value<int> id,
      required DateTime date,
      Value<int> steps,
      Value<int> activeMinutes,
      Value<int> caloriesBurned,
      Value<double> sleepHours,
      Value<int?> avgHeartRate,
      Value<int?> hrv,
      Value<DateTime> updatedAt,
    });
typedef $$DailyMetricsTableUpdateCompanionBuilder =
    DailyMetricsCompanion Function({
      Value<int> id,
      Value<DateTime> date,
      Value<int> steps,
      Value<int> activeMinutes,
      Value<int> caloriesBurned,
      Value<double> sleepHours,
      Value<int?> avgHeartRate,
      Value<int?> hrv,
      Value<DateTime> updatedAt,
    });

class $$DailyMetricsTableFilterComposer
    extends Composer<_$AppDatabase, $DailyMetricsTable> {
  $$DailyMetricsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get steps => $composableBuilder(
    column: $table.steps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get activeMinutes => $composableBuilder(
    column: $table.activeMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get caloriesBurned => $composableBuilder(
    column: $table.caloriesBurned,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get sleepHours => $composableBuilder(
    column: $table.sleepHours,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get avgHeartRate => $composableBuilder(
    column: $table.avgHeartRate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get hrv => $composableBuilder(
    column: $table.hrv,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DailyMetricsTableOrderingComposer
    extends Composer<_$AppDatabase, $DailyMetricsTable> {
  $$DailyMetricsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get steps => $composableBuilder(
    column: $table.steps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get activeMinutes => $composableBuilder(
    column: $table.activeMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get caloriesBurned => $composableBuilder(
    column: $table.caloriesBurned,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get sleepHours => $composableBuilder(
    column: $table.sleepHours,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get avgHeartRate => $composableBuilder(
    column: $table.avgHeartRate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get hrv => $composableBuilder(
    column: $table.hrv,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DailyMetricsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DailyMetricsTable> {
  $$DailyMetricsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get steps =>
      $composableBuilder(column: $table.steps, builder: (column) => column);

  GeneratedColumn<int> get activeMinutes => $composableBuilder(
    column: $table.activeMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get caloriesBurned => $composableBuilder(
    column: $table.caloriesBurned,
    builder: (column) => column,
  );

  GeneratedColumn<double> get sleepHours => $composableBuilder(
    column: $table.sleepHours,
    builder: (column) => column,
  );

  GeneratedColumn<int> get avgHeartRate => $composableBuilder(
    column: $table.avgHeartRate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get hrv =>
      $composableBuilder(column: $table.hrv, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$DailyMetricsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DailyMetricsTable,
          DailyMetric,
          $$DailyMetricsTableFilterComposer,
          $$DailyMetricsTableOrderingComposer,
          $$DailyMetricsTableAnnotationComposer,
          $$DailyMetricsTableCreateCompanionBuilder,
          $$DailyMetricsTableUpdateCompanionBuilder,
          (
            DailyMetric,
            BaseReferences<_$AppDatabase, $DailyMetricsTable, DailyMetric>,
          ),
          DailyMetric,
          PrefetchHooks Function()
        > {
  $$DailyMetricsTableTableManager(_$AppDatabase db, $DailyMetricsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DailyMetricsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DailyMetricsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DailyMetricsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<int> steps = const Value.absent(),
                Value<int> activeMinutes = const Value.absent(),
                Value<int> caloriesBurned = const Value.absent(),
                Value<double> sleepHours = const Value.absent(),
                Value<int?> avgHeartRate = const Value.absent(),
                Value<int?> hrv = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => DailyMetricsCompanion(
                id: id,
                date: date,
                steps: steps,
                activeMinutes: activeMinutes,
                caloriesBurned: caloriesBurned,
                sleepHours: sleepHours,
                avgHeartRate: avgHeartRate,
                hrv: hrv,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime date,
                Value<int> steps = const Value.absent(),
                Value<int> activeMinutes = const Value.absent(),
                Value<int> caloriesBurned = const Value.absent(),
                Value<double> sleepHours = const Value.absent(),
                Value<int?> avgHeartRate = const Value.absent(),
                Value<int?> hrv = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => DailyMetricsCompanion.insert(
                id: id,
                date: date,
                steps: steps,
                activeMinutes: activeMinutes,
                caloriesBurned: caloriesBurned,
                sleepHours: sleepHours,
                avgHeartRate: avgHeartRate,
                hrv: hrv,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DailyMetricsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DailyMetricsTable,
      DailyMetric,
      $$DailyMetricsTableFilterComposer,
      $$DailyMetricsTableOrderingComposer,
      $$DailyMetricsTableAnnotationComposer,
      $$DailyMetricsTableCreateCompanionBuilder,
      $$DailyMetricsTableUpdateCompanionBuilder,
      (
        DailyMetric,
        BaseReferences<_$AppDatabase, $DailyMetricsTable, DailyMetric>,
      ),
      DailyMetric,
      PrefetchHooks Function()
    >;
typedef $$GoalsTableCreateCompanionBuilder =
    GoalsCompanion Function({
      Value<int> id,
      required String name,
      Value<String> icon,
      required String period,
      required int target,
      Value<String?> reminderTime,
      Value<bool> enabled,
      Value<int> sortOrder,
      Value<DateTime> createdAt,
    });
typedef $$GoalsTableUpdateCompanionBuilder =
    GoalsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> icon,
      Value<String> period,
      Value<int> target,
      Value<String?> reminderTime,
      Value<bool> enabled,
      Value<int> sortOrder,
      Value<DateTime> createdAt,
    });

final class $$GoalsTableReferences
    extends BaseReferences<_$AppDatabase, $GoalsTable, Goal> {
  $$GoalsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$GoalLogsTable, List<GoalLog>> _goalLogsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.goalLogs,
    aliasName: $_aliasNameGenerator(db.goals.id, db.goalLogs.goalId),
  );

  $$GoalLogsTableProcessedTableManager get goalLogsRefs {
    final manager = $$GoalLogsTableTableManager(
      $_db,
      $_db.goalLogs,
    ).filter((f) => f.goalId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_goalLogsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$GoalsTableFilterComposer extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get period => $composableBuilder(
    column: $table.period,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get target => $composableBuilder(
    column: $table.target,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reminderTime => $composableBuilder(
    column: $table.reminderTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> goalLogsRefs(
    Expression<bool> Function($$GoalLogsTableFilterComposer f) f,
  ) {
    final $$GoalLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.goalLogs,
      getReferencedColumn: (t) => t.goalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalLogsTableFilterComposer(
            $db: $db,
            $table: $db.goalLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$GoalsTableOrderingComposer
    extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get period => $composableBuilder(
    column: $table.period,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get target => $composableBuilder(
    column: $table.target,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reminderTime => $composableBuilder(
    column: $table.reminderTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GoalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);

  GeneratedColumn<String> get period =>
      $composableBuilder(column: $table.period, builder: (column) => column);

  GeneratedColumn<int> get target =>
      $composableBuilder(column: $table.target, builder: (column) => column);

  GeneratedColumn<String> get reminderTime => $composableBuilder(
    column: $table.reminderTime,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get enabled =>
      $composableBuilder(column: $table.enabled, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> goalLogsRefs<T extends Object>(
    Expression<T> Function($$GoalLogsTableAnnotationComposer a) f,
  ) {
    final $$GoalLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.goalLogs,
      getReferencedColumn: (t) => t.goalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.goalLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$GoalsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GoalsTable,
          Goal,
          $$GoalsTableFilterComposer,
          $$GoalsTableOrderingComposer,
          $$GoalsTableAnnotationComposer,
          $$GoalsTableCreateCompanionBuilder,
          $$GoalsTableUpdateCompanionBuilder,
          (Goal, $$GoalsTableReferences),
          Goal,
          PrefetchHooks Function({bool goalLogsRefs})
        > {
  $$GoalsTableTableManager(_$AppDatabase db, $GoalsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GoalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GoalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GoalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> icon = const Value.absent(),
                Value<String> period = const Value.absent(),
                Value<int> target = const Value.absent(),
                Value<String?> reminderTime = const Value.absent(),
                Value<bool> enabled = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => GoalsCompanion(
                id: id,
                name: name,
                icon: icon,
                period: period,
                target: target,
                reminderTime: reminderTime,
                enabled: enabled,
                sortOrder: sortOrder,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String> icon = const Value.absent(),
                required String period,
                required int target,
                Value<String?> reminderTime = const Value.absent(),
                Value<bool> enabled = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => GoalsCompanion.insert(
                id: id,
                name: name,
                icon: icon,
                period: period,
                target: target,
                reminderTime: reminderTime,
                enabled: enabled,
                sortOrder: sortOrder,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$GoalsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({goalLogsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (goalLogsRefs) db.goalLogs],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (goalLogsRefs)
                    await $_getPrefetchedData<Goal, $GoalsTable, GoalLog>(
                      currentTable: table,
                      referencedTable: $$GoalsTableReferences
                          ._goalLogsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$GoalsTableReferences(db, table, p0).goalLogsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.goalId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$GoalsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GoalsTable,
      Goal,
      $$GoalsTableFilterComposer,
      $$GoalsTableOrderingComposer,
      $$GoalsTableAnnotationComposer,
      $$GoalsTableCreateCompanionBuilder,
      $$GoalsTableUpdateCompanionBuilder,
      (Goal, $$GoalsTableReferences),
      Goal,
      PrefetchHooks Function({bool goalLogsRefs})
    >;
typedef $$GoalLogsTableCreateCompanionBuilder =
    GoalLogsCompanion Function({
      Value<int> id,
      required int goalId,
      required DateTime date,
      Value<int> progress,
      Value<DateTime> updatedAt,
    });
typedef $$GoalLogsTableUpdateCompanionBuilder =
    GoalLogsCompanion Function({
      Value<int> id,
      Value<int> goalId,
      Value<DateTime> date,
      Value<int> progress,
      Value<DateTime> updatedAt,
    });

final class $$GoalLogsTableReferences
    extends BaseReferences<_$AppDatabase, $GoalLogsTable, GoalLog> {
  $$GoalLogsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $GoalsTable _goalIdTable(_$AppDatabase db) => db.goals.createAlias(
    $_aliasNameGenerator(db.goalLogs.goalId, db.goals.id),
  );

  $$GoalsTableProcessedTableManager get goalId {
    final $_column = $_itemColumn<int>('goal_id')!;

    final manager = $$GoalsTableTableManager(
      $_db,
      $_db.goals,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_goalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$GoalLogsTableFilterComposer
    extends Composer<_$AppDatabase, $GoalLogsTable> {
  $$GoalLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get progress => $composableBuilder(
    column: $table.progress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$GoalsTableFilterComposer get goalId {
    final $$GoalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalId,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableFilterComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GoalLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $GoalLogsTable> {
  $$GoalLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get progress => $composableBuilder(
    column: $table.progress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$GoalsTableOrderingComposer get goalId {
    final $$GoalsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalId,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableOrderingComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GoalLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GoalLogsTable> {
  $$GoalLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get progress =>
      $composableBuilder(column: $table.progress, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$GoalsTableAnnotationComposer get goalId {
    final $$GoalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.goalId,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableAnnotationComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GoalLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GoalLogsTable,
          GoalLog,
          $$GoalLogsTableFilterComposer,
          $$GoalLogsTableOrderingComposer,
          $$GoalLogsTableAnnotationComposer,
          $$GoalLogsTableCreateCompanionBuilder,
          $$GoalLogsTableUpdateCompanionBuilder,
          (GoalLog, $$GoalLogsTableReferences),
          GoalLog,
          PrefetchHooks Function({bool goalId})
        > {
  $$GoalLogsTableTableManager(_$AppDatabase db, $GoalLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GoalLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GoalLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GoalLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> goalId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<int> progress = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => GoalLogsCompanion(
                id: id,
                goalId: goalId,
                date: date,
                progress: progress,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int goalId,
                required DateTime date,
                Value<int> progress = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => GoalLogsCompanion.insert(
                id: id,
                goalId: goalId,
                date: date,
                progress: progress,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$GoalLogsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({goalId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (goalId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.goalId,
                                referencedTable: $$GoalLogsTableReferences
                                    ._goalIdTable(db),
                                referencedColumn: $$GoalLogsTableReferences
                                    ._goalIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$GoalLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GoalLogsTable,
      GoalLog,
      $$GoalLogsTableFilterComposer,
      $$GoalLogsTableOrderingComposer,
      $$GoalLogsTableAnnotationComposer,
      $$GoalLogsTableCreateCompanionBuilder,
      $$GoalLogsTableUpdateCompanionBuilder,
      (GoalLog, $$GoalLogsTableReferences),
      GoalLog,
      PrefetchHooks Function({bool goalId})
    >;
typedef $$PetStatesTableCreateCompanionBuilder =
    PetStatesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> level,
      Value<int> exp,
      Value<int> companionDays,
      Value<String> currentSkin,
      Value<DateTime?> lastActiveDate,
      Value<DateTime> createdAt,
    });
typedef $$PetStatesTableUpdateCompanionBuilder =
    PetStatesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> level,
      Value<int> exp,
      Value<int> companionDays,
      Value<String> currentSkin,
      Value<DateTime?> lastActiveDate,
      Value<DateTime> createdAt,
    });

class $$PetStatesTableFilterComposer
    extends Composer<_$AppDatabase, $PetStatesTable> {
  $$PetStatesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get exp => $composableBuilder(
    column: $table.exp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get companionDays => $composableBuilder(
    column: $table.companionDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currentSkin => $composableBuilder(
    column: $table.currentSkin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastActiveDate => $composableBuilder(
    column: $table.lastActiveDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PetStatesTableOrderingComposer
    extends Composer<_$AppDatabase, $PetStatesTable> {
  $$PetStatesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get exp => $composableBuilder(
    column: $table.exp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get companionDays => $composableBuilder(
    column: $table.companionDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currentSkin => $composableBuilder(
    column: $table.currentSkin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastActiveDate => $composableBuilder(
    column: $table.lastActiveDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PetStatesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PetStatesTable> {
  $$PetStatesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  GeneratedColumn<int> get exp =>
      $composableBuilder(column: $table.exp, builder: (column) => column);

  GeneratedColumn<int> get companionDays => $composableBuilder(
    column: $table.companionDays,
    builder: (column) => column,
  );

  GeneratedColumn<String> get currentSkin => $composableBuilder(
    column: $table.currentSkin,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastActiveDate => $composableBuilder(
    column: $table.lastActiveDate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$PetStatesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PetStatesTable,
          PetState,
          $$PetStatesTableFilterComposer,
          $$PetStatesTableOrderingComposer,
          $$PetStatesTableAnnotationComposer,
          $$PetStatesTableCreateCompanionBuilder,
          $$PetStatesTableUpdateCompanionBuilder,
          (PetState, BaseReferences<_$AppDatabase, $PetStatesTable, PetState>),
          PetState,
          PrefetchHooks Function()
        > {
  $$PetStatesTableTableManager(_$AppDatabase db, $PetStatesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PetStatesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PetStatesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PetStatesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> level = const Value.absent(),
                Value<int> exp = const Value.absent(),
                Value<int> companionDays = const Value.absent(),
                Value<String> currentSkin = const Value.absent(),
                Value<DateTime?> lastActiveDate = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PetStatesCompanion(
                id: id,
                name: name,
                level: level,
                exp: exp,
                companionDays: companionDays,
                currentSkin: currentSkin,
                lastActiveDate: lastActiveDate,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> level = const Value.absent(),
                Value<int> exp = const Value.absent(),
                Value<int> companionDays = const Value.absent(),
                Value<String> currentSkin = const Value.absent(),
                Value<DateTime?> lastActiveDate = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PetStatesCompanion.insert(
                id: id,
                name: name,
                level: level,
                exp: exp,
                companionDays: companionDays,
                currentSkin: currentSkin,
                lastActiveDate: lastActiveDate,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PetStatesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PetStatesTable,
      PetState,
      $$PetStatesTableFilterComposer,
      $$PetStatesTableOrderingComposer,
      $$PetStatesTableAnnotationComposer,
      $$PetStatesTableCreateCompanionBuilder,
      $$PetStatesTableUpdateCompanionBuilder,
      (PetState, BaseReferences<_$AppDatabase, $PetStatesTable, PetState>),
      PetState,
      PrefetchHooks Function()
    >;
typedef $$WeeklySummariesTableCreateCompanionBuilder =
    WeeklySummariesCompanion Function({
      Value<int> id,
      required DateTime weekStart,
      required double avgSleepHours,
      Value<int?> avgHrv,
      required int totalSteps,
      required int totalCaloriesBurned,
      required int exerciseMinutes,
      required int waterDays,
      required int goalCompletionRate,
      required String title,
      Value<DateTime> generatedAt,
    });
typedef $$WeeklySummariesTableUpdateCompanionBuilder =
    WeeklySummariesCompanion Function({
      Value<int> id,
      Value<DateTime> weekStart,
      Value<double> avgSleepHours,
      Value<int?> avgHrv,
      Value<int> totalSteps,
      Value<int> totalCaloriesBurned,
      Value<int> exerciseMinutes,
      Value<int> waterDays,
      Value<int> goalCompletionRate,
      Value<String> title,
      Value<DateTime> generatedAt,
    });

class $$WeeklySummariesTableFilterComposer
    extends Composer<_$AppDatabase, $WeeklySummariesTable> {
  $$WeeklySummariesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get weekStart => $composableBuilder(
    column: $table.weekStart,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get avgSleepHours => $composableBuilder(
    column: $table.avgSleepHours,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get avgHrv => $composableBuilder(
    column: $table.avgHrv,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalSteps => $composableBuilder(
    column: $table.totalSteps,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalCaloriesBurned => $composableBuilder(
    column: $table.totalCaloriesBurned,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get exerciseMinutes => $composableBuilder(
    column: $table.exerciseMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get waterDays => $composableBuilder(
    column: $table.waterDays,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get goalCompletionRate => $composableBuilder(
    column: $table.goalCompletionRate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get generatedAt => $composableBuilder(
    column: $table.generatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WeeklySummariesTableOrderingComposer
    extends Composer<_$AppDatabase, $WeeklySummariesTable> {
  $$WeeklySummariesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get weekStart => $composableBuilder(
    column: $table.weekStart,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get avgSleepHours => $composableBuilder(
    column: $table.avgSleepHours,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get avgHrv => $composableBuilder(
    column: $table.avgHrv,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalSteps => $composableBuilder(
    column: $table.totalSteps,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalCaloriesBurned => $composableBuilder(
    column: $table.totalCaloriesBurned,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get exerciseMinutes => $composableBuilder(
    column: $table.exerciseMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get waterDays => $composableBuilder(
    column: $table.waterDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get goalCompletionRate => $composableBuilder(
    column: $table.goalCompletionRate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get generatedAt => $composableBuilder(
    column: $table.generatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WeeklySummariesTableAnnotationComposer
    extends Composer<_$AppDatabase, $WeeklySummariesTable> {
  $$WeeklySummariesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get weekStart =>
      $composableBuilder(column: $table.weekStart, builder: (column) => column);

  GeneratedColumn<double> get avgSleepHours => $composableBuilder(
    column: $table.avgSleepHours,
    builder: (column) => column,
  );

  GeneratedColumn<int> get avgHrv =>
      $composableBuilder(column: $table.avgHrv, builder: (column) => column);

  GeneratedColumn<int> get totalSteps => $composableBuilder(
    column: $table.totalSteps,
    builder: (column) => column,
  );

  GeneratedColumn<int> get totalCaloriesBurned => $composableBuilder(
    column: $table.totalCaloriesBurned,
    builder: (column) => column,
  );

  GeneratedColumn<int> get exerciseMinutes => $composableBuilder(
    column: $table.exerciseMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get waterDays =>
      $composableBuilder(column: $table.waterDays, builder: (column) => column);

  GeneratedColumn<int> get goalCompletionRate => $composableBuilder(
    column: $table.goalCompletionRate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<DateTime> get generatedAt => $composableBuilder(
    column: $table.generatedAt,
    builder: (column) => column,
  );
}

class $$WeeklySummariesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WeeklySummariesTable,
          WeeklySummary,
          $$WeeklySummariesTableFilterComposer,
          $$WeeklySummariesTableOrderingComposer,
          $$WeeklySummariesTableAnnotationComposer,
          $$WeeklySummariesTableCreateCompanionBuilder,
          $$WeeklySummariesTableUpdateCompanionBuilder,
          (
            WeeklySummary,
            BaseReferences<_$AppDatabase, $WeeklySummariesTable, WeeklySummary>,
          ),
          WeeklySummary,
          PrefetchHooks Function()
        > {
  $$WeeklySummariesTableTableManager(
    _$AppDatabase db,
    $WeeklySummariesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WeeklySummariesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WeeklySummariesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WeeklySummariesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> weekStart = const Value.absent(),
                Value<double> avgSleepHours = const Value.absent(),
                Value<int?> avgHrv = const Value.absent(),
                Value<int> totalSteps = const Value.absent(),
                Value<int> totalCaloriesBurned = const Value.absent(),
                Value<int> exerciseMinutes = const Value.absent(),
                Value<int> waterDays = const Value.absent(),
                Value<int> goalCompletionRate = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<DateTime> generatedAt = const Value.absent(),
              }) => WeeklySummariesCompanion(
                id: id,
                weekStart: weekStart,
                avgSleepHours: avgSleepHours,
                avgHrv: avgHrv,
                totalSteps: totalSteps,
                totalCaloriesBurned: totalCaloriesBurned,
                exerciseMinutes: exerciseMinutes,
                waterDays: waterDays,
                goalCompletionRate: goalCompletionRate,
                title: title,
                generatedAt: generatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime weekStart,
                required double avgSleepHours,
                Value<int?> avgHrv = const Value.absent(),
                required int totalSteps,
                required int totalCaloriesBurned,
                required int exerciseMinutes,
                required int waterDays,
                required int goalCompletionRate,
                required String title,
                Value<DateTime> generatedAt = const Value.absent(),
              }) => WeeklySummariesCompanion.insert(
                id: id,
                weekStart: weekStart,
                avgSleepHours: avgSleepHours,
                avgHrv: avgHrv,
                totalSteps: totalSteps,
                totalCaloriesBurned: totalCaloriesBurned,
                exerciseMinutes: exerciseMinutes,
                waterDays: waterDays,
                goalCompletionRate: goalCompletionRate,
                title: title,
                generatedAt: generatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WeeklySummariesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WeeklySummariesTable,
      WeeklySummary,
      $$WeeklySummariesTableFilterComposer,
      $$WeeklySummariesTableOrderingComposer,
      $$WeeklySummariesTableAnnotationComposer,
      $$WeeklySummariesTableCreateCompanionBuilder,
      $$WeeklySummariesTableUpdateCompanionBuilder,
      (
        WeeklySummary,
        BaseReferences<_$AppDatabase, $WeeklySummariesTable, WeeklySummary>,
      ),
      WeeklySummary,
      PrefetchHooks Function()
    >;
typedef $$HealthSyncStatesTableCreateCompanionBuilder =
    HealthSyncStatesCompanion Function({
      Value<int> id,
      required String metricType,
      required DateTime lastSyncedAt,
    });
typedef $$HealthSyncStatesTableUpdateCompanionBuilder =
    HealthSyncStatesCompanion Function({
      Value<int> id,
      Value<String> metricType,
      Value<DateTime> lastSyncedAt,
    });

class $$HealthSyncStatesTableFilterComposer
    extends Composer<_$AppDatabase, $HealthSyncStatesTable> {
  $$HealthSyncStatesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get metricType => $composableBuilder(
    column: $table.metricType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastSyncedAt => $composableBuilder(
    column: $table.lastSyncedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$HealthSyncStatesTableOrderingComposer
    extends Composer<_$AppDatabase, $HealthSyncStatesTable> {
  $$HealthSyncStatesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get metricType => $composableBuilder(
    column: $table.metricType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastSyncedAt => $composableBuilder(
    column: $table.lastSyncedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$HealthSyncStatesTableAnnotationComposer
    extends Composer<_$AppDatabase, $HealthSyncStatesTable> {
  $$HealthSyncStatesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get metricType => $composableBuilder(
    column: $table.metricType,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastSyncedAt => $composableBuilder(
    column: $table.lastSyncedAt,
    builder: (column) => column,
  );
}

class $$HealthSyncStatesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HealthSyncStatesTable,
          HealthSyncState,
          $$HealthSyncStatesTableFilterComposer,
          $$HealthSyncStatesTableOrderingComposer,
          $$HealthSyncStatesTableAnnotationComposer,
          $$HealthSyncStatesTableCreateCompanionBuilder,
          $$HealthSyncStatesTableUpdateCompanionBuilder,
          (
            HealthSyncState,
            BaseReferences<
              _$AppDatabase,
              $HealthSyncStatesTable,
              HealthSyncState
            >,
          ),
          HealthSyncState,
          PrefetchHooks Function()
        > {
  $$HealthSyncStatesTableTableManager(
    _$AppDatabase db,
    $HealthSyncStatesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HealthSyncStatesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HealthSyncStatesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HealthSyncStatesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> metricType = const Value.absent(),
                Value<DateTime> lastSyncedAt = const Value.absent(),
              }) => HealthSyncStatesCompanion(
                id: id,
                metricType: metricType,
                lastSyncedAt: lastSyncedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String metricType,
                required DateTime lastSyncedAt,
              }) => HealthSyncStatesCompanion.insert(
                id: id,
                metricType: metricType,
                lastSyncedAt: lastSyncedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$HealthSyncStatesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HealthSyncStatesTable,
      HealthSyncState,
      $$HealthSyncStatesTableFilterComposer,
      $$HealthSyncStatesTableOrderingComposer,
      $$HealthSyncStatesTableAnnotationComposer,
      $$HealthSyncStatesTableCreateCompanionBuilder,
      $$HealthSyncStatesTableUpdateCompanionBuilder,
      (
        HealthSyncState,
        BaseReferences<_$AppDatabase, $HealthSyncStatesTable, HealthSyncState>,
      ),
      HealthSyncState,
      PrefetchHooks Function()
    >;
typedef $$AppSettingsTableCreateCompanionBuilder =
    AppSettingsCompanion Function({
      Value<int> id,
      required String key,
      required String value,
    });
typedef $$AppSettingsTableUpdateCompanionBuilder =
    AppSettingsCompanion Function({
      Value<int> id,
      Value<String> key,
      Value<String> value,
    });

class $$AppSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AppSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AppSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$AppSettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppSettingsTable,
          AppSetting,
          $$AppSettingsTableFilterComposer,
          $$AppSettingsTableOrderingComposer,
          $$AppSettingsTableAnnotationComposer,
          $$AppSettingsTableCreateCompanionBuilder,
          $$AppSettingsTableUpdateCompanionBuilder,
          (
            AppSetting,
            BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>,
          ),
          AppSetting,
          PrefetchHooks Function()
        > {
  $$AppSettingsTableTableManager(_$AppDatabase db, $AppSettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
              }) => AppSettingsCompanion(id: id, key: key, value: value),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String key,
                required String value,
              }) => AppSettingsCompanion.insert(id: id, key: key, value: value),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AppSettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppSettingsTable,
      AppSetting,
      $$AppSettingsTableFilterComposer,
      $$AppSettingsTableOrderingComposer,
      $$AppSettingsTableAnnotationComposer,
      $$AppSettingsTableCreateCompanionBuilder,
      $$AppSettingsTableUpdateCompanionBuilder,
      (
        AppSetting,
        BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>,
      ),
      AppSetting,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UserProfilesTableTableManager get userProfiles =>
      $$UserProfilesTableTableManager(_db, _db.userProfiles);
  $$PlansTableTableManager get plans =>
      $$PlansTableTableManager(_db, _db.plans);
  $$WeightRecordsTableTableManager get weightRecords =>
      $$WeightRecordsTableTableManager(_db, _db.weightRecords);
  $$MealLogsTableTableManager get mealLogs =>
      $$MealLogsTableTableManager(_db, _db.mealLogs);
  $$DailyMetricsTableTableManager get dailyMetrics =>
      $$DailyMetricsTableTableManager(_db, _db.dailyMetrics);
  $$GoalsTableTableManager get goals =>
      $$GoalsTableTableManager(_db, _db.goals);
  $$GoalLogsTableTableManager get goalLogs =>
      $$GoalLogsTableTableManager(_db, _db.goalLogs);
  $$PetStatesTableTableManager get petStates =>
      $$PetStatesTableTableManager(_db, _db.petStates);
  $$WeeklySummariesTableTableManager get weeklySummaries =>
      $$WeeklySummariesTableTableManager(_db, _db.weeklySummaries);
  $$HealthSyncStatesTableTableManager get healthSyncStates =>
      $$HealthSyncStatesTableTableManager(_db, _db.healthSyncStates);
  $$AppSettingsTableTableManager get appSettings =>
      $$AppSettingsTableTableManager(_db, _db.appSettings);
}
