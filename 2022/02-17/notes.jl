### A Pluto.jl notebook ###
# v0.18.0

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

# ╔═╡ 71d4a555-16be-43c8-9d2c-377d60fc25ee
using BenchmarkTools

# ╔═╡ fadd314f-ed4d-4930-a2bf-f02051150ff9
using JSON

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
	"website"

	"Paul: linter!!"

	"MIT template"
	"Many problems found by guilherme"
	"Guilherme: livebook resource managent widget"
	"Plotly event handling without a lot of JS but fons was mean about it because he likes JS"
	
	"disberd: PlutoPlotly.jl 👀"
]

# ╔═╡ 747c0720-0143-44e3-9f42-bcd09ace5453
@mdx """
## To discuss:
$(("- $(x)\n" for x in to_discuss))
"""

# ╔═╡ 3e5150fc-0288-4a17-9259-679aec59b3e7
md"""
# PlutoPlotly:

Reactive plot was disappearing, reappearing

Found solution:

Setting the height to `100%` makes it disappear......

Parameters:
- `responsive`: disabling it makes it work, but that flag will be removed in plotly 3
- `autosize`: 100% width height ....

- ResizeObserver trick doesn't work anymore because plotly resize is not working
- We also want them to look nice in flexbox and grid etc
- Worked inside codepen but not inside Pluto :(((
- ScriptID................ HOW DO WE USE IT AAAH

- Would be nice if you can `publish_to_js` a matrix directly.
- Can you reinterpret from matrix to vec-vec? Lazy reshape would be nice
- We could put this into msgpack? Not a bijection? But it's already not because string and symbol both turn into js string
- JSON.jl is already handling matrices, look!!
"""

# ╔═╡ d25e9044-1f20-4c5c-abaf-44b509e460a2
json(rand(2,2))

# ╔═╡ 76d758e4-aa0a-4672-be01-d1a3f26848cc
@htl """
<div style="height: 100%">asdf</div>
"""

# ╔═╡ 838133c2-b931-443a-ab44-c38f15777a83
md"""
# Linting!!

[https://github.com/fonsp/Pluto.jl/pull/1859](https://github.com/fonsp/Pluto.jl/pull/1859)

ITS SO COOL LOOK AT THE PR

Still some sync issues

This also lets us even more! Like renaming! Including locals!

Paul added local definitions into state (with character range)1

Michiel will look over it this weekend. We need to get rid of inner state to fix [https://github.com/fonsp/Pluto.jl/issues/1893](https://github.com/fonsp/Pluto.jl/issues/1893) because we need to keep the tree intact.
"""

# ╔═╡ b203ab79-8304-4fa4-9e94-6412f2645b97
md"""
# `Command + D`

Will work!! And the selecting token issue will be fixed!!


"""

# ╔═╡ 9572c74d-7e02-4e57-882f-eec762a7414a
md"""
# Frontend performance:

Lezer performance is bad because of the scoped analysis? Because the whole scan is happening every time. Could be fixed with partial scanning. Or just like lezer: only parse for a short amount of time and then pause, we could do the same for scope analysis and linting.

Scope parser is quite simple, the only hard stuff is in the template NO PATTERN matching system. So we only need to modify the pattern matching system.


Marijn 💕 sent some things to make it better

Lezer julia is already better than tree sitter julia.

# JuliaSyntax.jl

Exciting because syntax errors are much more helpful!

Idea: when you get a parse error, run it through it JuliaSyntax.jl a second time to give better errors without relying on it completely.

miette rust: really cool error reports, best possible thing in a terminal, but we could do even better because we have HTML!!



For the editor: correctness in frontend? Maybe as a second layer, not used for highlighting because it's not fast and partial.

They still have a long way too go, mostly exciting right now, not yet something we could use.

JuliaSyntax.jl: we could run this on wasm!!!! ZOMG

Paul: should be doable BeCAUSE they need to solve this themselves, because this needs to be bootstrapped to use it inside julia itself. Might also mean that the wasm blob is much smaller because it's not running on top of julia.

Advantages of JuliaSyntax:
- It's verified ™ correct ™
- (There is sooo manny weiiird stuuuuufff)


"""

# ╔═╡ a9c74daa-9461-4e53-aa83-eed1cfa1d4c3
md"""
# Realtime collab

[https://github.com/fonsp/Pluto.jl/pull/1729](https://github.com/fonsp/Pluto.jl/pull/1729)

Michiel is looking at it

Conflicts happening at the same side is currently overriden on *one side*, but not on the other, so this is causing conflict conflicts!

You and i are editing, and it's conflicting, like we both move a cell. Right now it just leaves both people hanging in a weird state. Go back to the client and say, let's try that modifier (the immer mutating function) again. If that doesn't work, roll back to the last stable state.

Right now we're not getting the "please reload" messages because most conflicts don't result in a PlutoFirebasey patch application error! So that's why right now you get "hidden conflicts". Chances are super low but with lots of people it can still happen!

Not using official codemirror collab, because that's even more difficult to implement.

## VS code extension

The PR itself is well implemented, but this is showing that our state management is not up to the challenge! 

So maybe let's merge the PR soon, disable it for most people, and wait until the state management is ready for it.
"""

