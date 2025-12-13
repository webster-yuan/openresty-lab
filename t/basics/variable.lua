-- Lua 变量有三种类型：全局变量、局部变量、表中的域。

-- Lua 中的变量全是全局变量，哪怕是语句块或是函数里，除非用 local 显式声明为局部变量。

-- 局部变量的作用域为从声明位置开始到所在语句块结束。

-- 变量的默认值均为 nil

--[[
part2
]]
-- a = 5               -- 全局变量
-- local b = 5         -- 局部变量

-- function joke()
--     c = 5           -- 全局变量
--     local d = 6     -- 局部变量
-- end

-- -- 得明确的调用函数,才会执行,让变量声明生效
-- joke()
-- print(c,d)          --> 5 nil

-- do
--     local a = 6     -- 局部变量
--     b = 6           -- 对局部变量重新赋值
--     print(a,b);     --> 6 6
-- end

-- print(a,b)      --> 5 6

-- str1 = "hello".."world"

--[[
part3
]]
c = 10
a, b = 10, 2 * c -->       a=10; b=2*x
print(a, b)      --10      20

x = 10
y = 20
print(x, y) --10      20
x, y = y, x
print(x, y) --20      10

-- 按变量个数补足nil
x1, x2, x3 = 1, 2
print(x1, x2, x3) --1       2       nil
-- 多余的赋值会忽略
y1, y2 = 10, 20, 30
print(y1, y2) --10      20

--[[
part4: table索引
]]
site = {}
site["key"] = "val"
print(site["key"]) -- val
print(site.key)    -- val
