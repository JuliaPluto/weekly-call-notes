### A Pluto.jl notebook ###
# v0.18.0

using Markdown
using InteractiveUtils

# ╔═╡ d659d6b1-7051-4cbe-96fb-83012a755477
import MarkdownLiteral: @markdown

# ╔═╡ bc036e79-cbab-43f1-9142-c82f2f450430
@markdown """
# Notes for March 17th!
"""

# ╔═╡ 9f31da0b-4b4f-4bcd-887f-98d928734416
@markdown """
## Topics for today!
- Pluto Events (but not ::PlutoEvent Events)!
- Docs website!
- Riks performance interview
- D3 thing (Guilherme)
- PlutoPlotly (Alberto)
- Realtime sync!
- Misc PRs
- HTTP??? FONS???
"""

# ╔═╡ 532a5c5e-feca-4188-9ad7-0004b92496e0
@markdown """
## Pluto Events

[Pluto Discord Invite](https://discord.gg/PhQVJnVFrr)

- **Pluto Barcamp:** Plotting (April 11th)
- **Pluto Open Space:** Education
- **Pluto Workshop:** PlutoSliderServer
- **Pluto Competition:** Pluto Sample Notebook
- **Pluto Worldcafe:** My cool Pluto project
- **Pluto Factory:** JavaScript Widgets
- **Pluto Feature:** Pluto Recordings
- **Pluto Insights:** PlutoHooks
- **Pluto Hackathon:** ????

#### Pluto Barcamp: Plotting
(April 11th)  
People are excited  
Nice  
We have a secret space in the Discord 😎
"""

# ╔═╡ 33d620bf-59f3-4e86-b2cd-c6fe622fe685
@markdown """
## Docs website!

- [New Website!](https://plutojl-preview.netlify.app)

**User facing stuff:**
- Getting started with Julia
- How does reactivity work  
  Specifically mutation and the likes
- Keybinding guide  
  So people know how to create a new cell
- Logging messages
- How to create a package in Pluto
- Why not to use Neptune.jl
- Interactive Widgets (PlutoUI specifically (NoJavascript/JustJulia))
- Javascript 😎
- SliderServer stuff?
- Exploration / Showcase  
- "Sample notebooks" and just cool things (like works with Cuda or the PerformanceProfiler widget)
- Automatic reloading of package
- Layout (PlutoUI Layout and isolated cell id)
- Presenting???
- Notebook catalog/showcase
- How to use
  - Latex
  - Markdown (is broken) (MarkdownLiteral)
  - Plots
  - PlutoTest
  - Benchmark
  - Terminal Output
- FAQ
  - Can I make my code bigger? NO
  - Do I need `begin ... end`? YES
  - Can I change the font or theme? NO

**Developer (Advanced):**
- AbstractPlutoDingetjes (`publish_to_js`)
- Maaaaaybeeeee PlutoHooks
- Events API
"""

# ╔═╡ b455a946-c055-4c20-afc3-4b770845c34f
@markdown """
## Riks performance interview

I need someone to review my PRs! - Rik

Ughhhhh - Michiel 😉

But I will be your PR buddy - Michiel
"""

# ╔═╡ 1c827a4b-c30d-41a9-b790-5caf9a2c1521
@markdown """
## D3 thing (Guilherme)

- Events! :)
- Actually has an example notebook!! (No... is "just" raw D3)
- Events! :(
- Multiple binds?
"""

# ╔═╡ 9049e585-82f9-4e4b-baef-3b1cacf6cdda
@markdown """
## PlutoPlotly (Alberto)

PlotlyLight is cool but we might be coooler 😎

[PlotlyLight.jl issue](https://github.com/JuliaComputing/PlotlyLight.jl/issues/12)
"""

# ╔═╡ 9b47903a-cae6-45e9-b382-1c33370f4481
@markdown """
## Realtime sync!

Still doesn't have the features merged required for vscode :(

Block all server-to-client stuff so we can merge it and then look at errory stuff
"""

# ╔═╡ 091016f7-bfc0-4f8c-a5f3-54e0f694c088
@markdown """
## Misc PRs

### Metadata in cell PR

Michiel should look at this.  
If Michiel doesn't, Πana will merge it

### With Distributed 2 

I don't know why this doesn't work... - Πana

Another idea: use Distributed from Deno someway 😏

(My baby is crying but not too much because I am speaking English)

### Local variable autocomplete

Would be really nice - Alberto
"""

# ╔═╡ ca4e1595-2c75-4233-b659-649e89712b89
@markdown """
## HTTP??? FONS???

Discuss next week
"""

# ╔═╡ de06f4ed-68b6-413d-af20-f6c6abf1ca92
@markdown "## Appendix"

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
MarkdownLiteral = "736d6165-7244-6769-4267-6b50796e6954"

[compat]
MarkdownLiteral = "~0.1.1"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.2"
manifest_format = "2.0"

[[deps.CommonMark]]
deps = ["Crayons", "JSON", "URIs"]
git-tree-sha1 = "4cd7063c9bdebdbd55ede1af70f3c2f48fab4215"
uuid = "a80b9123-70ca-4bc0-993e-6e3bcb318db6"
version = "0.8.6"

[[deps.Crayons]]
git-tree-sha1 = "249fe38abf76d48563e2f4556bebd215aa317e15"
uuid = "a8cc5b0e-0ffa-5ad4-8c14-923d3ee1735f"
version = "4.1.1"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.HypertextLiteral]]
git-tree-sha1 = "2b078b5a615c6c0396c77810d92ee8c6f470d238"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.3"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "3c837543ddb02250ef42f4738347454f95079d4e"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.3"

[[deps.MarkdownLiteral]]
deps = ["CommonMark", "HypertextLiteral"]
git-tree-sha1 = "0d3fa2dd374934b62ee16a4721fe68c418b92899"
uuid = "736d6165-7244-6769-4267-6b50796e6954"
version = "0.1.1"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.Parsers]]
deps = ["Dates"]
git-tree-sha1 = "85b5da0fa43588c75bb1ff986493443f821c70b7"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.2.3"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.URIs]]
git-tree-sha1 = "97bbe755a53fe859669cd907f2d96aee8d2c1355"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.3.0"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"
"""

# ╔═╡ Cell order:
# ╟─bc036e79-cbab-43f1-9142-c82f2f450430
# ╟─9f31da0b-4b4f-4bcd-887f-98d928734416
# ╟─532a5c5e-feca-4188-9ad7-0004b92496e0
# ╟─33d620bf-59f3-4e86-b2cd-c6fe622fe685
# ╟─b455a946-c055-4c20-afc3-4b770845c34f
# ╟─1c827a4b-c30d-41a9-b790-5caf9a2c1521
# ╟─9049e585-82f9-4e4b-baef-3b1cacf6cdda
# ╟─9b47903a-cae6-45e9-b382-1c33370f4481
# ╟─091016f7-bfc0-4f8c-a5f3-54e0f694c088
# ╟─ca4e1595-2c75-4233-b659-649e89712b89
# ╟─de06f4ed-68b6-413d-af20-f6c6abf1ca92
# ╠═d659d6b1-7051-4cbe-96fb-83012a755477
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
