# Isolate

## Installation

* Using [Pathogen](https://github.com/tpope/vim-pathogen), run the following commands:

        % git clone https://github.com/ferranpm/vim-isolate ~/.vim/bundle/isolate

## Usage

call `:[range]Isolation` to edit part of a file on a new buffer. When finished,
call `:Isolation` to merge the edited part with the file
Recommended mapping

    nnoremap <leader>i vap \| :Isolation<cr>
    vnoremap <leader>i :Isolation<cr>

## Demo
Not Updated to show toggling or explicit ranges (`:n,N Isolation`)
[![asciicast](https://asciinema.org/a/18400.png)](https://asciinema.org/a/18400)
