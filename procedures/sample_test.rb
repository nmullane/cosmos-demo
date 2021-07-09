load 'cosmos/tools/test_runner/test.rb'

class SampleTestSuite < Cosmos::TestSuite
  def setup
    puts "Running #{Cosmos::Test.current_test_suite}:#{Cosmos::Test.current_test}:#{Cosmos::Test.current_test_case}"
    wait(2)
  end

  def initialize
    super()
    add_test_setup('SampleTest')
    add_test_case('SampleTest', 'test_sample_hk_1_cmd')
    add_test_case('SampleTest', 'test_sample_hk_2_cmd')
    add_test_teardown('SampleTest')
  end

  def teardown
    puts "Running #{Cosmos::Test.current_test_suite}:#{Cosmos::Test.current_test}:#{Cosmos::Test.current_test_case}"
    wait(2)
  end
end

class SampleTest < Cosmos::Test
  def initialize
    super()
  end

  def setup
    status_bar("setup")
    puts "Running #{Cosmos::Test.current_test_suite}:#{Cosmos::Test.current_test}:#{Cosmos::Test.current_test_case}"
    puts "Enabling telemetry"
    cmd("TO_LAB TO_LAB_ENABLE_OUTPUT with DEST_IP 127.0.0.1")
    wait(2)
  end

  def test_sample_hk_1_cmd
    status_bar("test_sample_hk")
    puts "Running #{Cosmos::Test.current_test_suite}:#{Cosmos::Test.current_test}:#{Cosmos::Test.current_test_case}"
    old_count = tlm("SAMPLE SAMPLE_HK CMD_CNT")
    puts "Sending sample No-Op"
    cmd("SAMPLE", "SAMPLE_NOOP")
    puts "Checking SAMPLE_HK CMD_CNT"
    wait_check("SAMPLE SAMPLE_HK CMD_CNT > " + old_count.to_s, 5)
  end
  def test_sample_hk_2_cmd
    status_bar("test_sample_hk")
    puts "Running #{Cosmos::Test.current_test_suite}:#{Cosmos::Test.current_test}:#{Cosmos::Test.current_test_case}"
    old_count = tlm("SAMPLE SAMPLE_HK CMD_CNT")
    expected_count = old_count + 2

    puts "Sending 2 sample No-Op"
    cmd("SAMPLE", "SAMPLE_NOOP")
    cmd("SAMPLE", "SAMPLE_NOOP")
    
    puts "Checking SAMPLE_HK CMD_CNT"
    wait_check("SAMPLE SAMPLE_HK CMD_CNT == #{expected_count}", 5)
  end

  def teardown
    puts "Running #{Cosmos::Test.current_test_suite}:#{Cosmos::Test.current_test}:#{Cosmos::Test.current_test_case}"
    wait(2)
  end
end
