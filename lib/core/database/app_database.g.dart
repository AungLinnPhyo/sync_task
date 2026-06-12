// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $WorkspaceTableTable extends WorkspaceTable
    with TableInfo<$WorkspaceTableTable, WorkspaceTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkspaceTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  List<GeneratedColumn> get $columns => [id, name, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workspace_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<WorkspaceTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
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
  WorkspaceTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkspaceTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $WorkspaceTableTable createAlias(String alias) {
    return $WorkspaceTableTable(attachedDatabase, alias);
  }
}

class WorkspaceTableData extends DataClass
    implements Insertable<WorkspaceTableData> {
  final String id;
  final String name;
  final DateTime createdAt;
  const WorkspaceTableData({
    required this.id,
    required this.name,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  WorkspaceTableCompanion toCompanion(bool nullToAbsent) {
    return WorkspaceTableCompanion(
      id: Value(id),
      name: Value(name),
      createdAt: Value(createdAt),
    );
  }

  factory WorkspaceTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkspaceTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  WorkspaceTableData copyWith({
    String? id,
    String? name,
    DateTime? createdAt,
  }) => WorkspaceTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    createdAt: createdAt ?? this.createdAt,
  );
  WorkspaceTableData copyWithCompanion(WorkspaceTableCompanion data) {
    return WorkspaceTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkspaceTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkspaceTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.createdAt == this.createdAt);
}

class WorkspaceTableCompanion extends UpdateCompanion<WorkspaceTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const WorkspaceTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WorkspaceTableCompanion.insert({
    required String id,
    required String name,
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
  static Insertable<WorkspaceTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WorkspaceTableCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return WorkspaceTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkspaceTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProjectTableTable extends ProjectTable
    with TableInfo<$ProjectTableTable, ProjectTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProjectTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  static const VerificationMeta _workspaceIdMeta = const VerificationMeta(
    'workspaceId',
  );
  @override
  late final GeneratedColumn<String> workspaceId = GeneratedColumn<String>(
    'workspace_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  List<GeneratedColumn> get $columns => [id, name, workspaceId, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'project_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProjectTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('workspace_id')) {
      context.handle(
        _workspaceIdMeta,
        workspaceId.isAcceptableOrUnknown(
          data['workspace_id']!,
          _workspaceIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_workspaceIdMeta);
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
  ProjectTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProjectTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      workspaceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}workspace_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ProjectTableTable createAlias(String alias) {
    return $ProjectTableTable(attachedDatabase, alias);
  }
}

class ProjectTableData extends DataClass
    implements Insertable<ProjectTableData> {
  final String id;
  final String name;
  final String workspaceId;
  final DateTime createdAt;
  const ProjectTableData({
    required this.id,
    required this.name,
    required this.workspaceId,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['workspace_id'] = Variable<String>(workspaceId);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ProjectTableCompanion toCompanion(bool nullToAbsent) {
    return ProjectTableCompanion(
      id: Value(id),
      name: Value(name),
      workspaceId: Value(workspaceId),
      createdAt: Value(createdAt),
    );
  }

  factory ProjectTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProjectTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      workspaceId: serializer.fromJson<String>(json['workspaceId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'workspaceId': serializer.toJson<String>(workspaceId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ProjectTableData copyWith({
    String? id,
    String? name,
    String? workspaceId,
    DateTime? createdAt,
  }) => ProjectTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    workspaceId: workspaceId ?? this.workspaceId,
    createdAt: createdAt ?? this.createdAt,
  );
  ProjectTableData copyWithCompanion(ProjectTableCompanion data) {
    return ProjectTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      workspaceId: data.workspaceId.present
          ? data.workspaceId.value
          : this.workspaceId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProjectTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('workspaceId: $workspaceId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, workspaceId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProjectTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.workspaceId == this.workspaceId &&
          other.createdAt == this.createdAt);
}

class ProjectTableCompanion extends UpdateCompanion<ProjectTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> workspaceId;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const ProjectTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.workspaceId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProjectTableCompanion.insert({
    required String id,
    required String name,
    required String workspaceId,
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       workspaceId = Value(workspaceId);
  static Insertable<ProjectTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? workspaceId,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (workspaceId != null) 'workspace_id': workspaceId,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProjectTableCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? workspaceId,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return ProjectTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      workspaceId: workspaceId ?? this.workspaceId,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (workspaceId.present) {
      map['workspace_id'] = Variable<String>(workspaceId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('workspaceId: $workspaceId, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TaskTableTable extends TaskTable
    with TableInfo<$TaskTableTable, TaskTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
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
  static const VerificationMeta _projectIdMeta = const VerificationMeta(
    'projectId',
  );
  @override
  late final GeneratedColumn<String> projectId = GeneratedColumn<String>(
    'project_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  List<GeneratedColumn> get $columns => [id, title, projectId, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'task_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<TaskTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('project_id')) {
      context.handle(
        _projectIdMeta,
        projectId.isAcceptableOrUnknown(data['project_id']!, _projectIdMeta),
      );
    } else if (isInserting) {
      context.missing(_projectIdMeta);
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
  TaskTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      projectId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}project_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $TaskTableTable createAlias(String alias) {
    return $TaskTableTable(attachedDatabase, alias);
  }
}

class TaskTableData extends DataClass implements Insertable<TaskTableData> {
  final String id;
  final String title;
  final String projectId;
  final DateTime createdAt;
  const TaskTableData({
    required this.id,
    required this.title,
    required this.projectId,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['project_id'] = Variable<String>(projectId);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TaskTableCompanion toCompanion(bool nullToAbsent) {
    return TaskTableCompanion(
      id: Value(id),
      title: Value(title),
      projectId: Value(projectId),
      createdAt: Value(createdAt),
    );
  }

  factory TaskTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskTableData(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      projectId: serializer.fromJson<String>(json['projectId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'projectId': serializer.toJson<String>(projectId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  TaskTableData copyWith({
    String? id,
    String? title,
    String? projectId,
    DateTime? createdAt,
  }) => TaskTableData(
    id: id ?? this.id,
    title: title ?? this.title,
    projectId: projectId ?? this.projectId,
    createdAt: createdAt ?? this.createdAt,
  );
  TaskTableData copyWithCompanion(TaskTableCompanion data) {
    return TaskTableData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      projectId: data.projectId.present ? data.projectId.value : this.projectId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaskTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('projectId: $projectId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, projectId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.projectId == this.projectId &&
          other.createdAt == this.createdAt);
}

class TaskTableCompanion extends UpdateCompanion<TaskTableData> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> projectId;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const TaskTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.projectId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TaskTableCompanion.insert({
    required String id,
    required String title,
    required String projectId,
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       projectId = Value(projectId);
  static Insertable<TaskTableData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? projectId,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (projectId != null) 'project_id': projectId,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TaskTableCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String>? projectId,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return TaskTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      projectId: projectId ?? this.projectId,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (projectId.present) {
      map['project_id'] = Variable<String>(projectId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('projectId: $projectId, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CommentTableTable extends CommentTable
    with TableInfo<$CommentTableTable, CommentTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CommentTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _textContentMeta = const VerificationMeta(
    'textContent',
  );
  @override
  late final GeneratedColumn<String> textContent = GeneratedColumn<String>(
    'text_content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _taskIdMeta = const VerificationMeta('taskId');
  @override
  late final GeneratedColumn<String> taskId = GeneratedColumn<String>(
    'task_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  List<GeneratedColumn> get $columns => [id, textContent, taskId, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'comment_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<CommentTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('text_content')) {
      context.handle(
        _textContentMeta,
        textContent.isAcceptableOrUnknown(
          data['text_content']!,
          _textContentMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_textContentMeta);
    }
    if (data.containsKey('task_id')) {
      context.handle(
        _taskIdMeta,
        taskId.isAcceptableOrUnknown(data['task_id']!, _taskIdMeta),
      );
    } else if (isInserting) {
      context.missing(_taskIdMeta);
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
  CommentTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CommentTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      textContent: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}text_content'],
      )!,
      taskId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}task_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $CommentTableTable createAlias(String alias) {
    return $CommentTableTable(attachedDatabase, alias);
  }
}

class CommentTableData extends DataClass
    implements Insertable<CommentTableData> {
  final String id;
  final String textContent;
  final String taskId;
  final DateTime createdAt;
  const CommentTableData({
    required this.id,
    required this.textContent,
    required this.taskId,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['text_content'] = Variable<String>(textContent);
    map['task_id'] = Variable<String>(taskId);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  CommentTableCompanion toCompanion(bool nullToAbsent) {
    return CommentTableCompanion(
      id: Value(id),
      textContent: Value(textContent),
      taskId: Value(taskId),
      createdAt: Value(createdAt),
    );
  }

  factory CommentTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CommentTableData(
      id: serializer.fromJson<String>(json['id']),
      textContent: serializer.fromJson<String>(json['textContent']),
      taskId: serializer.fromJson<String>(json['taskId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'textContent': serializer.toJson<String>(textContent),
      'taskId': serializer.toJson<String>(taskId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  CommentTableData copyWith({
    String? id,
    String? textContent,
    String? taskId,
    DateTime? createdAt,
  }) => CommentTableData(
    id: id ?? this.id,
    textContent: textContent ?? this.textContent,
    taskId: taskId ?? this.taskId,
    createdAt: createdAt ?? this.createdAt,
  );
  CommentTableData copyWithCompanion(CommentTableCompanion data) {
    return CommentTableData(
      id: data.id.present ? data.id.value : this.id,
      textContent: data.textContent.present
          ? data.textContent.value
          : this.textContent,
      taskId: data.taskId.present ? data.taskId.value : this.taskId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CommentTableData(')
          ..write('id: $id, ')
          ..write('textContent: $textContent, ')
          ..write('taskId: $taskId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, textContent, taskId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CommentTableData &&
          other.id == this.id &&
          other.textContent == this.textContent &&
          other.taskId == this.taskId &&
          other.createdAt == this.createdAt);
}

class CommentTableCompanion extends UpdateCompanion<CommentTableData> {
  final Value<String> id;
  final Value<String> textContent;
  final Value<String> taskId;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const CommentTableCompanion({
    this.id = const Value.absent(),
    this.textContent = const Value.absent(),
    this.taskId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CommentTableCompanion.insert({
    required String id,
    required String textContent,
    required String taskId,
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       textContent = Value(textContent),
       taskId = Value(taskId);
  static Insertable<CommentTableData> custom({
    Expression<String>? id,
    Expression<String>? textContent,
    Expression<String>? taskId,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (textContent != null) 'text_content': textContent,
      if (taskId != null) 'task_id': taskId,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CommentTableCompanion copyWith({
    Value<String>? id,
    Value<String>? textContent,
    Value<String>? taskId,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return CommentTableCompanion(
      id: id ?? this.id,
      textContent: textContent ?? this.textContent,
      taskId: taskId ?? this.taskId,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (textContent.present) {
      map['text_content'] = Variable<String>(textContent.value);
    }
    if (taskId.present) {
      map['task_id'] = Variable<String>(taskId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CommentTableCompanion(')
          ..write('id: $id, ')
          ..write('textContent: $textContent, ')
          ..write('taskId: $taskId, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ReferenceTableTable extends ReferenceTable
    with TableInfo<$ReferenceTableTable, ReferenceTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReferenceTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _clientIdMeta = const VerificationMeta(
    'clientId',
  );
  @override
  late final GeneratedColumn<String> clientId = GeneratedColumn<String>(
    'client_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _serverIdMeta = const VerificationMeta(
    'serverId',
  );
  @override
  late final GeneratedColumn<String> serverId = GeneratedColumn<String>(
    'server_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [clientId, serverId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reference_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReferenceTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('client_id')) {
      context.handle(
        _clientIdMeta,
        clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta),
      );
    } else if (isInserting) {
      context.missing(_clientIdMeta);
    }
    if (data.containsKey('server_id')) {
      context.handle(
        _serverIdMeta,
        serverId.isAcceptableOrUnknown(data['server_id']!, _serverIdMeta),
      );
    } else if (isInserting) {
      context.missing(_serverIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {clientId};
  @override
  ReferenceTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReferenceTableData(
      clientId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_id'],
      )!,
      serverId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}server_id'],
      )!,
    );
  }

  @override
  $ReferenceTableTable createAlias(String alias) {
    return $ReferenceTableTable(attachedDatabase, alias);
  }
}

class ReferenceTableData extends DataClass
    implements Insertable<ReferenceTableData> {
  final String clientId;
  final String serverId;
  const ReferenceTableData({required this.clientId, required this.serverId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['client_id'] = Variable<String>(clientId);
    map['server_id'] = Variable<String>(serverId);
    return map;
  }

  ReferenceTableCompanion toCompanion(bool nullToAbsent) {
    return ReferenceTableCompanion(
      clientId: Value(clientId),
      serverId: Value(serverId),
    );
  }

  factory ReferenceTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReferenceTableData(
      clientId: serializer.fromJson<String>(json['clientId']),
      serverId: serializer.fromJson<String>(json['serverId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'clientId': serializer.toJson<String>(clientId),
      'serverId': serializer.toJson<String>(serverId),
    };
  }

  ReferenceTableData copyWith({String? clientId, String? serverId}) =>
      ReferenceTableData(
        clientId: clientId ?? this.clientId,
        serverId: serverId ?? this.serverId,
      );
  ReferenceTableData copyWithCompanion(ReferenceTableCompanion data) {
    return ReferenceTableData(
      clientId: data.clientId.present ? data.clientId.value : this.clientId,
      serverId: data.serverId.present ? data.serverId.value : this.serverId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReferenceTableData(')
          ..write('clientId: $clientId, ')
          ..write('serverId: $serverId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(clientId, serverId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReferenceTableData &&
          other.clientId == this.clientId &&
          other.serverId == this.serverId);
}

class ReferenceTableCompanion extends UpdateCompanion<ReferenceTableData> {
  final Value<String> clientId;
  final Value<String> serverId;
  final Value<int> rowid;
  const ReferenceTableCompanion({
    this.clientId = const Value.absent(),
    this.serverId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ReferenceTableCompanion.insert({
    required String clientId,
    required String serverId,
    this.rowid = const Value.absent(),
  }) : clientId = Value(clientId),
       serverId = Value(serverId);
  static Insertable<ReferenceTableData> custom({
    Expression<String>? clientId,
    Expression<String>? serverId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (clientId != null) 'client_id': clientId,
      if (serverId != null) 'server_id': serverId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ReferenceTableCompanion copyWith({
    Value<String>? clientId,
    Value<String>? serverId,
    Value<int>? rowid,
  }) {
    return ReferenceTableCompanion(
      clientId: clientId ?? this.clientId,
      serverId: serverId ?? this.serverId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (clientId.present) {
      map['client_id'] = Variable<String>(clientId.value);
    }
    if (serverId.present) {
      map['server_id'] = Variable<String>(serverId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReferenceTableCompanion(')
          ..write('clientId: $clientId, ')
          ..write('serverId: $serverId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $WorkspaceTableTable workspaceTable = $WorkspaceTableTable(this);
  late final $ProjectTableTable projectTable = $ProjectTableTable(this);
  late final $TaskTableTable taskTable = $TaskTableTable(this);
  late final $CommentTableTable commentTable = $CommentTableTable(this);
  late final $ReferenceTableTable referenceTable = $ReferenceTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    workspaceTable,
    projectTable,
    taskTable,
    commentTable,
    referenceTable,
  ];
}

typedef $$WorkspaceTableTableCreateCompanionBuilder =
    WorkspaceTableCompanion Function({
      required String id,
      required String name,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$WorkspaceTableTableUpdateCompanionBuilder =
    WorkspaceTableCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$WorkspaceTableTableFilterComposer
    extends Composer<_$AppDatabase, $WorkspaceTableTable> {
  $$WorkspaceTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WorkspaceTableTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkspaceTableTable> {
  $$WorkspaceTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WorkspaceTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkspaceTableTable> {
  $$WorkspaceTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$WorkspaceTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WorkspaceTableTable,
          WorkspaceTableData,
          $$WorkspaceTableTableFilterComposer,
          $$WorkspaceTableTableOrderingComposer,
          $$WorkspaceTableTableAnnotationComposer,
          $$WorkspaceTableTableCreateCompanionBuilder,
          $$WorkspaceTableTableUpdateCompanionBuilder,
          (
            WorkspaceTableData,
            BaseReferences<
              _$AppDatabase,
              $WorkspaceTableTable,
              WorkspaceTableData
            >,
          ),
          WorkspaceTableData,
          PrefetchHooks Function()
        > {
  $$WorkspaceTableTableTableManager(
    _$AppDatabase db,
    $WorkspaceTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkspaceTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkspaceTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkspaceTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkspaceTableCompanion(
                id: id,
                name: name,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WorkspaceTableCompanion.insert(
                id: id,
                name: name,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WorkspaceTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WorkspaceTableTable,
      WorkspaceTableData,
      $$WorkspaceTableTableFilterComposer,
      $$WorkspaceTableTableOrderingComposer,
      $$WorkspaceTableTableAnnotationComposer,
      $$WorkspaceTableTableCreateCompanionBuilder,
      $$WorkspaceTableTableUpdateCompanionBuilder,
      (
        WorkspaceTableData,
        BaseReferences<_$AppDatabase, $WorkspaceTableTable, WorkspaceTableData>,
      ),
      WorkspaceTableData,
      PrefetchHooks Function()
    >;
typedef $$ProjectTableTableCreateCompanionBuilder =
    ProjectTableCompanion Function({
      required String id,
      required String name,
      required String workspaceId,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$ProjectTableTableUpdateCompanionBuilder =
    ProjectTableCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> workspaceId,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$ProjectTableTableFilterComposer
    extends Composer<_$AppDatabase, $ProjectTableTable> {
  $$ProjectTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get workspaceId => $composableBuilder(
    column: $table.workspaceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProjectTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ProjectTableTable> {
  $$ProjectTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get workspaceId => $composableBuilder(
    column: $table.workspaceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProjectTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProjectTableTable> {
  $$ProjectTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get workspaceId => $composableBuilder(
    column: $table.workspaceId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ProjectTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProjectTableTable,
          ProjectTableData,
          $$ProjectTableTableFilterComposer,
          $$ProjectTableTableOrderingComposer,
          $$ProjectTableTableAnnotationComposer,
          $$ProjectTableTableCreateCompanionBuilder,
          $$ProjectTableTableUpdateCompanionBuilder,
          (
            ProjectTableData,
            BaseReferences<_$AppDatabase, $ProjectTableTable, ProjectTableData>,
          ),
          ProjectTableData,
          PrefetchHooks Function()
        > {
  $$ProjectTableTableTableManager(_$AppDatabase db, $ProjectTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProjectTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProjectTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProjectTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> workspaceId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProjectTableCompanion(
                id: id,
                name: name,
                workspaceId: workspaceId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String workspaceId,
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProjectTableCompanion.insert(
                id: id,
                name: name,
                workspaceId: workspaceId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProjectTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProjectTableTable,
      ProjectTableData,
      $$ProjectTableTableFilterComposer,
      $$ProjectTableTableOrderingComposer,
      $$ProjectTableTableAnnotationComposer,
      $$ProjectTableTableCreateCompanionBuilder,
      $$ProjectTableTableUpdateCompanionBuilder,
      (
        ProjectTableData,
        BaseReferences<_$AppDatabase, $ProjectTableTable, ProjectTableData>,
      ),
      ProjectTableData,
      PrefetchHooks Function()
    >;
typedef $$TaskTableTableCreateCompanionBuilder =
    TaskTableCompanion Function({
      required String id,
      required String title,
      required String projectId,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$TaskTableTableUpdateCompanionBuilder =
    TaskTableCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String> projectId,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$TaskTableTableFilterComposer
    extends Composer<_$AppDatabase, $TaskTableTable> {
  $$TaskTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get projectId => $composableBuilder(
    column: $table.projectId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TaskTableTableOrderingComposer
    extends Composer<_$AppDatabase, $TaskTableTable> {
  $$TaskTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get projectId => $composableBuilder(
    column: $table.projectId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TaskTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TaskTableTable> {
  $$TaskTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get projectId =>
      $composableBuilder(column: $table.projectId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$TaskTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TaskTableTable,
          TaskTableData,
          $$TaskTableTableFilterComposer,
          $$TaskTableTableOrderingComposer,
          $$TaskTableTableAnnotationComposer,
          $$TaskTableTableCreateCompanionBuilder,
          $$TaskTableTableUpdateCompanionBuilder,
          (
            TaskTableData,
            BaseReferences<_$AppDatabase, $TaskTableTable, TaskTableData>,
          ),
          TaskTableData,
          PrefetchHooks Function()
        > {
  $$TaskTableTableTableManager(_$AppDatabase db, $TaskTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TaskTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TaskTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TaskTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> projectId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TaskTableCompanion(
                id: id,
                title: title,
                projectId: projectId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                required String projectId,
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TaskTableCompanion.insert(
                id: id,
                title: title,
                projectId: projectId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TaskTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TaskTableTable,
      TaskTableData,
      $$TaskTableTableFilterComposer,
      $$TaskTableTableOrderingComposer,
      $$TaskTableTableAnnotationComposer,
      $$TaskTableTableCreateCompanionBuilder,
      $$TaskTableTableUpdateCompanionBuilder,
      (
        TaskTableData,
        BaseReferences<_$AppDatabase, $TaskTableTable, TaskTableData>,
      ),
      TaskTableData,
      PrefetchHooks Function()
    >;
typedef $$CommentTableTableCreateCompanionBuilder =
    CommentTableCompanion Function({
      required String id,
      required String textContent,
      required String taskId,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$CommentTableTableUpdateCompanionBuilder =
    CommentTableCompanion Function({
      Value<String> id,
      Value<String> textContent,
      Value<String> taskId,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$CommentTableTableFilterComposer
    extends Composer<_$AppDatabase, $CommentTableTable> {
  $$CommentTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get textContent => $composableBuilder(
    column: $table.textContent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get taskId => $composableBuilder(
    column: $table.taskId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CommentTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CommentTableTable> {
  $$CommentTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get textContent => $composableBuilder(
    column: $table.textContent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get taskId => $composableBuilder(
    column: $table.taskId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CommentTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CommentTableTable> {
  $$CommentTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get textContent => $composableBuilder(
    column: $table.textContent,
    builder: (column) => column,
  );

  GeneratedColumn<String> get taskId =>
      $composableBuilder(column: $table.taskId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$CommentTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CommentTableTable,
          CommentTableData,
          $$CommentTableTableFilterComposer,
          $$CommentTableTableOrderingComposer,
          $$CommentTableTableAnnotationComposer,
          $$CommentTableTableCreateCompanionBuilder,
          $$CommentTableTableUpdateCompanionBuilder,
          (
            CommentTableData,
            BaseReferences<_$AppDatabase, $CommentTableTable, CommentTableData>,
          ),
          CommentTableData,
          PrefetchHooks Function()
        > {
  $$CommentTableTableTableManager(_$AppDatabase db, $CommentTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CommentTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CommentTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CommentTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> textContent = const Value.absent(),
                Value<String> taskId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CommentTableCompanion(
                id: id,
                textContent: textContent,
                taskId: taskId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String textContent,
                required String taskId,
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CommentTableCompanion.insert(
                id: id,
                textContent: textContent,
                taskId: taskId,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CommentTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CommentTableTable,
      CommentTableData,
      $$CommentTableTableFilterComposer,
      $$CommentTableTableOrderingComposer,
      $$CommentTableTableAnnotationComposer,
      $$CommentTableTableCreateCompanionBuilder,
      $$CommentTableTableUpdateCompanionBuilder,
      (
        CommentTableData,
        BaseReferences<_$AppDatabase, $CommentTableTable, CommentTableData>,
      ),
      CommentTableData,
      PrefetchHooks Function()
    >;
typedef $$ReferenceTableTableCreateCompanionBuilder =
    ReferenceTableCompanion Function({
      required String clientId,
      required String serverId,
      Value<int> rowid,
    });
typedef $$ReferenceTableTableUpdateCompanionBuilder =
    ReferenceTableCompanion Function({
      Value<String> clientId,
      Value<String> serverId,
      Value<int> rowid,
    });

class $$ReferenceTableTableFilterComposer
    extends Composer<_$AppDatabase, $ReferenceTableTable> {
  $$ReferenceTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get clientId => $composableBuilder(
    column: $table.clientId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ReferenceTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ReferenceTableTable> {
  $$ReferenceTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get clientId => $composableBuilder(
    column: $table.clientId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ReferenceTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReferenceTableTable> {
  $$ReferenceTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get clientId =>
      $composableBuilder(column: $table.clientId, builder: (column) => column);

  GeneratedColumn<String> get serverId =>
      $composableBuilder(column: $table.serverId, builder: (column) => column);
}

class $$ReferenceTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReferenceTableTable,
          ReferenceTableData,
          $$ReferenceTableTableFilterComposer,
          $$ReferenceTableTableOrderingComposer,
          $$ReferenceTableTableAnnotationComposer,
          $$ReferenceTableTableCreateCompanionBuilder,
          $$ReferenceTableTableUpdateCompanionBuilder,
          (
            ReferenceTableData,
            BaseReferences<
              _$AppDatabase,
              $ReferenceTableTable,
              ReferenceTableData
            >,
          ),
          ReferenceTableData,
          PrefetchHooks Function()
        > {
  $$ReferenceTableTableTableManager(
    _$AppDatabase db,
    $ReferenceTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReferenceTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReferenceTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReferenceTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> clientId = const Value.absent(),
                Value<String> serverId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ReferenceTableCompanion(
                clientId: clientId,
                serverId: serverId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String clientId,
                required String serverId,
                Value<int> rowid = const Value.absent(),
              }) => ReferenceTableCompanion.insert(
                clientId: clientId,
                serverId: serverId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ReferenceTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReferenceTableTable,
      ReferenceTableData,
      $$ReferenceTableTableFilterComposer,
      $$ReferenceTableTableOrderingComposer,
      $$ReferenceTableTableAnnotationComposer,
      $$ReferenceTableTableCreateCompanionBuilder,
      $$ReferenceTableTableUpdateCompanionBuilder,
      (
        ReferenceTableData,
        BaseReferences<_$AppDatabase, $ReferenceTableTable, ReferenceTableData>,
      ),
      ReferenceTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$WorkspaceTableTableTableManager get workspaceTable =>
      $$WorkspaceTableTableTableManager(_db, _db.workspaceTable);
  $$ProjectTableTableTableManager get projectTable =>
      $$ProjectTableTableTableManager(_db, _db.projectTable);
  $$TaskTableTableTableManager get taskTable =>
      $$TaskTableTableTableManager(_db, _db.taskTable);
  $$CommentTableTableTableManager get commentTable =>
      $$CommentTableTableTableManager(_db, _db.commentTable);
  $$ReferenceTableTableTableManager get referenceTable =>
      $$ReferenceTableTableTableManager(_db, _db.referenceTable);
}
