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
  bool operator ==(dynamic other) {
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
  bool operator ==(dynamic other) {
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

/// @nodoc
mixin _$DataModelForAlgebraic {
  List<List<double>> get standardForm => throw _privateConstructorUsedError;
  List<List<double>> get constraintWithSlack =>
      throw _privateConstructorUsedError;
  List<List<String>> get constraintsString =>
      throw _privateConstructorUsedError;
  List<double> get rightSide => throw _privateConstructorUsedError;
  List<String> get rightSideString => throw _privateConstructorUsedError;
  String get greaterThanZeroCondition => throw _privateConstructorUsedError;
  String get combinationsEquation => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DataModelForAlgebraicCopyWith<DataModelForAlgebraic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataModelForAlgebraicCopyWith<$Res> {
  factory $DataModelForAlgebraicCopyWith(DataModelForAlgebraic value,
          $Res Function(DataModelForAlgebraic) then) =
      _$DataModelForAlgebraicCopyWithImpl<$Res, DataModelForAlgebraic>;
  @useResult
  $Res call(
      {List<List<double>> standardForm,
      List<List<double>> constraintWithSlack,
      List<List<String>> constraintsString,
      List<double> rightSide,
      List<String> rightSideString,
      String greaterThanZeroCondition,
      String combinationsEquation});
}

/// @nodoc
class _$DataModelForAlgebraicCopyWithImpl<$Res,
        $Val extends DataModelForAlgebraic>
    implements $DataModelForAlgebraicCopyWith<$Res> {
  _$DataModelForAlgebraicCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? standardForm = null,
    Object? constraintWithSlack = null,
    Object? constraintsString = null,
    Object? rightSide = null,
    Object? rightSideString = null,
    Object? greaterThanZeroCondition = null,
    Object? combinationsEquation = null,
  }) {
    return _then(_value.copyWith(
      standardForm: null == standardForm
          ? _value.standardForm
          : standardForm // ignore: cast_nullable_to_non_nullable
              as List<List<double>>,
      constraintWithSlack: null == constraintWithSlack
          ? _value.constraintWithSlack
          : constraintWithSlack // ignore: cast_nullable_to_non_nullable
              as List<List<double>>,
      constraintsString: null == constraintsString
          ? _value.constraintsString
          : constraintsString // ignore: cast_nullable_to_non_nullable
              as List<List<String>>,
      rightSide: null == rightSide
          ? _value.rightSide
          : rightSide // ignore: cast_nullable_to_non_nullable
              as List<double>,
      rightSideString: null == rightSideString
          ? _value.rightSideString
          : rightSideString // ignore: cast_nullable_to_non_nullable
              as List<String>,
      greaterThanZeroCondition: null == greaterThanZeroCondition
          ? _value.greaterThanZeroCondition
          : greaterThanZeroCondition // ignore: cast_nullable_to_non_nullable
              as String,
      combinationsEquation: null == combinationsEquation
          ? _value.combinationsEquation
          : combinationsEquation // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataModelForAlgebraicImplCopyWith<$Res>
    implements $DataModelForAlgebraicCopyWith<$Res> {
  factory _$$DataModelForAlgebraicImplCopyWith(
          _$DataModelForAlgebraicImpl value,
          $Res Function(_$DataModelForAlgebraicImpl) then) =
      __$$DataModelForAlgebraicImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<List<double>> standardForm,
      List<List<double>> constraintWithSlack,
      List<List<String>> constraintsString,
      List<double> rightSide,
      List<String> rightSideString,
      String greaterThanZeroCondition,
      String combinationsEquation});
}

/// @nodoc
class __$$DataModelForAlgebraicImplCopyWithImpl<$Res>
    extends _$DataModelForAlgebraicCopyWithImpl<$Res,
        _$DataModelForAlgebraicImpl>
    implements _$$DataModelForAlgebraicImplCopyWith<$Res> {
  __$$DataModelForAlgebraicImplCopyWithImpl(_$DataModelForAlgebraicImpl _value,
      $Res Function(_$DataModelForAlgebraicImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? standardForm = null,
    Object? constraintWithSlack = null,
    Object? constraintsString = null,
    Object? rightSide = null,
    Object? rightSideString = null,
    Object? greaterThanZeroCondition = null,
    Object? combinationsEquation = null,
  }) {
    return _then(_$DataModelForAlgebraicImpl(
      standardForm: null == standardForm
          ? _value._standardForm
          : standardForm // ignore: cast_nullable_to_non_nullable
              as List<List<double>>,
      constraintWithSlack: null == constraintWithSlack
          ? _value._constraintWithSlack
          : constraintWithSlack // ignore: cast_nullable_to_non_nullable
              as List<List<double>>,
      constraintsString: null == constraintsString
          ? _value._constraintsString
          : constraintsString // ignore: cast_nullable_to_non_nullable
              as List<List<String>>,
      rightSide: null == rightSide
          ? _value._rightSide
          : rightSide // ignore: cast_nullable_to_non_nullable
              as List<double>,
      rightSideString: null == rightSideString
          ? _value._rightSideString
          : rightSideString // ignore: cast_nullable_to_non_nullable
              as List<String>,
      greaterThanZeroCondition: null == greaterThanZeroCondition
          ? _value.greaterThanZeroCondition
          : greaterThanZeroCondition // ignore: cast_nullable_to_non_nullable
              as String,
      combinationsEquation: null == combinationsEquation
          ? _value.combinationsEquation
          : combinationsEquation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DataModelForAlgebraicImpl implements _DataModelForAlgebraic {
  const _$DataModelForAlgebraicImpl(
      {required final List<List<double>> standardForm,
      required final List<List<double>> constraintWithSlack,
      required final List<List<String>> constraintsString,
      required final List<double> rightSide,
      required final List<String> rightSideString,
      required this.greaterThanZeroCondition,
      required this.combinationsEquation})
      : _standardForm = standardForm,
        _constraintWithSlack = constraintWithSlack,
        _constraintsString = constraintsString,
        _rightSide = rightSide,
        _rightSideString = rightSideString;

  final List<List<double>> _standardForm;
  @override
  List<List<double>> get standardForm {
    if (_standardForm is EqualUnmodifiableListView) return _standardForm;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_standardForm);
  }

  final List<List<double>> _constraintWithSlack;
  @override
  List<List<double>> get constraintWithSlack {
    if (_constraintWithSlack is EqualUnmodifiableListView)
      return _constraintWithSlack;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_constraintWithSlack);
  }

  final List<List<String>> _constraintsString;
  @override
  List<List<String>> get constraintsString {
    if (_constraintsString is EqualUnmodifiableListView)
      return _constraintsString;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_constraintsString);
  }

  final List<double> _rightSide;
  @override
  List<double> get rightSide {
    if (_rightSide is EqualUnmodifiableListView) return _rightSide;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rightSide);
  }

  final List<String> _rightSideString;
  @override
  List<String> get rightSideString {
    if (_rightSideString is EqualUnmodifiableListView) return _rightSideString;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rightSideString);
  }

  @override
  final String greaterThanZeroCondition;
  @override
  final String combinationsEquation;

  @override
  String toString() {
    return 'DataModelForAlgebraic(standardForm: $standardForm, constraintWithSlack: $constraintWithSlack, constraintsString: $constraintsString, rightSide: $rightSide, rightSideString: $rightSideString, greaterThanZeroCondition: $greaterThanZeroCondition, combinationsEquation: $combinationsEquation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataModelForAlgebraicImpl &&
            const DeepCollectionEquality()
                .equals(other._standardForm, _standardForm) &&
            const DeepCollectionEquality()
                .equals(other._constraintWithSlack, _constraintWithSlack) &&
            const DeepCollectionEquality()
                .equals(other._constraintsString, _constraintsString) &&
            const DeepCollectionEquality()
                .equals(other._rightSide, _rightSide) &&
            const DeepCollectionEquality()
                .equals(other._rightSideString, _rightSideString) &&
            (identical(
                    other.greaterThanZeroCondition, greaterThanZeroCondition) ||
                other.greaterThanZeroCondition == greaterThanZeroCondition) &&
            (identical(other.combinationsEquation, combinationsEquation) ||
                other.combinationsEquation == combinationsEquation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_standardForm),
      const DeepCollectionEquality().hash(_constraintWithSlack),
      const DeepCollectionEquality().hash(_constraintsString),
      const DeepCollectionEquality().hash(_rightSide),
      const DeepCollectionEquality().hash(_rightSideString),
      greaterThanZeroCondition,
      combinationsEquation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataModelForAlgebraicImplCopyWith<_$DataModelForAlgebraicImpl>
      get copyWith => __$$DataModelForAlgebraicImplCopyWithImpl<
          _$DataModelForAlgebraicImpl>(this, _$identity);
}

abstract class _DataModelForAlgebraic implements DataModelForAlgebraic {
  const factory _DataModelForAlgebraic(
          {required final List<List<double>> standardForm,
          required final List<List<double>> constraintWithSlack,
          required final List<List<String>> constraintsString,
          required final List<double> rightSide,
          required final List<String> rightSideString,
          required final String greaterThanZeroCondition,
          required final String combinationsEquation}) =
      _$DataModelForAlgebraicImpl;

  @override
  List<List<double>> get standardForm;
  @override
  List<List<double>> get constraintWithSlack;
  @override
  List<List<String>> get constraintsString;
  @override
  List<double> get rightSide;
  @override
  List<String> get rightSideString;
  @override
  String get greaterThanZeroCondition;
  @override
  String get combinationsEquation;
  @override
  @JsonKey(ignore: true)
  _$$DataModelForAlgebraicImplCopyWith<_$DataModelForAlgebraicImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$StepsForAlgebraic {
  String get header => throw _privateConstructorUsedError;
  int get step => throw _privateConstructorUsedError;
  List<int> get whereVarEqualsZero => throw _privateConstructorUsedError;
  List<double> get solutions => throw _privateConstructorUsedError;
  List<String> get solutionsString => throw _privateConstructorUsedError;
  List<List<double>> get matrix => throw _privateConstructorUsedError;
  String? get solutionString => throw _privateConstructorUsedError;
  double? get objectiveFunctionSolution => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StepsForAlgebraicCopyWith<StepsForAlgebraic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StepsForAlgebraicCopyWith<$Res> {
  factory $StepsForAlgebraicCopyWith(
          StepsForAlgebraic value, $Res Function(StepsForAlgebraic) then) =
      _$StepsForAlgebraicCopyWithImpl<$Res, StepsForAlgebraic>;
  @useResult
  $Res call(
      {String header,
      int step,
      List<int> whereVarEqualsZero,
      List<double> solutions,
      List<String> solutionsString,
      List<List<double>> matrix,
      String? solutionString,
      double? objectiveFunctionSolution});
}

/// @nodoc
class _$StepsForAlgebraicCopyWithImpl<$Res, $Val extends StepsForAlgebraic>
    implements $StepsForAlgebraicCopyWith<$Res> {
  _$StepsForAlgebraicCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = null,
    Object? step = null,
    Object? whereVarEqualsZero = null,
    Object? solutions = null,
    Object? solutionsString = null,
    Object? matrix = null,
    Object? solutionString = freezed,
    Object? objectiveFunctionSolution = freezed,
  }) {
    return _then(_value.copyWith(
      header: null == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as String,
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int,
      whereVarEqualsZero: null == whereVarEqualsZero
          ? _value.whereVarEqualsZero
          : whereVarEqualsZero // ignore: cast_nullable_to_non_nullable
              as List<int>,
      solutions: null == solutions
          ? _value.solutions
          : solutions // ignore: cast_nullable_to_non_nullable
              as List<double>,
      solutionsString: null == solutionsString
          ? _value.solutionsString
          : solutionsString // ignore: cast_nullable_to_non_nullable
              as List<String>,
      matrix: null == matrix
          ? _value.matrix
          : matrix // ignore: cast_nullable_to_non_nullable
              as List<List<double>>,
      solutionString: freezed == solutionString
          ? _value.solutionString
          : solutionString // ignore: cast_nullable_to_non_nullable
              as String?,
      objectiveFunctionSolution: freezed == objectiveFunctionSolution
          ? _value.objectiveFunctionSolution
          : objectiveFunctionSolution // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StepsForAlgebraicImplCopyWith<$Res>
    implements $StepsForAlgebraicCopyWith<$Res> {
  factory _$$StepsForAlgebraicImplCopyWith(_$StepsForAlgebraicImpl value,
          $Res Function(_$StepsForAlgebraicImpl) then) =
      __$$StepsForAlgebraicImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String header,
      int step,
      List<int> whereVarEqualsZero,
      List<double> solutions,
      List<String> solutionsString,
      List<List<double>> matrix,
      String? solutionString,
      double? objectiveFunctionSolution});
}

/// @nodoc
class __$$StepsForAlgebraicImplCopyWithImpl<$Res>
    extends _$StepsForAlgebraicCopyWithImpl<$Res, _$StepsForAlgebraicImpl>
    implements _$$StepsForAlgebraicImplCopyWith<$Res> {
  __$$StepsForAlgebraicImplCopyWithImpl(_$StepsForAlgebraicImpl _value,
      $Res Function(_$StepsForAlgebraicImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = null,
    Object? step = null,
    Object? whereVarEqualsZero = null,
    Object? solutions = null,
    Object? solutionsString = null,
    Object? matrix = null,
    Object? solutionString = freezed,
    Object? objectiveFunctionSolution = freezed,
  }) {
    return _then(_$StepsForAlgebraicImpl(
      header: null == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as String,
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int,
      whereVarEqualsZero: null == whereVarEqualsZero
          ? _value._whereVarEqualsZero
          : whereVarEqualsZero // ignore: cast_nullable_to_non_nullable
              as List<int>,
      solutions: null == solutions
          ? _value._solutions
          : solutions // ignore: cast_nullable_to_non_nullable
              as List<double>,
      solutionsString: null == solutionsString
          ? _value._solutionsString
          : solutionsString // ignore: cast_nullable_to_non_nullable
              as List<String>,
      matrix: null == matrix
          ? _value._matrix
          : matrix // ignore: cast_nullable_to_non_nullable
              as List<List<double>>,
      solutionString: freezed == solutionString
          ? _value.solutionString
          : solutionString // ignore: cast_nullable_to_non_nullable
              as String?,
      objectiveFunctionSolution: freezed == objectiveFunctionSolution
          ? _value.objectiveFunctionSolution
          : objectiveFunctionSolution // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$StepsForAlgebraicImpl implements _StepsForAlgebraic {
  const _$StepsForAlgebraicImpl(
      {required this.header,
      required this.step,
      required final List<int> whereVarEqualsZero,
      required final List<double> solutions,
      required final List<String> solutionsString,
      required final List<List<double>> matrix,
      required this.solutionString,
      required this.objectiveFunctionSolution})
      : _whereVarEqualsZero = whereVarEqualsZero,
        _solutions = solutions,
        _solutionsString = solutionsString,
        _matrix = matrix;

  @override
  final String header;
  @override
  final int step;
  final List<int> _whereVarEqualsZero;
  @override
  List<int> get whereVarEqualsZero {
    if (_whereVarEqualsZero is EqualUnmodifiableListView)
      return _whereVarEqualsZero;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_whereVarEqualsZero);
  }

  final List<double> _solutions;
  @override
  List<double> get solutions {
    if (_solutions is EqualUnmodifiableListView) return _solutions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_solutions);
  }

  final List<String> _solutionsString;
  @override
  List<String> get solutionsString {
    if (_solutionsString is EqualUnmodifiableListView) return _solutionsString;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_solutionsString);
  }

  final List<List<double>> _matrix;
  @override
  List<List<double>> get matrix {
    if (_matrix is EqualUnmodifiableListView) return _matrix;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_matrix);
  }

  @override
  final String? solutionString;
  @override
  final double? objectiveFunctionSolution;

  @override
  String toString() {
    return 'StepsForAlgebraic(header: $header, step: $step, whereVarEqualsZero: $whereVarEqualsZero, solutions: $solutions, solutionsString: $solutionsString, matrix: $matrix, solutionString: $solutionString, objectiveFunctionSolution: $objectiveFunctionSolution)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StepsForAlgebraicImpl &&
            (identical(other.header, header) || other.header == header) &&
            (identical(other.step, step) || other.step == step) &&
            const DeepCollectionEquality()
                .equals(other._whereVarEqualsZero, _whereVarEqualsZero) &&
            const DeepCollectionEquality()
                .equals(other._solutions, _solutions) &&
            const DeepCollectionEquality()
                .equals(other._solutionsString, _solutionsString) &&
            const DeepCollectionEquality().equals(other._matrix, _matrix) &&
            (identical(other.solutionString, solutionString) ||
                other.solutionString == solutionString) &&
            (identical(other.objectiveFunctionSolution,
                    objectiveFunctionSolution) ||
                other.objectiveFunctionSolution == objectiveFunctionSolution));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      header,
      step,
      const DeepCollectionEquality().hash(_whereVarEqualsZero),
      const DeepCollectionEquality().hash(_solutions),
      const DeepCollectionEquality().hash(_solutionsString),
      const DeepCollectionEquality().hash(_matrix),
      solutionString,
      objectiveFunctionSolution);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StepsForAlgebraicImplCopyWith<_$StepsForAlgebraicImpl> get copyWith =>
      __$$StepsForAlgebraicImplCopyWithImpl<_$StepsForAlgebraicImpl>(
          this, _$identity);
}

abstract class _StepsForAlgebraic implements StepsForAlgebraic {
  const factory _StepsForAlgebraic(
          {required final String header,
          required final int step,
          required final List<int> whereVarEqualsZero,
          required final List<double> solutions,
          required final List<String> solutionsString,
          required final List<List<double>> matrix,
          required final String? solutionString,
          required final double? objectiveFunctionSolution}) =
      _$StepsForAlgebraicImpl;

  @override
  String get header;
  @override
  int get step;
  @override
  List<int> get whereVarEqualsZero;
  @override
  List<double> get solutions;
  @override
  List<String> get solutionsString;
  @override
  List<List<double>> get matrix;
  @override
  String? get solutionString;
  @override
  double? get objectiveFunctionSolution;
  @override
  @JsonKey(ignore: true)
  _$$StepsForAlgebraicImplCopyWith<_$StepsForAlgebraicImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AnswerForAlgebraic {
  double get definitiveSolution => throw _privateConstructorUsedError;
  String? get finalSolutionString => throw _privateConstructorUsedError;
  int get step => throw _privateConstructorUsedError;
  List<StepsForAlgebraic> get steps => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnswerForAlgebraicCopyWith<AnswerForAlgebraic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerForAlgebraicCopyWith<$Res> {
  factory $AnswerForAlgebraicCopyWith(
          AnswerForAlgebraic value, $Res Function(AnswerForAlgebraic) then) =
      _$AnswerForAlgebraicCopyWithImpl<$Res, AnswerForAlgebraic>;
  @useResult
  $Res call(
      {double definitiveSolution,
      String? finalSolutionString,
      int step,
      List<StepsForAlgebraic> steps});
}

/// @nodoc
class _$AnswerForAlgebraicCopyWithImpl<$Res, $Val extends AnswerForAlgebraic>
    implements $AnswerForAlgebraicCopyWith<$Res> {
  _$AnswerForAlgebraicCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? definitiveSolution = null,
    Object? finalSolutionString = freezed,
    Object? step = null,
    Object? steps = null,
  }) {
    return _then(_value.copyWith(
      definitiveSolution: null == definitiveSolution
          ? _value.definitiveSolution
          : definitiveSolution // ignore: cast_nullable_to_non_nullable
              as double,
      finalSolutionString: freezed == finalSolutionString
          ? _value.finalSolutionString
          : finalSolutionString // ignore: cast_nullable_to_non_nullable
              as String?,
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int,
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<StepsForAlgebraic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnswerForAlgebraicImplCopyWith<$Res>
    implements $AnswerForAlgebraicCopyWith<$Res> {
  factory _$$AnswerForAlgebraicImplCopyWith(_$AnswerForAlgebraicImpl value,
          $Res Function(_$AnswerForAlgebraicImpl) then) =
      __$$AnswerForAlgebraicImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double definitiveSolution,
      String? finalSolutionString,
      int step,
      List<StepsForAlgebraic> steps});
}

/// @nodoc
class __$$AnswerForAlgebraicImplCopyWithImpl<$Res>
    extends _$AnswerForAlgebraicCopyWithImpl<$Res, _$AnswerForAlgebraicImpl>
    implements _$$AnswerForAlgebraicImplCopyWith<$Res> {
  __$$AnswerForAlgebraicImplCopyWithImpl(_$AnswerForAlgebraicImpl _value,
      $Res Function(_$AnswerForAlgebraicImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? definitiveSolution = null,
    Object? finalSolutionString = freezed,
    Object? step = null,
    Object? steps = null,
  }) {
    return _then(_$AnswerForAlgebraicImpl(
      definitiveSolution: null == definitiveSolution
          ? _value.definitiveSolution
          : definitiveSolution // ignore: cast_nullable_to_non_nullable
              as double,
      finalSolutionString: freezed == finalSolutionString
          ? _value.finalSolutionString
          : finalSolutionString // ignore: cast_nullable_to_non_nullable
              as String?,
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int,
      steps: null == steps
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<StepsForAlgebraic>,
    ));
  }
}

/// @nodoc

class _$AnswerForAlgebraicImpl implements _AnswerForAlgebraic {
  const _$AnswerForAlgebraicImpl(
      {required this.definitiveSolution,
      required this.finalSolutionString,
      required this.step,
      required final List<StepsForAlgebraic> steps})
      : _steps = steps;

  @override
  final double definitiveSolution;
  @override
  final String? finalSolutionString;
  @override
  final int step;
  final List<StepsForAlgebraic> _steps;
  @override
  List<StepsForAlgebraic> get steps {
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

  @override
  String toString() {
    return 'AnswerForAlgebraic(definitiveSolution: $definitiveSolution, finalSolutionString: $finalSolutionString, step: $step, steps: $steps)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswerForAlgebraicImpl &&
            (identical(other.definitiveSolution, definitiveSolution) ||
                other.definitiveSolution == definitiveSolution) &&
            (identical(other.finalSolutionString, finalSolutionString) ||
                other.finalSolutionString == finalSolutionString) &&
            (identical(other.step, step) || other.step == step) &&
            const DeepCollectionEquality().equals(other._steps, _steps));
  }

  @override
  int get hashCode => Object.hash(runtimeType, definitiveSolution,
      finalSolutionString, step, const DeepCollectionEquality().hash(_steps));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnswerForAlgebraicImplCopyWith<_$AnswerForAlgebraicImpl> get copyWith =>
      __$$AnswerForAlgebraicImplCopyWithImpl<_$AnswerForAlgebraicImpl>(
          this, _$identity);
}

abstract class _AnswerForAlgebraic implements AnswerForAlgebraic {
  const factory _AnswerForAlgebraic(
      {required final double definitiveSolution,
      required final String? finalSolutionString,
      required final int step,
      required final List<StepsForAlgebraic> steps}) = _$AnswerForAlgebraicImpl;

  @override
  double get definitiveSolution;
  @override
  String? get finalSolutionString;
  @override
  int get step;
  @override
  List<StepsForAlgebraic> get steps;
  @override
  @JsonKey(ignore: true)
  _$$AnswerForAlgebraicImplCopyWith<_$AnswerForAlgebraicImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
