// box_data.dart

/// Represents the data model for a product box in the app.
class BoxData {
  final String imagePath;   // Path to the product image
  final String productName; // Name of the product
  final String price;       // Price of the product
  final String category;    // Category to which the product belongs
  final String? description; // Optional detailed description of the product

  /// Constructor with all necessary properties
  BoxData({
    required this.imagePath,
    required this.productName,
    required this.price,
    required this.category,
    this.description,
  });
}

/// A sample dataset containing a list of products
List<BoxData> boxDataset = [
  BoxData(
    imagePath: 'images/product-images/product1.png',
    productName: "Odonil Gel Pocket Mix - 30g (Assorted pack of 3 new fragrances)",
    price: "129",
    category: 'Home Essentials',
    description: 'Odonil Gel Pocket Mix - 30g (Assorted pack of 3 new fragrances) | Infused with Essential Oils | Germ Protection | Lasts Up to 30 days | Air Freshener for Bathroom and Toilet',
  ),
  BoxData(
    imagePath: 'images/product-images/product2.png',
    productName: "Bella Vita Luxury CEO Man Eau De Parfum Perfume",
    price: "499",
    category: 'Men',
    description: "Life in the Fast Lane! Perfect for everyday wear, CEO MAN Eau De Parfum "
        "elevates the 'CEO' in you. Refreshingly daring yet long-lasting with top hints of lemon "
        "and sugar delicately energizing with Lavender at its heart and finally, arise the vetiver, "
        "moss and tonka's sharply-dressed base. This perfume honors your debonair and charismatic "
        "personality, allowing you to be true to yourself, just with the 'CEO' touch added to it!",
  ),
  BoxData(
    imagePath: 'images/product-images/product3.png',
    productName: "Apple 20W USB-C Power Adapter",
    price: "1549",
    category: 'Electronics',
    description: 'The Apple 20W USB‑C Power Adapter offers fast, efficient charging at home, in the office, '
        'or on the go. While the power adapter is compatible with any USB‑C-enabled device, Apple recommends '
        'pairing it with the 11-inch iPad Pro and 12.9-inch iPad Pro (3rd generation) for optimal charging performance. '
        'You can also pair it with iPhone 8 or later to take advantage of the fast-charging feature.',
  ),
  BoxData(
    imagePath: 'images/product-images/product4.png',
    productName: "Apple iPhone 16 (128 GB) - Ultramarine",
    price: "77,900",
    category: 'Electronics',
    description: 'Built for Apple Intelligence with the all-new A18 chip, both models feature Camera Control, '
        'powerful upgrades to the advanced camera system, the Action button to quickly access useful features, '
        'and a big boost in battery life.',
  ),
  BoxData(
    imagePath: 'images/product-images/product5.png',
    productName: "U.S. POLO ASSN. Men Vertical Stripe Premium Cotton Regular Fit Casual Shirt",
    price: "1649",
    category: 'Men',
    description: 'This striped shirt from the Sunwashed Spring is light, breezy, and a great wardrobe choice '
        'for a relaxed casual look.',
  ),
  BoxData(
    imagePath: 'images/product-images/product6.png',
    productName: "Lavie Women's Nova Tote Bag",
    price: "1049",
    category: 'Women',
    description: 'Lavie Malnov tote is a stylish offering for ladies. It is durable, lightweight, and super spacious. '
        'Made from vegan leather, this large handbag comes in Herringbone, Woven, and Croco texture patterns at the front.',
  ),
  BoxData(
    imagePath: 'images/product-images/product7.jpg',
    productName: "Symbol Premium Men's Cotton White Handkerchief with Coloured Border (Pack of 3)",
    price: "369",
    category: 'Men',
    description: "Symbol Premium Men's Handkerchiefs are made with 100% 2ply cotton for the ultimate comfort and durability. These handkerchiefs are designed to offer a perfect blend of softness, absorbency, and long-lasting quality. This Handkerchiefs adds a touch of sophistication to your daily essentials.",
  ),
  BoxData(
    imagePath: 'images/product-images/product8.png',
    productName: "ZORO Men Vegan Leather Belt for Men | Black | Autolock Buckle Belt (Black J71)",
    price: "199",
    category: 'Men',
    description: "This men's belt has a width of 40mm, which is a standard size that can suit many different occasions and styles. It is a cut to fit style belt, which means that it can be adjusted to fit the wearer's waist size. The belt comes in black color, which is a classic and versatile color that can match with many different outfits. It's made of vegan leather which is a synthetic or plant based alternative to traditional leather. It's a great option for those who want to avoid using animal products. The belt comes with a brand box, which can be used for storage and protection of the belt when not in use. Overall, this belt is a great choice for those who are looking for a versatile, durable, and animal friendly belt option.",
  ),
  BoxData(
    imagePath: 'images/product-images/product9.png',
    productName: "Pinkmint Popcorn Shirt for Men Soild Slim Fit Sleeve Spread Collar Trendy Men Shirt Summer Wear Goa Wear Olive",
    price: "379",
    category: 'Men',
    description: "Available in various sizes, this shirt ensures a comfortable fit for every man, making it a perfect gift for popcorn lovers of all ages. Machine washable for easy care, this shirt retains its color and detail wash after wash, ensuring long-lasting enjoyment. Men's Shirt is a must-have addition to your wardrobe. Treat yourself or surprise a friend with this delightful shirt that brings a bit of movie magic to everyday wear.",
  ),
  BoxData(
    imagePath: 'images/product-images/product10.png',
    productName: "SJeware 6 Pairs Sports Solid Ankle Length Socks for Men & Women, Multicolor, Pack of 6, Free Size",
    price: "129",
    category: 'Men',
    description: "Premium Cotton Socks Feel as good as they look; Maximum Comfort even with All-day wear. 60% Cotton, 37% Polyester, 3% Spandex",
  ),
  BoxData(
    imagePath: 'images/product-images/product11.png',
    productName: "Garnier Men, Face Wash, Brightening & Anti-Pollution, TurboBright Double Action, 100 g",
    price: "229",
    category: 'Men',
    description: "Garnier Men Power White Double Action Face Wash is Garnier Men's first dual textured face wash. It helps remove dust and pollution from your face. It gives instant fairness and reduces dullness.",
  ),
  BoxData(
    imagePath: 'images/product-images/product12.png',
    productName: "Park Avenue Good Morning Grooming Collection 7 in-1 Combo Grooming Kit for Men | Gift Set for Men | Diwali Gift Hampers | Shaving Kit for Men | Shaving Foam | After Shave | Gift Hamper for Men, Husband, Boyfriend | Free Travel Pouch Inside",
    price: "312",
    category: 'Men',
    description: "Introducing the Park Avenue Good Morning Grooming Kit – your go-to solution for a true champion’s. This comprehensive shaving kit for men includes everything you need for a top-notch grooming experience. From a precision-engineered razor to a selection of grooming essentials like shaving gel for men, this grooming kit for men is designed to cater to your every grooming need. This Park Avenue Good Morning Grooming Collection Kit is the perfect gift for men, husband and boyfriend. It works as a perfect option for Father’s Day gift for dad, Valentine’s Day, diwali gift hampers, Christmas gift, New Year gift, Diwali gift or birthday gift, anniversary gift etc.",
  ),
  BoxData(
    imagePath: 'images/product-images/product13.png',
    productName: "GRECIILOOKS Trouser Pant for Men | Track Pant for Men Loose Fit | Sports Track Pant for Men | Track Pant Men | Men Stylish Track Pant",
    price: "479",
    category: 'Men',
    description: "Men track pants combine comfort and style for casual wear or athletic activities. Designed with soft, flexible fabrics and often featuring adjustable waistbands and tapered legs, these pants offer versatility and functionality for various occasions. The smooth fabric offers all-day comfort, making them versatile for both athletic activities and casual wear.",
  ),
  BoxData(
    imagePath: 'images/product-images/product14.png',
    productName: "SKMEI Men's Watch New Wheels Rolling Creative Fashion Che Youhui League Fans Butterfly Double Snap Gift Wristwatch - 1990",
    price: "1799",
    category: 'Men',
    description: "Stylish Design for Guys: The SKMEI Men's Watch has a cool design inspired by car wheels, making it unique and fashionable. The watch has a special spinning dial that can rotate all the way around. It looks like the inside of a machine and is perfect for people who love cars.",
  ),
  BoxData(
    imagePath: 'images/product-images/product15.png',
    productName: "Philips India's No.1 Men's Trimmer | Self Sharpening Blades | Single Stroke Grooming I 9 in1 Face, Nose and Body I 3 year warranty | Powerful motor | No Oil Needed I 60 min runtime I MG3710/65",
    price: "1796",
    category: 'Men',
    description: "Try out a new look, any day of the week, with this durable all-in-one trimmer. 9 quality tools allow you to easily create your preferred facial style, cut your hair, and groom your body. Get rid of unwanted hair with nose and ear trimmer",
  ),
  BoxData(
    imagePath: 'images/product-images/product16.png',
    productName: "Leriya Fashion T-Shirt for Men || Black Men T-Shirt || || Men Polo T-Shirt || Men Pain T-Shirt",
    price: "379",
    category: 'Men',
    description: "A Full Sleeve Polo T-Shirt is a versatile and stylish addition to any wardrobe. Perfect for both casual and semi-formal occasions",
  ),

  BoxData(
    imagePath: 'images/product-images/product17.png',
    productName: "Bella Vita Luxury Woman Eau De Parfum Gift Set 4x20 ml for Women with Date, Senorita, Glam, Rose Perfume|Floral, Fruity Long Lasting EDP Fragrance Scent",
    price: "549",
    category: 'Women',
    description: "Spray the perfume on your pulse points (sides of the neck and both wrists) for all-day freshness",
  ),
  BoxData(
    imagePath: 'images/product-images/product18.png',
    productName: "KOTTY Women Polyester Blend Solid Trousers",
    price: "279",
    category: 'Women',
    description: "These women stylish solid pant from kotty are perfect pick for you.We offer a wide range of good quality attractive imported regular length casual pant.these straight fit pant are made with 98% polyester and 2% lycra fabric.Wear these solid high rise pant with top and heels depending on your preference.kindly ensure the size chart before buying.",
  ),
  BoxData(
    imagePath: 'images/product-images/product19.png',
    productName: "KSHS Women's Cotton Printed Night Suit Set of Top & Shorts",
    price: "474",
    category: 'Women',
    description: "Purpose: night suit for women | Fit Type: Regular (Relaxed) Fit | MATERIAL: 100% Super Combed Cotton with stylish and crazy prints. This Night Dress is made of the best quality breathable cotton fabric | CONTENT: 1 Printed Top and 1 Printed Short - Ideal for Sleepwear | Loungewear | Nightwear | Active Wear | Top and Shorts Set for Women | Short Night Suits for Women | Night Suit Set for Women | SHORTS: Waist is elasticated along with Drawstring and comes with convenient both side pockets.",
  ),
  BoxData(
    imagePath: 'images/product-images/product20.png',
    productName: "Lavie Women's Small Framed Foldover Clutch | Detachable Chain Sling Strap | Ladies Purse Wallet",
    price: "649",
    category: 'Women',
    description: "Thin classy chain sling belt that adds to the aesthetics, Front flap with a metal edge and snap fastener",
  ),
  BoxData(
    imagePath: 'images/product-images/product21.png',
    productName: "GoSriKi Women's Rayon Blend Printed Straight Kurta with Pant & Dupatta",
    price: "689",
    category: 'Women',
    description: "GoSriKi Women's Rayon Blend Printed Straight Kurta with Pant & Dupatta (MASLIN-MULTI-GS_4XL_Peach_XXXX-Large)",
  ),
  BoxData(
    imagePath: 'images/product-images/product22.png',
    productName: "Istyle Can Plain Round Neck Rib Knit Regular Top for Women",
    price: "358",
    category: 'Women',
    description: "Made from high-quality ribbed fabric that is soft to the touch. Snug fit that flatters your figure | Rib-knit design adds texture and depth to the fabric. High-neck design adds a touch of elegance to your outfit. Perfect for any occasion - dress it up or down | Breathable fabric keeps you cool and comfortable all day long. Easy to care for - machine washable. Durable fabric that will last you for years to come",
  ),
  BoxData(
    imagePath: 'images/product-images/product23.png',
    productName: "SWISSTONE Analog Stainless Steel Silver Plated Women's Watch (Pink Dial Silver Colored Strap)",
    price: "389",
    category: 'Women',
    description: "Swisstone brings to you this watch which is designed for the woman with an adventurous spirit and a knack for stylish timepieces. The watch is pink in colour and complements your overall persona when you adorn it. It has a round dial with a metallic strap. The hour and minute hands are spread across the dial which has symbols instead of numerals.",
  ),
  BoxData(
    imagePath: 'images/product-images/product24.png',
    productName: "Kuber Industries Handkerchiefs|Leaf Print Cutwork Soft Cotton Hankies for Woman,Girls & Wicking Sweat from Hands,Face,Set of 12 (Multicolor)",
    price: "188",
    category: 'Women',
    description: "FITS IN YOUR BAG,PURSE OR POCKET: Compact And Neutral, perfect for quick fresh ups, first dates, interviews, summer concerts, and anything in between. With these handkerchiefs, you will always have protection against sweat. They can easily fit into your bags, pockets and even smaller spaces. | FASHIONABLE & DRIES QUICKLY: There's no better mix of good looking and useful than these designed handkerchiefs, this pack comes in different colors to keep things interesting for every day of the week! You can have them as a classy pocket square or as a typical old-school back-pocket cleaning tool. They are completely soft, absorbent and moisture-wicking. At the same time, it is able to quickly absorb any type of sweat, making them easy to use.",
  ),
  BoxData(
    imagePath: 'images/product-images/product25.png',
    productName: "Maybelline New York Liquid Foundation, Matte & Poreless, Full Coverage Blendable Normal to Oily Skin, Fit Me, 220 Natural Beige, 18ml",
    price: "180",
    category: 'Women',
    description: "Perfect your skin by using Fit Me Matte + Poreless liquid foundation for a perfectly poreless finish that looks totally natural - no more cakiness! Fit Me Matte + Poreless is suitable for normal to oily skin and is now available in several shades. Blotting micro powders contained in the formula absorbs shine for flawless results. Additionally, the lightweight formula provides a smooth, natural-looking matte finish that covers imperfections. It stays in place for 12 hours.",
  ),

  BoxData(
    imagePath: 'images/product-images/product26.png',
    productName: "Zodo 8. 5 inch LCD E-Writer Electronic Writing Pad/Tablet Drawing Board (Paperless Memo Digital Tablet)",
    price: "135",
    category: 'Electronics',
    description: "Zodo Brings to us this 8.5 inch LCD E-writer. This Tab can be used for writing notes down or to draw sketch etc. The tab promotes the initiative to go paperless. Included with the tablet is a receptive stylus that is smooth like a pen. The tab also has a convenient one touch erase option .",
  ),
  BoxData(
    imagePath: 'images/product-images/product27.png',
    productName: "Elv Foldable, Portable, Tablet/Phone Stand. Compatible Phone Holder for iPhone, Android, Samsung, OnePlus, Xiaomi, Oppo, Vivo, Asus. Perfect for Bed,Office, Home,Gift and Desktop (Black)",
    price: "59",
    category: 'Electronics',
    description: "Adjustable Viewing Angle: Vertical and horizontal support. You can put it on the table or on the bed, Perfect for watching videos, reading, video recording, viewing photos, and free your hands. | Universal Compatibility: Suit for Home, Office, Living Room, Bedroom, Kitchen, Dining Table, Desktop.",
  ),
  BoxData(
    imagePath: 'images/product-images/product28.png',
    productName: "boAt Rockerz 550 Over Ear Bluetooth Headphones with Upto 20 Hours Playback, 50MM Drivers, Soft Padded Ear Cushions and Physical Noise Isolation(Black)",
    price: "1799",
    category: 'Electronics',
    description: "boAt Rockerz 550 is an over-ear wireless headset that has been ergonomically designed to meet the needs of music lovers. The headphones come equipped with the latest Bluetooth v5.0 for instant wireless connectivity. Its powerful 500mAh battery provides playtime of up to 20 hours for an extended audio bliss. Its 50mm dynamic drivers help supply immersive musical experience to the user with immersive sound. The user can utilize the headset via dual connectivity in the form of Bluetooth and AUX.",
  ),
  BoxData(
    imagePath: 'images/product-images/product29.png',
    productName: "Apple iPad (10th Generation): with A14 Bionic chip, 27.69 cm (10.9″) Liquid Retina Display, 64GB, Wi-Fi 6, 12MP front/12MP Back Camera, Touch ID, All-Day Battery Life – Pink",
    price: "33,490",
    category: 'Electronics',
    description: "Display · 10.9-inch (diagonal) LED backlit Multi‑Touch display with IPS technology · 2360x1640-pixel resolution at 264 pixels per inch (ppi) · True Tone display.",
  ),
  BoxData(
    imagePath: 'images/product-images/product30.png',
    productName: "Pigeon by Stovekraft Cruise 1800 watt Induction Cooktop With Crystal Glass,7 Segments LED Display, Auto Switch Off - Black",
    price: "1299",
    category: 'Electronics',
    description: "Pigeon's Cruise Induction Cooktop features an 1800 watt power supply and a 7-segment LED display. This induction cooktop has been ergonomically designed to fit your kitchen space and is guaranteed to be long-lasting and energy efficient.",
  ),
  BoxData(
    imagePath: 'images/product-images/product31.png',
    productName: "JioTag Air |Works with Apple Find My on iPhone|Global Tracking|BT Tracker|Find Keys,Wallets,Luggage,Pets,Gadgets etc|Loud 120 dB Sound|BT 5.3|Upto 12 Month Battery|Extra Battery, Lanyard|No SIM Needed",
    price: "1499",
    category: 'Electronics',
    description: "Keep track of and find your valuables by attaching your JioTag Air to these items",
  ),
  BoxData(
    imagePath: 'images/product-images/product32.png',
    productName: "Fire-Boltt Ninja Call Pro Plus 46.48mm (1.83 inch) Smart Watch with Bluetooth Calling, AI Voice Assistance, 120 Sports Modes IP67 Rating, 240 * 280 Pixel High Resolution (Black)",
    price: "1399",
    category: 'Electronics',
    description: "The 46.48mm (46.48mm (1.83 inch)-) HD display makes the display clear and true-to-life, with vivid colours ensuring smooth readability and keeping the watch as exquisite to look at as when you first lay your eyes on it. The watch has a 280 NITS Peak Brightness | The 46.48mm (46.48mm (1.83 inch)-) HD display makes the display clear and true-to-life, with vivid colours ensuring smooth readability and keeping the watch as exquisite to look at as when you first lay your eyes on it. The watch has a 280 NITS Peak Brightness",
  ),
  BoxData(
    imagePath: 'images/product-images/product33.png',
    productName: "HyperX Solocast-USB Condenser Gaming Unidirectional Microphone,for Pc,Ps4,and Mac,Tap-to-Mute Sensor,Cardioid Polar Pattern,Gaming,Streaming,Podcasts,Twitch,YouTube,Discord(Hmis1X-Xx-Bk/G,Black)",
    price: "4676",
    category: 'Electronics',
    description: "For video editors, streamers, and gamers looking for a USB microphone with great sound quality, the HyperX SoloCast is a must have. It’s Plug N Play, making it simple to use, with some of our fan-favorite conveniences like the tap-to-mute sensor and LED mute indicator. The versatile microphone has a flexible, adjustable stand and is also compatible with most boom arms, so it can either sit on your desk or work mounted. Certified by TeamSpeak and Discord and compatible with OBS, XSplit, Streamlabs OBS and a number of other programs, it’s an extremely streamer-friendly microphone.",
  ),




  // Additional products can be added here as needed.
];