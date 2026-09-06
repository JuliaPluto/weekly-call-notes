### A Pluto.jl notebook ###
# v0.19.20

using Markdown
using InteractiveUtils

# ╔═╡ fd716fd8-9c1c-11ed-2840-e36703ce3f9b
md"""
# Notes 24 jan 2023
"""

# ╔═╡ 31a6477d-9619-4471-aca0-52bc26a9c313
md"""
# Malt.jl

[Implemented reusing the socket](https://github.com/JuliaPluto/Malt.jl/pull/32), but we still have a 2.5ms overhead, compared to the 0.1ms overhead of Distributed... Why?

Suggestion from [Nehal](https://github.com/habemus-papadum): we need to buffer the IO read/write, instead of read/writing the TCP socket directly.

For example, we currently have this:

```julia
write(socket, msg_type)
write(socket, msg_id)
serialize(socket, msg_data)

# where
socket::Sockets.TCPConnection
msg_data::Tuple{Function,NTuple,Pair[]}
```

Internally, this `serialize` will do lots of individual `write` calls, and each will trigger a task switch to the kernel, with a small overhead. A solution would be to use something like [https://github.com/JuliaIO/BufferedStreams.jl](https://github.com/JuliaIO/BufferedStreams.jl), or more crudely, to write to an `IOBuffer` first, and then write all of it to the socket in one go:


```julia

io = IOBuffer()

write(io, msg_type)
write(io, msg_id)
serialize(io, msg_data)

seekstart(io)
write(socket, io)
```

I implemented this and... it works!! 🎉🎉🎉 This fixed the issue, we now have **exactly the same overhead as Distributed**!
"""

# ╔═╡ bb385e5b-97d0-4ef3-b50e-dd01c1bb7d4a
md"""
# PlutoDesktop

Suggestions from [Nehal](https://github.com/habemus-papadum):

## Faster landing screen

Currently, when the desktop app starts, you are looking at a loading bar for ~20 seconds while the Pluto server boots in the background. 

Instead of a loading bar, we could load (a modified version of) Pluto's index.html as the loading page! (And make it connect to Pluto without a refresh.) That way, we show the landing page immediately, including featured notebooks (they load without the Pluto server).

Since recent files are stored in localStorage, we could skip waiting for the Pluto server and show them directly. (Currently we wait for the server, to figure out if a recent notebook is currently running or not.)


From fons: perhaps we could serve all of Pluto's assets with a simple node-based file server on a different port, and use the Pluto server for all dynamic requests. The `pluto_server_url` query parameter can be used to separate the two. (I think serving all assets with `file://` would be a problem for CORS requests and ES6 imports, but this might be different with Electron.)

## Running in the background

other idea for plutodesktop:

Having the user control whether a notebook is running or not is complicated. It would be easier if closing the notebook window also shuts down the notebook. A notebook is running if and only if you have it open in a window.

We could have a 30 second cooldown when you close a notebook's window before shutting it down.

## Code quality

We could factor out the bundling (adding julia, depot, etc) into a separate project/repo/folder. 

We can make more upstream changes in Pluto.jl to make the electron app less complicated. We already did some of these (like the `GET /shutdown?id=...` endpoint), but we can do more, like announcing the port and secret over stdout without having to `grep` it.


"""

# ╔═╡ Cell order:
# ╟─fd716fd8-9c1c-11ed-2840-e36703ce3f9b
# ╟─31a6477d-9619-4471-aca0-52bc26a9c313
# ╟─bb385e5b-97d0-4ef3-b50e-dd01c1bb7d4a
