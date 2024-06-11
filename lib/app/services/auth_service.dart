import 'dart:convert';
import 'package:flutter_exam/app/models/random_string_model.dart';
import 'package:flutter_exam/app/repositories/auth_repository.dart';

class AuthService {
  final AuthRepository authRepository;
  AuthService(this.authRepository);

  Future<RandomStringModel> getRandomString() async {
    final response = await authRepository.getRandomString();

    final model = RandomStringModel.fromJson(jsonDecode(response));

    return model;
  }
}
