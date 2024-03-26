### A Pluto.jl notebook ###
# v0.19.19

#> [frontmatter]
#> "how much ram u need" = "1000000"

using Markdown
using InteractiveUtils

# ╔═╡ 0069c988-bd0b-11ed-0e2e-c3ae889f795c
md"""
# Weekly meeting 7 March 2023
"""

# ╔═╡ c8f36cd5-74b4-488b-bc2f-d6b9db3052eb
md"""
## Topics

- Malt.jl integration progress
- Malt.jl unix domain sockets instead of TCP (or other options)
- Issue about Docker images in pluto-on-binder
- Pluto requirements from one specific user
- Line numbers showing when screen sharing

"""

# ╔═╡ 04078952-8847-466d-bb85-0bda7a05edef
md"""
# Pluto requirements from one specific user

## Specify min system requirements

These could be stored in frontmatter!

## Quarto

We should look into it! Looks exciting.

## Sysimages

It might be cool to have something like the package server but for sysimages, indexed by the hash of the manifest.
"""

# ╔═╡ 6185bcd8-b4e6-4f6d-9a3e-d2ba935ce91f
md"""
## Create new cells automatically

If I type a complete expression, like `x = 1`, and press enter (and my cursor is at the last position), then create a new cell without running the last one. This will make people less unhappy about `begin end` :)
"""

# ╔═╡ 35598841-dc47-4ce5-a59a-1aba366183aa
md"""
## Makie

CairoMakie works well. WebGLMakie would be fantastic!! But it needs fons to finish [https://github.com/fonsp/Pluto.jl/pull/2392](https://github.com/fonsp/Pluto.jl/pull/2392). Makie animations are tricky, Makie API is difficult.

"""

# ╔═╡ 38f027d7-002a-4330-8e8f-58c6905b0314
md"""
# Line numbers showing when screen sharing

Using Pluto for teaching or collaborating and looking at the same screen together. The line numbers are only shown when you hover and that is annoying for the people watching the screen.

Ideas:
- Add a CSS patch in PlutoTeachingTools.jl or similar.
- Maybe turn it on by default?
- Clicking on any number will toggle the global setting of showing/hiding line numbers. `title` tooltip on line numbers to explain the behaviour. Some users will have to search to find this functionality but we also don't want to explain this to everyone...
"""

# ╔═╡ 8cb078fb-5cb7-4185-8db4-95f5f51d00e6
html"""
<style>
.cm-editor .cm-lineNumbers .cm-gutterElement {
        color: var(--cm-line-numbers-color) !important;
    }
    .cm-editor .cm-lineNumbers .cm-gutterElement::after {
        color: transparent !important;
}
</style>
"""

# ╔═╡ bc27a458-4154-48e6-b8ad-e06dddd8bea4
# ╠═╡ disabled = true
#=╠═╡
macro asdf(x)
	__source__.line
end
  ╠═╡ =#

# ╔═╡ 6fbd9c9e-2303-4126-bead-6e0baaa5f2dc
#=╠═╡
let




	z = @asdf 123
	z
end
  ╠═╡ =#

# ╔═╡ 1e39795d-4b01-4eaa-b8a7-b3838289c48c
a

# ╔═╡ bab86b65-5951-4f63-bf93-c7bcde7028e5
md"""
# Issue about Docker images in pluto-on-binder

[https://github.com/fonsp/pluto-on-binder/issues/21](https://github.com/fonsp/pluto-on-binder/issues/21)

We tried lots and lots of things

What we do now is a very basic setup with a Project toml that just adds Pluto. Benefit is that it's small (250MB) which is great because the bottleneck seems to be binder runners downloading the 

We also tried making a sysimage, about 1GB, and thats not faster.

But it's been 18 months since we last looked at this so maybe we should revisit.

If you look at the JuliaPluto org then you see a couple of docker images

The idea was to 

Easiest binder setup is github repo with one file: `Dockerfile`, with just one line: `from gh/laksjdflkasdjflaksjdf`. That turned out no to be significantly faster and by adding the GHA and container registry it became more complicated.

## Julia 1.9

Julia 1.9 has much longer precompile times, and then much faster launch times.

With Julia 1.9 it makes less sense to have the same binder repo for all notebooks. But we still want this because it is super easy to use for people (without a github account).

For the generic `pluto-on-binder` repo we should turn off pkgimages (and maybe tweak some other command line options like `--optimize`).

We should now really make some tools so that people can make a binder specifically for their notebook's package env.
"""

# ╔═╡ 8c42436c-1d87-4a6c-8281-29d69bc0391b
md"""
![](https://www.raspberrypi.com/app/uploads/2021/02/refurb-pis-need-to-be-fixed.jpg)

*Compute cluster*
"""

# ╔═╡ Cell order:
# ╟─0069c988-bd0b-11ed-0e2e-c3ae889f795c
# ╟─c8f36cd5-74b4-488b-bc2f-d6b9db3052eb
# ╟─04078952-8847-466d-bb85-0bda7a05edef
# ╟─6185bcd8-b4e6-4f6d-9a3e-d2ba935ce91f
# ╟─35598841-dc47-4ce5-a59a-1aba366183aa
# ╟─38f027d7-002a-4330-8e8f-58c6905b0314
# ╠═8cb078fb-5cb7-4185-8db4-95f5f51d00e6
# ╠═bc27a458-4154-48e6-b8ad-e06dddd8bea4
# ╠═6fbd9c9e-2303-4126-bead-6e0baaa5f2dc
# ╠═1e39795d-4b01-4eaa-b8a7-b3838289c48c
# ╟─bab86b65-5951-4f63-bf93-c7bcde7028e5
# ╟─8c42436c-1d87-4a6c-8281-29d69bc0391b
