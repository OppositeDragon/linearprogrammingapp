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
  List<List<List<String>>> get tableaus => throw _privateConstructorUsedError;
  List<Point<int>> get pivotsCoordinates => throw _privateConstructorUsedError;
  List<List<List<String>>>? get tableaus1st =>
      throw _privateConstructorUsedError;
  List<Point<int>>? get pivotsCoordinates1st =>
      throw _privateConstructorUsedError;
  List<int>? get artificialVariablesIndexes =>
      throw _privateConstructorUsedError;
  AnswerPresentationModel? get answerPresentation =>
      throw _privateConstructorUsedError;

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
      List<List<List<String>>> tableaus,
      List<Point<int>> pivotsCoordinates,
      List<List<List<String>>>? tableaus1st,
      List<Point<int>>? pivotsCoordinates1st,
      List<int>? artificialVariablesIndexes,
      AnswerPresentationModel? answerPresentation});

  $AnswerPresentationModelCopyWith<$Res>? get answerPresentation;
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
    Object? tableaus = null,
    Object? pivotsCoordinates = null,
    Object? tableaus1st = freezed,
    Object? pivotsCoordinates1st = freezed,
    Object? artificialVariablesIndexes = freezed,
    Object? answerPresentation = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SimplexStatus,
      tableaus: null == tableaus
          ? _value.tableaus
          : tableaus // ignore: cast_nullable_to_non_nullable
              as List<List<List<String>>>,
      pivotsCoordinates: null == pivotsCoordinates
          ? _value.pivotsCoordinates
          : pivotsCoordinates // ignore: cast_nullable_to_non_nullable
              as List<Point<int>>,
      tableaus1st: freezed == tableaus1st
          ? _value.tableaus1st
          : tableaus1st // ignore: cast_nullable_to_non_nullable
              as List<List<List<String>>>?,
      pivotsCoordinates1st: freezed == pivotsCoordinates1st
          ? _value.pivotsCoordinates1st
          : pivotsCoordinates1st // ignore: cast_nullable_to_non_nullable
              as List<Point<int>>?,
      artificialVariablesIndexes: freezed == artificialVariablesIndexes
          ? _value.artificialVariablesIndexes
          : artificialVariablesIndexes // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      answerPresentation: freezed == answerPresentation
          ? _value.answerPresentation
          : answerPresentation // ignore: cast_nullable_to_non_nullable
              as AnswerPresentationModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AnswerPresentationModelCopyWith<$Res>? get answerPresentation {
    if (_value.answerPresentation == null) {
      return null;
    }

    return $AnswerPresentationModelCopyWith<$Res>(_value.answerPresentation!,
        (value) {
      return _then(_value.copyWith(answerPresentation: value) as $Val);
    });
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
      List<List<List<String>>> tableaus,
      List<Point<int>> pivotsCoordinates,
      List<List<List<String>>>? tableaus1st,
      List<Point<int>>? pivotsCoordinates1st,
      List<int>? artificialVariablesIndexes,
      AnswerPresentationModel? answerPresentation});

  @override
  $AnswerPresentationModelCopyWith<$Res>? get answerPresentation;
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
    Object? tableaus = null,
    Object? pivotsCoordinates = null,
    Object? tableaus1st = freezed,
    Object? pivotsCoordinates1st = freezed,
    Object? artificialVariablesIndexes = freezed,
    Object? answerPresentation = freezed,
  }) {
    return _then(_$SimplexDataModelImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SimplexStatus,
      tableaus: null == tableaus
          ? _value._tableaus
          : tableaus // ignore: cast_nullable_to_non_nullable
              as List<List<List<String>>>,
      pivotsCoordinates: null == pivotsCoordinates
          ? _value._pivotsCoordinates
          : pivotsCoordinates // ignore: cast_nullable_to_non_nullable
              as List<Point<int>>,
      tableaus1st: freezed == tableaus1st
          ? _value._tableaus1st
          : tableaus1st // ignore: cast_nullable_to_non_nullable
              as List<List<List<String>>>?,
      pivotsCoordinates1st: freezed == pivotsCoordinates1st
          ? _value._pivotsCoordinates1st
          : pivotsCoordinates1st // ignore: cast_nullable_to_non_nullable
              as List<Point<int>>?,
      artificialVariablesIndexes: freezed == artificialVariablesIndexes
          ? _value._artificialVariablesIndexes
          : artificialVariablesIndexes // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      answerPresentation: freezed == answerPresentation
          ? _value.answerPresentation
          : answerPresentation // ignore: cast_nullable_to_non_nullable
              as AnswerPresentationModel?,
    ));
  }
}

