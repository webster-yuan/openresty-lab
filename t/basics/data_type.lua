-- Lua 是动态类型语言，变量不要类型定义,只需要为变量赋值。 值可以存储在变量中，作为参数传递或结果返回
-- print(type("Hello world"))      --> string
-- print(type(10.4*3))             --> number
-- print(type(print))              --> function
-- print(type(type))               --> function
-- print(type(true))               --> boolean
-- print(type(nil))                --> nil
-- print(type(type(X)))            --> string

-- -- 访问没有声明过的变量，默认值就是nil，不会报错
-- print(type(a)) -- nil

-- tab1={
--     key1 = "val1",
--     key2="val2"
-- }
-- for k,v in pairs(tab1) do
--     print(k .. "-" .. v)
-- end
-- -- key2-val2
-- -- key1-val1

-- tab1.key1 =nil
-- for k,v in pairs(tab1) do
--     print(k .. "-" .. v)
-- end
-- -- key2-val2

-- if type(type(nil)) == string then
--     print(type(type(nil)))
-- end

-- print(type(type(nil)))

--[[
boolean类型
]]
-- print(type(true))  -- boolean
-- print(type(false)) -- boolean
-- print(type(nil))   --nil

-- if false or nil then
--     print("true")
-- else
--     -- false 和 nil 都为 boolean 的 false
--     print("false")
-- end

-- if 0 then
--     -- 0 值在lua中是true
--     print("true")
-- else
--     print("false")
-- end

--[[
number 类型
]]
-- print(type(2)) -- number
-- print(type(2.2))
-- print(type(0.2))
-- print(type(2e+1))
-- print(type(0.2e-1))
-- print(type(7.8263692594256e-06))

--[[
string 类型
]]
-- string1 = "this is string1"
-- string2 = 'this is string2'
-- print(string1)
-- print(string2)

-- -- 也可以使用[[ str ]] 来表示 一块 字符串
-- html = [[
-- <html>
-- <head></head>
-- <body>
--     <a>webster</a>
-- </body>
-- </html>
-- ]]
-- print(html)
-- -- 在对数字字符串进行算数操作时,lua会尝试将这个数字字符串转换为一个数字
-- print("2"+6) -- 8
-- print("2"+"6")-- 8
-- print("2e2" * 6) -- 1200.0
-- -- print("a" + 1) -- error

-- len_str = "123456"
-- print(#len_str) -- 6

--[[
table(表)
]]
-- 创建一个空的table表
-- local table1 = {}
-- local table2 = { "apple", "pear" }

-- -- table是一个关联数组
-- table1[1] = "1"
-- table1[2] = "1"
-- table1[3] = "1"
-- for k, v in ipairs(table1) do -- ipairs 只能扫连续数据段；_G
--     print(k, v)
--     -- 1       1  说明lua语言中数组的索引是从1开始的,不是从0开始的
--     -- 2       1
--     -- 3       1
-- end

-- -- table 不会固定长度大小，有新数据添加时 table 长度会自动增长，没初始的 table 都是 nil
-- a3 = {}
-- for i = 1, 10 do
--     a3[i] = i
-- end
-- a3["key"] = "val"
-- print(a3["key"])  -- val
-- print(a3["none"]) -- nil

--[[
function 函数
]]
function func1(n)
    if n == 1 then
        return 1
    else
        return n
    end
end

print(func1(1)) --1
print(func1(2)) --2
-- function 可以以匿名函数的方式通过参数传递
table3 = {key1="val1",key2="val2"}
function testFun(tab, func)
    for k,v in pairs(tab)do
        print(func(k,v))
    end    
end

testFun(table3, function (key,val)
    return key.."="..val
end)