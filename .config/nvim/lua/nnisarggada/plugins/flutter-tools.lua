-- import flutter-tools plugin safely
local setup, flutter_tools = pcall(require, "flutter-tools")
if not setup then
	return
end

-- configure/enable gitsigns
flutter_tools.setup()
