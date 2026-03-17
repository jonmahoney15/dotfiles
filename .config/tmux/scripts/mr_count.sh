#!/bin/bash

get_mr_count() {
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
            local count="$(glab mr list --assignee @me --state opened 2>/dev/null | grep -c "!" || echo "0")"
            if [ "$count" -gt 0 ]; then
                echo "MR:$count"
            fi
        fi
    else
        if command -v gh &>/dev/null; then
            local count="$(gh pr list --assignee "@me" --state open 2>/dev/null | wc -l | tr -d ' ')"
            if [ "$count" -gt 0 ]; then
                echo "MR:$count"
            fi
        fi
    fi
}

get_mr_count
