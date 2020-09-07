function append_tag!(tags, kind, info)
    tag = ElementNode("tag")
    addelement!(tag, "name", kind)
    addelement!(tag, "value", "$info")
    link!(tags, tag)
end

function xml_for_audacity(release::Release)
    docs = []
    for track in release.tracklist
        doc = XMLDocument()
        tags = ElementNode("tags")
        append_tag!(tags, "ALBUM", release.title)
        append_tag!(tags, "YEAR", release.year)
        append_tag!(tags, "TITLE", track.title)
        isnothing(track.position) || append_tag!(tags, "TRACKNUMBER", track.position)
        setroot!(doc, tags)
        prettyprint(doc)
        push!(docs, doc)
    end

    return docs
end