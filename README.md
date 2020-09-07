# RunOut.jl

Unofficial Discogs API client for Julia

## Quickstart
```julia
using RunOut
```
### Initializing the client object without user token
```julia
client = Client("ExapmleApp/0.1")
```
### Initializing the client object without user token
```julia
client = Client("ExapmleApp/0.1"; usertoken="*******user*token*******)
```

## Release
https://www.discogs.com/New-Order-Power-Corruption-Lies-%E6%A8%A9%E5%8A%9B%E3%81%AE%E7%BE%8E%E5%AD%A6/release/1750385

```julia
rl = fetch_release(client, 1750385)
```

```shell
julia> typeof(rl)
Release

julia> fieldnames(Release)
(:id, :title, :resource_url, :artists, :artists_sort, :data_quality, :thumb, :community, :companies, :country, :date_added, :date_changed, :estimated_weight, :extraartists, :format_quantity, :formats, :genres, :identifiers, :images, :labels, :lowest_price, :master_id, :master_url, :notes, :num_for_sale, :released, :released_formatted, :series, :status, :styles, :tracklist, :uri, :videos, :year)

julia> rl.tracklist
8-element Array{Track,1}:
 Track("1", "Age Of Consent", "track", "5:13", nothing)
 Track("2", "We All Stand", "track", "5:13", nothing)
 Track("3", "The Village", "track", "4:36", nothing)
 Track("4", "586", "track", "7:29", nothing)
 Track("5", "Your Silent Face", "track", "5:58", nothing)
 Track("6", "Ultraviolence", "track", "4:48", nothing)
 Track("7", "Ecstasy", "track", "4:24", nothing)
 Track("8", "Leave Me Alone", "track", "4:38", nothing)
 ```