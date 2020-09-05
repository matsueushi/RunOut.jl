key_to_symbol(d) = Dict(Symbol(k) => v for (k, v) in pairs(d) if v != "")

construct(cls, d) = cls(;key_to_symbol(d)...)

function parse_json(j)
    release_json = key_to_symbol(j)
    mapping = Dict(
        :artists => Artist,
        :companies => Company,
        :extraartists => Artist,
        :formats => Format,
        :identifiers => Identifier,
        :images => Image,
        :labels => Label,
        :tracklist => Track,
        :videos => Video,
    )
    for (k, v) in pairs(mapping)
        haskey(release_json, k) || continue
        release_json[k] = construct.(v, release_json[k])
    end
    timefields = [:date_added, :date_changed]
    for k in timefields
        haskey(release_json, k) || continue
        release_json[k] = ZonedDateTime(release_json[k], "yyyy-mm-ddTHH:MM:SSzzzz")
    end
    Release(;release_json...)
end


