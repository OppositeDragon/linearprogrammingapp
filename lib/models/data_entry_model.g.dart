// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_entry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DataEntryModel _$$_DataEntryModelFromJson(Map<String, dynamic> json) =>
    _$_DataEntryModel(
      objective: $enumDecode(_$ObjectivesEnumMap, json['objective']),
      objectiveFunction: (json['objectiveFunction'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      operators: (json['operators'] as List<dynamic>)
          .map((e) => $enumDecode(_$OperatorsEnumMap, e))
          .toList(),
      constraints: (json['constraints'] as List<dynamic>)
          .map((e) =>
              (e as List<dynamic>).map((e) => (e as num).toDouble()).toList())
          .toList(),
    );

Map<String, dynamic> _$$_DataEntryModelToJson(_$_DataEntryModel instance) =>
    <String, dynamic>{
      'objective': _$ObjectivesEnumMap[instance.objective]!,
      'objectiveFunction': instance.objectiveFunction,
      'operators':
          instance.operators.map((e) => _$OperatorsEnumMap[e]!).toList(),
      'constraints': instance.constraints,
    };

const _$ObjectivesEnumMap = {
  Objectives.max: 'max',
  Objectives.min: 'min',
};

const _$OperatorsEnumMap = {
  Operators.geq: 'geq',
  Operators.leq: 'leq',
  Operators.equal: 'equal',
};
