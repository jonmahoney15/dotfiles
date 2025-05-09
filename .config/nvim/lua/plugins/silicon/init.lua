return {
	"michaelrommel/nvim-silicon",
	event = "VeryLazy",
	cmd = "Silicon",
	main = "nvim-silicon",
	opts = {
		-- Configuration here, or leave empty to use defaults
		line_offset = function(args)
			return args.line1
		end,
    output = function()
	    return "/vagrant/download/screen-shots/" .. os.date("!%Y-%m-%dT%H-%M-%SZ") .. "_code.png"
	  end,
	}
}