/// @nodoc

class _$SimplexDataModelImpl extends _SimplexDataModel {
  const _$SimplexDataModelImpl(
      {required this.status,
      required final List<List<List<String>>> tableaus,
      required final List<Point<int>> pivotsCoordinates,
      final List<List<List<String>>>? tableaus1st = null,
      final List<Point<int>>? pivotsCoordinates1st = null,
      final List<int>? artificialVariablesIndexes = null,
      this.answerPresentation})
      : _tableaus = tableaus,
        _pivotsCoordinates = pivotsCoordinates,
        _tableaus1st = tableaus1st,
        _pivotsCoordinates1st = pivotsCoordinates1st,
        _artificialVariablesIndexes = artificialVariablesIndexes,
        super._();

  @override
  final SimplexStatus status;
  final List<List<List<String>>> _tableaus;
  @override
  List<List<List<String>>> get tableaus {
    if (_tableaus is EqualUnmodifiableListView) return _tableaus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tableaus);
  }

  final List<Point<int>> _pivotsCoordinates;
  @override
  List<Point<int>> get pivotsCoordinates {
    if (_pivotsCoordinates is EqualUnmodifiableListView)
      return _pivotsCoordinates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pivotsCoordinates);
  }

  final List<List<List<String>>>? _tableaus1st;
  @override
  @JsonKey()
  List<List<List<String>>>? get tableaus1st {
    final value = _tableaus1st;
    if (value == null) return null;
    if (_tableaus1st is EqualUnmodifiableListView) return _tableaus1st;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Point<int>>? _pivotsCoordinates1st;
  @override
  @JsonKey()
  List<Point<int>>? get pivotsCoordinates1st {
    final value = _pivotsCoordinates1st;
    if (value == null) return null;
    if (_pivotsCoordinates1st is EqualUnmodifiableListView)
      return _pivotsCoordinates1st;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int>? _artificialVariablesIndexes;
  @override
  @JsonKey()
  List<int>? get artificialVariablesIndexes {
    final value = _artificialVariablesIndexes;
    if (value == null) return null;
    if (_artificialVariablesIndexes is EqualUnmodifiableListView)
      return _artificialVariablesIndexes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final AnswerPresentationModel? answerPresentation;

  @override
  String toString() {
    return 'SimplexDataModel(status: $status, tableaus: $tableaus, pivotsCoordinates: $pivotsCoordinates, tableaus1st: $tableaus1st, pivotsCoordinates1st: $pivotsCoordinates1st, artificialVariablesIndexes: $artificialVariablesIndexes, answerPresentation: $answerPresentation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SimplexDataModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._tableaus, _tableaus) &&
            const DeepCollectionEquality()
                .equals(other._pivotsCoordinates, _pivotsCoordinates) &&
            const DeepCollectionEquality()
                .equals(other._tableaus1st, _tableaus1st) &&
            const DeepCollectionEquality()
                .equals(other._pivotsCoordinates1st, _pivotsCoordinates1st) &&
            const DeepCollectionEquality().equals(
                other._artificialVariablesIndexes,
                _artificialVariablesIndexes) &&
            (identical(other.answerPresentation, answerPresentation) ||
                other.answerPresentation == answerPresentation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_tableaus),
      const DeepCollectionEquality().hash(_pivotsCoordinates),
      const DeepCollectionEquality().hash(_tableaus1st),
      const DeepCollectionEquality().hash(_pivotsCoordinates1st),
      const DeepCollectionEquality().hash(_artificialVariablesIndexes),
      answerPresentation);

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
          required final List<List<List<String>>> tableaus,
          required final List<Point<int>> pivotsCoordinates,
          final List<List<List<String>>>? tableaus1st,
          final List<Point<int>>? pivotsCoordinates1st,
          final List<int>? artificialVariablesIndexes,
          final AnswerPresentationModel? answerPresentation}) =
      _$SimplexDataModelImpl;
  const _SimplexDataModel._() : super._();

  @override
  SimplexStatus get status;
  @override
  List<List<List<String>>> get tableaus;
  @override
  List<Point<int>> get pivotsCoordinates;
  @override
  List<List<List<String>>>? get tableaus1st;
  @override
  List<Point<int>>? get pivotsCoordinates1st;
  @override
  List<int>? get artificialVariablesIndexes;
  @override
  AnswerPresentationModel? get answerPresentation;
  @override
  @JsonKey(ignore: true)
  _$$SimplexDataModelImplCopyWith<_$SimplexDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TabularFormInformation {
  List<List<double>> get matrix => throw _privateConstructorUsedError;
  List<int> get basicVariables => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TabularFormInformationCopyWith<TabularFormInformation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TabularFormInformationCopyWith<$Res> {
  factory $TabularFormInformationCopyWith(TabularFormInformation value,
          $Res Function(TabularFormInformation) then) =
      _$TabularFormInformationCopyWithImpl<$Res, TabularFormInformation>;
  @useResult
  $Res call({List<List<double>> matrix, List<int> basicVariables});
}

/// @nodoc
class _$TabularFormInformationCopyWithImpl<$Res,
        $Val extends TabularFormInformation>
    implements $TabularFormInformationCopyWith<$Res> {
  _$TabularFormInformationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matrix = null,
    Object? basicVariables = null,
  }) {
    return _then(_value.copyWith(
      matrix: null == matrix
          ? _value.matrix
          : matrix // ignore: cast_nullable_to_non_nullable
              as List<List<double>>,
      basicVariables: null == basicVariables
          ? _value.basicVariables
          : basicVariables // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TabularFormInformationImplCopyWith<$Res>
    implements $TabularFormInformationCopyWith<$Res> {
  factory _$$TabularFormInformationImplCopyWith(
          _$TabularFormInformationImpl value,
          $Res Function(_$TabularFormInformationImpl) then) =
      __$$TabularFormInformationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<List<double>> matrix, List<int> basicVariables});
}

/// @nodoc
class __$$TabularFormInformationImplCopyWithImpl<$Res>
    extends _$TabularFormInformationCopyWithImpl<$Res,
        _$TabularFormInformationImpl>
    implements _$$TabularFormInformationImplCopyWith<$Res> {
  __$$TabularFormInformationImplCopyWithImpl(
      _$TabularFormInformationImpl _value,
      $Res Function(_$TabularFormInformationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matrix = null,
    Object? basicVariables = null,
  }) {
    return _then(_$TabularFormInformationImpl(
      matrix: null == matrix
          ? _value._matrix
          : matrix // ignore: cast_nullable_to_non_nullable
              as List<List<double>>,
      basicVariables: null == basicVariables
          ? _value._basicVariables
          : basicVariables // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$TabularFormInformationImpl extends _TabularFormInformation {
  const _$TabularFormInformationImpl(
      {required final List<List<double>> matrix,
      required final List<int> basicVariables})
      : _matrix = matrix,
        _basicVariables = basicVariables,
        super._();

  final List<List<double>> _matrix;
  @override
  List<List<double>> get matrix {
    if (_matrix is EqualUnmodifiableListView) return _matrix;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_matrix);
  }

  final List<int> _basicVariables;
  @override
  List<int> get basicVariables {
    if (_basicVariables is EqualUnmodifiableListView) return _basicVariables;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_basicVariables);
  }

  @override
  String toString() {
    return 'TabularFormInformation(matrix: $matrix, basicVariables: $basicVariables)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TabularFormInformationImpl &&
            const DeepCollectionEquality().equals(other._matrix, _matrix) &&
            const DeepCollectionEquality()
                .equals(other._basicVariables, _basicVariables));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_matrix),
      const DeepCollectionEquality().hash(_basicVariables));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TabularFormInformationImplCopyWith<_$TabularFormInformationImpl>
      get copyWith => __$$TabularFormInformationImplCopyWithImpl<
          _$TabularFormInformationImpl>(this, _$identity);
}

abstract class _TabularFormInformation extends TabularFormInformation {
  const factory _TabularFormInformation(
      {required final List<List<double>> matrix,
      required final List<int> basicVariables}) = _$TabularFormInformationImpl;
  const _TabularFormInformation._() : super._();

  @override
  List<List<double>> get matrix;
  @override
  List<int> get basicVariables;
  @override
  @JsonKey(ignore: true)
  _$$TabularFormInformationImplCopyWith<_$TabularFormInformationImpl>
      get copyWith => throw _privateConstructorUsedError;
}
