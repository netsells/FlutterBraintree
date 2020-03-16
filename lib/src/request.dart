class BraintreeDropInRequest {
  BraintreeDropInRequest({
    this.clientToken,
    this.tokenizationKey,
    this.amount,
    this.collectDeviceData = false,
    this.requestThreeDSecureVerification = false,
    this.googlePaymentRequest,
    this.paypalRequest,
    this.venmoEnabled = true,
    this.cardEnabled = true,
    this.maskCardNumber = false,
    this.maskSecurityCode = false,
    this.vaultManagerEnabled = false,
  });

  /// Authorization allowing this client to communicate with Braintree.
  /// Either [clientToken] or [tokenizationKey] must be set.
  String clientToken;

  /// Authorization allowing this client to communicate with Braintree.
  /// Either [clientToken] or [tokenizationKey] must be set.
  String tokenizationKey;

  /// Amount for the transaction. This is only used for 3D secure verfications.
  String amount;

  /// Whether the Drop-in should collect and return device data for fraud prevention.
  bool collectDeviceData;

  /// If 3D Secure has been enabled in the control panel and an amount is specified in
  /// [amount], Drop-In will request a 3D Secure verification for any new cards added by the user.
  bool requestThreeDSecureVerification;

  /// Google Payment request. Google Pay will be disabled if this is set to `null`.
  BraintreeGooglePaymentRequest googlePaymentRequest;

  /// PayPal request. PayPal will be disabled if this is set to `null`.
  BraintreePayPalRequest paypalRequest;

  /// Whether Venmo should be enabled.
  bool venmoEnabled;

  /// Whether cards should be enabled.
  bool cardEnabled;

  /// Whether the card number should be masked if the field is not focused.
  bool maskCardNumber;

  /// Whether the security code should be masked during input.
  bool maskSecurityCode;

  /// Whether customers should be allowed to manage their vaulted payment methods.
  bool vaultManagerEnabled;

  /// Converts this request object into a JSON-encodable format.
  Map<String, dynamic> toJson() => {
        if (clientToken != null) 'clientToken': clientToken,
        if (tokenizationKey != null) 'tokenizationKey': tokenizationKey,
        if (amount != null) 'amount': amount,
        if (collectDeviceData != null) 'collectDeviceData': collectDeviceData,
        if (requestThreeDSecureVerification != null)
          'requestThreeDSecureVerification': requestThreeDSecureVerification,
        if (googlePaymentRequest != null)
          'googlePaymentRequest': googlePaymentRequest.toJson(),
        if (paypalRequest != null) 'paypalRequest': paypalRequest.toJson(),
        if (venmoEnabled != null) 'venmoEnabled': venmoEnabled,
        if (cardEnabled != null) 'cardEnabled': cardEnabled,
        if (maskCardNumber != null) 'maskCardNumber': maskCardNumber,
        if (maskSecurityCode != null) 'maskSecurityCode': maskSecurityCode,
        if (vaultManagerEnabled != null)
          'vaultManagerEnabled': vaultManagerEnabled,
      };
}

class BraintreeCreditCardRequest {
  BraintreeCreditCardRequest({
    this.cardNumber,
    this.expirationMonth,
    this.expirationYear,
    this.cvv,
  });

  /// Number shown on the credit card.
  String cardNumber;

  /// Two didgit expiration month, e.g. `'05'`.
  String expirationMonth;

  /// Four didgit expiration year, e.g. `'2021'`.
  String expirationYear;

  /// Security code, e.g. `'356'`;
  String cvv;

  Map<String, dynamic> toJson() => {
        if (cardNumber != null) 'cardNumber': cardNumber,
        if (expirationMonth != null) 'expirationMonth': expirationMonth,
        if (expirationYear != null) 'expirationYear': expirationYear,
      };
}

class BraintreeGooglePaymentRequest {
  BraintreeGooglePaymentRequest({
    this.totalPrice,
    this.currencyCode,
    this.billingAddressRequired = true,
    this.googleMerchantID,
  });

  /// Total price of the payment.
  String totalPrice;

  /// Currency code of the transaction.
  String currencyCode;

  /// Whether billing address information should be collected and passed.
  bool billingAddressRequired;

  /// Google Merchant ID. Optional in sandbox, but if set, must be a valid production Google Merchant ID.
  String googleMerchantID;

  /// Converts this request object into a JSON-encodable format.
  Map<String, dynamic> toJson() => {
        if (totalPrice != null) 'totalPrice': totalPrice,
        if (currencyCode != null) 'currencyCode': currencyCode,
        if (billingAddressRequired != null)
          'billingAddressRequired': billingAddressRequired,
        if (googleMerchantID != null) 'googleMerchantID': googleMerchantID,
      };
}

class BraintreePayPalRequest {
  BraintreePayPalRequest({
    this.amount,
    this.currencyCode,
    this.displayName,
    this.billingAgreementDescription,
  });

  /// Amount of the transaction. If [amount] is `null`, PayPal will use the billing agreement (Vault) flow.
  /// If [amount] is set, PayPal will follow the one time payment (Checkout) flow.
  String amount;

  /// Currency code. If set to null`null`, PayPal will choose it based on the active merchant account in the client token.
  String currencyCode;

  /// The merchant name displayed in the PayPal flow. If set to `null`, PayPal will use the company name in your Braintree account.
  String displayName;

  /// Description for the billing agreement for the Vault flow.
  String billingAgreementDescription;

  /// Converts this request object into a JSON-encodable format.
  Map<String, dynamic> toJson() => {
        if (amount != null) 'amount': amount,
        if (currencyCode != null) 'currencyCode': currencyCode,
        if (displayName != null) 'displayName': displayName,
        if (billingAgreementDescription != null)
          'billingAgreementDescription': billingAgreementDescription,
      };
}
