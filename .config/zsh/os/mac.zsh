plugins+=(
	brew
	macos
)

export VISUAL=gvim
export PATH="/opt/homebrew/opt/llvm@15/bin:$PATH" \
export CLANGD_FLAGS=--enable-config
