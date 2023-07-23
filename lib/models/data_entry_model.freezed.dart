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
abstract class _$$_DataEntryModelCopyWith<$Res>
    implements $DataEntryModelCopyWith<$Res> {
  factory _$$_DataEntryModelCopyWith(
          _$_DataEntryModel value, $Res Function(_$_DataEntryModel) then) =
      __$$_DataEntryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Objectives objective,
      List<double> objectiveFunction,
      List<Operators> operators,
      List<List<double>> constraints});
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
    Object? objective = null,
    Object? objectiveFunction = null,
    Object? operators = null,
    Object? constraints = null,
  }) {
    return _then(_$_DataEntryModel(
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
class _$_DataEntryModel implements _DataEntryModel {
  const _$_DataEntryModel(
      {required this.objective,
      required final List<double> objectiveFunction,
      required final List<Operators> operators,
      required final List<List<double>> constraints})
      : _objectiveFunction = objectiveFunction,
        _operators = operators,
        _constraints = constraints;

  factory _$_DataEntryModel.fromJson(Map<String, dynamic> json) =>
      _$$_DataEntryModelFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DataEntryModel &&
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
      {required final Objectives objective,
      required final List<double> objectiveFunction,
      required final List<Operators> operators,
      required final List<List<double>> constraints}) = _$_DataEntryModel;

  factory _DataEntryModel.fromJson(Map<String, dynamic> json) =
      _$_DataEntryModel.fromJson;

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
  _$$_DataEntryModelCopyWith<_$_DataEntryModel> get copyWith =>
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
abstract class _$$_DataModelForAlgebraicCopyWith<$Res>
    implements $DataModelForAlgebraicCopyWith<$Res> {
  factory _$$_DataModelForAlgebraicCopyWith(_$_DataModelForAlgebraic value,
          $Res Function(_$_DataModelForAlgebraic) then) =
      __$$_DataModelForAlgebraicCopyWithImpl<$Res>;
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
class __$$_DataModelForAlgebraicCopyWithImpl<$Res>
    extends _$DataModelForAlgebraicCopyWithImpl<$Res, _$_DataModelForAlgebraic>
    implements _$$_DataModelForAlgebraicCopyWith<$Res> {
  __$$_DataModelForAlgebraicCopyWithImpl(_$_DataModelForAlgebraic _value,
      $Res Function(_$_DataModelForAlgebraic) _then)
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
    return _then(_$_DataModelForAlgebraic(
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

class _$_DataModelForAlgebraic implements _DataModelForAlgebraic {
  const _$_DataModelForAlgebraic(
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
            other is _$_DataModelForAlgebraic &&
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
  _$$_DataModelForAlgebraicCopyWith<_$_DataModelForAlgebraic> get copyWith =>
      __$$_DataModelForAlgebraicCopyWithImpl<_$_DataModelForAlgebraic>(
          this, _$identity);
}

abstract class _DataModelForAlgebraic implements DataModelForAlgebraic {
  const factory _DataModelForAlgebraic(
      {required final List<List<double>> standardForm,
      required final List<List<double>> constraintWithSlack,
      required final List<List<String>> constraintsString,
      required final List<double> rightSide,
      required final List<String> rightSideString,
      required final String greaterThanZeroCondition,
      required final String combinationsEquation}) = _$_DataModelForAlgebraic;

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
  _$$_DataModelForAlgebraicCopyWith<_$_DataModelForAlgebraic> get copyWith =>
      throw _privateConstructorUsedError;
}
