@with_kw struct Artist
    id::UInt = 0
    name::String = ""
    anv::String = ""
    join::String = ""
    resource_url::String = ""
    role::String = ""
    tracks::String = ""
end


@with_kw struct Contributor
    username::String = ""
    resource_url::String = ""
end


@with_kw struct Community
    data_quality::String = ""
    want::UInt = 0
    rating = nothing
    status::String = ""
    have::UInt = 0
    contributors = nothing
    submitter = nothing
end


@with_kw struct Company
    id::UInt = 0
    name::String = ""
    catno::String = ""
    entity_type::UInt = 0
    entity_type_name::String = ""
    resource_url::String = ""
end


@with_kw struct Identifier
    value::String = ""
    type::String = ""
    description::String = ""
end


@with_kw struct Format
    name::String = ""
    descriptions::Vector{String} = String[]
    qty::String = ""
end


@with_kw struct Image
    uri::String = ""
    uri150::String = ""
    resource_url::String = ""
    height::UInt = 0
    width::UInt = 0
    type::String = ""
end


@with_kw struct Label
    id::UInt = 0
    name::String = ""
    resource_url::String = ""
    catno::String = ""
    entity_type::String = ""
    entity_type_name::String = ""
end


@with_kw struct Track
    position::String = ""
    title::String = ""
    duration::UInt = 0
    type_::String = ""
end


@with_kw struct Video
    duration::UInt = 0
    uri::String = ""
    embed::Bool = false
    title::String = ""
    description::String = ""
end


@with_kw struct Release
    id::UInt = 0
    title::String = ""
    resource_url::String = ""

    artists::Union{Vector{Artist}, Nothing} = nothing
    artists_sort::Union{String, Nothing} = nothing
    data_quality::Union{String, Nothing} = nothing
    thumb::Union{String, Nothing} = nothing
    community::Union{Community, Nothing} = nothing
    companies::Union{Vector{Company}, Nothing} = nothing
    country::Union{String, Nothing} = nothing
    date_added::Union{ZonedDateTime, Nothing} = nothing
    date_changed::Union{ZonedDateTime, Nothing} = nothing
    estimated_weight::Union{UInt, Nothing} = nothing
    extraartists::Union{Vector{Artist}, Nothing} = nothing
    format_quantity::Union{Int64, Nothing} = nothing
    formats::Union{Vector{Format}, Nothing} = nothing
    genres::Union{Vector{String}, Nothing} = nothing
    identifiers::Union{Vector{Identifier}, Nothing} = nothing
    images::Union{Vector{Image}, Nothing} = nothing
    labels::Union{Vector{Label}, Nothing} = nothing
    lowest_price::Union{Real, Nothing} = nothing
    master_id::Union{UInt, Nothing} = nothing
    master_url::Union{String, Nothing} = nothing
    notes::Union{String, Nothing} = nothing
    num_for_sale::Union{UInt, Nothing} = nothing
    released::Union{String, Nothing} = nothing
    released_formatted::Union{String, Nothing} = nothing
    series::Union{Vector{String}, Nothing} = nothing 
    status::Union{String, Nothing} = nothing
    styles::Union{Vector{String}, Nothing} = nothing
    tracklist::Union{Vector{Track}} = nothing
    uri::Union{String, Nothing} = nothing
    videos::Union{Vector{Video}, Nothing} = nothing
    year::Union{UInt, Nothing} = nothing
end
