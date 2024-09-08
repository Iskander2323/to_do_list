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
  late final GeneratedColumnWithTypeConverter<Enum, String> difficulty =
      GeneratedColumn<String>('difficulty', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Enum>($TodoItemsTable.$converterdifficulty);
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
      'dead_line', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
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
    } else if (isInserting) {
      context.missing(_deadLineMeta);
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
          .read(DriftSqlType.dateTime, data['${effectivePrefix}dead_line'])!,
      createdTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_time'])!,
    );
  }

  @override
  $TodoItemsTable createAlias(String alias) {
    return $TodoItemsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<Enum, String, String> $converterdifficulty =
      const EnumNameConverter<Enum>(Enum.values);
}

class TodoItem extends DataClass implements Insertable<TodoItem> {
  final int id;
  final String title;
  final String? description;
  final Enum difficulty;
  final bool isCompleted;
  final DateTime deadLine;
  final DateTime createdTime;
  const TodoItem(
      {required this.id,
      required this.title,
      this.description,
      required this.difficulty,
      required this.isCompleted,
      required this.deadLine,
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
    map['dead_line'] = Variable<DateTime>(deadLine);
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
      deadLine: Value(deadLine),
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
      deadLine: serializer.fromJson<DateTime>(json['deadLine']),
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
      'deadLine': serializer.toJson<DateTime>(deadLine),
      'createdTime': serializer.toJson<DateTime>(createdTime),
    };
  }

  TodoItem copyWith(
          {int? id,
          String? title,
          Value<String?> description = const Value.absent(),
          Enum? difficulty,
          bool? isCompleted,
          DateTime? deadLine,
          DateTime? createdTime}) =>
      TodoItem(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description.present ? description.value : this.description,
        difficulty: difficulty ?? this.difficulty,
        isCompleted: isCompleted ?? this.isCompleted,
        deadLine: deadLine ?? this.deadLine,
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
  final Value<Enum> difficulty;
  final Value<bool> isCompleted;
  final Value<DateTime> deadLine;
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
    required Enum difficulty,
    required bool isCompleted,
    required DateTime deadLine,
    required DateTime createdTime,
  })  : title = Value(title),
        difficulty = Value(difficulty),
        isCompleted = Value(isCompleted),
        deadLine = Value(deadLine),
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
      Value<Enum>? difficulty,
      Value<bool>? isCompleted,
      Value<DateTime>? deadLine,
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

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TodoItemsTable todoItems = $TodoItemsTable(this);
  late final $ReminderTimeTable reminderTime = $ReminderTimeTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [todoItems, reminderTime];
}

typedef $$TodoItemsTableCreateCompanionBuilder = TodoItemsCompanion Function({
  Value<int> id,
  required String title,
  Value<String?> description,
  required Enum difficulty,
  required bool isCompleted,
  required DateTime deadLine,
  required DateTime createdTime,
});
typedef $$TodoItemsTableUpdateCompanionBuilder = TodoItemsCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String?> description,
  Value<Enum> difficulty,
  Value<bool> isCompleted,
  Value<DateTime> deadLine,
  Value<DateTime> createdTime,
});

class $$TodoItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TodoItemsTable,
    TodoItem,
    $$TodoItemsTableFilterComposer,
    $$TodoItemsTableOrderingComposer,
    $$TodoItemsTableCreateCompanionBuilder,
    $$TodoItemsTableUpdateCompanionBuilder> {
  $$TodoItemsTableTableManager(_$AppDatabase db, $TodoItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TodoItemsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TodoItemsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<Enum> difficulty = const Value.absent(),
            Value<bool> isCompleted = const Value.absent(),
            Value<DateTime> deadLine = const Value.absent(),
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
            required Enum difficulty,
            required bool isCompleted,
            required DateTime deadLine,
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
        ));
}

class $$TodoItemsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $TodoItemsTable> {
  $$TodoItemsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<Enum, Enum, String> get difficulty =>
      $state.composableBuilder(
          column: $state.table.difficulty,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnFilters<bool> get isCompleted => $state.composableBuilder(
      column: $state.table.isCompleted,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get deadLine => $state.composableBuilder(
      column: $state.table.deadLine,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdTime => $state.composableBuilder(
      column: $state.table.createdTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter reminderTimeRefs(
      ComposableFilter Function($$ReminderTimeTableFilterComposer f) f) {
    final $$ReminderTimeTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.reminderTime,
        getReferencedColumn: (t) => t.toDoItemId,
        builder: (joinBuilder, parentComposers) =>
            $$ReminderTimeTableFilterComposer(ComposerState($state.db,
                $state.db.reminderTime, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$TodoItemsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $TodoItemsTable> {
  $$TodoItemsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get difficulty => $state.composableBuilder(
      column: $state.table.difficulty,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isCompleted => $state.composableBuilder(
      column: $state.table.isCompleted,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get deadLine => $state.composableBuilder(
      column: $state.table.deadLine,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdTime => $state.composableBuilder(
      column: $state.table.createdTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

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

class $$ReminderTimeTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ReminderTimeTable,
    ReminderTimeData,
    $$ReminderTimeTableFilterComposer,
    $$ReminderTimeTableOrderingComposer,
    $$ReminderTimeTableCreateCompanionBuilder,
    $$ReminderTimeTableUpdateCompanionBuilder> {
  $$ReminderTimeTableTableManager(_$AppDatabase db, $ReminderTimeTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ReminderTimeTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ReminderTimeTableOrderingComposer(ComposerState(db, table)),
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
        ));
}

class $$ReminderTimeTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ReminderTimeTable> {
  $$ReminderTimeTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get remindTime => $state.composableBuilder(
      column: $state.table.remindTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$TodoItemsTableFilterComposer get toDoItemId {
    final $$TodoItemsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.toDoItemId,
        referencedTable: $state.db.todoItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$TodoItemsTableFilterComposer(ComposerState(
                $state.db, $state.db.todoItems, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$ReminderTimeTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ReminderTimeTable> {
  $$ReminderTimeTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get remindTime => $state.composableBuilder(
      column: $state.table.remindTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$TodoItemsTableOrderingComposer get toDoItemId {
    final $$TodoItemsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.toDoItemId,
        referencedTable: $state.db.todoItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$TodoItemsTableOrderingComposer(ComposerState(
                $state.db, $state.db.todoItems, joinBuilder, parentComposers)));
    return composer;
  }
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TodoItemsTableTableManager get todoItems =>
      $$TodoItemsTableTableManager(_db, _db.todoItems);
  $$ReminderTimeTableTableManager get reminderTime =>
      $$ReminderTimeTableTableManager(_db, _db.reminderTime);
}
