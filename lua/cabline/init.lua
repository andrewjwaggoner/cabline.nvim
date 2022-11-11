local lib = require('../utils')

local function get_dec_line(val)
  local converted_decimal = tonumber(val, 16)
  local dec_line = '(dec: ' .. tostring(converted_decimal) .. ') '

  if string.len(val) == 1 or
    converted_decimal == nil or
    tostring(converted_decimal) == val then
    dec_line = ''
  end

  return dec_line
end

-- only triggers with 2 characters, otherwise it annoyingly flashes
local function get_decbin_line(val)
 local hex = lib.decimal_to_hex(val)
 local converted_binary = lib.hex_to_binary(hex)
 local binary_line = '(decbin: ' .. tostring(converted_binary) .. ') '

 if string.len(val) < 2 or -- only display between 2-8 characters
   string.len(val) > 8 or
   converted_binary == '' then
   binary_line = ''
 end

 return binary_line
end

-- only triggers with 2 characters, otherwise it annoyingly flashes
local function get_hex_line(val)
  local converted_hex = lib.decimal_to_hex(val)
  local hex_line = '(hex: ' .. tostring(converted_hex) .. ') '

  if string.len(val) < 2 or
    converted_hex == '' then
    hex_line = ''
  end

  return hex_line
end

-- only triggers with 2 characters, otherwise it annoyingly flashes
local function get_hexbin_line(val)
  local converted_binary = lib.hex_to_binary(val)
  local binary_line = '(hexbin: ' .. tostring(converted_binary) .. ') '

  if string.len(val) < 2 or -- only display between 2-8 characters
    string.len(val) > 8 or
    converted_binary == '' then
    binary_line = ''
  end

  return binary_line
end

local function tabline()
 local core_line = '%F '
 local selection = lib.get_visual_selection()

  return core_line ..
  get_hex_line(selection) ..
  get_hexbin_line(selection) ..
  get_dec_line(selection) ..
  get_decbin_line(selection)
end

local function setup(options)
end

return {
  setup = setup,
  tabline = tabline
}
