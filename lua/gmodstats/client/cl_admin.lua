net.Receive("gstatsAdmin", function ()
    local stats = net.ReadTable()
    PrintTable(stats)

    local adminFrame = vgui.Create("DFrame", nil)
    adminFrame:SetTitle(GMS_GetLanguage("admin_panel"))
    adminFrame:SetIcon("icon16/database_key.png")
    adminFrame:SetSize(960, 480)
    adminFrame:SetMinHeight(480)
    adminFrame:SetMinWidth(960)
    adminFrame:SetSizable(true)
    adminFrame:SetScreenLock(true)
    adminFrame:Center()
    adminFrame:MakePopup()

    local playerList = vgui.Create("DListView", adminFrame)
    playerList:Dock(FILL)
    playerList:SetMultiSelect(false)
    playerList:AddColumn(GMS_GetLanguage("admin_panel.player")):SetMinWidth(100)
    playerList:AddColumn(GMS_GetLanguage("admin_panel.connection")):SetFixedWidth(GMS_Size("1"))
    playerList:AddColumn(GMS_GetLanguage("admin_panel.kill")):SetFixedWidth(GMS_Size("2"))
    playerList:AddColumn(GMS_GetLanguage("admin_panel.death")):SetFixedWidth(GMS_Size("3"))
    playerList:AddColumn(GMS_GetLanguage("admin_panel.chat")):SetFixedWidth(GMS_Size("4"))
    playerList:AddColumn(GMS_GetLanguage("admin_panel.noclip")):SetFixedWidth(GMS_Size("5"))
    playerList:AddColumn(GMS_GetLanguage("admin_panel.physgun")):SetFixedWidth(GMS_Size("6"))
    playerList:AddColumn(GMS_GetLanguage("admin_panel.vehicle")):SetFixedWidth(GMS_Size("7"))

    for index, stat in ipairs(stats) do
        playerList:AddLine(stat.plyname, stat.chat, stat.connection, stat.kill, stat.death, stat.noclip, stat.physgun, stat.use_vehicle)
    end
end)