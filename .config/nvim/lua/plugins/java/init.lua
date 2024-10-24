return {
  "nvim-java/nvim-java",
  config = false,
  dependencies = {
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          jdtls = {
            settings = {
              java = {
                configuration = {
                  runtimes = {
                    {
                      name = "Java-17",
                      path = "/home/vagrant/.sdkman/candidates/java/current",
                    },
                  },
                },
              },
            },
          },
        },
        setup = {
          jdtls = function()
            require("java").setup({
              root_markers = {
                "pom.xml",
              },
            })
          end,
        },
      },
    },
  },
}
