### A Pluto.jl notebook ###
# v0.19.14

using Markdown
using InteractiveUtils

# ╔═╡ f5d91244-a889-4787-8a98-61171027a3c4
using SQLite

# ╔═╡ 64aa8b7e-9b62-41ee-b5b3-53c7ffc959b3
using DataFrames

# ╔═╡ 4c179989-3af2-43aa-9478-37b9e65bd3dd
using Tables

# ╔═╡ 47d382f4-8b89-11ed-1e5a-110a1b1bfc9f
md"""
# Notes 3 Jan 2023

Happy new year!
"""

# ╔═╡ 8772831f-22e2-45f7-b0e5-7e5df2a25299
isfile("D:\\as\\a/a/a/asdasd\\/a")

# ╔═╡ 94edcf8e-b4dd-4f98-a07c-4673f7244f63


# ╔═╡ d8b342f2-6e56-4b56-b980-f7b96ed21787


# ╔═╡ c5210a8a-437c-4401-8bfe-f233b7618912
md"""
# Server crash

My PlutoSliderServer slowly accumulates memory and then crashes, if I request the `/pluto_export.json` file every 60 seconds. 😢

Idea from Panagiotis and [BioTurboNick](https://github.com/fonsp/Pluto.jl/issues/1850): Julia is bad at GC if inside a docker or VM or something. Maybe we need to trigger GC ourselves?? :(

Maybe ask Jacob Quinn?
"""

# ╔═╡ b57e5bb4-3e6a-41fe-9b00-96f0d01ca29e
begin
global i = 0
	function mygc()
	global i +=1
	if i %100 == 0 
		@async GC.gc()
	end
end
end

# ╔═╡ f5a103ca-fda2-4784-b033-4e5be731fdd6
PlutoRunner.register_my_router()

# ╔═╡ 9151cc12-6425-4f5b-b8a0-f887306e3f00
i

# ╔═╡ 00c5970c-1c45-45ac-8366-dc7cbda88abd
mygc()

# ╔═╡ cf29b96c-fd33-4064-b2c9-7cacdb6d4dfc
md"""
# SQLite experiments
"""

# ╔═╡ 9e2dfb1f-bdd3-42af-b3b3-f97fddd5bbcf
db = SQLite.DB("Chinook_Sqlite.sqlite")

# ╔═╡ 5f808011-5811-479d-b633-d7fb33a09b45
DBInterface.execute(db, "SELECT * FROM (VALUES (1),(2),(3),(4),(5))")

# ╔═╡ 67ca4503-eecd-41f7-bb5c-63922094311d
cursor = DBInterface.execute(db, "SELECT * FROM (VALUES (1),(2),(3),(4),(5))")

# ╔═╡ ea6e5d40-521c-481a-8cbc-f38ae496c762
x = (i*2 for i in 1:5)

# ╔═╡ f9bbae80-eeed-46d3-8af1-fd77cd879133
collect(x)

# ╔═╡ 478cefef-46f7-423b-9100-cf5593f3eb09
collect(x)

# ╔═╡ a86d003d-ffcd-4c42-adf9-846fd31c1d7e
Tables.istable(cursor)

# ╔═╡ a0ceb085-e8ff-4a9a-b4eb-760170aec865
Tables.rows(cursor)

# ╔═╡ 29e285af-1228-49b8-9e57-205b6ae4ecab
isempty(Tables.rows(cursor))

# ╔═╡ f715bdbd-d6a6-415a-8a7f-b58c092762e2


# ╔═╡ a649c413-94a0-43ed-939d-fe060f7fadda
PlutoRunner.pluto_showable(MIME"application/vnd.pluto.table+object"(), cursor)

# ╔═╡ 10befd03-27fe-41e5-a3cf-8fcd72ea1de8
Tables.rowaccess(cursor)

# ╔═╡ 50a2af8e-dfa7-47ee-a727-e4057ea69ab3
isempty(cursor)

