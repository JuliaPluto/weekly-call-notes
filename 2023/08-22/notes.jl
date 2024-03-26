### A Pluto.jl notebook ###
# v0.19.27

using Markdown
using InteractiveUtils

# ╔═╡ cd602c01-c6f1-4ed3-b25b-31da9d0d9bff
import Pkg

# ╔═╡ 46455eba-7890-42e5-a5d0-a2c0f8db0ae9
# ╠═╡ show_logs = false
begin
	Pkg.activate(temp=true)
	Pkg.add("PlutoVSCodeDebugger")
end

# ╔═╡ 0b8efdae-fa46-4346-bb2f-64da1594ae28
using PlutoVSCodeDebugger

# ╔═╡ 0c8ba973-a26f-4d14-b577-152b3f949376
@connect_vscode begin
pushfirst!(LOAD_PATH, raw"/home/paul/.vscode/extensions/julialang.language-julia-1.47.2/scripts/packages");using VSCodeServer;popfirst!(LOAD_PATH);VSCodeServer.serve(raw"/tmp/vsc-jl-repl-6f9ba55f-a09b-42ac-8676-580db72b4365"; is_dev = "DEBUG_MODE=true" in Base.ARGS, crashreporting_pipename = raw"/tmp/vsc-jl-cr-785251f5-ebd3-4616-9b77-4a710a196ef1");nothing # re-establishing connection with VSCode
end

# ╔═╡ 8472b815-a562-44cb-bc5d-ad484aef501e
html"""
<h3 style="font-style: italic; border-bottom: none; margin-top: 0; font-weight: normal; text-align: right">August 22th, 2023</h3>
"""

# ╔═╡ fe073bc6-614c-47f0-9e33-9d71cb81025f
md"""
## Thinks to talk about

 - Alberto: PlutoVsCodeDebugger and line number issue
 - Paul: `z-index` issue with Codemirror popups
"""

# ╔═╡ b578f622-7903-4dd6-9c1b-f0ff11475f78
md"""
New package from Alberto: [PlutoVSCodeDebugger](https://github.com/disberd/PlutoVSCodeDebugger.jl)!

It enables synchronization between VSCode and Pluto. Debugging code called from Pluto in the VSCode debugger.
"""

# ╔═╡ 7774c413-8c0b-4478-b847-45a0b569ae84
md"""
There is an issue with Line Numbers defined in Pluto. Because Pluto uses the format "FILE#==#UUID" and line number starts at the start of the cell.

The location at which the breakpoint is defined must match the code's line number node. JuliaInterpreter and julia-vscode cannot know this line number format and open a _non-existing_ file called "FILE#==#UUID".

Solutions would be to enable a "Pluto" debug mode where you can set your own breakpoints in the UI and also to maybe use the real line numbers? Maybe we can use fix on the JuliaInterpreter side/CodeTracking side.

Alberto has open an issue on the JuliaInterpreter side: [https://github.com/JuliaDebug/JuliaInterpreter.jl/issues/582](https://github.com/JuliaDebug/JuliaInterpreter.jl/issues/582).
"""

# ╔═╡ e3d66382-aeec-4cc5-9b5f-12004c2749e5
@macroexpand @bp

# ╔═╡ 67871798-8719-42fa-a74f-15bfc7994e80
@run g(10)

# ╔═╡ 28117aad-f9fc-46a4-9611-a26616c53310
methods(var"@bp")

# ╔═╡ 6056a129-d9f0-44ef-8efb-24658bf4cbfa
(
	@__FILE__,@__LINE__

)

# ╔═╡ e0e4b0bf-9ce3-4df7-8863-1285a1a842cb
function real_line_number(file, line)
	file, uuid = split(file, "#==#")
	file, findfirst(l -> startswith(l, "# $uuid"), eachline(file) |> collect) + line
end

# ╔═╡ 6e09a85b-4e9c-4278-8e52-5f955072967f
macro plutobp()
	file, line = real_line_number(string(__source__.file), __source__.line)
	PlutoVSCodeDebugger.var"@bp"(LineNumberNode(line, Symbol(file)), __module__)
end

