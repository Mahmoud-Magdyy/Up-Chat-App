import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_chat_app/core/routes/app_routes.dart';
import 'package:up_chat_app/core/utils/commons.dart';
import 'package:up_chat_app/core/widgets/custom_button.dart';
import 'package:up_chat_app/core/widgets/custom_text_form_field.dart';
import 'package:up_chat_app/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:up_chat_app/feature/auth/presentation/cubit/auth_state.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Forget Password'),
        ),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is ForgetPasswordSucessfulltyState) {
              showToast(message: state.message, state: ToastStates.success);
              navigateRepacement(context: context, route: Routes.login);
            }
            if (state is ForgetPasswordErrorState) {
              showToast(message: state.message, state: ToastStates.error);
            }
          },
          builder: (context, state) {
            var cubit = AuthCubit.get(context);
            return Padding(
              padding: const EdgeInsets.all(24),
              child: SingleChildScrollView(
                child: Center(
                  child: BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextFormField(
                              lable: 'E-mail',
                              controller: cubit.emailForgetPasswordController,
                              type: TextInputType.emailAddress,
                              validate: (val) {
                                if (val!.isEmpty) {
                                  return 'Please Enter E-mail';
                                }
                                if (!(val.contains('@gmail.com'))) {
                                  return 'E-mail must contains @gmail.com';
                                }
                                return null;
                              }),
                          const SizedBox(
                            height: 20,
                          ),
                          state is ForgetPasswordLoadingState
                              ? const CircularProgressIndicator()
                              : CustomButton(
                                  text: 'Send Code',
                                  onPressed: () async {
                                    cubit.forgetPassword();
                                  },
                                ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
