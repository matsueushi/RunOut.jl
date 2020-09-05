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
    rating
    status::String = ""
    have::UInt = 0
    contributors::Vector{Contributor} = Contributor[]
    submitter::Union{Contributor, Nothing} = nothing
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
    id::Union{UInt, Nothing} = nothing
    title::Union{String, Nothing} = nothing
    artists::Vector{Artist} = Artist[]
    artists_sort::Union{String, Nothing} = nothing
    data_quality::Union{String, Nothing} = nothing
    thumb::Union{String, Nothing} = nothing
    community = nothing
    companies::Vector{Company} = Company[]
    country::Union{String, Nothing} = nothing
    date_added::Union{ZonedDateTime, Nothing} = nothing
    date_changed::Union{ZonedDateTime, Nothing} = nothing
    estimated_weight::Union{UInt, Nothing} = nothing
    extraartists::Vector{Artist} = Artist[]
    format_quantity::Union{Int64, Nothing} = nothing
    formats::Vector{Format} = Format[]
    genres::Union{Vector{String}, Nothing} = nothing
    identifiers::Vector{Identifier} = Identifier[]
    images::Vector{Image} = Image[]
    labels::Vector{Label} = Label[]
    lowest_price::Union{Real, Nothing} = nothing
    master_id::Union{UInt, Nothing} = nothing
    master_url::Union{String, Nothing} = nothing
    notes::Union{String, Nothing} = nothing
    num_for_sale::Union{UInt, Nothing} = nothing
    released::Union{String, Nothing} = nothing
    released_formatted::Union{String, Nothing} = nothing
    resource_url::Union{String, Nothing} = nothing
    series::Union{Vector{String}, Nothing} = nothing 
    status::Union{String, Nothing} = nothing
    styles::Union{Vector{String}, Nothing} = nothing
    tracklist::Vector{Track} = Track[]
    uri::Union{String, Nothing} = nothing
    videos::Vector{Video} = Video[]
    year::Union{UInt, Nothing} = nothing
end
