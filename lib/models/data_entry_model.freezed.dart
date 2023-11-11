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
mixin _$DataModelForGraphic {
  List<Point<num>> get intersections => throw _privateConstructorUsedError;
  Point<num> get max => throw _privateConstructorUsedError;

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
  $Res call({List<Point<num>> intersections, Point<num> max});
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
    Object? max = null,
  }) {
    return _then(_value.copyWith(
      intersections: null == intersections
          ? _value.intersections
          : intersections // ignore: cast_nullable_to_non_nullable
              as List<Point<num>>,
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as Point<num>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataModelForGraphicImplCopyWith<$Res>
    implements $DataModelForGraphicCopyWith<$Res> {
  factory _$$DataModelForGraphicImplCopyWith(_$DataModelForGraphicImpl value,
          $Res Function(_$DataModelForGraphicImpl) then) =
      __$$DataModelForGraphicImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Point<num>> intersections, Point<num> max});
}

/// @nodoc
class __$$DataModelForGraphicImplCopyWithImpl<$Res>
    extends _$DataModelForGraphicCopyWithImpl<$Res, _$DataModelForGraphicImpl>
    implements _$$DataModelForGraphicImplCopyWith<$Res> {
  __$$DataModelForGraphicImplCopyWithImpl(_$DataModelForGraphicImpl _value,
      $Res Function(_$DataModelForGraphicImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? intersections = null,
    Object? max = null,
  }) {
    return _then(_$DataModelForGraphicImpl(
      intersections: null == intersections
          ? _value._intersections
          : intersections // ignore: cast_nullable_to_non_nullable
              as List<Point<num>>,
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as Point<num>,
    ));
  }
}

/// @nodoc

class _$DataModelForGraphicImpl implements _DataModelForGraphic {
  const _$DataModelForGraphicImpl(
      {required final List<Point<num>> intersections, required this.max})
      : _intersections = intersections;

  final List<Point<num>> _intersections;
  @override
  List<Point<num>> get intersections {
    if (_intersections is EqualUnmodifiableListView) return _intersections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_intersections);
  }

  @override
  final Point<num> max;

  @override
  String toString() {
    return 'DataModelForGraphic(intersections: $intersections, max: $max)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataModelForGraphicImpl &&
            const DeepCollectionEquality()
                .equals(other._intersections, _intersections) &&
            (identical(other.max, max) || other.max == max));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_intersections), max);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataModelForGraphicImplCopyWith<_$DataModelForGraphicImpl> get copyWith =>
      __$$DataModelForGraphicImplCopyWithImpl<_$DataModelForGraphicImpl>(
          this, _$identity);
}

abstract class _DataModelForGraphic implements DataModelForGraphic {
  const factory _DataModelForGraphic(
      {required final List<Point<num>> intersections,
      required final Point<num> max}) = _$DataModelForGraphicImpl;

  @override
  List<Point<num>> get intersections;
  @override
  Point<num> get max;
  @override
  @JsonKey(ignore: true)
  _$$DataModelForGraphicImplCopyWith<_$DataModelForGraphicImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
