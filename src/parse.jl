const DATETIME_FORMAT = "yyyy-mm-ddTHH:MM:SSzzzz"

key_to_symbol(x) = x
function key_to_symbol(d::AbstractDict) 
    Dict(Symbol(k) => key_to_symbol(v) for (k, v) in pairs(d) if v != "" && v != [])
end
key_to_symbol(v::AbstractVector) = key_to_symbol.(v)

mapping(T::Type, d::AbstractDict) = T(;d...)
mapping(T::Type, v::AbstractVector) = mapping.(T, v)

function mapping(T::Type, d::AbstractDict, transformation::AbstractDict)
    for (k, v) in pairs(transformation)
        haskey(d, k) || continue
        d[k] = mapping(v, d[k])
    end
    return T(;d...)
end

mapping(::Type{ZonedDateTime}, s::AbstractString) = ZonedDateTime(s, DATETIME_FORMAT)

function mapping(::Type{Release}, d::AbstractDict)
    transformation = Dict(
        :community => Community,
        :artists => TrackArtist,
        :companies => Company,
        :contributors => Contributor,
        :extraartists => TrackArtist,
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
    return mapping(Release, d, transformation)
end

function mapping(::Type{Community}, d::AbstractDict)
    transformation = Dict(
        :rating => Rating,
        :contributors => Contributor,
        :submitter => Contributor,
    )
    return mapping(Community, d, transformation)
end

function mapping(::Type{Track}, d::AbstractDict)
    transformation = Dict(
        :artists => TrackArtist,
        :extraartists => TrackArtist
    )
    return mapping(Track, d, transformation)
end

function mapping(::Type{Artist}, d::AbstractDict)
    transformation = Dict(
        :aliases => Member,
        :members => Member,
        :images => Image,
    )
    return mapping(Artist, d, transformation)
end

parse_dict(T::Type, d::AbstractDict) = mapping(T, key_to_symbol(d))
