### A Pluto.jl notebook ###
# v0.19.16

using Markdown
using InteractiveUtils

# ╔═╡ 804fe870-7006-11ed-1df0-bd70a460c10a
md"""
# Weekly notes – 29 November 2022
"""

# ╔═╡ 55d49e3a-70bf-42da-b33a-c11dacd5b47a
md"""
# Topics

- fonsp: Process monitor
- fonsp: lots of new tiny bugs
- michiel: pokémon
- juliacon jupytercon
- fonsp: always enable autocomplete?
- paul & sergio & fonsp: Malt.jl
- sergio & dralletje: updates to `tree-sitter` and `lezer`

"""

# ╔═╡ 82a650e8-80b3-47ae-90f2-b4b833d08990
md"""
# Malt.jl

Sergio is finishing the semester right now (exams!), will continue work on Malt.jl next week.

More info in our planner board.
"""

# ╔═╡ 74f1c0d4-a4a5-4d8e-accf-a66d5b4918bd
md"""
# Interrupt is broken

Julia 1.8 broke the Ctrl+C interrupt: [Julia issue](https://github.com/JuliaLang/julia/issues/46635) and it's not being fixed 😭😭😭😭😭

Please Julia can we fix this? 

This means that Pluto interrupt also became really unreliable:

![image](https://user-images.githubusercontent.com/6933510/204600256-91be9dc3-6789-405b-b745-1c2820fac658.png)

Maybe it's time to give up on computers. They are 2 mean );



"""

# ╔═╡ 7fe915ff-0fbb-42f2-8824-d38b7483f7e2
md"""
# Crazy Julia syntax
"""

# ╔═╡ 4847e63e-2d5a-4ff0-beed-0ad442e81151
macro ⦿(a, b)
	a
end

# ╔═╡ f2777caf-2fbe-40d1-854d-f8ee3e31d1c8
# THIS IS LEGAL???

# ╔═╡ 8bc77fe2-1687-4239-9956-2955c15461da
@(1 ⦿ 2)

# ╔═╡ 3de05946-cfa5-4bb0-a83a-f90452922084
:(@(1 ⦿ 2)) |> dump

# ╔═╡ ee28b86b-4554-443c-afa9-6af2b0d18450
md"""
# always enable autocomplete?

[Julia PR](https://github.com/fonsp/Pluto.jl/pull/2389)

Right now we only do autocomplete when you press `<TAB>`. This was done because (2 years ago) I felt like the autocomplete was not "smart" enough to justify turning it on by default. But now we have CM6 and lots of autocomplete improvements by Paul and Michiel so let's turn it on! I met some Pluto users who did not know that we have autocomplete, because they never pressed TAB :o

## So should we do it??

YES but michiel will take a look at the edge cases

"""

# ╔═╡ 99274dbf-c284-4f1b-95fc-13b551e0ddad
html"""
<iframe src="https://oss.love/card/Sb3LcgPc0" style="width: 100%; height: 600px; border: none; border-radius: 1rem;"></iframe>
"""

# ╔═╡ 4304d746-1978-4a4a-ad67-27b5e4652524
md"""
# Process monitor!

I wrote notes in the [PR](https://github.com/fonsp/Pluto.jl/pull/2399), check it out!


"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.3"
manifest_format = "2.0"
project_hash = "da39a3ee5e6b4b0d3255bfef95601890afd80709"

[deps]
"""

# ╔═╡ Cell order:
# ╟─804fe870-7006-11ed-1df0-bd70a460c10a
# ╟─55d49e3a-70bf-42da-b33a-c11dacd5b47a
# ╟─82a650e8-80b3-47ae-90f2-b4b833d08990
# ╟─74f1c0d4-a4a5-4d8e-accf-a66d5b4918bd
# ╟─7fe915ff-0fbb-42f2-8824-d38b7483f7e2
# ╠═4847e63e-2d5a-4ff0-beed-0ad442e81151
# ╠═f2777caf-2fbe-40d1-854d-f8ee3e31d1c8
# ╠═8bc77fe2-1687-4239-9956-2955c15461da
# ╠═3de05946-cfa5-4bb0-a83a-f90452922084
# ╟─ee28b86b-4554-443c-afa9-6af2b0d18450
# ╟─99274dbf-c284-4f1b-95fc-13b551e0ddad
# ╟─4304d746-1978-4a4a-ad67-27b5e4652524
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
