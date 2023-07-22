// import 'package:get/get.dart';
// import 'package:magadh_sqlite_database_getx/database/database_service.dart';
// import 'package:magadh_sqlite_database_getx/database/database_service_impl.dart';
// import 'package:magadh_sqlite_database_getx/database/manager/datatypes.dart';

// /// Field names of partner table
// const String localId = '_id';
// const String id = 'id';
// const String cpCode = 'cp_code';
// const String displayName = 'display_name';
// const String status = 'status';
// const String orderStatus = 'order_status';
// const String sponsorId = 'sponsor_id';
// const String marketingOfficers = 'marketing_officer';
// const String billingUser = 'billing_user';
// const String adminType = 'admin_type';
// const String userType = 'user_type';
// const String name = 'name';
// const String mobile = 'mobile';
// const String gst = 'gst';
// const String businessName = 'business_name';
// const String businessAddress = 'business_address';
// const String businessAddress2 = 'business_address2';
// const String businessLoc = 'business_loc';
// const String businessPincode = 'business_pincode';
// const String businessStatecode = 'business_statecode';
// const String businessStatus = 'business_status';
// const String sponsorTree = 'sponsorTree';
// const String userId = 'user_id';
// const String curMonthTeamSale = 'cur_month_team_sale';
// const String prvMonthTeamSale = 'prv_month_team_sale';

// class PartnerProvider {
//   static String tableName = 'partner';
//   static String masterQuery = '''
//     CREATE TABLE $tableName (
//       $localId ${SqlTypes.INTEGER} ${SqlKeys.PRIMARY_KEY} ${SqlKeys.AUTO_INCREMENT},
//       $id ${SqlTypes.TEXT},
//       $cpCode ${SqlTypes.TEXT} ${SqlKeys.NOT_NULL},
//       $displayName ${SqlTypes.TEXT},
//       $status ${SqlTypes.TEXT} ${SqlKeys.NOT_NULL},
//       $orderStatus ${SqlTypes.TEXT} ${SqlKeys.NOT_NULL},
//       $sponsorId ${SqlTypes.TEXT},
//       $marketingOfficers ${SqlTypes.TEXT},
//       $billingUser ${SqlTypes.TEXT},
//       $adminType ${SqlTypes.TEXT},
//       $userType ${SqlTypes.TEXT} ${SqlKeys.NOT_NULL},
//       $name ${SqlTypes.TEXT},
//       $mobile ${SqlTypes.TEXT},
//       $gst ${SqlTypes.TEXT},
//       $businessName ${SqlTypes.TEXT},
//       $businessAddress ${SqlTypes.TEXT},
//       $businessAddress2 ${SqlTypes.TEXT},
//       $businessLoc ${SqlTypes.TEXT},
//       $businessPincode ${SqlTypes.TEXT},
//       $businessStatecode ${SqlTypes.TEXT},
//       $businessStatus ${SqlTypes.TEXT},
//       $sponsorTree ${SqlTypes.TEXT},
//       $userId ${SqlTypes.TEXT},
//       $curMonthTeamSale ${SqlTypes.TEXT},
//       $prvMonthTeamSale ${SqlTypes.TEXT}
//     )
// ''';

//   late DatabaseService _databaseService;

//   PartnerProvider() {
//     _databaseService = Get.find<DatabaseServiceImpl>();
//   }

//   Future<DataInsertionResponse> insert(List<Map<String, dynamic>> json) async {
//     try {
//       return await _databaseService.insert(tableName, json);
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<List<PartnerItem>> query({
//     List<String>? columns,
//     bool? distinct,
//     String? groupBy,
//     String? having,
//     int? limit,
//     int? offset,
//     String? orderBy,
//     String? where,
//     List<Object?>? whereArgs,
//   }) async {
//     try {
//       List<Map<String, Object?>> result = await _databaseService.query()(
//         tableName,
//         columns: columns,
//         distinct: distinct,
//         groupBy: groupBy,
//         having: having,
//         limit: limit,
//         offset: offset,
//         orderBy: orderBy,
//         where: where,
//         whereArgs: whereArgs,
//       );
//       return result.map((e) => PartnerItem.fromJson(e)).toList();
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
