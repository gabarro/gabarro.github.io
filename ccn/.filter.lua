function RawBlock(x)
	-- for latex output, unknown environments are passed through
	if FORMAT == "latex" then
		return pandoc.RawBlock(FORMAT, x.text)
	end

	-- for html output, the gallery environment is rendered in html
	if FORMAT == "html" then
		if x.text:match("^\\begin{gallery}\n") then
			o = ''
			o = o..'<div class="gallery" style="height:400px">\n'
			o = o..'<ul class="index">\n'
			for l in x.text:gmatch("\\galleryline{(.-)}") do
				o = o..'<li><a href="'..l..'">'..l..'<span>'..
				'<img src="'..l..'" /></span></a>\n'
				--io.stderr:write("L = "..l.."\n")
			end
			o = o..'</div>\n'
			return pandoc.RawBlock(FORMAT, o)
		end
	end
end
