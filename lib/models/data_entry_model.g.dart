// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_entry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DataEntryModel _$$_DataEntryModelFromJson(Map<String, dynamic> json) =>
    _$_DataEntryModel(
      objectiveFunction: (json['objectiveFunction'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      constraints: (json['constraints'] as List<dynamic>)
          .map((e) =>
              (e as List<dynamic>).map((e) => (e as num).toDouble()).toList())
          .toList(),
      operators: (json['operators'] as List<dynamic>)
          .map((e) => $enumDecode(_$OperatorsEnumMap, e))
          .toList(),
      objective: $enumDecode(_$ObjectivesEnumMap, json['objective']),
    );

Map<String, dynamic> _$$_DataEntryModelToJson(_$_DataEntryModel instance) =>
    <String, dynamic>{
      'objectiveFunction': instance.objectiveFunction,
      'constraints': instance.constraints,
      'operators':
          instance.operators.map((e) => _$OperatorsEnumMap[e]!).toList(),
      'objective': _$ObjectivesEnumMap[instance.objective]!,
    };

const _$OperatorsEnumMap = {
  Operators.geq: 'geq',
  Operators.leq: 'leq',
  Operators.equal: 'equal',
};

const _$ObjectivesEnumMap = {
  Objectives.max: 'max',
  Objectives.min: 'min',
};
