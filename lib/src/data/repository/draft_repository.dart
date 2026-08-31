part of '../data.dart';

abstract class DraftRepository {
  Future<void> saveDraft({required Draft draft});

  Future<Draft?> getDraft({required String id});

  Future<List<Draft>> getDraftsByUser({required int userId});

  Future<void> deleteDraft({required String id});

  Future<void> saveAsset({required DraftAsset asset});

  Future<DraftAsset?> getAsset({required String id});

  Future<List<DraftAsset>> getAssetsByDraft({required String draftId});

  Future<void> replaceAssets({
    required String draftId,
    required List<DraftAsset> assets,
  });

  Future<void> deleteAsset({required String id});

  Future<void> deleteAll();
}
