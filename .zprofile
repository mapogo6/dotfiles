if [ -f "$HOME/.profile" ]; then
	source .profile
fi

if [ -d /opt/homebrew ]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi
