### A Pluto.jl notebook ###
# v0.19.32

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

# ╔═╡ 29f9a5f2-f9bc-4bde-bb19-c7557f107776
using PlutoHooks

# ╔═╡ 3d46462e-d4d9-440c-9b18-957d6e0555ae
using HTTP

# ╔═╡ f512c2f8-b775-4fb5-b69e-1199c1e627e9
using PlutoUI

# ╔═╡ 30c9432e-7ee9-11ee-1671-c56296969160
md"""
# Weekly call notes 9 nov 2023
"""

# ╔═╡ 88bd3711-9c80-4d53-858a-f4161c69332c
md"""
# JupyterCon local Eindhoven 1 Dec 2023

And PyData! Lots of exciting stuff, including a Pluto hackathon parallel to PyData on Nov 30. We have 20 free tickets! Let us know if you want to join.

Paul and Luca and Fons give a talk.


"""

# ╔═╡ 75c8f226-e95a-4421-8cbf-e56d02ddc3e8
md"""
# PlutoHooks.jl

Some implicit control on when things run. Should we make promise to the user: PlutoRunner 

Has stability issues, but we didn't document them super well.

One issue is how to write an HTTP server inside a notebook using PlutoHooks:

- usetask to create an HTTP server that runs in the background
- inside the server, you have a setstate that sets the response it just got
- how can we process the request in the notebook and reply using the server?



"""

# ╔═╡ b51b9219-48c0-493c-aae4-00365ef15f04
md"""
## HTTP Server with PlutoHooks.jl:
"""

# ╔═╡ e3752535-2ca9-415c-9360-5dfec5016114


# ╔═╡ 2dda6df7-20f3-4120-93c6-f789791b2716


# ╔═╡ 182e18d0-4735-4916-8614-34a95398a2f5


# ╔═╡ d4afe175-79be-4e31-917e-e87154176255


# ╔═╡ 3d292e89-d7bd-4a73-8535-c48b2f084a38


# ╔═╡ 872cdf01-6cf9-4806-a250-fb82b1f207d6
import URIs

# ╔═╡ 1ea41417-1f71-450b-ba44-a9f230a2cc68
function handle_cool(r::HTTP.Request)::HTTP.Response
	parts = URIs.splitpath(r.target)
	name = parts[2]

	
	HTTP.Response(200, uppercase(name))
end

# ╔═╡ 4aa7548a-41c2-480b-8a19-8c2a6b3d76ec
function handle_ai(r::HTTP.Request)::HTTP.Response
	parts = URIs.splitpath(r.target)
	
	HTTP.Response(400, "AI IS DUMB ✨")
end

# ╔═╡ 2f9b4383-e2b0-4d90-ae4f-c1ef1ab6e584
begin
	router = HTTP.Router()
	HTTP.register!(router, "/cool/**", handle_cool)
	HTTP.register!(router, "/ai/**", handle_ai)

	router
end

# ╔═╡ 0cfa4d24-b925-401d-b96f-3f08c9d956c1
function handle(r::HTTP.Request)::HTTP.Response

	return router(r)
end

# ╔═╡ b461b9b4-2bb6-4029-87f1-2193cf821362
@bind port Slider(8000:8100)

# ╔═╡ eb12ec33-a64a-456f-9a1e-cfc2cc5fde54
macro use_http_server(port, handler)

	return quote
		port = $(esc(port))
		my_handler = $(esc(handler))
		@info "from quote" my_handler my_handler(HTTP.Request("GET", "/cool/zzz"))
		handler_ref = @use_ref(my_handler)
		handler_ref[] = my_handler
	
	
		@use_effect([handler_ref, port]) do
			server = HTTP.serve!(port) do r
				the_handler = handler_ref[]
				
				@info "from serve" the_handler the_handler(HTTP.Request("GET", "/cool/zzz"))

				
				the_handler(r)
			end
		
			return function()
				close(server)
			end
		end

		(; port, url="http://localhost:$(port)", ready=true, superfast=:maybe)
	end
end

# ╔═╡ f67f6807-57a1-4c48-94d0-d34c2119f7b2
server = @use_http_server(port, handle)

# ╔═╡ d2abdbc0-c3d0-45f4-8d7d-266b9cb7303d
macroexpand(@__MODULE__, :( @use_http_server(port, handle)); recursive=false)

