### A Pluto.jl notebook ###
# v0.14.0

using Markdown
using InteractiveUtils

# ╔═╡ b2d786ec-7f73-11ea-1a0c-f38d7b6bbc1e
md"""

# Topicsss today

- PR https://github.com/fonsp/Pluto.jl/pull/1742 merged!
- SSR
- Promises.jl
- HTTP.jl
- Print viewer for Stdout/stderr
- Guilherme D3 port
- Precompilation to make Pluto faster!
- Pluto is too slow on big notebooks
- Panagiotis & Guilherme: 2d cell layout (cell metadata)


# Promises.jl

Yayy

Auto generated README


# SSR

For the Pluto docs site, we want something like https://computationalthinking.mit.edu/Spring21/advection_and_diffusion/ but with server side rendering: the HTML should already be there so that it loads super fast!


Ideas:
- Pass in the initial state object into the Editor so that it renders immediately
- Use a real browser to get the HTML

# New log viewer

Should not be tied to the cell, but something global, maybe a pane like the live docs?

Min log level


# D3 Pluto 

Can be used for hexplots, plotting, cool CSS filters. It uses special Pluto features like fast data sharing with JS, `@bind`, `this`.


# Developing packages inside Pluto

Is tricky! 



We should make `@skip_as_script` an official feature? With a GUI for macros, e.g. a button for `@skip_as_script` instead of having to type it at the start.



Special macro to mark an import as test-only, e.g.:
```julia
@test_only using PlutoTest
```

# Big notebook



Big notebooks are also a problems

Also can't interrupt 

We should have *Safe mode*: launch a notebook, and allow editing, without running anything. Should be easy to implement. We are redesigning the main menu, so this could go in.


"""


# ╔═╡ Cell order:
# ╟─b2d786ec-7f73-11ea-1a0c-f38d7b6bbc1e
