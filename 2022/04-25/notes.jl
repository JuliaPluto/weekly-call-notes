### A Pluto.jl notebook ###
# v0.19.2

using Markdown
using InteractiveUtils

# ╔═╡ c85f7e02-5bd5-4fb7-b279-d8297343a8b9
using MarkdownLiteral: @mdx

# ╔═╡ 732d814a-49c7-4f96-8de7-431f1dcd4982
using PlutoUI, MarkdownLiteral, Dates

# ╔═╡ 052e62dc-bf15-4666-8333-a7420cc30934
md"""
# To discuss
- fons: New main menu
- fons: Featured
- benjamin: PR about multiple bonds
- gerhard: Next Pluto event
- rik: Precompilation
- gerhard: Pluto + workadventure
- alberto: skipasscript metadata
"""

# ╔═╡ 250879cf-259b-4f03-98b2-0b26e4bb93a5
@mdx """
 !!! info
	## New dates for Pluto dev calls! it will be on **Mondays** at 6PM Berlin!
"""

# ╔═╡ 53e70c6c-da4e-44b7-b89a-d1a6929d40af
md"""
# benjamin: PR about multiple bonds

Looks good!
"""

# ╔═╡ 39f4ea29-d108-4d42-a4a3-75ca07059117
md"""
# rik: Precompilation

[https://github.com/fonsp/Pluto.jl/pull/2054](https://github.com/fonsp/Pluto.jl/pull/2054)

New package that automatically precompiles all methods with concrete input types dus `Pkg.precompile()`. So the previous PRs that added `precompile(...)` statements are now all automated! Wow!!


Will this revolutionalize? Well I hope so! 

One bug so far: sometimes, it fails on FuzzyCompletions.jl.

We hope it works on lots of real systems. e.g. will it work on windows?

PR: Waiting for registry to finish, and then we can use CI to test it on all systems.

It's essentially like we do compilation during precompilation. (Why is this not the default in Julia? )

Compiling: convert julia code to machine code. 

Paul or Alberto should also take a look!
"""

# ╔═╡ 3d7a7444-f4df-4a47-bac0-d0481b7b6d56
md"""
# New main menu


Why did you remove Welcome to Pluto? Looks more sterile without it. Fancy things below are nice though.

Why yellow? Kind of our theme color? 

It's not visible enough that there are featured notebooks


"""

# ╔═╡ 9a417623-143c-491b-bdef-7a92b6fb22e1
md"""
# Featured notebooks


Recording function? No not yet!


Main three sections:










Intimiderend om de issues van JS te doen




tags voor andere talen




tag voor moeilijkheid
tag voor type document: 
- tutorial/lesmateriaal/blogartikel/demo/etc   
- of gewoon: is dit een voorbeeld-van-wat-je-kan of een tutorial?
- 




notebooks die alleen maar knoppen hebben kunnen ook leuk zijn omdat het een goed voorbeeld van interactive notebooks is





### Getting started
1. Getting started
2. Basic mathematics
4. PlutoUI

### Beautiful Wotebooks
3. Markdown
2. HTML & CSS
3. PlutoUI.Layout
4. 


### Data
- From spreadsheets to Pluto
1. Plots.jl
2. ??



### JavaScript
1. Interactivity
1. JavaScript, opspliten in meerdere notebooks
1. JavaScript, opspliten in meerdere notebooks
1. JavaScript, opspliten in meerdere notebooks


### Natural Language
- HW3 deel 1: language detection
- HW3 deel 2: Jane Austen generation




### Learn Julia with us
- ?
- ?
- ?

We don't need to have all the materials to learn julia, a link is already enough.


### Computational Thinking highlights
- Functions are Objects
- Climate Economics
- Nog iets cools


### Puzzles:
- Tower of Hanoi
- Ellipses


### Images
- Images.jl
- Dithering
- RGB curves
- SVD image
- https://fonsp-disorganised-mess.netlify.app/philip_zoooooom.html
- meer kleine dingetjes


Wil nog:
- Turtles


Pluto feautures:
- Packages, reproducibility
- Logging
    - Plot Loggen
    - Logging something else
- Disabled button
- File format
- Recording

Kunnen  nog schrijven:
- Game theory met RPG vibes
- MNIST met tekenen



- ML workflow in Pluto
    - Feedback tijdens training
    - Veel packages zoals Flux zijn stateful
    - Met een dataset die simpeler is dan MNIST, lineare regressie
- JuMP.jl
- Flux.jl
- Turing.jl
- TuringGLM.jl ?
- Optim.jl
- Iets uit adjective orders sciptie
- Meshes.jl lost angle of a triangle, interactive, multiple choice






## How to get these notebooks

Phase 1: just the Pluto people put together what we already have

Phase 2: we invite people who have written awesome notebooks from the web

Phase 3: open invite to the Julia community







## Rights and licenses

Right now, [on the reamde, we say](https://github.com/fonsp/Pluto.jl#license):

> The included sample notebooks have a more permissive license: the Unlicense. This means that you can use sample notebook code however you like - you do not need to credit us!

This is fine for the notebooks that we have so far, but it will not work for all the notebooks in the future. For examplem, if we want to include notebooks from another course that already has a license, or if people want to be credited for their work.

So we need something new!

We could put this in the frontmatter!

We might also need two separate licenses, like in https://github.com/mitmath/18S191/blob/Spring21/LICENSE.md


Previous discussion about an Ebook during a previous Pluto community call. 

Right now you define frontmatter with this magic variable, https://github.com/JuliaPluto/featured/blob/f28473cda030d287d2db81fb6a23e2b71596bc07/classic%20samples/Interactivity.jl#L254, see also the frontmatter PR on Pluto.jl.


"""

