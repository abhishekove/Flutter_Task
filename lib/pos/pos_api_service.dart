
import 'package:chopper/chopper.dart';

part 'pos_api_service.chopper.dart';

@ChopperApi(baseUrl: '/posts')
abstract class PosApiService extends ChopperService{
@Get()
  Future<Response> getPoss();

static PosApiService create(){
  final client=ChopperClient(
    baseUrl: 'https://jsonplaceholder.typicode.com',
    services: [
      _$PosApiService(),
    ],
    converter: JsonConverter(),
  );
  return _$PosApiService(client);
}
}