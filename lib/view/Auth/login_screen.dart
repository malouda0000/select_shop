import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:select_shop/generated/l10n.dart';
import 'package:select_shop/l10n/app_localizations.dart';
import 'package:select_shop/view/Shared/app_toast.dart';
import 'package:select_shop/view/Shared/error_screen.dart';
import 'package:select_shop/view/Shared/loading_screen.dart';
import 'package:select_shop/view/Shared/under_develop_screen.dart';
import 'package:select_shop/core/constants/app_constants.dart';
import 'package:select_shop/core/constants/app_images.dart';
import 'package:select_shop/core/functions/nav_func.dart';
import 'package:select_shop/core/theme/colors.dart';
import 'package:select_shop/core/theme/light.dart';
import 'package:select_shop/view/Auth/bloc/auth_bloc.dart';
import 'package:select_shop/view/Auth/forget_password_screen.dart';
import 'package:select_shop/view/Auth/signup_screen.dart';
import 'package:select_shop/view/home/home_screen.dart';

TextStyle _customLocalTextStyle = TextStyle(
  color: AppColors.mainGreyColor,
);

final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

final TextEditingController phoneNumberTextEditingController =
    TextEditingController();
final TextEditingController passwordTextEditingController =
    TextEditingController();

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  @override
  void dispose() {
    // Dispose of the controllers when the state is disposed
    // _usernameController.dispose();
    // _passwordController.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Directionality(
                  textDirection: TextDirection.ltr,
                  child: _AuthCustomIcon(size: size)),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 35,
                ),
                child: BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    // TODO: implement listener

                    if (state is AuthSuccessStateSignIn) {
                      showToast(
                          message:
                              "${S.of(context).signInWelcome}: ${context.read<AuthBloc>().userName != null ? context.read<AuthBloc>().userName! : " "}");
                      // AppCubit.get(context).getUser();
                      navigateToWithReplacement(
                        context,
                        const HomeScreen(),
                      );
                    }

                    if (state is AuthErrorStateSignIn) {
                      // context.loaderOverlay.hide();
                      showToast(
                        message: state.errorMessage,
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthLoadingStateSignIn) {
                      return const SizedBox(
                          width: 200,
                          height: 200,
                          child: CustomLoadingScreen());
                    }
                    // else if (state is AuthErrorState) {
                    //   return SizedBox(
                    //       width: 200,
                    //       height: 200,
                    //       child: ErrorScreen(errorMessage: state.errorMessage));
                    // }

                    // else if (state is AuthInitialState )
                    // {return CustomLoadingScreen();}

                    // else if (state is AuthSuccessState )
                    // {return _LoginBody();}

                    else {
                      return _LoginBody();
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginBody extends StatefulWidget {
  const _LoginBody({
    super.key,
  });

  @override
  State<_LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<_LoginBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 50,
        ),
        Text(
            style: TextStyle(
              color: AppColors.mainColor,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            S.of(context).welcomeToSelectShop),
        const SizedBox(
          height: 30,
        ),
        Form(
          key: signInFormKey,
          child: Column(
            children: [
              Container(
                // email or phone number
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      50,
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.withOpacity(.5),
                        offset: Offset(0.0, 2.0),
                        blurRadius: 3.0,
                      ),
                    ],
                    color: Colors.white),
                child: TextFormField(
                  // name: S.of(context).email,
                  // validator: (value) {
                  //   // context.read<AuthBloc>().validateEmail(value);
                  //   context.read<AuthBloc>().customValidator(value);
                  // },

                  //                 validator: FormBuilderValidators.compose([
                  //      /// Makes this field required
                  //      FormBuilderValidators.required(),

                  //     /// Ensures the value entered is numeric - with a custom error message
                  //     FormBuilderValidators.numeric(errorText: 'La edad debe ser numérica.'),

                  //     /// Sets a maximum value of 70
                  //     FormBuilderValidators.max(70),

                  //     /// Include your own custom `FormFieldValidator` function, if you want
                  //     /// Ensures positive values only. We could also have used `FormBuilderValidators.min(0)` instead
                  //     (value) {
                  //          final number = int.tryParse(value!);
                  //         if (number == null) return null;
                  //         if (number < 0) return 'We cannot have a negative age';
                  //         return null;
                  //     },
                  // ]),

                  validator: (emailOrPhoneNum) {
                    emailOrPhoneNum!.length < 5 ? 'falsssse' : null;
                    // print(emailOrPhoneNum);
                    // emailOrPhoneNum == null
                  },

                  // validator: (String? value) {
                  //   if (value == null || value.trim().isEmpty) {
                  //     return 'Please provide a value.';
                  //   } else if (value.length < 4) {
                  //     return 'Please provide a value.';
                  //   }
                  //   return null;
                  // },
                  controller: phoneNumberTextEditingController,
                  decoration: InputDecoration(
                    hintText: S.of(context).email,
                    hintStyle: _customLocalTextStyle,
                    border: InputBorder.none,
                    contentPadding: EdgeInsetsDirectional.symmetric(
                      horizontal: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                // password text field

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      50,
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.withOpacity(.5),
                        offset: Offset(0.0, 2.0),
                        blurRadius: 3.0,
                      ),
                    ],
                    color: Colors.white),
                child: FormBuilderTextField(
                  // password text field
                  name: S.of(context).password,
                  controller: passwordTextEditingController,
                  validator: (password) {
                    // context.read<AuthBloc>().validatepassword(value);
                    password!.length < 5 ? 'falsssse' : null;
                  },
                  decoration: InputDecoration(
                    hintText: S.of(context).password,
                    hintStyle: _customLocalTextStyle,
                    border: InputBorder.none,
                    contentPadding: EdgeInsetsDirectional.symmetric(
                      horizontal: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      navigateToWithReplacement(
                          context, const ForgotPasswordScreen());
                    },
                    child: Text(
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 12,
                      ),
                      S.of(context).forgotPassword,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      navigateToWithReplacement(
                          context, const ForgotPasswordScreen());
                    },
                    child: Text(
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 12,
                      ),
                      S.of(context).resetPassword,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(
                  50,
                ),
                onTap: () {
                  // signInFormKey.currentState!.validate() == true
                  //     ? print("${signInFormKey.currentState!.validate()}")
                  //     : print("${signInFormKey.currentState!.validate()}");
                  context.read<AuthBloc>().add(AuthLogInEvent());
                },
                child: Container(
                  height: 40,
                  width: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColors.mainGreyColor,
                      borderRadius: BorderRadius.circular(
                        50,
                      )),
                  child: Text(
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      S.of(context).signIn),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              _DepugSign(),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UnderDevScreen()));
                },
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                        (route) => false);
                  },
                  child: Text(
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 12,
                      ),
                      S.of(context).youDontHaveAccount),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Divider(
                      // thickness: 15,
                      // height: 30,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    style: TextStyle(
                      color: AppColors.mainGreyColor,
                      fontSize: 12,
                    ),
                    S.of(context).orByUsing,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UnderDevScreen()));
                    },
                    child: const Image(
                        image: AssetImage(
                      AppImages.facebook,
                    )),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UnderDevScreen()));
                    },
                    child: const Image(
                        image: AssetImage(
                      AppImages.google,
                    )),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _AuthCustomIcon extends StatelessWidget {
  const _AuthCustomIcon({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.yellow,
      height: size.height * .5,
      width: size.width,
      child: Stack(
        children: [
          Positioned(
              top: 0,
              right: 0,
              child: Container(
                // width: size.width * .45,
                width: 200,
                height: size.height * .5,
                decoration: const BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                    60,
                  )),
                ),
              )),
          Positioned(
            width: size.width,
            height: size.height * .45,
            right: 0,
            bottom: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Stack(children: [
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 435,
                        height: 300,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            color: Colors.grey[350],
                            // borderRadius: const BorderRadius.only(
                            //   topRight: Radius.circular(50),
                            //   bottomRight: Radius.circular(50),
                            // ),

                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        // child: Image.asset(
                        //   AppImages.girlLoginScreen,
                        // ),
                      ),
                    ),
                    Center(child: Image.asset(AppImages.girlLoginScreen)),
                  ]),
                ),
                const SizedBox(
                  width: 15,
                ),
                const Image(
                  // width: 10,
                  // height: 10,
                  image: AssetImage(
                    AppImages.selShoHoriText,
                  ),
                ),
                const SizedBox(
                  width: AppConstants.theDefBaddingFifteenPixl,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _DepugSign extends StatelessWidget {
  const _DepugSign({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(
        50,
      ),
      onTap: () {
        navigateToWithReplacement(context, const HomeScreen());
      },
      child: Container(
        height: 40,
        width: 200,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColors.mainGreyColor,
            borderRadius: BorderRadius.circular(
              50,
            )),
        child: Text(
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            "debug sign"),
      ),
    );
  }
}
