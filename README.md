
# openresty-lab

在 Windows 10 上从零搭建的 OpenResty + Lua 学习仓库。  
已配置好目录骨架、VS Code 智能提示、热加载与调试环境，克隆后 **1 分钟**即可跑起第一个 Lua 接口。

---

## 目录结构

```
conf/               # Nginx 配置（含开发/生产双配置）
apps/               # 业务接口（index.lua、user.lua …）
lualib/             # 第三方库 & 自研工具包
logs/               # 错误/访问日志（被 .gitignore）
temp/               # 运行时临时文件（被 .gitignore）
t/                  # 测试用例（test::nginx / busted）
```

---

## 环境要求

1. Windows 10 64 位  
2. [OpenResty 1.27.1.2 Win64](https://openresty.org/download.html) 解压到 `D:\openresty\openresty-1.27.1.2-win64`  
3. Git Bash 或 PowerShell 5+  
4. VS Code + 插件 **Lua**（sumneko）

---

## 一键启动（开发）

```powershell
# 1. 克隆仓库
git clone https://github.com/webster-yuan/openresty-lab.git
cd openresty-lab

# 2. 启动 OpenResty（热加载已开）
nginx -p (Get-Location).Path -c conf/nginx.dev.conf
# 若用 cmd：nginx -p %cd% -c conf/nginx.dev.conf

# 3. 浏览器访问
curl http://localhost
# 输出：Hello from new structure /apps/
```

改完 `apps/*.lua` 保存 → 刷新浏览器立即生效（`lua_code_cache off`）。

---

## 调试

### 本地 Lua 脚本
VS Code 直接 F5 选 **Lua Debug** 即可单步。

### OpenResty 远程断点
1. 装 [ZeroBrane Studio](https://studio.zerobrane.com/) 绿色版  
2. 把 `mobdebug.lua` & `socket/core.dll` 拷到 `lualib/`  
3. 在代码头部加  
   ```lua
   require("mobdebug").start()
   ```
4. ZBS → Project → Start Debugger Server → 浏览器访问即停断点。

---

## 常用命令

| 目的 | 命令 |
|---|---|
| 配置检查 | `nginx -p . -c conf/nginx.dev.conf -t` |
| 平滑重载 | `nginx -p . -c conf/nginx.dev.conf -s reload` |
| 完全停止 | `nginx -p . -c conf/nginx.dev.conf -s quit` |
| 启动 | `nginx -p . -c conf/nginx.dev.conf`|
---

## 下一步练什么

- [ ] `cosocket` 访问 Redis（计数器）  
- [ ] `access_by_lua` 实现 JWT 鉴权  
- [ ] `header_filter_by_lua` 统一 CORS  
- [ ] 用 `test::nginx` 写接口单元测试  

每完成一步会对应一条 commit，跟着历史记录阶梯式学习。

---

## 许可证

MIT © 2025 webster-yuan