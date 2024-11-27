local ISSERVER = true
local spacing = 10
local tabwidth = 150

local NumTimesTrigger = 0
local lastTrigger = 0
local NumHeartBeat = 0

local lftTick = 0
local actionTick = 0
local npcTick = 0

function TextStrSplit(delimiter, subject)
    local delimiter, fields = delimiter or ":", {}
    local pattern = string.format("([^%s]+)", delimiter)
    string.gsub(subject, pattern, function(c) fields[table.getn(fields)+1] = c end)
    return unpack(fields)
end

function HeartBeat()
    if ISSERVER then
        SendChatMessage("|cBABABA00BOOPTHESNOOT|r", "CHANNEL", nil, 7)
    else
        SendChatMessage("|cBABABA00SNOOTTHEBOOP|r", "CHANNEL", nil, 7)
    end
end

-- PLAYER_FLAGS_CHANGED -- afk flags

mkToolbar = windget.window:CreateWindow("MKUTILS", 220, 36, true, true)
mkWindow = windget.window:CreateWindow("MKEvents", 200, 400)
mkToolbar["button"] = windget.widget:CreateWidget("Button", "mkButton", mkToolbar)
windget.widget:SkinButton(mkToolbar["button"], "Interface\\AddOns\\mk_wowtoools\\img\\mike.tga")
mkWindow:SetMinResize(320, 120)
-- mkWindow:SetMaxResize(160, 60)
mkToolbar:SetWidth(80)
mkToolbar:SetHeight(40)
mkToolbar["button"]:SetWidth(16)
mkToolbar["button"]:SetHeight(16)
mkToolbar["button"]:SetPoint("TOPLEFT", 10+(30*(1-1)), -10)
mkToolbar["button"]:SetScript("OnClick", function()
    -- mkWindow.input:AddMessage("|cff555555" .. date("%H:%M:%S") .. " boopsnoot ")
    if mkWindow.title:IsShown() then
        mkWindow:Hide()
        mkWindow.title:Hide()
      else
        mkWindow:Show()
        mkWindow.title:Show()
      end
end)
-- RegisterEvent("PLAYER_FLAGS_CHANGED")
mkWindow:RegisterAllEvents()
mkWindow:SetScript("OnEvent", function()
    local isreadyAction = false
    local isreadyLft = false
    local eventObj = {
        getglobal("arg8"), -- channel id
        getglobal("arg9"), -- base channel name
        getglobal("arg2"), -- users name
        getglobal("arg1"), -- text message
        getglobal("arg6"), -- specialflags
        getglobal("time") -- time of msg
    }
    if eventObj[1] == nil then eventObj[1] = -1 end
    if eventObj[2] == nil then eventObj[2] = "nil" end
    if eventObj[3] == nil then eventObj[3] = "nil" end
    if eventObj[4] == nil then eventObj[4] = "nil" end
    if eventObj[5] == nil then eventObj[5] = "nil" end
    if eventObj[1] == 0 then
        actionTick = (actionTick + 1)
        if actionTick <= 50 then
            actionTick = (actionTick + 1)
        else
            -- mkWindow.input:AddMessage("|ccff55555ACTIONTRIGGER|r")
            isreadyAction = true
        end
        if eventObj[3] == "Thomas Miller" then
            npcTick = (npcTick + 1)
            mkWindow.input:AddMessage("|cFF00FF00NPCTRIGGER ["..eventObj[3].."]")
        elseif eventObj[3] == "Topper McNabb" then
            npcTick = (npcTick + 1)
            mkWindow.input:AddMessage("|cFF00FF00NPCTRIGGER ["..eventObj[3].."]")
        elseif eventObj[3] == "Corbett Schneider" then
            npcTick = (npcTick + 1)
            mkWindow.input:AddMessage("|cFF00FF00NPCTRIGGER ["..eventObj[3].."]")
        elseif eventObj[3] == "Suzanne" then
            npcTick = (npcTick + 1)
            mkWindow.input:AddMessage("|cFF00FF00NPCTRIGGER ["..eventObj[3].."]")
        elseif eventObj[3] == "Lisan Pierce" then
            npcTick = (npcTick + 1)
            mkWindow.input:AddMessage("|cFF00FF00NPCTRIGGER ["..eventObj[3].."]")
        elseif eventObj[3] == "Tansy Sparkpen" then
            npcTick = (npcTick + 1)
            mkWindow.input:AddMessage("|cFF00FF00NPCTRIGGER ["..eventObj[3].."]")
        elseif eventObj[3] == "Lady Katrana Prestor" then
            npcTick = (npcTick + 1)
            mkWindow.input:AddMessage("|cFF00FF00NPCTRIGGER ["..eventObj[3].."]")
        else
            -- mkWindow.input:AddMessage("|cff555555" .. date("%H:%M:%S") .. " ".. eventObj[1] .." : "..eventObj[2] .." : "..eventObj[3] .." : "..eventObj[4] .." : "..eventObj[5] .." : |r")
        end        
    else
        if eventObj[1] == 1 then -- general
            -- mkWindow.input:AddMessage("|cff555555" .. date("%H:%M:%S") .. " ".. eventObj[1] .."|r |cBADA5500 "..eventObj[2] .."|r : "..eventObj[3] .." : "..eventObj[4] .." ")
        elseif eventObj[1] == 2 then -- trade
            -- mkWindow.input:AddMessage("|cff555555" .. date("%H:%M:%S") .. " ".. eventObj[1] .."|r |cFEFEF100 "..eventObj[2] .."|r : "..eventObj[3] .." : "..eventObj[4] .." ")
        elseif eventObj[1] == 3 then -- local defense
            -- mkWindow.input:AddMessage("|cff555555" .. date("%H:%M:%S") .. " ".. eventObj[1] .."|r |cFEFEF100 "..eventObj[2] .."|r : "..eventObj[3] .." : "..eventObj[4] .." ")
        elseif eventObj[1] == 4 then -- guild recruitment
            -- mkWindow.input:AddMessage("|cff555555" .. date("%H:%M:%S") .. " ".. eventObj[1] .."|r |cFEFEF100 "..eventObj[2] .."|r : "..eventObj[3] .." : "..eventObj[4] .." ")
        elseif eventObj[1] == 5 then -- world
            -- mkWindow.input:AddMessage("|cff555555" .. date("%H:%M:%S") .. " ".. eventObj[1] .."|r |c3FF3FF00 "..eventObj[2] .."|r : "..eventObj[3] .." : "..eventObj[4] .." ")
        elseif eventObj[1] == 6 then -- lft
            if lftTick <= 50 then
                lftTick = (lftTick + 1)
            else
                isreadyLft = true
            end
        elseif eventObj[1] == 7 then -- mktuils
            mkWindow.input:AddMessage("|cff555555" .. date("%H:%M:%S") .. " ".. eventObj[1] .."|r |cFEFEF100 "..eventObj[2] .."|r : "..eventObj[3] .." : "..eventObj[4] .." ")
        end
    end
    if npcTick > 0 then
        if actionTick >= 50 then
            if lftTick >= 50 then
                HeartBeat()
                actionTick = 0
                lftTick = 0
                npcTick = 0
            else
                mkWindow.input:AddMessage("|c4BB3BB00Processing Lft: ".. lftTick .."|r")      
            end
        else
            mkWindow.input:AddMessage("|c4BB3BB00Processing Actions: ".. actionTick .."|r")
            lftTick = 0        
        end
    else
        actionTick = 0
        lftTick = 0
    end
end)

