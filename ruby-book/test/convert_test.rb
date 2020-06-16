require 'minitest/autorun'
require './lib/convert_length'

class ConvertLengthTest < Minitest::Test
    def test_convert_Length
        assert_equal 39.37, convert_length(1, 'm', 'n')
    end
end