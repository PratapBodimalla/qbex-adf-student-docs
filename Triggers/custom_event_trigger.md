### Custom Event Trigger

## Paylod

```json


[
  {
    "subject": "adffactory",
    "id": 1000,
    "eventType": "adfpipeline",
  "eventTime": "2017-08-10T21:03:07+00:00",
    "data":{
     "fname": "yogi",
    "lname": "bodimalla",
    "age":43,
    "userType": "new student"
    },
  "dataVersion": "1.0",
    "metadataVersion": "1"
  }
]

```

## headers

aeg-sas-key : <Access key>

## use the Topic end point

https://<>.eventgrid.azure.net/api/events

## System Parameters:

```scala
@triggerBody().event.eventType
@triggerBody().event.subject
@triggerBody().event.data.fname
@trigger().startTime
```