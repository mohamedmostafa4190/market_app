import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MediaQueryConstants {
  final BuildContext context;

  MediaQueryConstants(this.context);

  double get screenWidth => MediaQuery.of(context).size.width;

  double get screenHeight => MediaQuery.of(context).size.height;
}

class PaddingConstants {
  final BuildContext context;

  PaddingConstants(this.context);

  double get horizontalPadding => MediaQuery.of(context).size.width * 0.05;

  double get verticalPadding => MediaQuery.of(context).size.height * 0.02;

  double get smallPadding => MediaQuery.of(context).size.width * 0.02;

  double get mediumPadding => MediaQuery.of(context).size.width * 0.04;

  double get largePadding => MediaQuery.of(context).size.width * 0.06;
}

const projectURL = 'https://bfimgpvfvthhkeikxers.supabase.co';
const projectAPIKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJmaW1ncHZmdnRoaGtlaWt4ZXJzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTM5Nzg0MzIsImV4cCI6MjA2OTU1NDQzMn0.p3zNhNuyK_i2-PW3DNXL7aUVLSK1MQf-C-U7g-qSFco';
final supabaseClient = Supabase.instance.client;
