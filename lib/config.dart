library casauth;

// To parse this JSON data, do
//
//     final config = configFromJson(jsonString);

import 'dart:convert';

Config configFromJson(String str) => Config.fromJson(json.decode(str));

String configToJson(Config data) => json.encode(data.toJson());

class Config {
  String owner = "";
  String name = "";
  DateTime createdTime = DateTime(1970);
  String displayName = "";
  String logo = "";
  String homepageUrl = "";
  String description = "";
  String organization = "";
  String cert = "";
  bool enablePassword = false;
  bool enableSignUp = false;
  bool enableSigninSession = false;
  bool enableCodeSignin = false;
  bool enableSamlCompress = false;
  bool enableWebAuthn = false;
  List<ProviderElement> providers = [];
  List<SignupItem> signupItems = [];
  List<String> grantTypes = [];
  OrganizationObj? organizationObj;
  String clientId = "";
  String clientSecret = "";
  List<String> redirectUris = [];
  String tokenFormat = "";
  int expireInHours = 0;
  int refreshExpireInHours = 0;
  String signupUrl = "";
  String signinUrl = "";
  String forgetUrl = "";
  String affiliationUrl = "";
  String termsOfUse = "";
  String signupHtml = "";
  String signinHtml = "";

  Config.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) {
      return;
    }
    owner = json["owner"];
    name = json["name"];
    createdTime = DateTime.parse(json["createdTime"]);
    displayName = json["displayName"];
    logo = json["logo"];
    homepageUrl = json["homepageUrl"];
    description = json["description"];
    organization = json["organization"];
    cert = json["cert"];
    enablePassword = json["enablePassword"];
    enableSignUp = json["enableSignUp"];
    enableSigninSession = json["enableSigninSession"];
    enableCodeSignin = json["enableCodeSignin"];
    enableSamlCompress = json["enableSamlCompress"];
    enableWebAuthn = json["enableWebAuthn"];
    providers = List<ProviderElement>.from(
      json["providers"].map((x) => ProviderElement.fromJson(x)),
    );
    signupItems = List<SignupItem>.from(
      json["signupItems"].map((x) => SignupItem.fromJson(x)),
    );
    grantTypes = List<String>.from(json["grantTypes"].map((x) => x));
    organizationObj = OrganizationObj.fromJson(json["organizationObj"]);
    clientId = json["clientId"];
    clientSecret = json["clientSecret"];
    redirectUris = List<String>.from(json["redirectUris"].map((x) => x));
    tokenFormat = json["tokenFormat"];
    expireInHours = json["expireInHours"];
    refreshExpireInHours = json["refreshExpireInHours"];
    signupUrl = json["signupUrl"];
    signinUrl = json["signinUrl"];
    forgetUrl = json["forgetUrl"];
    affiliationUrl = json["affiliationUrl"];
    termsOfUse = json["termsOfUse"];
    signupHtml = json["signupHtml"];
    signinHtml = json["signinHtml"];
  }

  Map<String, dynamic> toJson() => {
        "owner": owner,
        "name": name,
        "createdTime": createdTime.toIso8601String(),
        "displayName": displayName,
        "logo": logo,
        "homepageUrl": homepageUrl,
        "description": description,
        "organization": organization,
        "cert": cert,
        "enablePassword": enablePassword,
        "enableSignUp": enableSignUp,
        "enableSigninSession": enableSigninSession,
        "enableCodeSignin": enableCodeSignin,
        "enableSamlCompress": enableSamlCompress,
        "enableWebAuthn": enableWebAuthn,
        "providers": List<dynamic>.from(providers.map((x) => x.toJson())),
        "signupItems": List<dynamic>.from(signupItems.map((x) => x.toJson())),
        "grantTypes": List<String>.from(grantTypes.map((x) => x)),
        "organizationObj": organizationObj?.toJson(),
        "clientId": clientId,
        "clientSecret": clientSecret,
        "redirectUris": List<dynamic>.from(redirectUris.map((x) => x)),
        "tokenFormat": tokenFormat,
        "expireInHours": expireInHours,
        "refreshExpireInHours": refreshExpireInHours,
        "signupUrl": signupUrl,
        "signinUrl": signinUrl,
        "forgetUrl": forgetUrl,
        "affiliationUrl": affiliationUrl,
        "termsOfUse": termsOfUse,
        "signupHtml": signupHtml,
        "signinHtml": signinHtml,
      };

  bool hasSignupItem(String name) {
    if (signupItems.isEmpty) {
      return false;
    }
    for (SignupItem item in signupItems) {
      if (item.name == name) {
        return true;
      }
    }
    return false;
  }

  bool requiredSignupItem(String name) {
    if (signupItems.isEmpty) {
      return false;
    }
    for (SignupItem item in signupItems) {
      if (item.name == name && item.required) {
        return true;
      }
    }
    return false;
  }

  String getGrantTokenType() {
    if (grantTypes.isEmpty) {
      return "";
    }
    if (grantTypes.contains("token")) {
      return "token";
    }
    if (grantTypes.contains("id_token")) {
      return "id_token";
    }

    return "";
  }
}

