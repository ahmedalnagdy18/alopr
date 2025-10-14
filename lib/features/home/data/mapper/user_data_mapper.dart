import 'package:alopr/features/authentication/data/model/api_register_model.dart';
import 'package:alopr/features/home/domain/entity/model/user_data_model.dart';

extension ConvertUserDataToApi on ApiRegisterModel {
  UserDataModel userDataMap() {
    return UserDataModel(
      id: id,
      email: email,
      fullName: fullName,
      phone: phone,
      role: role,
    );
  }
}
