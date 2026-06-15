import 'package:core_offline/core_offline.dart';
import '../data_sources/local/daos/reference_dao.dart';

class ReferenceRepositoryImpl implements LocalReferenceRepository {
  final ReferenceDao _dao;

  ReferenceRepositoryImpl(this._dao);

  @override
  Future<void> saveMapping({required String clientId, required String serverId}) {
    return _dao.insertMapping(clientId, serverId);
  }

  @override
  Future<String?> getServerId(String clientId) {
    return _dao.getServerId(clientId);
  }

  @override
  Future<void> clearAllMappings() {
    return _dao.clearAll();
  }
}