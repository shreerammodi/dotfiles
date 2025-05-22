local function toggleApp(appName)
	-- try to get the running app
	local app = hs.application.get(appName)
	if app and app:isFrontmost() then
		-- if it’s already frontmost, hide it
		app:hide()
	else
		-- otherwise, launch it (or focus it if already running)
		hs.application.launchOrFocus(appName)
	end
end

hs.hotkey.bind({ "alt" }, "R", function()
	toggleApp("Firefox")
end)

hs.hotkey.bind({ "alt" }, "T", function()
	toggleApp("Kitty")
end)

hs.hotkey.bind({ "alt" }, "V", function()
	toggleApp("Microsoft Word")
end)

hs.hotkey.bind({ "alt" }, "X", function()
	toggleApp("Microsoft Excel")
end)

hs.hotkey.bind({ "alt" }, "D", function()
	toggleApp("Discord")
end)

hs.hotkey.bind({ "alt" }, "S", function()
	toggleApp("Slack")
end)

hs.hotkey.bind({ "alt" }, "Z", function()
	toggleApp("Zotero")
end)

hs.hotkey.bind({ "alt" }, "G", function()
	toggleApp("Emacs")
end)
