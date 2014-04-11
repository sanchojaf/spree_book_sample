size = Spree::OptionType.find_by_presentation!("Size")
color = Spree::OptionType.find_by_presentation!("Color")

Spree::OptionValue.delete_all

option_values = [
  {
    :name => "XS",
    :presentation => "XS",
    :position => 1,
    :option_type => size
  },
  {
    :name => "S",
    :presentation => "S",
    :position => 2,
    :option_type => size
  },
  {
    :name => "M",
    :presentation => "M",
    :position => 3,
    :option_type => size
  },
  {
    :name => "L",
    :presentation => "L",
    :position => 4,
    :option_type => size
  },
  {
    :name => "XL",
    :presentation => "XL",
    :position => 5,
    :option_type => size
  },
  {
    :name => "XXL",
    :presentation => "XXL",
    :position => 6,
    :option_type => size
  },
  {
    :name => "Black",
    :presentation => "Black",
    :position => 1,
    :option_type => color
  },
  {
    :name => "Natural",
    :presentation => "Natural",
    :position => 2,
    :option_type => color,
  },
  {
    :name => "White",
    :presentation => "White",
    :position => 3,
    :option_type => color,
  },
  {
    :name => "Cream",
    :presentation => "Cream",
    :position => 4,
    :option_type => color,
  },
  {
    :name => "Gray",
    :presentation => "Gray",
    :position => 5,
    :option_type => color,
  },
  {
    :name => "Heather Grey",
    :presentation => "Heather Grey",
    :position => 6,
    :option_type => color
  },
  {
    :name => "Blossom",
    :presentation => "Blossom",
    :position => 7,
    :option_type => color,
  },
  {
    :name => "Eggplant",
    :presentation => "Eggplant",
    :position => 8,
    :option_type => color
  },
  {
    :name => "Lilac",
    :presentation => "Lilac",
    :position => 9,
    :option_type => color
  }
]

option_values.each do |option_value_attrs|
  name = option_value_attrs[:name]
  option_value = Spree::OptionValue.find_by_name(name) || Spree::OptionValue.new(:name => name)
  option_value.update_attributes! option_value_attrs
end


