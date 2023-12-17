import 'package:flutter/material.dart';
import 'package:flutter_assignment/config/app_colors.dart';

class AppTextStyle {
  ///FontSize
  static const TextStyle fontSize9 = TextStyle(fontSize: 9);

  static const TextStyle fontSize23 = TextStyle(fontSize: 23);
  static const TextStyle fontSize14 = TextStyle(fontSize: 14);
  static const TextStyle fontSize16 = TextStyle(fontSize: 16);



  ///FontWeight

  static const TextStyle fontWeight400 = TextStyle(fontWeight: FontWeight.w400);
  static const TextStyle fontWeight500 = TextStyle(fontWeight: FontWeight.w500);
  static const TextStyle fontWeight700 = TextStyle(fontWeight: FontWeight.w700);

  static const TextStyle fontWeightNormal =
      TextStyle(fontWeight: FontWeight.normal);

  ///Font Family
  static const TextStyle fontFamily = TextStyle(fontFamily: 'Lato');

  ///FontStyle
  static TextStyle get font14black700 => fontFamily
      .merge(fontWeight700)
      .merge(fontSize14)
      .copyWith(color: AppColors.black);
      

      static TextStyle get font14black400 => fontFamily
      .merge(fontWeight400)
      .merge(fontSize14)
      .copyWith(color: AppColors.black);

       static TextStyle get font16black700 => fontFamily
      .merge(fontWeight700)
      .merge(fontSize16)
      .copyWith(color: AppColors.black);
       static TextStyle get font14blackOpacity400 => fontFamily
      .merge(fontWeight400)
      .merge(fontSize14)
      .copyWith(color: AppColors.blackOpacity);



  static TextStyle get font23black500 => fontFamily
      .merge(fontWeight500)
      .merge(fontSize23)
      .copyWith(color: AppColors.black);
}
