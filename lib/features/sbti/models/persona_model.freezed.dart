// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'persona_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PersonaResponse _$PersonaResponseFromJson(Map<String, dynamic> json) {
  return _PersonaResponse.fromJson(json);
}

/// @nodoc
mixin _$PersonaResponse {
  Persona? get persona => throw _privateConstructorUsedError;

  /// Serializes this PersonaResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PersonaResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PersonaResponseCopyWith<PersonaResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonaResponseCopyWith<$Res> {
  factory $PersonaResponseCopyWith(
          PersonaResponse value, $Res Function(PersonaResponse) then) =
      _$PersonaResponseCopyWithImpl<$Res, PersonaResponse>;
  @useResult
  $Res call({Persona? persona});

  $PersonaCopyWith<$Res>? get persona;
}

/// @nodoc
class _$PersonaResponseCopyWithImpl<$Res, $Val extends PersonaResponse>
    implements $PersonaResponseCopyWith<$Res> {
  _$PersonaResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PersonaResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? persona = freezed,
  }) {
    return _then(_value.copyWith(
      persona: freezed == persona
          ? _value.persona
          : persona // ignore: cast_nullable_to_non_nullable
              as Persona?,
    ) as $Val);
  }

  /// Create a copy of PersonaResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PersonaCopyWith<$Res>? get persona {
    if (_value.persona == null) {
      return null;
    }

    return $PersonaCopyWith<$Res>(_value.persona!, (value) {
      return _then(_value.copyWith(persona: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PersonaResponseImplCopyWith<$Res>
    implements $PersonaResponseCopyWith<$Res> {
  factory _$$PersonaResponseImplCopyWith(_$PersonaResponseImpl value,
          $Res Function(_$PersonaResponseImpl) then) =
      __$$PersonaResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Persona? persona});

  @override
  $PersonaCopyWith<$Res>? get persona;
}

/// @nodoc
class __$$PersonaResponseImplCopyWithImpl<$Res>
    extends _$PersonaResponseCopyWithImpl<$Res, _$PersonaResponseImpl>
    implements _$$PersonaResponseImplCopyWith<$Res> {
  __$$PersonaResponseImplCopyWithImpl(
      _$PersonaResponseImpl _value, $Res Function(_$PersonaResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PersonaResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? persona = freezed,
  }) {
    return _then(_$PersonaResponseImpl(
      persona: freezed == persona
          ? _value.persona
          : persona // ignore: cast_nullable_to_non_nullable
              as Persona?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonaResponseImpl implements _PersonaResponse {
  const _$PersonaResponseImpl({this.persona});

  factory _$PersonaResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonaResponseImplFromJson(json);

  @override
  final Persona? persona;

  @override
  String toString() {
    return 'PersonaResponse(persona: $persona)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonaResponseImpl &&
            (identical(other.persona, persona) || other.persona == persona));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, persona);

  /// Create a copy of PersonaResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonaResponseImplCopyWith<_$PersonaResponseImpl> get copyWith =>
      __$$PersonaResponseImplCopyWithImpl<_$PersonaResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonaResponseImplToJson(
      this,
    );
  }
}

abstract class _PersonaResponse implements PersonaResponse {
  const factory _PersonaResponse({final Persona? persona}) =
      _$PersonaResponseImpl;

  factory _PersonaResponse.fromJson(Map<String, dynamic> json) =
      _$PersonaResponseImpl.fromJson;

  @override
  Persona? get persona;

  /// Create a copy of PersonaResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PersonaResponseImplCopyWith<_$PersonaResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Persona _$PersonaFromJson(Map<String, dynamic> json) {
  return _Persona.fromJson(json);
}

/// @nodoc
mixin _$Persona {
  @JsonKey(name: 'persona_type')
  String get personaType => throw _privateConstructorUsedError;
  @JsonKey(name: 'd_vs_n')
  AxisDetail get dVsN => throw _privateConstructorUsedError;
  @JsonKey(name: 's_vs_a')
  AxisDetail get sVsA => throw _privateConstructorUsedError;
  @JsonKey(name: 'm_vs_t')
  AxisDetail get mVsT => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this Persona to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Persona
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PersonaCopyWith<Persona> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonaCopyWith<$Res> {
  factory $PersonaCopyWith(Persona value, $Res Function(Persona) then) =
      _$PersonaCopyWithImpl<$Res, Persona>;
  @useResult
  $Res call(
      {@JsonKey(name: 'persona_type') String personaType,
      @JsonKey(name: 'd_vs_n') AxisDetail dVsN,
      @JsonKey(name: 's_vs_a') AxisDetail sVsA,
      @JsonKey(name: 'm_vs_t') AxisDetail mVsT,
      String description});

  $AxisDetailCopyWith<$Res> get dVsN;
  $AxisDetailCopyWith<$Res> get sVsA;
  $AxisDetailCopyWith<$Res> get mVsT;
}

/// @nodoc
class _$PersonaCopyWithImpl<$Res, $Val extends Persona>
    implements $PersonaCopyWith<$Res> {
  _$PersonaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Persona
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? personaType = null,
    Object? dVsN = null,
    Object? sVsA = null,
    Object? mVsT = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      personaType: null == personaType
          ? _value.personaType
          : personaType // ignore: cast_nullable_to_non_nullable
              as String,
      dVsN: null == dVsN
          ? _value.dVsN
          : dVsN // ignore: cast_nullable_to_non_nullable
              as AxisDetail,
      sVsA: null == sVsA
          ? _value.sVsA
          : sVsA // ignore: cast_nullable_to_non_nullable
              as AxisDetail,
      mVsT: null == mVsT
          ? _value.mVsT
          : mVsT // ignore: cast_nullable_to_non_nullable
              as AxisDetail,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of Persona
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AxisDetailCopyWith<$Res> get dVsN {
    return $AxisDetailCopyWith<$Res>(_value.dVsN, (value) {
      return _then(_value.copyWith(dVsN: value) as $Val);
    });
  }

  /// Create a copy of Persona
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AxisDetailCopyWith<$Res> get sVsA {
    return $AxisDetailCopyWith<$Res>(_value.sVsA, (value) {
      return _then(_value.copyWith(sVsA: value) as $Val);
    });
  }

  /// Create a copy of Persona
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AxisDetailCopyWith<$Res> get mVsT {
    return $AxisDetailCopyWith<$Res>(_value.mVsT, (value) {
      return _then(_value.copyWith(mVsT: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PersonaImplCopyWith<$Res> implements $PersonaCopyWith<$Res> {
  factory _$$PersonaImplCopyWith(
          _$PersonaImpl value, $Res Function(_$PersonaImpl) then) =
      __$$PersonaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'persona_type') String personaType,
      @JsonKey(name: 'd_vs_n') AxisDetail dVsN,
      @JsonKey(name: 's_vs_a') AxisDetail sVsA,
      @JsonKey(name: 'm_vs_t') AxisDetail mVsT,
      String description});

  @override
  $AxisDetailCopyWith<$Res> get dVsN;
  @override
  $AxisDetailCopyWith<$Res> get sVsA;
  @override
  $AxisDetailCopyWith<$Res> get mVsT;
}

/// @nodoc
class __$$PersonaImplCopyWithImpl<$Res>
    extends _$PersonaCopyWithImpl<$Res, _$PersonaImpl>
    implements _$$PersonaImplCopyWith<$Res> {
  __$$PersonaImplCopyWithImpl(
      _$PersonaImpl _value, $Res Function(_$PersonaImpl) _then)
      : super(_value, _then);

  /// Create a copy of Persona
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? personaType = null,
    Object? dVsN = null,
    Object? sVsA = null,
    Object? mVsT = null,
    Object? description = null,
  }) {
    return _then(_$PersonaImpl(
      personaType: null == personaType
          ? _value.personaType
          : personaType // ignore: cast_nullable_to_non_nullable
              as String,
      dVsN: null == dVsN
          ? _value.dVsN
          : dVsN // ignore: cast_nullable_to_non_nullable
              as AxisDetail,
      sVsA: null == sVsA
          ? _value.sVsA
          : sVsA // ignore: cast_nullable_to_non_nullable
              as AxisDetail,
      mVsT: null == mVsT
          ? _value.mVsT
          : mVsT // ignore: cast_nullable_to_non_nullable
              as AxisDetail,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonaImpl implements _Persona {
  const _$PersonaImpl(
      {@JsonKey(name: 'persona_type') required this.personaType,
      @JsonKey(name: 'd_vs_n') required this.dVsN,
      @JsonKey(name: 's_vs_a') required this.sVsA,
      @JsonKey(name: 'm_vs_t') required this.mVsT,
      required this.description});

  factory _$PersonaImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonaImplFromJson(json);

  @override
  @JsonKey(name: 'persona_type')
  final String personaType;
  @override
  @JsonKey(name: 'd_vs_n')
  final AxisDetail dVsN;
  @override
  @JsonKey(name: 's_vs_a')
  final AxisDetail sVsA;
  @override
  @JsonKey(name: 'm_vs_t')
  final AxisDetail mVsT;
  @override
  final String description;

  @override
  String toString() {
    return 'Persona(personaType: $personaType, dVsN: $dVsN, sVsA: $sVsA, mVsT: $mVsT, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonaImpl &&
            (identical(other.personaType, personaType) ||
                other.personaType == personaType) &&
            (identical(other.dVsN, dVsN) || other.dVsN == dVsN) &&
            (identical(other.sVsA, sVsA) || other.sVsA == sVsA) &&
            (identical(other.mVsT, mVsT) || other.mVsT == mVsT) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, personaType, dVsN, sVsA, mVsT, description);

  /// Create a copy of Persona
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonaImplCopyWith<_$PersonaImpl> get copyWith =>
      __$$PersonaImplCopyWithImpl<_$PersonaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonaImplToJson(
      this,
    );
  }
}

abstract class _Persona implements Persona {
  const factory _Persona(
      {@JsonKey(name: 'persona_type') required final String personaType,
      @JsonKey(name: 'd_vs_n') required final AxisDetail dVsN,
      @JsonKey(name: 's_vs_a') required final AxisDetail sVsA,
      @JsonKey(name: 'm_vs_t') required final AxisDetail mVsT,
      required final String description}) = _$PersonaImpl;

  factory _Persona.fromJson(Map<String, dynamic> json) = _$PersonaImpl.fromJson;

  @override
  @JsonKey(name: 'persona_type')
  String get personaType;
  @override
  @JsonKey(name: 'd_vs_n')
  AxisDetail get dVsN;
  @override
  @JsonKey(name: 's_vs_a')
  AxisDetail get sVsA;
  @override
  @JsonKey(name: 'm_vs_t')
  AxisDetail get mVsT;
  @override
  String get description;

  /// Create a copy of Persona
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PersonaImplCopyWith<_$PersonaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AxisDetail _$AxisDetailFromJson(Map<String, dynamic> json) {
  return _AxisDetail.fromJson(json);
}

/// @nodoc
mixin _$AxisDetail {
  String get result => throw _privateConstructorUsedError;
  @JsonKey(name: 'count_1')
  int get count1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'count_2')
  int get count2 => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;

  /// Serializes this AxisDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AxisDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AxisDetailCopyWith<AxisDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AxisDetailCopyWith<$Res> {
  factory $AxisDetailCopyWith(
          AxisDetail value, $Res Function(AxisDetail) then) =
      _$AxisDetailCopyWithImpl<$Res, AxisDetail>;
  @useResult
  $Res call(
      {String result,
      @JsonKey(name: 'count_1') int count1,
      @JsonKey(name: 'count_2') int count2,
      double confidence});
}

/// @nodoc
class _$AxisDetailCopyWithImpl<$Res, $Val extends AxisDetail>
    implements $AxisDetailCopyWith<$Res> {
  _$AxisDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AxisDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? count1 = null,
    Object? count2 = null,
    Object? confidence = null,
  }) {
    return _then(_value.copyWith(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      count1: null == count1
          ? _value.count1
          : count1 // ignore: cast_nullable_to_non_nullable
              as int,
      count2: null == count2
          ? _value.count2
          : count2 // ignore: cast_nullable_to_non_nullable
              as int,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AxisDetailImplCopyWith<$Res>
    implements $AxisDetailCopyWith<$Res> {
  factory _$$AxisDetailImplCopyWith(
          _$AxisDetailImpl value, $Res Function(_$AxisDetailImpl) then) =
      __$$AxisDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String result,
      @JsonKey(name: 'count_1') int count1,
      @JsonKey(name: 'count_2') int count2,
      double confidence});
}

/// @nodoc
class __$$AxisDetailImplCopyWithImpl<$Res>
    extends _$AxisDetailCopyWithImpl<$Res, _$AxisDetailImpl>
    implements _$$AxisDetailImplCopyWith<$Res> {
  __$$AxisDetailImplCopyWithImpl(
      _$AxisDetailImpl _value, $Res Function(_$AxisDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of AxisDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? count1 = null,
    Object? count2 = null,
    Object? confidence = null,
  }) {
    return _then(_$AxisDetailImpl(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
      count1: null == count1
          ? _value.count1
          : count1 // ignore: cast_nullable_to_non_nullable
              as int,
      count2: null == count2
          ? _value.count2
          : count2 // ignore: cast_nullable_to_non_nullable
              as int,
      confidence: null == confidence
          ? _value.confidence
          : confidence // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AxisDetailImpl implements _AxisDetail {
  const _$AxisDetailImpl(
      {required this.result,
      @JsonKey(name: 'count_1') required this.count1,
      @JsonKey(name: 'count_2') required this.count2,
      required this.confidence});

  factory _$AxisDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$AxisDetailImplFromJson(json);

  @override
  final String result;
  @override
  @JsonKey(name: 'count_1')
  final int count1;
  @override
  @JsonKey(name: 'count_2')
  final int count2;
  @override
  final double confidence;

  @override
  String toString() {
    return 'AxisDetail(result: $result, count1: $count1, count2: $count2, confidence: $confidence)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AxisDetailImpl &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.count1, count1) || other.count1 == count1) &&
            (identical(other.count2, count2) || other.count2 == count2) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, result, count1, count2, confidence);

  /// Create a copy of AxisDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AxisDetailImplCopyWith<_$AxisDetailImpl> get copyWith =>
      __$$AxisDetailImplCopyWithImpl<_$AxisDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AxisDetailImplToJson(
      this,
    );
  }
}

abstract class _AxisDetail implements AxisDetail {
  const factory _AxisDetail(
      {required final String result,
      @JsonKey(name: 'count_1') required final int count1,
      @JsonKey(name: 'count_2') required final int count2,
      required final double confidence}) = _$AxisDetailImpl;

  factory _AxisDetail.fromJson(Map<String, dynamic> json) =
      _$AxisDetailImpl.fromJson;

  @override
  String get result;
  @override
  @JsonKey(name: 'count_1')
  int get count1;
  @override
  @JsonKey(name: 'count_2')
  int get count2;
  @override
  double get confidence;

  /// Create a copy of AxisDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AxisDetailImplCopyWith<_$AxisDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
