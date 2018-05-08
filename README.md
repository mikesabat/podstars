# README

5/6 - from branch: show ep2
Status: Most of the basic crud is built via scaffolding. We need to customize a lot of the relationships. 

To do:
Episode form on star#show needs to redirect to star#show upon episode.new submission. Check!

Episode form on star#show needs to autofill the current star_id and hide that field. Check!

Episode creation requires a star_id

Episode creation lists podcasts in a dropdown. Offers the option to create a podcast if the podcast doesn't already exist. check although, not clean
<!-- <%= form.select :star_id, options_for_select([[@star.name, @star.id]]) %>  -->
<!-- <%= form.select :podcast_id, options_for_select([[@podcast.name, @podcast.id]]) %>  -->

Episode creation requires a podcast_id. >> this is done in the controller.

>> Merge back.

5/8 branch cleanup? ::: later.
image sizing.
comment out un-useful pages
add podcast images

or 
5/8 branch for itunes, podcast search
Create branch check
Create Podcast lookup controller
Create podcast lookup form
gem install httparty -- think so. 
Query itunes api and return data
Parse json to build @podcast.new
@podcast autofill /new forms or directly to create function.

User flow - when we want to add a new podcast, we will search in PA, return the results from itunes and then add the details based on what itunes returns. 