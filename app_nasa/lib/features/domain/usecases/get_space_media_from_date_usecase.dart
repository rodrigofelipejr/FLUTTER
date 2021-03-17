import 'package:app_nasa/core/errors/failures.dart';
import 'package:app_nasa/core/usecase/usecase.dart';
import 'package:app_nasa/features/domain/entities/space_media_entity.dart';
import 'package:app_nasa/features/domain/repositories/space_media_repository.dart';
import 'package:dartz/dartz.dart';

class GetSpaceMediaFromDateUsecase implements Usecase<SpaceMediaEntity, DateTime> {
  /*
   * No use case é possível implementar validações, como por exemplo, saber se o formato de um e-mail está correto
   * Agora, suponha que eu esteja enviando uma senha, que segundo a API, deve conter 8 dígitos, isso vai ser validado 
   * no data layer, por se tratar de validações ligadas a API.
   * Aqui, apenas validações que são pertinentes a regra de negócio 
   */
  final ISpaceMediaRepository repository;

  GetSpaceMediaFromDateUsecase(this.repository);

  @override
  Future<Either<Failure, SpaceMediaEntity>> call(DateTime date) async {
    return await repository.getSpaceMediaFromDate(date);
  }
}
