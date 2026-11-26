# Agent sandbox (safehouse)
# External sandbox replaces each agent's built-in permission/sandbox system.
# Layers: safe (stripped env) -> safekeys (+ API keys) -> per-agent function.
#
# Per-agent wrappers accept extra safehouse flags after a trailing `--`:
#   claude <agent args...> -- <safehouse flags...>
# Split is on the LAST `--` so the agent's own `--` (if any) still works.

set -gx SAFEHOUSE_APPEND_PROFILE "$HOME/.config/safehouse/local-overrides.sb"

function safe --description "Run a command under Safehouse sandbox"
    safehouse --enable=ssh,shell-init,gpg,playwright-chrome,chromium-headless \
        --append-profile="$SAFEHOUSE_APPEND_PROFILE" \
        --add-dirs="$HOME/Code:$HOME/Documents/Obsidian Vault" \
        --env-pass=DEVBOX_USE_VERSION \
        $argv
end

function safeenv --description "Run under Safehouse with full env passthrough"
    safe --env $argv
end

function safekeys --description "Run under Safehouse with only API keys passed"
    safe --env-pass=OPENAI_API_KEY,ANTHROPIC_API_KEY,GEMINI_API_KEY $argv
end

function __safehouse_split --no-scope-shadowing --description "Populate agent_args / safehouse_args from argv, splitting on last --"
    set -l last_idx 0
    set -l i 0
    for arg in $argv
        set i (math $i + 1)
        test "$arg" = --; and set last_idx $i
    end
    set agent_args
    set safehouse_args
    if test $last_idx -eq 0
        set agent_args $argv
        return
    end
    set -l n (count $argv)
    if test $last_idx -gt 1
        set agent_args $argv[1..(math $last_idx - 1)]
    end
    if test $last_idx -lt $n
        set safehouse_args $argv[(math $last_idx + 1)..-1]
    end
end

function __claude_has_subcommand --description "True if agent_args starts a claude subcommand (not the default chat)"
    set -l subs agents auth auto-mode doctor install mcp plugin plugins project setup-token ultrareview update upgrade
    for arg in $argv
        switch $arg
            case '-*'
                continue
            case '*'
                contains -- $arg $subs; and return 0
                return 1
        end
    end
    return 1
end

function claude --description "Run Claude Code in sandbox (permissions bypassed)"
    set -l agent_args
    set -l safehouse_args
    __safehouse_split $argv
    if __claude_has_subcommand $agent_args
        # Subcommands (agents, mcp, doctor, ...) ignore session flags and
        # `--permission-mode auto` suppresses their interactive views.
        safe $safehouse_args claude $agent_args
    else
        safe $safehouse_args claude --permission-mode auto --model opus $agent_args
    end
end

function codex --description "Run Codex in sandbox (approvals+sandbox bypassed)"
    set -l agent_args
    set -l safehouse_args
    __safehouse_split $argv
    safe $safehouse_args codex --no-daemon --dangerously-bypass-approvals-and-sandbox $agent_args
end

function opencode --description "Run openCode in sandbox (permissions bypassed)"
    set -lx OPENCODE_PERMISSION '{"*":"allow"}'
    set -l agent_args
    set -l safehouse_args
    __safehouse_split $argv
    safekeys $safehouse_args opencode $agent_args
end

function pi --description "Run PI in sandbox"
    set -l agent_args
    set -l safehouse_args
    __safehouse_split $argv
    safe $safehouse_args pi $agent_args
end
