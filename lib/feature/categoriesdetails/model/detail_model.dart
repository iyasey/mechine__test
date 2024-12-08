import 'package:freezed_annotation/freezed_annotation.dart';


part 'detail_model.freezed.dart';
part 'detail_model.g.dart';

@freezed
class DetailModel with _$DetailModel{
  factory DetailModel({required String id, required String task,DateTime? createdAt})= _UserModel;

  factory DetailModel.fromJson(Map<String,dynamic> json)=>_$DetailModelFromJson(json);
}