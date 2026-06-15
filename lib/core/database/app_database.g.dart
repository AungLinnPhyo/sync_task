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

class $OutboxTableTable extends OutboxTable
    with TableInfo<$OutboxTableTable, OutboxTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OutboxTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _methodMeta = const VerificationMeta('method');
  @override
  late final GeneratedColumn<String> method = GeneratedColumn<String>(
    'method',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actionTypeMeta = const VerificationMeta(
    'actionType',
  );
  @override
  late final GeneratedColumn<String> actionType = GeneratedColumn<String>(
    'action_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _clientReferenceIdMeta = const VerificationMeta(
    'clientReferenceId',
  );
  @override
  late final GeneratedColumn<String> clientReferenceId =
      GeneratedColumn<String>(
        'client_reference_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
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
    url,
    method,
    actionType,
    payload,
    clientReferenceId,
    status,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'outbox_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<OutboxTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('method')) {
      context.handle(
        _methodMeta,
        method.isAcceptableOrUnknown(data['method']!, _methodMeta),
      );
    } else if (isInserting) {
      context.missing(_methodMeta);
    }
    if (data.containsKey('action_type')) {
      context.handle(
        _actionTypeMeta,
        actionType.isAcceptableOrUnknown(data['action_type']!, _actionTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_actionTypeMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('client_reference_id')) {
      context.handle(
        _clientReferenceIdMeta,
        clientReferenceId.isAcceptableOrUnknown(
          data['client_reference_id']!,
          _clientReferenceIdMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
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
  OutboxTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OutboxTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      )!,
      method: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}method'],
      )!,
      actionType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}action_type'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      clientReferenceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}client_reference_id'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $OutboxTableTable createAlias(String alias) {
    return $OutboxTableTable(attachedDatabase, alias);
  }
}

class OutboxTableData extends DataClass implements Insertable<OutboxTableData> {
  final int id;
  final String url;
  final String method;
  final String actionType;
  final String payload;
  final String? clientReferenceId;
  final String status;
  final DateTime createdAt;
  const OutboxTableData({
    required this.id,
    required this.url,
    required this.method,
    required this.actionType,
    required this.payload,
    this.clientReferenceId,
    required this.status,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['url'] = Variable<String>(url);
    map['method'] = Variable<String>(method);
    map['action_type'] = Variable<String>(actionType);
    map['payload'] = Variable<String>(payload);
    if (!nullToAbsent || clientReferenceId != null) {
      map['client_reference_id'] = Variable<String>(clientReferenceId);
    }
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  OutboxTableCompanion toCompanion(bool nullToAbsent) {
    return OutboxTableCompanion(
      id: Value(id),
      url: Value(url),
      method: Value(method),
      actionType: Value(actionType),
      payload: Value(payload),
      clientReferenceId: clientReferenceId == null && nullToAbsent
          ? const Value.absent()
          : Value(clientReferenceId),
      status: Value(status),
      createdAt: Value(createdAt),
    );
  }

  factory OutboxTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OutboxTableData(
      id: serializer.fromJson<int>(json['id']),
      url: serializer.fromJson<String>(json['url']),
      method: serializer.fromJson<String>(json['method']),
      actionType: serializer.fromJson<String>(json['actionType']),
      payload: serializer.fromJson<String>(json['payload']),
      clientReferenceId: serializer.fromJson<String?>(
        json['clientReferenceId'],
      ),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'url': serializer.toJson<String>(url),
      'method': serializer.toJson<String>(method),
      'actionType': serializer.toJson<String>(actionType),
      'payload': serializer.toJson<String>(payload),
      'clientReferenceId': serializer.toJson<String?>(clientReferenceId),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  OutboxTableData copyWith({
    int? id,
    String? url,
    String? method,
    String? actionType,
    String? payload,
    Value<String?> clientReferenceId = const Value.absent(),
    String? status,
    DateTime? createdAt,
  }) => OutboxTableData(
    id: id ?? this.id,
    url: url ?? this.url,
    method: method ?? this.method,
    actionType: actionType ?? this.actionType,
    payload: payload ?? this.payload,
    clientReferenceId: clientReferenceId.present
        ? clientReferenceId.value
        : this.clientReferenceId,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
  );
  OutboxTableData copyWithCompanion(OutboxTableCompanion data) {
    return OutboxTableData(
      id: data.id.present ? data.id.value : this.id,
      url: data.url.present ? data.url.value : this.url,
      method: data.method.present ? data.method.value : this.method,
      actionType: data.actionType.present
          ? data.actionType.value
          : this.actionType,
      payload: data.payload.present ? data.payload.value : this.payload,
      clientReferenceId: data.clientReferenceId.present
          ? data.clientReferenceId.value
          : this.clientReferenceId,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OutboxTableData(')
          ..write('id: $id, ')
          ..write('url: $url, ')
          ..write('method: $method, ')
          ..write('actionType: $actionType, ')
          ..write('payload: $payload, ')
          ..write('clientReferenceId: $clientReferenceId, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    url,
    method,
    actionType,
    payload,
    clientReferenceId,
    status,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OutboxTableData &&
          other.id == this.id &&
          other.url == this.url &&
          other.method == this.method &&
          other.actionType == this.actionType &&
          other.payload == this.payload &&
          other.clientReferenceId == this.clientReferenceId &&
          other.status == this.status &&
          other.createdAt == this.createdAt);
}

class OutboxTableCompanion extends UpdateCompanion<OutboxTableData> {
  final Value<int> id;
  final Value<String> url;
  final Value<String> method;
  final Value<String> actionType;
  final Value<String> payload;
  final Value<String?> clientReferenceId;
  final Value<String> status;
  final Value<DateTime> createdAt;
  const OutboxTableCompanion({
    this.id = const Value.absent(),
    this.url = const Value.absent(),
    this.method = const Value.absent(),
    this.actionType = const Value.absent(),
    this.payload = const Value.absent(),
    this.clientReferenceId = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  OutboxTableCompanion.insert({
    this.id = const Value.absent(),
    required String url,
    required String method,
    required String actionType,
    required String payload,
    this.clientReferenceId = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : url = Value(url),
       method = Value(method),
       actionType = Value(actionType),
       payload = Value(payload);
  static Insertable<OutboxTableData> custom({
    Expression<int>? id,
    Expression<String>? url,
    Expression<String>? method,
    Expression<String>? actionType,
    Expression<String>? payload,
    Expression<String>? clientReferenceId,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (url != null) 'url': url,
      if (method != null) 'method': method,
      if (actionType != null) 'action_type': actionType,
      if (payload != null) 'payload': payload,
      if (clientReferenceId != null) 'client_reference_id': clientReferenceId,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  OutboxTableCompanion copyWith({
    Value<int>? id,
    Value<String>? url,
    Value<String>? method,
    Value<String>? actionType,
    Value<String>? payload,
    Value<String?>? clientReferenceId,
    Value<String>? status,
    Value<DateTime>? createdAt,
  }) {
    return OutboxTableCompanion(
      id: id ?? this.id,
      url: url ?? this.url,
      method: method ?? this.method,
      actionType: actionType ?? this.actionType,
      payload: payload ?? this.payload,
      clientReferenceId: clientReferenceId ?? this.clientReferenceId,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (method.present) {
      map['method'] = Variable<String>(method.value);
    }
    if (actionType.present) {
      map['action_type'] = Variable<String>(actionType.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (clientReferenceId.present) {
      map['client_reference_id'] = Variable<String>(clientReferenceId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OutboxTableCompanion(')
          ..write('id: $id, ')
          ..write('url: $url, ')
          ..write('method: $method, ')
          ..write('actionType: $actionType, ')
          ..write('payload: $payload, ')
          ..write('clientReferenceId: $clientReferenceId, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt')
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
  late final $OutboxTableTable outboxTable = $OutboxTableTable(this);
  late final ReferenceDao referenceDao = ReferenceDao(this as AppDatabase);
  late final WorkspaceDao workspaceDao = WorkspaceDao(this as AppDatabase);
  late final ProjectDao projectDao = ProjectDao(this as AppDatabase);
  late final TaskDao taskDao = TaskDao(this as AppDatabase);
  late final CommentDao commentDao = CommentDao(this as AppDatabase);
  late final OutboxDao outboxDao = OutboxDao(this as AppDatabase);
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
    outboxTable,
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
typedef $$OutboxTableTableCreateCompanionBuilder =
    OutboxTableCompanion Function({
      Value<int> id,
      required String url,
      required String method,
      required String actionType,
      required String payload,
      Value<String?> clientReferenceId,
      Value<String> status,
      Value<DateTime> createdAt,
    });
typedef $$OutboxTableTableUpdateCompanionBuilder =
    OutboxTableCompanion Function({
      Value<int> id,
      Value<String> url,
      Value<String> method,
      Value<String> actionType,
      Value<String> payload,
      Value<String?> clientReferenceId,
      Value<String> status,
      Value<DateTime> createdAt,
    });

class $$OutboxTableTableFilterComposer
    extends Composer<_$AppDatabase, $OutboxTableTable> {
  $$OutboxTableTableFilterComposer({
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

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get method => $composableBuilder(
    column: $table.method,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get actionType => $composableBuilder(
    column: $table.actionType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get clientReferenceId => $composableBuilder(
    column: $table.clientReferenceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$OutboxTableTableOrderingComposer
    extends Composer<_$AppDatabase, $OutboxTableTable> {
  $$OutboxTableTableOrderingComposer({
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

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get method => $composableBuilder(
    column: $table.method,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get actionType => $composableBuilder(
    column: $table.actionType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clientReferenceId => $composableBuilder(
    column: $table.clientReferenceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$OutboxTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $OutboxTableTable> {
  $$OutboxTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get method =>
      $composableBuilder(column: $table.method, builder: (column) => column);

  GeneratedColumn<String> get actionType => $composableBuilder(
    column: $table.actionType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<String> get clientReferenceId => $composableBuilder(
    column: $table.clientReferenceId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$OutboxTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OutboxTableTable,
          OutboxTableData,
          $$OutboxTableTableFilterComposer,
          $$OutboxTableTableOrderingComposer,
          $$OutboxTableTableAnnotationComposer,
          $$OutboxTableTableCreateCompanionBuilder,
          $$OutboxTableTableUpdateCompanionBuilder,
          (
            OutboxTableData,
            BaseReferences<_$AppDatabase, $OutboxTableTable, OutboxTableData>,
          ),
          OutboxTableData,
          PrefetchHooks Function()
        > {
  $$OutboxTableTableTableManager(_$AppDatabase db, $OutboxTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OutboxTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OutboxTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OutboxTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> url = const Value.absent(),
                Value<String> method = const Value.absent(),
                Value<String> actionType = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<String?> clientReferenceId = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => OutboxTableCompanion(
                id: id,
                url: url,
                method: method,
                actionType: actionType,
                payload: payload,
                clientReferenceId: clientReferenceId,
                status: status,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String url,
                required String method,
                required String actionType,
                required String payload,
                Value<String?> clientReferenceId = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => OutboxTableCompanion.insert(
                id: id,
                url: url,
                method: method,
                actionType: actionType,
                payload: payload,
                clientReferenceId: clientReferenceId,
                status: status,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$OutboxTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OutboxTableTable,
      OutboxTableData,
      $$OutboxTableTableFilterComposer,
      $$OutboxTableTableOrderingComposer,
      $$OutboxTableTableAnnotationComposer,
      $$OutboxTableTableCreateCompanionBuilder,
      $$OutboxTableTableUpdateCompanionBuilder,
      (
        OutboxTableData,
        BaseReferences<_$AppDatabase, $OutboxTableTable, OutboxTableData>,
      ),
      OutboxTableData,
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
  $$OutboxTableTableTableManager get outboxTable =>
      $$OutboxTableTableTableManager(_db, _db.outboxTable);
}
