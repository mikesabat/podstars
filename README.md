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

5/10 branch cleanup?
image sizing.
comment out un-useful pages
add podcast images
podcast must be unique



User flow - when we want to add a new podcast, we will search in PA, return the results from itunes and then add the details based on what itunes returns. 

itunes query url: https://itunes.apple.com/search?attribute=titleTerm&entity=podcast&media=podcast&term=search+term&limit=5&lang=en_us

PUSHED 5/10 branch for itunes, podcast search
Create branch - check
Create lookup controller check
Create lookup form check
Capture @lookup check 
Change @lookup = "podcast name" to "podcast+name" check
Build itunes link check
Query itunes check
	
Save returned data. check
	gem install httparty -- think so. 
	Query itunes api and return data
Parse json to build & display podcast - check
@podcast autofill /new forms or directly to create function. -check 