# ╔═╡ 13d88622-72c2-4ec2-9859-e44ee3a33b2f
md"""
# Workadventure + Pluto

Gerhard is working on a game! About triangle geometry

You walk around the workadventure world, and sometimes you run into a notebook with an interactive game. Completing the game gives items for inside the workadventure game!


"""

# ╔═╡ cdaad13e-f0e2-4328-bf20-456e0e9c46c1
md"""
# `@skip_as_script`


Make a JS function available to frontend (secretly) (by putting it into `pluto_actions`) to get/set the skip_as_script metadata. Actually it should be a general `(key, value)` function.


"""

# ╔═╡ 3a5fc025-d74d-41a8-8d31-b6e2b19abb51
md"""
# Pluto 1 year from now?

- T shirts!
- Running standalone in the browser with wasm
- Below 1 second to launch the first notebook
- Store not only text but also images. Embedding local images, more efficiently that just base64. 
- More general: Pluto *Projects* consisting of multiple notebooks, input files (like images), and a shared Project+Manifest
- Non-registered packages with Pluto package manager. Also non-latest versions, or git rev
- Toolbox with all the functions that a package has
- REST API - what is the status?
- Control sensors/motors with Pluto notebooks
- Store the global state (all variable values) to a file so that it loads instantly

"""

# ╔═╡ 532c3226-9cca-45ec-8785-e51e119fc852
today = try
	join(splitpath(pwd())[end-1:end],"-") |> Date
catch
	Dates.now() |> Date
end

# ╔═╡ 6b5d7d87-806c-470b-8a71-c0f441ed5d6d
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
Dates = "ade2ca70-3891-5945-98fb-dc099432e06a"
MarkdownLiteral = "736d6165-7244-6769-4267-6b50796e6954"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
MarkdownLiteral = "~0.1.1"
PlutoUI = "~0.7.38"
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

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "024fe24d83e4a5bf5fc80501a314ce0d1aa35597"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.0"

[[deps.CommonMark]]
deps = ["Crayons", "JSON", "URIs"]
git-tree-sha1 = "4cd7063c9bdebdbd55ede1af70f3c2f48fab4215"
uuid = "a80b9123-70ca-4bc0-993e-6e3bcb318db6"
version = "0.8.6"

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
git-tree-sha1 = "3c837543ddb02250ef42f4738347454f95079d4e"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.3"

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
git-tree-sha1 = "621f4f3b4977325b9128d5fae7a8b4829a0c2222"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.2.4"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "UUIDs"]
git-tree-sha1 = "670e559e5c8e191ded66fa9ea89c97f10376bb4c"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.38"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

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
# ╟─6b5d7d87-806c-470b-8a71-c0f441ed5d6d
# ╟─052e62dc-bf15-4666-8333-a7420cc30934
# ╟─250879cf-259b-4f03-98b2-0b26e4bb93a5
# ╟─53e70c6c-da4e-44b7-b89a-d1a6929d40af
# ╟─39f4ea29-d108-4d42-a4a3-75ca07059117
# ╟─3d7a7444-f4df-4a47-bac0-d0481b7b6d56
# ╟─9a417623-143c-491b-bdef-7a92b6fb22e1
# ╟─13d88622-72c2-4ec2-9859-e44ee3a33b2f
# ╟─cdaad13e-f0e2-4328-bf20-456e0e9c46c1
# ╟─3a5fc025-d74d-41a8-8d31-b6e2b19abb51
# ╠═532c3226-9cca-45ec-8785-e51e119fc852
# ╠═c85f7e02-5bd5-4fb7-b279-d8297343a8b9
# ╠═732d814a-49c7-4f96-8de7-431f1dcd4982
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
