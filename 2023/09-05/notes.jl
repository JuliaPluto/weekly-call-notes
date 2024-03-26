### A Pluto.jl notebook ###
# v0.19.27

using Markdown
using InteractiveUtils

# ╔═╡ aba992a2-76e3-4fb4-bcaf-2655ddc9e7dd
html"""
<h3 style="font-style: italic; border-bottom: none; margin-top: 0; font-weight: normal; text-align: right">September 05th, 2023</h3>
"""

# ╔═╡ 40cae3fa-c9b6-49eb-a474-db989de7ffd7
md"""
### Pluto late night of unfinished lecture notes 📚🌃

The date could be 3rd of October at 6pm. Gerhard will make a Zulip anouncement and check with Luca. The computational thinking template will be updated for the event.
"""

# ╔═╡ 6ef68916-6d20-437e-9c83-0805084854b3
md"""
### Gorilla events in JuliaCon local in Eindhoven!

Gerhard asked if there are public rooms for Saturday. Gerhard will leave on saturday night via a night train. 


"""

# ╔═╡ 1bc98971-0621-4970-90d3-b48352468a71
md"""
### Julia's web performance

[Discourse link](https://discourse.julialang.org/t/julia-can-be-better-at-doing-web-a-benchmark/103300).

Panayotis is currently obsessed with Julia's performance on the Web. On a benchmark the performance of Julia, is worse than that of node frameworks whereas both are using libuv under the hood.

One problem is libuv, for example, on async LibPQ, there a 3ms overhead for every socket update. The delay is also present with asyncio in Python. There is a default value in the UV loop. Panayotis does not know where to read about this. Here is [the issue opened on LibPQ](https://github.com/iamed2/libpq.jl/issues/281).
"""

# ╔═╡ 9c38bfe9-5c3b-4e4b-9475-02d2fc069ea8


# ╔═╡ Cell order:
# ╟─aba992a2-76e3-4fb4-bcaf-2655ddc9e7dd
# ╟─40cae3fa-c9b6-49eb-a474-db989de7ffd7
# ╟─6ef68916-6d20-437e-9c83-0805084854b3
# ╟─1bc98971-0621-4970-90d3-b48352468a71
# ╠═9c38bfe9-5c3b-4e4b-9475-02d2fc069ea8