class OrganizationObj {
  String owner = "";
  String name = "";
  DateTime createdTime = DateTime(1970);
  String displayName = "";
  String websiteUrl = "";
  String favicon = "";
  String passwordType = "";
  String passwordSalt = "";
  String phonePrefix = "";
  String defaultAvatar = "";
  List<dynamic> tags = [];
  String masterPassword = "";
  bool enableSoftDeletion = false;
  bool isProfilePublic = false;
  List<AccountItem> accountItems = [];

  OrganizationObj.fromJson(Map<String, dynamic> json) {
    owner = json["owner"];
    name = json["name"];
    createdTime = DateTime.parse(json["createdTime"]);
    displayName = json["displayName"];
    websiteUrl = json["websiteUrl"];
    favicon = json["favicon"];
    passwordType = json["passwordType"];
    passwordSalt = json["passwordSalt"];
    phonePrefix = json["phonePrefix"];
    defaultAvatar = json["defaultAvatar"];
    tags = List<dynamic>.from(json["tags"].map((x) => x));
    masterPassword = json["masterPassword"];
    enableSoftDeletion = json["enableSoftDeletion"];
    isProfilePublic = json["isProfilePublic"];
    accountItems = List<AccountItem>.from(
      json["accountItems"].map((x) => AccountItem.fromJson(x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "owner": owner,
        "name": name,
        "createdTime": createdTime.toIso8601String(),
        "displayName": displayName,
        "websiteUrl": websiteUrl,
        "favicon": favicon,
        "passwordType": passwordType,
        "passwordSalt": passwordSalt,
        "phonePrefix": phonePrefix,
        "defaultAvatar": defaultAvatar,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "masterPassword": masterPassword,
        "enableSoftDeletion": enableSoftDeletion,
        "isProfilePublic": isProfilePublic,
        "accountItems": List<dynamic>.from(accountItems.map((x) => x.toJson())),
      };
}

class AccountItem {
  String name = "";
  bool visible = false;
  ViewRule? viewRule;
  ModifyRule? modifyRule;

  AccountItem.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    visible = json["visible"];
    viewRule = viewRuleValues.map[json["viewRule"]];
    modifyRule = modifyRuleValues.map[json["modifyRule"]];
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "visible": visible,
        "viewRule": viewRuleValues.reverse[viewRule],
        "modifyRule": modifyRuleValues.reverse[modifyRule],
      };
}

enum ModifyRule { admin, immutable, self }

final modifyRuleValues = EnumValues({
  "Admin": ModifyRule.admin,
  "Immutable": ModifyRule.immutable,
  "Self": ModifyRule.self
});

enum ViewRule { public, self, admin }

final viewRuleValues = EnumValues({
  "Admin": ViewRule.admin,
  "Public": ViewRule.public,
  "Self": ViewRule.self
});

class ProviderElement {
  String name = "";
  bool canSignUp = false;
  bool canSignIn = false;
  bool canUnlink = false;
  bool prompted = false;
  String alertType = "";
  ProviderProvider? provider;

  ProviderElement.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    canSignUp = json["canSignUp"];
    canSignIn = json["canSignIn"];
    canUnlink = json["canUnlink"];
    prompted = json["prompted"];
    alertType = json["alertType"];
    provider = ProviderProvider.fromJson(json["provider"]);
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "canSignUp": canSignUp,
        "canSignIn": canSignIn,
        "canUnlink": canUnlink,
        "prompted": prompted,
        "alertType": alertType,
        "provider": provider?.toJson(),
      };
}

class ProviderProvider {
  String owner = "";
  String name = "";
  DateTime createdTime = DateTime(1970);
  String displayName = "";
  String category = "";
  String type = "";
  String subType = "";
  String method = "";
  String clientId = "";
  String clientSecret = "";
  String clientId2 = "";
  String clientSecret2 = "";
  String cert = "";
  String customAuthUrl = "";
  String customScope = "";
  String customTokenUrl = "";
  String customUserInfoUrl = "";
  String customLogo = "";
  String host = "";
  int port = 0;
  String title = "";
  String content = "";
  String regionId = "";
  String signName = "";
  String templateCode = "";
  String appId = "";
  String endpoint = "";
  String intranetEndpoint = "";
  String domain = "";
  String bucket = "";
  String metadata = "";
  String idP = "";
  String issuerUrl = "";
  bool enableSignAuthnRequest = false;
  String providerUrl = "";

