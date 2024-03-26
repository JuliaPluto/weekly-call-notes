### A Pluto.jl notebook ###
# v0.19.12

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

# ╔═╡ 4261dd51-30b2-4f9b-a3ea-b0d98ac4d241
using PlutoUI, HypertextLiteral

# ╔═╡ f420d3e7-dc2a-4ed8-b411-d0ea606aaf53
using ColorTypes

# ╔═╡ cbffd571-e019-48b4-884d-b9448cd6e4f8
using FixedPointNumbers

# ╔═╡ 740ba983-870e-4d24-9d0d-808f9584b433
md"""
# Meeting notes 18 October 2022

Topics to Discuss!

- gerhard: `br`
- fonsp: `x = 1` `x = 2`
- panagiotis & fonsp: `PlutoUI.WebcamInput`
- gerhard & panagiotis: reset button in PlutoUI
- we can split into rooms!!
- fonsp: new log layout

"""

# ╔═╡ 0e6dcaab-165c-46ed-92b1-218f62f83c4b
checkstates = Dict(true => html"""<input type="checkbox" checked disabled>""", false => html"""<input type="checkbox"  disabled>""")

# ╔═╡ 8b31a1e7-5641-4146-80b1-6238bd7abea2
md"""
# `br`: Line break without vertical space
"""

# ╔═╡ d9e638b7-7f91-4ddd-bf27-dfa725caa91a
# break line without margin
# maybe we should add this to Pluto itself?
html"""
<style>
    pluto-output br {
        margin-block-end: 0;
    }
</style>
"""
# Thanks to Alberto :)

# ╔═╡ 62698871-3da6-4225-b9bc-55b40bd75a25
PlutoUI.br

# ╔═╡ fb18fd3f-ec1e-45db-a174-e3b0796ff321
md"""
asdfasdf $br
asdfasdf \
asdfasdf

asdfasdf
"""

# ╔═╡ f791b5dc-9b73-4ea9-b1e5-6477fc641a43
md"""
# Placing a bond on a fixed position
"""

# ╔═╡ aa0916f6-22a3-4ca0-92ac-7517654456e5
my_cool_bond = @bind thingy Slider(1:100)

# ╔═╡ f96b0ffe-4342-44f5-b7c1-a019febca10d
thingy

# ╔═╡ 14ba51d3-8c0e-4dc7-a11c-54952d5ae05e
md"""
And then you do this!!

but without the `#` comments

"""

# ╔═╡ b3062fd3-631d-4862-9e9c-af3c7d7a599e
# @htl("""<div style="background: pink; 
# 	position: fixed; 
# 	bottom: 10px;
# 	right: 10px;
# 	z-index: 9999999999999;
# ">$(my_cool_bond)</div>""")

# ╔═╡ 6329fb5f-f9a8-4638-9a03-3564f2ca383d
md"""
# Multiple definitions

Finally getting close! [https://github.com/fonsp/Pluto.jl/pull/2273](https://github.com/fonsp/Pluto.jl/pull/2273)


"""

# ╔═╡ 7b5850d7-b590-4d91-bdc3-60dec6808ff1


# ╔═╡ 9d9f75ac-24db-426a-80e2-315ba2303a02
let y = [x,x,x]
	[y,[y]]
end

# ╔═╡ 49bcdc6e-e4e2-4379-873b-bf21fecff1af
md"""
Ideas:
- While typing `x = 123123231` a little animal could pop up and say "Hey! You are about to make a double definition... what do you want?"
- A button to just delete the other definition (are you sure?)
- 
"""

# ╔═╡ fda46714-b569-4974-8335-48a4c5abc5fd


# ╔═╡ 32056f3e-e86a-4a9d-87ad-c21589baf12a
f(x::Int) = 1

# ╔═╡ 769c8a9b-b80e-4c76-8ce3-eb8838fb1a2e
f(x::String) = 2

# ╔═╡ fdeca227-969c-4ecb-8ad3-6ab18570d551
a 

# ╔═╡ ba4bd724-1af4-4cc7-86e3-9adb341608bb
md"""
$(@bind xx Slider(1:4))
"""

