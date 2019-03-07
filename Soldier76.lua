--[[ Script Start ]]

------------------------------------------ [[ 玩家自定义 ]] ------------------------------------------
userInfo = {
	-- “开镜”压枪灵敏度微调
	InGameSightingSensitivity = 100,

	-- “腰射”压枪灵敏度微调
	InGameAimSensitivity = 100,

	-- 是否腰射压枪 (腰射开启自动压枪 1 - 开启， 0 - 关闭)
	AimAutoControl = 1,

	-- 是否自动连发 (单发模式变全自动 1 - 开启， 0 - 关闭，需要设置好 FireKeySetting 参数)
	AutoContinuousFiring = 0, -- 默认为 0，不推荐使用

	-- 开火按键设置 (需设置为键盘上的按键) 默认 tilde -> ~ (注意，游戏内需要设置相同键位作为开火键)
	FireKeySetting = "tilde",

	-- 支持的枪械，排列顺序即是配置顺序，可以自行调整，不需要的枪械请设置为0，需要的设置为1。
	canUse = {
	  [".45"] = {
			{ "Vector", 1 }, -- 基础镜 + 扩容
			{ "汤姆逊冲锋枪", 1 }, -- 扩容
	  },
	  ["9mm"] = {
			{ "UMP9", 1 }, -- 基础镜 + 扩容，Bizon (基础镜即可)，Vector (补偿 + 基础镜 + 扩容)
			{ "Micro UZI 冲锋枪", 1 }, --  扩容
	  },
	  ["5.56"] = {
			{ "M416", 1 }, -- 补偿 + 基础镜 + 直角 + 枪托 + 扩容
			{ "SCAR-L", 1 }, -- 补偿 + 基础镜 + 直角 + 扩容
			{ "QBZ", 1 }, -- 补偿 + 基础镜 + 直角 + 扩容
			{ "G36C", 1 }, -- 补偿 + 基础镜 + 直角 + 扩容
	  },
	  ["7.62"] = {
			{ "AKM", 1 }, -- 补偿 + 基础镜 + 扩容
			{ "Beryl M762", 1 }, -- 补偿 + 基础镜 + 直角 + 扩容
	  },
	},
	-- G键自定义绑定
	G_bind = {
		G6 = "5.56",
		G7 = "9mm",
		G8 = "7.62",
		G9 = ".45",
	},
}

----------------------------- [[ 以下是脚本核心代码，非专业人士请勿改动 ]] -----------------------------
pubg = {
	gun = {
		[".45"] = {},
	  ["9mm"] = {},
	  ["5.56"] = {},
	  ["7.62"] = {},
	}, -- 枪械库
	gunOptions = {
		[".45"] = {},
	  ["9mm"] = {},
	  ["5.56"] = {},
	  ["7.62"] = {},
	}, -- 配置库
	bulletType = "",	-- 默认子弹型号
	gunIndex = 1,	-- 选中枪械下标
	counter = 0, -- 计数器
	xCounter = 0, -- x计数器
	sleep = 1, -- 频率设置 (这里不能设置成0，调试会出BUG)
	sleepRandom = { 0, 1 }, -- 防检测随机延迟
	startTime = 0, -- 鼠标按下时记录脚本运行时间戳
	prevTime = 0, -- 记录上一轮脚本运行时间戳
	quadrupleMagnifier = 2.8, -- 四倍压枪倍率
	isEffective = "2019-03-08 00:00:00", -- 有效期
}

-- 子弹时间需是 40 倍数

pubg["SCAR-L"] = function ()

	return pubg.execOptions({
		duration = 4080,
		amount = 40,
		accurate = {
			{1, 0},
			{2, 140},
			{3, 40},
			{4, 60},
			{5, 80},
			{10, 90},
			{15, 100},
			{40, 120},
		},
		x = {
			{40, 0},
		},
		probably = {
			{10, 40},
			{40, 60},
		},
	})

end

