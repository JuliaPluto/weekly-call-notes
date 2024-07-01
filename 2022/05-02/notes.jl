### A Pluto.jl notebook ###
# v0.19.3

using Markdown
using InteractiveUtils

# ╔═╡ c85f7e02-5bd5-4fb7-b279-d8297343a8b9
using MarkdownLiteral: @mdx

# ╔═╡ 732d814a-49c7-4f96-8de7-431f1dcd4982
using PlutoUI, MarkdownLiteral, Dates

# ╔═╡ bb11affe-4725-4520-a97d-268321b8297d


# ╔═╡ b371a705-ab0e-4ff6-987f-1d4c64a37c67


# ╔═╡ 23038308-312f-4cc8-a77f-2b011ce2ddc3
md"""
# BetterFileWatching.jl

Working on the Windows issues...

Will it work on all platforms that Pluto works on? We'll try! Maybe we need to figure out a way to not use BetterFileWatching.jl when not available on the platform.
"""

# ╔═╡ b63bc836-6bbc-4105-8778-561472cd01ef
md"""
# Callable structs & Base.show

Example, this should work:

"""

# ╔═╡ ed7ac3db-2bb0-4107-9dea-df6c6c5df7b8
# Create an instance of C with the Constructor
c = C(1.)

# ╔═╡ 82fb0616-773b-4ebc-b235-d84b048078ea
begin
	struct D
		x
	end
	dd = D(1.)

	# dd() # <-- fails here
	(::D)() = 1 + dd.x   # <- makes the instance callable, not the "type"
	# ---- This fn below
	function (d::D)(args...)
		d.x
	end
	# ---- gets rewritten as
	function D(d, args...)

	end
	D(nothing)  # <- still invokes the constructor
				
	dd() # <-- succeeds
end

# ╔═╡ b045f19b-bb7c-430d-9435-8428597d3baa
c()

# ╔═╡ 51c6a49c-a20d-4e26-abbd-802eb7e2bfd8
# d = C(true)

# ╔═╡ bed6c35b-a500-4df4-8f27-d1e57c1cb009
# d()

# ╔═╡ 1cb0fece-ff00-4a1e-8c94-a4b7357da360
md"""
This is a similar problem to [#326](https://github.com/fonsp/Pluto.jl/issues/326): defining a Base.show method for a type changes how it is displayed, but this is not reactive. That's why you get two different outputs here:
"""

# ╔═╡ fecfc416-a965-4236-b0fa-a687daed4757
struct Cool
	x
end

# ╔═╡ b1ae6db1-35b7-4eb5-91be-26ec4941d148
Cool(1)

# ╔═╡ 8d2f4264-c8fc-4ef9-942a-c15dbdcfe820
Base.show(io::IO, ::MIME"text/plain", c::Cool) = print(io, "Coooool $(c.x)")

# ╔═╡ 855ce931-45c8-4df0-866d-5af7e046910d
Cool(1)

# ╔═╡ 324fd5a3-71c4-4138-92fd-bcc422158550
md"""
## Solutions
**Why not run them during the definition of `A` itself?** Because `A` needs to be defined before Base.show or the callable. So they should be ordered.

"""

# ╔═╡ 07559577-718a-44ac-884b-5438aadb7f32
Base.show(io::IO, m::MIME"text/plain", thing::DoesNotExist) = nothing

# ╔═╡ b5bdffbc-6fdc-4308-8a3d-6103ace15d17
md"""

**Why not a normal reference?** Like: every reference to `A` also references `Base.show(.., .., ::A)`. Because it can create a cycle that was not there before. **Example:**

"""

# ╔═╡ 1404fd01-5567-41e3-b931-2f105effaed8
myfunc(thing::A) = "hello"

# ╔═╡ 7b035ca3-70cb-422c-a991-c8652fa93768
Base.show(io::IO, m::MIME"text/plain", thing::A) = print(io, myfunc(thing))

# ╔═╡ d2793f5c-9998-4d59-8ee3-f6071113bd0b
md"""

🙌 Maybe we can use the **soft definitions idea** to solve. Maybe _**soft references**_, where every reference to `A` also has a *soft reference* to its callable definition, and its Base.show method.

"""

# ╔═╡ f6e53671-08c5-4a22-830b-fe71e4fb33b8
md"""
# Testing

We might want to use a testing package for our julia backend tests because:
- It's not easy to run only some of the tests: [https://github.com/JuliaTesting/ReTest.jl](https://github.com/JuliaTesting/ReTest.jl)
- Cool features like diffing: [https://github.com/ssfrr/TestSetExtensions.jl](https://github.com/ssfrr/TestSetExtensions.jl)
- Timing inside tests (already implemented)
- Allow a testset to be retried multiple times, like our filewatching tests
"""

