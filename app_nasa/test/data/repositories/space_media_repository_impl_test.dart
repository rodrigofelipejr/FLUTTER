import 'package:app_nasa/core/errors/exceptions.dart';
import 'package:app_nasa/core/errors/failures.dart';
import 'package:app_nasa/features/data/datasources/space_media_datasource.dart';
import 'package:app_nasa/features/data/models/space_media_model.dart';
import 'package:app_nasa/features/data/repositories/space_media_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SpaceMediaDatasourceMock extends Mock implements ISpaceMediaDatasource {}

main() {
  late SpaceMediaRepositoryImpl repository;
  late ISpaceMediaDatasource datasource;

  setUp(() {
    datasource = SpaceMediaDatasourceMock();
    repository = SpaceMediaRepositoryImpl(datasource);
  });

  final tSpaceMediaModel = SpaceMediaModel(
    description: 'Meteors can be colorful. While the human eye usually cannot discern many colors,',
    mediaType: 'image',
    title: 'A Colorful Quadrantid Meteor',
    mediaUrl: 'https://apod.nasa.gov/apod/image/2102/MeteorStreak_Kuszaj_1080.jpg',
  );

  final tDate = DateTime(2021, 02, 02);
  test('should return space media model when calls the datasource', () async {
    when(datasource.getSpaceMediaFromDate(tDate)).thenAnswer((_) async => tSpaceMediaModel);
    final result = await repository.getSpaceMediaFromDate(tDate);

    expect(result, Right(tSpaceMediaModel));
    verify(datasource);
  });

  test('should return a server failure when call to datasource is unsuccessfully', () async {
    when(datasource.getSpaceMediaFromDate(tDate)).thenThrow(ServerException());
    final result = await repository.getSpaceMediaFromDate(tDate);

    expect(result, Left(ServerFailure()));
    verify(datasource);
  });
}
