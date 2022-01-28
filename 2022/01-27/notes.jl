### A Pluto.jl notebook ###
# v0.17.7

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

# ╔═╡ 19fcf73c-7f7f-11ec-0505-23f05406b0f5
using MarkdownLiteral: @mdx

# ╔═╡ 7e1f5832-d979-451e-8f8e-cdbc2b1ac70c
using Dates

# ╔═╡ 779f2dc1-c9f9-4132-a6a7-03ede3e0e2ea
"""
    super_cool_function()

should write a nice documentation
"""
function super_cool_function()
	println("🐱")
end

# ╔═╡ 926d9293-4d61-42be-97c9-1d89cc51015f
@mdx "#  Hello 

<script> alert('This will alert everyone!')</script>


" # This will get some  

# ╔═╡ 07c10de1-1bc6-4f2c-aceb-220cb935de51
md"# DECEPTIVE!!!"

# ╔═╡ 0304b814-5304-47f1-b830-0bad60f10c22
omg this is soooo coooool!!!!!!!!!!!!!

# ╔═╡ b57cb9ae-45c6-4714-855e-83ac0e497976
wowwzzz


# ╔═╡ 2b463f82-feab-4c9f-ad61-cbbbba2936f9
first(x)

# ╔═╡ 842038ad-e4aa-4aae-ae2d-5735b7b69a02
x * x

# ╔═╡ 917d20ed-7341-4d09-be03-b66cc32aa2b8
to_discuss = [
	"michiel: Distributed without Distributred"
	"fons: HTTP without HTTP.jl"
	"fons: Layout should be macros?"
	"guilherme: Questions about macros inside macros in PlutoLinks"
	"x: Multilingual docs page"

	"Panagiotis: parsedMixed"
	""
]

# ╔═╡ 747c0720-0143-44e3-9f42-bcd09ace5453
@mdx """
## To discuss:
$(("- $(x)\n" for x in to_discuss))
"""

# ╔═╡ 8c6b254c-dcd7-45fd-bb2e-ae9f4acb60c1
md"""
# Collaborative editing
"""

# ╔═╡ 25f716e4-22ec-407f-a842-71973c3fc89d
md"""
Lessons learned:
- It works fairly well with 7 people at the same time!!
- Give people a link and they will try to break it 🤷
  - (this is a feature)
- Some errors but we took screenshots

"""

# ╔═╡ e8b4f07f-01d6-4df1-a627-8d5f0543f2cd
md"""
## Pluto Events can be used to always have a statefile!

### by `ctrekker`

[Pluto Events](https://github.com/fonsp/Pluto.jl/pull/1782 )

While editing the notebook it keeps updating the `.plutostate` file, so you always have an up-to-date static export :o

Maybe we can have a general pluto extensions system that people can activate by importing it from your notebook.

Would be nice if you don't need to pass in the callback function into `Pluto.run`

PlutoLivePublish writes the statefiles to a folder, you don't necessarily need Connor's second server


Maybe instead of 
```julia
Pluto.run(; extensions=[PlutoLivePublish])
```

We could do expose the existing extension thing as a configuration:

```julia
Pluto.run(; event_listeners=[
	PlutoLivePublish.create_listeners(; create_statefile=true, create_html=false)
])
```

#### Also

We also need multiple extensions? We can make a compose function for that!!



"""

# ╔═╡ c10d671b-dfac-41d6-a34b-5eb641ee2d7b
md"""
## Docs are getting slow!

### by `dorn-gerhard`

We are getting lots of feedback that the docs are getting slow, maybe it is because it's using the fancy new parsing stuff...


"""

# ╔═╡ 42d1f56b-51e8-407c-b41e-42ccac49e1e6
md"""
## Fancy new parsing!!

### by `dralletje`

He have a Julia parser and (soon) ExpressionExplorer in the frontend! Live! While you type! Was used for [clippy](https://github.com/fonsp/Pluto.jl/pull/1859) and that was easy to implement!


"""

# ╔═╡ 9e2c7e76-12c7-415d-b6d5-f750de910f49
md"""
## Dark mode

* Is it *too* dark?

* Maybe take inspiration from sites like whatsapp and firebase
"""

# ╔═╡ 4a29c7fa-9403-42ed-a852-a1367a4b79e3
md"""
# Awesome notebook!!!!

[https://pluton.lee-phillips.org/sliders/epicycles.html](https://pluton.lee-phillips.org/sliders/epicycles.html)

They have their own style! Very very cooool 

And the PlutoSliderServer! Woaa
"""

