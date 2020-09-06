const DATETIME_FORMAT = "yyyy-mm-ddTHH:MM:SSzzzz"

key_to_symbol(x) = x
function key_to_symbol(d::AbstractDict) 
    Dict(Symbol(k) => key_to_symbol(v) for (k, v) in pairs(d) if v != "" && v != [])
end
key_to_symbol(v::AbstractVector) = key_to_symbol.(v)

construct(T::Type, d::AbstractDict) = T(;d...)
construct(T::Type, v::AbstractVector) = construct.(T, v)
function construct(T::Type, d::AbstractDict, mapping::AbstractDict)
    for (k, T) in pairs(mapping)
        haskey(d, k) || continue
        d[k] = construct(T, d[k])
    end
    return T(;d...)
end

construct(::Type{ZonedDateTime}, s::AbstractString) = ZonedDateTime(s, DATETIME_FORMAT)

function construct(::Type{Release}, d::AbstractDict)
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
        :series => Label,
        :tracklist => Track,
        :videos => Video,
        :date_added => ZonedDateTime,
        :date_changed => ZonedDateTime,
    )
    return construct(Release, d, mapping)
end

function construct(::Type{Community}, d::AbstractDict)
    mapping = Dict(
        :rating => Rating,
        :contributors => Contributor,
        :submitter => Contributor,
    )
    return construct(Community, d, mapping)
end

function construct(::Type{Track}, d::AbstractDict)
    mapping = Dict(
        :extraartists => Artist
    )
    return construct(Track, d, mapping)
end

parse_dict(T::Type, d::AbstractDict) = construct(T, key_to_symbol(d))
