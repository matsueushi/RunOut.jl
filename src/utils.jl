const DATETIME_FORMAT = "yyyy-mm-ddTHH:MM:SSzzzz"

key_to_symbol(x) = x
function key_to_symbol(d::AbstractDict) 
    Dict(Symbol(k) => key_to_symbol(v) for (k, v) in pairs(d) if v != "" && v != [])
end
key_to_symbol(v::AbstractVector) = key_to_symbol.(v)

function construct(T::Type, d::AbstractDict; mapping::AbstractDict = Dict())
    for (k, T) in pairs(mapping)
        haskey(d, k) || continue
        d[k] = construct(T, d[k])
    end
    return T(;d...)
end
construct(T::Type, v::AbstractVector) = construct.(T, v)
construct(::Type{ZonedDateTime}, s::AbstractString) = ZonedDateTime(s, DATETIME_FORMAT)

function parse_dict(::Type{Release}, d::AbstractDict)
    mapping = Dict(
        :community => Community,
        :artists => Artist,
        :companies => Company,
        :contributors => Contributor,
        :extraartists => Artist,
        :formats => Format,
        :identifiers => Identifier,
        :images => Image,
        :labels => Label,
        :tracklist => Track,
        :videos => Video,
        :date_added => ZonedDateTime,
        :date_changed => ZonedDateTime,
    )
    return construct(Release, d; mapping)
end

apply_parse(T::Type, d::AbstractDict) = parse_dict(T, key_to_symbol(d))
