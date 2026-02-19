import 'package:freezed_annotation/freezed_annotation.dart';

part 'persona_model.freezed.dart';
part 'persona_model.g.dart';

@freezed
class PersonaResponse with _$PersonaResponse {
  const factory PersonaResponse({
    Persona? persona,
  }) = _PersonaResponse;

  factory PersonaResponse.fromJson(Map<String, dynamic> json) =>
      _$PersonaResponseFromJson(json);
}

@freezed
class Persona with _$Persona {
  const factory Persona({
    @JsonKey(name: 'persona_type') required String personaType,
    @JsonKey(name: 'd_vs_n') required AxisDetail dVsN,
    @JsonKey(name: 's_vs_a') required AxisDetail sVsA,
    @JsonKey(name: 'm_vs_t') required AxisDetail mVsT,
    required String description,
  }) = _Persona;

  factory Persona.fromJson(Map<String, dynamic> json) =>
      _$PersonaFromJson(json);
}

@freezed
class AxisDetail with _$AxisDetail {
  const factory AxisDetail({
    required String result,
    @JsonKey(name: 'count_1') required int count1,
    @JsonKey(name: 'count_2') required int count2,
    required double confidence,
  }) = _AxisDetail;

  factory AxisDetail.fromJson(Map<String, dynamic> json) =>
      _$AxisDetailFromJson(json);
}
