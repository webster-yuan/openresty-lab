-- 文件名为 module.lua
-- 定义一个名为 module 的模块
module = {}
 
-- 定义一个常量
module.constant = "It`s a constant"
 
-- 定义一个函数
function module.func1()
    io.write("这是一个公有函数！\n")
end
 
local function func2()
    print("this is a private function")
end
 
function module.func3()
    func2()
end

return module

-- package.path LUA_PATH
-- C 库加载机制
-- https://www.runoob.com/lua/lua-modules-packages.html