function upd
 pushd /home/saik/nixos;
 git add -A && git commit -m "Updating" && git push;
 echo "Writing to /etc/nixos";
 cd /etc/nixos && sudo -E git pull && sudo nixos-rebuild switch --flake /etc/nixos#default;
 echo "Updated"
 popd;
end
