### A Pluto.jl notebook ###
# v0.19.19

using Markdown
using InteractiveUtils

# ╔═╡ 3539f731-cc23-42a3-b038-e68ef067ee82
using JuliaSyntax

# ╔═╡ 44bdad24-b78a-11ed-1ec6-bbe460258abb
md"""
# Notes 28 feb 2023


"""

# ╔═╡ 0fab55d6-782b-417e-a5b8-9120c4016877
md"""
Topics:
- JuliaSyntax.jl
- Featured notebooks
- Julia 1.9
- Motivations
"""

# ╔═╡ f0f440e2-7ae8-46ed-b28c-9063d4e512fd
md"""
# [JuliaSyntax.jl](https://github.com/JuliaLang/JuliaSyntax.jl)

Is in the process of being merged in Julia core 🎉

Long time ago we talked about how to use it inside of Pluto.

Turns out to be quite simple! It has a function `JuliaSyntax.parse` as alternative to `Meta.parse`.

## First prototype!

![](https://user-images.githubusercontent.com/6933510/221932729-990e67b8-31c4-4d2a-b5cc-33e29aa12492.png)

Will be easy to implement in Pluto because we only do parsing in the pluto server, not the notebook server. So we can just add JuliaSyntax as dependency to Pluto.

## Long TTFP

First parse takes 8 seconds on binder. Needs investigation :) but eventually it will be included in Julia with zero latency. Probably there is an easy fix :)

## Frontend

Implemented using [`@codemirror/lint`](https://codemirror.net/examples/lint/) which looks very powerful!
"""

# ╔═╡ dba7937e-77aa-434a-9722-b64fce78fd22
ex = try
	JuliaSyntax.parse(Expr, "1 +")
catch ex
	ex
end

# ╔═╡ 51e5cafd-7b00-4f88-b2a1-e06dfb5cb1fd


# ╔═╡ ed461518-3a1b-4fe3-b54e-9d4da9707b63
md"""
# How to get globals inside a `module`?
"""

# ╔═╡ 6204d1f2-ef72-4433-8f92-fe96938a189b
x = 12

# ╔═╡ 6288d48a-b00f-42e2-bab2-d413c45b32f0
module A
import ..x

z = x+1
end

# ╔═╡ b4b7f2bf-fd34-4be5-a936-b1baa9bc1a9a
A.z

# ╔═╡ 0aaea840-f6c6-41d1-b5e9-d5e6ed5bfb71
md"""
Maybe this will start working in Julia 1.9?
"""

# ╔═╡ 146e6a55-91db-4d5c-acd3-dbdc36a638f6
A.x = 99

# ╔═╡ cf74d2ee-1e65-4a46-bf7d-805d968f38fe
Core.eval(A, :(x = 99))

# ╔═╡ 9bacb0aa-d684-4e07-9c71-8e4b062c85c1
md"""
# Rust project?

Are there any rust projects that future Pluto devs can work on?

## Ideas:

### Code for a live collaboration server, similar to [bore.pub](https://github.com/ekzhang/bore)

Paul started work on this (in Go not Rust):

The server:
[https://gist.github.com/Pangoraw/c245762d78f5e0c636ef0bdd5f750c9e](https://gist.github.com/Pangoraw/c245762d78f5e0c636ef0bdd5f750c9e)

The client:
[https://github.com/fonsp/Pluto.jl/tree/ws_proxy](https://github.com/fonsp/Pluto.jl/tree/ws_proxy)

We also updated our GSOC list: [https://github.com/JuliaLang/www.julialang.org/pull/1848](https://github.com/JuliaLang/www.julialang.org/pull/1848)
"""

# ╔═╡ 22913c3e-b0b0-4867-9de0-243584fa2e3d
md"""
# Julia 1.9

Beta 4 seems much faster at precompilation that previous beta releases. We should redo the benchmarks to see if we still need to make changes here. :)
"""

# ╔═╡ 24281688-3e37-4e2c-aeea-97c46118bcb0
md"""

Julia: big disconnect between what package devs document and what the general audience needs to read.

Why did pandas succeed? Their documentation explains usage first, implementation/details second. Julia docs generally put math/philosophy too early.

Good project for new contributors might be to "port scikit-learn or pandas docs to their Julia equivalents". But maybe also explain some math/philosophy as side notes. Fons and Panagiotis can meet with BE :)
"""

# ╔═╡ 6a6dd6ce-c9b2-49d0-9b8b-a5227a084efa


# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
JuliaSyntax = "70703baa-626e-46a2-a12c-08ffd08c73b4"

[compat]
JuliaSyntax = "~0.3.2"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.3"
manifest_format = "2.0"
project_hash = "09e597dcd07498b7a5945b486e454a85a50693dc"

[[deps.JuliaSyntax]]
git-tree-sha1 = "db2bdeda30e452485863799be4515f6305431a46"
uuid = "70703baa-626e-46a2-a12c-08ffd08c73b4"
version = "0.3.2"
"""

# ╔═╡ Cell order:
# ╟─44bdad24-b78a-11ed-1ec6-bbe460258abb
# ╟─0fab55d6-782b-417e-a5b8-9120c4016877
# ╟─f0f440e2-7ae8-46ed-b28c-9063d4e512fd
# ╠═3539f731-cc23-42a3-b038-e68ef067ee82
# ╠═dba7937e-77aa-434a-9722-b64fce78fd22
# ╠═51e5cafd-7b00-4f88-b2a1-e06dfb5cb1fd
# ╟─ed461518-3a1b-4fe3-b54e-9d4da9707b63
# ╠═6204d1f2-ef72-4433-8f92-fe96938a189b
# ╠═6288d48a-b00f-42e2-bab2-d413c45b32f0
# ╠═b4b7f2bf-fd34-4be5-a936-b1baa9bc1a9a
# ╟─0aaea840-f6c6-41d1-b5e9-d5e6ed5bfb71
# ╠═146e6a55-91db-4d5c-acd3-dbdc36a638f6
# ╠═cf74d2ee-1e65-4a46-bf7d-805d968f38fe
# ╟─9bacb0aa-d684-4e07-9c71-8e4b062c85c1
# ╟─22913c3e-b0b0-4867-9de0-243584fa2e3d
# ╟─24281688-3e37-4e2c-aeea-97c46118bcb0
# ╠═6a6dd6ce-c9b2-49d0-9b8b-a5227a084efa
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
