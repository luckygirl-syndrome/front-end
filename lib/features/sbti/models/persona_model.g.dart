// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'persona_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PersonaResponseImpl _$$PersonaResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PersonaResponseImpl(
      persona: json['persona'] == null
          ? null
          : Persona.fromJson(json['persona'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PersonaResponseImplToJson(
        _$PersonaResponseImpl instance) =>
    <String, dynamic>{
      'persona': instance.persona,
    };

_$PersonaImpl _$$PersonaImplFromJson(Map<String, dynamic> json) =>
    _$PersonaImpl(
      personaType: json['persona_type'] as String,
      dVsN: AxisDetail.fromJson(json['d_vs_n'] as Map<String, dynamic>),
      sVsA: AxisDetail.fromJson(json['s_vs_a'] as Map<String, dynamic>),
      mVsT: AxisDetail.fromJson(json['m_vs_t'] as Map<String, dynamic>),
      description: json['description'] as String,
    );

Map<String, dynamic> _$$PersonaImplToJson(_$PersonaImpl instance) =>
    <String, dynamic>{
      'persona_type': instance.personaType,
      'd_vs_n': instance.dVsN,
      's_vs_a': instance.sVsA,
      'm_vs_t': instance.mVsT,
      'description': instance.description,
    };

_$AxisDetailImpl _$$AxisDetailImplFromJson(Map<String, dynamic> json) =>
    _$AxisDetailImpl(
      result: json['result'] as String,
      count1: (json['count_1'] as num).toInt(),
      count2: (json['count_2'] as num).toInt(),
      confidence: (json['confidence'] as num).toDouble(),
    );

Map<String, dynamic> _$$AxisDetailImplToJson(_$AxisDetailImpl instance) =>
    <String, dynamic>{
      'result': instance.result,
      'count_1': instance.count1,
      'count_2': instance.count2,
      'confidence': instance.confidence,
    };
