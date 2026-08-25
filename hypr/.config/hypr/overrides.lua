-------------- Windows Customizations --------------
-- Make all steam windows floating accept main window
hl.window_rule({
  match = {
    class = "steam",
  },
  float = true
})

-- Set Steam to workspace 4
hl.window_rule({
  name = "steam",
  match = {
    class = "steam",
    title = "Steam"
  },
  tile = true,
  workspace = "4",
})

-- Set Heroic to workspace 4
hl.window_rule({
  name = "heroic",
  match = {
    class = "heroic",
  },
  tile = true,
  workspace = "4",
})

hl.window_rule({
  name = "gmail",
  match = {
    class = "(chrome-mail.google.com)(.*)"
  },
  workspace = "5"
})

hl.window_rule({
  name = "calendar",
  match = {
    class = "(chrome-calendar.google.com)(.*)"
  },
  workspace = "5"
})
-------------- Workspace Customizations --------------

hl.workspace_rule({ workspace = "4", monitor = "DP-1" })
hl.workspace_rule({ workspace = "5", monitor = "DP-1" })
hl.workspace_rule({ workspace = "6", monitor = "DP-1" })
