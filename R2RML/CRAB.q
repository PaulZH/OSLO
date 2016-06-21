[QueryGroup="demo"] @collection [[
[QueryItem="adres"]
SELECT * {<http://id.vlaanderen.be/id/adres/84401> ?p ?v.}

[QueryItem="straat"]
SELECT * {<http://id.vlaanderen.be/id/straat/83530> ?p ?v.}

[QueryItem="gemeente"]
SELECT * {<http://id.vlaanderen.be/id/gemeente/2> ?p ?v.}

[QueryItem="zoek op straat"]
SELECT *
WHERE {?x  <http://www.opengis.net/ont/geosparql#sfWithin>  <http://id.vlaanderen.be/id/gemeente/77>;
              rdfs:label ?label;
              a ?type.
              FILTER (lang(?label)='nl' && STRSTARTS(?label,'Baron'))}

[QueryItem="zoek gelimiteerd"]
SELECT *
WHERE {?x  <http://www.opengis.net/ont/geosparql#sfWithin>  <http://id.vlaanderen.be/id/gemeente/77>;
              rdfs:label ?label;
              a ?type.
              FILTER (lang(?label)='nl' && STRSTARTS(?label,'Baron'))}
ORDER BY ?label
LIMIT 1

[QueryItem="geometry"]
SELECT * {<http://id.vlaanderen.be/id/geometry/adres/84401> ?p ?v.}

[QueryItem="types"]
SELECT DISTINCT ?type WHERE {?x a ?type.}

[QueryItem="advanced"]
SELECT ?gemeente (count(?straat) as ?aantalstraten)
WHERE
{?gemeente a <http://dbpedia.org/ontology/City>. 
?straat <http://www.opengis.net/ont/geosparql#sfWithin> ?gemeente.}
GROUP BY ?gemeente
ORDER BY DESC(?aantalstraten)

[QueryItem="straat_per_gemeente"]
SELECT ?gemeente ?straatlabel 
WHERE {?gemeente a <http://dbpedia.org/ontology/City>. ?straat <http://www.opengis.net/ont/geosparql#sfWithin> ?gemeente; rdfs:label ?straatlabel.
FILTER (STRSTARTS(?straatlabel,'Den'))}
ORDER BY ?gemeente ?straatlabel

[QueryItem="straat_per_1gemeente"]
SELECT ?gemeentenaam ?straatlabel
WHERE 
 {?gemeente a <http://dbpedia.org/ontology/City>; 
rdfs:label ?gemeentenaam. 
FILTER (STRSTARTS(?gemeentenaam,'Geel'))
 ?straat <http://www.opengis.net/ont/geosparql#sfWithin> ?gemeente; 
rdfs:label ?straatlabel.}
ORDER BY ?straatlabel
]]
