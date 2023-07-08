// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_entry_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DataEntryModel _$DataEntryModelFromJson(Map<String, dynamic> json) {
  return _DataEntryModel.fromJson(json);
}

/// @nodoc
mixin _$DataEntryModel {
  List<double> get objectiveFunction => throw _privateConstructorUsedError;
  List<List<double>> get constraints => throw _privateConstructorUsedError;
  List<Operators> get operators => throw _privateConstructorUsedError;
  Objectives get objective => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataEntryModelCopyWith<DataEntryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataEntryModelCopyWith<$Res> {
  factory $DataEntryModelCopyWith(
          DataEntryModel value, $Res Function(DataEntryModel) then) =
      _$DataEntryModelCopyWithImpl<$Res, DataEntryModel>;
  @useResult
  $Res call(
      {List<double> objectiveFunction,
      List<List<double>> constraints,
      List<Operators> operators,
      Objectives objective});
}

/// @nodoc
class _$DataEntryModelCopyWithImpl<$Res, $Val extends DataEntryModel>
    implements $DataEntryModelCopyWith<$Res> {
  _$DataEntryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objectiveFunction = null,
    Object? constraints = null,
    Object? operators = null,
    Object? objective = null,
  }) {
    return _then(_value.copyWith(
      objectiveFunction: null == objectiveFunction
          ? _value.objectiveFunction
          : objectiveFunction // ignore: cast_nullable_to_non_nullable
              as List<double>,
      constraints: null == constraints
          ? _value.constraints
          : constraints // ignore: cast_nullable_to_non_nullable
              as List<List<double>>,
      operators: null == operators
          ? _value.operators
          : operators // ignore: cast_nullable_to_non_nullable
              as List<Operators>,
      objective: null == objective
          ? _value.objective
          : objective // ignore: cast_nullable_to_non_nullable
              as Objectives,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DataEntryModelCopyWith<$Res>
    implements $DataEntryModelCopyWith<$Res> {
  factory _$$_DataEntryModelCopyWith(
          _$_DataEntryModel value, $Res Function(_$_DataEntryModel) then) =
      __$$_DataEntryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<double> objectiveFunction,
      List<List<double>> constraints,
      List<Operators> operators,
      Objectives objective});
}

/// @nodoc
class __$$_DataEntryModelCopyWithImpl<$Res>
    extends _$DataEntryModelCopyWithImpl<$Res, _$_DataEntryModel>
    implements _$$_DataEntryModelCopyWith<$Res> {
  __$$_DataEntryModelCopyWithImpl(
      _$_DataEntryModel _value, $Res Function(_$_DataEntryModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objectiveFunction = null,
    Object? constraints = null,
    Object? operators = null,
    Object? objective = null,
  }) {
    return _then(_$_DataEntryModel(
      objectiveFunction: null == objectiveFunction
          ? _value._objectiveFunction
          : objectiveFunction // ignore: cast_nullable_to_non_nullable
              as List<double>,
      constraints: null == constraints
          ? _value._constraints
          : constraints // ignore: cast_nullable_to_non_nullable
              as List<List<double>>,
      operators: null == operators
          ? _value._operators
          : operators // ignore: cast_nullable_to_non_nullable
              as List<Operators>,
      objective: null == objective
          ? _value.objective
          : objective // ignore: cast_nullable_to_non_nullable
              as Objectives,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DataEntryModel implements _DataEntryModel {
  const _$_DataEntryModel(
      {required final List<double> objectiveFunction,
      required final List<List<double>> constraints,
      required final List<Operators> operators,
      required this.objective})
      : _objectiveFunction = objectiveFunction,
        _constraints = constraints,
        _operators = operators;

  factory _$_DataEntryModel.fromJson(Map<String, dynamic> json) =>
      _$$_DataEntryModelFromJson(json);

  final List<double> _objectiveFunction;
  @override
  List<double> get objectiveFunction {
    if (_objectiveFunction is EqualUnmodifiableListView)
      return _objectiveFunction;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_objectiveFunction);
  }

  final List<List<double>> _constraints;
  @override
  List<List<double>> get constraints {
    if (_constraints is EqualUnmodifiableListView) return _constraints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_constraints);
  }

  final List<Operators> _operators;
  @override
  List<Operators> get operators {
    if (_operators is EqualUnmodifiableListView) return _operators;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_operators);
  }

  @override
  final Objectives objective;

  @override
  String toString() {
    return 'DataEntryModel(objectiveFunction: $objectiveFunction, constraints: $constraints, operators: $operators, objective: $objective)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DataEntryModel &&
            const DeepCollectionEquality()
                .equals(other._objectiveFunction, _objectiveFunction) &&
            const DeepCollectionEquality()
                .equals(other._constraints, _constraints) &&
            const DeepCollectionEquality()
                .equals(other._operators, _operators) &&
            (identical(other.objective, objective) ||
                other.objective == objective));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_objectiveFunction),
      const DeepCollectionEquality().hash(_constraints),
      const DeepCollectionEquality().hash(_operators),
      objective);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DataEntryModelCopyWith<_$_DataEntryModel> get copyWith =>
      __$$_DataEntryModelCopyWithImpl<_$_DataEntryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DataEntryModelToJson(
      this,
    );
  }
}

abstract class _DataEntryModel implements DataEntryModel {
  const factory _DataEntryModel(
      {required final List<double> objectiveFunction,
      required final List<List<double>> constraints,
      required final List<Operators> operators,
      required final Objectives objective}) = _$_DataEntryModel;

  factory _DataEntryModel.fromJson(Map<String, dynamic> json) =
      _$_DataEntryModel.fromJson;

  @override
  List<double> get objectiveFunction;
  @override
  List<List<double>> get constraints;
  @override
  List<Operators> get operators;
  @override
  Objectives get objective;
  @override
  @JsonKey(ignore: true)
  _$$_DataEntryModelCopyWith<_$_DataEntryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