# ╔═╡ 268af8d8-32a2-4f8e-96f0-1ee60511009c
md"""
# Reset button
"""

# ╔═╡ ee8f020c-2e7f-4663-86cf-db27eb9dffff
reset(bond, with=0) = @htl("""
<bond def="$(string(bond.defines))" unique_id="$(string(bond.unique_id))">
	<div>
		<input
			type="reset"
			onclick="this.parentNode.value = $(with); this.parentNode.dispatchEvent(new CustomEvent('input'))"
		>
	</div>
</bond>
""")

# ╔═╡ 3014e1bb-fc5d-4a49-aa7b-3611a36fd79d
s = @bind slide Slider(10:10000)

# ╔═╡ e22bf6ad-f6a2-4937-b91c-2be3b2e35b57
slide

# ╔═╡ 9cd219ef-faf6-470f-8f0f-856ab90ea986
counterbutton = @bind counter CounterButton()

# ╔═╡ 8f5e6df6-5831-4d56-a160-f674f2c7253f
counterbutton

# ╔═╡ eb225158-c8fd-4dba-a386-b51e3c68f2c6
reset(counterbutton)

# ╔═╡ 55945946-a39f-48c8-a447-22c38fe4bd69
counter

# ╔═╡ b7fbf920-71ad-4ee0-acfe-709dde491d83
TableOfContents()

# ╔═╡ 9313c6c2-3026-4150-b02d-25422c4e0482
# myslider = @bind hello Slider(7:12; show_value=true )

# ╔═╡ 3a92be70-86f0-427c-afa0-ddc6802e5b70
hello

# ╔═╡ 3e39cd3c-26b3-4e92-888d-88f158f94887
reset(myslider)

# ╔═╡ 7374e4a1-da12-4694-800a-b45bfaeda295
import AbstractPlutoDingetjes

# ╔═╡ 67c9b115-8411-4dd3-8c73-f59789127aa3
function reset_all(bond) 
	initial_value = AbstractPlutoDingetjes.Bonds.initial_value(bond)
	with = AbstractPlutoDingetjes.Bonds.transform_value(bond.element, initial_value)

	@htl("""
<bond def="$(string(bond.defines))" unique_id="$(string(bond.unique_id))">
	<div>
		<input
			type="reset"
			onclick="this.parentNode.value = $(with); this.parentNode.dispatchEvent(new CustomEvent('input'))"
		>
	</div>
</bond>
""")
end

# ╔═╡ d4a823b3-624f-4a71-bba9-91b6e89b5c26
reset_all(s)

# ╔═╡ 39d8c857-0729-4377-8473-9457e95755b3
counterbutton.element |> typeof

# ╔═╡ 99370104-c5a7-49fc-b269-38adb3b55397
AbstractPlutoDingetjes.Bonds.initial_value(Slider(10:14))

# ╔═╡ b6a7af9e-ef34-4c91-9d72-1e2f9cd422f3
coolbond = @bind zzz PlutoUI.confirm(Slider(10:100))

# ╔═╡ b4a63029-b17d-4858-9482-479c65cac7b5
coolbond

# ╔═╡ 098e6aa3-39df-425e-a55d-7b328f1b9d50
zzz

# ╔═╡ 6e0de7d2-1680-40e7-acbd-1a592e472640
# you could have similar API and UI as confirm, but with a reset button
# like this
@bind zzz2 PlutoUI.reset(Slider(10:100))

# ╔═╡ c2c49d0a-81c9-4ffd-9d6e-d01b46f43197
# buttttttt it would be nice if the reset button can be in another place, 
# not just next to the element that it reset

# ╔═╡ f31169fe-551a-4abe-ac29-c6e3b31aefb9
md"""
We can get the word "Reset" in your native language, just like `confirm`:
"""

# ╔═╡ fb613cf3-894f-4acf-9c42-768183576464
html"<input type=reset>"

# ╔═╡ 38d8829c-a961-4b02-9f90-a5ee02e9b8d4
md"""
# `PlutoUI.WebcamInput`

Very cool new PlutoUI component! Try it out today!!
"""

