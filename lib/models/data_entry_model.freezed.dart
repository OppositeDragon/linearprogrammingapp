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

/// @nodoc
mixin _$EntrySizeState {
  int get variables => throw _privateConstructorUsedError;
  int get constraints => throw _privateConstructorUsedError;
  bool get showProcess => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EntrySizeStateCopyWith<EntrySizeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntrySizeStateCopyWith<$Res> {
  factory $EntrySizeStateCopyWith(
          EntrySizeState value, $Res Function(EntrySizeState) then) =
      _$EntrySizeStateCopyWithImpl<$Res, EntrySizeState>;
  @useResult
  $Res call({int variables, int constraints, bool showProcess});
}

/// @nodoc
class _$EntrySizeStateCopyWithImpl<$Res, $Val extends EntrySizeState>
    implements $EntrySizeStateCopyWith<$Res> {
  _$EntrySizeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variables = null,
    Object? constraints = null,
    Object? showProcess = null,
  }) {
    return _then(_value.copyWith(
      variables: null == variables
          ? _value.variables
          : variables // ignore: cast_nullable_to_non_nullable
              as int,
      constraints: null == constraints
          ? _value.constraints
          : constraints // ignore: cast_nullable_to_non_nullable
              as int,
      showProcess: null == showProcess
          ? _value.showProcess
          : showProcess // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EntrySizeStateImplCopyWith<$Res>
    implements $EntrySizeStateCopyWith<$Res> {
  factory _$$EntrySizeStateImplCopyWith(_$EntrySizeStateImpl value,
          $Res Function(_$EntrySizeStateImpl) then) =
      __$$EntrySizeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int variables, int constraints, bool showProcess});
}

/// @nodoc
class __$$EntrySizeStateImplCopyWithImpl<$Res>
    extends _$EntrySizeStateCopyWithImpl<$Res, _$EntrySizeStateImpl>
    implements _$$EntrySizeStateImplCopyWith<$Res> {
  __$$EntrySizeStateImplCopyWithImpl(
      _$EntrySizeStateImpl _value, $Res Function(_$EntrySizeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variables = null,
    Object? constraints = null,
    Object? showProcess = null,
  }) {
    return _then(_$EntrySizeStateImpl(
      variables: null == variables
          ? _value.variables
          : variables // ignore: cast_nullable_to_non_nullable
              as int,
      constraints: null == constraints
          ? _value.constraints
          : constraints // ignore: cast_nullable_to_non_nullable
              as int,
      showProcess: null == showProcess
          ? _value.showProcess
          : showProcess // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$EntrySizeStateImpl implements _EntrySizeState {
  const _$EntrySizeStateImpl(
      {required this.variables,
      required this.constraints,
      this.showProcess = false});

  @override
  final int variables;
  @override
  final int constraints;
  @override
  @JsonKey()
  final bool showProcess;

  @override
  String toString() {
    return 'EntrySizeState(variables: $variables, constraints: $constraints, showProcess: $showProcess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EntrySizeStateImpl &&
            (identical(other.variables, variables) ||
                other.variables == variables) &&
            (identical(other.constraints, constraints) ||
                other.constraints == constraints) &&
            (identical(other.showProcess, showProcess) ||
                other.showProcess == showProcess));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, variables, constraints, showProcess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EntrySizeStateImplCopyWith<_$EntrySizeStateImpl> get copyWith =>
      __$$EntrySizeStateImplCopyWithImpl<_$EntrySizeStateImpl>(
          this, _$identity);
}

abstract class _EntrySizeState implements EntrySizeState {
  const factory _EntrySizeState(
      {required final int variables,
      required final int constraints,
      final bool showProcess}) = _$EntrySizeStateImpl;

  @override
  int get variables;
  @override
  int get constraints;
  @override
  bool get showProcess;
  @override
  @JsonKey(ignore: true)
  _$$EntrySizeStateImplCopyWith<_$EntrySizeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DataEntryState _$DataEntryStateFromJson(Map<String, dynamic> json) {
  return _DataEntryModel.fromJson(json);
}

/// @nodoc
mixin _$DataEntryState {
  Objectives get objective => throw _privateConstructorUsedError;
  List<double> get objectiveFunction => throw _privateConstructorUsedError;
  List<Operators> get operators => throw _privateConstructorUsedError;
  List<List<double>> get constraints => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataEntryStateCopyWith<DataEntryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataEntryStateCopyWith<$Res> {
  factory $DataEntryStateCopyWith(
          DataEntryState value, $Res Function(DataEntryState) then) =
      _$DataEntryStateCopyWithImpl<$Res, DataEntryState>;
  @useResult
  $Res call(
      {Objectives objective,
      List<double> objectiveFunction,
      List<Operators> operators,
      List<List<double>> constraints});
}

/// @nodoc
class _$DataEntryStateCopyWithImpl<$Res, $Val extends DataEntryState>
    implements $DataEntryStateCopyWith<$Res> {
  _$DataEntryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objective = null,
    Object? objectiveFunction = null,
    Object? operators = null,
    Object? constraints = null,
  }) {
    return _then(_value.copyWith(
      objective: null == objective
          ? _value.objective
          : objective // ignore: cast_nullable_to_non_nullable
              as Objectives,
      objectiveFunction: null == objectiveFunction
          ? _value.objectiveFunction
          : objectiveFunction // ignore: cast_nullable_to_non_nullable
              as List<double>,
      operators: null == operators
          ? _value.operators
          : operators // ignore: cast_nullable_to_non_nullable
              as List<Operators>,
      constraints: null == constraints
          ? _value.constraints
          : constraints // ignore: cast_nullable_to_non_nullable
              as List<List<double>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataEntryModelImplCopyWith<$Res>
    implements $DataEntryStateCopyWith<$Res> {
  factory _$$DataEntryModelImplCopyWith(_$DataEntryModelImpl value,
          $Res Function(_$DataEntryModelImpl) then) =
      __$$DataEntryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Objectives objective,
      List<double> objectiveFunction,
      List<Operators> operators,
      List<List<double>> constraints});
}

/// @nodoc
class __$$DataEntryModelImplCopyWithImpl<$Res>
    extends _$DataEntryStateCopyWithImpl<$Res, _$DataEntryModelImpl>
    implements _$$DataEntryModelImplCopyWith<$Res> {
  __$$DataEntryModelImplCopyWithImpl(
      _$DataEntryModelImpl _value, $Res Function(_$DataEntryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objective = null,
    Object? objectiveFunction = null,
    Object? operators = null,
    Object? constraints = null,
  }) {
    return _then(_$DataEntryModelImpl(
      objective: null == objective
          ? _value.objective
          : objective // ignore: cast_nullable_to_non_nullable
              as Objectives,
      objectiveFunction: null == objectiveFunction
          ? _value._objectiveFunction
          : objectiveFunction // ignore: cast_nullable_to_non_nullable
              as List<double>,
      operators: null == operators
          ? _value._operators
          : operators // ignore: cast_nullable_to_non_nullable
              as List<Operators>,
      constraints: null == constraints
          ? _value._constraints
          : constraints // ignore: cast_nullable_to_non_nullable
              as List<List<double>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataEntryModelImpl implements _DataEntryModel {
  const _$DataEntryModelImpl(
      {required this.objective,
      required final List<double> objectiveFunction,
      required final List<Operators> operators,
      required final List<List<double>> constraints})
      : _objectiveFunction = objectiveFunction,
        _operators = operators,
        _constraints = constraints;

  factory _$DataEntryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataEntryModelImplFromJson(json);

  @override
  final Objectives objective;
  final List<double> _objectiveFunction;
  @override
  List<double> get objectiveFunction {
    if (_objectiveFunction is EqualUnmodifiableListView)
      return _objectiveFunction;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_objectiveFunction);
  }

  final List<Operators> _operators;
  @override
  List<Operators> get operators {
    if (_operators is EqualUnmodifiableListView) return _operators;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_operators);
  }

  final List<List<double>> _constraints;
  @override
  List<List<double>> get constraints {
    if (_constraints is EqualUnmodifiableListView) return _constraints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_constraints);
  }

  @override
  String toString() {
    return 'DataEntryState(objective: $objective, objectiveFunction: $objectiveFunction, operators: $operators, constraints: $constraints)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataEntryModelImpl &&
            (identical(other.objective, objective) ||
                other.objective == objective) &&
            const DeepCollectionEquality()
                .equals(other._objectiveFunction, _objectiveFunction) &&
            const DeepCollectionEquality()
                .equals(other._operators, _operators) &&
            const DeepCollectionEquality()
                .equals(other._constraints, _constraints));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      objective,
      const DeepCollectionEquality().hash(_objectiveFunction),
      const DeepCollectionEquality().hash(_operators),
      const DeepCollectionEquality().hash(_constraints));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataEntryModelImplCopyWith<_$DataEntryModelImpl> get copyWith =>
      __$$DataEntryModelImplCopyWithImpl<_$DataEntryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataEntryModelImplToJson(
      this,
    );
  }
}

abstract class _DataEntryModel implements DataEntryState {
  const factory _DataEntryModel(
      {required final Objectives objective,
      required final List<double> objectiveFunction,
      required final List<Operators> operators,
      required final List<List<double>> constraints}) = _$DataEntryModelImpl;

  factory _DataEntryModel.fromJson(Map<String, dynamic> json) =
      _$DataEntryModelImpl.fromJson;

  @override
  Objectives get objective;
  @override
  List<double> get objectiveFunction;
  @override
  List<Operators> get operators;
  @override
  List<List<double>> get constraints;
  @override
  @JsonKey(ignore: true)
  _$$DataEntryModelImplCopyWith<_$DataEntryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
