local msgpack = require(game.ReplicatedStorage.msgpack)

local httpService = game:GetService("HttpService")
local msgpackDecode = msgpack.decode
local msgpackEncode = msgpack.encode

local jsonMessage = require(game.ServerStorage.JsonMessage)
local msgpackMessage = require(game.ServerStorage.MsgpackMessage)

return {

	ParameterGenerator = function() end,

	Functions = {
		["JSONDecode & JSONEncode"] = function(Profiler)
			Profiler.Begin("Decode")
			local decoded = httpService:JSONDecode(jsonMessage)
			Profiler.End()

			Profiler.Begin("Encode")
			httpService:JSONEncode(decoded)
			Profiler.End()
		end,

		["msgpack.decode & msgpack.encode"] = function(Profiler)
			Profiler.Begin("Decode")
			local decoded = msgpackDecode(msgpackMessage)
			Profiler.End()

			Profiler.Begin("Encode")
			msgpackEncode(decoded)
			Profiler.End()
		end,
	},
}
