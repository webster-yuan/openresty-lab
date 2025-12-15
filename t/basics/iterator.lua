--[[
泛型for迭代器
]]
local array = { "Google", "Runoob" }

for key, value in ipairs(array) do
    print(key, value)
    --    1       Google
    --    2       Runoob
end

--[[
无状态的迭代器
]]
local function square(iteratorMaxCount, currentNumber)
    if currentNumber < iteratorMaxCount
    then
        currentNumber = currentNumber + 1
        return currentNumber, currentNumber * currentNumber
    end
end

for i, n in square, 3, 0
do
    print(i, n)
end
-- 1    1
-- 2    4
-- 3    9

print("---------------------")
--[[
自行实现一个ipars
]]
local function iter(a, i)
    i = i + 1
    local v = a[i]
    if v then
        return i, v
    end
end

local function myIpairs(a)
    return iter, a, 0
end

local myArray = { 1, 2, 3 }
for index, val in myIpairs(myArray) do
    print(index, val)
end
-- 1       1
-- 2       2
-- 3       3

print("---------------------------")

local myArray2 = { "Google", "Runoob" }

local function elementIterator(collection)
    local index = 0
    local count = #collection
    -- 闭包函数
    return function()
        index = index + 1
        if index <= count then
            --  返回迭代器的当前元素
            return collection[index]
        end
    end
end

for element in elementIterator(myArray2) do
    print(element)
end
-- Google
-- Runoob
