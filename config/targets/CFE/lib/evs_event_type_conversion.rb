require 'cosmos/conversions/conversion'

# cfe_evs_extern_typedefs.h
module Cosmos
	class EvsEventTypeConversion < Conversion
		def initialize()
			super()
		end

		def call(value, packet, buffer)
			@strVal = ""
			case value
			when 1
				@strVal = "DEBUG"
			when 2
				@strVal = "INFORMATION"
			when 3
				@strVal = "ERROR"
			when 4
				@strVal = "CRITICAL"
			else
				@strVal = "UNKNOWN"
			end

			return @strVal
		end
	end
end