class User < ActiveRecord::Base
  has_many :feeds

  def self.set_data_from_omnifb_info(fb_info)
    where(facebook_id: fb_info['uid']).first_or_create(
      facebook_id:  fb_info['uid'],
      email:        fb_info['info']['email'],
      full_name:    fb_info['extra']["raw_info"]['name'],
      token:        fb_info['credentials']['token']
    )
  end
end
