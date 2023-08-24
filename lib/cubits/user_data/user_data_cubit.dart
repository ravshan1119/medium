import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medium/data/models/user/user_field_keys.dart';
import 'package:medium/data/models/user/user_model.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit()
      : super(
          UserDataState(
            userModel: UserModel(
              password: "",
              username: "",
              email: "",
              avatar: '',
              contact: "",
              gender: "",
              profession: '',
              role: "",
            ),
            errorText: "",
          ),
        );

  updateCurrentUserField({
    required UserFieldKeys fieldKey,
    required String value,
  }) {
    UserModel currentUser = state.userModel;

    switch (fieldKey) {
      case UserFieldKeys.username:
        {
          currentUser = currentUser.copyWith(username: value);
          break;
        }
      case UserFieldKeys.avatar:
        {
          currentUser = currentUser.copyWith(avatar: value);
          break;
        }
      case UserFieldKeys.gender:
        {
          currentUser = currentUser.copyWith(gender: value);
          break;
        }
      case UserFieldKeys.role:
        {
          currentUser = currentUser.copyWith(role: value);
          break;
        }
      case UserFieldKeys.profession:
        {
          currentUser = currentUser.copyWith(profession: value);
          break;
        }
      case UserFieldKeys.password:
        {
          currentUser = currentUser.copyWith(password: value);
          break;
        }
      case UserFieldKeys.contact:
        {
          currentUser = currentUser.copyWith(contact: value);
          break;
        }
      case UserFieldKeys.email:
        {
          currentUser = currentUser.copyWith(email: value);
          break;
        }
    }

    debugPrint("USER: ${currentUser.toString()}");

    emit(state.copyWith(userModel: currentUser));
  }

  bool canRegister() {
    UserModel currentUser = state.userModel;

    if (currentUser.contact.length < 9) {
      return false;
    }

    if (currentUser.username.isEmpty) {
      return false;
    }

    if (currentUser.avatar.isEmpty) {
      return false;
    }

    if (currentUser.email.isEmpty) {
      return false;
    }
    if (currentUser.password.isEmpty) {
      return false;
    }

    if (currentUser.profession.isEmpty) {
      return false;
    }

    if (currentUser.gender.isEmpty) {
      return false;
    }
    return true;
  }

  clearData() {
    emit(
      UserDataState(
        userModel: UserModel(
          password: "",
          username: "",
          email: "",
          avatar: '',
          contact: "",
          gender: "",
          profession: '',
          role: "",
        ),
        errorText: "",
      ),
    );
  }
}
