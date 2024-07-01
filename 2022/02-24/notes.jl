### A Pluto.jl notebook ###
# v0.18.0

using Markdown
using InteractiveUtils

# ╔═╡ 71d4a555-16be-43c8-9d2c-377d60fc25ee
using BenchmarkTools

# ╔═╡ 8a4ca884-c8fc-47dc-a821-ef0fc7fc3416
using PlotlyBase

# ╔═╡ 4d0e0660-8851-408e-85f9-24365e5e1c96
using PlutoUI

# ╔═╡ 19fcf73c-7f7f-11ec-0505-23f05406b0f5
using MarkdownLiteral: @mdx

# ╔═╡ 7e1f5832-d979-451e-8f8e-cdbc2b1ac70c
using Dates

# ╔═╡ c8b1dde6-7686-4a66-a074-657f985bd86b
using HypertextLiteral

# ╔═╡ 3ebf46ff-efee-447a-af75-36482662e6e0
TableOfContents()

# ╔═╡ 917d20ed-7341-4d09-be03-b66cc32aa2b8
to_discuss = [
	"guilherme: d3 inside Pluto"
	"syntax highlighting removed ☹️🥺"
	"PlutoCon"
	""
	"war? 😔"
]

# ╔═╡ 747c0720-0143-44e3-9f42-bcd09ace5453
@mdx """
## To discuss:
$(("- $(x)\n" for x in to_discuss))
"""

# ╔═╡ a300ef86-569f-4ae4-9c1c-140ff3ea4e5c
md"""
# D3 inside Pluto

Works really nicely!! Yayyyy pretty with transitions!
"""

# ╔═╡ 012e7329-f59a-426d-bced-3d845a519b25
md"""
# syntax highlighting removed 😥

[https://github.com/fonsp/Pluto.jl/pull/1940](https://github.com/fonsp/Pluto.jl/pull/1940)


"""

# ╔═╡ c945ba3d-c9d0-4e3c-8f8f-661a3c467271
@htl("<!--   -->$(PlotlyBase.Plot(rand(10)))")

# ╔═╡ bc743f09-9790-416f-889f-263832087baf
md"""
# PlutoCon --> PlutoWorkshops (name tbd)

* Talks started out big, but the dropped off fairly quickly. Maybe due to asynchronous viewing
* How to bridge the gap between daily Pluto users and new folks? Maybe through "PlutoWorkshops", where the goal is to promote networking and pedagogy
    * The first workshop could be on plotting 📊. Each group would get the same dataset, and be tasked with plotting soemthing out of it using whatever plotting package they like
    * End result: A Hitchhiker's Guide to Plotting
* Gathertown platform
* How to improve for next time? Could create an exit survey
"""

# ╔═╡ 662f9275-f450-4955-b3f9-dd6bd87b8dd4
md"""
Ideas:

- entering a competition together
- one team uses excel
- 
"""

# ╔═╡ f2aa290c-78ec-47a6-81ad-0cceb52ddc38
md"""
# Missing Pluto documentation

Good question: Documentation on what?

Documentation on using Pluto:
- Basics
  - Markdown
  - Packages: Pkg and Pluto's GUI
  - Display: Matrices and Dictionaries
- Specific packages that require extra care: JuMP, Python,
- Mutability
  - Dummy variables
  - Functions like `push!` return the mutated object
- First introduction to Julia
  - Comparison to Jupyter
  - Defining a variable `x = 1` returns `1` so you can see it!

Documentation on deploying Pluto (what does that mean?):
- PlutoSliderServer
- 

Documentation on making dashboards with Pluto:
- Guilherme will do a JuliaCon presentation!!
- Guilherme will do a PluToWerkstatt Plotting presentation!!
- Comparison with Dash (Python) / RShiny (R)
- Comparison with other Julia options: JSServe, Stipple, Dash.jl
- Developer experience
- Disadvantages:
  - Notebooks inside notebooks
  - Deployment can be tricky
  - 

Documentation on making custom UI for Pluto:
- MIME types, show methods, "richest display", how to override
- JS API, publish_to_js
- HTML, CSS, JS (split into two?)
- Vue, React, etc inside Pluto
- Packaging stuff, ES6 bundle

Documentation on Pluto's internals:
- 
"""

# ╔═╡ 448d339f-89fa-4185-9685-b6a1a7a627d0
md"""
## Cell metadata (disable cells) [#1895](https://github.com/fonsp/Pluto.jl/pull/1895)

* Almost done
* Future ideas: Could store cell (x, y) coords for @pankgeorg's grid cells!
"""

# ╔═╡ 991eddc9-65cc-4814-9d31-256d123c2f11
md"""
# Big work left on Pluto

Major work left is not on Pluto internals, but on....
- Sample notebooks
- Publishing (PSS and more)
- UI inside Pluto
"""

# ╔═╡ 77ae4edd-b471-499a-8823-3fac5faebb7a
md"""
# Appendix
"""

