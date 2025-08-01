{ pkgs, ... }:

{
  plugins.dap = {
    adapters.executables.coreclr = {
      command = "${pkgs.netcoredbg}/bin/netcoredbg";
      args = [ "--interpreter=vscode" ];
    };

    configurations.cs = [
      {
        type = "coreclr";
        name = "launch - netcoredbg";
        request = "launch";
        program.__raw = /*lua*/ ''
          function()
            return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
          end
        '';
      }
    ];
  };

  keymaps = [
    {
      mode = "n";
      key = "<F5>";
      action.__raw = /*lua*/ ''
        function()
          require('dap').continue()
        end
      '';
      options.desc = "Debug: Start/Continue";
    }
    {
      mode = "n";
      key = "<F1>";
      action.__raw = /*lua*/ ''
        function()
          require('dap').step_into()
        end
      '';
      options.desc = "Debug: Step Into";
    }
    {
      mode = "n";
      key = "<F2>";
      action.__raw = /*lua*/ ''
        function()
          require('dap').step_over()
        end
      '';
      options.desc = "Debug: Step Over";
    }
    {
      mode = "n";
      key = "<F3>";
      action.__raw = /*lua*/ ''
        function()
          require('dap').step_out()
        end
      '';
      options.desc = "Debug: Step Out";
    }
    {
      mode = "n";
      key = "<leader>b";
      action.__raw = /*lua*/ ''
        function()
          require('dap').toggle_breakpoint()
        end
      '';
      options.desc = "Debug: Toggle Breakpoint";
    }
    {
      mode = "n";
      key = "<leader>B";
      action.__raw = /*lua*/ ''
        function()
          require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
        end
      '';
      options.desc = "Debug: Set Breakpoint";
    }
  ];
}
