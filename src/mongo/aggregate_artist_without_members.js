// Author: Franck MICHEL, University Cote d'Azur, CNRS, Inria
// Licensed under the Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0)


// Collection of all artists without field members
db.artist_without_members.drop()
db.artist.aggregate([
    { $project: { members: 0 }},
    { $out: "artist_without_members" }
])
