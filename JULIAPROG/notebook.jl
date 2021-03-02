### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# ╔═╡ 4bfcd930-7aa0-11eb-2c61-71d83e5a7efc
begin
	using Images
	using ImageMagick
	using Colors
	#using HypertextLiteral
	vine = load("neko_vignetto.jpg")
end

# ╔═╡ b9d33ef0-7a9f-11eb-3aa6-3d8dc5749a94
begin
	progname = "Julia"
	notebookname = "Pluto Notebook"
end

# ╔═╡ 938783e0-7aa0-11eb-193a-efc9d1424da5
begin
	(h, w) = size(vine)
	wmodify = (w ÷ 2) - 300
	vine_face = vine[1:h, wmodify:w]
end

# ╔═╡ f85d9250-7aa0-11eb-3958-c184816057ae
size(vine)

# ╔═╡ 3db90b80-7aa2-11eb-0448-7d886fdb4367
[
	vine_face reverse(vine_face, dims = 2)
	reverse(vine_face, dims = 1) reverse(reverse(vine_face, dims = 1), dims = 2)
]

# ╔═╡ 71fe20f0-7aa3-11eb-179a-99bfc4165276
function redify(color)
	return RGB(0, color.g, 0)
end

# ╔═╡ 12ff3820-7b78-11eb-0f2f-27f9776a33ef
[RGB(redval, 0.0, blueval) for redval in 0:0.1:1, blueval in 0:0.1:1]

# ╔═╡ 8d443ed0-7aa3-11eb-2888-0920888050e6
begin
	takecolor = RGB(0.98, 0.15, 0.67)
	[takecolor, redify.(takecolor)]
end

# ╔═╡ ab3afdc0-7aa3-11eb-16ab-177c4031bfdd
redify.(vine_face)

# ╔═╡ b78d7b60-7aa4-11eb-204f-cbc675fcd835
function monochrome(color)
	RGB(color.r, color.g, color.b)
	if color.b < 0.50
		return RGB(0, 0, 0)
	else
		return RGB(1, 1, 1)
	end
end

# ╔═╡ 70693e30-7aa5-11eb-0b7e-e553fd22275b
monochrome.(vine_face)

# ╔═╡ 9d4db480-7aa5-11eb-1a9e-21c7c6960b5f
function grayscale(color)
	RGB(color.r, color.g, color.b)
	μ = (color.r + color.g + color.b) / 3
	return RGB(μ, μ, μ)
end

# ╔═╡ e6106a00-7aa5-11eb-275b-e97981411116
grayscale.(vine_face)

# ╔═╡ 81da4a60-7b7c-11eb-2ece-a73c0c7b4498
rand(5)

# ╔═╡ 6d60c900-7b7d-11eb-20c9-2f0d414e96e6
function inverse(color)
	RGB(color.r, color.g, color.b)
	return RGB(1 - color.r, 1 - color.g, 1 - color.b)
end

# ╔═╡ c525a840-7b7d-11eb-1e4d-ab0e27dce733
inverse.(vine_face)

# ╔═╡ 49ef6c30-7b80-11eb-1266-13c00983662e
function distgauss(x, μ, σ)
	return (1 / (sqrt(2π) * σ)) * exp(-(1 / 2) * ((x - μ) / σ)^2)
end

# ╔═╡ 4f9ce470-7b7e-11eb-3fb7-4707db8ecee2
function noise(color)
	RGB(color.r, color.g, color.b)
	η = rand(3)
	return RGB(color.r + η[1], color.g + η[1], color.b + η[1])
end

# ╔═╡ 837371e0-7b85-11eb-0f9c-dbb24f6f7ab3


# ╔═╡ 75126e50-7b7e-11eb-0a8f-332434b49591
noise.(vine_face)

# ╔═╡ Cell order:
# ╠═b9d33ef0-7a9f-11eb-3aa6-3d8dc5749a94
# ╠═4bfcd930-7aa0-11eb-2c61-71d83e5a7efc
# ╠═938783e0-7aa0-11eb-193a-efc9d1424da5
# ╠═f85d9250-7aa0-11eb-3958-c184816057ae
# ╠═3db90b80-7aa2-11eb-0448-7d886fdb4367
# ╠═71fe20f0-7aa3-11eb-179a-99bfc4165276
# ╠═12ff3820-7b78-11eb-0f2f-27f9776a33ef
# ╠═8d443ed0-7aa3-11eb-2888-0920888050e6
# ╠═ab3afdc0-7aa3-11eb-16ab-177c4031bfdd
# ╠═b78d7b60-7aa4-11eb-204f-cbc675fcd835
# ╠═70693e30-7aa5-11eb-0b7e-e553fd22275b
# ╠═9d4db480-7aa5-11eb-1a9e-21c7c6960b5f
# ╠═e6106a00-7aa5-11eb-275b-e97981411116
# ╠═81da4a60-7b7c-11eb-2ece-a73c0c7b4498
# ╠═6d60c900-7b7d-11eb-20c9-2f0d414e96e6
# ╠═c525a840-7b7d-11eb-1e4d-ab0e27dce733
# ╠═49ef6c30-7b80-11eb-1266-13c00983662e
# ╠═4f9ce470-7b7e-11eb-3fb7-4707db8ecee2
# ╠═837371e0-7b85-11eb-0f9c-dbb24f6f7ab3
# ╠═75126e50-7b7e-11eb-0a8f-332434b49591
