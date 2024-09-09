import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}
class ServerFailure extends Failure{
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioError){
    switch(dioError.type){
      
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeOut with apiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeOut with apiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Recieve timeOut with apiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('badCertificate with apiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('request with apiServer was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('connectionError with apiServer');
      case DioExceptionType.unknown:
        if(dioError.message!.contains('SocketException')){
          return ServerFailure('no internet connection');
        }
        return ServerFailure('unknown');
      default:
        return ServerFailure('oops there was an error, please try later');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response){
    if(statusCode == 400 || statusCode == 401 || statusCode == 403){
      return ServerFailure(response['error']['message']);
    } else if(statusCode == 404){
      return ServerFailure('Your request not found, please try later!');
    } else if(statusCode == 500){
      return ServerFailure('Internal server error, please try later!');
    } else {
      return ServerFailure('oops there was an error');
    }
  }
}