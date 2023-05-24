import "dart:async";
import "dart:convert";
import "dart:io";
import "package:graphql/client.dart";
import "package:webpoint/PSApp.dart";
import "package:webpoint/api/common/Resources.dart";
import "package:webpoint/api/common/Status.dart";
import "package:webpoint/constant/Constants.dart";
import "package:webpoint/db/common/ps_shared_preferences.dart";
import "package:webpoint/graph_ql/GraphQLConfiguration.dart";
import "package:webpoint/provider/user/UserProvider.dart";
import "package:webpoint/repository/UserRepository.dart";
import "package:webpoint/ui/dashboard/DashboardView.dart";
import "package:webpoint/utils/PsProgressDialog.dart";
import "package:webpoint/utils/Utils.dart";
import "package:webpoint/view_object/common/Object.dart";

abstract class Api {
  Future<Resources<R>>
      doServerCallMutationWithoutAuth<T extends Object<dynamic>, R>(
    T obj,
  ) async {
    final QueryResult result = await GraphQLConfiguration()
        .clientToQuery()
        .mutate(
          MutationOptions(
            document: gql(document),
            variables: variable,
            fetchPolicy: FetchPolicy.networkOnly,
            errorPolicy: ErrorPolicy.all,
          ),
        )
        .timeout(const Duration(seconds: Const.apiTimeout), onTimeout: () {
      return timeoutError(document, variable, queryKey);
      // throw Exception;
    });

    Utils.cPrintRelease(result.toString());

    if (result.data != null) {
      if (!result.hasException) {
        final dynamic hashMap = result.data;
        if (hashMap is! Map) {
          // if it is not a map
          final List<T> tList = <T>[];
          hashMap.forEach((dynamic data) {
            tList.add(obj.fromMap(data as dynamic) as T);
          });
          commonErrorHandlingLog(result, queryKey,
              queryOrMutation: document, variable: "$variable");
          return Resources<R>(Status.SUCCESS, "", tList as R);
        } else {
          commonErrorHandlingLog(result, queryKey,
              queryOrMutation: document, variable: "$variable");
          return Resources<R>(Status.SUCCESS, "", obj.fromMap(hashMap) as R);
        }
      } else {
        return errorHandling(document, result,
            variable: variable,
            queryKey: queryKey,
            serverMessage:
                "Graphql Error: $result \n\nVariable: \n$variable \n\nMutation: \n$document");
      }
    } else {
      return errorHandling(
        document,
        result,
        variable: variable,
        queryKey: queryKey,
        serverMessage:
            "Graphql Error: $result \n\nVariable: \n$variable \n\nMutation: \n$document",
      );
    }
  }
}