# ╔═╡ 68d3c893-c12c-4580-ab8f-e806a39ae3e0
DataFrame(cursor)

# ╔═╡ bbeeac15-d16f-473a-aff8-efcfc7c4fd56
let
	cursor = DBInterface.execute(db, "SELECT * FROM (VALUES (1),(2),(3),(4),(5))")
	isempty(cursor)
end

# ╔═╡ 571871a9-da80-4494-901b-898f94121ee7
let
	cursor = DBInterface.execute(db, "SELECT * FROM (VALUES (1),(2),(3),(4),(5))")
	repr(MIME"text/plain"(), Tables.rows(cursor))
	isempty(cursor)
end

# ╔═╡ c3858fb3-1795-4446-846b-05613cd09093
let
	cursor = DBInterface.execute(db, "SELECT * FROM (VALUES (1),(2),(3),(4),(5))")
	for i in cursor

	end
	isempty(cursor)
end

# ╔═╡ 859b0f1c-d6c6-48fb-8215-839205dbc2fd
let
	cursor = DBInterface.execute(db, "SELECT * FROM (VALUES (1),(2),(3),(4),(5))")
	try
		PlutoRunner.table_data(cursor, IOContext(IOBuffer()))
	catch e
		repr(MIME"text/plain"(), Tables.rows(cursor))
	end
	isempty(cursor)
end

# ╔═╡ 16ff6e2d-8a62-4d30-833a-e8ac0c69b7ec
let
	cursor = DBInterface.execute(db, "SELECT * FROM (VALUES (1),(2),(3),(4),(5))")
	a = collect(cursor)
	b = collect(cursor)

	length(a), length(b)
end

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
DataFrames = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
SQLite = "0aa819cd-b072-5ff4-a722-6bc24af294d9"
Tables = "bd369af6-aec1-5ad0-b16a-f7cc5008161c"

[compat]
DataFrames = "~1.4.4"
SQLite = "~1.6.0"
Tables = "~1.10.0"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.4"
manifest_format = "2.0"
project_hash = "586945014b9e96a23533d337cfda9fef3c18998a"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.1"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.Compat]]
deps = ["Dates", "LinearAlgebra", "UUIDs"]
git-tree-sha1 = "00a2cccc7f098ff3b66806862d275ca3db9e6e5a"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "4.5.0"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.0.1+0"

[[deps.Crayons]]
git-tree-sha1 = "249fe38abf76d48563e2f4556bebd215aa317e15"
uuid = "a8cc5b0e-0ffa-5ad4-8c14-923d3ee1735f"
version = "4.1.1"

[[deps.DBInterface]]
git-tree-sha1 = "9b0dc525a052b9269ccc5f7f04d5b3639c65bca5"
uuid = "a10d1c49-ce27-4219-8d33-6db1a4562965"
version = "2.5.0"

[[deps.DataAPI]]
git-tree-sha1 = "e8119c1a33d267e16108be441a287a6981ba1630"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.14.0"

[[deps.DataFrames]]
deps = ["Compat", "DataAPI", "Future", "InvertedIndices", "IteratorInterfaceExtensions", "LinearAlgebra", "Markdown", "Missings", "PooledArrays", "PrettyTables", "Printf", "REPL", "Random", "Reexport", "SnoopPrecompile", "SortingAlgorithms", "Statistics", "TableTraits", "Tables", "Unicode"]
git-tree-sha1 = "d4f69885afa5e6149d0cab3818491565cf41446d"
uuid = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
version = "1.4.4"

