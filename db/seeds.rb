#---
# Excerpted from "Agile Web Development with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
# encoding: utf-8

  
ParentCategory.delete_all
p_item1 = ParentCategory.create(name: 'Literature')
p_item2 = ParentCategory.create(name: 'Management')
p_item3 = ParentCategory.create(name: 'Technology')
p_item4 = ParentCategory.create(name: 'Life')

Category.delete_all
fiction = Category.create(name: 'Fiction', parent_category_id: p_item1.id)  
youth = Category.create(name: 'Youth', parent_category_id: p_item1.id)
legend = Category.create(name: 'Legend', parent_category_id: p_item1.id)
economy = Category.create(name: 'Economy', parent_category_id: p_item2.id)
investment = Category.create(name: 'Investment', parent_category_id: p_item2.id)
finance = Category.create(name: 'Finance', parent_category_id: p_item2.id)
building = Category.create(name: 'Building', parent_category_id: p_item3.id)
programming = Category.create(name: 'Programming', parent_category_id: p_item3.id)
physics = Category.create(name: 'Physics', parent_category_id: p_item3.id)
chemistry = Category.create(name: 'Chemistry', parent_category_id: p_item3.id)
health = Category.create(name: 'Health', parent_category_id: p_item4.id)
entertainment = Category.create(name: 'Entertainment', parent_category_id: p_item4.id)
fashion = Category.create(name: 'Fashion', parent_category_id: p_item4.id)

Product.delete_all
Product.create(title: 'CoffeeScript',
  description: 
    %{<p>
        CoffeeScript is JavaScript done right. It provides all of JavaScript's
  functionality wrapped in a cleaner, more succinct syntax. In the first
  book on this exciting new language, CoffeeScript guru Trevor Burnham
  shows you how to hold onto all the power and flexibility of JavaScript
  while writing clearer, cleaner, and safer code.
      </p>},
  image_url:   'cs.jpg',    
  price: 36.00,
  category_id: programming.id)
# . . .
Product.create(title: 'Programming Ruby 1.9',
  description:
    %{<p>
        Ruby is the fastest growing and most exciting dynamic language
        out there. If you need to get working programs delivered fast,
        you should add Ruby to your toolbox.
      </p>},
  image_url: 'ruby.jpg',
  price: 49.95,
  category_id: programming.id)
# . . .

Product.create(title: 'Rails Test Prescriptions',
  description: 
    %{<p>
        <em>Rails Test Prescriptions</em> is a comprehensive guide to testing
        Rails applications, covering Test-Driven Development from both a
        theoretical perspective (why to test) and from a practical perspective
        (how to test effectively). It covers the core Rails testing tools and
        procedures for Rails 2 and Rails 3, and introduces popular add-ons,
        including Cucumber, Shoulda, Machinist, Mocha, and Rcov.
      </p>},
  image_url: 'rtp.jpg',
  price: 34.95,
  category_id: programming.id)
  
Product.create(title: 'A Song of Ice and Fire',
  description: 
    %{<p>
        George R. R. Martin's A Song of Ice and Fire series has become, 
        in many ways, the gold standard for modern epic fantasy. 
        Martin--dubbed the "American Tolkien" by Time magazine--has created 
        a world that is as rich and vital as any piece of historical fiction, 
        set in an age of knights and chivalry and filled with a plethora of fascinating, 
        multidimensional characters that you love, hate to love, or love to hate
         as they struggle for control of a divided kingdom.
      </p>},
  image_url:   'a_song_of_ice_and_fire.jpg',    
  price: 35.96,
  category_id: fiction.id)
# . . .
Product.create(title: 'Lincoln',
  description:
    %{<p>
        David Herbert Donald's Lincoln is a stunningly original portrait of Lincoln's 
        life and presidency. Donald brilliantly depicts Lincoln's gradual ascent from 
        humble beginnings in rural Kentucky to the ever-expanding political circles in Illinois, 
        and finally to the presidency of a country divided by civil war. Donald goes 
        beyond biography, illuminating the gradual development of Lincoln's character, 
        chronicling his tremendous capacity for evolution and growth.
      </p>},
  image_url: 'lincoln.jpg',
  price: 15.57,
  category_id: legend.id)
# . . .

Product.create(title: 'Economics',
  description: 
    %{<p>
        It continues to be innovative 
        while teaching students in a clear, unbiased way. The 19th Edition builds upon the 
        tradition of leadership by sticking to 3 main goals: Help the beginning student 
        master the principles essential for understanding the economizing problem, 
        specific economic issues, and the policy alternatives.
      </p>},
  image_url: 'econo.jpg',
  price: 208.49,
  category_id: economy.id)
  
Product.create(title: 'Healthy Sleep Habits',
  description: 
    %{<p>
        Here Dr. Marc Weissbluth, a distinguished pediatrician and father of four, offers 
        his groundbreaking program to ensure the best sleep for your child. Here Dr. Marc Weissbluth, 
        a distinguished pediatrician and father of four, offers 
        his groundbreaking program to ensure the best sleep for your child.
      </p>},
  image_url: 'hshhc.jpg',
  price: 12.98,
  category_id: health.id)
  
Product.create(title: 'The Wall Street MBA',
  description: 
    %{<p>
        Rick Rickertsen, Managing Partner, Pine Creek Partners; author of Buyout 
        Rick Rickertsen, Managing Partner, Pine Creek Partners; author of Buyout 
        Rick Rickertsen, Managing Partner, Pine Creek Partners; author of Buyout 
        Rick Rickertsen, Managing Partner, Pine Creek Partners; author of Buyout 
        Rick Rickertsen, Managing Partner, Pine Creek Partners; author of Buyout 
        Rick Rickertsen, Managing Partner, Pine Creek Partners; author of Buyout 
        Rick Rickertsen, Managing Partner, Pine Creek Partners; author of Buyout 
        Rick Rickertsen, Managing Partner, Pine Creek Partners; author of Buyout 
        Rick Rickertsen, Managing Partner, Pine Creek Partners; author of Buyout
      </p>},
  image_url: 'wsmba.jpg',
  price: 14.51,
  category_id: finance.id)

Product.create(title: 'Basic Physics',
  description: 
    %{<p>
        Here is the most practical, complete, and easy to use guide available for 
        understanding physics and the physical world. Here is the most practical, 
        complete, and easy to use guide available for understanding physics and the physical world.
      </p>},
  image_url: 'bsp.jpg',
  price: 17.49,
  category_id: physics.id)
  
Product.create(title: 'Entertainment Weekly',
  description: 
    %{<p>
        1264 75 Years of Superman. 1264 75 Years of Superman. 1264 75 Years of Superman. 1264 75 Years of Superman.
        1264 75 Years of Superman. 1264 75 Years of Superman. 1264 75 Years of Superman. 1264 75 Years of Superman.
        1264 75 Years of Superman. 1264 75 Years of Superman. 1264 75 Years of Superman. 1264 75 Years of Superman.
      </p>},
  image_url: 'ew.jpg',
  price: 8,
  category_id: entertainment.id)
  
Product.create(title: 'Housebuilding',
  description: 
    %{<p>
        Housebuilding has always been the book of choice for prospective home builders and with this 
        extensive, thoughtful revision, it becomes a resource readers will continue to depend on for years
        to come. In addition to showcasing 800 exciting new full-color illustrations and more than 50 
        color photographs
      </p>},
  image_url: 'hb.jpg',
  price: 15.52,
  category_id: building.id)

