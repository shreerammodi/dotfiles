-- Rex config. Layers:
--   alt       -> skhd/yabai (OS windows, spaces), never used here
--   ctrl      -> panes: C-hjkl move, C-S-hjkl split
--   C-a       -> tmux-style prefix. tmux window = Rex tab.
-- Apply with: rex config reload   (or prefix r)

local P = "ctrl+a>"
local dirs = { h = "left", j = "down", k = "up", l = "right" }

-- Prefix basics -------------------------------------------------------------
rex.bind(P .. "ctrl+a", "pane.send_key", { key = "ctrl+a" })
rex.bind(P .. "ctrl+l", "com.superlogical.terminal.clear")
rex.bind(P .. "r", "client.config.reload")

-- Tabs (tmux windows) -------------------------------------------------------
rex.bind(P .. "c", "client.tab.new")
rex.bind(P .. "n", "client.tab.next")
rex.bind(P .. "p", "client.tab.previous")
rex.bind(P .. "ctrl+n", "client.tab.next") -- tmux-sensible
rex.bind(P .. "ctrl+p", "client.tab.previous") -- tmux-sensible
rex.bind(P .. "l", "client.tab.back")
rex.bind(P .. ",", "client.tab.rename")
rex.bind(P .. "shift+7", "client.tab.close") -- &
rex.bind(P .. "shift+1", "pane.move_to_new_tab") -- ! (break-pane)
for i = 1, 9 do
  rex.bind(P .. i, "client.tab.goto", { index = i }) -- base-index 1
end

-- Panes ---------------------------------------------------------------------
rex.bind(P .. "shift+5", "pane.split", { direction = "right" }) -- %
rex.bind(P .. "shift+'", "pane.split", { direction = "down" }) -- "
rex.bind(P .. "x", "pane.close")
rex.bind(P .. "z", "pane.zoom")
rex.bind(P .. "o", "pane.focus_next")
rex.bind(P .. ";", "pane.focus_back.in_tab")
for k, d in pairs(dirs) do
  rex.bind(P .. d, "pane.focus", { direction = d }) -- arrows
  rex.bind(P .. "shift+" .. k, "pane.move", { direction = d }) -- like skhd shift-alt-hjkl
end

-- Resize mode, like skhd alt-w: prefix w, then hjkl, = or e balances, Esc or w exits.
rex.mode("resize", { exclusive = true })
rex.bind(P .. "w", "client.mode.enter", { name = "resize" })
for k, d in pairs(dirs) do
  rex.bind("resize/" .. k, "pane.resize", { direction = d, amount = 3 })
end
rex.bind("resize/=", "pane.balance")
rex.bind("resize/e", "pane.balance")
rex.bind("resize/w", "client.mode.exit")

-- Sessions ------------------------------------------------------------------
rex.bind(P .. "s", "session.switch")
rex.bind(P .. "shift+s", "session.back") -- tmux L, moved: L now moves panes
rex.bind(P .. "shift+4", "session.rename") -- $
rex.bind(P .. "shift+9", "session.previous") -- (
rex.bind(P .. "shift+0", "session.next") -- )

-- Misc ----------------------------------------------------------------------
rex.bind(P .. "[", "pane.copy_mode.enter")
rex.bind(P .. "ctrl+e", "client.palette.toggle") -- stand-in for tmux-fzf

-- No prefix -----------------------------------------------------------------
-- C-hjkl moves between panes, unless nvim/vim/fzf is in front, in which case
-- the key goes through so nvim's smart-splits handles it.
-- ponytail: nvim can't hand off to Rex at its edge yet (smart-splits has no Rex backend).
local passthrough = { nvim = true, vim = true, fzf = true }

local function in_vim(ctx)
  local ok, p = pcall(rex.block.call, "com.superlogical.terminal", "process", { block_id = ctx.block_id })
  return ok and p and p.foreground and passthrough[p.foreground.name] or false
end

for k, d in pairs(dirs) do
  rex.bind("ctrl+" .. k, function(ctx)
    if in_vim(ctx) then return false end
    rex.client.queue("pane.focus", { direction = d })
    return true
  end)
  rex.bind("ctrl+shift+" .. k, "pane.split." .. d)
end
