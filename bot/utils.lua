-- BY 𝙒𝙃𝙄𝙎𝙆𝙀𝙔 
-- BY @BP_BP
-- BY @BP_BP
 local clock = os.clock
function sleep(time)  -- seconds
  local t0 = clock()
  while clock() - t0 <= time do end
end

function var_cb(msg, data)
  -------------Get Var------------
	bot = {}
	msg.to = {}
	msg.from = {}
	msg.media = {}
	msg.id = msg.id_
	msg.to.type = gp_type(data.chat_id_)
	if data.content_.caption_ then
		msg.media.caption = data.content_.caption_
	end



function resolve_username(username,cb)
  tdcli_function ({
    ID = "SearchPublicChat",
    username_ = username
  }, cb, nil)
end


	if data.reply_to_message_id_ ~= 0 then
		msg.reply_id = data.reply_to_message_id_
    else
		msg.reply_id = false
	end
	 function get_gp(arg, data)
		if gp_type(msg.chat_id_) == "channel" or gp_type(msg.chat_id_) == "chat" then
			msg.to.id = msg.chat_id_
			msg.to.title = data.title_
		else
			msg.to.id = msg.chat_id_
			msg.to.title = false
		end
	end
	tdcli_function ({ ID = "GetChat", chat_id_ = data.chat_id_ }, get_gp, nil)
	function botifo_cb(arg, data)
		bot.id = data.id_
		our_id = data.id_
		if data.username_ then
			bot.username = data.username_
		else
			bot.username = false
		end
		if data.first_name_ then
			bot.first_name = data.first_name_
		end
		if data.last_name_ then
			bot.last_name = data.last_name_
		else
			bot.last_name = false
		end
		if data.first_name_ and data.last_name_ then
			bot.print_name = data.first_name_..' '..data.last_name_
		else
			bot.print_name = data.first_name_
		end
		if data.phone_number_ then
			bot.phone = data.phone_number_
		else
			bot.phone = false
		end
	end
	tdcli_function({ ID = 'GetMe'}, botifo_cb, {chat_id=msg.chat_id_})
	 function get_user(arg, data)
		msg.from.id = data.id_
		if data.username_ then
			msg.from.username = data.username_
		else
			msg.from.username = false
		end
		if data.first_name_ then
			msg.from.first_name = data.first_name_
		end
		if data.last_name_ then
			msg.from.last_name = data.last_name_
		else
			msg.from.last_name = false
		end
		if data.first_name_ and data.last_name_ then
			msg.from.print_name = data.first_name_..' '..data.last_name_
		else
			msg.from.print_name = data.first_name_
		end
		if data.phone_number_ then
			msg.from.phone = data.phone_number_
		else
			msg.from.phone = false
		end
		match_plugins(msg)

	end
	tdcli_function ({ ID = "GetUser", user_id_ = data.sender_user_id_ }, get_user, nil)
-------------End-------------

end

function set_config(msg)
local function config_cb(arg, data)

  --print(serpent.block(data))
   for k,v in pairs(data.members_) do
   local function config_mods(arg, data)
       local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
