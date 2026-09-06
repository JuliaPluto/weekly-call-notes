### A Pluto.jl notebook ###
# v0.19.26

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

# ╔═╡ ed1581a5-e3f9-4a96-97e6-210a719d07c7
html"""
<h3 style="font-style: italic; border-bottom: none; margin-top: 0; font-weight: normal; text-align: right">June 20th, 2023</h3>
"""

# ╔═╡ 438b7d56-0f90-11ee-3e24-250e0b84bde9
md"""
# Stephan Macke - ipyflow
"""

# ╔═╡ 880573c2-8552-42ed-a939-744e7e6b73d9
html"""
<a href="https://github.com/ipyflow/ipyflow" style="font-size: 16pt">github.com/ipyflow/ipyflow</a>
"""

# ╔═╡ 75b2f654-4c90-421d-8c50-295340d22016
md"""
Enter `ipyflow` - a reactive Python kernel for Jupyter!

* Preview reactive execution by default with _suggested cell executions_
* Run reactively with `ctrl+shift+enter` (or `cmd+shift+enter` on mac)

`ipyflow` also tracks _mutations_ on objects. For example, it understands that cell 3 depends on both cell 1 and 2:

```python
# cell 1
x = [1, 2, 3]

# cell 2
del x[1]

# cell 3
print(x)  # outputs "[1, 3]"
```

Reactive execution in Jupyter notebooks allows `ipywidgets` to behave much like Pluto's `@bind` does!

If you use `ipyflow`, please report any bugs or issues, Stephan would love to fix them!

Contact Stephan at [stephen.macke@gmail.com](mailto:stephen.macke@gmail.com)
"""

# ╔═╡ Cell order:
# ╟─ed1581a5-e3f9-4a96-97e6-210a719d07c7
# ╟─438b7d56-0f90-11ee-3e24-250e0b84bde9
# ╟─880573c2-8552-42ed-a939-744e7e6b73d9
# ╟─75b2f654-4c90-421d-8c50-295340d22016
