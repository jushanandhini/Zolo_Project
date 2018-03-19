require 'selenium-webdriver'
driver = Selenium::WebDriver.for :chrome

Given(/^I access zolo website$/) do
  driver.navigate.to "http://52.201.90.154:9002/"
  sleep(2)
end

And(/^I signin with valid credentials$/) do
  # driver.find_element(By.CssSelector(:class => 'name').send_keys("testuser33@yopmail.com"));
  driver.find_element(:xpath => '//*[@id="signin"]/div/div[2]/div[2]/form/div[1]/input').send_keys("7777777037");
  sleep(2)
  driver.find_element(:xpath => '//*[@id="signin"]/div/div[2]/div[2]/form/div[2]/input').send_keys("123456");
  sleep(2)
  driver.find_element(:xpath => '//*[@id="signin"]/div/div[2]/div[2]/form/div[4]/div/input').click
  sleep(2)
end

And(/^I click on Login from the top menu$/) do
  driver.find_element(:class => 'login-link>a').click
end

And(/^I apply few filters$/) do
  driver.find_element(:css => '.col-sm-4:nth-child(1)>select').click
  sleep(2)
  budget_options = driver.find_elements(:css => '.col-sm-4:nth-child(1)>select>option')
  if budget_options.each do |i|
    if i.text == '5000 - 8000'
      i.click
      sleep(2)
      break
    end
  end
  end

  driver.find_element(:css => '.col-sm-4:nth-child(2)>select').click
  sleep(2)
  sharing_options = driver.find_elements(:css => '.col-sm-4:nth-child(2)>select>option')
  if sharing_options.each do |i|
    if i.text == '1 Sharing'
      i.click
      sleep(2)
      break
    end
  end
  end

  driver.find_element(:css => '#gender-drpdwn').click
  sleep(2)
  pg_options = driver.find_elements(:css => '#gender-drpdwn>option')
  if pg_options.each do |i|
    if i.text == 'Men'
      i.click
      sleep(5)
      break
    end
  end
  end
end

And(/^I select an address by entering a keyword "([^"]*)" in the search bar$/) do |search_term|
  driver.find_element(:id => 'searchBar').send_keys(search_term)
  sleep(2)
  3.times {driver.find_element(:id => 'searchBar').send_keys(:down)}
  driver.find_element(:id => 'searchBar').send_keys(:enter)
  sleep(2)
end


And(/^I login with valid credentials$/) do
  driver.find_element(:class => 'login-link>a').click
  driver.find_element(:xpath => '//*[@id="signin"]/div/div[2]/div[2]/form/div[1]/input').send_keys("7777777037");
  sleep(2)
  driver.find_element(:xpath => '//*[@id="signin"]/div/div[2]/div[2]/form/div[2]/input').send_keys("123456");
  sleep(2)
  driver.find_element(:xpath => '//*[@id="signin"]/div/div[2]/div[2]/form/div[4]/div/input').click
  sleep(2)
end

And(/^I select "([^"]*)" from the search results$/) do |text|
  sleep(3)
  name_count = driver.find_elements(:css => '.col-md-9>h2').size()
  puts name_count
  sleep(2)
  pg_name = driver.find_elements(:css => '.col-md-9>h2')
  for i in 0..name_count
    if pg_name.each do |i|
      if i.text == text
        i.click
      end
    end
    end
  end


  And(/^the property details should be displayed$/) do
    driver.find_element(:css, ".summaryItem").displayed? == true
  end

  When(/^I schedule a visit by clicking on schedule a visit$/) do
    driver.find_element(:css => '.btn.btn-default.btn-block').click
    sleep(2)
    enter_date = (Date.today + 10)
    driver.find_element(:class, "form-group.date-section>input").send(enter_date)
    driver.find_element(:css, ".md-18>select").click
    driver.find_element(:css, ".md-18>select").all('option')[rand(12)].select_option
    sleep(2)
    driver.find_element(:css, ".btn.btn-lg.btn-blue").click
    sleep(2)
  end

  Then(/^I should be able to see the confirmation page$/) do
    driver.find_element(:css, ".row.offer-content.padding-30").displayed? == true
  end
end
