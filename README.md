# ActsAsLocalized

ActsAsLocalized extends ActiveRecord to add localization mechanism for model attributes.

## Example

```ruby
create_table :pictures do |t|
  t.string :title_en
  t.string :title_fr
  t.text :description_en
  t.text :description_fr
end

class Picture < ActiveRecord::Base
  acts_as_localized :title, :description
end

picture = Picture.create!(
  :title_en       => 'Title EN',
  :title_fr       => 'Title FR',
  :description_en => 'Description EN',
  :description_fr => 'Description FR',
)

I18n.locale = :en
picture.title # => Title EN
I18n.locale = :fr
picture.title # => Title FR
```

---

Copyright 2015 Oleg Khabarov
