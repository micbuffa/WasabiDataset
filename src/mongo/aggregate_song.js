// Author: Franck MICHEL, University Cote d'Azur, CNRS, Inria
// Licensed under the Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0)

db.song_nochords.drop()
db.song.aggregate([
    { $project: { chords_metadata: 0 }},
    
    // Replace https with http in all Wikipedia URLs to have a common format needed for creating DBpedia URIs )
    { $addFields: { urlWikipedia: { $replaceOne: { input: "$urlWikipedia",  find: "https://af.wikipedia.org/", replacement: "http://af.wikipedia.org/" }}}},
    { $addFields: { urlWikipedia: { $replaceOne: { input: "$urlWikipedia",  find: "https://da.wikipedia.org/", replacement: "http://da.wikipedia.org/" }}}},
    { $addFields: { urlWikipedia: { $replaceOne: { input: "$urlWikipedia",  find: "https://de.wikipedia.org/", replacement: "http://de.wikipedia.org/" }}}},
    { $addFields: { urlWikipedia: { $replaceOne: { input: "$urlWikipedia",  find: "https://en.wikipedia.org/", replacement: "http://en.wikipedia.org/" }}}},
    { $addFields: { urlWikipedia: { $replaceOne: { input: "$urlWikipedia",  find: "https://es.wikipedia.org/", replacement: "http://es.wikipedia.org/" }}}},
    { $addFields: { urlWikipedia: { $replaceOne: { input: "$urlWikipedia",  find: "https://eu.wikipedia.org/", replacement: "http://eu.wikipedia.org/" }}}},
    { $addFields: { urlWikipedia: { $replaceOne: { input: "$urlWikipedia",  find: "https://fi.wikipedia.org/", replacement: "http://fi.wikipedia.org/" }}}},
    { $addFields: { urlWikipedia: { $replaceOne: { input: "$urlWikipedia",  find: "https://fr.wikipedia.org/", replacement: "http://fr.wikipedia.org/" }}}},
    { $addFields: { urlWikipedia: { $replaceOne: { input: "$urlWikipedia",  find: "https://hr.wikipedia.org/", replacement: "http://hr.wikipedia.org/" }}}},
    { $addFields: { urlWikipedia: { $replaceOne: { input: "$urlWikipedia",  find: "https://hu.wikipedia.org/", replacement: "http://hr.wikipedia.org/" }}}},
    { $addFields: { urlWikipedia: { $replaceOne: { input: "$urlWikipedia",  find: "https://id.wikipedia.org/", replacement: "http://id.wikipedia.org/" }}}},
    { $addFields: { urlWikipedia: { $replaceOne: { input: "$urlWikipedia",  find: "https://it.wikipedia.org/", replacement: "http://it.wikipedia.org/" }}}},
    { $addFields: { urlWikipedia: { $replaceOne: { input: "$urlWikipedia",  find: "https://ja.wikipedia.org/", replacement: "http://ja.wikipedia.org/" }}}},
    { $addFields: { urlWikipedia: { $replaceOne: { input: "$urlWikipedia",  find: "https://nl.wikipedia.org/", replacement: "http://nl.wikipedia.org/" }}}},
    { $addFields: { urlWikipedia: { $replaceOne: { input: "$urlWikipedia",  find: "https://pt.wikipedia.org/", replacement: "http://pt.wikipedia.org/" }}}},
    { $addFields: { urlWikipedia: { $replaceOne: { input: "$urlWikipedia",  find: "https://pl.wikipedia.org/", replacement: "http://pl.wikipedia.org/" }}}},
    { $addFields: { urlWikipedia: { $replaceOne: { input: "$urlWikipedia",  find: "https://ru.wikipedia.org/", replacement: "http://ru.wikipedia.org/" }}}},
    { $addFields: { urlWikipedia: { $replaceOne: { input: "$urlWikipedia",  find: "https://tr.wikipedia.org/", replacement: "http://tr.wikipedia.org/" }}}},
    { $addFields: { urlWikipedia: { $replaceOne: { input: "$urlWikipedia",  find: "https://sv.wikipedia.org/", replacement: "http://sv.wikipedia.org/" }}}},
    { $addFields: { urlWikipedia: { $replaceOne: { input: "$urlWikipedia",  find: "https://vi.wikipedia.org/", replacement: "http://vi.wikipedia.org/" }}}},

    { $addFields: { uriDBpedia:  "$urlWikipedia" }},

    // Turn Wikipedia URL into DBpedia URI
    { $addFields: { uriDBpedia:  { $replaceOne: { input: "$uriDBpedia", find: "http://af.wikipedia.org/wiki/", replacement: "http://af.dbpedia.org/resource/" }}}},
    { $addFields: { uriDBpedia:  { $replaceOne: { input: "$uriDBpedia", find: "http://da.wikipedia.org/wiki/", replacement: "http://da.dbpedia.org/resource/" }}}},
    { $addFields: { uriDBpedia:  { $replaceOne: { input: "$uriDBpedia", find: "http://de.wikipedia.org/wiki/", replacement: "http://de.dbpedia.org/resource/" }}}},
    { $addFields: { uriDBpedia:  { $replaceOne: { input: "$uriDBpedia", find: "http://en.wikipedia.org/wiki/", replacement: "http://dbpedia.org/resource/" }}}},
    { $addFields: { uriDBpedia:  { $replaceOne: { input: "$uriDBpedia", find: "http://es.wikipedia.org/wiki/", replacement: "http://es.dbpedia.org/resource/" }}}},
    { $addFields: { uriDBpedia:  { $replaceOne: { input: "$uriDBpedia", find: "http://eu.wikipedia.org/wiki/", replacement: "http://eu.dbpedia.org/resource/" }}}},
    { $addFields: { uriDBpedia:  { $replaceOne: { input: "$uriDBpedia", find: "http://fi.wikipedia.org/wiki/", replacement: "http://fi.dbpedia.org/resource/" }}}},
    { $addFields: { uriDBpedia:  { $replaceOne: { input: "$uriDBpedia", find: "http://fr.wikipedia.org/wiki/", replacement: "http://fr.dbpedia.org/resource/" }}}},
    { $addFields: { uriDBpedia:  { $replaceOne: { input: "$uriDBpedia", find: "http://hr.wikipedia.org/wiki/", replacement: "http://hr.dbpedia.org/resource/" }}}},
    { $addFields: { uriDBpedia:  { $replaceOne: { input: "$uriDBpedia", find: "http://hu.wikipedia.org/wiki/", replacement: "http://hu.dbpedia.org/resource/" }}}},
    { $addFields: { uriDBpedia:  { $replaceOne: { input: "$uriDBpedia", find: "http://id.wikipedia.org/wiki/", replacement: "http://id.dbpedia.org/resource/" }}}},
    { $addFields: { uriDBpedia:  { $replaceOne: { input: "$uriDBpedia", find: "http://it.wikipedia.org/wiki/", replacement: "http://it.dbpedia.org/resource/" }}}},
    { $addFields: { uriDBpedia:  { $replaceOne: { input: "$uriDBpedia", find: "http://ja.wikipedia.org/wiki/", replacement: "http://ja.dbpedia.org/resource/" }}}},
    { $addFields: { uriDBpedia:  { $replaceOne: { input: "$uriDBpedia", find: "http://nl.wikipedia.org/wiki/", replacement: "http://nl.dbpedia.org/resource/" }}}},
    { $addFields: { uriDBpedia:  { $replaceOne: { input: "$uriDBpedia", find: "http://pt.wikipedia.org/wiki/", replacement: "http://pt.dbpedia.org/resource/" }}}},
    { $addFields: { uriDBpedia:  { $replaceOne: { input: "$uriDBpedia", find: "http://pl.wikipedia.org/wiki/", replacement: "http://pl.dbpedia.org/resource/" }}}},
    { $addFields: { uriDBpedia:  { $replaceOne: { input: "$uriDBpedia", find: "http://ru.wikipedia.org/wiki/", replacement: "http://ru.dbpedia.org/resource/" }}}},
    { $addFields: { uriDBpedia:  { $replaceOne: { input: "$uriDBpedia", find: "http://tr.wikipedia.org/wiki/", replacement: "http://tr.dbpedia.org/resource/" }}}},
    { $addFields: { uriDBpedia:  { $replaceOne: { input: "$uriDBpedia", find: "http://sv.wikipedia.org/wiki/", replacement: "http://sv.dbpedia.org/resource/" }}}},
    { $addFields: { uriDBpedia:  { $replaceOne: { input: "$uriDBpedia", find: "http://vi.wikipedia.org/wiki/", replacement: "http://vi.dbpedia.org/resource/" }}}},
        
    { $out: "song_nochords" }
])
