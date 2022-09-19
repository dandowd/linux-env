local M = {
  settings = {
    yaml = {
      format = {
        enable = true
      },
      customTags = {
        "!GetAtt",
        "!Sub"
      },
      schemas = require("schemastore").json.schemas()
    }
  }
}

return M;
