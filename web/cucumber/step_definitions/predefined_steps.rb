def setup_classic_watir
  require 'watir'
  require 'win32ole'
  $ai           = ::WIN32OLE.new('AutoItX3.Control')
  $first_index  = 1
  $timestamp    = Time.now.strftime("%Y%m%d%H%M%S")
  $watir_script = true
  Watir::IE.close_all
  Watir::IE.visible = true
end

def setup_watir_webdriver
  require 'watir'
  $first_index  = 0
  $timestamp    = Time.now.strftime("%Y%m%d%H%M%S")
  $watir_script = false
end

def open_firefox
  setup_watir_webdriver
  @browser = Watir::Browser.new :firefox
  sleep 2
  $browser = @browser
end

def open_safari
  setup_watir_webdriver
  @browser = Watir::Browser.new :safari
  $browser = @browser
end

def get_open_port
  server = TCPServer.new('127.0.0.1', 0)
  port   = server.addr[1]
  server.close
  port
end

def open_chrome
  setup_watir_webdriver
  require 'rbconfig'
  host_os = RbConfig::CONFIG['host_os']
  if host_os.include? "darwin"
    #mac
    shamisen_dir = "~/awetest/shamisen"
    selenium_server_path = "#{shamisen_dir}/bin/selenium-server-standalone.jar"
    output = '> /dev/null 2>&1'
    sleep Random.rand(100)/100.0
    port = get_open_port
    $browser = IO.popen("java -jar #{selenium_server_path} -role hub -port #{port} #{output} \n")
    $browser_client = IO.popen("java -jar #{selenium_server_path} -role webdriver  -hub http://localhost:#{port}/grid/register -port #{get_open_port} -browser browserName=chrome,version=ANY,maxInstances=1,platform=MAC #{output} \n")
    client = Selenium::WebDriver::Remote::Http::Default.new
    client.open_timeout = 300 # seconds – default is 60
    caps = Selenium::WebDriver::Remote::Capabilities.chrome("chromeOptions" => {"args" => ["--disable-web-security --ignore-certificate-errors --disable-translate --disable-popup-blocking"]})
    max_sleep_time = 20
    sleep_time = 0
    begin
      sleep 1
      @browser = Watir::Browser.new :remote, :http_client => client, url: "http://localhost:#{port}/wd/hub", desired_capabilities: caps
    rescue => e
      sleep_time +=1
      retry if sleep_time < max_sleep_time
      raise("Error launching chrome\n #{e.to_s}")
    end
  else
    # @browser = Watir::Browser.new :chrome
    chrome_opts = {
      :binary => "#{ENV['home']}/awetest/chrome/chrome.exe"
	  # ,
      # :disable_extentions => true
    }
    @browser=Watir::Browser.new :chrome, options: chrome_opts
  end
	$browser = @browser
end

def open_internet_explorer
  if $watir_script
    setup_classic_watir
    @browser = Watir::IE.new
    @browser.speed = :fast
  else
    if @params['version'] == '11.5' or @params["browser"] == "ED" # Condition for edge browser
      require 'watir'
      @browser = Watir::Browser.new :edge
    else
      setup_watir_webdriver
      # client = Selenium::WebDriver::Remote::Http::Default.new
      # client.open_timeout = 500 # seconds – default is 60
      # caps = Selenium::WebDriver::Remote::Capabilities.internet_explorer(
      #     :initialBrowserUrl => 'about:blank',
      #     :enablePersistentHover => false,
      #     :ignoreProtectedModeSettings => true,
      #     'ie.ensureCleanSession' => true,
      #     :unexpectedAlertBehaviour => 'ignore',
      #     :introduce_flakiness_by_ignoring_security_domains => true
      # )
      # @browser = Watir::Browser.new :ie, :http_client => client, :desired_capabilities => caps
      @browser = Watir::Browser.new :ie
    end
  end
  $browser = @browser
end

