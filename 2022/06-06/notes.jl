### A Pluto.jl notebook ###
# v0.19.8

using Markdown
using InteractiveUtils

# ╔═╡ 087cd776-e5b3-11ec-1f83-739b0ee090ce
using MarkdownLiteral: @mdx

# ╔═╡ 186b67f2-5529-4240-b71d-2ab46ae12147
@mdx("# Hello!")

# ╔═╡ d86c1733-669f-459a-b3b4-9a108c8dfa32
@mdx """
topics:

- fons: Million points in scatter plot
- fons: How do I use PlutoPlotly?
- fons: Summer plans
- skip_as_script
- webcam

"""

# ╔═╡ 7812889b-4d87-4149-b451-15bcc1556cc6
md"""
# Million points scatter plot

Plotly is too slow :((( but! you could use `scattergl`! Why not the default? Probably because it has fewer options.

Plots.jl GR renders in a couple seconds but is not interactive




You can use javascript and a cool package and cool pluto features! Demo here [https://fonsp-disorganised-mess.netlify.app/million%20points%20scatter.html](https://fonsp-disorganised-mess.netlify.app/million%20points%20scatter.html)


based in [flekschas/regl-scatterplot](https://github.com/flekschas/regl-scatterplot)
"""

# ╔═╡ 918e75d2-3520-4ced-92c5-ab4ce9ba10ef
md"""
# Script ID

If you give a `id` attribute to a `<script id>` tag in HTML output, then you get magical Pluto features, notably persistence with `this`.

You really want that! But what should the value of `id` be? It needs to be unique, but you can't generate it randomly because then it's different for each render.

Prototype for solution is here: [https://fonsp-disorganised-mess.netlify.app/give\_me\_script\_id.html](https://fonsp-disorganised-mess.netlify.app/give_me_script_id.html). Still missing is manual keying like in react, and waiting for michiel to tell us his secrets 👀
"""

# ╔═╡ ad270d96-e2f9-4300-920e-a9f768ba3ec4
@mdx """
# How do I use [PlutoPlotly.jl](https://github.com/JuliaPluto/PlutoPlotly.jl)?

Hard to get started.

Started to adapt official plotly julia documentation, but this turned out to be outdated 🥲
"""

# ╔═╡ ba413aaa-2404-42e4-8450-0deedfa98b2a
md"""
# skip_as_script

[#2018](https://github.com/fonsp/Pluto.jl/pull/2018) is ready, @fonsi will look at the styles, maybe remove the context menu button for now and we can work on that later

There are tests! wowzies

"""

# ╔═╡ 77189d26-0d44-49e2-87f6-97d54afd0e16


# ╔═╡ e3ad79ed-a741-4a24-a007-076ac287f8d0
@mdx """
# Paul is the new Acting CEO
"""

# ╔═╡ cccb9449-c41e-4463-a92c-0a1acdd2169d


# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
MarkdownLiteral = "736d6165-7244-6769-4267-6b50796e6954"

[compat]
MarkdownLiteral = "~0.1.1"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.3"
manifest_format = "2.0"

[[deps.CommonMark]]
deps = ["Crayons", "JSON", "URIs"]
git-tree-sha1 = "4cd7063c9bdebdbd55ede1af70f3c2f48fab4215"
uuid = "a80b9123-70ca-4bc0-993e-6e3bcb318db6"
version = "0.8.6"

[[deps.Crayons]]
git-tree-sha1 = "249fe38abf76d48563e2f4556bebd215aa317e15"
uuid = "a8cc5b0e-0ffa-5ad4-8c14-923d3ee1735f"
version = "4.1.1"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "c47c5fa4c5308f27ccaac35504858d8914e102f9"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.4"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "3c837543ddb02250ef42f4738347454f95079d4e"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.3"

[[deps.MarkdownLiteral]]
deps = ["CommonMark", "HypertextLiteral"]
git-tree-sha1 = "0d3fa2dd374934b62ee16a4721fe68c418b92899"
uuid = "736d6165-7244-6769-4267-6b50796e6954"
version = "0.1.1"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.Parsers]]
deps = ["Dates"]
git-tree-sha1 = "1285416549ccfcdf0c50d4997a94331e88d68413"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.3.1"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.Tricks]]
git-tree-sha1 = "6bac775f2d42a611cdfcd1fb217ee719630c4175"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.6"

[[deps.URIs]]
git-tree-sha1 = "97bbe755a53fe859669cd907f2d96aee8d2c1355"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.3.0"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"
"""

# ╔═╡ Cell order:
# ╠═186b67f2-5529-4240-b71d-2ab46ae12147
# ╟─d86c1733-669f-459a-b3b4-9a108c8dfa32
# ╟─7812889b-4d87-4149-b451-15bcc1556cc6
# ╟─918e75d2-3520-4ced-92c5-ab4ce9ba10ef
# ╟─ad270d96-e2f9-4300-920e-a9f768ba3ec4
# ╟─ba413aaa-2404-42e4-8450-0deedfa98b2a
# ╠═77189d26-0d44-49e2-87f6-97d54afd0e16
# ╠═087cd776-e5b3-11ec-1f83-739b0ee090ce
# ╠═e3ad79ed-a741-4a24-a007-076ac287f8d0
# ╠═cccb9449-c41e-4463-a92c-0a1acdd2169d
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
