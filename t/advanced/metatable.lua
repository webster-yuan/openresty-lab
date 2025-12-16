local mytable = {}
local mymetatable = {}
setmetatable(mytable, mymetatable)    -- 把 mymetatable 设为 mytable 的元表

local mytable2 = setmetatable({}, {}) -- 设置{}表mytable2，并且设置{}为元表

-- __index 元方法
-- 通过键来访问 table 的时候，如果没有这个键，会寻找这个 table 的 metatable 中的 __index 键
-- 如果 __index 包含一个表格，会在这个表格中查找对应的键
local other = { foo = 3 }
local t = setmetatable({}, { __index = other }) -- 设置t的元表，元方法为 __index
print(t.foo)                                    --3
print(t.bar)                                    --nil
print(getmetatable(t))                          --table: 0000000000e3a280

--如果__index包含一个函数的话，Lua就会调用那个函数，table和键会作为参数传递给函数
local mytable3 = setmetatable({ key1 = "value1" }, {
    __index = function(mytable3, key)
        if key == "key2" then
            return "metatablevalue"
        else
            return nil
        end
    end
})
print(mytable3.key1, mytable3.key2) --value1  metatablevalue

print("----------__newindex---------")
----------- 对应元表
local a = {}
local b = setmetatable({ key1 = "value1" }, { __newindex = a })
print(b.key1)             --value1
b.newKey = "new value2"
print(b.newKey, a.newKey) --nil     new value2
b.key1 = "new value1"
print(b.key1, a.key1)     --new value1      nil

----------- 对应函数
local c = setmetatable({ key1 = "value1" }, {
    __newindex = function(c, key, value)
        rawset(c, key, "\"" .. value .. "\"") -- 函数设置新值到原表c中
    end
})
c.key1 = "value1"
c.key2 = "a"

print(c.key1, c.key2) -- value1  "a"