# ╔═╡ 5ac50cf0-83dd-4caa-8753-2a4d7c07fd48
md"""
# WASM on the website

Hmmmm maybe it's actually a really bad demo of Pluto becaues it's so bad

Slider server on the website might be better
"""

# ╔═╡ 9c8fdb91-6f6c-4e0d-93cf-d966e9743c5f
md"""
# Relaying events from Plotlyjs to Julia

For example, this plot:
"""

# ╔═╡ c945ba3d-c9d0-4e3c-8f8f-661a3c467271
@htl("<!---->$(PlotlyBase.Plot(rand(10)))")

# ╔═╡ f48556d9-2544-461e-9625-31d5cdb66d35
md"""
Sends events in JS when you interact with it (e.g. mouse, drag, zoom, etc)

[https://plotly.com/javascript/plotlyjs-events/](https://plotly.com/javascript/plotlyjs-events/)

Idea: Add event handlers to all plotly events send them back with `@bind` and have Julia handle them.

Michiel: ideally it would not go through `@bind` because it doesn't completely match the semantics because it ignores intermediate events. So it's not for an "event stream", it's for getting the latest value.

Alternative would be the async communication channel between JS and Julia that we were working on at some point, (the WebIO branch)... And @ctrekker is working on this again! Exciting!!

For the perfect pluto plotting packages


Michiel: We could use `@bind` if it's a state object instead, containing everything like zoom level, etc. So we don't think about "events", but the "interaction state" which we share with.

Or we share the list of all events in chronological order, but that's "lame" and you would need state on the julia side to handle it.

Why do we want to contain state within javascript? Because state in julia means plutohooks and all sorts of difficult stuff. Why does it require plutohooks?

(Technically the state is contained in `@bind` (reloading the page resets the widget to the last state) which is where we like it!) Paul: Bonds.transformed_value could aggregate events, but we drop bind events while the notebook is busy.

We would first need to be convinced that we *need* these events.

Or just the ability to run Julia from JS (in the cell scope or not) and get a response.

Lazy loading table viewer would be niceeee, you could do that with this API.
"""

# ╔═╡ 6edfb8b8-c0fd-4837-af57-93f2738d6ad6
md"""
# Script ID

(Michiel Left the call)
"""

# ╔═╡ b2976772-8b28-47a9-a374-b9418b34a8a8
md"""
# `publish_to_js`

(Gerhard: Pluto plot package: `Plotu.jl`)

`APD.Display.publish_to_js` TODO by Michiel 💕

Fallback.... `((await import("data_url_of_msgpack_es6_lib")).unpack)(await (await fetch("julia-generated-data-url")).arrayBuffer())` ?????

Let's not cut corners in the fallback :))))

But requires toplevel await?

`(async () => ((await import("data_url_of_msgpack_es6_lib")).unpack)(await (await fetch("julia-generated-data-url")).arrayBuffer()))()` ?????
"""

# ╔═╡ 1c926eb6-f7ee-478d-b640-ce4df27f5dfe
begin
	struct PublishToJS
	x
	end
	function Base.show(io::IO, m::MIME"text/javascript", ptj::PublishToJS)
		@assert ADP.is_pluto(io)
		Base.show(io, m, PlutoRunner.publish_to_js(ptj.x))
	end
	better_publish_to_js(x) = PublishToJS(x)
end

# ╔═╡ 8e29d316-8727-42f1-9793-8dca3ac79acd
md"""
TODO: PlutoUI.combine should have a lazy display...
"""

