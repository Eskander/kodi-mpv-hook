local mp = require 'mp'

-- Modify the URL by removing everything after the '|' character
function modify_url(url)
    -- Find the position of '|'
    local pipe_position = string.find(url, "|")
    
    if pipe_position then
        -- If '|' character exists, truncate the URL at that position
        return string.sub(url, 1, pipe_position - 1)
    else
        -- If no '|' is found, return the URL unchanged
        return url
    end
end

-- Hook into 'on_load' event to intercept the URL
mp.add_hook("on_load", 50, function()
    -- Get the original URL
    local original_url = mp.get_property("path")
    
    -- Modify the URL
    local modified_url = modify_url(original_url)
    
    -- Set the new URL for playback
    mp.set_property("path", modified_url)
    
    -- Print the original and modified URLs for debugging
    mp.msg.info("Original URL: " .. original_url)
    mp.msg.info("Modified URL: " .. modified_url)
end)
