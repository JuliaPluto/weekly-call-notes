### A Pluto.jl notebook ###
# v0.20.20

using Markdown
using InteractiveUtils

# ╔═╡ fd5d465a-7415-4812-b023-14bd1660cb94
using PlutoUI

# ╔═╡ 5a23ab1c-c152-11f0-9abf-516d8b0127b2
md"""
# Pluto community call notes - 14 nov 2025

It's been a long time since we used this website! I'll use it again to see how it goes :)

Notable changes since the last notes here:
- Many many Pluto releases. We started to document the Pluto changes more on other platforms: Julia discourse, github releases, zulip+slack, conferences, etc.
- JuliaCon presentations and posters
- Updates to the lastest Julia versions (sooo much work)
- Boshra joined as a regular contributor! She will work on:
  - PlutoDesktop (taking over from Connor)
  - featured notebooks
  - plutojl.org documentation
- Fons started working at TU Eindhoven, working on the course [https://github.com/bmlip/course](https://github.com/bmlip/course).
  - Stability and documentation improvements
  - PlutoTeachingTools work (and BmlipTeachingTools.jl)
- Documentation website plutojl.org/en/docs
- Panagiotis and Fons released [pluto.land](https://pluto.land), best website ever
- Panagiotis is working on [pluto rainbow](https://www.npmjs.com/package/%40plutojl%2Frainbow) and (together with JuliaHub colleagues) on [a new Pluto VS Code extension] (https://github.com/JuliaPluto/advanced-vscode-extension). _(see below)_
- Translation in >10 languages: Greek, Chinese, Polish, Finnish, Japanese, Dutch, Business English, Bokmal Norwegian, French, German, Portuguese
- Alberto made PlutoPlotly.jl best package ever
- We made GracefulPkg.jl with Pluto Pkg workarounds
- Project.toml editor built into Pluto https://github.com/fonsp/Pluto.jl/pull/3218



## Selling Pluto for parts
Panagiotis and Fons are working on publishing parts of Pluto as their own package. We currently have:

Malt.jl

ExpressionExplorer.jl

PlutoDependencyExplorer.jl

GracefulPkg.jl

@plutojl/pluto-rainbow.js _when everyone goes the Julia-only way we go the other_

more....???/



"""

# ╔═╡ c7a2268a-a127-441e-95b7-2ddf5eaaceab
md"""
## Julia 1.12 is sooo slow

Julia 1.12 is slower. It looks like precompilation is slower, and real workload times (like test runtimes on github actions) are slower.

Panagiotis and some others suspect that this is because Julia removed many stdlibs from the base image. (This was done for static compilation with smaller bundles.)  Can we verify that this is true? Make a new "channel" of Julia that includes all stdlibs by default, and see if that fixes it?

If so, that would make more sense as the default version of Julia to be published. And we could publish a different channel of Julia specifically for the small-binary-minded people.


P will talk to K and see how achievable it is to make this new channel of Julia. Then you just need to make a PR (so juliaup can install it.)


"""

# ╔═╡ 63c8ba5d-2d9e-44f7-8d19-6be614050a77
md"""
## New featured notebooks

Boshra has some ideas for new featured notebooks!


"""

# ╔═╡ 06a4308f-9b4f-415c-8c34-7f851f0d167d
beginner = false

# ╔═╡ 70b431b7-6ad7-478c-a951-d68c5ade32ae
math = true

# ╔═╡ f55b7f7e-a2a7-4506-b894-e9a6dea88a42
asdf = false


# ╔═╡ e5a6cadc-3cca-424f-b8ed-9deeca915a67
Text("")

# ╔═╡ d7e022d8-c7e4-4ab1-b05f-45cd6a674f82
p = "asdf" => 234234

# ╔═╡ 58f53299-6a5b-4325-bd2a-e2a32d130c6b


# ╔═╡ 85fda1f1-f026-48ad-b8b4-296a52fdd479
if beginner
	md"""
	## New featured notebooks
	
	Boshra has some ideas for new featured notebooks!
	
	
	"""
	
end

# ╔═╡ c76c6c2e-1d68-4858-bd34-3fecf0d0c7f9
if math
	1 + 1
end

# ╔═╡ 6a71a540-bc93-4b55-9aef-61c9e53c5b7a
const Layout = PlutoUI.ExperimentalLayout

# ╔═╡ 2b805585-eae8-41d3-9320-56f6a32152bf
function laksdjflkasdkljfsdf(xs::Vector{<:Pair})
	to_show = filter(p -> p[1], xs)
	Layout.vbox(last.(to_show))
end

# ╔═╡ e520ae3f-9331-4bf4-b2ec-30bdc7773f1b
laksdjflkasdkljfsdf([
	beginner => md"""
	## New featured notebooks
	
	Boshra has some ideas for new featured notebooks!
	
	
	""",
	beginner => 123,
	math => 123,
])

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
PlutoUI = "~0.7.73"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.12.1"
manifest_format = "2.0"
project_hash = "9eac10d740c80cc8d467c10ea0b43b3d78a6c531"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "6e1d2a35f2f90a4bc7c2ed98079b2ba09c35b83a"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.3.2"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.2"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"
version = "1.11.0"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"
version = "1.11.0"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "67e11ee83a43eb71ddc950302c53bf33f0690dfe"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.12.1"
weakdeps = ["StyledStrings"]

    [deps.ColorTypes.extensions]
    StyledStringsExt = "StyledStrings"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.3.0+1"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"
