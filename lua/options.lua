require "nvchad.options"

local o = vim.o

-- Hybrid line numbers: absolute on the cursor line, relative elsewhere
o.number = true
o.relativenumber = true

-- Same shapes as nvim's default, plus blinking in every mode
o.guicursor = "n-v-c-sm:block-blinkon500-blinkoff500,i-ci-ve:ver25-blinkon500-blinkoff500,r-cr-o:hor20-blinkon500-blinkoff500"
