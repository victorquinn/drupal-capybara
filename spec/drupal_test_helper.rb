module DrupalTestHelper
  def login_to_site(username, password)
    fill_in('name', :with => username)
    fill_in('pass', :with => password)
    click_button('Log in')
  end

  def verify_login_worked
    page.should_not have_content("Sorry, unrecognized username or password.")
  end

  # Note: this is commented out by default on purpose. I wanted to include a
  # sample test, but beyond a login, many tests are specific to your Drupal site
  # setup so I include this but it comes commented so it can be tweaked to fit
  # your site particulars.
  # def submit_subscribe_form
  #   fill_in('subscribe_email', :with => generate_email)
  #   fill_in('subscribe_zip', :with => generate_zip)
  #   click_button('Subscribe')
  # end

  # Generate a fake email
  def generate_email
    o =  [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten
    email = (0...15).map{ o[rand(o.length)] }.join << "@" << (0...10).map{ o[rand(o.length)] }.join << ".com"
  end

  # Generate a fake zip
  def generate_zip
    o = [(0..9)].map{|i| i.to_a}.flatten
    zip = (0...5).map{ o[rand(o.length)] }.join
  end
end