  ProviderProvider.fromJson(Map<String, dynamic> json) {
    owner = json["owner"];
    name = json["name"];
    createdTime = DateTime.parse(json["createdTime"]);
    displayName = json["displayName"];
    category = json["category"];
    type = json["type"];
    subType = json["subType"];
    method = json["method"];
    clientId = json["clientId"];
    clientSecret = json["clientSecret"];
    clientId2 = json["clientId2"];
    clientSecret2 = json["clientSecret2"];
    cert = json["cert"];
    customAuthUrl = json["customAuthUrl"];
    customScope = json["customScope"];
    customTokenUrl = json["customTokenUrl"];
    customUserInfoUrl = json["customUserInfoUrl"];
    customLogo = json["customLogo"];
    host = json["host"];
    port = json["port"];
    title = json["title"];
    content = json["content"];
    regionId = json["regionId"];
    signName = json["signName"];
    templateCode = json["templateCode"];
    appId = json["appId"];
    endpoint = json["endpoint"];
    intranetEndpoint = json["intranetEndpoint"];
    domain = json["domain"];
    bucket = json["bucket"];
    metadata = json["metadata"];
    idP = json["idP"];
    issuerUrl = json["issuerUrl"];
    enableSignAuthnRequest = json["enableSignAuthnRequest"];
    providerUrl = json["providerUrl"];
  }

  Map<String, dynamic> toJson() => {
        "owner": owner,
        "name": name,
        "createdTime": createdTime.toIso8601String(),
        "displayName": displayName,
        "category": category,
        "type": type,
        "subType": subType,
        "method": method,
        "clientId": clientId,
        "clientSecret": clientSecret,
        "clientId2": clientId2,
        "clientSecret2": clientSecret2,
        "cert": cert,
        "customAuthUrl": customAuthUrl,
        "customScope": customScope,
        "customTokenUrl": customTokenUrl,
        "customUserInfoUrl": customUserInfoUrl,
        "customLogo": customLogo,
        "host": host,
        "port": port,
        "title": title,
        "content": content,
        "regionId": regionId,
        "signName": signName,
        "templateCode": templateCode,
        "appId": appId,
        "endpoint": endpoint,
        "intranetEndpoint": intranetEndpoint,
        "domain": domain,
        "bucket": bucket,
        "metadata": metadata,
        "idP": idP,
        "issuerUrl": issuerUrl,
        "enableSignAuthnRequest": enableSignAuthnRequest,
        "providerUrl": providerUrl,
      };
}

class SignupItem {
  String name = "";
  bool visible = false;
  bool required = false;
  bool prompted = false;
  String rule = "";

  SignupItem.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    visible = json["visible"];
    required = json["required"];
    prompted = json["prompted"];
    rule = json["rule"];
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "visible": visible,
        "required": required,
        "prompted": prompted,
        "rule": rule,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map(
      (k, v) => MapEntry(v, k),
    );
    return reverseMap ?? {};
  }
}
