-- rw_status.lua
-- Sends a looping variable status (0 to 10) every second via GCS text

local counter = 0
local max_value = 10

function update()
    counter = counter + 1
    if counter > max_value then
        counter = 0
    end

    local message = string.format("RW STATUS VAR: %d", counter)
    gcs:send_text(6, message)  -- 6 = MAV_SEVERITY_INFO

    return update, 1000  -- Repeat every 1000ms
end

return update()
