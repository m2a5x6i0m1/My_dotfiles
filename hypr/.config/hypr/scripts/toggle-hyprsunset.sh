#!/usr/bin/env bash


if [ -z "$XDG_RUNTIME_DIR" ]; then
	export XDG_RUNTIME_DIR="/run/user/$(id -u)"
fi

export STATUS_FILE="$XDG_RUNTIME_DIR/hyprsunset.status"

enable_sunset() {
	printf "true" >"$STATUS_FILE"

  hyprctl hyprsunset temperature 2500
}

disable_sunset() {
	printf "false" >"$STATUS_FILE"

  hyprctl hyprsunset temperature 3500
}

if ! [ -f "$STATUS_FILE" ]; then
	enable_sunset
else
	if [ "$(cat "$STATUS_FILE")" = "true" ]; then
		disable_sunset
	elif [ "$(cat "$STATUS_FILE")" = "false" ]; then
		enable_sunset
	fi
fi
