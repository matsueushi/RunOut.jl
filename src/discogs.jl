const BASEURL = "https://api.discogs.com/"


struct HTTPError <: Exception
    message::String
end


struct Client
    useragent::String
    usertoken::Union{String, Nothing}
    Client(useragent; usertoken = nothing) = new(useragent, usertoken)
end


function fetch(c::Client, path::AbstractString)
    url = BASEURL * path
    headers = Dict("User-Agent" => c.useragent)
    query = Dict()
    if !isnothing(c.usertoken)
        query["token"] = c.usertoken
    end
    r = HTTP.get(url, headers=headers, query=query, status_exception=false)
    if r.status == 200
        return JSON.parse(String(r.body))
    else
        msg = JSON.parse(String(r.body))["message"]
        throw(HTTPError(msg))
    end
end

release(c::Client, releaseid) = parse_dict(Release, fetch(c, "/releases/$releaseid"))
