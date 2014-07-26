TrackYourTrailer
==================

#### A Rails web application that takes the guesswork out of movie night! ####

###### 1. Search for upcoming movies you want to see. ######
###### 2. Add them to your personal list. ######
###### 3. We’ll send you text and email reminders when they come out. ######
###### 4. Never worry about missing great movies again. ######

##### General Information: ####
- Utilizes the <a href="http://developer.rottentomatoes.com/" targt="_blank">Rotten Tomatoes API</a> to power content on the site
- Integrates with the Twilio API via the <a href="https://github.com/twilio/twilio-ruby" target="_blank">twilio ruby gem</a> to transmit SMS reminders.
- Uses an ActionMailer implementation to generate and deliver e-mail based reminders
- Homegrown simple text verification system
- Deployed to heroku at <a href="http://trackyourtrailer.herokuapp.com/" target="_blank">http://trackyourtrailer.herokuapp.com</a>
- Uses Heroku scheduler to run cron jobs in production including sending text/e-email reminders, and seeding the database for upcoming movies.
- Uses the <a href="https://github.com/thoughtbot/factory_girl_rails" target="_blank">factory_girl_rails gem</a> to support unit tests on the User and Movie models
- Incorporates the <a href="https://wrapbootstrap.com/theme/wonder-multipurpose-theme-WB06M01T2" target="_blank">Wonder Bootstrap Theme</a>