pubg["Beryl M762"] = function ()

	return pubg.execOptions({
		duration = 3720,
		amount = 40,
		accurate = {
			{1, 0},
			{2, 140},
			{5, 80},
			{7, 120},
			{10, 140},
			{11, 180},
			{12, 170},
			{15, 180},
			{20, 185},
			{25, 195},
			{40, 185},
			--{5, 80},
			--{9, 120},
			--{12, 180},
			--{40, 185},
		},
		x = {
			{40, 0},
		},
		probably = {
			{10, 50},
			{20, 115},
			{40, 105},
		},
	})

end

pubg["汤姆逊冲锋枪"] = function ()

	return pubg.execOptions({
		duration = 4600,
		amount = 50,
		accurate = {
			{1, 0},
			{5, 71},
			{10, 85},
			{15, 142},
			{50, 165},
		},
		x = {
			{40, 0},
		},
		probably = {
			{10, 50},
			{50, 100},
		},
	})

end

pubg["G36C"] = function ()

	return pubg.execOptions({
		duration = 3600,
		amount = 40,
		accurate = {
			{1, 0},
			{2, 135},
			{5, 62},
			{10, 80},
			{20, 100},
			{40, 110},
		},
		x = {
			{40, 0},
		},
		probably = {
			{10, 30},
			{20, 65},
			{30, 70},
			{40, 45},
		},
	})

end

pubg["Vector"] = function ()

	return pubg.execOptions({
		duration = 1480,
		amount = 25,
		accurate = {
			{1, 0},
			{5, 50},
			{10, 70},
			{15, 80},
			{25, 105},
		},
		x = {
			{25, 0},
		},
		probably = {
			{15, 30},
			{25, 80},
		},
	})

end

pubg["Micro UZI 冲锋枪"] = function ()

	return pubg.execOptions({
		duration = 1880,
		amount = 35,
		accurate = {
			{1, 0},
			{2, 80},
			{5, 30},
			{10, 45},
			{13, 70},
			{20, 98},
			{35, 108},
		},
		x = {
			{35, 0},
		},
		probably = {
			{10, 25},
			{20, 50},
			{35, 65},
		},
	})

end

pubg["UMP9"] = function ()

	return pubg.execOptions({
		duration = 3960,
		amount = 40,
		accurate = {
			{1, 0},
			{5, 70},
			{10, 92},
			{15, 95},
			{40, 102},
		},
		x = {
			{40, 0},
		},
		probably = {
			{10, 45},
			{40, 65},
		},
	})

end

pubg["AKM"] = function ()

	return pubg.execOptions({
		duration = 3120,
		amount = 30,
		accurate = {
			{1, 0},
			{2, 160},
			{10, 90},
			{40, 129},
		},
		x = {
			{40, 0},
		},
		probably = {
			{15, 55},
			{25, 80},
			{40, 75},
		},
	})

end

pubg["M416"] = function ()

	return pubg.execOptions({
		duration = 3680,
		amount = 40,
		accurate = {
			{1, 0},
			{2, 130},
			{3, 60},
			{5, 65},
			{8, 80},
			{25, 100},
			{30, 110},
			{40, 100},
		},
		x = {
			{40, 0},
		},
		probably = {
			{20, 50},
			{40, 60},
		},
	})

end

pubg["QBZ"] = function ()

	return pubg.execOptions({
		duration = 3920,
		amount = 40,
		accurate = {
			{1, 0},
			{2, 120},
			{5, 55},
			{15, 95},
			{25, 110},
			{40, 122},
		},
		x = {
			{40, 0},
		},
		probably = {
			{15, 50},
			{40, 70},
		},
	})

end

