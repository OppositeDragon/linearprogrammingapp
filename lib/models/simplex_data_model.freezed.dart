// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'simplex_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SimplexDataModel {
  SimplexStatus get status => throw _privateConstructorUsedError;
  List<List<List<double>>> get tableus => throw _privateConstructorUsedError;
  List<Point<int>> get pivotsCoordinates => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SimplexDataModelCopyWith<SimplexDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimplexDataModelCopyWith<$Res> {
  factory $SimplexDataModelCopyWith(
          SimplexDataModel value, $Res Function(SimplexDataModel) then) =
      _$SimplexDataModelCopyWithImpl<$Res, SimplexDataModel>;
  @useResult
  $Res call(
      {SimplexStatus status,
      List<List<List<double>>> tableus,
      List<Point<int>> pivotsCoordinates});
}

/// @nodoc
class _$SimplexDataModelCopyWithImpl<$Res, $Val extends SimplexDataModel>
    implements $SimplexDataModelCopyWith<$Res> {
  _$SimplexDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? tableus = null,
    Object? pivotsCoordinates = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SimplexStatus,
      tableus: null == tableus
          ? _value.tableus
          : tableus // ignore: cast_nullable_to_non_nullable
              as List<List<List<double>>>,
      pivotsCoordinates: null == pivotsCoordinates
          ? _value.pivotsCoordinates
          : pivotsCoordinates // ignore: cast_nullable_to_non_nullable
              as List<Point<int>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SimplexDataModelImplCopyWith<$Res>
    implements $SimplexDataModelCopyWith<$Res> {
  factory _$$SimplexDataModelImplCopyWith(_$SimplexDataModelImpl value,
          $Res Function(_$SimplexDataModelImpl) then) =
      __$$SimplexDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SimplexStatus status,
      List<List<List<double>>> tableus,
      List<Point<int>> pivotsCoordinates});
}

/// @nodoc
class __$$SimplexDataModelImplCopyWithImpl<$Res>
    extends _$SimplexDataModelCopyWithImpl<$Res, _$SimplexDataModelImpl>
    implements _$$SimplexDataModelImplCopyWith<$Res> {
  __$$SimplexDataModelImplCopyWithImpl(_$SimplexDataModelImpl _value,
      $Res Function(_$SimplexDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? tableus = null,
    Object? pivotsCoordinates = null,
  }) {
    return _then(_$SimplexDataModelImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SimplexStatus,
      tableus: null == tableus
          ? _value._tableus
          : tableus // ignore: cast_nullable_to_non_nullable
              as List<List<List<double>>>,
      pivotsCoordinates: null == pivotsCoordinates
          ? _value._pivotsCoordinates
          : pivotsCoordinates // ignore: cast_nullable_to_non_nullable
              as List<Point<int>>,
    ));
  }
}

/// @nodoc

class _$SimplexDataModelImpl extends _SimplexDataModel {
  const _$SimplexDataModelImpl(
      {required this.status,
      required final List<List<List<double>>> tableus,
      required final List<Point<int>> pivotsCoordinates})
      : _tableus = tableus,
        _pivotsCoordinates = pivotsCoordinates,
        super._();

  @override
  final SimplexStatus status;
  final List<List<List<double>>> _tableus;
  @override
  List<List<List<double>>> get tableus {
    if (_tableus is EqualUnmodifiableListView) return _tableus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tableus);
  }

  final List<Point<int>> _pivotsCoordinates;
  @override
  List<Point<int>> get pivotsCoordinates {
    if (_pivotsCoordinates is EqualUnmodifiableListView)
      return _pivotsCoordinates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pivotsCoordinates);
  }

  @override
  String toString() {
    return 'SimplexDataModel(status: $status, tableus: $tableus, pivotsCoordinates: $pivotsCoordinates)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SimplexDataModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._tableus, _tableus) &&
            const DeepCollectionEquality()
                .equals(other._pivotsCoordinates, _pivotsCoordinates));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_tableus),
      const DeepCollectionEquality().hash(_pivotsCoordinates));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SimplexDataModelImplCopyWith<_$SimplexDataModelImpl> get copyWith =>
      __$$SimplexDataModelImplCopyWithImpl<_$SimplexDataModelImpl>(
          this, _$identity);
}

abstract class _SimplexDataModel extends SimplexDataModel {
  const factory _SimplexDataModel(
          {required final SimplexStatus status,
          required final List<List<List<double>>> tableus,
          required final List<Point<int>> pivotsCoordinates}) =
      _$SimplexDataModelImpl;
  const _SimplexDataModel._() : super._();

  @override
  SimplexStatus get status;
  @override
  List<List<List<double>>> get tableus;
  @override
  List<Point<int>> get pivotsCoordinates;
  @override
  @JsonKey(ignore: true)
  _$$SimplexDataModelImplCopyWith<_$SimplexDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
