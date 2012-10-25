class UserMailer < ActionMailer::Base
    default from: "padseeker@gmail.com"
    default_url_options[:host] = "localhost:3000"
  
    def password_reset_instructions(user)
        emailBody = "Password reset - A request to reset your password has been made. If you did not make this request, simply ignore this email.  If you did make this request just click the link below:\r\n" +
                        edit_password_reset_url(user.perishable_token) + "\r\n" +
        "If the above URL does not work try copying and pasting it into your browser. If you continue to have problem please feel free to contact us."
        @user = user
        mail(:subject => "Password Reset Instructions for User from Best Neon Company Portal",
            :to => user.email,
            :reply_to => "bestneone@gmail.com"
        )
    end
    
end