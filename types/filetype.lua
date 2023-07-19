---@alias FileTypeName string
---@alias FileTypeHandler fun(path: string, bufnr: integer): FileTypeName

---@class FileTypeOptions
---@field priority integer

---@class FileTypeSpec
---@field [1] FileTypeName | FileTypeHandler
---@field [2] FileTypeOptions

---@class FileTypeConfig
---@field extension table<string, FileTypeName | FileTypeHandler>
---@field filename table<string, FileTypeName | FileTypeHandler>
---@field pattern table<string, FileTypeName | FileTypeHandler | FileTypeSpec>