def navigate_to_environment_url
  if @params and @params['environment'] and @params['environment']['url']
    url = @params['environment']['url']
  elsif @login and @login['url']
    url = @login['url']
  elsif @role and @login[@role] and @login[@role]['url']
    url = @login[@role]['url']
  end
  @browser.goto url
end

def open_a_browser
  if @params
    case @params["browser"]
      when "FF"
        open_firefox
      when "IE", "ED"
        open_internet_explorer
      when "C", "GC"
        open_chrome
      when "S"
        open_safari
    end
  else
    if $watir_script
      open_internet_explorer
    else
      open_firefox
    end
  end
end

def add_ie_clicK(what, count)
  case count
    when 2
      @ie_click_twice = [] unless @ie_click_twice
      unless @ie_click_twice.include?(what)
        @ie_click_twice << what
      end
    when 1
      @ie_click_once = [] unless @ie_click_once
      unless @ie_click_once.include?(what)
        @ie_click_once << what
      end
  end
end

def ie_click?(what)
  rtrn = 0
  if @browser.name == :internet_explorer
    if @ie_click_twice and @ie_click_twice.include?(what)
      rtrn = 2
    elsif @ie_click_once and @ie_click_once.include?(what)
      rtrn = 1
    end
  end
  rtrn
end

Given /^add "([^"]*)" to IE click "([^"]*)" list$/ do |what, count|
  add_ie_click(what, count)
end

Given /^I run with Watir$/ do
  if @params and not @params["browser"] == "IE"
    puts "@params['browser']=>#{@params['browser']}"
  else
    setup_classic_watir
  end
end

Given /^I run with Classic Watir$/ do
  step "I run with Watir"
end

Given /^I run with Watir-webdriver$/i do
  setup_watir_webdriver
end

When /^I open a browser$/i do
  open_a_browser
end

When /^I open a new browser$/i do
  open_a_browser
end

Given /^I open a F?f?irefox B?b?rowser$/i do
  open_firefox
end

Given /^I open Firefox$/ do
  open_firefox
end

Given /^I open a C?c?hrome B?b?rowser$/i do
  open_chrome
end

Given /^I open Chrome$/ do
  open_chrome
end

When /^I open an IE B?b?rowser$/i do
  open_internet_explorer
end

Given /^I open an I?i?nternet E?e?xplorer B?b?rowser$/i do
  open_internet_explorer
end

Given /^I open Internet Explorer$/i do
  open_internet_explorer
end

Then /^I decrypt the password$/ do
  decrypt_password
end

Then /^I navigate to the environment url$/ do
  navigate_to_environment_url
end

Then /^I go to the url "([^"]*)"$/ do |url|
  @browser.goto url
end

Then /^I go to the (URL|url)$/ do |dummy|
  navigate_to_environment_url
end

Then /^I click "([^"]*)"$/ do |element_text|
  step "I click the element with \"text\" \"#{element_text}\""
end

Then /^I click the button "([^"]*)"$/ do |element_text|
  step "I click the button with \"text\" \"#{element_text}\""
end


Then /^I click the "?(.*?)"? with "(.*?)" "(.*?)"$/ do |element, how, what|
  step "I wait until #{element} with #{how} \"#{what}\" is ready"
  #what = Regexp.new(Regexp.escape(what)) unless how =~ /index|text/i or what.is_a?(Regexp)
  case element
    when 'link'
      target = @browser.link(how.to_sym, what)
    when 'button'
      target = @browser.button(how.to_sym, what)
    else
      target = @browser.element(how.to_sym, what)
  end
  if target.respond_to?("click")
    if $watir_script
      target.click
    else
      target.fire_event('onclick')
    end
  else
    fail("#{element} with #{how} '#{what}' does not respond to 'click'")
  end
end

