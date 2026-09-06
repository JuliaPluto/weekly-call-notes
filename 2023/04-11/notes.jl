### A Pluto.jl notebook ###
# v0.19.22

using Markdown
using InteractiveUtils

# ╔═╡ 44e859da-d884-11ed-205d-751320176628
md"""
# Weekly call notes 11 april 2023

Topics today:
- Making meetings shorter
- New loading progress
"""

# ╔═╡ 127d78f7-2093-4980-a31d-344bd77d70eb
md"""
# Making meetings shorter

Ideas:
- one on one meetings with everyone
- Old business first (things that you didnt have time for last time), new business second
- 



### Status updates at the start


And list of topics
- Who wants to discuss? Maybe breakouts
- 

### Time limit
Might be effective! 60 minutes

# Different meeting time

18:00 CEST is not nice for everyone, maybe alternate 12:00 CEST and 18:00 CEST
"""

# ╔═╡ fc8a7ec6-143e-4525-9ecd-f39181af96a0
md"""
# Pkg Julia 1.9

Gerhard: is there a script to update the package environments of multiple notebooks at once?

Yes! For a single notebook:

```julia
Pluto.update_notebook_environment("notebook_path.jl"; level=Pkg.MINOR)
```

For all notebooks in a folder:

[`https://github.com/mitmath/18S191/blob/Fall22/tools/update_notebook_packages.jl`](https://github.com/mitmath/18S191/blob/Fall22/tools/update_notebook_packages.jl)

Would be nice to put this sort of stuff in a package!

Also:
- Tool to synchronize environments between notebooks: have one "source" environment, and all notebooks are subsets of that env.

"""

# ╔═╡ 811e590b-f86f-4bd5-acca-b0ac24673739
md"""
# AI

Really useful for beginners.

Important: "beginners" also means people who are new to the language. Important because there are more non-Julia programmers than Julia programmers.

Idea: maybe ask GPT to explain it to someone who only know Python!

This has a CHatGPT window at the bottom os there is a precedent. [`https://riptutorial.com/julia-lang/example/23207/introduction-to-closures`](https://riptutorial.com/julia-lang/example/23207/introduction-to-closures)
"""

# ╔═╡ a18a380a-eb48-4efe-81af-272369a6677c
md"""
Fons needs to read the terms of service before putting sth online.
"""

# ╔═╡ Cell order:
# ╟─44e859da-d884-11ed-205d-751320176628
# ╟─127d78f7-2093-4980-a31d-344bd77d70eb
# ╟─fc8a7ec6-143e-4525-9ecd-f39181af96a0
# ╟─811e590b-f86f-4bd5-acca-b0ac24673739
# ╟─a18a380a-eb48-4efe-81af-272369a6677c
