#!/bin/bash
# Install recommended font with ligatures support

echo "Installing JetBrains Mono Nerd Font (recommended for ligatures)..."

if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Please install Homebrew first:"
    echo "/bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
    exit 1
fi

# Tap the fonts cask
brew tap homebrew/cask-fonts

# Install JetBrains Mono Nerd Font (has great ligatures)
echo "Installing font..."
brew install --cask font-jetbrains-mono-nerd-font

echo ""
echo "✅ Font installed successfully!"
echo ""
echo "📝 Next steps:"
echo "1. Open your terminal settings"
echo "2. Change the font to 'JetBrainsMono Nerd Font'"
echo "3. Enable ligatures in your terminal settings (if available)"
echo ""
echo "For iTerm2:"
echo "  - Preferences → Profiles → Text → Font → JetBrainsMono Nerd Font"
echo "  - Check 'Use ligatures'"
echo ""
echo "For macOS Terminal:"
echo "  - Preferences → Profiles → Text → Font → Change → JetBrainsMono Nerd Font"
echo ""
echo "For Alacritty, add to ~/.config/alacritty/alacritty.yml:"
echo "  font:"
echo "    normal:"
echo "      family: JetBrainsMono Nerd Font"
echo "      style: Regular"
echo ""
echo "After changing your terminal font, restart Neovim to see the changes!"
