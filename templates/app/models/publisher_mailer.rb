class PublisherMailer < ActionMailer::Base
  default_url_options[:host] = "#{SITE_URL}"
  
  def find_recipients
    @role = Role.find_by_name("publisher")
    #@publishers = User.find_by_role_id(@role.id) 
    @publishers = User.all
    for publisher in @publishers
      return "#{publisher.email.to_s}"
    end
  end

  def approve_page(page)
    subject       "A Page Has Been Modified"
    from          "admin@scullytown.com"
    recipients    self.find_recipients
    sent_on       Time.now
    content_type  "text/html"
    body          :page => page
  end  

end