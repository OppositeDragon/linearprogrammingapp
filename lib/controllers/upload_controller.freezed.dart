// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UploadState {
  bool get showHelpMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UploadStateCopyWith<UploadState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadStateCopyWith<$Res> {
  factory $UploadStateCopyWith(
          UploadState value, $Res Function(UploadState) then) =
      _$UploadStateCopyWithImpl<$Res, UploadState>;
  @useResult
  $Res call({bool showHelpMessage});
}

/// @nodoc
class _$UploadStateCopyWithImpl<$Res, $Val extends UploadState>
    implements $UploadStateCopyWith<$Res> {
  _$UploadStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showHelpMessage = null,
  }) {
    return _then(_value.copyWith(
      showHelpMessage: null == showHelpMessage
          ? _value.showHelpMessage
          : showHelpMessage // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadStateImplCopyWith<$Res>
    implements $UploadStateCopyWith<$Res> {
  factory _$$UploadStateImplCopyWith(
          _$UploadStateImpl value, $Res Function(_$UploadStateImpl) then) =
      __$$UploadStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool showHelpMessage});
}

/// @nodoc
class __$$UploadStateImplCopyWithImpl<$Res>
    extends _$UploadStateCopyWithImpl<$Res, _$UploadStateImpl>
    implements _$$UploadStateImplCopyWith<$Res> {
  __$$UploadStateImplCopyWithImpl(
      _$UploadStateImpl _value, $Res Function(_$UploadStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showHelpMessage = null,
  }) {
    return _then(_$UploadStateImpl(
      showHelpMessage: null == showHelpMessage
          ? _value.showHelpMessage
          : showHelpMessage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UploadStateImpl extends _UploadState {
  const _$UploadStateImpl({this.showHelpMessage = false}) : super._();

  @override
  @JsonKey()
  final bool showHelpMessage;

  @override
  String toString() {
    return 'UploadState(showHelpMessage: $showHelpMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadStateImpl &&
            (identical(other.showHelpMessage, showHelpMessage) ||
                other.showHelpMessage == showHelpMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, showHelpMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadStateImplCopyWith<_$UploadStateImpl> get copyWith =>
      __$$UploadStateImplCopyWithImpl<_$UploadStateImpl>(this, _$identity);
}

abstract class _UploadState extends UploadState {
  const factory _UploadState({final bool showHelpMessage}) = _$UploadStateImpl;
  const _UploadState._() : super._();

  @override
  bool get showHelpMessage;
  @override
  @JsonKey(ignore: true)
  _$$UploadStateImplCopyWith<_$UploadStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
