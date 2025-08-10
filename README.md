

* Install **Packer** (Neovim plugin manager)
* Create a minimal `init.lua` with LSP for Rust
* Install **rust-analyzer** via `rustup`

```bash
#!/usr/bin/env bash
set -e

# Install rust-analyzer via rustup
rustup component add rust-analyzer

# Install Packer if not already installed
PACKER_PATH="$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"
if [ ! -d "$PACKER_PATH" ]; then
    git clone --depth 1 https://github.com/wbthomason/packer.nvim "$PACKER_PATH"
fi

# Create Neovim config directory
mkdir -p ~/.config/nvim

# Write minimal init.lua
cat > ~/.config/nvim/init.lua << 'EOF'
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
end)

require('lspconfig').rust_analyzer.setup({})
EOF

echo "Setup complete."
echo "Now open Neovim and run :PackerInstall"
```

**Usage:**

1. Save this as `setup_rust_nvim.sh`
2. Make it executable:

```bash
chmod +x setup_rust_nvim.sh
```

3. Run it:

```bash
./setup_rust_nvim.sh
```

4. Open Neovim:

```bash
nvim
```

5. Inside Neovim, type:

```
:PackerInstall
```

6. Restart Neovim — Rust syntax checking should now be active.

