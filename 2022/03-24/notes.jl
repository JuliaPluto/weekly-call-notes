### A Pluto.jl notebook ###
# v0.18.2

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
end

# ╔═╡ 71d4a555-16be-43c8-9d2c-377d60fc25ee
using BenchmarkTools

# ╔═╡ 4d0e0660-8851-408e-85f9-24365e5e1c96
using PlutoUI

# ╔═╡ 19fcf73c-7f7f-11ec-0505-23f05406b0f5
using MarkdownLiteral: @mdx

# ╔═╡ 7e1f5832-d979-451e-8f8e-cdbc2b1ac70c
using Dates

# ╔═╡ c8b1dde6-7686-4a66-a074-657f985bd86b
using HypertextLiteral

# ╔═╡ 747c0720-0143-44e3-9f42-bcd09ace5453
@mdx """
## To discuss:

- Paul: BetterFileWatching.jl
- Fons/Paul: HTTP/hyper?
- GSoC proposals
- Gerhard/Fons: PLOTTING BARCAMP
- Fons: KaTeX
- Alberto: PlutoPlotly: 
- Guilherme: D3.jl
- Paul: Linting and autocomplete
- 


"""

# ╔═╡ cbeb1730-1a25-4d68-9d67-725b3c9d0c9b


# ╔═╡ 2130d5de-a493-4336-8487-d9202a436ac3
md"""


# Mathjax vs KaTeX:

Mathjax has very niche features that Katex doesnt support? But how will we know? 

Ideas:
- PlutoMathJax.jl that render with mathjax for backwards compat
- Maybe release it and see how people react?
- Helpdesk
- 

Plotly version supports mathjax 3 now, so that compat issue is not a problem anymore

But only if you use a local font cache

"""

# ╔═╡ 417ff451-d51b-43e9-8039-4e47b135cd1e


# ╔═╡ 51ba9b38-f7ed-43c2-b0bc-add86538bbfa
md"""
# Paul: BetterFileWatching.jl

New version is testable!!!! [https://github.com/JuliaPluto/BetterFileWatching.jl/pull/2](https://github.com/JuliaPluto/BetterFileWatching.jl/pull/2)

API is the same (and new API), we can start testing it :o

Snapshot files: you can make a snapshot, and then compare against a previous snapshot. Coudl be useful in PlutoSliderServer.jl or other projects!!

This means that we won't miss events! Because it's on a different thread 💕💕💕💕💕

We are using a port of `parcel/watcher` to make it work inside Julia: [https://github.com/JuliaPluto/watcher/tree/julia_port](https://github.com/JuliaPluto/watcher/tree/julia_port)

## That means!

We can finally turn on `Pluto.run(watch_notebook_file_for_changes=true)` by default!

## Windows

Nothing is working :) Solution: spend a bit of time on it

### Other platforms

We should be able to get every platform that supports julia

## Standard library

Julia maintainers problably don't want to maintain this :) Codebase is too big and different. Platform support might be worse.

"""

# ╔═╡ 26b78770-b679-4e53-ba8d-d6f123bb8d7f


# ╔═╡ 2efc0810-3f50-4a33-a339-bf39f6cbff4c
md"""
# PlutoPlotly

PlotlyLight.jl is quite nice! We can probably do extra cool things for Pluto

Some problems it plotlylight: it uses JSON3, which serializes matrices as vectors. Opened an [issue](https://github.com/JuliaComputing/PlotlyLight.jl/issues/12), but the result was a note on the readme :( Why not just fix it? Problem is with DataStructures.jl (which we might also use for PublishToJS), there is an issue but not active anymore



## PlutoPlotly.jl

New features:

- Fix warnings, 
- Maintain zoom and such: is a feature of plotly: ui revision!!! Gerhard: looks super cool!
- Wrapper div to improve responiveness. But still an issue with plotly: [https://codepen.io/disberd/pen/xxpgEVq](https://codepen.io/disberd/pen/xxpgEVq). Opened an issue on plotly: [https://github.com/plotly/plotly.js/issues/6156](https://github.com/plotly/plotly.js/issues/6156).
- Write listeners for Plotly events!
- Works inside flexbox!!

Comparison with other plotting packages? Not sure... 

### Documentation:

Best documentation is for JS, if you learn how to translate JS to Julia then that will be the best way to do it! Python docs are even better, surprisingly, because they have an additional layer on the python side.

Plotly as a gateway drug to JS hehe

### API

Matching API with PlotlyJS.jl, but as a backend for Plots.jl would be difficult.

### PlutoPlotly

PlotlyBase keeps the

### CDN

Gives an ES5 version, trickyyyyyyyy fonsp might solve it

### Script ID

Where is Script ID!! Help!!!!

"""

# ╔═╡ e9a8466b-4735-4487-9cd9-d00059954649


# ╔═╡ f86cdbe9-111d-4468-9727-ec9d61120ee3
md"""
# Guilherme: Portinari.jl!!

![](https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Discovery_of_the_Land1.jpg/1011px-Discovery_of_the_Land1.jpg)


### Without canvas

You can now directly see shapes without putting them inside of a canvas.

But! You can use a canvas to combine things into a canvas to render them together.

Canvas inside canvas? Like a group?

## Script ID?

Help!!!!

You can pass in `id` for spans. We would like to do it automatically, but we are still thinking about this.

### Events

You can specify the type of event to watch, and through `@bind`, you will get the details of the latest instance of that event, and the count.

### Applications

Cool dashboards! Plotting but also not plotting

Maybe we can recreate this AWESOME jupyter notebook by shashi: [http://shashi.biz/ijulia-notebooks/funcgeo/](http://shashi.biz/ijulia-notebooks/funcgeo/)



"""

