lia.chat.register("dispatch", {
    color = Color(192, 57, 43),
    onCanSay = function(client)
        if not SCHEMA:isDispatch(client) then
            client:notifyLocalized("notAllowed")
            return false
        end
    end,
    onChatAdd = function(speaker, text) chat.AddText(Color(192, 57, 43), L("icFormat", "Dispatch", text)) end,
    prefix = {"/dispatch"}
})

lia.chat.register("request", {
    color = Color(210, 77, 87),
    onChatAdd = function(speaker, text) chat.AddText(Color(210, 77, 87), text) end,
    onCanHear = function(speaker, listener) return listener:isCombine() end
})
