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
mixin _$DataModelForGraphic {
  List<({double x, double y})> get intersections =>
      throw _privateConstructorUsedError;
  double get maxX => throw _privateConstructorUsedError;
  double get maxY => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DataModelForGraphicCopyWith<DataModelForGraphic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataModelForGraphicCopyWith<$Res> {
  factory $DataModelForGraphicCopyWith(
          DataModelForGraphic value, $Res Function(DataModelForGraphic) then) =
      _$DataModelForGraphicCopyWithImpl<$Res, DataModelForGraphic>;
  @useResult
  $Res call(
      {List<({double x, double y})> intersections, double maxX, double maxY});
}

/// @nodoc
class _$DataModelForGraphicCopyWithImpl<$Res, $Val extends DataModelForGraphic>
    implements $DataModelForGraphicCopyWith<$Res> {
  _$DataModelForGraphicCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? intersections = null,
    Object? maxX = null,
    Object? maxY = null,
  }) {
    return _then(_value.copyWith(
      intersections: null == intersections
          ? _value.intersections
          : intersections // ignore: cast_nullable_to_non_nullable
              as List<({double x, double y})>,
      maxX: null == maxX
          ? _value.maxX
          : maxX // ignore: cast_nullable_to_non_nullable
              as double,
      maxY: null == maxY
          ? _value.maxY
          : maxY // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DataModelForGraphicCopyWith<$Res>
    implements $DataModelForGraphicCopyWith<$Res> {
  factory _$$_DataModelForGraphicCopyWith(_$_DataModelForGraphic value,
          $Res Function(_$_DataModelForGraphic) then) =
      __$$_DataModelForGraphicCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<({double x, double y})> intersections, double maxX, double maxY});
}

/// @nodoc
class __$$_DataModelForGraphicCopyWithImpl<$Res>
    extends _$DataModelForGraphicCopyWithImpl<$Res, _$_DataModelForGraphic>
    implements _$$_DataModelForGraphicCopyWith<$Res> {
  __$$_DataModelForGraphicCopyWithImpl(_$_DataModelForGraphic _value,
      $Res Function(_$_DataModelForGraphic) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? intersections = null,
    Object? maxX = null,
    Object? maxY = null,
  }) {
    return _then(_$_DataModelForGraphic(
      intersections: null == intersections
          ? _value._intersections
          : intersections // ignore: cast_nullable_to_non_nullable
              as List<({double x, double y})>,
      maxX: null == maxX
          ? _value.maxX
          : maxX // ignore: cast_nullable_to_non_nullable
              as double,
      maxY: null == maxY
          ? _value.maxY
          : maxY // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_DataModelForGraphic implements _DataModelForGraphic {
  const _$_DataModelForGraphic(
      {required final List<({double x, double y})> intersections,
      required this.maxX,
      required this.maxY})
      : _intersections = intersections;

  final List<({double x, double y})> _intersections;
  @override
  List<({double x, double y})> get intersections {
    if (_intersections is EqualUnmodifiableListView) return _intersections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_intersections);
  }

  @override
  final double maxX;
  @override
  final double maxY;

  @override
  String toString() {
    return 'DataModelForGraphic(intersections: $intersections, maxX: $maxX, maxY: $maxY)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DataModelForGraphic &&
            const DeepCollectionEquality()
                .equals(other._intersections, _intersections) &&
            (identical(other.maxX, maxX) || other.maxX == maxX) &&
            (identical(other.maxY, maxY) || other.maxY == maxY));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_intersections), maxX, maxY);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DataModelForGraphicCopyWith<_$_DataModelForGraphic> get copyWith =>
      __$$_DataModelForGraphicCopyWithImpl<_$_DataModelForGraphic>(
          this, _$identity);
}

abstract class _DataModelForGraphic implements DataModelForGraphic {
  const factory _DataModelForGraphic(
      {required final List<({double x, double y})> intersections,
      required final double maxX,
      required final double maxY}) = _$_DataModelForGraphic;

  @override
  List<({double x, double y})> get intersections;
  @override
  double get maxX;
  @override
  double get maxY;
  @override
  @JsonKey(ignore: true)
  _$$_DataModelForGraphicCopyWith<_$_DataModelForGraphic> get copyWith =>
      throw _privateConstructorUsedError;
}