# ╔═╡ 885461d8-cc9d-4a90-82f7-061b9f636ec2
@bind myimage WebcamInput(max_size=100)

# ╔═╡ b39dc337-8c30-432b-85ae-42e48310bd30
# ╠═╡ disabled = true
#=╠═╡
[
	myimage myimage[:,end:-1:begin]
]
  ╠═╡ =#

# ╔═╡ d3073f60-403d-4b5e-989a-c2a04cf501bf
import ImageShow, ImageIO

# ╔═╡ 45a74268-1425-4ae3-9515-5fec7078cf6c
# ╠═╡ disabled = true
#=╠═╡
myimage
  ╠═╡ =#

# ╔═╡ 8a4a8f87-495d-43ec-81fa-cd91f3f62711
size(myimage)

# ╔═╡ 885a4344-d307-4f47-bf63-c05577a142ab
ones

# ╔═╡ 19ef7b3a-aa06-46ad-ae26-779eecb3602a


# ╔═╡ 775f88be-769e-4580-ad05-c9a636b17643
⊗ = kron

# ╔═╡ ab380892-b142-42bc-93a3-d2df86d08378
ones(4,4) ⊗ myimage

# ╔═╡ d7347da1-3f5e-4a14-933c-111266ae9528
# ╠═╡ disabled = true
#=╠═╡
myimage ⊗ rand(10,10)
  ╠═╡ =#

# ╔═╡ 5a218bdd-e0c4-4d03-adb4-d8aab1a74aed
md"""
Fons: _Docendo discimus_
"""

# ╔═╡ c97750d8-19a0-4143-a613-6ecd43d1ae77
rand(RGBA{N0f8}, 10,10)

# ╔═╡ ef0a96f8-4f68-445b-a33d-0abe13061eba
mydata = rand(40,40)

# ╔═╡ 9173bf2b-bc29-4cc6-94f8-14a1505d095f


# ╔═╡ afe6a32c-1812-4bf1-83e3-11bc9bb37331
map(mydata) do x
	RGB(3/2x, 0.5x, 1-x)
end

# ╔═╡ c9d23e46-a28c-4deb-b907-08edcaad6090
md"""
Cool link for Gerhard: [handwriting input component](https://cotangent.dev/how-to-make-custom-pluto-ui-components/)

![svd handwriting](https://user-images.githubusercontent.com/6933510/196495754-c3f867b3-350f-4599-8978-b047c8842ad6.gif)

This should be part of PlutoUI

Idea from Gerhard!!! We should make it even more advanced, like a little MS Paint program, where you can draw the segments of an image and then it fills it in with AI.


"""

# ╔═╡ 7a50664b-80eb-45e1-967f-87703a32f7b8
md"""
# Julia WASM

Woooooo
"""

# ╔═╡ aec53732-05e8-4dfe-a31b-4cd1afd63ff1
md"""
[https://www.youtube.com/watch?v=DUumYxjK1Xs](https://www.youtube.com/watch?v=DUumYxjK1Xs)
"""

# ╔═╡ 58ca2266-5b29-41dc-a247-0305afc6edf1
md"""
# New log layout
"""

# ╔═╡ e6cf3796-2519-4e84-b503-d3fb8deb995f
# ╠═╡ disabled = true
#=╠═╡
x = [1]
  ╠═╡ =#

# ╔═╡ 608db0bb-0c00-41f2-ac5e-163d5e9be8e2
x = 7

# ╔═╡ ecaf891a-f6cb-4c4d-9a39-ec0d4b040e69
# ╠═╡ disabled = true
#=╠═╡
x = 1923123
  ╠═╡ =#

# ╔═╡ 2c3db8a5-5c75-40dc-a10b-2a159a952a80
# ╠═╡ disabled = true
#=╠═╡
x = 123123123
  ╠═╡ =#

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
AbstractPlutoDingetjes = "6e696c72-6542-2067-7265-42206c756150"
ColorTypes = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
FixedPointNumbers = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
HypertextLiteral = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
ImageIO = "82e4d734-157c-48bb-816b-45c225c6df19"
ImageShow = "4e3cecfd-b093-5904-9786-8bbb286a6a31"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
AbstractPlutoDingetjes = "~1.1.4"
ColorTypes = "~0.11.4"
FixedPointNumbers = "~0.8.4"
HypertextLiteral = "~0.9.4"
ImageIO = "~0.6.6"
ImageShow = "~0.3.6"
PlutoUI = "~0.7.45"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.0"
manifest_format = "2.0"
project_hash = "b6d9f4a4b1380f557affb4b781b9a303ed818d37"

