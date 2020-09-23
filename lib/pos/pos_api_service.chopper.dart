// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$PosApiService extends PosApiService {
  _$PosApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = PosApiService;

  Future<Response> getPoss() {
    final $url = '/posts';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
