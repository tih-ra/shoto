class Msender < ActionMailer::Base

  def simple_mail(options, body)
    setup_openmail(options, body)
  end
  
  
  protected
    def setup_openmail(options, body)
      @recipients  = options[:email]
      @from        = "My Self"
      @subject     = options[:subject]
      @sent_on     = Time.now
      @body[:body] = body
    end
end
