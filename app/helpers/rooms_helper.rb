module RoomsHelper
    def user_gravatar(user, size: 80)
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
       "http://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
      end
end
