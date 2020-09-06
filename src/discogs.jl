const USERAGENT = "RunOut/$(Pkg.project().version) +https://matsueushi.github.io"
const BASEURL = "https://api.discogs.com/"

HTTP.MessageRequest.setuseragent!(USERAGENT)


struct HTTPError <: Exception
    message::String
end


function fetch(path::AbstractString)
    url = BASEURL * path
    r = HTTP.get(url, status_exception=false)
    if r.status == 200
        return JSON.parse(String(r.body))
    else
        msg = JSON.parse(String(r.body))["message"]
        throw(HTTPError(msg))
    end
end

release(releaseid) = parse_dict(Release, fetch("/releases/$releaseid"))
