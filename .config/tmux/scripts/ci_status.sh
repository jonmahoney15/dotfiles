#!/bin/bash

get_ci_status() {
    local git_dir="$(git rev-parse --git-dir 2>/dev/null)"
    if [ -z "$git_dir" ]; then
        echo ""
        return
    fi

    local remote_url="$(git remote get-url origin 2>/dev/null)"
    if [ -z "$remote_url" ]; then
        echo ""
        return
    fi

    if echo "$remote_url" | grep -q "gitlab"; then
        if command -v glab &>/dev/null; then
            local status="$(glab ci status 2>/dev/null | head -1)"
            case "$status" in
                *passed*|*success*) echo "CI:✓" ;;
                *failed*) echo "CI:✗" ;;
                *running*) echo "CI:◐" ;;
                *pending*) echo "CI:◑" ;;
                *) echo "CI:?" ;;
            esac
        else
            echo "no ci"
        fi
    else
        if command -v gh &>/dev/null; then
            local status="$(gh run view --status 2>/dev/null | head -1)"
            case "$status" in
                *passed*|*success*) echo "CI:✓" ;;
                *failed*) echo "CI:✗" ;;
                *in_progress*) echo "CI:◐" ;;
                *queued*) echo "CI:◑" ;;
                *) echo "CI:?" ;;
            esac
        else
            echo "no ci"
        fi
    fi
}

get_ci_status