# ╔═╡ 52c38944-8c25-49d6-b6f1-7c8761a6a75f
md"""
# Pluto tshirts!

Which color??

We could use the birds!! From [https://plutojl.org/plutocon2021](https://plutojl.org/plutocon2021)

![cutebanner](https://user-images.githubusercontent.com/6933510/166295621-43395689-b7ed-450e-b289-3193842a9b8c.png)

on the front

nothing on the back

Jupyter notebook with a "... is not defined" error on the back

How P chooses tshirts: first on the stack



"""

# ╔═╡ 6b3fd455-8218-49a5-bd3b-af99bb585333
panagiotis = md"""
- Machine Status UI 
  - CPU
  - MEM
  - Time left in JuliaHub
  - Time left outside of JuliaHub (Battery)
- Should/Can we save Bind state in metadata? (API: `set_cell_metadata`/`get_cell_metadata`, send an `CustomEvent`(`"input"`, `get_cell_metadata`[`:bindsomething`]))
- T shirts please!


"""

# ╔═╡ 052e62dc-bf15-4666-8333-a7420cc30934
md"""
# To discuss
- fons: Backend testing Pluto
- Paul: BetterFileWatching.jl
- Paul: Functors & Base.show
$(panagiotis)
"""

# ╔═╡ 4838c268-5844-4245-b455-b1558745d93e


# ╔═╡ d03df05d-856c-4c0b-9e7c-084c21ab24d9


# ╔═╡ a5fc34c7-ccea-46f6-a613-71c71d711587


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

# ╔═╡ eb62a83f-2528-46ca-86d1-fbdbf8748844
# Define a function that makes C as callable
# AND ALSO uses an instance of C (here: `c`)
(::C)() = 1 + c.x

# ╔═╡ d5ea9fa7-7b3c-4720-ac4a-16ef0b59fd7e
# Define a struct C
struct C
	x
end

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
# ╠═052e62dc-bf15-4666-8333-a7420cc30934
# ╠═bb11affe-4725-4520-a97d-268321b8297d
# ╠═b371a705-ab0e-4ff6-987f-1d4c64a37c67
# ╟─23038308-312f-4cc8-a77f-2b011ce2ddc3
# ╟─b63bc836-6bbc-4105-8778-561472cd01ef
# ╠═d5ea9fa7-7b3c-4720-ac4a-16ef0b59fd7e
# ╠═ed7ac3db-2bb0-4107-9dea-df6c6c5df7b8
# ╠═eb62a83f-2528-46ca-86d1-fbdbf8748844
# ╠═82fb0616-773b-4ebc-b235-d84b048078ea
# ╠═b045f19b-bb7c-430d-9435-8428597d3baa
# ╠═51c6a49c-a20d-4e26-abbd-802eb7e2bfd8
# ╠═bed6c35b-a500-4df4-8f27-d1e57c1cb009
# ╟─1cb0fece-ff00-4a1e-8c94-a4b7357da360
# ╠═fecfc416-a965-4236-b0fa-a687daed4757
# ╠═b1ae6db1-35b7-4eb5-91be-26ec4941d148
# ╠═8d2f4264-c8fc-4ef9-942a-c15dbdcfe820
# ╠═855ce931-45c8-4df0-866d-5af7e046910d
# ╟─324fd5a3-71c4-4138-92fd-bcc422158550
# ╠═07559577-718a-44ac-884b-5438aadb7f32
# ╟─b5bdffbc-6fdc-4308-8a3d-6103ace15d17
# ╠═7b035ca3-70cb-422c-a991-c8652fa93768
# ╠═1404fd01-5567-41e3-b931-2f105effaed8
# ╟─d2793f5c-9998-4d59-8ee3-f6071113bd0b
# ╟─f6e53671-08c5-4a22-830b-fe71e4fb33b8
# ╠═52c38944-8c25-49d6-b6f1-7c8761a6a75f
# ╠═6b3fd455-8218-49a5-bd3b-af99bb585333
# ╠═4838c268-5844-4245-b455-b1558745d93e
# ╠═d03df05d-856c-4c0b-9e7c-084c21ab24d9
# ╠═a5fc34c7-ccea-46f6-a613-71c71d711587
# ╠═532c3226-9cca-45ec-8785-e51e119fc852
# ╠═c85f7e02-5bd5-4fb7-b279-d8297343a8b9
# ╠═732d814a-49c7-4f96-8de7-431f1dcd4982
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
