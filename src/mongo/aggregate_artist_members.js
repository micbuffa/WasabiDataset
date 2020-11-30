// Author: Franck MICHEL, University Cote d'Azur, CNRS, Inria
// Licensed under the Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0)


// Collection of only the artists that have members, and add new array members_id with the members' artist document ids
db.artist_members.drop()
db.artist.aggregate([

    /* { $match: { "members": {$ne: null}}},
    { $limit: 1000 }, */
    
    // Join song and artist on the artist's Deezer id
    { $lookup:
        { from:"artist_id", 
          localField:"members.id_member_musicbrainz", 
          foreignField:"id_artist_musicbrainz", 
          as:"members_tmp" }
    },

    // Remove elements from 'members' for which was found a match (those that are now in members_tmp)
    { $project: {
        'members_tmp': 1,
        'members': { $filter: { 
            input: "$members",  
            cond: { $not: { $in: [ "$$this.id_member_musicbrainz", "$members_tmp.id_artist_musicbrainz" ] }}
        }},
    }},


    // Create a new members_id array with the _id's of each artist for which there was a match in the lookup
    { $addFields: { members_id: {
        $map: {
            // Map the _id of each element into its string representation
            input: "$members_tmp",
            as: "oneartist",
            in: { $toString: "$$oneartist._id"  }
        }
    }}},
    { $project: { members_tmp: 0 }},
    
    { $out: "artist_members" }
])
