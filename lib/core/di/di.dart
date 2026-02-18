import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodiex/features/auth/loginAndSignUp/data/repository_impl/auth_repository_impl.dart';
import 'package:foodiex/features/auth/loginAndSignUp/data/usecase/auth_usecase_remote.dart';
import 'package:foodiex/features/auth/loginAndSignUp/domain/repository/auth_repository.dart';

final AuthRepository authrepo = AuthRepositoryImpl(
  AuthUsecaseRemote(FirebaseAuth.instance, FirebaseFirestore.instance),
);
