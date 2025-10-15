import 'dart:io';

import 'package:alopr/core/colors/app_colors.dart';
import 'package:alopr/core/common/buttons.dart';
import 'package:alopr/core/common/inkweel_widget.dart';
import 'package:alopr/core/common/open_gallary_widget.dart';
import 'package:alopr/core/fonts/app_text.dart';
import 'package:alopr/core/shared_prefrances/shared_prefrances.dart';
import 'package:alopr/features/home/domain/entity/inputs/complete_profile_input.dart';
import 'package:alopr/features/home/presentation/cubits/complete_profile_cubit/complete_profile_cubit.dart';
import 'package:alopr/features/home/presentation/cubits/get_complete_data_cubit/get_complete_user_data_cubit.dart';
import 'package:alopr/features/home/presentation/cubits/upload_cubit/upload_cubit.dart';
import 'package:alopr/features/home/presentation/widgets/image_perviewr_widget.dart';
import 'package:alopr/features/setting/screens/setting_page.dart';
import 'package:alopr/generated/l10n.dart';
import 'package:alopr/injection_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class UploadPage extends StatelessWidget {
  const UploadPage(
      {super.key,
      this.imageId,
      required this.title,
      required this.subTitle,
      this.buttonName,
      required this.isQueez});
  final String? imageId;
  final String title;
  final String subTitle;
  final String? buttonName;
  final bool isQueez;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CompleteProfileCubit(completeProfileUsecase: sl()),
        ),
        BlocProvider(
          create: (context) => UploadCubit(uploadUsecase: sl()),
        ),
      ],
      child: _UploadPage(
        isQueez: isQueez,
        subTitle: subTitle,
        title: title,
        buttonName: buttonName,
        imageId: imageId,
      ),
    );
  }
}

class _UploadPage extends StatefulWidget {
  const _UploadPage({
    required this.title,
    required this.subTitle,
    this.buttonName,
    required this.isQueez,
    this.imageId,
  });
  final String? imageId;
  final String title;
  final String subTitle;
  final String? buttonName;
  final bool isQueez;