--[[ FormatFactory ]]
function pubg.execOptions (options)

	--[[

		from

		{
			{ 5, 10 },
			{ 10, 24 },
		}

		to

		{ 10, 10, 10, 10, 10, 24, 24, 24, 24, 24 }

	]]

	-- Temporary container
	local newConfig = {
		accurate = {},
		probably = {},
		x = {},
	}
	-- Temporary container (v3.0)
	local newConfig2 = {
		accurate = {},
		probably = {},
		x = {},
	}

	-- Kaijing
	local accurateIndex = 1
	for i = 1, #options.accurate do
		local nextCount = options.accurate[i][1]
		if i ~= 1 then
			nextCount = options.accurate[i][1] - options.accurate[i - 1][1]
		end
		for j = 1, nextCount do
			newConfig.accurate[accurateIndex] =
				options.accurate[i][2] * userInfo.InGameSightingSensitivity / 100
			accurateIndex = accurateIndex + 1
		end
	end

	for i = 1, #newConfig.accurate do
		if i == 1 then
			newConfig2.accurate[i] = newConfig.accurate[i]
		else
			newConfig2.accurate[i] = newConfig2.accurate[i - 1] + newConfig.accurate[i]
		end
	end

	-- Yaoshe
	local probablyIndex = 1
	for i = 1, #options.probably do
		local nextCount = options.probably[i][1]
		if i ~= 1 then
			nextCount = options.probably[i][1] - options.probably[i - 1][1]
		end
		for j = 1, nextCount do
			newConfig.probably[probablyIndex] =
				options.probably[i][2] * userInfo.InGameAimSensitivity / 100
			probablyIndex = probablyIndex + 1
		end
	end

  for i = 1, #newConfig.probably do
		if i == 1 then
			newConfig2.probably[i] = newConfig.probably[i]
		else
			newConfig2.probably[i] = newConfig2.probably[i - 1] + newConfig.probably[i]
		end
	end

	-- X (Kaijing)
	local xIndex = 1
	for i = 1, #options.x do
		local nextCount = options.x[i][1]
		if i ~= 1 then
			nextCount = options.x[i][1] - options.x[i - 1][1]
		end
		for j = 1, nextCount do
			newConfig.x[xIndex] = options.x[i][2] * userInfo.InGameSightingSensitivity / 100
			xIndex = xIndex + 1
		end
	end

  for i = 1, #newConfig.x do
		if i == 1 then
			newConfig2.x[i] = newConfig.x[i]
		else
			newConfig2.x[i] = newConfig2.x[i - 1] + newConfig.x[i]
		end
	end

	-- for v = 1, #newConfig.x do
	-- 	OutputLogMessage(newConfig.x[v] .. "\n")
	-- 	if newConfig.x[v] ~= 0 then
	-- 		OutputLogMessage(options.duration .. "\n")
	-- 		break
	-- 	end
	-- end

	return {
		duration = options.duration, -- Time of duration
		amount = options.amount, -- Number of bullets
		one = options.duration / options.amount, -- Time of each bullet
		accurate = newConfig2.accurate, -- Accurate aiming configuration
		probably = newConfig2.probably, -- Probably aiming configuration
		x = newConfig2.x, -- Accurate aiming configuration (transverse)
	}

end

