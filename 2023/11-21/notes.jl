### A Pluto.jl notebook ###
# v0.19.32

using Markdown
using InteractiveUtils

# ╔═╡ f0e8235a-888f-11ee-2f9c-0d9ec5b8b152
md"""
# Notes 21 november 2023

PlutoConm local Eidnhoven is coming up!

Topics:
- Docs for AbstractPlutoDingetjes
- New JS Julia link
- Generating opengraph images!
- new featured notebooks
"""

# ╔═╡ d89f9e26-1814-4d60-b663-e9056a31dee9
md"""
# Docs for AbstractPlutoDingetjes

New docs website [plutojl.org/docs/abstractplutodingetjes/](https://plutojl.org/docs/abstractplutodingetjes/)!

Docs are better in Pluto! But we need to explain how people can do it with Pkg and stuff
"""

# ╔═╡ 20307f47-ea6b-46a7-a951-b080abbe7ae5
md"""
# New JS Julia link

WIP [`AbstractPlutoDingetjes.Display.with_js_link`](https://github.com/fonsp/Pluto.jl/pull/2726).
"""

# ╔═╡ 2f61a99d-6d72-44d0-ab1e-9f3b8aaaae1e


# ╔═╡ 5bb54bc4-3e28-4cc4-98ce-33f16d5f20fc
let
	messages_to_js = Channel()
	send_to_js(msg) = put!(messages_to_js, msg)


	function get_next_message(_ignore)
		take!(messages_to_js)
	end

	


	@htl("""
	<script>
	const get_next_msg_from_julia = $(AbstractPlutoDingetjes.Display.with_js_link(get_next_message))

	get_next_msg_from_julia().then(msg => {
		
	})

// I can now call sqrt_from_julia like a JavaScript function. It returns a Promise:
const result = await sqrt_from_julia(9.0)
console.log(result)

</script>
""")

	

# ╔═╡ b5c6600d-c998-4288-a8ee-12750f51599d
md"""
# 
"""

# ╔═╡ Cell order:
# ╟─f0e8235a-888f-11ee-2f9c-0d9ec5b8b152
# ╟─d89f9e26-1814-4d60-b663-e9056a31dee9
# ╟─20307f47-ea6b-46a7-a951-b080abbe7ae5
# ╠═2f61a99d-6d72-44d0-ab1e-9f3b8aaaae1e
# ╠═5bb54bc4-3e28-4cc4-98ce-33f16d5f20fc
# ╠═b5c6600d-c998-4288-a8ee-12750f51599d
