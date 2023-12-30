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

DataEntryModel _$DataEntryModelFromJson(Map<String, dynamic> json) {
  return _DataEntryModel.fromJson(json);
}

/// @nodoc
mixin _$DataEntryModel {
  Objectives get objective => throw _privateConstructorUsedError;
  List<double> get objectiveFunction => throw _privateConstructorUsedError;
  List<Operators> get operators => throw _privateConstructorUsedError;
  List<List<double>> get constraints => throw _privateConstructorUsedError;

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
      {Objectives objective,
      List<double> objectiveFunction,
      List<Operators> operators,
      List<List<double>> constraints});
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
    implements $DataEntryModelCopyWith<$Res> {
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
    extends _$DataEntryModelCopyWithImpl<$Res, _$DataEntryModelImpl>
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
    return 'DataEntryModel(objective: $objective, objectiveFunction: $objectiveFunction, operators: $operators, constraints: $constraints)';
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

abstract class _DataEntryModel implements DataEntryModel {
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

/// @nodoc
mixin _$AnswerPresentationModel {
  List<({double coefficient, String letter, double value})> get variablesData =>
      throw _privateConstructorUsedError;
  double get z => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnswerPresentationModelCopyWith<AnswerPresentationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerPresentationModelCopyWith<$Res> {
  factory $AnswerPresentationModelCopyWith(AnswerPresentationModel value,
          $Res Function(AnswerPresentationModel) then) =
      _$AnswerPresentationModelCopyWithImpl<$Res, AnswerPresentationModel>;
  @useResult
  $Res call(
      {List<({double coefficient, String letter, double value})> variablesData,
      double z});
}

/// @nodoc
class _$AnswerPresentationModelCopyWithImpl<$Res,
        $Val extends AnswerPresentationModel>
    implements $AnswerPresentationModelCopyWith<$Res> {
  _$AnswerPresentationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variablesData = null,
    Object? z = null,
  }) {
    return _then(_value.copyWith(
      variablesData: null == variablesData
          ? _value.variablesData
          : variablesData // ignore: cast_nullable_to_non_nullable
              as List<({double coefficient, String letter, double value})>,
      z: null == z
          ? _value.z
          : z // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnswerPresentationModelImplCopyWith<$Res>
    implements $AnswerPresentationModelCopyWith<$Res> {
  factory _$$AnswerPresentationModelImplCopyWith(
          _$AnswerPresentationModelImpl value,
          $Res Function(_$AnswerPresentationModelImpl) then) =
      __$$AnswerPresentationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<({double coefficient, String letter, double value})> variablesData,
      double z});
}

/// @nodoc
class __$$AnswerPresentationModelImplCopyWithImpl<$Res>
    extends _$AnswerPresentationModelCopyWithImpl<$Res,
        _$AnswerPresentationModelImpl>
    implements _$$AnswerPresentationModelImplCopyWith<$Res> {
  __$$AnswerPresentationModelImplCopyWithImpl(
      _$AnswerPresentationModelImpl _value,
      $Res Function(_$AnswerPresentationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? variablesData = null,
    Object? z = null,
  }) {
    return _then(_$AnswerPresentationModelImpl(
      variablesData: null == variablesData
          ? _value._variablesData
          : variablesData // ignore: cast_nullable_to_non_nullable
              as List<({double coefficient, String letter, double value})>,
      z: null == z
          ? _value.z
          : z // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$AnswerPresentationModelImpl extends _AnswerPresentationModel {
  const _$AnswerPresentationModelImpl(
      {required final List<({double coefficient, String letter, double value})>
          variablesData,
      required this.z})
      : _variablesData = variablesData,
        super._();

  final List<({double coefficient, String letter, double value})>
      _variablesData;
  @override
  List<({double coefficient, String letter, double value})> get variablesData {
    if (_variablesData is EqualUnmodifiableListView) return _variablesData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_variablesData);
  }

  @override
  final double z;

  @override
  String toString() {
    return 'AnswerPresentationModel(variablesData: $variablesData, z: $z)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswerPresentationModelImpl &&
            const DeepCollectionEquality()
                .equals(other._variablesData, _variablesData) &&
            (identical(other.z, z) || other.z == z));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_variablesData), z);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnswerPresentationModelImplCopyWith<_$AnswerPresentationModelImpl>
      get copyWith => __$$AnswerPresentationModelImplCopyWithImpl<
          _$AnswerPresentationModelImpl>(this, _$identity);
}

abstract class _AnswerPresentationModel extends AnswerPresentationModel {
  const factory _AnswerPresentationModel(
      {required final List<({double coefficient, String letter, double value})>
          variablesData,
      required final double z}) = _$AnswerPresentationModelImpl;
  const _AnswerPresentationModel._() : super._();

  @override
  List<({double coefficient, String letter, double value})> get variablesData;
  @override
  double get z;
  @override
  @JsonKey(ignore: true)
  _$$AnswerPresentationModelImplCopyWith<_$AnswerPresentationModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
