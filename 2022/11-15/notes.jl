### A Pluto.jl notebook ###
# v0.19.14

using Markdown
using InteractiveUtils

# ╔═╡ 6c0f6a2e-6508-11ed-0945-67d02e3c4b17
md"""
# Meeting notes 15 nov 2022
"""

# ╔═╡ adde1d0e-9495-4b64-a2b6-cc5665756f37
md"""
## Topics today
- Featured notebooks: JuliaHub/Training.jl
- codemirror-pluto-setup: yarn npm
- Featured notebooks: other authors
- Triple newline for new cell
- Malt.jl
- Windows app
- PlutoHooks.jl: watch dir task
- Function argument autocomplete
"""

# ╔═╡ ba30d1bd-bcce-4f3f-bc0e-9a3e1a45a48d
md"""
# Featured notebooks: JuliaHub/Training.jl

Josh Day from JuliaHub is working on a public repository with training material, he wants to use the Pluto featured system to run it. Would be 

Ideas:
- We want these featured notebooks too! (They are mostly from me, David, and Alan) https://github.com/JuliaComputing/Training.jl could be one of our *sources* in the `featured_sources.json` file.
- Training.jl should have a custom `run()` function that launches Pluto with only the training notebooks as featured notebooks

"""

# ╔═╡ dc676d1d-1030-48e3-8d0f-b5cb292b99bb
md"""
# JuliaCon 2023

In person at MIT! Deadline for proposals is already December 18th.

We will submit a proposal for an online talk.
"""

# ╔═╡ 814fd6ae-c7e4-4913-a8de-84a45e797856
md"""
# Featured notebooks: other authors

Panagiotis and fonsi will get back in touch with some awesome featured notebook authors!
"""

# ╔═╡ 66ee4cb4-b070-4ebb-b6be-3cbcc5bff667
md"""
# [Malt.jl](https://github.com/JuliaPluto/Malt.jl)

Let's get it finished! Yayyy

We can release it behind a flag, and leave it off by default for a couple of months to get more usage data. Maybe automatic AB testing? hehe
"""

# ╔═╡ ef3ef834-983d-4b67-b0ab-84d37374bbc1
md"""
# PlutoDesktop

Let's get it finished! 


"""

# ╔═╡ 76c53513-b7bd-4abf-b458-5aae59114ebf
md"""
# Notion/GitHub board for our own TODOs?

Yes! We created one:

!!! link
    [https://github.com/orgs/JuliaPluto/projects/1/views/1](https://github.com/orgs/JuliaPluto/projects/1/views/1)

We made it visible only to members of the JuliaPluto org, to avoid stress from the internet :)


"""

# ╔═╡ c62507ae-6171-483c-93d2-94af9119e438
md"""
# New CM features

OOP has super nice autocomplete because methods are properties of objects. But we dont have that in Julia!! Oh nooo

Idea: what if you act like will call something, and we know it's not a function, we auto

```julia
# In JS, I would do:
x.<TAB>

# to get things I can do with x


# IDEA: I Pluto, I would type:
x(<TAB>

# and it would autocomplete to:
first(x)

# I could also do more arguments:
x(y,<TAB>
# and I get
push!(x, y)


# IDEA 2: just do the Python thing, show properties first, then methods that work with it
x.<TAB>



# IDEA 3:
x |> <TAB>

# would give
x |> first

# Chain.jl has a cool macro with this



# What we already have:
first(<TAB>)
# and you get the list of all methods

# In the RUST LSP you have

# IDEA from tim Holy in a Julia PR:
# (this is merged in Julia main)
# https://github.com/JuliaLang/julia/pull/38791
?(x, y<TAB>
# gives
push!(x, y)

# Since this is already in Julia main, we could contribute this to FuzzyCompletions.jl


```


Problem: there isn't a natural way to do this like in OOP, so what is the next best thing?

Also important: communicate to users that this is an option. We could still add more things. If this is going to be a feature of Julia Base then maybe we shouldn't do something different.

(Why does this not work already?)

Maybe having them in autocomplete is overwhelming, and its actually better to show them in the Live Docs panel.

"""

# ╔═╡ ac54c783-8eb7-4c67-aabe-2c3e98b4a3bc
x = [1,2,3]

# ╔═╡ 6b2923f4-d5bb-4e9b-b790-ed55b96c8ff3
x

# ╔═╡ afe16f48-013b-4d64-b472-31446e05433f
y = 123

# ╔═╡ 3bbed4bf-b55c-416c-85b9-04d958f57d3b
first(x)

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.2"
manifest_format = "2.0"
project_hash = "da39a3ee5e6b4b0d3255bfef95601890afd80709"

[deps]
"""

# ╔═╡ Cell order:
# ╟─6c0f6a2e-6508-11ed-0945-67d02e3c4b17
# ╟─adde1d0e-9495-4b64-a2b6-cc5665756f37
# ╟─ba30d1bd-bcce-4f3f-bc0e-9a3e1a45a48d
# ╟─dc676d1d-1030-48e3-8d0f-b5cb292b99bb
# ╟─814fd6ae-c7e4-4913-a8de-84a45e797856
# ╟─66ee4cb4-b070-4ebb-b6be-3cbcc5bff667
# ╟─ef3ef834-983d-4b67-b0ab-84d37374bbc1
# ╟─76c53513-b7bd-4abf-b458-5aae59114ebf
# ╟─c62507ae-6171-483c-93d2-94af9119e438
# ╠═6b2923f4-d5bb-4e9b-b790-ed55b96c8ff3
# ╠═ac54c783-8eb7-4c67-aabe-2c3e98b4a3bc
# ╠═afe16f48-013b-4d64-b472-31446e05433f
# ╠═3bbed4bf-b55c-416c-85b9-04d958f57d3b
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
