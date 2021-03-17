import 'package:app_nasa/core/errors/failures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_nasa/features/domain/entities/space_media_entity.dart';
import 'package:app_nasa/features/domain/repositories/space_media_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:app_nasa/features/domain/usecases/get_space_media_from_date_usecase.dart';
import 'package:mockito/mockito.dart';

class SpaceMediaRepositoryMock extends Mock implements ISpaceMediaRepository {}

main() {
  late GetSpaceMediaFromDateUsecase usecase;
  late ISpaceMediaRepository spaceMediaRepositoryMock;

  setUp(() {
    spaceMediaRepositoryMock = SpaceMediaRepositoryMock();
    usecase = GetSpaceMediaFromDateUsecase(spaceMediaRepositoryMock);
  });

  final tSpaceMedia = SpaceMediaEntity(
    description: 'Meteors can be colorful. While the human eye usually cannot discern many colors,',
    mediaType: 'image',
    title: 'A Colorful Quadrantid Meteor',
    mediaUrl: 'https://apod.nasa.gov/apod/image/2102/MeteorStreak_Kuszaj_1080.jpg',
  );

  final tDate = DateTime(2021, 02, 02);
  test('should get space media from for a given date from the repository', () async {
    when(spaceMediaRepositoryMock.getSpaceMediaFromDate(tDate))
        .thenAnswer((_) async => Right<Failure, SpaceMediaEntity>(tSpaceMedia));
    final result = await usecase.call(tDate);
    expect(result, Right(tSpaceMedia));
    verify(spaceMediaRepositoryMock.getSpaceMediaFromDate(tDate));
    verifyNoMoreInteractions(spaceMediaRepositoryMock);
  });

  test('should return a ServerFailure when don\`t succeed', () async {
    when(spaceMediaRepositoryMock.getSpaceMediaFromDate(tDate))
        .thenAnswer((_) async => Left<Failure, SpaceMediaEntity>(ServerFailure()));
    final result = await usecase.call(tDate);
    expect(result, Left(ServerFailure()));
    verify(spaceMediaRepositoryMock);
  });
}