[[deps.AbstractFFTs]]
deps = ["ChainRulesCore", "LinearAlgebra"]
git-tree-sha1 = "69f7020bd72f069c219b5e8c236c1fa90d2cb409"
uuid = "621f4979-c628-5d54-868e-fcf4e3e8185c"
version = "1.2.1"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "8eaf9f1b4921132a4cff3f36a1d9ba923b14a481"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.1.4"

[[deps.Adapt]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "195c5505521008abea5aee4f96930717958eac6f"
uuid = "79e6a3ab-5dfb-504d-930d-738a2a938a0e"
version = "3.4.0"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.1"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.CEnum]]
git-tree-sha1 = "eb4cb44a499229b3b8426dcfb5dd85333951ff90"
uuid = "fa961155-64e5-5f13-b03f-caf6b980ea82"
version = "0.4.2"

[[deps.ChainRulesCore]]
deps = ["Compat", "LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "e7ff6cadf743c098e08fca25c91103ee4303c9bb"
uuid = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
version = "1.15.6"

[[deps.ChangesOfVariables]]
deps = ["ChainRulesCore", "LinearAlgebra", "Test"]
git-tree-sha1 = "38f7a08f19d8810338d4f5085211c7dfa5d5bdd8"
uuid = "9e997f8a-9a97-42d5-a9f1-ce6bfc15e2c0"
version = "0.1.4"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "eb7f0f8307f71fac7c606984ea5fb2817275d6e4"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.4"

[[deps.ColorVectorSpace]]
deps = ["ColorTypes", "FixedPointNumbers", "LinearAlgebra", "SpecialFunctions", "Statistics", "TensorCore"]
git-tree-sha1 = "d08c20eef1f2cbc6e60fd3612ac4340b89fea322"
uuid = "c3611d14-8923-5661-9e6a-0046d554d3a4"
version = "0.9.9"

[[deps.Colors]]
deps = ["ColorTypes", "FixedPointNumbers", "Reexport"]
git-tree-sha1 = "417b0ed7b8b838aa6ca0a87aadf1bb9eb111ce40"
uuid = "5ae59095-9a9b-59fe-a467-6f913c188581"
version = "0.12.8"

[[deps.Compat]]
deps = ["Dates", "LinearAlgebra", "UUIDs"]
git-tree-sha1 = "3ca828fe1b75fa84b021a7860bd039eaea84d2f2"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "4.3.0"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "0.5.2+0"

[[deps.DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "d1fff3a548102f48987a52a2e0d114fa97d730f0"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.13"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[deps.DocStringExtensions]]
deps = ["LibGit2"]
git-tree-sha1 = "5158c2b41018c5f7eb1470d558127ac274eca0c9"
uuid = "ffbed154-4ef7-542d-bbb7-c09d3a79fcae"
version = "0.9.1"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.FileIO]]
deps = ["Pkg", "Requires", "UUIDs"]
git-tree-sha1 = "7be5f99f7d15578798f338f5433b6c432ea8037b"
uuid = "5789e2e9-d7fb-5bc7-8068-2c6fae9b9549"
version = "1.16.0"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[deps.Graphics]]
deps = ["Colors", "LinearAlgebra", "NaNMath"]
git-tree-sha1 = "d61890399bc535850c4bf08e4e0d3a7ad0f21cbd"
uuid = "a2bd30eb-e257-5431-a919-1863eab51364"
version = "1.1.2"

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

[[deps.ImageBase]]
deps = ["ImageCore", "Reexport"]
git-tree-sha1 = "b51bb8cae22c66d0f6357e3bcb6363145ef20835"
uuid = "c817782e-172a-44cc-b673-b171935fbb9e"
version = "0.1.5"

[[deps.ImageCore]]
deps = ["AbstractFFTs", "ColorVectorSpace", "Colors", "FixedPointNumbers", "Graphics", "MappedArrays", "MosaicViews", "OffsetArrays", "PaddedViews", "Reexport"]
git-tree-sha1 = "acf614720ef026d38400b3817614c45882d75500"
uuid = "a09fc81d-aa75-5fe9-8630-4744c3626534"
version = "0.9.4"

[[deps.ImageIO]]
deps = ["FileIO", "IndirectArrays", "JpegTurbo", "LazyModules", "Netpbm", "OpenEXR", "PNGFiles", "QOI", "Sixel", "TiffImages", "UUIDs"]
git-tree-sha1 = "342f789fd041a55166764c351da1710db97ce0e0"
uuid = "82e4d734-157c-48bb-816b-45c225c6df19"
version = "0.6.6"

[[deps.ImageShow]]
deps = ["Base64", "FileIO", "ImageBase", "ImageCore", "OffsetArrays", "StackViews"]
git-tree-sha1 = "b563cf9ae75a635592fc73d3eb78b86220e55bd8"
uuid = "4e3cecfd-b093-5904-9786-8bbb286a6a31"
version = "0.3.6"

[[deps.Imath_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "87f7662e03a649cffa2e05bf19c303e168732d3e"
uuid = "905a6f67-0a94-5f89-b386-d35d92009cd1"
version = "3.1.2+0"

[[deps.IndirectArrays]]
git-tree-sha1 = "012e604e1c7458645cb8b436f8fba789a51b257f"
uuid = "9b13fd28-a010-5f03-acff-a1bbcff69959"
version = "1.0.0"

[[deps.Inflate]]
git-tree-sha1 = "5cd07aab533df5170988219191dfad0519391428"
uuid = "d25df0c9-e2be-5dd7-82c8-3ad0b3e990b9"
version = "0.1.3"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.InverseFunctions]]
deps = ["Test"]
git-tree-sha1 = "49510dfcb407e572524ba94aeae2fced1f3feb0f"
uuid = "3587e190-3f89-42d0-90ee-14403ec27112"
version = "0.1.8"

[[deps.IrrationalConstants]]
git-tree-sha1 = "7fd44fd4ff43fc60815f8e764c0f352b83c49151"
uuid = "92d709cd-6900-40b7-9082-c6be49f344b6"
version = "0.1.1"

[[deps.JLLWrappers]]
deps = ["Preferences"]
git-tree-sha1 = "abc9885a7ca2052a736a600f7fa66209f96506e1"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.4.1"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "3c837543ddb02250ef42f4738347454f95079d4e"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.3"

[[deps.JpegTurbo]]
deps = ["CEnum", "FileIO", "ImageCore", "JpegTurbo_jll", "TOML"]
git-tree-sha1 = "a77b273f1ddec645d1b7c4fd5fb98c8f90ad10a5"
uuid = "b835a17e-a41a-41e7-81f0-2f016b05efe0"
version = "0.1.1"

[[deps.JpegTurbo_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b53380851c6e6664204efb2e62cd24fa5c47e4ba"
uuid = "aacddb02-875f-59d6-b918-886e6ef4fbf8"
version = "2.1.2+0"

[[deps.LazyModules]]
git-tree-sha1 = "a560dd966b386ac9ae60bdd3a3d3a326062d3c3e"
uuid = "8cdb02fc-e678-4876-92c5-9defec4f444e"
version = "0.3.1"

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

[[deps.LogExpFunctions]]
deps = ["ChainRulesCore", "ChangesOfVariables", "DocStringExtensions", "InverseFunctions", "IrrationalConstants", "LinearAlgebra"]
git-tree-sha1 = "94d9c52ca447e23eac0c0f074effbcd38830deb5"
uuid = "2ab3a3ac-af41-5b50-aa03-7779005ae688"
version = "0.3.18"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.MappedArrays]]
git-tree-sha1 = "e8b359ef06ec72e8c030463fe02efe5527ee5142"
uuid = "dbb5928d-eab1-5f90-85c2-b9b0edb7c900"
version = "0.4.1"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.0+0"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MosaicViews]]
deps = ["MappedArrays", "OffsetArrays", "PaddedViews", "StackViews"]
git-tree-sha1 = "b34e3bc3ca7c94914418637cb10cc4d1d80d877d"
uuid = "e94cdb99-869f-56ef-bcf0-1ae2bcbe0389"
version = "0.3.3"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2022.2.1"

[[deps.NaNMath]]
deps = ["OpenLibm_jll"]
git-tree-sha1 = "a7c3d1da1189a1c2fe843a3bfa04d18d20eb3211"
uuid = "77ba4419-2d1f-58cd-9bb1-8ffee604a2e3"
version = "1.0.1"

[[deps.Netpbm]]
deps = ["FileIO", "ImageCore"]
git-tree-sha1 = "18efc06f6ec36a8b801b23f076e3c6ac7c3bf153"
uuid = "f09324ee-3d7c-5217-9330-fc30815ba969"
version = "1.0.2"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.OffsetArrays]]
deps = ["Adapt"]
git-tree-sha1 = "f71d8950b724e9ff6110fc948dff5a329f901d64"
uuid = "6fe1bfb0-de20-5000-8ca7-80f57d26f881"
version = "1.12.8"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.20+0"

