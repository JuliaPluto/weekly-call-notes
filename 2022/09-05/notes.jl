### A Pluto.jl notebook ###
# v0.19.11

using Markdown
using InteractiveUtils

# ╔═╡ 011fb094-4688-40ee-945b-e5eb89b419db
using MarkdownLiteral: @mdx

# ╔═╡ f763903e-4cb0-452b-9925-b058d7bed938
using PlutoUI, MarkdownLiteral, Dates

# ╔═╡ 3317cc49-1927-4443-a918-2f4ac437ff28
md"""
# To discuss

- Sergio: Malt.jl
- Paul: BetterFileWatching
- fonsp: interrupts
- Dhruv: native Windows app!
- Paul: disabling
- fonsp: featured notebooks

"""

# ╔═╡ c004622e-5090-4805-8e3f-f902fa5a6817
md"""
# Malt.jl

Registered on general registry! Yayyy

Very close to being used. Still TODO:
- Pluto.jl tests on Windows are failing, might be a network issue...
- (would be nice!) Interrupts on windows :o
- Create Pluto.jl tests that Distributed can be used
- Performance comparison with Distributed:
  - Time to first run
  - Performance after loading: `@benchmark Malt.remotecall_eval(:(1+1))`

"""

# ╔═╡ 23ea0d1d-0d19-45c4-8dd1-2cc87b451ffa
md"""
# BetterFileWatching.jl

Found the problem on windows! [commit](https://github.com/JuliaPluto/watcher/commit/4223cc8ac427fe16532a59ff4d0bee2f1524fa17) but now there is a new problem 🙌


But we are making progress! [#2](https://github.com/JuliaPluto/BetterFileWatching.jl/pull/2) is getting close :)
"""

# ╔═╡ 7b96d5a7-e4e0-4b3c-81b7-409e0fa0f50a
md"""
# Interrupt (Ctrl-C) is different on Julia 1.8 and HTTP 1.0

One issue was introduced when we upgraded to HTTP 1.0: [#2229](https://github.com/fonsp/Pluto.jl/issues/2229)

But also Ctrl-C stopped working on Julia 1.8: [https://github.com/fonsp/Pluto.jl/issues/2136](https://github.com/fonsp/Pluto.jl/issues/2136)

And you also had this issue on Julia 1.7 + HTTP 1.0: the interrupt exception is thrown to any running task.

Maybe we should gather a lot of stack traces and see which task.

Maybe add a second way to quit Pluto: `type "exit" to shut down pluto` that will let us do a graceful shutdown

Maybe HTTP.jl should have API to let you do "run server until I ctrl-C" instead of the unofficial way.

Paul tried to reproduce with a simple HTTP server but did not reproduce

```julia
server = HTTP.serve!(f, host, port)

other_task = @async do_something()



wait(server)
# Ctrl+C might interrupt other_task

```

Maybe instead of just `wait(server)` we can do:

```julia
while true
	if istaskdone(server.task) || istaskdone(other_task)
		break
	end
	sleep(.1)
end

@ignorefailure close(server)
@ignorefailure close(other_task)
```

Problem happens more often when you do `julia --threads=4`.

We could clean up the error message with [this](https://github.com/fonsp/Pluto.jl/commit/56806832f402bc0193c1e6567333ba17f2085207)

"""

# ╔═╡ 3aba0a1f-b490-4d49-b5d6-2b6d6a9896d5
md"""
# Dhruv: PlutoDesktop for windows

Created [issues and milestones](https://github.com/JuliaPluto/PlutoDesktop/issues?q=is%3Aissue+is%3Aopen+sort%3Aupdated-desc) for future work.

For releasing in the Windows Store:
- We need credentials, maybe kindly ask the Julia Computing account? David Anthoff might know

Can we have full offline support? We want to put the `installer.exe` on a USB drive, and give it to someone without internet.
"""

# ╔═╡ f5db6b75-1c65-4f29-b69f-2b70f04f26de


# ╔═╡ 3194b651-3425-4f6e-9471-fdc5cae102d6
PlutoUI.TableOfContents()

# ╔═╡ f3640826-f628-4c9f-b1f0-67f4784e7c67
md"""
---
"""

# ╔═╡ 001499da-3356-448d-bd3c-859d7c6bbbac
today = try
	join(splitpath(pwd())[end-1:end],"-") |> Date
catch
	Dates.now() |> Date
end

# ╔═╡ 6a2674d8-afa7-44df-acc3-21724fd1471e
@mdx """
# 🤠 Pluto developer call, *$(today)* 🤠
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Dates = "ade2ca70-3891-5945-98fb-dc099432e06a"
MarkdownLiteral = "736d6165-7244-6769-4267-6b50796e6954"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
MarkdownLiteral = "~0.1.1"
PlutoUI = "~0.7.39"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.0"
manifest_format = "2.0"
project_hash = "08b207875d95d9eb4e6c28d9571ebafb8716805b"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "8eaf9f1b4921132a4cff3f36a1d9ba923b14a481"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.1.4"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.1"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "eb7f0f8307f71fac7c606984ea5fb2817275d6e4"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.4"

[[deps.CommonMark]]
deps = ["Crayons", "JSON", "URIs"]
git-tree-sha1 = "4cd7063c9bdebdbd55ede1af70f3c2f48fab4215"
uuid = "a80b9123-70ca-4bc0-993e-6e3bcb318db6"
version = "0.8.6"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "0.5.2+0"

[[deps.Crayons]]
git-tree-sha1 = "249fe38abf76d48563e2f4556bebd215aa317e15"
uuid = "a8cc5b0e-0ffa-5ad4-8c14-923d3ee1735f"
version = "4.1.1"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

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
deps = ["Tricks"]
git-tree-sha1 = "c47c5fa4c5308f27ccaac35504858d8914e102f9"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.4"

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
version = "0.6.3"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "7.84.0+0"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.10.2+0"

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
version = "2.28.0+0"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2022.2.1"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.20+0"

[[deps.Parsers]]
deps = ["Dates"]
git-tree-sha1 = "0044b23da09b5608b4ecacb4e5e6c6332f833a7e"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.3.2"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.8.0"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "UUIDs"]
git-tree-sha1 = "8d1f54886b9037091edf146b517989fc4a09efec"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.39"

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
version = "0.7.0"

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
version = "1.0.0"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.0"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.Tricks]]
git-tree-sha1 = "6bac775f2d42a611cdfcd1fb217ee719630c4175"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.6"

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
version = "1.2.12+3"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.1.1+0"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.48.0+0"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.4.0+0"
"""

# ╔═╡ Cell order:
# ╟─6a2674d8-afa7-44df-acc3-21724fd1471e
# ╟─3317cc49-1927-4443-a918-2f4ac437ff28
# ╟─c004622e-5090-4805-8e3f-f902fa5a6817
# ╟─23ea0d1d-0d19-45c4-8dd1-2cc87b451ffa
# ╟─7b96d5a7-e4e0-4b3c-81b7-409e0fa0f50a
# ╟─3aba0a1f-b490-4d49-b5d6-2b6d6a9896d5
# ╠═f5db6b75-1c65-4f29-b69f-2b70f04f26de
# ╠═3194b651-3425-4f6e-9471-fdc5cae102d6
# ╟─f3640826-f628-4c9f-b1f0-67f4784e7c67
# ╠═001499da-3356-448d-bd3c-859d7c6bbbac
# ╠═011fb094-4688-40ee-945b-e5eb89b419db
# ╠═f763903e-4cb0-452b-9925-b058d7bed938
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
