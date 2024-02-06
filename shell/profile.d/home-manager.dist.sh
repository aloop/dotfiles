if [ -e "${HOME}/.nix-profile/etc/profile.d/hm-session-vars.sh" ]; then
    . "${HOME}/.nix-profile/etc/profile.d/hm-session-vars.sh"
elif [ -e "${HOME}/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh" ]; then
    . "${HOME}/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh"
elif [ -e "/etc/profiles/per-user/${USER}/etc/profile.d/hm-session-vars.sh" ]; then
    . "/etc/profiles/per-user/${USER}/etc/profile.d/hm-session-vars.sh"
fi
