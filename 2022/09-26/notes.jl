### A Pluto.jl notebook ###
# v0.19.12

using Markdown
using InteractiveUtils

# ╔═╡ e52a6f48-3db4-11ed-1db7-bf10172666a3
md"""
# Weekly notes (2022-09-26)!
"""

# ╔═╡ 3a82ca31-5970-454a-8cea-6fd111053b06
md"""
# To discuss

- [Advanced pkg manager](https://github.com/fonsp/Pluto.jl/pull/2245)
- New YouTube series by Doggo.jl about Pluto! [https://www.youtube.com/watch?v=YahByfBTnCc&list=PLhQ2JMBcfAsjeC10lx_2zDlFUMkBUTyyO&index=3](https://www.youtube.com/watch?v=YahByfBTnCc&list=PLhQ2JMBcfAsjeC10lx_2zDlFUMkBUTyyO&index=3)
- horte
- Alberto: [Highlight.js](https://github.com/fonsp/Pluto.jl/pull/2244)
- Malt.jl - interrupt & more on Windows
- Paul: New work on live collab [PR](https://github.com/fonsp/Pluto.jl/pull/2296)
- Fons: Multiple definitions of x
- Fons: new PlutoUI ToC
- Fons: featured notebooks
- Gerhard: creating custom widgets in PlutoUI
- Sergio: Windows stuff with Malt.jl
"""

# ╔═╡ bac54fe1-5bae-42f5-b43b-364a3b703041
1234+1

# ╔═╡ 46c7f459-688e-4987-973c-71ca2cbe9cfc
x = 1

# ╔═╡ b29f1663-7f5e-471b-ac52-5b249edaac77
x + 10

# ╔═╡ e6e3bf97-080f-4f13-82ba-fb12514c239c
x + 20

# ╔═╡ 3106d47b-da99-433c-bcd2-e5df607695e2
md"""
# Malt.jl

One optimisation remaining, reusing sockets. This should make Windows a little bit happier.

Benchmarking: In early benchmarking, the IO costs heavily outweights the computational costs. ~8µs for Malt.jl and ~1µs for Distributed.jl.

Socket issue, letting the garbage collector do the work is fine but can not scale indefinitely. Reusing the socket should use.

Crazy idea from Panayotis: use the testing suite from Distributed.jl to test Malt.jl, we might be able to reuse some of the code.

Improvements: reducing the `take!(iobuffer)` pattern by writing to the Malt socket directly as an IO.
"""

# ╔═╡ db6e533c-b8fb-4bc9-b97c-036f4799e604
md"""
# New YouTube series by Doggo.jl about Pluto! 

Used the youtube series to learn Julia, is getting really good, and now doing a season about Pluto.

We should get in contact 

- Make sure that 

[https://www.youtube.com/watch?v=YahByfBTnCc&list=PLhQ2JMBcfAsjeC10lx_2zDlFUMkBUTyyO&index=3](https://www.youtube.com/watch?v=YahByfBTnCc&list=PLhQ2JMBcfAsjeC10lx_2zDlFUMkBUTyyO&index=3)
"""

# ╔═╡ b56a253d-0261-4951-a221-b98bab736753
md"""
# Highlight.js

To register languages to the global object. Merged !
"""

# ╔═╡ 5bde421d-eec0-49f0-8cca-f9483220943b
md"""
# JavaScript State Management using [Signals](https://github.com/preactjs/signals#readme)!!

Preact has released Signals. Maybe a large part of the state management can be using Signals instead since it's seems simpler to use than `useState`.
"""

# ╔═╡ 3035148b-b02a-4b4b-8522-b043e7711690
md"""
# Pkg pull request from Alberto!

The idea is to basically create a holder to put a custom Pkg string (`"add MyPackagea"` by default). The Pluto Pkg manager then uses this to install package (instead of just `Pkg.add("...")`).

It can be confusing that the command is not run each time the notebook is run.

Which interface should be given to the user to mutate the Pkg specs? Commands are mutating but the Project.toml is **declarative**.
"""

# ╔═╡ 76da6b8f-a484-41e4-b02a-bbc8db441ad2


# ╔═╡ d838c7bc-54c0-43cd-86c5-14ed77cfc4d7


# ╔═╡ f5622608-5e11-492d-be1a-cbe97d69e502


# ╔═╡ 20a82e72-9a3c-4f1c-bc43-204c7af483da


# ╔═╡ 151f0e09-c068-4780-b759-f18dafa6f315


# ╔═╡ 86d53cee-287c-4609-bb58-828414193982
1+2+3

# ╔═╡ 6ea83a04-0231-4367-a3af-886618649265
md"""
CONVERGE!
"""

# ╔═╡ e8a876d2-af60-45cd-8413-1b114644f80c
# helllloooo from fonszzziii

# ╔═╡ c0b371cf-64c3-4f35-83f0-c223139b3ed1
χ = χ + 1

# ╔═╡ 81b93860-ef1a-4d0f-a776-5cbebaecd04d
χ = 1

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.1"
manifest_format = "2.0"
project_hash = "da39a3ee5e6b4b0d3255bfef95601890afd80709"

[deps]
"""

# ╔═╡ Cell order:
# ╟─e52a6f48-3db4-11ed-1db7-bf10172666a3
# ╟─3a82ca31-5970-454a-8cea-6fd111053b06
# ╠═bac54fe1-5bae-42f5-b43b-364a3b703041
# ╠═46c7f459-688e-4987-973c-71ca2cbe9cfc
# ╠═b29f1663-7f5e-471b-ac52-5b249edaac77
# ╠═e6e3bf97-080f-4f13-82ba-fb12514c239c
# ╟─3106d47b-da99-433c-bcd2-e5df607695e2
# ╟─db6e533c-b8fb-4bc9-b97c-036f4799e604
# ╟─b56a253d-0261-4951-a221-b98bab736753
# ╟─5bde421d-eec0-49f0-8cca-f9483220943b
# ╟─3035148b-b02a-4b4b-8522-b043e7711690
# ╠═76da6b8f-a484-41e4-b02a-bbc8db441ad2
# ╠═81b93860-ef1a-4d0f-a776-5cbebaecd04d
# ╠═c0b371cf-64c3-4f35-83f0-c223139b3ed1
# ╠═d838c7bc-54c0-43cd-86c5-14ed77cfc4d7
# ╠═f5622608-5e11-492d-be1a-cbe97d69e502
# ╠═20a82e72-9a3c-4f1c-bc43-204c7af483da
# ╠═151f0e09-c068-4780-b759-f18dafa6f315
# ╠═86d53cee-287c-4609-bb58-828414193982
# ╠═6ea83a04-0231-4367-a3af-886618649265
# ╠═e8a876d2-af60-45cd-8413-1b114644f80c
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
