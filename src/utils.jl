const DATETIME_FORMAT = "yyyy-mm-ddTHH:MM:SSzzzz"

key_to_symbol(d::AbstractDict) = Dict(Symbol(k) => v for (k, v) in pairs(d) if v != "")

construct_from_dict(T::Type, d) = T(;key_to_symbol(d)...)
construct(T::Type, d::AbstractVector) = construct_from_dict.(T, d)

function parse_dict_helper(T::Type, d::AbstractDict, 
                           mapping::AbstractDict, timefields::AbstractVector)
    d_args = key_to_symbol(d)
    for (k, T) in pairs(mapping)
        haskey(d_args, k) || continue
        d_args[k] = construct(T, d_args[k])
    end
    for k in timefields
        haskey(d_args, k) || continue
        d_args[k] = ZonedDateTime(d_args[k], DATETIME_FORMAT)
    end
    return T(;d_args...)
end

function parse_dict(Release, d::AbstractDict)
    mapping = Dict(
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
    )
    timefields = [:date_added, :date_changed]
    return parse_dict_helper(Release, d, mapping, timefields)
end
