
local json = require "cjson"

local function format_table(t)
    local str = ''
    for k, v in pairs(t) do
        str = str .. k .. '--' .. v .. '\r\n'
    end
    return str
end


-- JSON TO TABLE
local str_json = '{"key1":"this is key1", "key2":"this is key2", "num":1}'
local t = json.decode(str_json)
ngx.say(format_table(t))

-- TABLE TO JSON
local table1 = {key1="this is key1", key2="this is key2", num=12}
local str_json1 = json.encode(table1)
ngx.say(str_json1)

-- TABLR TO JSON ARRAY

local table2 = {key1={key1_1="6666", key1_2= "7777"}, key2= "8888"}
local str_json2 = json.encode(table2)
ngx.say(str_json2)


-- ARRAY TO JSON
local array = {12, 57, 56}
array[4] = 79
json.encode_sparse_array(true)
local str_json3 = json.encode(array)
ngx.say(str_json3)


-- error capture
local json_str4 = '{"tt":""}, "name": "7777"}'
local table3 = json.decode(json_str4)
ngx.say(format_table(table3))