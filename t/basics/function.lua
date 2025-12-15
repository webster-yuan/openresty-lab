local function maxNum(num1, num2)
    local result = -1
    if (num1 > num2) then
        result = num1
    else
        result = num2
    end
    return result
end

print("max num is", maxNum(10, 20))

local myPrint = function(param)
    print("It`s print function- ##", param, "##")
end

local function add(num1, num2, functionPrint)
    local result = num1 + num2
    functionPrint(result)
end

myPrint(10)
add(2, 5, myPrint)

local function maximum(a)
    local mi = 1
    local m = a[mi]
    for i, val in ipairs(a) do
        if val > m then
            mi = i
            m = val
        end
    end
    return m, mi
end
print(maximum({ 8, 10, 23, 12, 5 }))

--[[
函数：可变参数
]]
local function average(...)     -- 这个函数可以接收任意数量的实参
    local result = 0
    local args = { ... }        -- 把可变参数捕获到一个真正的args表里面
    for i, v in ipairs(args) do -- ipairs遍历表
        result = result + v
    end
    print("total sum is " .. result .. " len is " .. #args) -- #求表长度
    print("total num is " .. select("#", ...))              -- 返回可变参数的长度
    return result / #args
end
print("average is ", average(1, 2, 3, 4, 5))

--[[
函数：固定参数+可变参数
    固定参数必须写在可变参数之前
]]
local function fwrite(fmt, ...)
    return io.write(string.format(fmt, ...))
end

fwrite("run\n")
fwrite("%d%d\n", 1, 2)

local function f(...)
    local a = select(3, ...) -- > select(3, ...) 用于返回从起点 n 开始到结束位置的所有参数列表;
    -- > 把它赋给一个变量时，Lua 只保留第一个返回值，其余被丢弃,“多重赋值截断”规则
    print(a)                 -- 2
    print(select(3, ...))
end

f(0, 1, 2, 3, 4, 5) -- 2       3       4       5

print("---------------------")
do
    local function foo(...)
        for i = 1, select("#", ...) do
            local arg = select(i, ...)
            print(arg)
        end
    end
    foo(1, 2, 3, 4)
end
