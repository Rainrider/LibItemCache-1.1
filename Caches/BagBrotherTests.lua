--[[
Copyright 2011-2013 João Cardoso
LibItemCache is distributed under the terms of the GNU General Public License.
You can redistribute it and/or modify it under the terms of the license as
published by the Free Software Foundation.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this library. If not, see <http://www.gnu.org/licenses/>.

This file is part of LibItemCache.
--]]

local Cache = LibStub('LibItemCache-1.1').Cache
local AreEqual, Replace = WoWUnit.AreEqual, WoWUnit.Replace
local Tests = WoWUnit('ItemCache.BagBrother')


--[[ GetItem ]]--

local function MockItemRequest(item)
	Replace('BrotherBags', {
		Realm = {
			Player = {
				[1] = {
					[5] = item
				}
			}
		}
	})
	
	return {Cache:GetItem('Realm', 'Player', 1, 5)}
end

function Tests:SingleItem()
	local results = MockItemRequest('3246:5:0')
	local expected = {'3246:5:0', nil}
	
	AreEqual(expected, results)
end

function Tests:ItemStack()
	local results = MockItemRequest('3246:5:0;3')
	local expected = {'3246:5:0', '3'}
	
	AreEqual(expected, results)
end