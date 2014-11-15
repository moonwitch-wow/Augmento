local playerName = UnitName("player")
local playerSex = UnitSex("player")

local pronoun = {
["she"]     = playerSex == 3 and "she" or "he",
["her"]     = playerSex == 3 and "her" or "his",
["hers"]    = playerSex == 3 and "hers" or "his",
["herself"] = playerSex == 3 and "herself" or "himself",
}

local function FormatTargetName(target)
   if not target or target:len() == 0 then
      target = UnitName("target")
   else
      if string.utf8sub and string.utf8upper then
         local a = target:utf8sub(1, 1)
         local b = target:utf8sub(2)
         target = a:utf8upper() .. b:utf8lower()
      else
         local a = target:sub(1, 1)
         local b = target:sub(2)
         if a:byte() >= 192 then
            firstChar = a:sub(1, 2)
            remain = b:sub(3)
         end
         target = a:upper() .. b:lower()
      end
   end
   if target ~= playerName then
      return target
   end
end

local function emote(text, ...)
   if ... then
      text = text:format(...)
   end
   SendChatMessage(text, "EMOTE")
end

SLASH_DIAF1 = "/diaf"
SlashCmdList["DIAF"] = function(target)
   target = FormatTargetName(target)
   if target then
      emote("hopes %s dies in a fire.", target)
   else
      emote("hopes you all die in a fire.")
   end
end

SLASH_TOUCH1 = "/touch"
SlashCmdList["TOUCH"] = function(target)
   emote("touches %s inappropriately.", FormatTargetName(target) or pronoun["herself"])
end

SLASH_ROLLEYES1 = "/rolleyes"
SlashCmdList["ROLLEYES"] = function(target)
   target = FormatTargetName(target)
   if target then
      emote("rolls %s eyes at %s.", pronoun["her"], target)
   else
      emote("rolls %s eyes.", pronoun["her"])
   end
end

SLASH_SCOWL1 = "/scowl"
SlashCmdList["SCOWL"] = function(target)
   target = FormatTargetName(target)
   if target then
      emote("scowls darkly at %s.", target)
   else
      emote("scowls darkly.")
   end
end

SLASH_EVILEYE1 = "/evileye"
SlashCmdList["EVILEYE"] = function(target)
   target = FormatTargetName(target)
   if target then
      emote("gives %s the evil eye.", target)
   else
      emote("gives everyone around %s the evil eye.", pronoun["her"])
   end
end

SLASH_FONDLE1 = "/fondle"
SlashCmdList["FONDLE"] = function(target)
   emote("fondles %s.", FormatTargetName(target) or pronoun["herself"])
end

SLASH_CARESS1 = "/caress"
SlashCmdList["CARESS"] = function(target)
   emote("lovingly caresses %s.", FormatTargetName(target) or pronoun["herself"])
end

SLASH_PANTS1 = "/pants"
SlashCmdList["PANTS"] = function()
   if target then
      emote("puts %s hands in %s's pants.", pronoun["her"], target)
   else
      emote("puts %s hands in %s pants.", pronoun["her"], pronoun["her"])
   end
end