### A Pluto.jl notebook ###
# v0.19.27

using Markdown
using InteractiveUtils

# ╔═╡ 8050ca94-b9f8-11ee-0ae8-511300dd4599
md"""
# Topics 23 Jan 2023

- Call for proposals JuliaCon 2023!
- Run your own "Computational thinking" course
- New featured notebooks
- New Pluto features
- turtle notebook
- PlutoUI.DrawCanvas
- PlutoMapPicker.jl, PlutoImageCoordinatePicker.jl
- pluto.land

"""

# ╔═╡ 633186d2-56e2-492a-a1a4-19c05276d97e


# ╔═╡ 9603056b-40cb-46ee-b1a0-29e929a86be3
md"""
## JuliaCon

You can submit talk, workshop, poster.

We are submitting:
- Luka van der Plas: poster - featured notebooks
- Paul Berg: poster - ?
- Luca Ferranti: 10min talk - Build you a computationalthinking - like class for the greater good!
- Fons van der Plas: poster - accessibility in scicomp
- Gerhard Dorn: workshop? no we want BoF - Pluto meetup / hackathon
- everyone: BoF - Pluto teaching
- Panagiotis Georgakopoulos: AskAI on JuliaHub
- Panagiotis Georgakopoulos (with Krystian G from JuliaHub): HTTP performance on Julia
- Alberto Mengali: Talk - Debugging and Developing Packages with Pluto


There will be a hackathon day (still in planning, different location) after the 3 day conf. **Good to collect good first issues.**

We can organise our own meetup in a cafe, maybe about setting up PlutoSliderServer, maybe PlutoUI, maybe PlutoPlotly. Low-entry way to contribute to Pluto. 



Maybe hacking on webassembly
"""

# ╔═╡ 4cedba7b-5588-4d07-bcf0-41508abb7118
md"""
Webassembly is very hard :(
"""

# ╔═╡ 788d6e3a-e570-4b52-8be1-cef743cb4691
md"""
 PlutoUI Canvas
> 🎈 Pluto.jl – Drawing with PlutoUI for : Canvas (Gerhard) (Talk or Lightning Talk)
"""

# ╔═╡ 927ff629-b4c7-4c74-a494-9d08630c2ae1
md"""
Start your title with:
```
🎈 Pluto.jl – 
```

(That's an emdash, so – and not -.)
"""

# ╔═╡ 09f7826d-e5e2-4468-8811-88b6709e103e
md"""
## Run your own "Computational thinking" course

Progress on [https://github.com/juliapluto/computational-thinking-template](https://github.com/juliapluto/computational-thinking-template)! Still TODO is to make the PlutoPages.jl package.
  - Luca: working on this this week (believe it or not :P)

Fons in contact with teacher in Eindhoven who will use this soon.

Working on a guide with workflow to set up PlutoSliderServer
"""

# ╔═╡ b20a2466-b00b-4078-bd7c-09e4119405eb
md"""
# PlutoSliderServer.jl running out of memory

A server that runs PlutoSliderServer.jl will slowly increase its memory usage. We should have a bit more information about that! Panagiotis is working on it!

todos:
- some simple metrics on PlutoSliderServer Server
- actually collect and analyze these 
"""

# ╔═╡ b854875d-290d-4bda-b367-133a4c9c24bc
md"""
# Pluto's reactivity as a package

Pluto's internal reactivity analysis is now available as a small package for other projects!

Read more in the blog post: [ExpressionExplorer.jl and PlutoDependencyExplorer.jl](https://discourse.julialang.org/t/ann-expressionexplorer-jl-and-plutodependencyexplorer-jl-the-internal-reactivity-algorithm-of-pluto/109068).
"""

# ╔═╡ 1240d930-f425-4f79-b377-ee884d87058b
md"""
# PlutoMapPicker.jl, PlutoImageCoordinatePicker.jl

Check it out! Two new packages.

[https://github.com/lukavdplas/PlutoMapPicker.jl](https://github.com/lukavdplas/PlutoMapPicker.jl)

[https://github.com/fonsp/PlutoImageCoordinatePicker.jl](https://github.com/fonsp/PlutoImageCoordinatePicker.jl)
"""

# ╔═╡ 3b6539ee-e5f9-4cfd-94ed-081a70b94203
md"""
# Plots.jl offline support

Working with Panagiotis on [this PR](https://github.com/JuliaPlots/Plots.jl/pull/4863).
"""

# ╔═╡ 0d848082-eede-4674-869e-bf91a40b51ff
md"""
# PlutoUI.DrawCanvas

Gerhard is working on it! We want to add some settings like brush width (like MS Paint!).
"""

# ╔═╡ Cell order:
# ╟─8050ca94-b9f8-11ee-0ae8-511300dd4599
# ╠═633186d2-56e2-492a-a1a4-19c05276d97e
# ╠═9603056b-40cb-46ee-b1a0-29e929a86be3
# ╠═4cedba7b-5588-4d07-bcf0-41508abb7118
# ╟─788d6e3a-e570-4b52-8be1-cef743cb4691
# ╟─927ff629-b4c7-4c74-a494-9d08630c2ae1
# ╟─09f7826d-e5e2-4468-8811-88b6709e103e
# ╠═b20a2466-b00b-4078-bd7c-09e4119405eb
# ╟─b854875d-290d-4bda-b367-133a4c9c24bc
# ╟─1240d930-f425-4f79-b377-ee884d87058b
# ╟─3b6539ee-e5f9-4cfd-94ed-081a70b94203
# ╟─0d848082-eede-4674-869e-bf91a40b51ff
