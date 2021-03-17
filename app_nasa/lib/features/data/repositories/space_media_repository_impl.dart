import 'package:app_nasa/core/errors/exceptions.dart';
import 'package:app_nasa/features/data/datasources/space_media_datasource.dart';
import 'package:app_nasa/features/domain/entities/space_media_entity.dart';
import 'package:app_nasa/core/errors/failures.dart';
import 'package:app_nasa/features/domain/repositories/space_media_repository.dart';
import 'package:dartz/dartz.dart';

class SpaceMediaRepositoryImpl implements ISpaceMediaRepository {
  final ISpaceMediaDatasource datasource;

  SpaceMediaRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, SpaceMediaEntity>> getSpaceMediaFromDate(DateTime date) async {
    try {
      final result = await datasource.getSpaceMediaFromDate(date);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
    // on InvalidCredentialsException {
    //   return Left(InvalidCredentialsFailure());
    // }
  }
}
