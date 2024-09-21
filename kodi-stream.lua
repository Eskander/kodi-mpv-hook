-- kodi-stream.lua
-- Parse Kodi streaming URLs with 'protocol options' when using MPV as an External Player.
-- Source: https://github.com/Eskander/mpv-kodi-stream

local mp = require 'mp'

-- Decode URL-encoded strings
function url_decode(str)
    -- Replace `+` with space, then decode %xx encoded characters
    str = str:gsub("%+", " ")
    return str:gsub("%%(%x%x)", function(hex)
        return string.char(tonumber(hex, 16))
    end)
end

-- Parse the extra data
function parse_extra_data(extra_data)
    local params = {}
    for key, value in string.gmatch(extra_data, "([^&]+)=([^&]+)") do
        params[url_decode(key)] = url_decode(value)
    end
    return params
end

-- Modify the URL and apply extra parameters
function modify_url(url)
    -- Find the position of '|'
    local pipe_position = string.find(url, "|")
    local modified_url = url
    local extra_data = nil
    
    if pipe_position then
        -- Truncate the URL at the '|' position
        modified_url = string.sub(url, 1, pipe_position - 1)
        -- Get the part after the '|'
        extra_data = string.sub(url, pipe_position + 1)
    end

    -- If there's extra data, parse it
    if extra_data then
        local params = parse_extra_data(extra_data)

        -- Apply headers
        if params["User-Agent"] then
            mp.set_property("options/user-agent", params["User-Agent"])
            mp.msg.info("Setting User-Agent: " .. params["User-Agent"])
        end
        
        if params["Referer"] then
            mp.set_property("options/referer", params["Referer"])
            mp.msg.info("Setting Referer: " .. params["Referer"])
        end
        
        if params["Origin"] then
            local headers = string.format("Origin: %s", params["Origin"])
            mp.set_property("options/http-header-fields", headers)
            mp.msg.info("Setting Origin: " .. params["Origin"])
        end
    end

    return modified_url
end

-- Hook into 'on_load' event to intercept the URL
mp.add_hook("on_load", 50, function()
    -- Get the original URL
    local original_url = mp.get_property("path")
    
    -- Modify the URL and apply headers
    local modified_url = modify_url(original_url)
    
    if modified_url ~= original_url then
        -- Print the original and modified URLs for debugging
        mp.msg.info("Original URL: " .. original_url)
        mp.msg.info("Modified URL: " .. modified_url)
        
        -- Reload the file with the modified URL
        mp.commandv("loadfile", modified_url, "replace")
    end
end)
