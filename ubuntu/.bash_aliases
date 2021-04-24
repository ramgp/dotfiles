alias up='sudo apt update && sudo apt full-upgrade'
alias clu='echo "Cleaning Up" && sudo apt install -f && sudo apt -y autoremove && sudo apt -y autoclean && sudo apt -y clean'
alias old_kernels='dpkg -l | tail -n +6 | rg "linux-image-[0-9]+" | rg -Fv $(uname -r) | awk "{ print $2 }"'
