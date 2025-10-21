import 'package:alopr/core/colors/app_colors.dart';
import 'package:alopr/core/common/alert_dialog_widget.dart';
import 'package:alopr/core/common/inkweel_widget.dart';
import 'package:alopr/core/fonts/app_text.dart';
import 'package:alopr/core/shared_prefrances/shared_prefrances.dart';
import 'package:alopr/features/home/presentation/cubits/get_complete_data_cubit/get_complete_user_data_cubit.dart';
import 'package:alopr/features/home/presentation/screens/on_complete_page.dart';
import 'package:alopr/features/home/presentation/screens/upload_page.dart';
import 'package:alopr/generated/l10n.dart';
import 'package:alopr/injection_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientWidget extends StatefulWidget {
  const PatientWidget({super.key});

  @override
  State<PatientWidget> createState() => _PatientWidgetState();
}

class _PatientWidgetState extends State<PatientWidget> {
  String? _registerId;

  @override
  void initState() {
    super.initState();
    _loadRegisterId();
  }

  Future<void> _loadRegisterId() async {
    final id = await SharedPrefrance.instanc.getRegisterId();
    if (id != null && mounted) {
      setState(() => _registerId = id);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_registerId == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return BlocProvider(
      create: (context) => GetCompleteUserDataCubit(getUserCompletedData: sl())
        ..getUserData(registerId: _registerId!),
      child: _PatientWidget(),
    );
  }
}

class _PatientWidget extends StatelessWidget {
  const _PatientWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCompleteUserDataCubit, GetCompleteUserDataState>(
      builder: (context, state) {
        if (state is LoadingUserCompleteProfile) {
          return Column(
            children: [
              SizedBox(height: 100.h),
              CircularProgressIndicator(color: Colors.grey),
            ],
          );
        }
        if (state is SuccessUserCompleteProfile) {
          if (state.data.completedProfile == null) {
            return Column(
              children: [
                completeProfileAlert(context),
                patientBody(context, state),
              ],
            );
          } else {
            return patientBody(context, state);
          }
        }
        if (state is ErrorUserCompleteProfile) {
          // final status = state.hashCode;
          // if (status >= 500) {
          //   return Column(
          //     children: [
          //       SizedBox(height: 100.h),
          //       Container(
          //           constraints: BoxConstraints(
          //             maxHeight: 250.h,
          //             minWidth: double.infinity,
          //           ),
          //           child: SvgPicture.asset("images/server_error.svg")),
          //     ],
          //   );
          // }
          return Column(
            children: [
              completeProfileAlert(context),
              patientBody(context, state),
            ],
          );
        }
        return SizedBox();
      },
    );
  }
}

Widget _coustomBox(
    {required BuildContext context,
    required String title,
    required String subTitle,
    required Function()? onTap}) {
  final isDarkMood = Theme.of(context).brightness == Brightness.dark;
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.white,
        boxShadow: isDarkMood
            ? null
            : [
                BoxShadow(
                    color: Colors.grey, blurRadius: 6.r, offset: Offset(0, 2)),
              ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTexts.heading(context).copyWith(
              color: AppColors.headingLight,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            subTitle,
            style: AppTexts.paragraph(context).copyWith(
              color: AppColors.headingLight,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget completeProfileAlert(BuildContext context) {
  return Column(
    children: [
      SizedBox(height: 20.h),
      InkwellWidget(
        onTap: () {
          Navigator.of(context).push(
            CupertinoPageRoute(
              builder: (context) => OnCompletePage(
                role: "patient",
              ),
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.all(4.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.amber,
          ),
          child: Row(
            children: [
              Icon(
                Icons.warning,
                color: Colors.black,
              ),
              SizedBox(width: 4),
              Text(
                S.current.pleaseCompleteYourProfile,
                style: AppTexts.regular(context).copyWith(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget patientBody(BuildContext context, state) {
  return Column(
    children: [
      SizedBox(height: 70.h),
      _coustomBox(
          context: context,
          title: S.of(context).uploadTest,
          subTitle: S.of(context).upload1Subtitle,
          onTap: () {
            if (state is SuccessUserCompleteProfile) {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (_) => BlocProvider.value(
                    value: context.read<GetCompleteUserDataCubit>(),
                    child: UploadPage(
                      imageId: "1",
                      isQueez: false,
                      buttonName: S.of(context).uploadFile,
                      title: S.of(context).uploadYourTest,
                      subTitle: S.of(context).uploadPageSubtitle1,
                    ),
                  ),
                ),
              );
            } else {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialogWidget();
                },
              );
            }
          }),
      SizedBox(height: 16.h),
      _coustomBox(
          context: context,
          title: S.of(context).uploadMRI,
          subTitle: S.of(context).upload2Subtitle,
          onTap: () {
            if (state is SuccessUserCompleteProfile) {
              Navigator.of(context).push(CupertinoPageRoute(
                builder: (_) => BlocProvider.value(
                  value: context.read<GetCompleteUserDataCubit>(),
                  child: UploadPage(
                    imageId: "2",
                    isQueez: false,
                    buttonName: S.of(context).uploadScan,
                    title: S.of(context).uploadYourMRI,
                    subTitle: S.of(context).uploadPageSubtitle2,
                  ),
                ),
              ));
            } else {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialogWidget();
                },
              );
            }
          }),
      SizedBox(height: 16.h),
      _coustomBox(
        context: context,
        title: S.of(context).aloprCognitiveTest,
        subTitle: S.of(context).upload3Subtitle,
        onTap: () {
          Navigator.of(context).push(CupertinoPageRoute(
            builder: (_) => BlocProvider.value(
              value: context.read<GetCompleteUserDataCubit>(),
              child: UploadPage(
                isQueez: true,
                title: S.of(context).uploadYourTest,
                subTitle: S.of(context).uploadPageSubtitle3,
              ),
            ),
          ));
        },
      ),
    ],
  );
}
