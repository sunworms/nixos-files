local M = {}

local journal_dir

if vim.fn.has("android") == 1 then
	journal_dir = vim.fn.expand("~/storage/documents/foldersync/journal")
else
	journal_dir = vim.fn.expand("~/Documents/gdrive/journal")
end

local CHECKBOX_EMPTY = "☐"
local CHECKBOX_DONE = "☒"

local function ensure_dir(dir)
	if vim.fn.isdirectory(dir) == 0 then
		vim.fn.mkdir(dir, "p")
	end
end

local function edit_file(path)
	vim.cmd("edit " .. vim.fn.fnameescape(path))
end

function M.journal(date)
	date = date or os.date("%Y-%m-%d")
	local y, m, d = date:match("(%d%d%d%d)%-(%d%d)%-(%d%d)")
	if not y or not m or not d then
		vim.notify("Invalid date format. Use YYYY-MM-DD", vim.log.levels.ERROR)
		return
	end

	local dir = string.format("%s/%s/%s", journal_dir, y, m)
	local file = string.format("%s/%s.typ", dir, date)

	ensure_dir(dir)

	if vim.fn.filereadable(file) == 0 then
		local timestamp = os.time({ year = tonumber(y), month = tonumber(m), day = tonumber(d), hour = 12 })
		local weekday = os.date("%A", timestamp)

		local template = {
			"= " .. weekday .. ", " .. date,
			"",
			"== Tasks",
			"",
			"- " .. CHECKBOX_EMPTY .. " ",
			"",
			"== Notes",
			"",
			"",
			"",
			"== Thoughts",
			"",
			"",
		}
		vim.fn.writefile(template, file)
	end

	edit_file(file)
end

function M.journal_relative(days)
	local then_time = os.time() + (days * 86400)
	M.journal(os.date("%Y-%m-%d", then_time))
end

function M.todo()
	local file = journal_dir .. "/todo.typ"
	if vim.fn.filereadable(file) == 0 then
		ensure_dir(journal_dir)
		vim.fn.writefile({ "= TODO", "", "== Important", "", "== Research", "", "== Personal", "", "" }, file)
	end
	edit_file(file)
end

function M.quicknote()
	local file = journal_dir .. "/quicknote.typ"
	if vim.fn.filereadable(file) == 0 then
		ensure_dir(journal_dir)
		vim.fn.writefile({ "= Quick Notes", "", "" }, file)
	end
	edit_file(file)
end

function M.toggle_todo()
	local line = vim.api.nvim_get_current_line()
	if line:find("^%s*-%s*" .. CHECKBOX_EMPTY) then
		vim.api.nvim_set_current_line((line:gsub(CHECKBOX_EMPTY, CHECKBOX_DONE, 1)))
	elseif line:find("^%s*-%s*" .. CHECKBOX_DONE) then
		vim.api.nvim_set_current_line((line:gsub(CHECKBOX_DONE, CHECKBOX_EMPTY, 1)))
	else
		vim.notify("Not a TODO line", vim.log.levels.WARN)
	end
end

function M.add_todo()
	local row = vim.api.nvim_win_get_cursor(0)[1]
	vim.api.nvim_buf_set_lines(0, row, row, false, { "- " .. CHECKBOX_EMPTY .. " " })
	-- CHECKBOX_EMPTY is a 3-byte UTF-8 char, so cursor lands after "- ☐ " (2 + 3 + 1 = 6 bytes)
	vim.api.nvim_win_set_cursor(0, { row + 1, 6 })
	vim.cmd("startinsert!")
end

function M.timestamp()
	local time_str = os.date("=== %H:%M")
	local row = vim.api.nvim_win_get_cursor(0)[1]
	vim.api.nvim_buf_set_lines(0, row, row, false, { time_str, "" })
	vim.api.nvim_win_set_cursor(0, { row + 1, 0 })
end

function M.grep(pattern)
	if not pattern or pattern == "" then
		vim.notify("Usage: JournalGrep pattern", vim.log.levels.ERROR)
		return
	end
	local files = vim.fn.glob(journal_dir .. "/**/*.typ", true, true)
	if #files == 0 then
		vim.notify("No journal files found", vim.log.levels.WARN)
		return
	end
	local escaped = vim.tbl_map(vim.fn.fnameescape, files)
	vim.cmd(string.format("vimgrep /%s/j %s", pattern:gsub("/", "\\/"), table.concat(escaped, " ")))
	vim.cmd("copen")
end

function M.vimgrep_pattern(pat)
	local files = vim.fn.glob(journal_dir .. "/**/*.typ", true, true)
	if #files == 0 then
		vim.notify("No journal files found", vim.log.levels.WARN)
		return
	end
	local escaped = vim.tbl_map(vim.fn.fnameescape, files)
	vim.cmd(string.format("vimgrep /%s/j %s", pat, table.concat(escaped, " ")))
	vim.cmd("copen")
end

function M.random()
	local files = vim.fn.glob(journal_dir .. "/????/??/????-??-??.typ", true, true)
	if #files == 0 then
		vim.notify("No journal entries found", vim.log.levels.WARN)
		return
	end
	math.randomseed(os.time())
	edit_file(files[math.random(#files)])
end

function M.setup()
	local cmd = vim.api.nvim_create_user_command

	cmd("Journal", function(opts)
		M.journal(opts.args ~= "" and opts.args or nil)
	end, { nargs = "?" })
	cmd("Today", function()
		M.journal()
	end, {})
	cmd("Yesterday", function()
		M.journal_relative(-1)
	end, {})
	cmd("Tomorrow", function()
		M.journal_relative(1)
	end, {})
	cmd("JournalNew", function()
		M.journal()
	end, {})
	cmd("JournalTodo", function()
		M.todo()
	end, {})
	cmd("JournalQuicknote", function()
		M.quicknote()
	end, {})
	cmd("JournalToggle", function()
		M.toggle_todo()
	end, {})
	cmd("JournalAddTodo", function()
		M.add_todo()
	end, {})
	cmd("JournalTimestamp", function()
		M.timestamp()
	end, {})
	cmd("JournalGrep", function(opts)
		M.grep(opts.args)
	end, { nargs = "+" })
	cmd("JournalTodos", function()
		M.vimgrep_pattern([[^\s*-\s*☐]])
	end, {})
	cmd("JournalDone", function()
		M.vimgrep_pattern([[^\s*-\s*☒]])
	end, {})
	cmd("JournalRandom", function()
		M.random()
	end, {})
end

return M
