@AbapCatalog.sqlViewName: 'ZSQLCARRIERTECH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Carrier Detail'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
define view zi_carrier_tech_r_1 as select from /dmo/carrier
{

    key carrier_id as CarrierId,
    @Semantics.text : true
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold : 0.8
    name as Name,
    currency_code as CurrencyCode
  
}
