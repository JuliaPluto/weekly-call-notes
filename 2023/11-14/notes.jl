### A Pluto.jl notebook ###
# v0.19.32

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
end

# ╔═╡ baa74dae-8310-11ee-2cf6-991058ef3377
md"""
# Weekly call notes 14 nov 2023
"""

# ╔═╡ 3de9ceed-4787-4b78-b115-b0ec3210a92c
md"""
## Bug

found it live during the call!
"""

# ╔═╡ 91084099-6515-4cfb-8f79-755bd54cd6b0
begin
	x = 1
	
	let
		# f() = 123
		x = 2
	end
	x
end

# ╔═╡ 14f79ed1-782c-4e1a-888c-7a5249cf9c66
begin
	xe = 1
	
	let
		f() = 123
		xe = 2
	end
	xe
end

# ╔═╡ a83cbca5-d249-4aec-b6a5-daf6d73ef3a1
md"""
Let's give a talk about all the worst bugs of Pluto!
"""

# ╔═╡ 014e1b54-02a2-4a0f-be0f-06114d792bde
md"""
## ExpressionExplorer.jl

Almost finished!! Still waiting on some silly changes by fons

[https://github.com/JuliaPluto/ExpressionExplorer.jl/pull/12](https://github.com/JuliaPluto/ExpressionExplorer.jl/pull/12)

**Decision:** remove macro expansion and remove configuration stuff. If people want to customize results: transform the expression before giving it to `compute_reactive_node`. We should do the same for plutooooo

TODO:
- merge [https://github.com/JuliaPluto/ExpressionExplorer.jl/pull/12](https://github.com/JuliaPluto/ExpressionExplorer.jl/pull/12)
- finish [our preprocessor](https://github.com/JuliaPluto/ExpressionExplorer.jl/pull/12#issuecomment-1810253416)
- release ExpressionExplorer 1.0 yayyyy
- blabla


"""

# ╔═╡ 50f8d760-c2bd-49c7-bb36-c7277715cafc
md"""
## JuliaCon 2023 local Eindhoven with Pluto meetup!

- Nov 30 – PyData has a separate Pluto event that you can go to for free (including free entrace to PyData but not the PyData talks)! Contact gerhard@plutojl.org to join :)
- Dec 1 – JuliaCon local Eindhoven – we are giving 3 talks! and you can meet lots of Julia people yayyy
- Dec 2 – second Pluto meetup woohoooo! Little hackathon somewhere in Eindhoven. It's free! Contact gerhard@plutojl.org to join :)
"""

# ╔═╡ 6559c44e-8cc2-4c0d-b9cf-aace490dceb7
md"""
## `pluto.land` domain

We have the `pluto.land` domain! What should we do with it?

Not even a landing page `:sad_and_disappointed_face:`.

### Ideas

#### Workadventure
Character can walk around in a 2D world and explore notebooks!!

workadventure

#### Just the featured notebooks again

So you see featured.plutojl.org but on pluto.land

#### Free Pluto HTML hosting service

Yessssss we can write it with Deno yayyyy

So just an easy hosting place for static HTML files

Ideas for hosting:
- Deno KV but it's too expensive: 1GB free tier
- S3 probably nicer! Or S3 clones like the google cloud thing

#### Pluto Live Share

But that doesn't need to be on a nice domain because it's a bit internal anyways. So just `liveshare.plutojl.org`.



"""

# ╔═╡ d344fa0a-9fbc-45b8-8dee-7ddf1b1822b3
md"""
## WASM

Some awesome new progress!!

- [https://www.ber.gp/notebooks/fun%20theory](https://www.ber.gp/notebooks/fun%20theory) – WASM in the browser with `@bind`! Bit hacky
- [https://tshort.github.io/WebAssemblyCompiler.jl/stable/examples/observables/](https://tshort.github.io/WebAssemblyCompiler.jl/stable/examples/observables/) demo from Tom Short (WebAssemblyCompiler.jl) with Makie compiled!
"""

# ╔═╡ cf4cda9b-6a12-4a5a-a918-68771e2e5c2f
md"""
## Julia - JS link
"""

# ╔═╡ 9b6d2582-c606-4c70-aa51-75d734c0a2f2
function Base.show(io::IO, m::MIME"text/html", mytype::MyType)



	# this returns a magical object that you can interpolate into a HTL <script> tag (the same return type as `AbstractPlutoDingetjes.published_to_js(x)`)
	the_link = AbstractPlutoDingetjes.with_link(io) do message_from_js
		@info "i should be visible"
		println("i dont care about this one")

		if rand() < .1
			error("you should see me somewhere")
		end
		
		return response_to_js
	end


	Base.show(io, m, @htl("""
	<script>
		let data = $(AbstractPlutoDingetjes.published_to_js(initial_data))
		let link_with_julia = $(the_link)

		let button = document.add
	</script>
	
	"""))
end

# ╔═╡ Cell order:
# ╟─baa74dae-8310-11ee-2cf6-991058ef3377
# ╟─3de9ceed-4787-4b78-b115-b0ec3210a92c
# ╠═91084099-6515-4cfb-8f79-755bd54cd6b0
# ╠═14f79ed1-782c-4e1a-888c-7a5249cf9c66
# ╟─a83cbca5-d249-4aec-b6a5-daf6d73ef3a1
# ╟─014e1b54-02a2-4a0f-be0f-06114d792bde
# ╟─50f8d760-c2bd-49c7-bb36-c7277715cafc
# ╟─6559c44e-8cc2-4c0d-b9cf-aace490dceb7
# ╟─d344fa0a-9fbc-45b8-8dee-7ddf1b1822b3
# ╟─cf4cda9b-6a12-4a5a-a918-68771e2e5c2f
# ╠═9b6d2582-c606-4c70-aa51-75d734c0a2f2
