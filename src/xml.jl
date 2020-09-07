function append_tag!(tags, kind, info)
    isnothing(info) && return
    tag = ElementNode("tag")
    link!(tag, AttributeNode("name", kind))
    link!(tag, AttributeNode("value", "$info"))
    link!(tags, tag)
end

clean_artist_name(artist_name) = replace(artist_name, r" \(\d\)$" => "")

function generate_xml(release::Release)
    docs = []
    for track in release.tracklist
        doc = XMLDocument()
        tags = ElementNode("tags")
        append_tag!(tags, "ALBUM", release.title)
        append_tag!(tags, "YEAR", release.year)
        append_tag!(tags, "TITLE", track.title)
        append_tag!(tags, "TRACKNUMBER", track.position)
        isnothing(release.genres) || append_tag!(tags, "GENRE", release.genres[1])
        if isnothing(track.artists)
            append_tag!(tags, "ARTIST", clean_artist_name(release.artists[1].name))
        else
            append_tag!(tags, "ARTIST", clean_artist_name(track.artists[1].name))
        end
        setroot!(doc, tags)
        name = "$(track.position) - $(track.title)"
        push!(docs, (name, doc))
    end

    return docs
end

function save_xml(release::Release, dir::AbstractString = "")
    docs = generate_xml(release::Release)
    for (name, doc) in docs
        filename = replace(name, r"[/\:*?\"<>|]" => "") * ".xml"
        write(joinpath(dir, filename), doc)
    end
end