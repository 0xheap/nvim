#!/bin/bash
# Neovim Goinfre Manager (Simplified - No Cleanup)
# Manages Neovim data in goinfre (user-isolated by system)

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Paths
GOINFRE_BASE="/goinfre/$USER"
NVIM_DIRS=(
    "config:$HOME/.config/nvim:$GOINFRE_BASE/nvim-config"
    "share:$HOME/.local/share/nvim:$GOINFRE_BASE/nvim-share"
    "state:$HOME/.local/state/nvim:$GOINFRE_BASE/nvim-state"
    "cache:$HOME/.cache/nvim:$GOINFRE_BASE/nvim-cache"
)

# Function to print colored messages
print_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to setup goinfre directory
setup_goinfre() {
    print_info "Setting up goinfre directory..."
    
    # Create goinfre directory
    if [ ! -d "$GOINFRE_BASE" ]; then
        mkdir -p "$GOINFRE_BASE"
        chmod 700 "$GOINFRE_BASE"
        print_info "Created $GOINFRE_BASE"
    fi
    
    # Process each Neovim directory
    for dir_info in "${NVIM_DIRS[@]}"; do
        IFS=':' read -r name home_path goinfre_path <<< "$dir_info"
        
        # If home path exists and is not a symlink, move it
        if [ -d "$home_path" ] && [ ! -L "$home_path" ]; then
            print_info "Moving $name to goinfre..."
            mv "$home_path" "$goinfre_path"
            ln -s "$goinfre_path" "$home_path"
            print_info "Created symlink for $name"
        # If it doesn't exist, create directory in goinfre and symlink
        elif [ ! -e "$home_path" ]; then
            mkdir -p "$goinfre_path"
            mkdir -p "$(dirname "$home_path")"
            ln -s "$goinfre_path" "$home_path"
            print_info "Created $name in goinfre"
        # If it's already a symlink, ensure target exists
        elif [ -L "$home_path" ]; then
            if [ ! -d "$goinfre_path" ]; then
                mkdir -p "$goinfre_path"
                print_info "Restored missing $name directory"
            else
                print_info "$name already configured"
            fi
        fi
    done
    
    print_info "Setup complete!"
}

# Function to show status
show_status() {
    echo "=== Neovim Goinfre Status ==="
    echo
    
    if [ -d "$GOINFRE_BASE" ]; then
        echo -e "${GREEN}Goinfre directory:${NC} $GOINFRE_BASE"
        echo -n "Size: "
        du -sh "$GOINFRE_BASE" 2>/dev/null | awk '{print $1}'
    else
        echo -e "${YELLOW}Goinfre directory:${NC} Not found"
    fi
    
    echo
    echo "Symlinks status:"
    for dir_info in "${NVIM_DIRS[@]}"; do
        IFS=':' read -r name home_path goinfre_path <<< "$dir_info"
        if [ -L "$home_path" ]; then
            target=$(readlink "$home_path")
            echo -e "  ${GREEN}✓${NC} $name: $home_path -> $target"
        elif [ -d "$home_path" ]; then
            echo -e "  ${YELLOW}⚠${NC} $name: exists but not a symlink (run setup)"
        else
            echo -e "  ${RED}✗${NC} $name: not found"
        fi
    done
    
    echo
    echo "Disk usage:"
    df -h /home/$USER | tail -n 1 | awk '{print "  Home: " $3 " used of " $2 " (" $5 ")"}'
    df -h /goinfre | tail -n 1 | awk '{print "  Goinfre: " $3 " used of " $2 " (" $5 ")"}'
}

# Function to verify setup on login (silent)
verify_setup() {
    # Check if goinfre directories exist
    if [ ! -d "$GOINFRE_BASE" ]; then
        return
    fi
    
    # Ensure all symlinks are present (silently)
    for dir_info in "${NVIM_DIRS[@]}"; do
        IFS=':' read -r name home_path goinfre_path <<< "$dir_info"
        
        # If symlink is broken or missing, recreate it
        if [ -L "$home_path" ] && [ ! -d "$goinfre_path" ]; then
            mkdir -p "$goinfre_path" 2>/dev/null
        elif [ ! -L "$home_path" ] && [ -d "$goinfre_path" ]; then
            rm -rf "$home_path" 2>/dev/null
            ln -s "$goinfre_path" "$home_path" 2>/dev/null
        fi
    done
}

# Function to uninstall (move everything back to home)
uninstall() {
    print_warn "Moving Neovim data back to home directory..."
    
    for dir_info in "${NVIM_DIRS[@]}"; do
        IFS=':' read -r name home_path goinfre_path <<< "$dir_info"
        
        if [ -L "$home_path" ] && [ -d "$goinfre_path" ]; then
            rm "$home_path"
            mv "$goinfre_path" "$home_path"
            print_info "Moved $name back to home"
        fi
    done
    
    if [ -d "$GOINFRE_BASE" ]; then
        rmdir "$GOINFRE_BASE" 2>/dev/null
        print_info "Removed goinfre directory"
    fi
    
    print_info "Uninstall complete!"
}

# Main script
case "$1" in
    setup)
        setup_goinfre
        ;;
    status)
        show_status
        ;;
    verify)
        verify_setup
        ;;
    uninstall)
        uninstall
        ;;
    *)
        exit 1
        ;;
esac
