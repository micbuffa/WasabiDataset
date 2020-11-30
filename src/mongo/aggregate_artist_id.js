// Author: Franck MICHEL, University Cote d'Azur, CNRS, Inria
// Licensed under the Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0)

// Collection of all artists with only their ids from Deezer, Musicbrainz and Discogs
db.artist_id.drop()
db.artist.aggregate([
    // Remove all fields but name and ids
    { $project: { 
        'id_artist_deezer': 1,
        'id_artist_discogs': 1,
        'id_artist_musicbrainz': 1
    } },
    { $out: "artist_id" }
])

db.artist_id.createIndex({id_artist_deezer: 1})
db.artist_id.createIndex({id_artist_discogs: 1})
db.artist_id.createIndex({id_artist_musicbrainz: 1})
