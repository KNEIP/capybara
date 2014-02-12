# Timecop.freeze can't be used as Capybara is using Time.now in order
# to manage a timeout when waiting for something with Javascript.
#
# This monkey patch code is aliasing the Time.now method so that Capybara
# is now using its Time method which is then named 'capybara_now'
# and timecop can freeze back the Time.now output.
class Time
  class << self
    alias_method :now_for_capybara, :now
  end
end
