module HammyBulletHelper

  # "Hammy bullet" shows up on search engine descriptions and Davo is pissed.
  # Set alt: nil to avoid it.
  def hammy_bullet
    image_tag "public/home/index/hammy_bullet.png", alt: nil
  end
end
