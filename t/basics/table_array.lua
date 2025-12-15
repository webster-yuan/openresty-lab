local myArray = { 1, 2, 3, 4, 5 }
print(myArray[2])
print(myArray[-1]) -- nil
print(myArray[-2]) -- nil
print(myArray[0])  -- nil
-- 数组（table）只有一种下标：正整数 1,2,3…

print("len of myArray is ", #myArray)

-- 添加新元素到数组末尾
print("add element")
myArray[#myArray + 1] = 60
for i = 1, #myArray do
    print(myArray[i])
end

-- 删除index下的元素
print("remove element")
table.remove(myArray, #myArray) -- 注意此时myArray[#myArray] = 60 

for i = 1, #myArray do
    print(myArray[i])
end


print("-------------")
local array = {}

for i = -2, 2 do
    array[i] = i * 2
end

for i = -2, 2 do
    print(array[i])
end
-- 说明了 Lua 的 table 是“通用哈希表”而不是“纯数组”
-- 长度运算符 # 只统计“从 1 开始【连续整数键】 ”有多少个
-- Lua 的 table 同时扮演“数组”和“哈希表”，负索引只是普通键，不会自动映射到“倒数第几个元素”

-- 多维数组
-- 初始化数组
array = {}
for i=1,3 do
   array[i] = {}
      for j=1,3 do
         array[i][j] = i*j
      end
end

-- 访问数组
for i=1,3 do
   for j=1,3 do
      print(array[i][j])
   end
end