# ╔═╡ 2358ca28-dbe1-474a-b892-13836e963532
md"""
# Pluto Event #1: Plotting Barcamp!

[https://discourse.julialang.org/t/pluto-event-1-plotting-barcamp/78387](https://discourse.julialang.org/t/pluto-event-1-plotting-barcamp/78387)



"""

# ╔═╡ 77ae4edd-b471-499a-8823-3fac5faebb7a
md"""
# Appendix
"""

# ╔═╡ 7a1f53e1-8c9c-42ca-a4eb-a34bfe39c44d
today = join(splitpath(pwd())[end-1:end],"-") |> Date

# ╔═╡ f86fb8f8-857d-4e2d-8b5a-7c2c6868c424
@mdx """
# 🤠 Pluto developer call, *$(today)* 🤠

heyllo
Yayyy hurray

Check the new PlutoSliderServer-powered website about climate science: 

[https://margo.plutojl.org/](https://margo.plutojl.org/)

"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
BenchmarkTools = "6e4b80f9-dd63-53aa-95a3-0cdb28fa8baf"
Dates = "ade2ca70-3891-5945-98fb-dc099432e06a"
HypertextLiteral = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
MarkdownLiteral = "736d6165-7244-6769-4267-6b50796e6954"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
BenchmarkTools = "~1.2.2"
HypertextLiteral = "~0.9.3"
MarkdownLiteral = "~0.1.1"
PlutoUI = "~0.7.33"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.2"
manifest_format = "2.0"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "8eaf9f1b4921132a4cff3f36a1d9ba923b14a481"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.1.4"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.BenchmarkTools]]
deps = ["JSON", "Logging", "Printf", "Profile", "Statistics", "UUIDs"]
git-tree-sha1 = "940001114a0147b6e4d10624276d56d531dd9b49"
uuid = "6e4b80f9-dd63-53aa-95a3-0cdb28fa8baf"
version = "1.2.2"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "024fe24d83e4a5bf5fc80501a314ce0d1aa35597"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.0"

[[deps.CommonMark]]
deps = ["Crayons", "JSON", "URIs"]
git-tree-sha1 = "4aff51293dbdbd268df314827b7f409ea57f5b70"
uuid = "a80b9123-70ca-4bc0-993e-6e3bcb318db6"
version = "0.8.5"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"

[[deps.Crayons]]
git-tree-sha1 = "249fe38abf76d48563e2f4556bebd215aa317e15"
uuid = "a8cc5b0e-0ffa-5ad4-8c14-923d3ee1735f"
version = "4.1.1"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.Downloads]]
deps = ["ArgTools", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[deps.HypertextLiteral]]
git-tree-sha1 = "2b078b5a615c6c0396c77810d92ee8c6f470d238"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.3"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "f7be53659ab06ddc986428d3a9dcc95f6fa6705a"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.2"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "8076680b162ada2a031f707ac7b4953e30667a37"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.2"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MarkdownLiteral]]
deps = ["CommonMark", "HypertextLiteral"]
git-tree-sha1 = "0d3fa2dd374934b62ee16a4721fe68c418b92899"
uuid = "736d6165-7244-6769-4267-6b50796e6954"
version = "0.1.1"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"

[[deps.Parsers]]
deps = ["Dates"]
git-tree-sha1 = "92f91ba9e5941fc781fecf5494ac1da87bdac775"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.2.0"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "UUIDs"]
git-tree-sha1 = "da2314d0b0cb518906ea32a497bb4605451811a4"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.33"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.Profile]]
deps = ["Printf"]
uuid = "9abbd945-dff8-562f-b5e8-e1ebf5ef1b79"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.URIs]]
git-tree-sha1 = "97bbe755a53fe859669cd907f2d96aee8d2c1355"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.3.0"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
"""

# ╔═╡ Cell order:
# ╟─f86fb8f8-857d-4e2d-8b5a-7c2c6868c424
# ╠═747c0720-0143-44e3-9f42-bcd09ace5453
# ╟─cbeb1730-1a25-4d68-9d67-725b3c9d0c9b
# ╟─2130d5de-a493-4336-8487-d9202a436ac3
# ╟─417ff451-d51b-43e9-8039-4e47b135cd1e
# ╟─51ba9b38-f7ed-43c2-b0bc-add86538bbfa
# ╟─26b78770-b679-4e53-ba8d-d6f123bb8d7f
# ╟─2efc0810-3f50-4a33-a339-bf39f6cbff4c
# ╟─e9a8466b-4735-4487-9cd9-d00059954649
# ╟─f86cdbe9-111d-4468-9727-ec9d61120ee3
# ╟─2358ca28-dbe1-474a-b892-13836e963532
# ╟─77ae4edd-b471-499a-8823-3fac5faebb7a
# ╠═71d4a555-16be-43c8-9d2c-377d60fc25ee
# ╠═4d0e0660-8851-408e-85f9-24365e5e1c96
# ╠═19fcf73c-7f7f-11ec-0505-23f05406b0f5
# ╠═7e1f5832-d979-451e-8f8e-cdbc2b1ac70c
# ╠═7a1f53e1-8c9c-42ca-a4eb-a34bfe39c44d
# ╠═c8b1dde6-7686-4a66-a074-657f985bd86b
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