# ╔═╡ 98ce636f-c568-4e1f-8c28-0b0c31fda2ef
url = server.url

# ╔═╡ edaa0723-c8c3-4abc-97b0-de6d9839abfa
HTTP.request("GET", "$(url)/cool/fonzisdfsdf")

# ╔═╡ e3025bc9-aa6c-4057-9892-25b23749b707
HTTP.request("GET", "$(url)/cool/panayiotiisss")

# ╔═╡ 66fff200-796b-46f7-95ff-9bf79710e196
HTTP.request("GET", "$(url)/ai/painting"; status_exception=false)

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
HTTP = "cd3eb016-35fb-5094-929b-558a96fad6f3"
PlutoHooks = "0ff47ea0-7a50-410d-8455-4348d5de0774"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
URIs = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"

[compat]
HTTP = "~1.10.0"
PlutoHooks = "~0.0.5"
PlutoUI = "~0.7.53"
URIs = "~1.5.1"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.3"
manifest_format = "2.0"
project_hash = "13a09a4be53a5bde5a601999977fb3f5ba4be186"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "91bd53c39b9cbfb5ef4b015e8b582d344532bd0a"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.2.0"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.1"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.BitFlags]]
git-tree-sha1 = "43b1a4a8f797c1cddadf60499a8a077d4af2cd2d"
uuid = "d1d4a3ce-64b1-5f1a-9ba4-7e7e69966f35"
version = "0.1.7"

[[deps.CodecZlib]]
deps = ["TranscodingStreams", "Zlib_jll"]
git-tree-sha1 = "cd67fc487743b2f0fd4380d4cbd3a24660d0eec8"
uuid = "944b1d66-785c-5afd-91f1-9de20f533193"
version = "0.7.3"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "eb7f0f8307f71fac7c606984ea5fb2817275d6e4"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.4"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "0.5.2+0"

[[deps.ConcurrentUtilities]]
deps = ["Serialization", "Sockets"]
git-tree-sha1 = "8cfa272e8bdedfa88b6aefbbca7c19f1befac519"
uuid = "f0e56b4a-5159-44fe-b623-3e5288b988bb"
version = "2.3.0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.ExceptionUnwrapping]]
deps = ["Test"]
git-tree-sha1 = "e90caa41f5a86296e014e148ee061bd6c3edec96"
uuid = "460bff9d-24e4-43bc-9d9f-a8973cb893f4"
version = "0.1.9"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[deps.HTTP]]
deps = ["Base64", "CodecZlib", "ConcurrentUtilities", "Dates", "ExceptionUnwrapping", "Logging", "LoggingExtras", "MbedTLS", "NetworkOptions", "OpenSSL", "Random", "SimpleBufferStream", "Sockets", "URIs", "UUIDs"]
git-tree-sha1 = "5eab648309e2e060198b45820af1a37182de3cce"
uuid = "cd3eb016-35fb-5094-929b-558a96fad6f3"
version = "1.10.0"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "7134810b1afce04bbc1045ca1985fbe81ce17653"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.5"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "d75853a0bdbfb1ac815478bacd89cd27b550ace6"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.3"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.JLLWrappers]]
deps = ["Artifacts", "Preferences"]
git-tree-sha1 = "7e5d6779a1e09a36db2a7b6cff50942a0a7d0fca"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.5.0"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "31e996f0a15c7b280ba9f76636b3ff9e2ae58c9a"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.4"

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

[[deps.LoggingExtras]]
deps = ["Dates", "Logging"]
git-tree-sha1 = "c1dd6d7978c12545b4179fb6153b9250c96b0075"
uuid = "e6f89c97-d47a-5376-807f-9c37f3926c36"
version = "1.0.3"

[[deps.MIMEs]]
git-tree-sha1 = "65f28ad4b594aebe22157d6fac869786a255b7eb"
uuid = "6c6e2e6c-3030-632d-7369-2d6c69616d65"
version = "0.1.4"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS]]
deps = ["Dates", "MbedTLS_jll", "MozillaCACerts_jll", "Random", "Sockets"]
git-tree-sha1 = "03a9b9718f5682ecb107ac9f7308991db4ce395b"
uuid = "739be429-bea8-5141-9913-cc70e7f3736d"
version = "1.1.7"

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

