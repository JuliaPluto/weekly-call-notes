### A Pluto.jl notebook ###
# v0.19.23

using Markdown
using InteractiveUtils

# ╔═╡ ea9ce5ad-3c4f-428e-90da-28a68d56c206
using JuliaSyntax

# ╔═╡ 030d3a51-9d93-4616-9c07-bf6434cbceb7
html"""
<h3 style="font-style: italic; border-bottom: none; margin-top: 0; font-weight: normal; text-align: right">June 27th, 2023</h3>
"""

# ╔═╡ f0959548-1505-11ee-0f8e-b12af03d14fd
md"""
# Pluto devtalk
 
 - Graz meetup
 - Pluto notebook competition
 - Sergio: lezer-julia
 - Luca: computational thinking course template
"""

# ╔═╡ 7a80b29b-515f-4930-ae88-738200444baa
md"""
## Graz meetup

Will people be able to join online or is it in presence only?

Discord: Two groups on each room.
"""

# ╔═╡ d9223492-aa6e-4277-8cf1-75e02c1a70ea
md"""
## Lezer

Sergio is motivated to bring lezer-julia up to date to tree-sitter julia!! [https://github.com/lezer-parser/julia/issues/19](https://github.com/lezer-parser/julia/issues/19).

First step is to update to lezer@1.0 and then start squashing issues.
"""

# ╔═╡ 24b2b220-d5c3-418a-9344-7a0d7f7da091
ex2 = :{1 ;; 2 ;; 3}

# ╔═╡ 47c8f036-9a63-440a-aae3-45044eefc63b
a = {1, 2, 3}

# ╔═╡ 3f1dec0b-b92e-4fe8-9a3f-3573c114bf78
md"""
### Hello World
"""

# ╔═╡ aecfd6b4-cb12-40cc-a17d-9ccb78aeba3f
html"""
<h1></h1>

<script>
	x = 1
</script>
"""

# ╔═╡ 439ae293-ae89-4dbd-8e27-0cddaab0e69e
x = 1

# ╔═╡ da72256f-ed4c-43b9-919c-787eedc4110e
begin
	local x
	x
end

# ╔═╡ 390fb430-bbb2-4967-9d59-674724a68a72
bieg gbiegb

# ╔═╡ cb3d2732-eb2a-4eb6-b973-713869927c03
ex = Meta.parse("""begin""", raise=false)

# ╔═╡ ca62d0ea-a11d-41a1-baa1-19717208fc36


# ╔═╡ cd505531-fcb9-4631-84ab-c7ea5544ce85
eval(
	quote
		result = $ex
	end
)

# ╔═╡ 99202060-1e24-481c-bf35-15f9babc3e4c
throw("syntax: incomplete: premature end of input")

# ╔═╡ 3cf579ca-c3df-473f-8047-d62124b54649
beignqsdsq dsqdsjqd

# ╔═╡ 9f84785a-c683-47fb-97ef-02ec7a5eab9e
md"""
```
invalid syntax: (#incomplete "incomplete: premature end of input")
```
"""

# ╔═╡ c70d7ab9-7542-42fb-932e-4d9d8c273ee8
JuliaSyntax.parse(Expr, """
begin
	x = 1
end
""").args

# ╔═╡ 60823f04-5e6f-4712-8924-dd51288f356b
md"""
## Luca: A template for the computational thinking template! 🎊

[https://juliapluto.github.io/computational-thinking-template/](https://juliapluto.github.io/computational-thinking-template/).

It is easier to update the template than with the base repository which was a bit complicated. All the data is separated from the script! The site will soon contain documentation.

Luca will use it in its own course about fuzzy systems [https://github.com/lucaferranti/FuzzyLogic.jl](https://github.com/lucaferranti/FuzzyLogic.jl)!

There is already work for integration with precomputed notebooks :
 - [https://precomputed-staterequests--serene-pixie-862a4a.netlify.app/data_science/pca.html](https://precomputed-staterequests--serene-pixie-862a4a.netlify.app/data_science/pca.html)

"""

