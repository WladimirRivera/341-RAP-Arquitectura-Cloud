@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZC_CUSTOMERS2_437
  provider contract transactional_query
  as projection on ZR_CUSTOMERS2_437
{
  key CustomerUuid,
  key FlightDate,
  key CustomerId,
  Description,
  Price,
  @Semantics.currencyCode: true
  CurrencyCode,
  OverallStatus,
  LocalCreatedBy,
  LocalCreatedAt,
  LocalLastChangedBy,
  LocalLastChangedAt,
  LastChangedAt
  
}