[[deps.OpenEXR]]
deps = ["Colors", "FileIO", "OpenEXR_jll"]
git-tree-sha1 = "327f53360fdb54df7ecd01e96ef1983536d1e633"
uuid = "52e1d378-f018-4a11-a4be-720524705ac7"
version = "0.3.2"

[[deps.OpenEXR_jll]]
deps = ["Artifacts", "Imath_jll", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "923319661e9a22712f24596ce81c54fc0366f304"
uuid = "18a262bb-aa17-5467-a713-aee519bc75cb"
version = "3.1.1+0"

[[deps.OpenLibm_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "05823500-19ac-5b8b-9628-191a04bc5112"
version = "0.8.1+0"

[[deps.OpenSpecFun_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "13652491f6856acfd2db29360e1bbcd4565d04f1"
uuid = "efe28fd5-8261-553b-a9e1-b2916fc3738e"
version = "0.5.5+0"

[[deps.OrderedCollections]]
git-tree-sha1 = "85f8e6578bf1f9ee0d11e7bb1b1456435479d47c"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.4.1"

[[deps.PNGFiles]]
deps = ["Base64", "CEnum", "ImageCore", "IndirectArrays", "OffsetArrays", "libpng_jll"]
git-tree-sha1 = "f809158b27eba0c18c269cf2a2be6ed751d3e81d"
uuid = "f57f5aa1-a3ce-4bc8-8ab9-96f992907883"
version = "0.3.17"

[[deps.PaddedViews]]
deps = ["OffsetArrays"]
git-tree-sha1 = "03a7a85b76381a3d04c7a1656039197e70eda03d"
uuid = "5432bcbf-9aad-5242-b902-cca2824c8663"
version = "0.5.11"

[[deps.Parsers]]
deps = ["Dates"]
git-tree-sha1 = "6c01a9b494f6d2a9fc180a08b182fcb06f0958a0"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.4.2"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.8.0"

[[deps.PkgVersion]]
deps = ["Pkg"]
git-tree-sha1 = "f6cf8e7944e50901594838951729a1861e668cb8"
uuid = "eebad327-c553-4316-9ea0-9fa01ccd7688"
version = "0.3.2"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "UUIDs"]
git-tree-sha1 = "ca1700c40f0c8c245040c307a285afb9124a0919"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.45"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "47e5f437cc0e7ef2ce8406ce1e7e24d44915f88d"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.3.0"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.ProgressMeter]]
deps = ["Distributed", "Printf"]
git-tree-sha1 = "d7a7aef8f8f2d537104f170139553b14dfe39fe9"
uuid = "92933f4c-e287-5a05-a399-4b506db050ca"
version = "1.7.2"

[[deps.QOI]]
deps = ["ColorTypes", "FileIO", "FixedPointNumbers"]
git-tree-sha1 = "18e8f4d1426e965c7b532ddd260599e1510d26ce"
uuid = "4b34888f-f399-49d4-9bb3-47ed5cae4e65"
version = "1.0.0"

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
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.Sixel]]
deps = ["Dates", "FileIO", "ImageCore", "IndirectArrays", "OffsetArrays", "REPL", "libsixel_jll"]
git-tree-sha1 = "8fb59825be681d451c246a795117f317ecbcaa28"
uuid = "45858cf5-a6b0-47a3-bbea-62219f50df47"
version = "0.1.2"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.SpecialFunctions]]
deps = ["ChainRulesCore", "IrrationalConstants", "LogExpFunctions", "OpenLibm_jll", "OpenSpecFun_jll"]
git-tree-sha1 = "d75bda01f8c31ebb72df80a46c88b25d1c79c56d"
uuid = "276daf66-3868-5448-9aa4-cd146d93841b"
version = "2.1.7"

