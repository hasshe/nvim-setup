return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"mxsdev/nvim-dap-vscode-js",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local vscodejs = require("dap-vscode-js")

		dapui.setup()
		vscodejs.setup({
			debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
			adapters = { "pwa-node" },
		})

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
		vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<F5>", dap.continue, {})
		vim.keymap.set("n", "<F10>", dap.step_over, {})
		vim.keymap.set("n", "<F11>", dap.step_into, {})
		vim.keymap.set("n", "<F12>", dap.step_out, {})

		dap.configurations.typescript = {
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch TS (ts-node)",
				program = "${file}",
				cwd = "${workspaceFolder}",
				runtimeExecutable = "node",
				runtimeArgs = {
					"-r",
					"ts-node/register",
				},
				sourceMaps = true,
				skipFiles = { "<node_internals>/**" },
			},
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch compiled JS",
				program = "${workspaceFolder}/dist/index.js",
				cwd = "${workspaceFolder}",
				sourceMaps = true,
				outFiles = { "${workspaceFolder}/dist/**/*.js" },
				skipFiles = { "<node_internals>/**" },
			},
			{
				type = "pwa-node",
				request = "attach",
				name = "Attach to running Node",
				processId = require("dap.utils").pick_process,
				cwd = "${workspaceFolder}",
			},
		}

		-- Reuse same configs for JavaScript files
		dap.configurations.javascript = dap.configurations.typescript
	end,
}
