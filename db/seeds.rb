kahn = Resource.create({name: 'Kahn Academy', 
                  website: 'https://www.khanacademy.org/', 
                  price: 'Free', 
                  image: 'http://i.imgur.com/U3fi4o7.png', 
                  description: "Khan Academy offers practice exercises, instructional videos, and a personalized learning dashboard that empower learners to study at their own pace in and outside of the classroom. We tackle math, science, computer programming, history, art history, economics, and more. Our math missions guide learners from kindergarten to calculus using state-of-the-art, adaptive technology that identifies strengths and learning gaps. We've also partnered with institutions like NASA, The Museum of Modern Art, The California Academy of Sciences, and MIT to offer specialized content."
                  })
udacity = Resource.create({name: 'Udacity', 
                  website: 'https://www.udacity.com/', 
                  price: 'Most courses are $200/month for 6-9 months', 
                  image: 'http://i.imgur.com/ZraYjD3.png', 
                  description: "Udacity offers Nanodegree programs and credentials, designed so professionals become Web Developers, Data Analysts, Mobile Developers, etc. Students acquire real skills through a series of online courses and hands-on projects." 
                  })
treehouse = Resource.create({name: 'Treehouse', 
                  website: 'https://teamtreehouse.com', 
                  price: 'Basic Plan: $25/month; Pro Plan: $49/month; 14 day free trial available', 
                  image: 'http://i.imgur.com/eag0mvw.png', 
                  description: "Whether you are trying to land a new job, brush up on your skills, or learn how to build your ideas, Treehouse has the right content for you. Treehouse teaches the skills necessary to get a new job or stay fresh on your game at an existing gig. Basic plans allow access to 1,000+ videos, the Code Challenge Engine, and members-only help forums. Additionally, the Pro Plan allows you to watch talks from industry leaders and other bonus content."
                  })

ga = Resource.create({name: 'General Assembly', 
                      website: 'https://generalassemb.ly/',
                      price: 'Free online resources, 1-night workshops starting around $30, Full-time immersive programs starting at $10,500, and lots in between', 
                      image: 'http://i.imgur.com/iAOGyO9.png',
                      description: 'At General Assembly, we are creating a global community of individuals empowered to pursue work they love, by offering full-time immersive programs, long-form courses, and classes and workshops on the most relevant skills of the 21st century – from web development and user experience design, to business fundamentals, to data science, to product management and digital marketing.Established in early 2011 as an innovative community in New York City for entrepreneurs and startup companies, General Assembly is an educational institution that transforms thinkers into creators through education in technology, business and design at fourteen campuses across four continents.'
                      })

free = Tag.create({image: 'fa-usd', text: 'Free'}) 
degree = Tag.create({image: 'fa-graduation-cap', text: 'Degree or Certificate'})
teachers = Tag.create({image: 'fa-certificate', text: 'Professional Teachers'}) 
online = Tag.create({image: 'fa-laptop', text: 'Learn online'})
community = Tag.create({image: 'fa-users', text:'Learn from Community Members'}) 
inperson = Tag.create({image: 'fa-university', text:'In-Person Classes'})
bootcamp = Tag.create({image: 'fa-language', text: 'Bootcamp or Full-Time'})
beginners = Tag.create({image: 'fa-cubes', text: 'Good for Beginners'})
iOS = Tag.create({image: 'fa-apple', text: 'iOS Development'})
github = Tag.create({image: 'fa-github', text: 'Github'})
ruby = Tag.create({image: 'fa-diamond', text: 'Ruby'})
javascript = Tag.create({image: 'fa-code', text: 'Javascript'})
html = Tag.create({image: 'fa-file-code-o', text: 'HTML/CSS'})
sql = Tag.create({image: 'fa-database', text: 'SQL Databases'})
advanced = Tag.create({image: 'fa-line-chart', text: 'Advanced Courses'})

zoe = User.create({first_name: 'Zoe', last_name: 'Test', email: 'zoe@test.com', password: 'test'})
demo = User.create({first_name: 'Demo', last_name: 'Demo', email: 'demo@test.com', password: 'demo'})


kahn.tags << [teachers, online, free, beginners, community, ruby, javascript, html, sql, advanced]
udacity.tags << [degree, teachers, online, community, beginners, iOS, ruby, javascript, html]
treehouse.tags << [teachers, online, community, beginners, advanced, iOS, ruby, javascript, html, advanced]
ga.tags <<  [degree, teachers, online, inperson, beginners, community, free, bootcamp, ruby, javascript, sql, html, advanced]

zoe.resources << [kahn, ga]
demo.resources << [udacity, treehouse]
