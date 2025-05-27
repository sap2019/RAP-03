@AbapCatalog.sqlViewName: 'ZICONNECTIONTECH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Connection view'
@Metadata.ignorePropagatedAnnotations: true

@UI.headerInfo :{
    typeName: 'Connection',
    typeNamePlural: 'Connections'
}


define view zi_connection_technomaniac_1
  as select from /dmo/connection as Connection
  association [1..*] to zi_flight_techr_1 as _Flight on  $projection.CarrierId    = _Flight.CarrierId
                                                    and $projection.ConnectionId = _Flight.ConnectionId
association [1] to zi_carrier_tech_r_1 as _Airline on $projection.CarrierId = _Airline.CarrierId
{
      @UI.facet: [{ id: 'Connection',
      purpose: #STANDARD,
      type: #IDENTIFICATION_REFERENCE,
      position:10,
      label: 'Connection Detail' },
      {id: 'Flight',
      purpose: #STANDARD,
      type: #LINEITEM_REFERENCE,
      position:20,
      label: 'Flights' ,
      targetElement :'_Flight'}]
      
      @UI.lineItem: [{ position:10 }]
      
      @UI.identification: [{ position:10 }]
      @ObjectModel.text.association:'_Airline'
  key carrier_id      as CarrierId,
      @UI.lineItem: [{ position:20 }]
      
      @UI.identification: [{ position:20 }]
      //    @Consumption.valueHelpDefinition: [ {entity: {name: '/DMO/CONNECTION', element: 'Connection_ID'} } ]
  key connection_id   as ConnectionId,
      @UI.lineItem: [{ position:30 }]
      @UI.identification: [{ position:30 }]
      @UI.selectionField: [{ position:10 }]
      airport_from_id as AirportFromId,
      @UI.lineItem: [{ position:40 }]
      @UI.identification: [{ position:40 }]
      @UI.selectionField: [{ position:20 }]
      airport_to_id   as AirportToId,
      @UI.lineItem: [{ position:50 , label: 'Deparature Time'}]
      departure_time  as DepartureTime,
      @UI.lineItem: [{ position:60 , label : 'Arrival Time'}]
      arrival_time    as ArrivalTime,
      @Semantics.quantity.unitOfMeasure: 'DistanceUnit'
      @UI.identification: [{ position:50 }]
      distance        as Distance,
      @UI.identification: [{ position:60 }]
      distance_unit   as DistanceUnit,
      //Association
      _Flight,
      _Airline
}
