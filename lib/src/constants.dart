import 'package:flutter/material.dart';
import 'dart:convert' as convert;

const int agencyId = 1;
const tokenApi =
    'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjgxY2FlNDU4MmFiZWNkNjRhM2I1ZDAxZTZjOTk5MDAzOGUyMWNlNmQ4MDJjNmUzMGJlMjE4MTY3Nzk3YTMwMzQwMmZkMzUzZjFlNWMxYTNmIn0.eyJhdWQiOiIxIiwianRpIjoiODFjYWU0NTgyYWJlY2Q2NGEzYjVkMDFlNmM5OTkwMDM4ZTIxY2U2ZDgwMmM2ZTMwYmUyMTgxNjc3OTdhMzAzNDAyZmQzNTNmMWU1YzFhM2YiLCJpYXQiOjE2NzE1OTU0NTgsIm5iZiI6MTY3MTU5NTQ1OCwiZXhwIjoxNzAzMTMxNDU4LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.dXUWa_VGazIh1wAbIODAdEE9Edvd57gYd-DQMJObbg2k5FV840Zn4fjwhtBAlyE_eao86GslvKqnrUxCl_eYhf02fSw5uJ8OO0_ECjkZXurY-qR95LlM2y8eTQuwL6kIzuApGgL9w8WlvTy86OGJJm1gF8FsnBLO4RoQoDbzmnCq1AydtKI-YX3R0yeyFa4FoOWOQgVwQPsnyybyMXglhYpCVqGBd7gBjF0q3KTpNdg1rkJ22rkPLi03hcXPvUIz2VRR7A-AwWFrszfQxDFzNWwy_weh8id4FklACds7qLfG0RQokda8WebQNckdjYjPRNDBgjmD8paLTmRKC89SpMRYrtV0NocHGMiTPrVqA3AbZGgGb39OX_V4MwvwjsezPIk5WZZL9ZsVW7XwSKTm9WcRrlH3xDictPK2_C6ZPxagI_Is9ki9C2MB9Hk8uUkb9y346HL2FWvGrTf6zmBkKDdwOGT4YMw-N71C_Jarm7OjkzwYI4s0BGXzwrjzGoLLfW4LcL1MJnOFsJT5cQKm4mA1lkoOAvXrVy6HGDzDJmPRChtNmrCRIJt0zELdxZSqJrWnpV_LuWar9JHcRKnOdkrO4nlR7-k1TyWkd-VaVQ2ZhqadPrtMv6hVc2DV5eSdLGjq5RCP5PR7FMFOGHHzNvjofO58XC7SGEYmb-Y8xvI';
const double maxPageWidth = 300.0;

const primaryColor = Color(0xFF0086B9);
const shadows = [
  BoxShadow(
    color: Colors.black38,
    offset: Offset(1.0, 1.0),
    blurRadius: 5.0,
    spreadRadius: 5.0,
  ),
];

const headers_ = {
  'Content-Type': 'application/json; charset=UTF-8',
  'Accept': 'application/json',
  'Authorization': 'Bearer $tokenApi,'
};
