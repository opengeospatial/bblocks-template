
# My Schema (Schema)

`ogc.bbr.template.mySchema` *v0.1*

An example schema defining the set of properties of any type of object.

[*Status*](http://www.opengis.net/def/status): Under development

## Description

## My Schema

Defines a set of properties that may be used in **any** JSON schema.

> Note these properties may be used in the "properties" sub-component of a GeoJSON object, as a simple object

The numeric properties "b" and "c" have an example SHACL rule that if c is present, then c > b
## Examples

### This is an example with just a description and no code snippets.
This an example.

In **Markdown** format.
#### json
```json
{
  "a": "mynamespace:aThing",
  "b": 23,
  "c": 1
}


```

#### jsonld
```jsonld
{
  "@context": [
    {
      "mynamespace": "http://example.com/mythings/"
    },
    "https://opengeospatial.github.io/bblocks-template/build/annotated/bbr/template/mySchema/context.jsonld"
  ],
  "a": "mynamespace:aThing",
  "b": 23,
  "c": 1
}
```

#### ttl
```ttl
@prefix mynamespace: <http://example.com/mythings/> .
@prefix ns1: <https://example.org/my-bb-model/> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .

[] a mynamespace:aThing ;
    ns1:b 23 ;
    ns1:c 1 .


```


### Examples can have content and/or code snippets.
The content of this example. 
#### shell
```shell
echo 'Hello, world!'
```

#### python
```python
print('Hello, world!')
```

#### javascript
```javascript
console.log('Hello, world!')
```

## Schema

```yaml
$schema: https://json-schema.org/draft/2020-12/schema
description: My example schema
type: object
properties:
  a:
    type: string
    format: uri
    x-jsonld-id: '@type'
  b:
    type: number
    x-jsonld-id: https://example.org/my-bb-model/b
  c:
    type: number
    x-jsonld-id: https://example.org/my-bb-model/c
required:
- a
- b

```

Links to the schema:

* YAML version: [schema.yaml](https://opengeospatial.github.io/bblocks-template/build/annotated/bbr/template/mySchema/schema.json)
* JSON version: [schema.json](https://opengeospatial.github.io/bblocks-template/build/annotated/bbr/template/mySchema/schema.yaml)


# JSON-LD Context

```jsonld
{
  "@context": {
    "a": "@type",
    "b": "https://example.org/my-bb-model/b",
    "c": "https://example.org/my-bb-model/c",
    "@version": 1.1
  }
}
```

You can find the full JSON-LD context here:
[context.jsonld](https://opengeospatial.github.io/bblocks-template/build/annotated/bbr/template/mySchema/context.jsonld)

## Sources

* [Sample source document](https://example.com/sources/1)

# For developers

The source code for this Building Block can be found in the following repository:

* URL: [https://github.com/opengeospatial/bblocks-template](https://github.com/opengeospatial/bblocks-template)
* Path: `_sources/mySchema`

