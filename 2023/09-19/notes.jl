### A Pluto.jl notebook ###
# v0.19.27

using Markdown
using InteractiveUtils

# ╔═╡ 625f010c-9e8c-45ef-bc15-4dd0528f5aeb
html"""
<h3 style="font-style: italic; border-bottom: none; margin-top: 0; font-weight: normal; text-align: right">September 19th, 2023</h3>
"""

# ╔═╡ 900ab2cc-b151-49da-a04c-5c74f95dbdb8
md"""
## Notebook precompilation time

Preloading notebooks since the compilation time can become larger for each versions.
"""

# ╔═╡ 7ddfeeb3-3508-4303-a493-0288d976e072
md"""
## Pluto night for unfinished notebooks

The discord server should be better.

"""

# ╔═╡ 28c7b892-cf3e-443d-9559-0085204fe16f
md"""
## [Fly.io](https://fly.io) server start

They can start a docker server in 300ms, which should be a great way to speed up the Pluto.jl experience at Julia Computing.

"""

# ╔═╡ 6d9d9c9f-20ed-4a91-a8d7-646e6618fd8b
md"""
## Pluto meetup in Eindhoven

No progress this week to find the room.
"""

# ╔═╡ 894582e6-5708-11ee-2943-17d19d52e000
md"""
## Malt support merged! ✔

Congrats to Sergio, Fons, & co for the work 🎊
"""

# ╔═╡ cc97fe0f-1fb9-403c-867a-61f3d4107ba0
md"""
## John's Plots.jl bug

On the first load, the surface plot is empty;
But on rerun, the surface can be shown, weird.
"""

# ╔═╡ 2764d8aa-c525-4510-ba47-76808a3ba9b2
md"""
## Distributed

Some distributed procs can stay as zombies after the notebook process. Maybe we can call `Distributed.rmprocs(procs)` ourselves because the distributed atexit hook might not be enough.
"""

# ╔═╡ Cell order:
# ╟─625f010c-9e8c-45ef-bc15-4dd0528f5aeb
# ╟─900ab2cc-b151-49da-a04c-5c74f95dbdb8
# ╟─7ddfeeb3-3508-4303-a493-0288d976e072
# ╟─28c7b892-cf3e-443d-9559-0085204fe16f
# ╟─6d9d9c9f-20ed-4a91-a8d7-646e6618fd8b
# ╟─894582e6-5708-11ee-2943-17d19d52e000
# ╟─cc97fe0f-1fb9-403c-867a-61f3d4107ba0
# ╟─2764d8aa-c525-4510-ba47-76808a3ba9b2