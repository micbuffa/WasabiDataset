// Author: Franck MICHEL, University Cote d'Azur, CNRS, Inria
// Licensed under the Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0)

// Join the song and artist collections on the artist's Deezer id to add new field id_artist into collection song
db.song_artist_id.drop()
db.song.aggregate([

    { $match: { 'id_artist_deezer': {$ne: null}}},

    // Join song and artist on the artist's Deezer id
    { $lookup:
        { from:"artist_id", localField:"id_artist_deezer", foreignField:"id_artist_deezer", as:"artist_tmp" }
    },

    // Create a new id_artist array with the _id's of each artist
    { $addFields: { id_artist: {
        $map: {
            // Map the _id of each element into its string representation
            input: "$artist_tmp",
            as: "oneartist",
            in: { $toString: "$$oneartist._id"  }
        }
    }}},
    { $project: { artist_tmp: 0 }},

    { $out: "song_artist_id" }
])
