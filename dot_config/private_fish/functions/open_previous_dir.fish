# This function saves the current directory on each directory change into a variable
# It is loaded on each fish startup, therefore new shells will open in the previous directory
# Source: https://superuser.com/a/1721923

function open_previous_dir --on-variable PWD
    set -U fish_most_recent_dir $PWD
end
