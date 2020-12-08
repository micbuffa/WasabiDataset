// Author: Franck MICHEL, University Cote d'Azur, CNRS, Inria
// Licensed under the Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0)

db.song_chords.drop()
db.song_enhanced_chords.aggregate([

    // Remove anything but the chords
    { $project: { chords_metadata: 1 }},

    // Round duration to max 8 decimals 
    // (because of a bug of Jena that fails to create some xsd:duration instances with more than 8 decimals)
    {$addFields: { "chords_metadata.round_duration" : {$trunc: [ "$chords_metadata.duration", 8 ]}}},

    { $out: "song_chords" }
])