mkWindow.input = windget.widget:CreateWidget("ScrollingMessageFrame", nil, mkWindow)
mkWindow.input:SetBackdropColor(0,0,0,.35)
mkWindow.input:SetPoint("TOPLEFT", mkWindow, "TOPLEFT", spacing, -spacing)
mkWindow.input:SetPoint("BOTTOMRIGHT", mkWindow, "BOTTOMRIGHT", -spacing, spacing)
mkWindow.input:SetFontObject(GameFontWhite)
mkWindow.input:SetFont(windget.fontmono, windget.fontsizemono, windget.fontopts)
mkWindow.input:SetMaxLines(150)
mkWindow.input:SetJustifyH("LEFT")
mkWindow.input:SetFading(false)

mkWindow.input:SetScript("OnHyperlinkClick", function()
  ShowUIPanel(ItemRefTooltip);
  -- ItemRefTooltip:SetOwner(UIParent, "ANCHOR_PRESERVE");
  ItemRefTooltip:SetFrameStrata("TOOLTIP")
  for num, text in ({ TextStrSplit(":", arg1) }) do
    if num ~= 1 then
      text = string.gsub(text, '⬥', ":")
      text = string.gsub(text, '⬦', "|")

      ItemRefTooltip:AddLine("|cff33ffccArgument " .. num -1 .. ":|r|cffffffff " .. text)
    else
      ItemRefTooltip:AddLine(text,1,1,0)
    end
  end

  ItemRefTooltip:Show()
end)