# ╔═╡ 561ef1b1-d904-4028-84cb-41a5f9340e1b
md"""
# Options

We don't have frontend options, yay! (yay?)




Spaces vs tabs

Prettier

P: People don't want choices, they want functionality.

F: Don't give an option 

G: Not having to set options, because the default settings are always best. Don't want to do extra work. (Julia does well in this, e.g. with Plots.jl (but it gives limits))
"""

# ╔═╡ f2b7c573-e63a-4220-a7a5-79b41b3e7ab4
begin
	@info "1"
	@info "2"
end

# ╔═╡ ac9d3cce-d37d-41d4-8e91-1124f81d08dc
md"""
## Plotting

* A "best practices" notebook could be really useful. [Awesome example](https://observablehq.com/@observablehq/plot-cheatsheets?collection=@observablehq/plot-cheatsheets) from Observable
* Let's mix documentation and examples for **MAXIMUM** discoverability 
"""

# ╔═╡ 7275dcdf-d34f-4f82-94ec-2465d613b305


# ╔═╡ 900f3d10-1c8a-4ee7-81e6-665fa49c15ac
3

# ╔═╡ 77ae4edd-b471-499a-8823-3fac5faebb7a
md"""
# Appendix
"""

# ╔═╡ 7a1f53e1-8c9c-42ca-a4eb-a34bfe39c44d
today = join(splitpath(pwd())[end-1:end],"-") |> Date

# ╔═╡ f86fb8f8-857d-4e2d-8b5a-7c2c6868c424
@mdx """
# 🤠 Pluto developer call, *$(today)* 🤠

heyllo
Yayyy hurray


"""

# ╔═╡ bf9e55d4-6bef-4a7f-a4ed-260864538cba
x = 123

# ╔═╡ 9315b45c-fd68-4e80-a97b-30503219390f
x = "asdfasdf"

# ╔═╡ 66e832cf-ad66-49e5-9de6-7e8394027634
x = [3,1,2,3]

# ╔═╡ d8c2f8f5-8117-474b-b15c-22154be6e004
x = 123123

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
# ╠═f86fb8f8-857d-4e2d-8b5a-7c2c6868c424
# ╠═779f2dc1-c9f9-4132-a6a7-03ede3e0e2ea
# ╠═926d9293-4d61-42be-97c9-1d89cc51015f
# ╠═07c10de1-1bc6-4f2c-aceb-220cb935de51
# ╠═0304b814-5304-47f1-b830-0bad60f10c22
# ╠═b57cb9ae-45c6-4714-855e-83ac0e497976
# ╠═bf9e55d4-6bef-4a7f-a4ed-260864538cba
# ╠═d8c2f8f5-8117-474b-b15c-22154be6e004
# ╠═66e832cf-ad66-49e5-9de6-7e8394027634
# ╠═2b463f82-feab-4c9f-ad61-cbbbba2936f9
# ╠═9315b45c-fd68-4e80-a97b-30503219390f
# ╠═842038ad-e4aa-4aae-ae2d-5735b7b69a02
# ╟─747c0720-0143-44e3-9f42-bcd09ace5453
# ╟─917d20ed-7341-4d09-be03-b66cc32aa2b8
# ╟─8c6b254c-dcd7-45fd-bb2e-ae9f4acb60c1
# ╟─25f716e4-22ec-407f-a842-71973c3fc89d
# ╟─e8b4f07f-01d6-4df1-a627-8d5f0543f2cd
# ╟─c10d671b-dfac-41d6-a34b-5eb641ee2d7b
# ╟─42d1f56b-51e8-407c-b41e-42ccac49e1e6
# ╟─9e2c7e76-12c7-415d-b6d5-f750de910f49
# ╟─4a29c7fa-9403-42ed-a852-a1367a4b79e3
# ╠═561ef1b1-d904-4028-84cb-41a5f9340e1b
# ╠═f2b7c573-e63a-4220-a7a5-79b41b3e7ab4
# ╠═ac9d3cce-d37d-41d4-8e91-1124f81d08dc
# ╠═7275dcdf-d34f-4f82-94ec-2465d613b305
# ╠═900f3d10-1c8a-4ee7-81e6-665fa49c15ac
# ╟─77ae4edd-b471-499a-8823-3fac5faebb7a
# ╠═19fcf73c-7f7f-11ec-0505-23f05406b0f5
# ╠═7e1f5832-d979-451e-8f8e-cdbc2b1ac70c
# ╠═7a1f53e1-8c9c-42ca-a4eb-a34bfe39c44d
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