# ╔═╡ 3ce62105-7aa8-4f18-9f5f-ad7c5c1b5909
# using Plots

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
PlotlyBase = "a03496cd-edff-5a9b-9e67-9cda94a718b5"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
BenchmarkTools = "~1.2.2"
HypertextLiteral = "~0.9.3"
MarkdownLiteral = "~0.1.1"
PlotlyBase = "~0.8.18"
PlutoUI = "~0.7.33"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.1"
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

[[deps.ColorSchemes]]
deps = ["ColorTypes", "Colors", "FixedPointNumbers", "Random"]
git-tree-sha1 = "6b6f04f93710c71550ec7e16b650c1b9a612d0b6"
uuid = "35d6a980-a343-548e-a6ea-1d62b119f2f4"
version = "3.16.0"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "024fe24d83e4a5bf5fc80501a314ce0d1aa35597"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.0"

[[deps.Colors]]
deps = ["ColorTypes", "FixedPointNumbers", "Reexport"]
git-tree-sha1 = "417b0ed7b8b838aa6ca0a87aadf1bb9eb111ce40"
uuid = "5ae59095-9a9b-59fe-a467-6f913c188581"
version = "0.12.8"

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

[[deps.DelimitedFiles]]
deps = ["Mmap"]
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"

[[deps.DocStringExtensions]]
deps = ["LibGit2"]
git-tree-sha1 = "b19534d1895d702889b219c382a6e18010797f0b"
uuid = "ffbed154-4ef7-542d-bbb7-c09d3a79fcae"
version = "0.8.6"

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

[[deps.LaTeXStrings]]
git-tree-sha1 = "f2355693d6778a178ade15952b7ac47a4ff97996"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.3.0"

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

[[deps.OrderedCollections]]
git-tree-sha1 = "85f8e6578bf1f9ee0d11e7bb1b1456435479d47c"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.4.1"

[[deps.Parameters]]
deps = ["OrderedCollections", "UnPack"]
git-tree-sha1 = "34c0e9ad262e5f7fc75b10a9952ca7692cfc5fbe"
uuid = "d96e819e-fc66-5662-9728-84c9c7592b0a"
version = "0.12.3"

[[deps.Parsers]]
deps = ["Dates"]
git-tree-sha1 = "92f91ba9e5941fc781fecf5494ac1da87bdac775"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.2.0"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"

[[deps.PlotlyBase]]
deps = ["ColorSchemes", "Dates", "DelimitedFiles", "DocStringExtensions", "JSON", "LaTeXStrings", "Logging", "Parameters", "Pkg", "REPL", "Requires", "Statistics", "UUIDs"]
git-tree-sha1 = "180d744848ba316a3d0fdf4dbd34b77c7242963a"
uuid = "a03496cd-edff-5a9b-9e67-9cda94a718b5"
version = "0.8.18"

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

[[deps.Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "838a3a4188e2ded87a4f9f184b4b0d78a1e91cb7"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.3.0"

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

[[deps.UnPack]]
git-tree-sha1 = "387c1f73762231e86e0c9c5443ce3b4a0a9a0c2b"
uuid = "3a884ed6-31ef-47d7-9d2a-63182c4928ed"
version = "1.0.2"

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
# ╠═f86fb8f8-857d-4e2d-8b5a-7c2c6868c424
# ╠═3ebf46ff-efee-447a-af75-36482662e6e0
# ╟─747c0720-0143-44e3-9f42-bcd09ace5453
# ╠═917d20ed-7341-4d09-be03-b66cc32aa2b8
# ╠═a300ef86-569f-4ae4-9c1c-140ff3ea4e5c
# ╠═012e7329-f59a-426d-bced-3d845a519b25
# ╠═71d4a555-16be-43c8-9d2c-377d60fc25ee
# ╠═8a4ca884-c8fc-47dc-a821-ef0fc7fc3416
# ╠═c945ba3d-c9d0-4e3c-8f8f-661a3c467271
# ╠═bc743f09-9790-416f-889f-263832087baf
# ╠═662f9275-f450-4955-b3f9-dd6bd87b8dd4
# ╟─f2aa290c-78ec-47a6-81ad-0cceb52ddc38
# ╠═448d339f-89fa-4185-9685-b6a1a7a627d0
# ╟─991eddc9-65cc-4814-9d31-256d123c2f11
# ╟─77ae4edd-b471-499a-8823-3fac5faebb7a
# ╠═3ce62105-7aa8-4f18-9f5f-ad7c5c1b5909
# ╠═4d0e0660-8851-408e-85f9-24365e5e1c96
# ╠═19fcf73c-7f7f-11ec-0505-23f05406b0f5
# ╠═7e1f5832-d979-451e-8f8e-cdbc2b1ac70c
# ╠═7a1f53e1-8c9c-42ca-a4eb-a34bfe39c44d
# ╠═c8b1dde6-7686-4a66-a074-657f985bd86b
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
