import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/auth_repo.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  final AuthRepo authRepo;
  static AuthCubit get(context) => BlocProvider.of(context);

//auth logic
  final TextEditingController emailLoginController = TextEditingController();
  final TextEditingController passwordLoginController = TextEditingController();
  final TextEditingController emailRegisterController = TextEditingController();
  final TextEditingController emailForgetPasswordController = TextEditingController();
  final TextEditingController passwordRegisterController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> formLoginKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formRegisterKey = GlobalKey<FormState>();
  // final userAccount = FirebaseAuth.instance;

  IconData suffixIcon = Icons.visibility;
  bool isPasswordShown = true;

  void changePasswordIcon() {
    isPasswordShown = !isPasswordShown;
    suffixIcon = isPasswordShown ? Icons.visibility : Icons.visibility_off;
    emit(ChangePasswordIconState());
  }

  String dropDownValueDepartment = 'SC';

  // List of items in our dropdown menu
  List<String> itemsDepartments = ['SC', 'AI', 'CS', 'IS'];

  void changeDepartmentValue(d) {
    dropDownValueDepartment = d!;
    emit(ChangeDepartmentValueState());
  }

//signin
void signUp() async {
    emit(SignUpLoadingState());
    var res = await authRepo.signUp(
        email: emailRegisterController.text,
        password: passwordRegisterController.text);
    res.fold(
        (l) => emit(SignUpErrorState(message: l)),
        (r) => emit(
              SignUpSucessfulltyState(message: r),
            ));
  }

// login
  void login() async {
    emit(LoginLoadingState());
    var res = await authRepo.login(
        email: emailLoginController.text,
        password: passwordLoginController.text);
    res.fold(
        (l) => emit(LoginErrorState(message: l)),
        (r) => emit(
              LoginSucessfulltyState(message: r),
            ));
  }

  //forget password
  void forgetPassword() async {
    emit(ForgetPasswordLoadingState());
    var res = await authRepo.forgetPassword(
      email: emailLoginController.text,
    );
    res.fold(
        (l) => emit(ForgetPasswordErrorState(message: l)),
        (r) => emit(
              ForgetPasswordSucessfulltyState(message: r),
            ));
  }
}
