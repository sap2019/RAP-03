@AbapCatalog.sqlViewName: 'ZSQLFLIGHTTECH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight Information'
@Metadata.ignorePropagatedAnnotations: true

define view zi_flight_techr_1 as select from /dmo/flight
association [1] to zi_carrier_tech_r_1 as _Airline on $projection.CarrierId = _Airline.CarrierId

{
@UI.lineItem: [{ position:10 }]
 @ObjectModel.text.association:'_Airline'
  @Search.defaultSearchElement: true
    key carrier_id as CarrierId,
    @UI.lineItem: [{ position:20 }]
    key connection_id as ConnectionId,
    @UI.lineItem: [{ position:30 }]
    key flight_date as FlightDate,
    @UI.lineItem: [{ position:40 }]
    @Semantics.amount.currencyCode:'CurrencyCode'
    price as Price,
    @UI.lineItem: [{ position:50 }]
    currency_code as CurrencyCode,
    @UI.lineItem: [{ position:60 }]
     
      @Search.defaultSearchElement: true
    plane_type_id as PlaneTypeId,
    @UI.lineItem: [{ position:70 }]
    seats_max as SeatsMax,
    @UI.lineItem: [{ position:80 }]
    seats_occupied as SeatsOccupied,
    _Airline
}
