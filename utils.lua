local function get_visual_selection()
  local modeInfo = vim.api.nvim_get_mode()
  local mode = modeInfo.mode

  local cursor = vim.api.nvim_win_get_cursor(0)
  local cline, ccol = cursor[1], cursor[2]
  local vline, vcol = vim.fn.line('v'), vim.fn.col('v')

  local sline, scol
  local eline, ecol
  if cline == vline then
    if ccol <= vcol then
      sline, scol = cline, ccol
      eline, ecol = vline, vcol
      scol = scol + 1
    else
      sline, scol = vline, vcol
      eline, ecol = cline, ccol
      ecol = ecol + 1
    end
  elseif cline < vline then
    sline, scol = cline, ccol
    eline, ecol = vline, vcol
    scol = scol + 1
  else
    sline, scol = vline, vcol
    eline, ecol = cline, ccol
    ecol = ecol + 1
  end

  if mode == "V" or mode == "CTRL-V" or mode == "\22" then
    scol = 1
    ecol = nil
  end

  local lines = vim.api.nvim_buf_get_lines(0, sline - 1, eline, 0)
  if #lines == 0 then return end

  local startText, endText
  if #lines == 1 then
    startText = string.sub(lines[1], scol, ecol)
  else
    startText = string.sub(lines[1], scol)
    endText = string.sub(lines[#lines], 1, ecol)
  end

  local selection = {startText}
  if #lines > 2 then
    vim.list_extend(selection, vim.list_slice(lines, 2, #lines - 1))
  end
  table.insert(selection, endText)

  return table.concat(selection, '')
end

local function mod(a, b)
    return a - (math.floor(a/b)*b)
end

local function decimal_to_hex(val)
    local hexstr = "0123456789ABCDEF"
    local neg = false
    local num = tonumber(val)
    local result = ""

    if (not num) then return '' end
    if num == 0 then return '0' end

    if num < 0 then
        neg = true
        num = num * -1
    end

    while num > 0 do
        local n = mod(num, 16)
        result = string.sub(hexstr, n + 1, n + 1) .. result
        num = math.floor(num / 16)
    end

    if neg then result = '-' .. result end
    return result
end

local function hexchar_to_binary(str)
    str = string.upper(str)
    local map = {
      ['0'] = '0000',
      ['1'] = '0001',
      ['2'] = '0010',
      ['3'] = '0011',
      ['4'] = '0100',
      ['5'] = '0101',
      ['6'] = '0110',
      ['7'] = '0111',
      ['8'] = '1000',
      ['9'] = '1001',
      ['A'] = '1010',
      ['B'] = '1011',
      ['C'] = '1100',
      ['D'] = '1101',
      ['E'] = '1110',
      ['F'] = '1111',
    }
    local binary = str:gsub('[0-9A-F]', map)
    if binary == str then binary = '' end
    return binary
end

local function hex_to_binary(str)
  local hex = ''
  for i = 1, #str do
    local char = str:sub(i,i)
      hex = hex .. hexchar_to_binary(char) .. ' '
  end
  return hex:gsub('%s$', ''):gsub('%s+', ' ') -- whitespace removal
end

return {
  decimal_to_hex = decimal_to_hex,
  get_visual_selection = get_visual_selection,
  hex_to_binary = hex_to_binary,
  hexchar_to_binary = hexchar_to_binary,
}
