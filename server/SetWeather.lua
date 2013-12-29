-- Script to set the weather in the server console
-- Original Author, Jonathan Price
-- License can be found at https://github.com/pricetx/SetWeather/
-- Version: 0.3
class 'SetWeather'

function SetWeather:__init()
        -- Subscribe to console command "weather"
        Console:Subscribe("weather", self, self.ConsoleSet)
end

-- Run when user types "weather" in the console
function SetWeather:ConsoleSet(args)
        local weather = ""
        if string.len(args.text) == 0 or string.len(args.text) > 1 then
                print("Usage: Weather [0/1/2]")
                print("0 = Sunny | 1 = Raining | 2 = Storm")
                return
        end

        DefaultWorld:SetWeatherSeverity(tonumber(args.text))

        if tonumber(args.text) == 0 then
                weather = "Sunny"
        elseif tonumber(args.text) == 1 then
                weather = "Raining"
        elseif tonumber(args.text) == 2 then
                weather = "Storm"
        end
        print("Weather set to " .. weather)
end

-- Initialise the class
local run = SetWeather()