# ╔═╡ dd15fdcc-aa4e-4f94-981e-a83c53979efd
function g(x)
	@plutobp

	1 + x
end

# ╔═╡ 35092b57-630a-4c30-ac7c-ea290577595a
 _, number = real_line_number(@__FILE__, @__LINE__)

# ╔═╡ cd8d83b7-85d2-42c4-a082-3a0b416ff9d6

error("here!!")


# ╔═╡ 5ec08c6a-2068-4efc-806f-7d89a0ce6f42
file, uuid = split(@__FILE__, "#==#")

# ╔═╡ 74f29e3f-bce4-448a-9c04-29a1c3e919e0
"# $uuid"

# ╔═╡ 66144bb0-9368-4919-b91e-9538bee183ff
split(read(file, String), '\n')[number] |> Text

# ╔═╡ c7da4be0-32f4-4a6d-a864-4dc99647cd4b
occursin("#==#", @__FILE__)

# ╔═╡ 22a96148-022a-4812-a64a-d38c224e936b
function f(x, y)

	if x > 2
		@bp
		y
	else
		x
	end
end

# ╔═╡ ca6379e2-f894-463f-b922-9cd8cec4d0b2
f(2, 20)

# ╔═╡ f171a9d8-01f9-47aa-bbbd-a1a45c88567b
@vscedit first((1,2))

# ╔═╡ 263ebfb9-23d3-4c20-aac2-5a82c2e2e044
m = @which first((1,2))

# ╔═╡ b3f660ac-e9e8-4c29-95e8-8601b9b4070b
# ╠═╡ disabled = true
#=╠═╡
@edit first((1,2))
  ╠═╡ =#

# ╔═╡ cdfdd0cb-8802-4797-bafd-e3fc0a34c452
VERSION

# ╔═╡ 8e2dd3af-779a-449b-8211-78ab97df22ff
@enter 1 + 2

# ╔═╡ Cell order:
# ╟─8472b815-a562-44cb-bc5d-ad484aef501e
# ╟─fe073bc6-614c-47f0-9e33-9d71cb81025f
# ╟─b578f622-7903-4dd6-9c1b-f0ff11475f78
# ╠═0b8efdae-fa46-4346-bb2f-64da1594ae28
# ╟─7774c413-8c0b-4478-b847-45a0b569ae84
# ╠═e3d66382-aeec-4cc5-9b5f-12004c2749e5
# ╠═6e09a85b-4e9c-4278-8e52-5f955072967f
# ╠═dd15fdcc-aa4e-4f94-981e-a83c53979efd
# ╠═67871798-8719-42fa-a74f-15bfc7994e80
# ╠═28117aad-f9fc-46a4-9611-a26616c53310
# ╠═6056a129-d9f0-44ef-8efb-24658bf4cbfa
# ╠═e0e4b0bf-9ce3-4df7-8863-1285a1a842cb
# ╠═35092b57-630a-4c30-ac7c-ea290577595a
# ╠═cd8d83b7-85d2-42c4-a082-3a0b416ff9d6
# ╠═74f29e3f-bce4-448a-9c04-29a1c3e919e0
# ╠═5ec08c6a-2068-4efc-806f-7d89a0ce6f42
# ╠═66144bb0-9368-4919-b91e-9538bee183ff
# ╠═c7da4be0-32f4-4a6d-a864-4dc99647cd4b
# ╠═22a96148-022a-4812-a64a-d38c224e936b
# ╠═ca6379e2-f894-463f-b922-9cd8cec4d0b2
# ╠═0c8ba973-a26f-4d14-b577-152b3f949376
# ╠═f171a9d8-01f9-47aa-bbbd-a1a45c88567b
# ╠═263ebfb9-23d3-4c20-aac2-5a82c2e2e044
# ╠═b3f660ac-e9e8-4c29-95e8-8601b9b4070b
# ╠═cdfdd0cb-8802-4797-bafd-e3fc0a34c452
# ╠═cd602c01-c6f1-4ed3-b25b-31da9d0d9bff
# ╠═46455eba-7890-42e5-a5d0-a2c0f8db0ae9
# ╠═8e2dd3af-779a-449b-8211-78ab97df22ff