# ╔═╡ 2d1b2207-b533-45ac-80a6-68e6b5bd8fd3
md"""
# New website

IDEAS!
- Less text, more links to 
- Someone handing the pluto logo to a friend! And it works! file starts to glow! laser beams scanning all the packageS!! then you see all the cool stuff
- Three circles representing three things that make a notebook:
  - Packages
  - Markdown
  - Code


- More scientific: *fair principle*, open data: [https://www.go-fair.org/fair-principles/](https://www.go-fair.org/fair-principles/) this also applies to pluto!

- 10 years of Julia: [https://julialang.org/blog/2012/02/why-we-created-julia/](https://julialang.org/blog/2012/02/why-we-created-julia/)
  - Maybe also a Pluto manifest?
    - Honest, authentic, fun to read
    - Similar sound as the Julia article: we are greedy, we want observable, we want interactive, we want compiled, etc
    - (We are even more greedy than Julia!)
    - Show that we have a vision
    - Pluto is designed to be an entrance into programming
  - Kaledoscope: different ways of looking at pluto
    - Bridge
    - This also makes the homepage difficult

- Say that it's free
- For scientists
  - VS Code support
  - Integration with other processes
  - Publishing without latex

## Education
Different lenses: student, teacher

Most important here:
- Package manager is very importnat
- Export to website
- Online simulations

- *Enable* scientific education
- Amazing first experience


Idea: a *slider* at the top to choose what you are
- Student, Educator, Scientist
- This would change which segments you see, change what to focus is
- *We are Pluto, who are you?*

We should hire Arnold Schwarzenegger and tell him that Pluto will help protect the environment!

## What else should be on our website?
Ideas:
- Alice in Wonderland going down the rabbit who and finding the pluto developers!
- Sample notebooks!!
- Testimonials with a photo

# 
"""

# ╔═╡ 5336bbbe-1f40-497b-a383-74d691a6ae9b
@htl("""<img src="https://miro.medium.com/max/762/1*c-axMIJyxtfJ9h65K6h6Lg.gif"></img> what about this""")

# ╔═╡ f5dd05e3-e94e-4c5c-af68-cd0c1348b6d2
@htl("""
<h1>Pluto advertisement (already in France)</h1>
<img height=550 src="https://user-images.githubusercontent.com/9824244/154538206-8e8fc8f8-be1f-4d75-94ba-cafc67c61bc0.jpg"/>""")

# ╔═╡ ec9b61bb-409d-48f1-98b5-1aac7dc225bf
md"""
# Chat and feedback on notebooks

Currently missing for scientific publishing

Reuse the Live Feedback box to get feedback about a notebook, not about pluto itself


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
JSON = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
MarkdownLiteral = "736d6165-7244-6769-4267-6b50796e6954"
PlotlyBase = "a03496cd-edff-5a9b-9e67-9cda94a718b5"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
BenchmarkTools = "~1.2.2"
HypertextLiteral = "~0.9.3"
JSON = "~0.21.3"
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
# ╟─f86fb8f8-857d-4e2d-8b5a-7c2c6868c424
# ╠═3ebf46ff-efee-447a-af75-36482662e6e0
# ╟─747c0720-0143-44e3-9f42-bcd09ace5453
# ╟─917d20ed-7341-4d09-be03-b66cc32aa2b8
# ╠═71d4a555-16be-43c8-9d2c-377d60fc25ee
# ╟─3e5150fc-0288-4a17-9259-679aec59b3e7
# ╠═fadd314f-ed4d-4930-a2bf-f02051150ff9
# ╠═d25e9044-1f20-4c5c-abaf-44b509e460a2
# ╠═76d758e4-aa0a-4672-be01-d1a3f26848cc
# ╟─838133c2-b931-443a-ab44-c38f15777a83
# ╟─b203ab79-8304-4fa4-9e94-6412f2645b97
# ╟─9572c74d-7e02-4e57-882f-eec762a7414a
# ╟─a9c74daa-9461-4e53-aa83-eed1cfa1d4c3
# ╟─5ac50cf0-83dd-4caa-8753-2a4d7c07fd48
# ╟─9c8fdb91-6f6c-4e0d-93cf-d966e9743c5f
# ╠═8a4ca884-c8fc-47dc-a821-ef0fc7fc3416
# ╠═c945ba3d-c9d0-4e3c-8f8f-661a3c467271
# ╟─f48556d9-2544-461e-9625-31d5cdb66d35
# ╟─6edfb8b8-c0fd-4837-af57-93f2738d6ad6
# ╟─b2976772-8b28-47a9-a374-b9418b34a8a8
# ╠═1c926eb6-f7ee-478d-b640-ce4df27f5dfe
# ╟─8e29d316-8727-42f1-9793-8dca3ac79acd
# ╟─2d1b2207-b533-45ac-80a6-68e6b5bd8fd3
# ╟─5336bbbe-1f40-497b-a383-74d691a6ae9b
# ╟─f5dd05e3-e94e-4c5c-af68-cd0c1348b6d2
# ╟─ec9b61bb-409d-48f1-98b5-1aac7dc225bf
# ╟─77ae4edd-b471-499a-8823-3fac5faebb7a
# ╠═3ce62105-7aa8-4f18-9f5f-ad7c5c1b5909
# ╠═4d0e0660-8851-408e-85f9-24365e5e1c96
# ╠═19fcf73c-7f7f-11ec-0505-23f05406b0f5
# ╠═7e1f5832-d979-451e-8f8e-cdbc2b1ac70c
# ╠═7a1f53e1-8c9c-42ca-a4eb-a34bfe39c44d
# ╠═c8b1dde6-7686-4a66-a074-657f985bd86b
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
