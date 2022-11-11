local lib = require('utils').lib

local M = {}

local function decimalline(val)
 local converted_decimal = tonumber(val, 16)
 local decimal_line = '(dec: ' .. tostring(converted_decimal) .. ') '

 if string.len(val) == 1 or
   converted_decimal == nil or
   tostring(converted_decimal) == val then
   decimal_line = ''
 end

 return decimal_line
end

-- only triggers with 2 characters, otherwise it annoyingly flashes
local function hexline(val)
 local converted_hex = lib.decimal_to_hex(val)
 local hex_line = '(hex: ' .. tostring(converted_hex) .. ') '

 if string.len(val) == 1 or
   converted_hex == '' then
   hex_line = ''
 end

 return hex_line
end

-- only triggers with 2 characters, otherwise it annoyingly flashes
local function hexbinaryline(val)
 local converted_binary = lib.hex_to_binary(val)
 local binary_line = '(hexbin: ' .. tostring(converted_binary) .. ') '

 if string.len(val) == 1 or -- only display between 2-8 characters
   string.len(val) > 8 or
   converted_binary == '' then
   binary_line = ''
 end

 return binary_line
end

-- only triggers with 2 characters, otherwise it annoyingly flashes
local function decbinaryline(val)
 local hex = lib.decimal_to_hex(val)
 local converted_binary = lib.hex_to_binary(hex)
 local binary_line = '(decbin: ' .. tostring(converted_binary) .. ') '

 if string.len(val) == 1 or -- only display between 2-8 characters
   string.len(val) > 8 or
   converted_binary == '' then
   binary_line = ''
 end

 return binary_line
end

function M.tabline()
 local core_line = '%F '
 local selection = lib.get_visual_selection()

  return core_line ..
  hexline(selection) ..
  hexbinaryline(selection) ..
  decimalline(selection) ..
  decbinaryline(selection)
end

return M