[[deps.DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "d1fff3a548102f48987a52a2e0d114fa97d730f0"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.13"

[[deps.DataValueInterfaces]]
git-tree-sha1 = "bfc1187b79289637fa0ef6d4436ebdfe6905cbd6"
uuid = "e2d170a0-9d28-54be-80f0-106bbe20a464"
version = "1.0.0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

[[deps.Formatting]]
deps = ["Printf"]
git-tree-sha1 = "8339d61043228fdd3eb658d86c926cb282ae72a8"
uuid = "59287772-0a20-5a39-b81b-1366585eb4c0"
version = "0.4.2"

[[deps.Future]]
deps = ["Random"]
uuid = "9fa8497b-333b-5362-9e8d-4d0656e87820"

[[deps.InlineStrings]]
deps = ["Parsers"]
git-tree-sha1 = "0cf92ec945125946352f3d46c96976ab972bde6f"
uuid = "842dd82b-1e85-43dc-bf29-5d0ee9dffc48"
version = "1.3.2"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.InvertedIndices]]
git-tree-sha1 = "82aec7a3dd64f4d9584659dc0b62ef7db2ef3e19"
uuid = "41ab1584-1d38-5bbf-9106-f11c6c58b48f"
version = "1.2.0"

[[deps.IteratorInterfaceExtensions]]
git-tree-sha1 = "a3f24677c21f5bbe9d2a714f95dcd58337fb2856"
uuid = "82899510-4779-5014-852e-03e436cf321d"
version = "1.0.0"

[[deps.JLLWrappers]]
deps = ["Preferences"]
git-tree-sha1 = "abc9885a7ca2052a736a600f7fa66209f96506e1"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.4.1"

[[deps.LaTeXStrings]]
git-tree-sha1 = "f2355693d6778a178ade15952b7ac47a4ff97996"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.3.0"

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

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.0+0"

[[deps.Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "f66bdc5de519e8f8ae43bdc598782d35a25b1272"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.1.0"

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

[[deps.OrderedCollections]]
git-tree-sha1 = "85f8e6578bf1f9ee0d11e7bb1b1456435479d47c"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.4.1"

[[deps.Parsers]]
deps = ["Dates", "SnoopPrecompile"]
git-tree-sha1 = "6466e524967496866901a78fca3f2e9ea445a559"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.5.2"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.8.0"

[[deps.PooledArrays]]
deps = ["DataAPI", "Future"]
git-tree-sha1 = "a6062fe4063cdafe78f4a0a81cfffb89721b30e7"
uuid = "2dfb63ee-cc39-5dd5-95bd-886bf059d720"
version = "1.4.2"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "47e5f437cc0e7ef2ce8406ce1e7e24d44915f88d"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.3.0"

[[deps.PrettyTables]]
deps = ["Crayons", "Formatting", "LaTeXStrings", "Markdown", "Reexport", "StringManipulation", "Tables"]
git-tree-sha1 = "96f6db03ab535bdb901300f88335257b0018689d"
uuid = "08abe8d2-0d0c-5749-adfa-8a2ac140af0d"
version = "2.2.2"

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

[[deps.SQLite]]
deps = ["DBInterface", "Random", "SQLite_jll", "Serialization", "Tables", "WeakRefStrings"]
git-tree-sha1 = "eb9a473c9b191ced349d04efa612ec9f39c087ea"
uuid = "0aa819cd-b072-5ff4-a722-6bc24af294d9"
version = "1.6.0"

[[deps.SQLite_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "2c761a91fb503e94bd0130fcf4352166c3c555bc"
uuid = "76ed43ae-9a5d-5a62-8c75-30186b810ce8"
version = "3.40.0+1"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.SnoopPrecompile]]
git-tree-sha1 = "f604441450a3c0569830946e5b33b78c928e1a85"
uuid = "66db9d55-30c0-4569-8b51-7e840670fc0c"
version = "1.0.1"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SortingAlgorithms]]
deps = ["DataStructures"]
git-tree-sha1 = "a4ada03f999bd01b3a25dcaa30b2d929fe537e00"
uuid = "a2af1166-a08f-5f64-846c-94a0d3cef48c"
version = "1.1.0"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.StringManipulation]]
git-tree-sha1 = "46da2434b41f41ac3594ee9816ce5541c6096123"
uuid = "892a3eda-7b42-436c-8928-eab12a02cf0e"
version = "0.3.0"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.0"

