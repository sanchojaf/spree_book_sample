Spree::PeachSample.load_peach_sample("option_types")

size = Spree::OptionType.find_by_presentation!("Size")
color = Spree::OptionType.find_by_presentation!("Color")

Spree::OptionValue.create!([
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
    :name => "Heater Grey",
    :presentation => "Heater Grey",
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
])
