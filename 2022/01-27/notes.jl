### A Pluto.jl notebook ###
# v0.17.7

using Markdown
using InteractiveUtils

# ╔═╡ 19fcf73c-7f7f-11ec-0505-23f05406b0f5
using MarkdownLiteral: @mdx

# ╔═╡ 7e1f5832-d979-451e-8f8e-cdbc2b1ac70c
using Dates

# ╔═╡ 917d20ed-7341-4d09-be03-b66cc32aa2b8
to_discuss = [
	"michiel: Distributed without Distributred"
	"fons: HTTP without HTTP.jl"
	"fons: Layout should be macros?"
	"guilherme: Questions about macros inside macros in PlutoLinks"
	"x: Multilingual docs page"
	""
]

# ╔═╡ 747c0720-0143-44e3-9f42-bcd09ace5453
@mdx """
## To discuss:
$(("- $(x)\n" for x in to_discuss))
"""

# ╔═╡ 77ae4edd-b471-499a-8823-3fac5faebb7a
md"""
# Appendix
"""

# ╔═╡ 7a1f53e1-8c9c-42ca-a4eb-a34bfe39c44d
today = join(splitpath(pwd())[end-1:end],"-") |> Date

# ╔═╡ f86fb8f8-857d-4e2d-8b5a-7c2c6868c424
@mdx """
# Pluto developer call, *$(today)*

Yayyy
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Dates = "ade2ca70-3891-5945-98fb-dc099432e06a"
MarkdownLiteral = "736d6165-7244-6769-4267-6b50796e6954"

[compat]
MarkdownLiteral = "~0.1.1"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.1"
manifest_format = "2.0"

[[deps.CommonMark]]
deps = ["Crayons", "JSON", "URIs"]
git-tree-sha1 = "4aff51293dbdbd268df314827b7f409ea57f5b70"
uuid = "a80b9123-70ca-4bc0-993e-6e3bcb318db6"
version = "0.8.5"

[[deps.Crayons]]
git-tree-sha1 = "249fe38abf76d48563e2f4556bebd215aa317e15"
uuid = "a8cc5b0e-0ffa-5ad4-8c14-923d3ee1735f"
version = "4.1.1"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.HypertextLiteral]]
git-tree-sha1 = "2b078b5a615c6c0396c77810d92ee8c6f470d238"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.3"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "8076680b162ada2a031f707ac7b4953e30667a37"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.2"

[[deps.MarkdownLiteral]]
deps = ["CommonMark", "HypertextLiteral"]
git-tree-sha1 = "0d3fa2dd374934b62ee16a4721fe68c418b92899"
uuid = "736d6165-7244-6769-4267-6b50796e6954"
version = "0.1.1"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.Parsers]]
deps = ["Dates"]
git-tree-sha1 = "92f91ba9e5941fc781fecf5494ac1da87bdac775"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.2.0"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.URIs]]
git-tree-sha1 = "97bbe755a53fe859669cd907f2d96aee8d2c1355"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.3.0"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"
"""

# ╔═╡ Cell order:
# ╟─f86fb8f8-857d-4e2d-8b5a-7c2c6868c424
# ╟─747c0720-0143-44e3-9f42-bcd09ace5453
# ╠═917d20ed-7341-4d09-be03-b66cc32aa2b8
# ╟─77ae4edd-b471-499a-8823-3fac5faebb7a
# ╠═19fcf73c-7f7f-11ec-0505-23f05406b0f5
# ╠═7e1f5832-d979-451e-8f8e-cdbc2b1ac70c
# ╠═7a1f53e1-8c9c-42ca-a4eb-a34bfe39c44d
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
