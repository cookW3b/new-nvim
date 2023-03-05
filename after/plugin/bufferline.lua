vim.opt.termguicolors = true

local bufferline = require('bufferline')
bufferline.setup{}
bufferline.separator_style = "thin"

vim.keymap.set('n', '<F1>', ':BufferLineCloseLeft<cr>')
vim.keymap.set('n', '<F2>', ':BufferLineCyclePrev<cr>')
vim.keymap.set('n', '<F3>', ':BufferLineCycleNext<cr>')
vim.keymap.set('n', '<F4>', ':BufferLineCloseRight<cr>')
vim.keymap.set('n', '<F5>', ':BufferLinePickClose<cr>')

-- You can change the appearance of the bufferline separators by setting the
-- `separator_style`. The available options are:
-- * `slant` - Use slanted/triangular separators
-- * `padded_slant` - Same as `slant` but with extra padding which some terminals require.
--   If `slant` does not render correctly for you try padded this instead.
-- * `slope` - Use slanted/triangular separators but slopped to the right
-- * `thick` - Increase the thickness of the separator characters
-- * `thin` - (default) Use thin separator characters
-- * finally you can pass in a custom list containing 2 characters which will be
--   used as the separators e.g. `{"|", "|"}`, the first is the left and the
--   second is the right separator