[[deps.StackViews]]
deps = ["OffsetArrays"]
git-tree-sha1 = "46e589465204cd0c08b4bd97385e4fa79a0c770c"
uuid = "cae243ae-269e-4f55-b966-ac2d0dc13c15"
version = "0.1.1"

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

[[deps.TensorCore]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "1feb45f88d133a655e001435632f019a9a1bcdb6"
uuid = "62fd8b95-f654-4bbd-a8a5-9c27f68ccd50"
version = "0.1.1"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.TiffImages]]
deps = ["ColorTypes", "DataStructures", "DocStringExtensions", "FileIO", "FixedPointNumbers", "IndirectArrays", "Inflate", "Mmap", "OffsetArrays", "PkgVersion", "ProgressMeter", "UUIDs"]
git-tree-sha1 = "70e6d2da9210371c927176cb7a56d41ef1260db7"
uuid = "731e570b-9d59-4bfa-96dc-6df516fadf69"
version = "0.6.1"

[[deps.Tricks]]
git-tree-sha1 = "6bac775f2d42a611cdfcd1fb217ee719630c4175"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.6"

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

[[deps.libpng_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "94d180a6d2b5e55e447e2d27a29ed04fe79eb30c"
uuid = "b53b4c65-9356-5827-b1ea-8c7a1a84506f"
version = "1.6.38+0"

[[deps.libsixel_jll]]
deps = ["Artifacts", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Pkg", "libpng_jll"]
git-tree-sha1 = "d4f63314c8aa1e48cd22aa0c17ed76cd1ae48c3c"
uuid = "075b6546-f08a-558a-be8f-8157d0f608a5"
version = "1.10.3+0"

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
# ╠═4261dd51-30b2-4f9b-a3ea-b0d98ac4d241
# ╠═740ba983-870e-4d24-9d0d-808f9584b433
# ╠═0e6dcaab-165c-46ed-92b1-218f62f83c4b
# ╠═8b31a1e7-5641-4146-80b1-6238bd7abea2
# ╠═d9e638b7-7f91-4ddd-bf27-dfa725caa91a
# ╠═62698871-3da6-4225-b9bc-55b40bd75a25
# ╠═fb18fd3f-ec1e-45db-a174-e3b0796ff321
# ╠═f791b5dc-9b73-4ea9-b1e5-6477fc641a43
# ╠═aa0916f6-22a3-4ca0-92ac-7517654456e5
# ╠═f96b0ffe-4342-44f5-b7c1-a019febca10d
# ╠═14ba51d3-8c0e-4dc7-a11c-54952d5ae05e
# ╠═b3062fd3-631d-4862-9e9c-af3c7d7a599e
# ╠═6329fb5f-f9a8-4638-9a03-3564f2ca383d
# ╟─7b5850d7-b590-4d91-bdc3-60dec6808ff1
# ╠═9d9f75ac-24db-426a-80e2-315ba2303a02
# ╠═e6cf3796-2519-4e84-b503-d3fb8deb995f
# ╠═ecaf891a-f6cb-4c4d-9a39-ec0d4b040e69
# ╠═2c3db8a5-5c75-40dc-a10b-2a159a952a80
# ╠═608db0bb-0c00-41f2-ac5e-163d5e9be8e2
# ╠═49bcdc6e-e4e2-4379-873b-bf21fecff1af
# ╟─fda46714-b569-4974-8335-48a4c5abc5fd
# ╠═32056f3e-e86a-4a9d-87ad-c21589baf12a
# ╠═769c8a9b-b80e-4c76-8ce3-eb8838fb1a2e
# ╠═fdeca227-969c-4ecb-8ad3-6ab18570d551
# ╠═ba4bd724-1af4-4cc7-86e3-9adb341608bb
# ╠═268af8d8-32a2-4f8e-96f0-1ee60511009c
# ╠═ee8f020c-2e7f-4663-86cf-db27eb9dffff
# ╠═e22bf6ad-f6a2-4937-b91c-2be3b2e35b57
# ╠═3014e1bb-fc5d-4a49-aa7b-3611a36fd79d
# ╠═d4a823b3-624f-4a71-bba9-91b6e89b5c26
# ╠═67c9b115-8411-4dd3-8c73-f59789127aa3
# ╠═8f5e6df6-5831-4d56-a160-f674f2c7253f
# ╠═eb225158-c8fd-4dba-a386-b51e3c68f2c6
# ╠═55945946-a39f-48c8-a447-22c38fe4bd69
# ╠═9cd219ef-faf6-470f-8f0f-856ab90ea986
# ╠═b7fbf920-71ad-4ee0-acfe-709dde491d83
# ╠═9313c6c2-3026-4150-b02d-25422c4e0482
# ╠═3a92be70-86f0-427c-afa0-ddc6802e5b70
# ╠═3e39cd3c-26b3-4e92-888d-88f158f94887
# ╠═7374e4a1-da12-4694-800a-b45bfaeda295
# ╠═39d8c857-0729-4377-8473-9457e95755b3
# ╠═99370104-c5a7-49fc-b269-38adb3b55397
# ╠═b6a7af9e-ef34-4c91-9d72-1e2f9cd422f3
# ╠═b4a63029-b17d-4858-9482-479c65cac7b5
# ╠═098e6aa3-39df-425e-a55d-7b328f1b9d50
# ╠═6e0de7d2-1680-40e7-acbd-1a592e472640
# ╠═c2c49d0a-81c9-4ffd-9d6e-d01b46f43197
# ╠═f31169fe-551a-4abe-ac29-c6e3b31aefb9
# ╠═fb613cf3-894f-4acf-9c42-768183576464
# ╟─38d8829c-a961-4b02-9f90-a5ee02e9b8d4
# ╠═b39dc337-8c30-432b-85ae-42e48310bd30
# ╠═ab380892-b142-42bc-93a3-d2df86d08378
# ╠═885461d8-cc9d-4a90-82f7-061b9f636ec2
# ╠═d3073f60-403d-4b5e-989a-c2a04cf501bf
# ╠═45a74268-1425-4ae3-9515-5fec7078cf6c
# ╠═8a4a8f87-495d-43ec-81fa-cd91f3f62711
# ╠═885a4344-d307-4f47-bf63-c05577a142ab
# ╠═19ef7b3a-aa06-46ad-ae26-779eecb3602a
# ╠═775f88be-769e-4580-ad05-c9a636b17643
# ╠═d7347da1-3f5e-4a14-933c-111266ae9528
# ╠═5a218bdd-e0c4-4d03-adb4-d8aab1a74aed
# ╠═f420d3e7-dc2a-4ed8-b411-d0ea606aaf53
# ╠═cbffd571-e019-48b4-884d-b9448cd6e4f8
# ╠═c97750d8-19a0-4143-a613-6ecd43d1ae77
# ╠═ef0a96f8-4f68-445b-a33d-0abe13061eba
# ╠═9173bf2b-bc29-4cc6-94f8-14a1505d095f
# ╠═afe6a32c-1812-4bf1-83e3-11bc9bb37331
# ╟─c9d23e46-a28c-4deb-b907-08edcaad6090
# ╟─7a50664b-80eb-45e1-967f-87703a32f7b8
# ╠═aec53732-05e8-4dfe-a31b-4cd1afd63ff1
# ╟─58ca2266-5b29-41dc-a247-0305afc6edf1
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
