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
                format = {
                  settings = {
                    url = "/home/vagrant/dotfiles/.config/nvim/lua/plugins/java/eclipse-java-google-style.xml",
                    profile = "GoogleStyle",
                  },
                },
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
