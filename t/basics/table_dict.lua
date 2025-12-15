-- 初始化表
local mytable = {}

-- 指定值
mytable[1] = "Lua"

-- 移除引用
-- mytable = nil
-- lua 垃圾回收会释放内存

print("mytable type is ", type(mytable))
-- mytable type is         table

-- alternatetable和mytable的是指同一个 table
local alternatetable = mytable


mytable[1] = "Lua"
mytable["wow"] = "修改前"
print("mytable 索引为 1 的元素是 ", mytable[1])
print("mytable 索引为 wow 的元素是 ", mytable["wow"])

print("alternatetable 索引为 1 的元素是 ", alternatetable[1])
print("alternatetable 索引为 wow 的元素是 ", alternatetable["wow"])

alternatetable["wow"] = "修改后"

print("mytable 索引为 wow 的元素是 ", mytable["wow"])

-- 释放变量
alternatetable = nil
print("alternatetable 是 ", alternatetable)
-- mytable 仍然可以访问
print("mytable 索引为 wow 的元素是 ", mytable["wow"])

mytable = nil
print("mytable 是 ", mytable)



local fruits = { "banana", "orange", "apple" }
-- 返回 table 连接后的字符串
print("链接后的字符串：", table.concat(fruits))
-- 链接后的字符串：        bananaorangeapple

-- 指定连接字符
print("连接后的字符串 ", table.concat(fruits, ", "))
-- 连接后的字符串  banana, orange, apple

-- 指定索引来连接 table
print("连接后的字符串 ", table.concat(fruits, ", ", 2, 3))
-- 连接后的字符串  orange, apple

-- 在末尾添加
table.insert(fruits, "mango")
print("索引为 4 的元素为 ", fruits[4])

-- 在索引为 2 的键处插入
table.insert(fruits, 2, "grapes")
print("索引为 2 的元素为 ", fruits[2])

print("最后一个元素为 ", fruits[5])
table.remove(fruits)
print("移除后最后一个元素为 ", fruits[5])



table.sort(fruits)
print("排序后")
for k, v in ipairs(fruits) do
    print(k, v)
end
-- 排序后
-- 1       apple
-- 2       banana
-- 3       grapes
-- 4       orange

print("get table max element")
local function table_maxn(t)
    local mn = nil
    for k, v in pairs(t) do -- 注意这里是pairs
        if mn == nil then
            mn = v
        end
        if mn < v then
            mn = v
        end
    end
    return mn
end

local function table_leng(t)
  local leng=0
  for k, v in pairs(t) do
    leng=leng+1
  end
  return leng;
end

local tbl = { [1] = 2, [2] = 6, [3] = 34, [26] = 5 }
print("tbl中最大值是：", table_maxn(tbl))
print("tbl 长度 ", table_leng(tbl))
-- get table max element
-- tbl中最大值是： 34
-- tbl 长度        4