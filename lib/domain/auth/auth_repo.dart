// import 'package:Stics/domain/auth/auth_failure.dart';
// import 'package:Stics/domain/auth/user.dart';
// import 'package:Stics/infrastructure/auth/mock_auth_service.dart';
// import 'package:dartz/dartz.dart';

// class AuthRepo {
//   final MockAuthService authService;

//   AuthRepo(this.authService);

//   Future<Either<AuthFailure, User>> login() async {
//     try {
//       final result = await authService.login();
//       return right(
//         User(id: result['userid'], username: result['username']),
//       );
//     } catch (_) {
//       print('error happened');
//       return left(GeneralAuthFailure());
//     }
//   }

//   Future<Either<AuthFailure, Unit>> logout() async {
//     try {
//       final result = await authService.logout();
//       if (result) {
//         return right(unit);
//       } else {
//         return left(GeneralAuthFailure());
//       }
//     } catch (_) {
//       return left(GeneralAuthFailure());
//     }
//   }
// }
