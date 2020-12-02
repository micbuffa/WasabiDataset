// Author: Franck MICHEL, University Cote d'Azur, CNRS, Inria
// Licensed under the Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0)

db.song_nochords.drop()
db.song.aggregate([
    { $project: { chords_metadata: 0 }},
    { $out: "song_nochords" }
])

db.song_chords.drop()
db.song.aggregate([
    { $project: { chords_metadata: 1 }},
    { $out: "song_chords" }
])

