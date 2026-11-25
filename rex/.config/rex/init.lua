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

-- Projects (replaces rexinator) ---------------------------------------------
-- prefix g picks one, or: rex do project name=cme
-- Opens the session if it exists, else creates it. Tabs: { label, dir, cmd }.
-- dir is relative to root; cmd is typed into the shell (Ctrl-C drops you back to it).
local venv = "source .venv/bin/activate"
local projects = {
  { name = "cambrian", root = "~/smodi/cambrian", tabs = { { "main" } } },
  { name = "card-cutter", root = "~/smodi/projects/card-cutter",
    tabs = { { "card-cutter", "card-cutter" }, { "proj" } } },
  { name = "cardmirror", root = "~/smodi/projects/cardmirror/shreerammodi-cardmirror",
    tabs = { { "cardmirror" }, { "agent" }, { "server" } } },
  { name = "cme-payroll", root = "~/smodi/cme/payroll", tabs = { { "main", nil, venv } } },
  { name = "cme", root = "~/smodi/cme", tabs = {
    { "website", "cme-website" },
    { "claude", "cme-website" },
    { "server", "cme-website", "npm run dev" },
    { "design-system", "cme-design-system" },
  } },
  { name = "convergent", root = "~/smodi/convergent", tabs = { { "main" } } },
  { name = "debate-rankings", root = "~/smodi/projects/debate-rankings/debate-rankings",
    tabs = { { "main", nil, venv } } },
  { name = "dotfiles", root = "~/dotfiles", tabs = { { "dotfiles" } } },
  { name = "ebb", root = "~/smodi/projects/ebb", tabs = {
    { "ebb", "ebb" }, { "agent", "ebb" }, { "server", "ebb" }, { "docs", "ebb-docs" },
  } },
  { name = "glimpse", root = "~/smodi/projects/glimpse", tabs = { { "main" } } },
  { name = "notes", root = "~/smodi/notes", tabs = { { "editor", nil, "nvim" }, { "agent" } } },
}

local home = os.getenv("HOME")
local by_name, items = {}, {}
for _, p in ipairs(projects) do
  p.root = p.root:gsub("^~", home)
  by_name[p.name] = p
  items[#items + 1] = { id = p.name, subtitle = p.root:gsub("^" .. home, "~"), icon = "folder" }
end

local function go(session_id)
  -- ponytail: no client when run from the CLI without Remote Control; the session still opens.
  pcall(rex.client.queue, "session.select", { session_id = session_id })
end

rex.action{
  name = "project",
  title = "Open Project",
  args = { name = "string?" },
  run = function(ctx, args)
    local name = args.name or rex.ui.pick{ title = "Open project", items = items }
    if name == nil then return end
    local p = by_name[name] or error("unknown project: " .. name, 0)

    local list, err = rex.call("session.list")
    if err ~= nil then error(err, 0) end
    for _, s in ipairs(list.sessions or {}) do
      if s.label == p.name then return go(s.session_id) end
    end

    local windows = {}
    for i, t in ipairs(p.tabs) do
      windows[i] = {
        window_label = t[1],
        layout = rex.layout.block{
          flavor = "com.superlogical.terminal.shell",
          options = {
            cwd = t[2] and (p.root .. "/" .. t[2]) or p.root,
            initial_input = t[3] and (t[3] .. "\r") or nil,
          },
        },
      }
    end
    local s, cerr = rex.call("session.create", { label = p.name, initial_windows = windows })
    if cerr ~= nil then error(cerr, 0) end
    rex.call("session.attach", { session_id = s.session_id }) -- focus_window needs it
    rex.call("session.focus_window", { session_id = s.session_id, window_id = s.initial_windows[1].window_id })
    go(s.session_id)
    return { session_id = s.session_id }
  end,
}
rex.bind(P .. "g", "project")
