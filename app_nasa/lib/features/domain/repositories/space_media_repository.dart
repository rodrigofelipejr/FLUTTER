/* esse repository é o contrato que o repository do data layer vai implementar  */

import 'package:app_nasa/core/errors/failures.dart';
import 'package:app_nasa/features/domain/entities/space_media_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ISpaceMediaRepository {
  Future<Either<Failure, SpaceMediaEntity>> getSpaceMediaFromDate(DateTime date);
}
