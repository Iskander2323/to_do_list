// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_db.dart';

// ignore_for_file: type=lint
class $TodoItemsTable extends TodoItems
    with TableInfo<$TodoItemsTable, TodoItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodoItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _difficultyMeta =
      const VerificationMeta('difficulty');
  @override
  late final GeneratedColumnWithTypeConverter<Difficulty, String> difficulty =
      GeneratedColumn<String>('difficulty', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Difficulty>($TodoItemsTable.$converterdifficulty);
  static const VerificationMeta _isCompletedMeta =
      const VerificationMeta('isCompleted');
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
      'is_completed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_completed" IN (0, 1))'));
  static const VerificationMeta _deadLineMeta =
      const VerificationMeta('deadLine');
  @override
  late final GeneratedColumn<DateTime> deadLine = GeneratedColumn<DateTime>(
      'dead_line', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdTimeMeta =
      const VerificationMeta('createdTime');
  @override
  late final GeneratedColumn<DateTime> createdTime = GeneratedColumn<DateTime>(
      'created_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, description, difficulty, isCompleted, deadLine, createdTime];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'todo_items';
  @override
  VerificationContext validateIntegrity(Insertable<TodoItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    context.handle(_difficultyMeta, const VerificationResult.success());
    if (data.containsKey('is_completed')) {
      context.handle(
          _isCompletedMeta,
          isCompleted.isAcceptableOrUnknown(
              data['is_completed']!, _isCompletedMeta));
    } else if (isInserting) {
      context.missing(_isCompletedMeta);
    }
    if (data.containsKey('dead_line')) {
      context.handle(_deadLineMeta,
          deadLine.isAcceptableOrUnknown(data['dead_line']!, _deadLineMeta));
    }
    if (data.containsKey('created_time')) {
      context.handle(
          _createdTimeMeta,
          createdTime.isAcceptableOrUnknown(
              data['created_time']!, _createdTimeMeta));
    } else if (isInserting) {
      context.missing(_createdTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TodoItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TodoItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      difficulty: $TodoItemsTable.$converterdifficulty.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}difficulty'])!),
      isCompleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_completed'])!,
      deadLine: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}dead_line']),
      createdTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_time'])!,
    );
  }

  @override
  $TodoItemsTable createAlias(String alias) {
    return $TodoItemsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<Difficulty, String, String> $converterdifficulty =
      const EnumNameConverter<Difficulty>(Difficulty.values);
}

class TodoItem extends DataClass implements Insertable<TodoItem> {
  final int id;
  final String title;
  final String? description;
  final Difficulty difficulty;
  final bool isCompleted;
  final DateTime? deadLine;
  final DateTime createdTime;
  const TodoItem(
      {required this.id,
      required this.title,
      this.description,
      required this.difficulty,
      required this.isCompleted,
      this.deadLine,
      required this.createdTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    {
      map['difficulty'] = Variable<String>(
          $TodoItemsTable.$converterdifficulty.toSql(difficulty));
    }
    map['is_completed'] = Variable<bool>(isCompleted);
    if (!nullToAbsent || deadLine != null) {
      map['dead_line'] = Variable<DateTime>(deadLine);
    }
    map['created_time'] = Variable<DateTime>(createdTime);
    return map;
  }

  TodoItemsCompanion toCompanion(bool nullToAbsent) {
    return TodoItemsCompanion(
      id: Value(id),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      difficulty: Value(difficulty),
      isCompleted: Value(isCompleted),
      deadLine: deadLine == null && nullToAbsent
          ? const Value.absent()
          : Value(deadLine),
      createdTime: Value(createdTime),
    );
  }

  factory TodoItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TodoItem(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      difficulty: $TodoItemsTable.$converterdifficulty
          .fromJson(serializer.fromJson<String>(json['difficulty'])),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      deadLine: serializer.fromJson<DateTime?>(json['deadLine']),
      createdTime: serializer.fromJson<DateTime>(json['createdTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'difficulty': serializer.toJson<String>(
          $TodoItemsTable.$converterdifficulty.toJson(difficulty)),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'deadLine': serializer.toJson<DateTime?>(deadLine),
      'createdTime': serializer.toJson<DateTime>(createdTime),
    };
  }

  TodoItem copyWith(
          {int? id,
          String? title,
          Value<String?> description = const Value.absent(),
          Difficulty? difficulty,
          bool? isCompleted,
          Value<DateTime?> deadLine = const Value.absent(),
          DateTime? createdTime}) =>
      TodoItem(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description.present ? description.value : this.description,
        difficulty: difficulty ?? this.difficulty,
        isCompleted: isCompleted ?? this.isCompleted,
        deadLine: deadLine.present ? deadLine.value : this.deadLine,
        createdTime: createdTime ?? this.createdTime,
      );
  TodoItem copyWithCompanion(TodoItemsCompanion data) {
    return TodoItem(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      difficulty:
          data.difficulty.present ? data.difficulty.value : this.difficulty,
      isCompleted:
          data.isCompleted.present ? data.isCompleted.value : this.isCompleted,
      deadLine: data.deadLine.present ? data.deadLine.value : this.deadLine,
      createdTime:
          data.createdTime.present ? data.createdTime.value : this.createdTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TodoItem(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('difficulty: $difficulty, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('deadLine: $deadLine, ')
          ..write('createdTime: $createdTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, title, description, difficulty, isCompleted, deadLine, createdTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodoItem &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.difficulty == this.difficulty &&
          other.isCompleted == this.isCompleted &&
          other.deadLine == this.deadLine &&
          other.createdTime == this.createdTime);
}

class TodoItemsCompanion extends UpdateCompanion<TodoItem> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> description;
  final Value<Difficulty> difficulty;
  final Value<bool> isCompleted;
  final Value<DateTime?> deadLine;
  final Value<DateTime> createdTime;
  const TodoItemsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.deadLine = const Value.absent(),
    this.createdTime = const Value.absent(),
  });
  TodoItemsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.description = const Value.absent(),
    required Difficulty difficulty,
    required bool isCompleted,
    this.deadLine = const Value.absent(),
    required DateTime createdTime,
  })  : title = Value(title),
        difficulty = Value(difficulty),
        isCompleted = Value(isCompleted),
        createdTime = Value(createdTime);
  static Insertable<TodoItem> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? difficulty,
    Expression<bool>? isCompleted,
    Expression<DateTime>? deadLine,
    Expression<DateTime>? createdTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (difficulty != null) 'difficulty': difficulty,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (deadLine != null) 'dead_line': deadLine,
      if (createdTime != null) 'created_time': createdTime,
    });
  }

  TodoItemsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String?>? description,
      Value<Difficulty>? difficulty,
      Value<bool>? isCompleted,
      Value<DateTime?>? deadLine,
      Value<DateTime>? createdTime}) {
    return TodoItemsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      difficulty: difficulty ?? this.difficulty,
      isCompleted: isCompleted ?? this.isCompleted,
      deadLine: deadLine ?? this.deadLine,
      createdTime: createdTime ?? this.createdTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (difficulty.present) {
      map['difficulty'] = Variable<String>(
          $TodoItemsTable.$converterdifficulty.toSql(difficulty.value));
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (deadLine.present) {
      map['dead_line'] = Variable<DateTime>(deadLine.value);
    }
    if (createdTime.present) {
      map['created_time'] = Variable<DateTime>(createdTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodoItemsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('difficulty: $difficulty, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('deadLine: $deadLine, ')
          ..write('createdTime: $createdTime')
          ..write(')'))
        .toString();
  }
}

class $ReminderTimeTable extends ReminderTime
    with TableInfo<$ReminderTimeTable, ReminderTimeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReminderTimeTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _toDoItemIdMeta =
      const VerificationMeta('toDoItemId');
  @override
  late final GeneratedColumn<int> toDoItemId = GeneratedColumn<int>(
      'to_do_item_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES todo_items (id)'));
  static const VerificationMeta _remindTimeMeta =
      const VerificationMeta('remindTime');
  @override
  late final GeneratedColumn<DateTime> remindTime = GeneratedColumn<DateTime>(
      'remind_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, toDoItemId, remindTime];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reminder_time';
  @override
  VerificationContext validateIntegrity(Insertable<ReminderTimeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('to_do_item_id')) {
      context.handle(
          _toDoItemIdMeta,
          toDoItemId.isAcceptableOrUnknown(
              data['to_do_item_id']!, _toDoItemIdMeta));
    } else if (isInserting) {
      context.missing(_toDoItemIdMeta);
    }
    if (data.containsKey('remind_time')) {
      context.handle(
          _remindTimeMeta,
          remindTime.isAcceptableOrUnknown(
              data['remind_time']!, _remindTimeMeta));
    } else if (isInserting) {
      context.missing(_remindTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReminderTimeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReminderTimeData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      toDoItemId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}to_do_item_id'])!,
      remindTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}remind_time'])!,
    );
  }

  @override
  $ReminderTimeTable createAlias(String alias) {
    return $ReminderTimeTable(attachedDatabase, alias);
  }
}

