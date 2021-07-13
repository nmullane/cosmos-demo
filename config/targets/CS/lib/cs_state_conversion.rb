require 'cosmos/conversions/conversion'

module Cosmos
	class CsStateConversion < Conversion
		def initialize()
			super()
		end

		def call(value, packet, buffer)
			@strVal = ""
			case value
			when 0
				@strVal = "EMPTY"
			when 1
				@strVal = "ENABLED"
			when 2
				@strVal = "DISABLED"
			when 3
				@strVal = "UNDEFINED"
			else
				@strVal = "UNKNOWN"
			end

			return @strVal
		end
	end
end