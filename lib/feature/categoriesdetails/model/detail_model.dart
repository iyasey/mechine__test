import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_model.freezed.dart';
part 'detail_model.g.dart';

@freezed
class DetailModel with _$DetailModel {
  factory DetailModel(
      {required String id,
      required String task,@Default(false) bool isClicked,
      DateTime? createdAt}) = _DetailModel;

  factory DetailModel.fromJson(Map<String, dynamic> json) =>
      _$DetailModelFromJson(json);
}
