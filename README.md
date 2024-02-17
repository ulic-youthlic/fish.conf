# fish.conf

Configuration file of fish.

> It used to be called `Dotfile-Fish`.

## Dependencies
1. `fisher`: the manager of fish plugins.
2. `fzf`
> NOTE: The configuration install fish plugin for `fzf` via `fisher`.  
> This means that there will be **NO ERROR** if there is **NO** `fisher` and if there are **BOTH** `fisher` and `fzf`, but there will be an **ERROR** if there is **ONLY** `fisher` and **NO** `fzf`.

## Usage

1. Clone this repo.
    ```bash
    $ git clone https://github.com/ulic-youthlic/fish.conf.git && cd fish.conf
    ```
2. Source it.
    ```bash
    $ chmod +x ./init.fish && ./init.fish
    ```