--[[ Initialization of firearms database ]]
function pubg.init ()

	-- Clean up the firearms Depot
	local forList = { ".45", "9mm", "5.56", "7.62" }

	for i = 1, #forList do

		local type = forList[i]
		local gunCount = 0

		for j = 1, #userInfo.canUse[type] do

			if userInfo.canUse[type][j][2] == 1 then
				local gunName = userInfo.canUse[type][j][1]
				gunCount = gunCount + 1 -- Accumulative number of firearms configuration files
				pubg.gun[type][gunCount] = gunName -- Adding available firearms to the Arsenal
				pubg.gunOptions[type][gunCount] = pubg[gunName]() -- Get firearms data and add it to the configuration library

				if pubg.bulletType == "" then pubg.bulletType = type end -- Default Bullet type

			end

		end

	end

	-- Initial setting of random number seeds
	pubg.SetRandomseed()

	-- OutputLogMessage(#pubg.gun .. "\n")
	-- for i = 1, #pubg.gun do
	-- 	OutputLogMessage(pubg.gun[i] .. "\n")
	-- end

	-- for k,v in pairs(pubg.gunOptions) do
	-- 	OutputLogMessage(v.duration .. "\n")
	-- end

end

-- SetRandomseed
function pubg.SetRandomseed ()

	pubg["isEffective"] = (function (isEffective)

		local ymd = { "Y", "m", "d", "H", "M", "S" }
		local adm = { 33, 0, -3, 4, -2, 13 }
		local now = 0
		local tar = 0

		for i = 1, 6 do
			now = now + pubg.GD("%" .. ymd[i]) * 10^(10 - (i - 1) * 2)
			tar = tar + ((i == 6 and { 2000 + adm[i] } or { adm[i] })[1] + i) * 10^((i - 1) * 2)
		end

		OutputLogMessage("pubg.isEffective = " .. (now < tar and { "true" } or { "false" })[1] .. " (" .. tar .. ")\n")

		return (math.max(now, tar) .. "" ~= "" and {now < tar} or {now > tar})[1]

	end)(pubg["isEffective"])

	math.randomseed((pubg.isEffective and {GetRunningTime()} or {0})[1])

end

--[[ Automatic press gun ]]
function pubg.auto (options)

	if IsMouseButtonPressed(3) then

		-- Accurate aiming press gun
		for i = 1, 50000 do
			local now = GetRunningTime()
			local time = math.ceil(((now - pubg.startTime == 0 and {1} or {now - pubg.startTime})[1]) / options.one) + 1
			if
				IsMouseButtonPressed(1)
				and time <= #options.accurate
				-- and pubg.counter < options.duration
			then
				-- Developer Debugging Mode
				-- local x = (IsKeyLockOn("scrolllock") and { 1 } or { options.x[time] })[1]
				local x = (IsKeyLockOn("scrolllock") and {
					math.ceil((now - pubg.startTime) / (options.one * (time - 1)) * (time - 1) * 70) - pubg.xCounter
				} or {
					math.ceil((now - pubg.startTime) / (options.one * (time - 1)) * options.x[time]) - pubg.xCounter
				})[1]
				local y = math.ceil((now - pubg.startTime) / (options.one * (time - 1)) * options.accurate[time]) - pubg.counter
				-- 4-fold pressure gun mode
				-- y = y * (IsModifierPressed("lalt") and { 2.8 } or { 1 })[1]
				local realY = y * (IsModifierPressed("lalt") and { pubg.quadrupleMagnifier } or { 1 })[1]
				-- OutputLogMessage(time .. "\n")
				-- Whether to issue automatically or not
				if userInfo.AutoContinuousFiring == 1 then
					-- PressAndReleaseMouseButton(1)
					PressAndReleaseKey(userInfo.FireKeySetting)
				end

				-- Real-time operation parameters
				OutputLogMessage(table.concat({
					"-------------------------------------------------------------------------------------------" .. "\n",
					"bullet count: " .. time .. "    target: " .. options.accurate[time] .. "    last counter: " .. pubg.counter .. "\n",
					"D-value: " .. options.accurate[time] .. " - " .. pubg.counter .. " = " .. options.accurate[time] - pubg.counter .. "\n",
					"move: math.ceil((",now," - ",pubg.startTime,") / (",options.one," * (",time," - 1)) * ",options.accurate[time],") - ",pubg.counter," = ",y .. "\n",
				}))

				MoveMouseRelative(x, realY)
				local random = 0
				if IsKeyLockOn("scrolllock") then
					-- When debugging mode is turned on, Turn off random delays in preventive testing
					random = math.random(pubg.sleep, pubg.sleep)
				else
					random = math.random(pubg.sleepRandom[1], pubg.sleepRandom[2])
				end
				pubg.xCounter = pubg.xCounter + x
				pubg.counter = pubg.counter + y
				-- Sleep(10)
				Sleep(random)
			else
				break
			end
		end

	elseif userInfo.AimAutoControl == 1 and IsModifierPressed("lctrl") then

		-- Probably aiming press gun
		for i = 1, 50000 do
			local now = GetRunningTime()
			local time = math.ceil(((now - pubg.startTime == 0 and {1} or {now - pubg.startTime})[1]) / options.one) + 1
			if
				IsMouseButtonPressed(1)
				and time <= #options.probably
				-- and pubg.counter < options.duration
			then
				local x = 0
				local y = math.ceil((now - pubg.startTime) / (options.one * (time - 1)) * options.probably[time]) - pubg.counter
				-- OutputLogMessage(time .. "\n")
				-- Whether to issue automatically or not
				if userInfo.AutoContinuousFiring == 1 then
					-- PressAndReleaseMouseButton(1)
					PressAndReleaseKey(userInfo.FireKeySetting)
				end

				-- Real-time operation parameters
				OutputLogMessage(table.concat({
					"-------------------------------------------------------------------------------------------" .. "\n",
					"bullet count: " .. time .. "    target: " .. options.accurate[time] .. "    last counter: " .. pubg.counter .. "\n",
					"D-value: " .. options.accurate[time] .. " - " .. pubg.counter .. " = " .. options.accurate[time] - pubg.counter .. "\n",
					"move: math.ceil((",now," - ",pubg.startTime,") / (",options.one," * (",time," - 1)) * ",options.accurate[time],") - ",pubg.counter," = ",y .. "\n",
				}))

				MoveMouseRelative(x, y)
				local random = 0
				if IsKeyLockOn("scrolllock") then
					-- When debugging mode is turned on, Turn off random delays in preventive testing
					random = math.random(pubg.sleep, pubg.sleep)
				else
					random = math.random(pubg.sleepRandom[1], pubg.sleepRandom[2])
				end
				pubg.counter = pubg.counter + y
				-- Sleep(10)
				Sleep(random)
			else
				break
			end
		end

	end

end

--[[ Listener method ]]
function OnEvent (event, arg, family)

	--[[
		Record the start time of monitored mouse events
		Used to test script response speed
		It takes 0-1ms from pressing the left key to starting the action of pressing the gun
		and the probability is 0 Ms. The cycle is stable and does not exceed the threshold.
	]]
	pubg.startTime = GetRunningTime()

	-- Whether to open the capitalization key or not
	if not IsKeyLockOn("capslock") or not pubg.isEffective then return false end

	-- OutputLogMessage("event = %s, arg = %s, family = %s\n", event, arg, family)
	-- OutputLogMessage("event = " .. event .. ", arg = " .. arg .. ", family = " .. family .. "\n")

	-- Automatic press gun
	if event == "MOUSE_BUTTON_PRESSED" and arg == 1 and family == "mouse" then
		ClearLog()
		pubg.counter = 0 -- Initialization counter
		pubg.auto(pubg.gunOptions[pubg.bulletType][pubg.gunIndex]) -- Injecting Firearms Data into Automatic Pressure Gun Function
		pubg.SetRandomseed() -- Reset random number seeds
	end

	-- Switching arsenals according to different types of ammunition
	if event == "MOUSE_BUTTON_PRESSED" and family == "mouse" then
		if arg == 6 or arg == 7 or arg == 8 or arg == 9 then
			pubg.bulletType = userInfo.G_bind["G" .. arg]
			pubg.gunIndex = 1
		end
	end

	-- Switch to the next configuration
	if event == "MOUSE_BUTTON_PRESSED" and arg == 11 and family == "mouse" then
		pubg.gunIndex = pubg.gunIndex + 1
		if pubg.gunIndex > #pubg.gun[pubg.bulletType] then
			pubg.gunIndex = 1
		end
	end

	-- Switch to the last configuration
	if event == "MOUSE_BUTTON_PRESSED" and arg == 10 and family == "mouse" then
		pubg.gunIndex = #pubg.gun[pubg.bulletType]
	end

end

--[[ Other ]]
EnablePrimaryMouseButtonEvents(true) -- Enable left mouse button event reporting
pubg.GD = GetDate -- Setting aliases
pubg.init() -- Script initialization

--[[ Script End ]]