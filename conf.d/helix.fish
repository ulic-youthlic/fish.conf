if command -q hx
    set -gx EDITOR hx
else if command -q helix
    set -gx EDITOR helix
end
