print("hello world")
-- 单行注释
print("hello webster")
--[[ 多行注释
]]
print("hello webster")

--[[
嵌套多行注释
]] --
-- 一般约定，以下划线开头连接一串大写字母的名字（比如 _VERSION）被保留用于 Lua 内部全局变量
local my_val = 10

-- 只要没有local修饰变量，默认是全局变量，落入全局表_G中
syg = 10

function foo()
    y = 5
    print(syg)
end

print(_G.syg, _G["y"]) -- 10      nil
foo()
print(_G.syg, _G["y"]) -- 10      5

y = 109
print(_G.syg, _G["y"]) -- 10      109
-- 循环打印_G全局表中的变量
for k, v in pairs(_G) do -- ipairs 只能扫连续数据段；_G 本质是哈希表（key 大多是字符串），ipairs 只从 1 到 #_G 连续数字下标扫，所以几乎扫不到东西。改成 pairs 即可看到全部全局变量
    print("-- 循环打印_G全局表中的变量")
    -- 会将全局表中的所有都打印出来，函数签名，全局变量；
    -- _G 里自带的东西：print、string、table、syg、y … 以及你刚才定义的 foo
    -- print(k, v)
end

-- 将变量赋值为nil，就相当于删除了这个变量
y=nil
print(_G.syg, _G["y"]) -- 10      nil
