@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS - Root Entity Travel'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZDD_R_CUSTOMER_TRAVEL_437
  as select from zcustomers_437
  association [0..1] to /DMO/I_Customer as _Customer on $projection.CustomerId = _Customer.CustomerID
{
  key customer_uuid         as CustomerUuid,
      customer_id           as CustomerId,
      flight_date           as FlightDate,
      description           as Description,
      @Semantics.amount.currencyCode : 'CurrencyCode'
      price                 as Price,
      currency_code         as CurrencyCode,
      overall_status        as OverallStatus,
      // audit components
      @Semantics.user.createdBy: true
      local_created_by      as LocalCreatedBy,
      @Semantics.systemDateTime.createdAt
      local_created_at      as LocalCreatedAt,
      @Semantics.user.localInstanceLastChangedBy
      local_last_changed_by as LocalLastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,
      // Publication of associations
      _Customer
}
