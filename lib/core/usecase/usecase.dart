import 'package:fpdart/fpdart.dart';
import 'package:skill_nest/core/error/failure.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}

class NoParams{}