[[deps.OpenSSL]]
deps = ["BitFlags", "Dates", "MozillaCACerts_jll", "OpenSSL_jll", "Sockets"]
git-tree-sha1 = "51901a49222b09e3743c65b8847687ae5fc78eb2"
uuid = "4d8831e6-92b7-49fb-bdf8-b643e874388c"
version = "1.4.1"

[[deps.OpenSSL_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "cc6e1927ac521b659af340e0ca45828a3ffc748f"
uuid = "458c3c95-2e84-50aa-8efc-19380b2a3a95"
version = "3.0.12+0"

[[deps.Parsers]]
deps = ["Dates", "PrecompileTools", "UUIDs"]
git-tree-sha1 = "716e24b21538abc91f6205fd1d8363f39b442851"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.7.2"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.8.0"

[[deps.PlutoHooks]]
deps = ["InteractiveUtils", "Markdown", "UUIDs"]
git-tree-sha1 = "072cdf20c9b0507fdd977d7d246d90030609674b"
uuid = "0ff47ea0-7a50-410d-8455-4348d5de0774"
version = "0.0.5"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "MIMEs", "Markdown", "Random", "Reexport", "URIs", "UUIDs"]
git-tree-sha1 = "db8ec28846dbf846228a32de5a6912c63e2052e3"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.53"

[[deps.PrecompileTools]]
deps = ["Preferences"]
git-tree-sha1 = "03b4c25b43cb84cee5c90aa9b5ea0a78fd848d2f"
uuid = "aea7be01-6a6a-4083-8856-8a6e6704d82a"
version = "1.2.0"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "00805cd429dcb4870060ff49ef443486c262e38e"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.4.1"

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

[[deps.SimpleBufferStream]]
git-tree-sha1 = "874e8867b33a00e784c8a7e4b60afe9e037b74e1"
uuid = "777ac1f9-54b0-4bf8-805c-2214025038e7"
version = "1.1.0"

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
version = "1.10.1"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.TranscodingStreams]]
deps = ["Random", "Test"]
git-tree-sha1 = "1fbeaaca45801b4ba17c251dd8603ef24801dd84"
uuid = "3bb67fe8-82b1-5028-8e26-92a6c54297fa"
version = "0.10.2"

[[deps.Tricks]]
git-tree-sha1 = "eae1bb484cd63b36999ee58be2de6c178105112f"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.8"

[[deps.URIs]]
git-tree-sha1 = "67db6cc7b3821e19ebe75791a9dd19c9b1188f2b"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.5.1"

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
# ╟─30c9432e-7ee9-11ee-1671-c56296969160
# ╟─88bd3711-9c80-4d53-858a-f4161c69332c
# ╟─75c8f226-e95a-4421-8cbf-e56d02ddc3e8
# ╟─b51b9219-48c0-493c-aae4-00365ef15f04
# ╠═0cfa4d24-b925-401d-b96f-3f08c9d956c1
# ╠═1ea41417-1f71-450b-ba44-a9f230a2cc68
# ╠═edaa0723-c8c3-4abc-97b0-de6d9839abfa
# ╠═e3025bc9-aa6c-4057-9892-25b23749b707
# ╟─e3752535-2ca9-415c-9360-5dfec5016114
# ╟─2dda6df7-20f3-4120-93c6-f789791b2716
# ╟─182e18d0-4735-4916-8614-34a95398a2f5
# ╠═4aa7548a-41c2-480b-8a19-8c2a6b3d76ec
# ╠═66fff200-796b-46f7-95ff-9bf79710e196
# ╟─d4afe175-79be-4e31-917e-e87154176255
# ╟─3d292e89-d7bd-4a73-8535-c48b2f084a38
# ╠═2f9b4383-e2b0-4d90-ae4f-c1ef1ab6e584
# ╠═872cdf01-6cf9-4806-a250-fb82b1f207d6
# ╠═29f9a5f2-f9bc-4bde-bb19-c7557f107776
# ╠═3d46462e-d4d9-440c-9b18-957d6e0555ae
# ╠═f512c2f8-b775-4fb5-b69e-1199c1e627e9
# ╠═b461b9b4-2bb6-4029-87f1-2193cf821362
# ╠═eb12ec33-a64a-456f-9a1e-cfc2cc5fde54
# ╠═f67f6807-57a1-4c48-94d0-d34c2119f7b2
# ╠═d2abdbc0-c3d0-45f4-8d7d-266b9cb7303d
# ╠═98ce636f-c568-4e1f-8c28-0b0c31fda2ef
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
