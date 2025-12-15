local str1 = 'This is a string.'
local str2 = "This is also a string."

local str = "Hello, "
str = str .. "World!" -- 创建一个新的字符串并将其赋值给str
print(str)            -- 输出 "Hello, World!"

local multilineString = [[
This is a multiline string.
It can contain multiple lines of text.
No need for escape characters.
]]

print(multilineString)

local str3 = "lua"
print("\" str3 is \"", str3) -- " str3 is "     lua
local string2 = 'runoob.com'
print("字符串 2 是", string2) -- 字符串 2 是    runoob.com

local string3 = [["Lua 教程"]]
print("字符串 3 是", string3) -- 字符串 3 是    "Lua 教程"

print("----------------------------------")
print("get en str uses string.len")
print("get cn str uses utf8.len")
local string4 = "webster"
local lengthEN = string.len(string4)
print(lengthEN)
-- 这里需要注意文件的保存格式，需要是utf8保存的，win系统一般默认是gbk格式
local string5 = "韦伯斯特"
local lengthCN = utf8.len(string5)
print(lengthCN)

-- string包的内置函数用法
local lowerStr = "abcd"
print("upper str is " .. string.upper(lowerStr))

local upperStr = "ABCD"
print("lower str is " .. string.lower(lowerStr))

print("replace str function is string.gsub(), " .. string.gsub("aaaa", "a", "z", 3))
-- args of function : mainString,findString,replaceString,num 替换次数
-- replace str function is string.gsub(), zzza

print("find subStr function is string.find(), " .. string.find("Hello Lua user", "Lua", 1))
-- find subStr function is string.find(), 7 -- 注： 多个值赋值给到一个值，后续的值被截断
local startIndex, endIndex = string.find("Hello Lua user", "Lua", 1)
print(startIndex, endIndex) -- 7       9

-- str, substr, [init, [plain]]
-- 在一个指定的目标字符串 str 中搜索指定的内容 substr，如果找到了一个匹配的子串，就会返回这个子串的起始索引和结束索引，不存在则返回 nil。
-- init 指定了搜索的起始位置，默认为 1，可以一个负数，表示从后往前数的字符个数。
-- plain 表示是否使用简单模式，默认为 false，true 只做简单的查找子串的操作，false 表示使用使用正则模式匹配。

print("reverse string function is string.reverse " .. string.reverse("lua"))
-- reverse string function is string.reverse aul

print("format string function is string.format " .. string.format("the value is:%d", 4))
-- format string function is string.format the value is:4

-- print("char 将整型数字转成字符并连接， byte 转换字符为整数值(可以指定某个字符，默认第一个字符)。")
print("string.char", string.char(97, 98, 99, 100)) -- string.char     abcd
print("string.byte", string.byte("ABCD", 3))       -- string.byte     67 指定第3个字符进行转码

print("len string is ", string.len("abc"))         --len string is   3

print("repeat string is ", string.rep("abc", 2))   --repeat string is        abcabc

print("connect strs is ", "hello" .. "webster") --connect strs is         hellowebster

-- %a 表示“任意字母; + 表示“前一个字符的 1 次或多次重复” 模式 "%a+" 匹配一个完整的单词（连续字母序列）
-- gmatch 不会一次性返回整张表，而是返回一个迭代器函数；
-- 每次调用它，就给出下一个匹配，直到没有更多匹配时返回 nil，循环结束
-- | 迭代次数 | 匹配到的子串 | 输出    |
-- | ---- | ------ | ----- |
-- | 1    | hello  | hello |
-- | 2    | lua    | lua   |
-- | 3    | user   | user  |

for word in string.gmatch("hello lua user ", "%a+") do
    print(word)
end
-- hello
-- lua
-- user

-- | 符号       | 含义           |
-- | -------- | ------------ |
-- | `.`      | 任意字符         |
-- | `%a`     | 字母           |
-- | `%d`     | 数字           |
-- | `%w`     | 字母+数字+下划线    |
-- | `%s`     | 空白字符         |
-- | `%S`     | 非空白          |
-- | `+`      | 1 次或多次       |
-- | `*`      | 0 次或多次       |
-- | `-`      | 0 次或多次（最短匹配） |
-- | `?`      | 0 或 1 次      |
-- | `[^set]` | 补集           |
-- | `(pat)`  | 捕获组          |

for word in string.gmatch("hello lua user ", "%S+") do -- 表示连续的(+) 非空白字符（%S）
    print(word)
end

print(string.match("I have 2 questions for you.", "%d+ %a+")) -- 2 questions

-- 字符串截取使用string.sub(sourcestr, startIndex, endIndex)
-- 字符串
local sourcestr = "prefix--runoobgoogletaobao--suffix"
print("\n原始字符串", string.format("%q", sourcestr))

-- 截取部分，第4个到第15个
local first_sub = string.sub(sourcestr, 4, 15)
print("\n first get sub", string.format("%q", first_sub))

-- 取字符串前缀，第1个到第8个
local second_sub = string.sub(sourcestr, 1, 8)
print("\n second get sub", string.format("%q", second_sub))

-- 截取最后10个
local third_sub = string.sub(sourcestr, -10)
print("\n third get sub", string.format("%q", third_sub))

-- 索引越界，输出原始字符串
local fourth_sub = string.sub(sourcestr, -100)
print("\n fourth get sub", string.format("%q", fourth_sub))

-- https://www.runoob.com/lua/lua-strings.html