import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppStyles {
  static TextStyle get semiBold20 => TextStyle(
    fontSize: 20.sp,
    color: const Color(0xff052224),
    fontWeight: FontWeight.w600,
  );

  static TextStyle get semiBold12 => TextStyle(
    fontSize: 12.sp,
    color: const Color(0xff0068FF),
    fontWeight: FontWeight.w600,
  );

  static TextStyle get light13 => TextStyle(
    fontSize: 13.sp,
    color: const Color(0xff052224),
    fontWeight: FontWeight.w300,
  );

  static TextStyle get regular14 => TextStyle(
    fontSize: 14.sp,
    color: const Color(0xff052224),
    fontWeight: FontWeight.w400,
  );

  static TextStyle get regular15 => TextStyle(
    fontSize: 15.sp,
    color: const Color(0xff052224),
    fontWeight: FontWeight.w400,
  );

  static TextStyle get regular12 => TextStyle(
    fontSize: 12.sp,
    color: const Color(0xff093030),
    fontWeight: FontWeight.w400,
  );

  static TextStyle get bold24 => TextStyle(
    fontSize: 24.sp,
    color: const Color(0xffF1FFF3),
    fontWeight: FontWeight.w700,
  );

  static TextStyle get bold20 => TextStyle(
    fontSize: 20.sp,
    color: const Color(0xff0E3E3E),
    fontWeight: FontWeight.w700,
  );

  static TextStyle get bold15 => TextStyle(
    fontSize: 15.sp,
    color: const Color(0xff052224),
    fontWeight: FontWeight.w700,
  );

  static TextStyle get medium12 => TextStyle(
    fontSize: 12.sp,
    color: const Color(0xff093030),
    fontWeight: FontWeight.w500,
  );

  static TextStyle get medium13 => TextStyle(
    fontSize: 13.sp,
    color: const Color(0xff093030),
    fontWeight: FontWeight.w500,
  );

  static TextStyle get medium15 => TextStyle(
    fontSize: 15.sp,
    color: const Color(0xff052224),
    fontWeight: FontWeight.w500,
  );
}
