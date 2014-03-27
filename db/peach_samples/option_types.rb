Spree::OptionType.create!([
  {
    :name => "size",
    :presentation => "Size",
    :position => 1
  },
  {
    :name => "color",
    :presentation => "Color",
    :position => 2
  }
])

puts "option_types ///////////// #{Spree::OptionType.all}"