version = "1.11.0"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"
version = "1.11.0"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "05882d6995ae5c12bb5f36dd2ed3f61c98cbb172"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.5"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "179267cfa5e712760cd43dcae385d7ea90cc25a4"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.5"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "7134810b1afce04bbc1045ca1985fbe81ce17653"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.5"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "0ee181ec08df7d7c911901ea38baf16f755114dc"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "1.0.0"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"
version = "1.11.0"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "31e996f0a15c7b280ba9f76636b3ff9e2ae58c9a"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.4"

[[deps.JuliaSyntaxHighlighting]]
deps = ["StyledStrings"]
uuid = "ac6e5ff7-fb65-4e79-a425-ec3bc9c03011"
version = "1.12.0"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.4"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "OpenSSL_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "8.11.1+1"

[[deps.LibGit2]]
deps = ["LibGit2_jll", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"
version = "1.11.0"

[[deps.LibGit2_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "OpenSSL_jll"]
uuid = "e37daf67-58a4-590a-8e99-b0245dd2ffc5"
version = "1.9.0+0"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "OpenSSL_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.11.3+1"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"
version = "1.11.0"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
version = "1.12.0"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"
version = "1.11.0"

[[deps.MIMEs]]
git-tree-sha1 = "c64d943587f7187e751162b3b84445bbbd79f691"
uuid = "6c6e2e6c-3030-632d-7369-2d6c69616d65"
version = "1.1.0"

[[deps.Markdown]]
deps = ["Base64", "JuliaSyntaxHighlighting", "StyledStrings"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"
version = "1.11.0"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"
version = "1.11.0"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2025.5.20"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.3.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.29+0"

[[deps.OpenSSL_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "458c3c95-2e84-50aa-8efc-19380b2a3a95"
version = "3.5.1+0"

[[deps.Parsers]]
deps = ["Dates", "PrecompileTools", "UUIDs"]
git-tree-sha1 = "7d2f8f21da5db6a806faf7b9b292296da42b2810"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.8.3"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "FileWatching", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "Random", "SHA", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.12.0"

    [deps.Pkg.extensions]
    REPLExt = "REPL"

    [deps.Pkg.weakdeps]
    REPL = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "Downloads", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "MIMEs", "Markdown", "Random", "Reexport", "URIs", "UUIDs"]
git-tree-sha1 = "3faff84e6f97a7f18e0dd24373daa229fd358db5"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.73"

[[deps.PrecompileTools]]
deps = ["Preferences"]
git-tree-sha1 = "07a921781cab75691315adc645096ed5e370cb77"
uuid = "aea7be01-6a6a-4083-8856-8a6e6704d82a"
version = "1.3.3"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "0f27480397253da18fe2c12a4ba4eb9eb208bf3d"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.5.0"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"
version = "1.11.0"

[[deps.Random]]
deps = ["SHA"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"
version = "1.11.0"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"
version = "1.11.0"

[[deps.Statistics]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "ae3bb1eb3bba077cd276bc5cfc337cc65c3075c0"
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
version = "1.11.1"

    [deps.Statistics.extensions]
    SparseArraysExt = ["SparseArrays"]

    [deps.Statistics.weakdeps]
    SparseArrays = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.StyledStrings]]
uuid = "f489334b-da3d-4c2e-b8f0-e476e12c162b"
version = "1.11.0"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.3"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.0"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"
version = "1.11.0"

[[deps.Tricks]]
git-tree-sha1 = "311349fd1c93a31f783f977a71e8b062a57d4101"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.13"

[[deps.URIs]]
git-tree-sha1 = "bef26fb046d031353ef97a82e3fdb6afe7f21b1a"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.6.1"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"
version = "1.11.0"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"
version = "1.11.0"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.3.1+2"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.15.0+0"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.64.0+1"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.5.0+2"
"""

# ╔═╡ Cell order:
# ╟─5a23ab1c-c152-11f0-9abf-516d8b0127b2
# ╟─c7a2268a-a127-441e-95b7-2ddf5eaaceab
# ╟─63c8ba5d-2d9e-44f7-8d19-6be614050a77
# ╠═06a4308f-9b4f-415c-8c34-7f851f0d167d
# ╠═70b431b7-6ad7-478c-a951-d68c5ade32ae
# ╠═f55b7f7e-a2a7-4506-b894-e9a6dea88a42
# ╠═e5a6cadc-3cca-424f-b8ed-9deeca915a67
# ╠═2b805585-eae8-41d3-9320-56f6a32152bf
# ╠═d7e022d8-c7e4-4ab1-b05f-45cd6a674f82
# ╠═e520ae3f-9331-4bf4-b2ec-30bdc7773f1b
# ╠═58f53299-6a5b-4325-bd2a-e2a32d130c6b
# ╠═85fda1f1-f026-48ad-b8b4-296a52fdd479
# ╠═c76c6c2e-1d68-4858-bd34-3fecf0d0c7f9
# ╠═fd5d465a-7415-4812-b023-14bd1660cb94
# ╠═6a71a540-bc93-4b55-9aef-61c9e53c5b7a
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
