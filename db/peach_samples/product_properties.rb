products =
  {    
    "Full" => 
    { 
      "Manufacturer" => "Wilson",
      "Brand" => "Wannabe Sports",
      "Model" => "JK1002",
      "Shirt Type" => "Baseball Jersey",
      "Sleeve Type" => "Long",
      "Made from" => "100% cotton",
      "Fit" => "Loose",
      "Gender" => "Men's"
    },
    "Spaghetti Strap Cami" =>
    {
      "Manufacturer" => "Jerseys",
      "Brand" => "Resiliance",
      "Model" => "TL174",
      "Shirt Type" => "Jr. Spaghetti T",
      "Sleeve Type" => "None",
      "Made from" => "90% Cotton, 10% Nylon",
      "Fit" => "Form",
      "Gender" => "Women's"
    },
    "Ribbed-knit Tank" =>
    {
      "Manufacturer" => "Jerseys",
      "Brand" => "Conditioned",
      "Model" => "TL9002",
      "Shirt Type" => "Ringer T",
      "Sleeve Type" => "Short",
      "Made from" => "100% Vellum",
      "Fit" => "Loose",
      "Gender" => "Men's"
    },
    "Plunge" =>  
    {
      "Type" => "Tote",
      "Size" => %Q{15" x 18" x 6"},
      "Material" => "Canvas"
    },
    "Sleeveless Tee" => 
    {
      "Type" => "Messenger",
      "Size" => %Q{14 1/2" x 12" x 5"},
      "Material" => "600 Denier Polyester"
    },
    "Bikini" => 
    {
      "Type" => "Mug",
      "Size" => %Q{4.5" tall, 3.25" dia.}
    },
    "Thong" =>
    {
      "Type" => "Stein",
      "Size" => %Q{6.75" tall, 3.75" dia. base, 3" dia. rim}
    },
    "Girlshort" =>
    {
      "Type" => "Stein",
      "Size" => %Q{6.75" tall, 3.75" dia. base, 3" dia. rim}
    },
    "Brief" => 
    {
      "Type" => "Mug",
      "Size" => %Q{4.5" tall, 3.25" dia.}
    },
    "Relaxed Legging" => 
    {
      "Type" => "Tote",
      "Size" => %Q{15" x 18" x 6"}
    },
    "Everyday Pant" => 
    {
      "Type" => "Messenger",
      "Size" => %Q{14 1/2" x 12" x 5"}
    },
    "Flyaway Jacket" =>
    {
      "Manufacturer" => "Wilson",
      "Brand" => "Wannabe Sports",
      "Model" => "JK1002",
      "Shirt Type" => "Baseball Jersey",
      "Sleeve Type" => "Long",
      "Made from" => "100% cotton",
      "Fit" => "Loose",
      "Gender" => "Men's"
    },
    "Scoop Neck Cami" =>
    {
      "Manufacturer" => "Jerseys",
      "Brand" => "Resiliance",
      "Model" => "TL174",
      "Shirt Type" => "Jr. Spaghetti T",
      "Sleeve Type" => "None",
      "Made from" => "90% Cotton, 10% Nylon",
      "Fit" => "Form",
      "Gender" => "Women's"
    },
    "Everyday Jacket" =>
    {
      "Manufacturer" => "Jerseys",
      "Brand" => "Conditioned",
      "Model" => "TL9002",
      "Shirt Type" => "Ringer T",
      "Sleeve Type" => "Short",
      "Made from" => "100% Vellum",
      "Fit" => "Loose",
      "Gender" => "Men's"
    },
    "Wrap Cami" =>
    {
      "Manufacturer" => "Jerseys",
      "Brand" => "Conditioned",
      "Model" => "TL9002",
      "Shirt Type" => "Ringer T",
      "Sleeve Type" => "Short",
      "Made from" => "100% Vellum",
      "Fit" => "Loose",
      "Gender" => "Men's"
    },
    "Wrap Chemise" =>
    {
      "Manufacturer" => "Jerseys",
      "Brand" => "Conditioned",
      "Model" => "TL9002",
      "Shirt Type" => "Ringer T",
      "Sleeve Type" => "Short",
      "Made from" => "100% Vellum",
      "Fit" => "Loose",
      "Gender" => "Men's"
    },
  }

products.each do |name, properties|
  product = Spree::Product.find_by_name(name)
  properties.each do |prop_name, prop_value|
    product.set_property(prop_name, prop_value)
  end
end