[[deps.TableTraits]]
deps = ["IteratorInterfaceExtensions"]
git-tree-sha1 = "c06b2f539df1c6efa794486abfb6ed2022561a39"
uuid = "3783bdb8-4a98-5b6b-af9a-565f29a5fe9c"
version = "1.0.1"

[[deps.Tables]]
deps = ["DataAPI", "DataValueInterfaces", "IteratorInterfaceExtensions", "LinearAlgebra", "OrderedCollections", "TableTraits", "Test"]
git-tree-sha1 = "c79322d36826aa2f4fd8ecfa96ddb47b174ac78d"
uuid = "bd369af6-aec1-5ad0-b16a-f7cc5008161c"
version = "1.10.0"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.1"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.WeakRefStrings]]
deps = ["DataAPI", "InlineStrings", "Parsers"]
git-tree-sha1 = "b1be2855ed9ed8eac54e5caff2afcdb442d52c23"
uuid = "ea10d353-3f73-51f8-a26c-33c1cb351aa5"
version = "1.4.2"

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
# ╠═47d382f4-8b89-11ed-1e5a-110a1b1bfc9f
# ╠═8772831f-22e2-45f7-b0e5-7e5df2a25299
# ╠═94edcf8e-b4dd-4f98-a07c-4673f7244f63
# ╠═d8b342f2-6e56-4b56-b980-f7b96ed21787
# ╠═c5210a8a-437c-4401-8bfe-f233b7618912
# ╠═b57e5bb4-3e6a-41fe-9b00-96f0d01ca29e
# ╠═f5a103ca-fda2-4784-b033-4e5be731fdd6
# ╠═9151cc12-6425-4f5b-b8a0-f887306e3f00
# ╠═00c5970c-1c45-45ac-8366-dc7cbda88abd
# ╟─cf29b96c-fd33-4064-b2c9-7cacdb6d4dfc
# ╠═f5d91244-a889-4787-8a98-61171027a3c4
# ╠═64aa8b7e-9b62-41ee-b5b3-53c7ffc959b3
# ╠═9e2dfb1f-bdd3-42af-b3b3-f97fddd5bbcf
# ╠═5f808011-5811-479d-b633-d7fb33a09b45
# ╠═67ca4503-eecd-41f7-bb5c-63922094311d
# ╠═4c179989-3af2-43aa-9478-37b9e65bd3dd
# ╠═ea6e5d40-521c-481a-8cbc-f38ae496c762
# ╠═f9bbae80-eeed-46d3-8af1-fd77cd879133
# ╠═478cefef-46f7-423b-9100-cf5593f3eb09
# ╠═a86d003d-ffcd-4c42-adf9-846fd31c1d7e
# ╠═a0ceb085-e8ff-4a9a-b4eb-760170aec865
# ╠═29e285af-1228-49b8-9e57-205b6ae4ecab
# ╠═f715bdbd-d6a6-415a-8a7f-b58c092762e2
# ╠═a649c413-94a0-43ed-939d-fe060f7fadda
# ╠═10befd03-27fe-41e5-a3cf-8fcd72ea1de8
# ╠═50a2af8e-dfa7-47ee-a727-e4057ea69ab3
# ╠═68d3c893-c12c-4580-ab8f-e806a39ae3e0
# ╠═bbeeac15-d16f-473a-aff8-efcfc7c4fd56
# ╠═571871a9-da80-4494-901b-898f94121ee7
# ╠═c3858fb3-1795-4446-846b-05613cd09093
# ╠═859b0f1c-d6c6-48fb-8215-839205dbc2fd
# ╠═16ff6e2d-8a62-4d30-833a-e8ac0c69b7ec
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