And /^I enter "([^"]*)" in text field with "?(.*?)"? "([^"]*)"$/ do |value, how, what|
  # what = Regexp.new(Regexp.escape(what)) unless how =~ /index|text/i or what.is_a?(Regexp)
  #step "I wait until text field with #{how} \"#{what}\" is ready"
  @browser.text_field(how.to_sym, /#{what}/).set(value)
end

And /^I enter the value for "([^"]*)" in text field with "?(.*?)"? "([^"]*)"$/ do |index, how, what|
  if index =~ /zipcode/
    value = @var[index].to_i.to_s
  else
    value = index
  end
  step "I enter \"#{value}\" in text field with #{how} \"#{what}\""
end

And /^I select the value "([^"]*)" in select list with "?(.*?)"? "([^"]*)"$/ do |value, how, what|
  #what = Regexp.new(Regexp.escape(what)) unless how =~ /index|text/i or what.is_a?(Regexp)
  @browser.select_list(how.to_sym, what).select_value(/#{value}/)
end

And /^I select the option "([^"]*)" in select list with "?(.*?)"? "([^"]*)"$/ do |option, how, what|
  #what = Regexp.new(Regexp.escape(what)) unless how =~ /index|text/i or what.is_a?(Regexp)
  @browser.select_list(how.to_sym, what).select(/#{option}/)
end

And /^I select the value for "([^"]*)" in select list with "?(.*?)"? "([^"]*)"$/ do |index, how, what|
  value = @var[index]
  step "I select the value \"#{value}\" in select list with #{how} \"#{what}\""
end

Then /^I check that the "?(.*?)"? with "?(.*?)"? "([^"]*)" contains "([^"]*)"$/ do |element, how, what, target|
  #what = Regexp.new(Regexp.escape(what)) unless how =~ /index|text/i or what.is_a?(Regexp)
  step "I wait until #{element} with #{how} \"#{what}\" is ready"
  unless @browser.element(how.to_sym, what).text.include?(target)
    fail ("#{element} with #{how} '#{what}' does not contain '#{target}'")
  end

end

Then /^I check that the text field with "?(.*?)"? "([^"]*)" contains the value for "([^"]*)"$/ do |how, what, index|
  if index =~ /zipcode/
    value = @var[index].to_i.to_s
  else
    value = @var[index]
  end
  #what = Regexp.new(Regexp.escape(what)) unless how =~ /index|text/i or what.is_a?(Regexp)
  unless @browser.text_field(how.to_sym, what).value.include?(value)
    fail("The text field with #{how} '#{what}' does not contain the value for '${index}' ('#{value}'")
  end
end

Then /^I should see "([^"]*)"$/ do |text|
  step "I wait 1 second"
  unless @browser.text.include? text
    fail("Did not find text #{text}")
  end
end

Then /^I should not see "([^"]*)"$/ do |text|
  if @browser.text.include? text
    fail("Found text #{text}")
  end
end

Then /^I fill in "([^"]*)" with "([^"]*)"$/ do |field, value| # assumes a label element and its associated element has id
  associated_label = @browser.label(:text, field).attribute_value("for")
  #associated_label = @browser.element(:xpath, '//label[contains(text(),"#{arg1}")]').attribute_value("for"))
  @browser.text_field(:id, associated_label).set value
end

Then /^let me debug$|^pry$|^execute binding.pry$/ do
  require 'pry'
  binding.pry
end

When /^I wait (\d+) seconds?$/ do |seconds|
  sleep seconds.to_i
end

When /^I wait until "?(.*?)"? with "?(.*?)"? "([^"]*)" is ready$/ do |element, how, what|
  # what = Regexp.new(Regexp.escape(what)) unless how =~ /index/i or what.is_a?(Regexp)
  ok   = false
  if $watir_script
    if Watir::Wait.until { @browser.element(how, what).exists? }
      if Watir::Wait.until { @browser.element(how, what).visible? }
        if Watir::Wait.until { @browser.element(how, what).enabled? }
          ok = true
        end
      end
    end
  else
    case element
      when 'button'
        if @browser.button(how.to_sym, what).wait_until_present
          ok = true
        end
      when 'text field'
        if @browser.text_field(how.to_sym, what).wait_until_present
          ok = true
        end
      else
        if @browser.element(how.to_sym, what).wait_until_present
          ok = true
        end
    end
  end
  unless ok
    fail("#{element} with #{how} '#{what}' is not ready")
  end
