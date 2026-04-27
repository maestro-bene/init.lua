return {
  "yetone/avante.nvim",
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  -- ⚠️ must add this setting! ! !
  build =
  "make BUILD_FROM_SOURCE=true",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  ---@module 'avante'
  ---@type avante.Config
  opts = {
    -- add any opts here
    -- this file can contain specific instructions for your project
    instructions_file = "avante.md",

    provider = "custom",
    mode = "legacy",
    providers = {
      custom = {
        __inherited_from = "openai",
        endpoint = vim.env.AI_API_URL,
        api_key_name = "AI_API_KEY",
        -- model = "deepseek-coder-v2-16b",
        -- model = "devstral-small-2-24b",
        -- model = "gemma3-12b",
        model = "gpt-oss-20b",
        -- model = "llama3.2-3b",
        -- model = "qwen2.5-coder-7b",

        is_disable_stream = function()
          return true
        end,

        parse_curl_args = function(opts, code_opts)
          return {
            url = opts.endpoint .. "/chat/completions",
            headers = {
              ["Content-Type"] = "application/json",
              ["Authorization"] = "Bearer " .. (os.getenv(opts.api_key_name) or ""),
            },
            body = {
              model = opts.model,
              messages = vim.list_extend(
                { { role = "system", content = opts.system_prompt } },
                code_opts.messages
              ),
              stream = false,
              temperature = 0,
              tool_choice = "none",
            },
          }
        end,

        parse_response_data = function(data, _, opts)
          -- data peut être déjà table ou string selon versions
          local payload = data
          if type(data) == "string" then
            local ok, decoded = pcall(vim.json.decode, data)
            if ok then payload = decoded end
          end

          if type(payload) ~= "table" then
            opts.on_complete(nil)
            return
          end

          -- 1) format wrapper observé: { action = "complete", data = "..." }
          if payload.action == "complete" and type(payload.data) == "string" then
            opts.on_chunk(payload.data)
            opts.on_complete(nil)
            return
          end

          -- 2) format OpenAI standard non-stream
          local msg = payload.choices
              and payload.choices[1]
              and payload.choices[1].message
              and payload.choices[1].message.content

          if type(msg) == "string" then
            opts.on_chunk(msg)
          end
          opts.on_complete(nil)
        end,
      },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