class ReminderTimeData extends DataClass
    implements Insertable<ReminderTimeData> {
  final int id;
  final int toDoItemId;
  final DateTime remindTime;
  const ReminderTimeData(
      {required this.id, required this.toDoItemId, required this.remindTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['to_do_item_id'] = Variable<int>(toDoItemId);
    map['remind_time'] = Variable<DateTime>(remindTime);
    return map;
  }

  ReminderTimeCompanion toCompanion(bool nullToAbsent) {
    return ReminderTimeCompanion(
      id: Value(id),
      toDoItemId: Value(toDoItemId),
      remindTime: Value(remindTime),
    );
  }

  factory ReminderTimeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReminderTimeData(
      id: serializer.fromJson<int>(json['id']),
      toDoItemId: serializer.fromJson<int>(json['toDoItemId']),
      remindTime: serializer.fromJson<DateTime>(json['remindTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'toDoItemId': serializer.toJson<int>(toDoItemId),
      'remindTime': serializer.toJson<DateTime>(remindTime),
    };
  }

  ReminderTimeData copyWith({int? id, int? toDoItemId, DateTime? remindTime}) =>
      ReminderTimeData(
        id: id ?? this.id,
        toDoItemId: toDoItemId ?? this.toDoItemId,
        remindTime: remindTime ?? this.remindTime,
      );
  ReminderTimeData copyWithCompanion(ReminderTimeCompanion data) {
    return ReminderTimeData(
      id: data.id.present ? data.id.value : this.id,
      toDoItemId:
          data.toDoItemId.present ? data.toDoItemId.value : this.toDoItemId,
      remindTime:
          data.remindTime.present ? data.remindTime.value : this.remindTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReminderTimeData(')
          ..write('id: $id, ')
          ..write('toDoItemId: $toDoItemId, ')
          ..write('remindTime: $remindTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, toDoItemId, remindTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReminderTimeData &&
          other.id == this.id &&
          other.toDoItemId == this.toDoItemId &&
          other.remindTime == this.remindTime);
}

class ReminderTimeCompanion extends UpdateCompanion<ReminderTimeData> {
  final Value<int> id;
  final Value<int> toDoItemId;
  final Value<DateTime> remindTime;
  const ReminderTimeCompanion({
    this.id = const Value.absent(),
    this.toDoItemId = const Value.absent(),
    this.remindTime = const Value.absent(),
  });
  ReminderTimeCompanion.insert({
    this.id = const Value.absent(),
    required int toDoItemId,
    required DateTime remindTime,
  })  : toDoItemId = Value(toDoItemId),
        remindTime = Value(remindTime);
  static Insertable<ReminderTimeData> custom({
    Expression<int>? id,
    Expression<int>? toDoItemId,
    Expression<DateTime>? remindTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (toDoItemId != null) 'to_do_item_id': toDoItemId,
      if (remindTime != null) 'remind_time': remindTime,
    });
  }

  ReminderTimeCompanion copyWith(
      {Value<int>? id, Value<int>? toDoItemId, Value<DateTime>? remindTime}) {
    return ReminderTimeCompanion(
      id: id ?? this.id,
      toDoItemId: toDoItemId ?? this.toDoItemId,
      remindTime: remindTime ?? this.remindTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (toDoItemId.present) {
      map['to_do_item_id'] = Variable<int>(toDoItemId.value);
    }
    if (remindTime.present) {
      map['remind_time'] = Variable<DateTime>(remindTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReminderTimeCompanion(')
          ..write('id: $id, ')
          ..write('toDoItemId: $toDoItemId, ')
          ..write('remindTime: $remindTime')
          ..write(')'))
        .toString();
  }
}

class $CheckListTable extends CheckList
    with TableInfo<$CheckListTable, CheckListData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CheckListTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _toDoItemIdMeta =
      const VerificationMeta('toDoItemId');
  @override
  late final GeneratedColumn<int> toDoItemId = GeneratedColumn<int>(
      'to_do_item_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES todo_items (id)'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isCompletedMeta =
      const VerificationMeta('isCompleted');
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
      'is_completed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_completed" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [id, toDoItemId, title, isCompleted];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'check_list';
  @override
  VerificationContext validateIntegrity(Insertable<CheckListData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('to_do_item_id')) {
      context.handle(
          _toDoItemIdMeta,
          toDoItemId.isAcceptableOrUnknown(
              data['to_do_item_id']!, _toDoItemIdMeta));
    } else if (isInserting) {
      context.missing(_toDoItemIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('is_completed')) {
      context.handle(
          _isCompletedMeta,
          isCompleted.isAcceptableOrUnknown(
              data['is_completed']!, _isCompletedMeta));
    } else if (isInserting) {
      context.missing(_isCompletedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CheckListData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CheckListData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      toDoItemId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}to_do_item_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      isCompleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_completed'])!,
    );
  }

  @override
  $CheckListTable createAlias(String alias) {
    return $CheckListTable(attachedDatabase, alias);
  }
}

class CheckListData extends DataClass implements Insertable<CheckListData> {
  final int id;
  final int toDoItemId;
  final String title;
  final bool isCompleted;
  const CheckListData(
      {required this.id,
      required this.toDoItemId,
      required this.title,
      required this.isCompleted});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['to_do_item_id'] = Variable<int>(toDoItemId);
    map['title'] = Variable<String>(title);
    map['is_completed'] = Variable<bool>(isCompleted);
    return map;
  }

  CheckListCompanion toCompanion(bool nullToAbsent) {
    return CheckListCompanion(
      id: Value(id),
      toDoItemId: Value(toDoItemId),
      title: Value(title),
      isCompleted: Value(isCompleted),
    );
  }

  factory CheckListData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CheckListData(
      id: serializer.fromJson<int>(json['id']),
      toDoItemId: serializer.fromJson<int>(json['toDoItemId']),
      title: serializer.fromJson<String>(json['title']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'toDoItemId': serializer.toJson<int>(toDoItemId),
      'title': serializer.toJson<String>(title),
      'isCompleted': serializer.toJson<bool>(isCompleted),
    };
  }

  CheckListData copyWith(
          {int? id, int? toDoItemId, String? title, bool? isCompleted}) =>
      CheckListData(
        id: id ?? this.id,
        toDoItemId: toDoItemId ?? this.toDoItemId,
        title: title ?? this.title,
        isCompleted: isCompleted ?? this.isCompleted,
      );
  CheckListData copyWithCompanion(CheckListCompanion data) {
    return CheckListData(
      id: data.id.present ? data.id.value : this.id,
      toDoItemId:
          data.toDoItemId.present ? data.toDoItemId.value : this.toDoItemId,
      title: data.title.present ? data.title.value : this.title,
      isCompleted:
          data.isCompleted.present ? data.isCompleted.value : this.isCompleted,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CheckListData(')
          ..write('id: $id, ')
          ..write('toDoItemId: $toDoItemId, ')
          ..write('title: $title, ')
          ..write('isCompleted: $isCompleted')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, toDoItemId, title, isCompleted);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CheckListData &&
          other.id == this.id &&
          other.toDoItemId == this.toDoItemId &&
          other.title == this.title &&
          other.isCompleted == this.isCompleted);
}

class CheckListCompanion extends UpdateCompanion<CheckListData> {
  final Value<int> id;
  final Value<int> toDoItemId;
  final Value<String> title;
  final Value<bool> isCompleted;
  const CheckListCompanion({
    this.id = const Value.absent(),
    this.toDoItemId = const Value.absent(),
    this.title = const Value.absent(),
    this.isCompleted = const Value.absent(),
  });
  CheckListCompanion.insert({
    this.id = const Value.absent(),
    required int toDoItemId,
    required String title,
    required bool isCompleted,
  })  : toDoItemId = Value(toDoItemId),
        title = Value(title),
        isCompleted = Value(isCompleted);
  static Insertable<CheckListData> custom({
    Expression<int>? id,
    Expression<int>? toDoItemId,
    Expression<String>? title,
    Expression<bool>? isCompleted,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (toDoItemId != null) 'to_do_item_id': toDoItemId,
      if (title != null) 'title': title,
      if (isCompleted != null) 'is_completed': isCompleted,
    });
  }

  CheckListCompanion copyWith(
      {Value<int>? id,
      Value<int>? toDoItemId,
      Value<String>? title,
      Value<bool>? isCompleted}) {
    return CheckListCompanion(
      id: id ?? this.id,
      toDoItemId: toDoItemId ?? this.toDoItemId,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (toDoItemId.present) {
      map['to_do_item_id'] = Variable<int>(toDoItemId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CheckListCompanion(')
          ..write('id: $id, ')
          ..write('toDoItemId: $toDoItemId, ')
          ..write('title: $title, ')
          ..write('isCompleted: $isCompleted')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TodoItemsTable todoItems = $TodoItemsTable(this);
  late final $ReminderTimeTable reminderTime = $ReminderTimeTable(this);
  late final $CheckListTable checkList = $CheckListTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [todoItems, reminderTime, checkList];
}

typedef $$TodoItemsTableCreateCompanionBuilder = TodoItemsCompanion Function({
  Value<int> id,
  required String title,
  Value<String?> description,
  required Difficulty difficulty,
  required bool isCompleted,
  Value<DateTime?> deadLine,
  required DateTime createdTime,
});
typedef $$TodoItemsTableUpdateCompanionBuilder = TodoItemsCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String?> description,
  Value<Difficulty> difficulty,
  Value<bool> isCompleted,
  Value<DateTime?> deadLine,
  Value<DateTime> createdTime,
});

final class $$TodoItemsTableReferences
    extends BaseReferences<_$AppDatabase, $TodoItemsTable, TodoItem> {
  $$TodoItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ReminderTimeTable, List<ReminderTimeData>>
      _reminderTimeRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.reminderTime,
              aliasName: $_aliasNameGenerator(
                  db.todoItems.id, db.reminderTime.toDoItemId));

  $$ReminderTimeTableProcessedTableManager get reminderTimeRefs {
    final manager = $$ReminderTimeTableTableManager($_db, $_db.reminderTime)
        .filter((f) => f.toDoItemId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_reminderTimeRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$CheckListTable, List<CheckListData>>
      _checkListRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.checkList,
          aliasName:
              $_aliasNameGenerator(db.todoItems.id, db.checkList.toDoItemId));

  $$CheckListTableProcessedTableManager get checkListRefs {
    final manager = $$CheckListTableTableManager($_db, $_db.checkList)
        .filter((f) => f.toDoItemId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_checkListRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TodoItemsTableFilterComposer
    extends Composer<_$AppDatabase, $TodoItemsTable> {
  $$TodoItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Difficulty, Difficulty, String>
      get difficulty => $composableBuilder(
          column: $table.difficulty,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deadLine => $composableBuilder(
      column: $table.deadLine, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdTime => $composableBuilder(
      column: $table.createdTime, builder: (column) => ColumnFilters(column));

  Expression<bool> reminderTimeRefs(
      Expression<bool> Function($$ReminderTimeTableFilterComposer f) f) {
    final $$ReminderTimeTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.reminderTime,
        getReferencedColumn: (t) => t.toDoItemId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ReminderTimeTableFilterComposer(
              $db: $db,
              $table: $db.reminderTime,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> checkListRefs(
      Expression<bool> Function($$CheckListTableFilterComposer f) f) {
    final $$CheckListTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.checkList,
        getReferencedColumn: (t) => t.toDoItemId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CheckListTableFilterComposer(
              $db: $db,
              $table: $db.checkList,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TodoItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $TodoItemsTable> {
  $$TodoItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get difficulty => $composableBuilder(
      column: $table.difficulty, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deadLine => $composableBuilder(
      column: $table.deadLine, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdTime => $composableBuilder(
      column: $table.createdTime, builder: (column) => ColumnOrderings(column));
}

class $$TodoItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TodoItemsTable> {
  $$TodoItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Difficulty, String> get difficulty =>
      $composableBuilder(
          column: $table.difficulty, builder: (column) => column);

  GeneratedColumn<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => column);

  GeneratedColumn<DateTime> get deadLine =>
      $composableBuilder(column: $table.deadLine, builder: (column) => column);

  GeneratedColumn<DateTime> get createdTime => $composableBuilder(
      column: $table.createdTime, builder: (column) => column);

  Expression<T> reminderTimeRefs<T extends Object>(
      Expression<T> Function($$ReminderTimeTableAnnotationComposer a) f) {
    final $$ReminderTimeTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.reminderTime,
        getReferencedColumn: (t) => t.toDoItemId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ReminderTimeTableAnnotationComposer(
              $db: $db,
              $table: $db.reminderTime,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> checkListRefs<T extends Object>(
      Expression<T> Function($$CheckListTableAnnotationComposer a) f) {
    final $$CheckListTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.checkList,
        getReferencedColumn: (t) => t.toDoItemId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CheckListTableAnnotationComposer(
              $db: $db,
              $table: $db.checkList,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TodoItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TodoItemsTable,
    TodoItem,
    $$TodoItemsTableFilterComposer,
    $$TodoItemsTableOrderingComposer,
    $$TodoItemsTableAnnotationComposer,
    $$TodoItemsTableCreateCompanionBuilder,
    $$TodoItemsTableUpdateCompanionBuilder,
    (TodoItem, $$TodoItemsTableReferences),
    TodoItem,
    PrefetchHooks Function({bool reminderTimeRefs, bool checkListRefs})> {
  $$TodoItemsTableTableManager(_$AppDatabase db, $TodoItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TodoItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TodoItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TodoItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<Difficulty> difficulty = const Value.absent(),
            Value<bool> isCompleted = const Value.absent(),
            Value<DateTime?> deadLine = const Value.absent(),
            Value<DateTime> createdTime = const Value.absent(),
          }) =>
              TodoItemsCompanion(
            id: id,
            title: title,
            description: description,
            difficulty: difficulty,
            isCompleted: isCompleted,
            deadLine: deadLine,
            createdTime: createdTime,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            Value<String?> description = const Value.absent(),
            required Difficulty difficulty,
            required bool isCompleted,
            Value<DateTime?> deadLine = const Value.absent(),
            required DateTime createdTime,
          }) =>
              TodoItemsCompanion.insert(
            id: id,
            title: title,
            description: description,
            difficulty: difficulty,
            isCompleted: isCompleted,
            deadLine: deadLine,
            createdTime: createdTime,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TodoItemsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {reminderTimeRefs = false, checkListRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (reminderTimeRefs) db.reminderTime,
                if (checkListRefs) db.checkList
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (reminderTimeRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$TodoItemsTableReferences
                            ._reminderTimeRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TodoItemsTableReferences(db, table, p0)
                                .reminderTimeRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.toDoItemId == item.id),
                        typedResults: items),
                  if (checkListRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$TodoItemsTableReferences._checkListRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TodoItemsTableReferences(db, table, p0)
                                .checkListRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.toDoItemId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TodoItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TodoItemsTable,
    TodoItem,
    $$TodoItemsTableFilterComposer,
    $$TodoItemsTableOrderingComposer,
    $$TodoItemsTableAnnotationComposer,
    $$TodoItemsTableCreateCompanionBuilder,
    $$TodoItemsTableUpdateCompanionBuilder,
    (TodoItem, $$TodoItemsTableReferences),
    TodoItem,
    PrefetchHooks Function({bool reminderTimeRefs, bool checkListRefs})>;
typedef $$ReminderTimeTableCreateCompanionBuilder = ReminderTimeCompanion
    Function({
  Value<int> id,
  required int toDoItemId,
  required DateTime remindTime,
});
typedef $$ReminderTimeTableUpdateCompanionBuilder = ReminderTimeCompanion
    Function({
  Value<int> id,
  Value<int> toDoItemId,
  Value<DateTime> remindTime,
});

final class $$ReminderTimeTableReferences extends BaseReferences<_$AppDatabase,
    $ReminderTimeTable, ReminderTimeData> {
  $$ReminderTimeTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TodoItemsTable _toDoItemIdTable(_$AppDatabase db) =>
      db.todoItems.createAlias(
          $_aliasNameGenerator(db.reminderTime.toDoItemId, db.todoItems.id));

  $$TodoItemsTableProcessedTableManager get toDoItemId {
    final manager = $$TodoItemsTableTableManager($_db, $_db.todoItems)
        .filter((f) => f.id($_item.toDoItemId!));
    final item = $_typedResult.readTableOrNull(_toDoItemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ReminderTimeTableFilterComposer
    extends Composer<_$AppDatabase, $ReminderTimeTable> {
  $$ReminderTimeTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get remindTime => $composableBuilder(
      column: $table.remindTime, builder: (column) => ColumnFilters(column));

  $$TodoItemsTableFilterComposer get toDoItemId {
    final $$TodoItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.toDoItemId,
        referencedTable: $db.todoItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TodoItemsTableFilterComposer(
              $db: $db,
              $table: $db.todoItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ReminderTimeTableOrderingComposer
    extends Composer<_$AppDatabase, $ReminderTimeTable> {
  $$ReminderTimeTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get remindTime => $composableBuilder(
      column: $table.remindTime, builder: (column) => ColumnOrderings(column));

  $$TodoItemsTableOrderingComposer get toDoItemId {
    final $$TodoItemsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.toDoItemId,
        referencedTable: $db.todoItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TodoItemsTableOrderingComposer(
              $db: $db,
              $table: $db.todoItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ReminderTimeTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReminderTimeTable> {
  $$ReminderTimeTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get remindTime => $composableBuilder(
      column: $table.remindTime, builder: (column) => column);

  $$TodoItemsTableAnnotationComposer get toDoItemId {
    final $$TodoItemsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.toDoItemId,
        referencedTable: $db.todoItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TodoItemsTableAnnotationComposer(
              $db: $db,
              $table: $db.todoItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ReminderTimeTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ReminderTimeTable,
    ReminderTimeData,
    $$ReminderTimeTableFilterComposer,
    $$ReminderTimeTableOrderingComposer,
    $$ReminderTimeTableAnnotationComposer,
    $$ReminderTimeTableCreateCompanionBuilder,
    $$ReminderTimeTableUpdateCompanionBuilder,
    (ReminderTimeData, $$ReminderTimeTableReferences),
    ReminderTimeData,
    PrefetchHooks Function({bool toDoItemId})> {
  $$ReminderTimeTableTableManager(_$AppDatabase db, $ReminderTimeTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReminderTimeTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReminderTimeTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReminderTimeTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> toDoItemId = const Value.absent(),
            Value<DateTime> remindTime = const Value.absent(),
          }) =>
              ReminderTimeCompanion(
            id: id,
            toDoItemId: toDoItemId,
            remindTime: remindTime,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int toDoItemId,
            required DateTime remindTime,
          }) =>
              ReminderTimeCompanion.insert(
            id: id,
            toDoItemId: toDoItemId,
            remindTime: remindTime,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ReminderTimeTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({toDoItemId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
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
                      dynamic>>(state) {
                if (toDoItemId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.toDoItemId,
                    referencedTable:
                        $$ReminderTimeTableReferences._toDoItemIdTable(db),
                    referencedColumn:
                        $$ReminderTimeTableReferences._toDoItemIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ReminderTimeTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ReminderTimeTable,
    ReminderTimeData,
    $$ReminderTimeTableFilterComposer,
    $$ReminderTimeTableOrderingComposer,
    $$ReminderTimeTableAnnotationComposer,
    $$ReminderTimeTableCreateCompanionBuilder,
    $$ReminderTimeTableUpdateCompanionBuilder,
    (ReminderTimeData, $$ReminderTimeTableReferences),
    ReminderTimeData,
    PrefetchHooks Function({bool toDoItemId})>;
typedef $$CheckListTableCreateCompanionBuilder = CheckListCompanion Function({
  Value<int> id,
  required int toDoItemId,
  required String title,
  required bool isCompleted,
});
typedef $$CheckListTableUpdateCompanionBuilder = CheckListCompanion Function({
  Value<int> id,
  Value<int> toDoItemId,
  Value<String> title,
  Value<bool> isCompleted,
});

final class $$CheckListTableReferences
    extends BaseReferences<_$AppDatabase, $CheckListTable, CheckListData> {
  $$CheckListTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TodoItemsTable _toDoItemIdTable(_$AppDatabase db) =>
      db.todoItems.createAlias(
          $_aliasNameGenerator(db.checkList.toDoItemId, db.todoItems.id));

  $$TodoItemsTableProcessedTableManager get toDoItemId {
    final manager = $$TodoItemsTableTableManager($_db, $_db.todoItems)
        .filter((f) => f.id($_item.toDoItemId!));
    final item = $_typedResult.readTableOrNull(_toDoItemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$CheckListTableFilterComposer
    extends Composer<_$AppDatabase, $CheckListTable> {
  $$CheckListTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => ColumnFilters(column));

  $$TodoItemsTableFilterComposer get toDoItemId {
    final $$TodoItemsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.toDoItemId,
        referencedTable: $db.todoItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TodoItemsTableFilterComposer(
              $db: $db,
              $table: $db.todoItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CheckListTableOrderingComposer
    extends Composer<_$AppDatabase, $CheckListTable> {
  $$CheckListTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => ColumnOrderings(column));

  $$TodoItemsTableOrderingComposer get toDoItemId {
    final $$TodoItemsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.toDoItemId,
        referencedTable: $db.todoItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TodoItemsTableOrderingComposer(
              $db: $db,
              $table: $db.todoItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CheckListTableAnnotationComposer
    extends Composer<_$AppDatabase, $CheckListTable> {
  $$CheckListTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<bool> get isCompleted => $composableBuilder(
      column: $table.isCompleted, builder: (column) => column);

  $$TodoItemsTableAnnotationComposer get toDoItemId {
    final $$TodoItemsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.toDoItemId,
        referencedTable: $db.todoItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TodoItemsTableAnnotationComposer(
              $db: $db,
              $table: $db.todoItems,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CheckListTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CheckListTable,
    CheckListData,
    $$CheckListTableFilterComposer,
    $$CheckListTableOrderingComposer,
    $$CheckListTableAnnotationComposer,
    $$CheckListTableCreateCompanionBuilder,
    $$CheckListTableUpdateCompanionBuilder,
    (CheckListData, $$CheckListTableReferences),
    CheckListData,
    PrefetchHooks Function({bool toDoItemId})> {
  $$CheckListTableTableManager(_$AppDatabase db, $CheckListTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CheckListTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CheckListTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CheckListTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> toDoItemId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<bool> isCompleted = const Value.absent(),
          }) =>
              CheckListCompanion(
            id: id,
            toDoItemId: toDoItemId,
            title: title,
            isCompleted: isCompleted,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int toDoItemId,
            required String title,
            required bool isCompleted,
          }) =>
              CheckListCompanion.insert(
            id: id,
            toDoItemId: toDoItemId,
            title: title,
            isCompleted: isCompleted,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CheckListTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({toDoItemId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
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
                      dynamic>>(state) {
                if (toDoItemId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.toDoItemId,
                    referencedTable:
                        $$CheckListTableReferences._toDoItemIdTable(db),
                    referencedColumn:
                        $$CheckListTableReferences._toDoItemIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$CheckListTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CheckListTable,
    CheckListData,
    $$CheckListTableFilterComposer,
    $$CheckListTableOrderingComposer,
    $$CheckListTableAnnotationComposer,
    $$CheckListTableCreateCompanionBuilder,
    $$CheckListTableUpdateCompanionBuilder,
    (CheckListData, $$CheckListTableReferences),
    CheckListData,
    PrefetchHooks Function({bool toDoItemId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TodoItemsTableTableManager get todoItems =>
      $$TodoItemsTableTableManager(_db, _db.todoItems);
  $$ReminderTimeTableTableManager get reminderTime =>
      $$ReminderTimeTableTableManager(_db, _db.reminderTime);
  $$CheckListTableTableManager get checkList =>
      $$CheckListTableTableManager(_db, _db.checkList);
}
