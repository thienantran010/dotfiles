#!/bin/bash

dotfiles_dir="$HOME/dotfiles"

for file in "$dotfiles_dir"/.[[:alnum:]]*; do
	if [[ "$file" != "$dotfiles_dir/install.sh" ]] && [[ "$(basename "$file")" != ".git" ]]; then
		filename=$(basename "$file")
		target_file="$HOME/$filename"
		if ln -s "$file" "$target_file"; then
			echo "Created symbolic link for $filename"
		fi
	fi
done