end

And /^I click "([^"]*)" in the browser alert$/ do |button|
  if $watir_script
    $ai.WinWait("Message from webpage")
    sleep(1)
    $ai.ControlClick("Message from webpage", "", button)
  else
    @browser.alert.wait_until_present
    case button
      when /ok/i, /yes/i, /submit/i
        @browser.alert.ok
      when /cancel/i, /close/i
        @browser.alert.close
      else
        fail("'#{button} for alert not recognized.")
    end
  end
end

And /^I close the browser$/ do
  @browser.close
end

When(/^I should see "([^"]*)" but proceed if not present$/) do |arg|
  @text_list[arg]= @browser.link(:text, "#{arg}").exists?
  File.open(@error_file, "w") do |f|
    f.write(@text_list.to_json)
  end

  if @browser.link(:text, "#{arg}").exists?
    # Do not take a screen shot
  else
    step "I take a screenshot"
  end
end

Then(/^I interact with window having title "([^"]*)"$/) do |arg1| # title of child window
  sleep 5
  counter = 0
  if arg1 == "Parent_Window_Title"
    @browser.driver.switch_to.window(@browser.driver.window_handles[0])
  else
    @browser.windows.each do |win|
      if win.title == arg1 # switches control to child window
        @browser.driver.switch_to.window(@browser.driver.window_handles[counter])
      else
        counter = counter + 1
      end
    end
  end
end

Given /^I load data spreadsheet "([^"]*)" for "([^"]*)"$/ do |file, feature|
  require 'roo'
  @workbook     = Excel.new(file)
  @feature_name = feature #File.basename(feature, ".feature")
  step "I load @login from spreadsheet"
  step "I load @var from spreadsheet"
end

Then /^I load @login from spreadsheet$/ do
  @login                  = Hash.new
  @workbook.default_sheet = @workbook.sheets[0]

  script_col   = 0
  role_col     = 0
  userid_col   = 0
  password_col = 0
  url_col      = 0
  name_col     = 0

  1.upto(@workbook.last_column) do |col|
    header = @workbook.cell(1, col)
    case header
      when @feature_name
        script_col = col
      when 'role'
        role_col = col
      when 'userid'
        userid_col = col
      when 'password'
        password_col = col
      when 'url'
        url_col = col
      when 'name'
        name_col = col
    end
  end

  2.upto(@workbook.last_row) do |line|
    role     = @workbook.cell(line, role_col)
    userid   = @workbook.cell(line, userid_col)
    password = @workbook.cell(line, password_col)
    url      = @workbook.cell(line, url_col)
    username = @workbook.cell(line, name_col)
    enabled  = @workbook.cell(line, script_col).to_s

    if enabled == 'Y'
      @login['role']     = role
      @login['userid']   = userid
      @login['password'] = password
      @login['url']      = url
      @login['name']     = username
      @login['enabled']  = enabled
      break
    end
  end
end

Then /^I load @var from spreadsheet$/ do
  @var                    = Hash.new
  @workbook.default_sheet = @workbook.sheets[1]
  script_col              = 0
  name_col                = 0

  1.upto(@workbook.last_column) do |col|
    header = @workbook.cell(1, col)
    case header
      when @feature_name
        script_col = col
      when 'Variable'
        name_col = col
    end
  end

  2.upto(@workbook.last_row) do |line|
    name       = @workbook.cell(line, name_col)
    value      = @workbook.cell(line, script_col).to_s.strip
    @var[name] = value
  end
end


And(/^I take a screenshot$/) do
  take_screenshot
end