# ╔═╡ d20863bc-8f2b-4ffe-a9ce-aa36b51df5a5
md"""
`export_dir` + `LiveServer.jl` will work in local already. Some changes can be made to make it work with Pluto pages and Github sites exports.

`include()` make the site generation quite slow, can they be replaced with functions:

```julia
# myfunction.jl
function myfunction(a,b,c)
	# ...
end
```
"""

# ╔═╡ 65930f89-56e7-4237-b513-bacc223976a8
md"""
Connor will work on caching of precomputed slider values!
"""

# ╔═╡ 20d334a4-75c8-44b5-941b-0089992bc6a5
md"""
dsqjds

	qsdqsk

sqdsqdlsqjdqs
- sqjdksjdskq
"""

# ╔═╡ d5f3c141-6867-42a3-aafa-211b3f158027
md"""
## Codemirror: update
The update to codemirror introduced bugs that need fixing before we can update again. [here](https://github.com/fonsp/Pluto.jl/blob/9d7e050bdbbd07958d7fe1e252968649a25bc37f/frontend/components/CellInput.js#L635).
"""

# ╔═╡ 46cca109-3010-4666-90f2-22240f576cfb
ℳ # using JuliaMono in livedocs is more consistent?

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
JuliaSyntax = "70703baa-626e-46a2-a12c-08ffd08c73b4"

[compat]
JuliaSyntax = "~0.3.5"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.9.0-rc3"
manifest_format = "2.0"
project_hash = "09e597dcd07498b7a5945b486e454a85a50693dc"

[[deps.JuliaSyntax]]
git-tree-sha1 = "e09bf943597f83cc7a1fe3ae6c01c2c008d8cde7"
uuid = "70703baa-626e-46a2-a12c-08ffd08c73b4"
version = "0.3.5"
"""

# ╔═╡ Cell order:
# ╟─030d3a51-9d93-4616-9c07-bf6434cbceb7
# ╟─f0959548-1505-11ee-0f8e-b12af03d14fd
# ╟─7a80b29b-515f-4930-ae88-738200444baa
# ╟─d9223492-aa6e-4277-8cf1-75e02c1a70ea
# ╠═24b2b220-d5c3-418a-9344-7a0d7f7da091
# ╠═47c8f036-9a63-440a-aae3-45044eefc63b
# ╠═3f1dec0b-b92e-4fe8-9a3f-3573c114bf78
# ╠═aecfd6b4-cb12-40cc-a17d-9ccb78aeba3f
# ╠═439ae293-ae89-4dbd-8e27-0cddaab0e69e
# ╠═da72256f-ed4c-43b9-919c-787eedc4110e
# ╠═ea9ce5ad-3c4f-428e-90da-28a68d56c206
# ╠═390fb430-bbb2-4967-9d59-674724a68a72
# ╠═cb3d2732-eb2a-4eb6-b973-713869927c03
# ╠═ca62d0ea-a11d-41a1-baa1-19717208fc36
# ╠═cd505531-fcb9-4631-84ab-c7ea5544ce85
# ╠═99202060-1e24-481c-bf35-15f9babc3e4c
# ╠═3cf579ca-c3df-473f-8047-d62124b54649
# ╟─9f84785a-c683-47fb-97ef-02ec7a5eab9e
# ╠═c70d7ab9-7542-42fb-932e-4d9d8c273ee8
# ╟─60823f04-5e6f-4712-8924-dd51288f356b
# ╟─d20863bc-8f2b-4ffe-a9ce-aa36b51df5a5
# ╟─65930f89-56e7-4237-b513-bacc223976a8
# ╟─20d334a4-75c8-44b5-941b-0089992bc6a5
# ╟─d5f3c141-6867-42a3-aafa-211b3f158027
# ╠═46cca109-3010-4666-90f2-22240f576cfb
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002