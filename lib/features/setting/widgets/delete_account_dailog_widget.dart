import 'package:alopr/core/common/main_app_dialog.dart';
import 'package:alopr/core/extentions/app_extentions.dart';
import 'package:alopr/features/authentication/presentation/screens/login_page.dart';
import 'package:alopr/features/setting/cubits/delete_account_cubit/delete_account_cubit.dart';
import 'package:alopr/generated/l10n.dart';
import 'package:alopr/injection_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteAccountDailogWidget extends StatelessWidget {
  const DeleteAccountDailogWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteAccountCubit(deleteUsecase: sl()),
      child: BlocConsumer<DeleteAccountCubit, DeleteAccountState>(
        listener: (context, state) {
          if (state is SucsessDeleteAccount) {
            Navigator.of(context).pushAndRemoveUntil(
              CupertinoPageRoute(
                builder: (context) => const LoginPage(),
              ),
              (Route<dynamic> route) => false,
            );
          }
          if (state is ErrorDeleteAccount) {
            showErrorToastMessage(message: state.message);
          }
        },
        builder: (context, state) {
          return MainAppDialog(
            buttonTitle:
                state is LoadingDeleteAccount ? S.of(context).loading : null,
            icon: Icons.delete_forever_outlined,
            content: S.of(context).deleteAccountMessage,
            title: S.of(context).deleteAccountTitle,
            onConfirm: () async {
              context.read<DeleteAccountCubit>().deletAccountFunc();
            },
            onCancel: () => Navigator.pop(context),
          );
        },
      ),
    );
  }
}
