// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetailModel _$DetailModelFromJson(Map<String, dynamic> json) {
  return _DetailModel.fromJson(json);
}

/// @nodoc
mixin _$DetailModel {
  String get id => throw _privateConstructorUsedError;
  String get task => throw _privateConstructorUsedError;
  bool get isClicked => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailModelCopyWith<DetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailModelCopyWith<$Res> {
  factory $DetailModelCopyWith(
          DetailModel value, $Res Function(DetailModel) then) =
      _$DetailModelCopyWithImpl<$Res, DetailModel>;
  @useResult
  $Res call({String id, String task, bool isClicked, DateTime? createdAt});
}

/// @nodoc
class _$DetailModelCopyWithImpl<$Res, $Val extends DetailModel>
    implements $DetailModelCopyWith<$Res> {
  _$DetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? task = null,
    Object? isClicked = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      task: null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as String,
      isClicked: null == isClicked
          ? _value.isClicked
          : isClicked // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailModelImplCopyWith<$Res>
    implements $DetailModelCopyWith<$Res> {
  factory _$$DetailModelImplCopyWith(
          _$DetailModelImpl value, $Res Function(_$DetailModelImpl) then) =
      __$$DetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String task, bool isClicked, DateTime? createdAt});
}

/// @nodoc
class __$$DetailModelImplCopyWithImpl<$Res>
    extends _$DetailModelCopyWithImpl<$Res, _$DetailModelImpl>
    implements _$$DetailModelImplCopyWith<$Res> {
  __$$DetailModelImplCopyWithImpl(
      _$DetailModelImpl _value, $Res Function(_$DetailModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? task = null,
    Object? isClicked = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$DetailModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      task: null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as String,
      isClicked: null == isClicked
          ? _value.isClicked
          : isClicked // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailModelImpl implements _DetailModel {
  _$DetailModelImpl(
      {required this.id,
      required this.task,
      this.isClicked = false,
      this.createdAt});

  factory _$DetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailModelImplFromJson(json);

  @override
  final String id;
  @override
  final String task;
  @override
  @JsonKey()
  final bool isClicked;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'DetailModel(id: $id, task: $task, isClicked: $isClicked, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.isClicked, isClicked) ||
                other.isClicked == isClicked) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, task, isClicked, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailModelImplCopyWith<_$DetailModelImpl> get copyWith =>
      __$$DetailModelImplCopyWithImpl<_$DetailModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailModelImplToJson(
      this,
    );
  }
}

abstract class _DetailModel implements DetailModel {
  factory _DetailModel(
      {required final String id,
      required final String task,
      final bool isClicked,
      final DateTime? createdAt}) = _$DetailModelImpl;

  factory _DetailModel.fromJson(Map<String, dynamic> json) =
      _$DetailModelImpl.fromJson;

  @override
  String get id;
  @override
  String get task;
  @override
  bool get isClicked;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$DetailModelImplCopyWith<_$DetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
