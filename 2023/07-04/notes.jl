### A Pluto.jl notebook ###
# v0.19.25

using Markdown
using InteractiveUtils

# ╔═╡ faadc6ba-1a8d-11ee-140f-31ea42ba85df
md"""

# computational-thinking-template

## precomputed slider server

The PR is getting close (Connor might also contribute) and we want to make this enabled by default for the template. 

Right now it needs to run in a separate github action, then push to a separate branch which is hosted on a second domain (eg netlify next to github pages) but ideally, PlutoPages generates the precomputed states directly, store them in a nice location and set up the export html config to point to the right place.

## another teaching

During Helsinki meetup, Luca talked to someone else who might also use the template for their course in August! at Aalto university


## regular PlutoSliderServer setup

Panagiotis is back! We asked him for tips to make the setup easier (instead of the long list of linux commands).

We could use **Docker Compose** (small kubernetes). We would make a docker image and a docker compose yaml (10 lines). Teachers copy-paste a three-line command to set it all up!

## Pluto Graz meetup

Let's make computational thinking template and PlutoSliderServer one of the themes during the weekend!

## almost ready!

Brave people can already start using it


## Documentation
Luca wrote documentation for managing the site as the placeholder notebooks in the site.

## Default layout

Right now, if you forget a layout then it doesnt work so it's nice to add a default

## License
We can remove the CC part of the license because we removed all text from the course, we only have code which is MIT licensed. We keep the MIT license for the fork.

Maybe we change the LICENSE file to say "license for the template:" and then the MIT text, because we don't want people to fork and copy a license that applies to what they write in the future. Maybe like the license of [https://github.com/JuliaPluto/static-export-template](https://github.com/JuliaPluto/static-export-template).

We keep a footnote on every page "built with Pluto based on computation thinking" with a link to the class. Most important for the computational thinking staff is attribution and linking.

Old material still being in git history is not a problem for the license.

## fork of class github issues
Github is a bit annoying and sends each PR to the original class, not to the template. Would be nice to fix.

Fons will ask github to unfork it.


"""

# ╔═╡ 73662c74-67c6-4acf-9754-81c7ccfc22da


# ╔═╡ 31154bce-4b3c-4888-9a8e-a2a8f7f73275


# ╔═╡ ce0b6392-0d9b-4de2-9abd-8160de3c6f76


# ╔═╡ a19de140-c89c-405c-9b5e-0e82005d9877


# ╔═╡ 4dc2fc2d-a25a-4f9c-a369-51d98b8d0cef


# ╔═╡ dc6be9d2-2074-4bf3-986f-d787426a425c
md"""



# Sergio updates

Sergio wrote a small prototype grammar for Julia lezer grammar to quickly experiment with things without waiting for the 10min compile

Ideas:
- current grammar uses a tokenizer, probably dont need it because
- better idea of why the grammar takes so long to compile: macros take multiple space-separated arguments which is really diffuclt. this makes the compile time 10x longer. maybe could be improved, but dont see how right now...

Further ideas:
- modularize grammar to make it easier to comment out other features, to make it faster to work on one part.
- first make some improvements to tree sitter with big test suite

Review would be nice!
- Andrey Popp might not have time, review from Michiel or Paul would also be really nice!


"""

# ╔═╡ 045d6b31-1393-4d65-b2d4-3718d923bdd7


# ╔═╡ e1dccf51-4fb3-4aff-9417-66b72bfde9e5


# ╔═╡ d074ab59-1c8d-4ac0-8c57-a55996e842e7
md"""
# JuliaHub GPT AI feature

JuliaHub launched their ChatGPT Julia feature! Panagiotis would like to work on Pluto integration again! Might be with a click to sign in with JuliaHub (click again to sign in with github). Exciting!
"""

# ╔═╡ da7f107e-3db8-47d0-8cca-6ee44b5631cd


# ╔═╡ b0b820e4-5c53-4df1-a717-82ec428aad68
md"""
# JuliaCon

Panagiotis and Luca will be there! And maybe more!

Luca has a talk about FuzzyLogic.jl, check it out!
"""

# ╔═╡ Cell order:
# ╟─faadc6ba-1a8d-11ee-140f-31ea42ba85df
# ╟─73662c74-67c6-4acf-9754-81c7ccfc22da
# ╟─31154bce-4b3c-4888-9a8e-a2a8f7f73275
# ╟─ce0b6392-0d9b-4de2-9abd-8160de3c6f76
# ╟─a19de140-c89c-405c-9b5e-0e82005d9877
# ╟─4dc2fc2d-a25a-4f9c-a369-51d98b8d0cef
# ╟─dc6be9d2-2074-4bf3-986f-d787426a425c
# ╟─045d6b31-1393-4d65-b2d4-3718d923bdd7
# ╟─e1dccf51-4fb3-4aff-9417-66b72bfde9e5
# ╟─d074ab59-1c8d-4ac0-8c57-a55996e842e7
# ╟─da7f107e-3db8-47d0-8cca-6ee44b5631cd
# ╟─b0b820e4-5c53-4df1-a717-82ec428aad68
