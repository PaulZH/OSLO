[QueryGroup="demo"] @collection [[
[QueryItem="1 adres"]
SELECT * {<http://id.vlaanderen.be/id/adres/84401> ?p ?v.}

[QueryItem="1 straat"]
SELECT * {<http://id.vlaanderen.be/id/straat/83530> ?p ?v.}

[QueryItem="1 gemeente"]
SELECT * {<http://id.vlaanderen.be/id/gemeente/2> ?p ?v.}

[QueryItem="zoek een straat"]
SELECT *
WHERE {?x  <http://www.opengis.net/ont/geosparql#sfWithin>  <http://id.vlaanderen.be/id/gemeente/77>;
              rdfs:label ?label;
              a ?type.
              FILTER (lang(?label)='nl' && STRSTARTS(?label,'Baron'))}

[QueryItem="zoek een straat gelimiteerd"]
SELECT *
WHERE {?x  <http://www.opengis.net/ont/geosparql#sfWithin>  <http://id.vlaanderen.be/id/gemeente/77>;
              rdfs:label ?label;
              a ?type.
              FILTER (lang(?label)='nl' && STRSTARTS(?label,'Baron'))}
ORDER BY ?label
LIMIT 1

[QueryItem="1 geometry"]
SELECT * {<http://id.vlaanderen.be/id/geometry/adres/84401> ?p ?v.}

[QueryItem="types"]
SELECT DISTINCT ?type WHERE {?x a ?type.}

[QueryItem="aantal straten per gemeente"]
SELECT ?gemeente (count(?straat) as ?aantalstraten)
WHERE
{?gemeente a <http://dbpedia.org/ontology/City>. 
?straat <http://www.opengis.net/ont/geosparql#sfWithin> ?gemeente.}
GROUP BY ?gemeente
ORDER BY DESC(?aantalstraten)

[QueryItem="straatnaam beginnend met X per gemeente"]
SELECT ?gemeente ?straatlabel 
WHERE {?gemeente a <http://dbpedia.org/ontology/City>. ?straat <http://www.opengis.net/ont/geosparql#sfWithin> ?gemeente; rdfs:label ?straatlabel.
FILTER (STRSTARTS(?straatlabel,'Den'))}
ORDER BY ?gemeente ?straatlabel

[QueryItem="straten van 1gemeente"]
SELECT  ?straatlabel
WHERE 
 {?gemeente a <http://dbpedia.org/ontology/City>; 
rdfs:label ?gemeentenaam. 
FILTER (STRSTARTS(?gemeentenaam,'Geel'))
 ?straat <http://www.opengis.net/ont/geosparql#sfWithin> ?gemeente; 
<http://www.w3.org/2004/02/skos/core#prefLabel> ?straatlabel.}
ORDER BY ?straatlabel
]]