  @override
  State<_UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<_UploadPage> {
  XFile? uploadedImage;

  Future<void> pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      uploadedImage = pickedImage;
      _uploadButton(context, File(uploadedImage!.path));
    });
  }

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).brightness == Brightness.dark
        ? AppColors.headingDark
        : AppColors.headingLight;
    return Stack(
      alignment: Directionality.of(context) == TextDirection.rtl
          ? Alignment.bottomLeft
          : Alignment.bottomRight,
      children: [
        BlocBuilder<GetCompleteUserDataCubit, GetCompleteUserDataState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: widget.isQueez == false
                  ? Theme.of(context).scaffoldBackgroundColor
                  : const Color.fromARGB(255, 250, 201, 201),
              body: SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                    child: BlocListener<CompleteProfileCubit,
                        CompleteProfileState>(
                      listener: (context, state) {
                        if (state is SuccessCompleteProfile) {
                          SharedPrefrance.instanc
                              .getRegisterId()
                              .then((registerId) {
                            if (registerId != null) {
                              context
                                  .read<GetCompleteUserDataCubit>()
                                  .getUserData(registerId: registerId);
                            }
                          });
                          // Optional: show success message
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content:
                                    Text("Profile updated successfully ✅")),
                          );
                        }

                        if (state is ErrorCompleteProfile) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Error: ${state.message}")),
                          );
                        }
                      },
                      child: BlocListener<UploadCubit, UploadState>(
                        listener: (context, uploadState) {
                          if (uploadState is SuccessUpload) {
                            final imageUrl = uploadState.imageUrl;
                            final getUserState =
                                context.read<GetCompleteUserDataCubit>().state;

                            if (getUserState is SuccessUserCompleteProfile &&
                                getUserState.data.completedProfile != null) {
                              final oldData =
                                  getUserState.data.completedProfile!;

                              // Create updated profile input with new image only
                              final updatedInput = CompleteProfileInput(
                                id: oldData.id ?? '',
                                registerId: oldData.registerId ?? '',
                                caregiver: oldData.caregiver ?? '',
                                caregiverNumber: oldData.caregiverNumber ?? '',
                                condition: oldData.condition ?? '',
                                gender: oldData.gender ?? '',
                                hasDiseases: oldData.hasDiseases ?? false,
                                specify: oldData.specify ?? '',
                                pregnantStatus: oldData.pregnantStatus ?? false,
                                testImage: widget.imageId == "1"
                                    ? imageUrl
                                    : oldData.testImage,
                                brainImage: widget.imageId == "2"
                                    ? imageUrl
                                    : oldData.brainImage,
                              );

                              // 🔹 Update instead of re-completing profile
                              context
                                  .read<CompleteProfileCubit>()
                                  .completeProfileFuc(input: updatedInput);
                            }
                          } else if (uploadState is ErrorUpload) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(uploadState.message)),
                            );
                          }
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    widget.title,
                                    style: AppTexts.title(context).copyWith(
                                      fontSize: 24.sp,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 4.r),
                                  child: InkwellWidget(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        CupertinoPageRoute(
                                          builder: (context) =>
                                              const SettingPage(),
                                        ),
                                      );
                                    },
                                    child: Icon(
                                      Icons.settings_outlined,
                                      color: textColor,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              widget.subTitle,
                              style: AppTexts.regular(context).copyWith(
                                color: textColor,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            if (widget.isQueez == false) ...[
                              SizedBox(height: 36.h),
                              if (widget.imageId == "1" &&
                                  state is SuccessUserCompleteProfile &&
                                  state.data.completedProfile?.testImage !=
                                      null) ...[
                                state is LoadingUserCompleteProfile
                                    ? CircularProgressIndicator()
                                    : ImagePerviewrWidget(
                                        imageUrl: state.data.completedProfile
                                                ?.testImage ??
                                            "")
                              ],
                              if (widget.imageId == "2" &&
                                  state is SuccessUserCompleteProfile &&
                                  state.data.completedProfile?.brainImage !=
                                      null) ...[
                                state is LoadingUserCompleteProfile
                                    ? CircularProgressIndicator()
                                    : ImagePerviewrWidget(
                                        imageUrl: state.data.completedProfile
                                                ?.brainImage ??
                                            "")
                              ],
                              (state is SuccessUserCompleteProfile &&
                                      ((widget.imageId ==
                                                  "2" &&
                                              state.data.completedProfile
                                                      ?.brainImage !=
                                                  null &&
                                              state.data.completedProfile!
                                                  .brainImage!.isNotEmpty) ||
                                          (widget
                                                      .imageId ==
                                                  "1" &&
                                              state.data.completedProfile
                                                      ?.testImage !=
                                                  null &&
                                              state.data.completedProfile!
                                                  .testImage!.isNotEmpty)))
                                  ? SizedBox()
                                  : BlocBuilder<UploadCubit, UploadState>(
                                      builder: (context, state) {
                                        return MainAppButton(
                                          onPressed: () {
                                            showModalBottomSheet<void>(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return OpenGallaryWidget(
                                                    videosTap: () {},
                                                    photosTap: () {
                                                      pickImage();
                                                      Navigator.pop(context);
                                                    },
                                                  );
                                                });
                                          },
                                          text: state is LoadingUpload
                                              ? S.current.loading
                                              : widget.buttonName,
                                          icon:
                                              Icon(Icons.file_upload_outlined),
                                        );
                                      },
                                    ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: SvgPicture.asset("images/ai_icon.svg"),
          ),
        ),
      ],
    );
  }

  void _uploadButton(BuildContext context, File imageFile) {
    BlocProvider.of<UploadCubit>(context).uploadImage(
      imageFile: imageFile,
    );
  }
}
