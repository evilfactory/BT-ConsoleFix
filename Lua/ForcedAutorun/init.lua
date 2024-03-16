if CLIENT then return end

LuaUserData.RegisterType('System.Console')

local Console = LuaUserData.CreateStatic('System.Console')
Hook.Patch('System.Console', 'get_IsOutputRedirected', function(self, ptable)
    ptable.PreventExecution = true
    return true
end)

Hook.Patch('System.Console', 'get_IsInputRedirected', function(self, ptable)
    ptable.PreventExecution = false
    return true
end)

Hook.Add('think', 'ConsoleInput', function()
    if Console.KeyAvailable then
        Game.ExecuteCommand(Console.ReadLine())
    end
end)