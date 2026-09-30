import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:taskflow/src/data/data.dart';

void main() {
  group('IssueDraftPayload', () {
    final participant = KickoffIssueParticipantItem(
      id: 1,
      participant: User(
        id: 2,
        email: 'participant@example.com',
        username: 'Participant',
      ),
      role: 'PM',
    );
    final trip = KickoffIssueTripItem(
      id: 3,
      category: KickoffIssueTripItemCategory(id: 4, name: 'Domestic'),
      days: 5,
      note: 'Kickoff meeting',
    );

    test('round-trips kickoff child items', () {
      final payload = IssueDraftPayload(
        category: IssueCategory.kickoff(id: 1, name: 'Kickoff'),
        participantItems: [participant],
        tripItems: [trip],
      );

      final restored = IssueDraftPayload.fromJson(_normalize(payload.toJson()));

      expect(restored.participantItems, [participant]);
      expect(restored.tripItems, [trip]);
    });

    test('defaults missing kickoff child items for existing drafts', () {
      final json =
          _normalize(
              IssueDraftPayload(
                category: IssueCategory.kickoff(id: 1, name: 'Kickoff'),
              ).toJson(),
            )
            ..remove('participantItems')
            ..remove('tripItems');

      final restored = IssueDraftPayload.fromJson(json);

      expect(restored.participantItems, isEmpty);
      expect(restored.tripItems, isEmpty);
    });
  });
}

Map<String, dynamic> _normalize(Object value) =>
    Map<String, dynamic>.from(jsonDecode(jsonEncode(value)) as Map);