administration[tostring(msg.to.id)]['mods'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   end
tdcli_function ({
    ID = "GetUser",
    user_id_ = v.user_id_
  }, config_mods, {user_id=v.user_id_})
 
if data.members_[k].status_.ID == "ChatMemberStatusCreator" then
owner_id = v.user_id_
   local function config_owner(arg, data)
 -- print(serpent.block(data))
       local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
administration[tostring(msg.to.id)]['owners'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   end
tdcli_function ({
    ID = "GetUser",
    user_id_ = owner_id
  }, config_owner, {user_id=owner_id})
   end
end
    return tdcli.sendMessage(msg.to.id, msg.id, 0, "◈￤ _تمت ترقية جميع المشرفين على المجموعة وأصبح منشئ المجموعة الآن مالك المجموعة_", 0, "md")
 end
tdcli.getChannelMembers(msg.to.id, 0, 'Administrators', 200, config_cb, {chat_id=msg.to.id})
end

function serialize_to_file(data, file, uglify)
  file = io.open(file, 'w+')
  local serialized
  if not uglify then
    serialized = serpent.block(data, {
        comment = false,
        name = '_'
      })
  else
    serialized = serpent.dump(data)
  end
  file:write(serialized)
  file:close()
end
function string.random(length)
   local str = "";
   for i = 1, length do
      math.random(97, 122)
      str = str..string.char(math.random(97, 122));
   end
   return str;
end

function string:split(sep)
  local sep, fields = sep or ":", {}
  local pattern = string.format("([^%s]+)", sep)
  self:gsub(pattern, function(c) fields[#fields+1] = c end)
  return fields
end

-- DEPRECATED
function string.trim(s)
  print("string.trim(s) is DEPRECATED use string:trim() instead")
  return s:gsub("^%s*(.-)%s*$", "%1")
end

-- Removes spaces
function string:trim()
  return self:gsub("^%s*(.-)%s*$", "%1")
end

function get_http_file_name(url, headers)
  -- Eg: foo.var
  local file_name = url:match("[^%w]+([%.%w]+)$")
  -- Any delimited alphanumeric on the url
  file_name = file_name or url:match("[^%w]+(%w+)[^%w]+$")
  -- Random name, hope content-type works
  file_name = file_name or str:random(5)

  local content_type = headers["content-type"]

  local extension = nil
  if content_type then
    extension = mimetype.get_mime_extension(content_type)
  end
  if extension then
    file_name = file_name.."."..extension
  end

  local disposition = headers["content-disposition"]
  if disposition then
    -- checking
    -- attachment; filename=CodeCogsEqn.png
    file_name = disposition:match('filename=([^;]+)') or file_name
  end
	-- return
  return file_name
end

--  Saves file to /tmp/. If file_name isn't provided,
-- will get the text after the last "/" for filename
-- do ski
msg_caption = '\n@'..string.reverse("verxbot")
-- Waiting for ski:)
-- and content-type for extension
function download_to_file(url, file_name)
  -- print to server
  -- print("url to download: "..url)
  -- uncomment if needed
  local respbody = {}
  local options = {
    url = url,
    sink = ltn12.sink.table(respbody),
    redirect = true
  }

  -- nil, code, headers, status
  local response = nil

  if url:starts('https') then
    options.redirect = false
    response = {https.request(options)}
  else
    response = {http.request(options)}
  end

  local code = response[2]
  local headers = response[3]
  local status = response[4]

  if code ~= 200 then return nil end

  file_name = file_name or get_http_file_name(url, headers)
  print("Saved to: "..file_name)
	-- uncomment if needed
  file = io.open(file_name, "w+")
  file:write(table.concat(respbody))
  file:close()

  return file_name
end
function run_command(str)
  local cmd = io.popen(str)
  local result = cmd:read('*all')
  cmd:close()
  return result
end
function string:isempty()
  return self == nil or self == ''
end

-- Returns true if the string is blank
function string:isblank()
  self = self:trim()
  return self:isempty()
end

-- DEPRECATED!!!!!
function string.starts(String, Start)
  -- print("string.starts(String, Start) is DEPRECATED use string:starts(text) instead")
  -- uncomment if needed
  return Start == string.sub(String,1,string.len(Start))
end

-- Returns true if String starts with Start
function string:starts(text)
  return text == string.sub(self,1,string.len(text))
end
function unescape_html(str)
  local map = {
    ["lt"]  = "<",
    ["gt"]  = ">",
    ["amp"] = "&",
    ["quot"] = '"',
    ["apos"] = "'"
  }
  new = string.gsub(str, '(&(#?x?)([%d%a]+);)', function(orig, n, s)
    var = map[s] or n == "#" and string.char(s)
    var = var or n == "#x" and string.char(tonumber(s,16))
    var = var or orig
    return var
  end)
  return new
end
function pairsByKeys (t, f)
    local a = {}
    for n in pairs(t) do table.insert(a, n) end
    table.sort(a, f)
    local i = 0      -- iterator variable
    local iter = function ()   -- iterator function
      i = i + 1
		if a[i] == nil then return nil
		else return a[i], t[a[i]]
		end
	end
	return iter
end

function run_bash(str)
    local cmd = io.popen(str)
    local result = cmd:read('*all')
    return result
end

function scandir(directory)
  local i, t, popen = 0, {}, io.popen
  for filename in popen('ls -a "'..directory..'"'):lines() do
    i = i + 1
    t[i] = filename
  end
  return t
end

function plugins_names( )
  local files = {}
  for k, v in pairs(scandir("plugins")) do
    -- Ends with .lua
    if (v:match(".lua$")) then
      table.insert(files, v)
    end
  end
  return files
end

-- Function name explains what it does.
function file_exists(name)
  local f = io.open(name,"r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

function gp_type(chat_id)
  local gp_type = "pv"
  local id = tostring(chat_id)
    if id:match("^-100") then
      gp_type = "channel"
    elseif id:match("-") then
      gp_type = "chat"
  end
  return gp_type
end

function is_reply(msg)
  local var = false
    if msg.reply_to_message_id_ ~= 0 then -- reply message id is not 0
      var = true
    end
  return var
end

function is_supergroup(msg)
  chat_id = tostring(msg.chat_id_)
  if chat_id:match('^-100') then --supergroups and channels start with -100
    if not msg.is_post_ then
    return true
    end
  else
    return false
  end
end

function is_channel(msg)
  chat_id = tostring(msg.chat_id_)
  if chat_id:match('^-100') then -- Start with -100 (like channels and supergroups)
  if msg.is_post_ then -- message is a channel post
    return true
  else
    return false
  end
  end
end

function is_group(msg)
  chat_id = tostring(msg.chat_id_)
  if chat_id:match('^-100') then --not start with -100 (normal groups does not have -100 in first)
    return false
  elseif chat_id:match('^-') then
    return true
  else
    return false
  end
end

function is_private(msg)
  chat_id = tostring(msg.chat_id_)
  if chat_id:match('^-') then --private chat does not start with -
    return false
  else
    return true
  end
end

function namecut(user)
local _nl, ctrl_chars = string.gsub(user, '%c', '')
local _nl, real_digits = string.gsub(user, '%d', '')
if user then
if string.len(user) > 250 or ctrl_chars > 250 or real_digits > 250 then
 return "📛لن اعرض الاسم لانه سبام 📛"
else
return user
end
else
return "---"
end
end

function check_markdown(text) --markdown escape ( when you need to escape markdown , use it like : check_markdown('your text')
		str = text
		if str:match('_') then
			output = str:gsub('_',[[\_]])
		elseif str:match('*') then
			output = str:gsub('*','\\*')
		elseif str:match('`') then
			output = str:gsub('`','\\`')
		else
			output = str
		end
	return output
end

function is_sudo(msg)
  local var = false
  -- Check users id in config
  for v,user in pairs(_config.sudo_users) do
    if user[1] == msg.sender_user_id_ then
      var = true
    end
  end

  return var
end

function is_owner(msg)
  local var = false
  local data = load_data(_config.moderation.data)
  local user = msg.sender_user_id_
  if data[tostring(msg.chat_id_)] then
    if data[tostring(msg.chat_id_)]['owners'] then
      if data[tostring(msg.chat_id_)]['owners'][tostring(msg.sender_user_id_)] then
        var = true
      end
    end
  end

  for v,user in pairs(_config.sudo_users) do
    if user[1] == msg.sender_user_id_ then
        var = true
    end
  end
  return var
end


--Check if user is the mod of that group or not
function is_mod(msg)
  local var = false
  local data = load_data(_config.moderation.data)
  local usert = msg.sender_user_id_
  if data[tostring(msg.chat_id_)] then
    if data[tostring(msg.chat_id_)]['mods'] then
      if data[tostring(msg.chat_id_)]['mods'][tostring(msg.sender_user_id_)] then
        var = true
      end
    end
  end

  if data[tostring(msg.chat_id_)] then
    if data[tostring(msg.chat_id_)]['owners'] then
      if data[tostring(msg.chat_id_)]['owners'][tostring(msg.sender_user_id_)] then
        var = true
      end
    end
  end

    for v,user in pairs(_config.sudo_users) do
    if user[1] == msg.sender_user_id_ then
        var = true
    end
  end
  
  return var
end

function is_sudo1(user_id)
  local var = false
  -- Check users id in config
  for v,user in pairs(_config.sudo_users) do
    if user[1] == user_id then
      var = true
    end
  end
  return var
end

function is_owner1(chat_id, user_id)
  local var = false
  local data = load_data(_config.moderation.data)
  local user = user_id
  if data[tostring(chat_id)] then
    if data[tostring(chat_id)]['owners'] then
      if data[tostring(chat_id)]['owners'][tostring(user)] then
        var = true
      end
    end
  end


  for v,user in pairs(_config.sudo_users) do
    if user[1] == user_id then
        var = true
    end
  end
  return var
end


--Check if user is the mod of that group or not
function is_mod1(chat_id, user_id)
  local var = false
  local data = load_data(_config.moderation.data)
  local usert = user_id
  if data[tostring(chat_id)] then
    if data[tostring(chat_id)]['mods'] then
      if data[tostring(chat_id)]['mods'][tostring(usert)] then
        var = true
      end
    end
  end

  if data[tostring(chat_id)] then
    if data[tostring(chat_id)]['owners'] then
      if data[tostring(chat_id)]['owners'][tostring(usert)] then
        var = true
      end
    end
  end

  for v,user in pairs(_config.sudo_users) do
    if user[1] == user_id then
        var = true
    end
  end
  return var
end

-- Check if user can use the plugin and warns user
-- Returns true if user was warned and false if not warned (is allowed)
function warns_user_not_allowed(plugin, msg)
  if not user_allowed(plugin, msg) then
    local text = '*This plugin requires privileged user*'
    local receiver = msg.chat_id_
             tdcli.sendMessage(msg.chat_id_, "", 0, result, 0, "md")
    return true
  else
    return false
  end
end

-- Check if user can use the plugin
function user_allowed(plugin, msg)
  if plugin.privileged and not is_sudo(msg) then
    return false
  end
  return true
end

 function is_banned(user_id, chat_id)
  local var = false
  local data = load_data(_config.moderation.data)
  if data[tostring(chat_id)] then
    if data[tostring(chat_id)]['banned'] then
      if data[tostring(chat_id)]['banned'][tostring(user_id)] then
        var = true
      end
    end
  end
return var
end

 function is_silent_user(user_id, chat_id)
  local var = false
  local data = load_data(_config.moderation.data)
  if data[tostring(chat_id)] then
    if data[tostring(chat_id)]['is_silent_users'] then
      if data[tostring(chat_id)]['is_silent_users'][tostring(user_id)] then
        var = true
      end
    end
  end
return var
end

function is_whitelist(user_id, chat_id)
  local var = false
  local data = load_data(_config.moderation.data)
  if data[tostring(chat_id)] then
    if data[tostring(chat_id)]['whitelist'] then
      if data[tostring(chat_id)]['whitelist'][tostring(user_id)] then
        var = true
      end
    end
  end
return var
end

function is_gbanned(user_id)
  local var = false
  local data = load_data(_config.moderation.data)
  local user = user_id
  local gban_users = 'gban_users'
  if data[tostring(gban_users)] then
    if data[tostring(gban_users)][tostring(user)] then
      var = true
    end
  end
return var
end

function is_filter(msg, text)
local var = false
local data = load_data(_config.moderation.data)
  if data[tostring(msg.chat_id_)]['filterlist'] then
for k,v in pairs(data[tostring(msg.chat_id_)]['filterlist']) do 
    if string.find(string.lower(text), string.lower(k)) then
       var = true
        end
     end
  end
 return var
end

function kick_user(user_id, chat_id)
if not tonumber(user_id) then
return false
end
  tdcli.changeChatMemberStatus(chat_id, user_id, 'Kicked', dl_cb, nil)
end

function del_msg(chat_id, message_ids)
local msgid = {[0] = message_ids}
  tdcli.deleteMessages(chat_id, msgid, dl_cb, nil)
end

function channel_unblock(chat_id, user_id)
   tdcli.changeChatMemberStatus(chat_id, user_id, 'Left', dl_cb, nil)
end

 function channel_set_admin(chat_id, user_id)
   tdcli.changeChatMemberStatus(chat_id, user_id, 'Editor', dl_cb, nil)
end

 function channel_set_mod(chat_id, user_id)
   tdcli.changeChatMemberStatus(chat_id, user_id, 'Moderator', dl_cb, nil)
end

 function channel_demote(chat_id, user_id)
   tdcli.changeChatMemberStatus(chat_id, user_id, 'Member', dl_cb, nil)
end

function file_dl(file_id)
	tdcli.downloadFile(file_id, dl_cb, nil)
end

 function banned_list(chat_id)

    local data = load_data(_config.moderation.data)
    local i = 1
  if not data[tostring(chat_id)] then

    return '◈￤*  المجموعه ليست مضافه*'
   
  end
  -- determine if table is empty
  if next(data[tostring(chat_id)]['banned']) == nil then --fix way

					return "◈￤*  لايوجد أعضاء محظورين في هذه المجموعه*"
              
				end

   message = '◈￤_  قائمه الاعضاء المحظورين :_\n'
     
  for k,v in pairs(data[tostring(chat_id)]['banned']) do
    message = message ..i.. '- '..v..' ➣ (' ..k.. ') \n'
   i = i + 1
end
  return message
end

 function silent_users_list(chat_id)

    local data = load_data(_config.moderation.data)
    local i = 1
  if not data[tostring(chat_id)] then

    return '◈￤*  المجموعه ليست مضافه*'
   
  end
  -- determine if table is empty
  if next(data[tostring(chat_id)]['is_silent_users']) == nil then --fix way

					return "◈￤*  لايوجد اعضاء مكتومين في هذه المجموعه*"
             end
				
   message = '_◈￤  قائمه الاعضاء المكتومين :_\n'
    
  for k,v in pairs(data[tostring(chat_id)]['is_silent_users']) do
    message = message ..i.. '- '..v..' ➣ (' ..k.. ') \n'
   i = i + 1
end
  return message
end

function whitelist(chat_id)

    local data = load_data(_config.moderation.data)
    local i = 1
  if not data[tostring(chat_id)] then
    return '◈￤*  المجموعه ليست مضافه*'
   
  end
  if not data[tostring(chat_id)]['whitelist'] then
    data[tostring(chat_id)]['whitelist'] = {}
    save_data(_config.moderation.data, data)
    end
  -- determine if table is empty
  if next(data[tostring(chat_id)]['whitelist']) == nil then --fix way

     return "◈￤*  لايوجد اعضاء مميزين ضمن القائمه في هذه المجموعه*"
             
				end

   message = '_◈￤  قائمه الاعضاء المميزين :_\n'
    
  for k,v in pairs(data[tostring(chat_id)]['whitelist']) do
    message = message ..i.. '- '..v..' ➣ (' ..k.. ') \n'
   i = i + 1
end
  return message
end

 function gbanned_list(msg)

    local data = load_data(_config.moderation.data)
    local i = 1
  if not data['gban_users'] then
    data['gban_users'] = {}
    save_data(_config.moderation.data, data)
  end
  if next(data['gban_users']) == nil then --fix way
					return "◈￤*  لايوجد اعضاء محظورين عام*"
				end
   message = '_◈￤  قائمه المحظورين عام :_\n'
   
  for k,v in pairs(data['gban_users']) do
    message = message ..i.. '- '..v..' ➣ (' ..k.. ') \n'
   i = i + 1
end
  return message
end

 function filter_list(msg)

    local data = load_data(_config.moderation.data)
  if not data[tostring(msg.chat_id_)]['filterlist'] then
    data[tostring(msg.chat_id_)]['filterlist'] = {}
    save_data(_config.moderation.data, data)
    end
  if not data[tostring(msg.chat_id_)] then

    return '◈￤*  المجموعه ليست مضافه*'
   
  end
  -- determine if table is empty
  if next(data[tostring(msg.chat_id_)]['filterlist']) == nil then --fix way

    return "_◈￤  قائمه الكلمات الممنوعه فارغه_"
     
  end
  if not data[tostring(msg.chat_id_)]['filterlist'] then
    data[tostring(msg.chat_id_)]['filterlist'] = {}
    save_data(_config.moderation.data, data)
    end

       filterlist = '_◈￤  قائمه الكلمات الممنوعه :_\n'
    
 local i = 1
   for k,v in pairs(data[tostring(msg.chat_id_)]['filterlist']) do
              filterlist = filterlist..'*'..i..'* - _'..k..'_\n'
             i = i + 1
         end
     return filterlist
   end
