# Time-Related Changes in gist v11

Version 11 of gist includes two important changes to how we handle time.  First, we have deleted the `gist:TimeInstant` class and the object properties that used it.  In their place, we have added the `gist:atDateTime` data property with a number of sub-properties.  We have found that using data properties for all time-related relationships is both easier and more intuitive, and wanted gist to better support that.

This will be of greatest impact where you are using `gist:TimeInstant` class instances with `gist:Event` and `gist:TemporalRelation` instances, both of which rely on the `gist:hasStart` and `gist:hasEnd` properties.

The nature of these changes and the forms your data make take mean it is impossible to provide scripted code for data conversion.  Instead, we offer this guidance to assist you.

## Replacing gist:TimeInstant instances, gist:hasActual, gist:hasPlanned, gist:hasStart, gist:hasEnd

To accommodate the deletion of the `TimeInstant` class and its associated object properties, we have added a number of new sub-properties to the `gist:atDateTime` data property.  The new datatype sub-properties serve two different functions.

First, they allow you to explicitly call out the precision of the object data: date, year, minute, or microsecond.  The selection of precision is your choice.  But note that all the properties take the same `xsd:dateTime` range.  Any enforcement of your desired data precision will be up to you.

Second, the new sub-properties give you the semantic distinctions between start and end datetimes, and planned vs actual.

When adapting your existing `TimeInstant` data, there are several decisions you will need to make.

### **EXAMPLE**

Say you have the following use of TimeInstant in your extant data.

`:_x gist:hasPlannedEnd :_ti .`  
`:_ti a gist:DateInstant ;`  
`gist:localDateTime "2022-03-16T01:01:01Z-04:00"^^xsd:dateTime .`

Let's look at the decisions you will need to make in choosing how to adapt these triples to the new paradigm.

1. The extant instance is in the `gist:DateInstant` class.  Given the original `TimeInstant` instance was declared to be a `DateInstant`, we recommend that you use the `gist:plannedEndDate` property in your conversion.  But because the object literal includes precision to the minute level, you may choose a different property, depending upon the next decision.

2. Since the object literal includes precision to the minute level, **do you want to retain the precision or drop it?**  
 If you wish to drop the precision, your will need to change your object literal to `"2022-03-16T00:00:00Z-04:00"^^xsd:dateTime`.  
 If you choose to retain the precision, **do you want the data property to reflect that precision level**? If so, you should choose the `gist:plannedEndMinute` data property:

`:_x gist:plannedEndMinute "2022-03-16T01:01:01Z-04:00"^^xsd:dateTime .`

If you don't want the precision in the property name, you should use the `gist:plannedEndDate` or `gist:plannedEndDateTime` property:

 `:_x gist:plannedEndDate "2022-03-16T01:01:01Z-04:00"^^xsd:dateTime .`  
 `:_x gist:plannedEndDateTime "2022-03-16T01:01:01Z-04:00"^^xsd:dateTime .`

In any of these three cases, the object literal is the same.

3. The extant data includes the time zone offset.  **Do you want to retain the offset or drop it**?
  If you want to drop it, the literal value becomes either `"2022-03-16T01:01:01"^^xsd:dateTime` or `"2022-03-16T00:00:00"^^xsd:dateTime`, depending upon the choices you made above.
  If you wish to retain the time zone offset, **do you want to retain it in the literal value or express it as a separate value altogether**?
  If you wish to retain it in the literal, then no change is necessary.  This is our recommended approach.
  If you wish to express it as a separate value, then the literal becomes either `"2022-03-16T01:01:01"^^xsd:dateTime` or `"2022-03-16T00:00:00"^^xsd:dateTime`, depending upon the choices you made above.  Then you can assert relationships between the Subject `:_x` and the appropriate instances of `TimeZone`.

## Other changes

### Replacing gist:wasLastModifiedAt and gist:isRecordedAt

There is no property in gist version 11 corresponding to `gist:wasLastModifiedAt` or `gist:isRecordedAt`.  You should create a new data property in your domain, e.g., `ex:lastModifiedAtDateTime`, `ex:recordedAtDateTime`.  The conversion guidance given above can then be applied.

### Replacing gist:isSameTimeAs

If you are using the `gist:isSameTimeAs` from version 10, there is no corresponding conversion in gist version 11.  However, you can create a new object property in your domain to assert temporal alignment between subjects, e.g., `ex:hasSameEndTime`.  Say in your extant data you have two `TimeInstants` with these assertions:

`:_x gist:isSameTimeAs :y`  
`:_x gist:hasPlannedEnd :_tiX .`  
`:_tiX a gist:DateInstant ;`  
`gist:localDateTime "2022-03-16T01:01:01Z-04:00"^^xsd:dateTime .`  
`:_y gist:hasPlannedEnd :_tiY .`  
`:_tiY a gist:DateInstant ;`  
`gist:universalDateTime "2022-03-16T05:01:01Z+00:00"^^xsd:dateTime .`  

After following the `TimeInstant replacement instructions, you might have these two assertions:

`:_x gist:actualEndMinute "2022-03-16T01:01:01Z-04:00"^^xsd:dateTime .`  
 `:_y gist:actualEndMinute "2022-03-16T05:01:01Z+00:00"^^xsd:dateTime .`

Now you can apply your new object property:

 `:_x ex:hasSameEndTime :_y .`

**Note:** this assumes that your original data were correct, and that the literal values associated with the `TimeInstant`s were, in fact, the same.

### Replacing gist:localDateTime, gist:localTime

There is no corresponding direct conversion for these properties. If you are using either of them, the literals almost certainly already use the timezone offset.  So this becomes just another exercise in replacing the TimeInstant, described above.

### Replacing gist:universalDateTime, gist:universalTime

There is no corresponding direct conversion for these properties. If you are using either of them, you need to determine if your literals include the zero-value time offset `Z+00:00` or have no offset at all.  In the former case, you can proceed with the instructions for replacing the TimeInstant.  In the latter case, you will need to add the `Z+00:00` offset to your literals as part of you conversion process, and then follow the TimeInstant replacement instructions.

### Replacing gist:universalDateTime, gist:universalDate

If the International Date Line figures into your local-vs-universal date calculations, be sure to take this into consideration when choosing a replacement data property from version 11.
