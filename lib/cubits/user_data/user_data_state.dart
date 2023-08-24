part of 'user_data_cubit.dart';

class UserDataState extends Equatable{
  final String errorText;
  final UserModel userModel;

  const UserDataState({
    required this.userModel,
    required this.errorText,
  });

  UserDataState copyWith({
    String? errorText,
    UserModel? userModel,
  }) =>
      UserDataState(
        userModel: userModel ?? this.userModel,
        errorText: errorText ?? this.errorText,
      );

  @override
  // TODO: implement props
  List<Object?> get props => throw [];
}
