class User < ActiveRecord::Base
 has_attached_file :avatar,
   styles: { medium: "300x300>", thumb: "20x20>" },
   default_url: "/images/default_image.png"

  validates_attachment_content_type :avatar,
    content_type: /\Aimage\/.*\Z/

  def self.set_data_from_omnifb_info(fb_info)
    where(facebook_id: fb_info['uid']).first_or_create(
      facebook_id:  fb_info['uid'],
      email:        fb_info['info']['email'],
      full_name:    fb_info['extra']["raw_info"]['name'],
      token:        fb_info['credentials']['token']
    )
  end
end
