import 'package:dartz/dartz.dart';
import 'package:ready_pagination/core/handle_error/failure.dart';
import 'package:ready_pagination/pagination/data/data_source/remote_data_source.dart';
import 'package:ready_pagination/pagination/data/model/post.dart';
import 'package:ready_pagination/pagination/domain/base_repo/base_repo.dart';

import '../../../core/handle_error/execptions.dart';
import '../../../core/handle_error/network_info.dart';

class Repo extends BaseRepo {
  final RemoteData remoteData;
  final NetworkInfo networkInfo;

  Repo({required this.remoteData,required this.networkInfo});

  @override
  Future<Either<Failure, List<Post>>> getData(
      {required int pageNumber, required int numberOfPostsPerRequest}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await remoteData.getData(
            numberOfPostsPerRequest: numberOfPostsPerRequest,
            pageNumber: pageNumber);
        return Right(result);
      } on ServerException catch (failure) {
        return left(ServerFailure(message: failure.message.toString()));
      }
    } else {
      return left(const ServerFailure(message: 'No Internet Connection'));
    }
  }
}
