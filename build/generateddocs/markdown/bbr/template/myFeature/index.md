
# Custom Feature (Schema)

`ogc.bbr.template.myFeature` *v1.0*

This examples shows a simple customisation for OGC API Feature schemas

[*Status*](http://www.opengis.net/def/status): Under development

## Description

## Custom Feature Type 

This building block illustrates a typical "Feature Type" - where an object is modelled as a "Feature with geometry", but has its own "native schema" - or "domain model".

This is an **interoperable** approach to defining a Feature, allowing re-use of a well-defined domain model.

i.e. the attributes (properties) are managed independently of the packaging container (Feature) 

the **mySchema" building block is referenced by this container, complete with an example of semantic annotations for the domain model.  It may inherit reusable sub-components using the same mechanisms - after all there is usually a lot in common across a range of FeatureTypes in any environment.  

This building block **inherits** reusable semantic annotations from a common library, simplifying implementation. 




## Examples

### GeoJSON - specialisation example.
This examples shows how to define a customised schema based on an existing building block - in this case the *OGC API Features* basic GeoJSON Feature response
#### json
```json
{
  "@context": {
    "mynamespace": "http://example.org/ns1/"
  },
  "id": "f1",
  "type": "Feature",
  "geometry": {
    "type": "LineString",
    "coordinates": [
      [
        -111.67183507997295,
        40.056709946862874
      ],
      [
        -111.71,
        40.156709946862874
      ]
    ]
  },
  "properties": {
    "a": "mynamespace:aThing",
    "b": 23,
    "c": 0.1
  }
}

```

#### yaml
```yaml
id: 16
type: Feature
geometry: null
properties:
  a: mynamespace:aThing
  b: 23
  c: 0.1

```

#### jsonld
```jsonld
{
  "@context": [
    {
      "mynamespace": "http://example.com/mythings/"
    },
    "https://opengeospatial.github.io/bblocks-template/build/annotated/bbr/template/myFeature/context.jsonld",
    {
      "mynamespace": "http://example.org/ns1/"
    }
  ],
  "id": "f1",
  "type": "Feature",
  "geometry": {
    "type": "LineString",
    "coordinates": [
      [
        -111.67183507997295,
        40.056709946862874
      ],
      [
        -111.71,
        40.156709946862875
      ]
    ]
  },
  "properties": {
    "a": "mynamespace:aThing",
    "b": 23,
    "c": 0.1
  }
}
```

#### ttl
```ttl
@prefix geojson: <https://purl.org/geojson/vocab#> .
@prefix mynamespace: <http://example.org/ns1/> .
@prefix ns1: <https://example.org/my-bb-model/> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .

<http://example.com/features/f1> a mynamespace:aThing,
        geojson:Feature ;
    ns1:b 23 ;
    ns1:c 1e-01 ;
    geojson:geometry [ a geojson:LineString ;
            geojson:coordinates ( ( -1.116718e+02 4.005671e+01 ) ( -1.1171e+02 4.015671e+01 ) ) ] .


```

## Schema

```yaml
$schema: https://json-schema.org/draft/2020-12/schema
description: Example of a simple GeoJSON Feature specialisation
$defs:
  MyFeature:
    allOf:
    - $ref: https://opengeospatial.github.io/bblocks/annotated-schemas/geo/features/feature/schema.yaml
    - properties:
        properties:
          $ref: https://opengeospatial.github.io/bblocks-template/build/annotated/bbr/template/mySchema/schema.yaml
anyOf:
- $ref: '#/$defs/MyFeature'

```

Links to the schema:

* YAML version: [schema.yaml](https://opengeospatial.github.io/bblocks-template/build/annotated/bbr/template/myFeature/schema.json)
* JSON version: [schema.json](https://opengeospatial.github.io/bblocks-template/build/annotated/bbr/template/myFeature/schema.yaml)


# JSON-LD Context

```jsonld
{
  "@context": {
    "Feature": "geojson:Feature",
    "FeatureCollection": "geojson:FeatureCollection",
    "GeometryCollection": "geojson:GeometryCollection",
    "LineString": "geojson:LineString",
    "MultiLineString": "geojson:MultiLineString",
    "MultiPoint": "geojson:MultiPoint",
    "MultiPolygon": "geojson:MultiPolygon",
    "Point": "geojson:Point",
    "Polygon": "geojson:Polygon",
    "features": {
      "@container": "@set",
      "@id": "geojson:features"
    },
    "type": "@type",
    "id": "@id",
    "properties": "@nest",
    "geometry": {
      "@context": {
        "coordinates": {
          "@container": "@list",
          "@id": "geojson:coordinates"
        }
      },
      "@id": "geojson:geometry"
    },
    "bbox": {
      "@container": "@list",
      "@id": "geojson:bbox"
    },
    "links": {
      "@context": {
        "href": {
          "@type": "@id",
          "@id": "oa:hasTarget"
        },
        "rel": {
          "@context": {
            "@base": "http://www.iana.org/assignments/relation/"
          },
          "@id": "http://www.iana.org/assignments/relation",
          "@type": "@id"
        },
        "type": "dct:type",
        "hreflang": "dct:language",
        "title": "rdfs:label",
        "length": "dct:extent"
      },
      "@id": "rdfs:seeAlso"
    },
    "geojson": "https://purl.org/geojson/vocab#",
    "rdfs": "http://www.w3.org/2000/01/rdf-schema#",
    "oa": "http://www.w3.org/ns/oa#",
    "dct": "http://purl.org/dc/terms/",
    "a": "@type",
    "b": "https://example.org/my-bb-model/b",
    "c": "https://example.org/my-bb-model/c",
    "@version": 1.1
  }
}
```

You can find the full JSON-LD context here:
[context.jsonld](https://opengeospatial.github.io/bblocks-template/build/annotated/bbr/template/myFeature/context.jsonld)

## Sources

* [OGC API - Features, Part 1, 7.16.2: Feature Response](https://docs.ogc.org/is/17-069r3/17-069r3.html#_response_7)

# For developers

The source code for this Building Block can be found in the following repository:

* URL: [https://github.com/opengeospatial/bblocks-template](https://github.com/opengeospatial/bblocks-template)
* Path: `_sources/myFeature`

