# README

Learnings....
linking_to a controler action and passing params. 
<%= link_to "Create Star", stars_path(star: {:name => @star[:name]}), :method => :post %>
link_to "Display Text", path(params_object: {:param_label = param_value}), :method => :post (method = post to trigger create)


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

5/10 branch cleanup?
add podcast images -- need to ask zach.
image sizing - check
comment out un-useful pages (podcast new, episode index, episode new, episode show) - check
Check the number of results from itunes#podcast - I don't think we'll need this. Eventually, we will search for a star - find the podcast and then add the podcast and the star. Maybe rethink the user flow. 
podcasts/new is broke. Should we hide it and make all podcast creation happen after search? - check
podcast must be unique - cccccheck
star must be unique - check
Links in the app -- check
Create New Podcast routes to /lookup - check
MERGE BACK



Search for guest >> list podcast with guest in the title. check
 - Should we save search?
 - How does pagination work?
ENV Variables for mashape API key. check
 - Create Star link on star search results. redirect to star show and list podcasts. Check
 Click on Episode "+" button
 - If podcast isn't already created, create Podcast **** Going to do this in the Episode#Create action. If we try to create an episode for a podcast that doesn't exist, we will create it. Check
 - Create Episode and list it for Star. Check
   - Shorten the Episode description in the view, with the ability to "Show More..." check .truncate()


 Next
 Lose the episode form on the star/show page. Check
 Save Podcast image from search/url. Check
 We are creating podcast simply with names via Star > Episode > Create flow. On the Podcast/index we should have a lookup button, that pulls the itunes information. Check

**Admin flow:
1. Think of a star.
2. Search the star to see if they have podcasts
3. Create the Star > Add bio etc.
4. Select Episodes from potential list.
5. Selection with find or create podcast and add Episode to Star.
6. Manually clean up podcast by clicking "Get itunes details." Can we do this automatically?


May23 Cleanup
 nav bar = /stars and /podcasts +Check
 Remove "New Star" from Stars page +Check
 Make sure episodes are unique +Check
 Add Podcast name to added Episodes Check
 Change Star_id and podcast_id from Star - Episode list/show page. Check - gone

 Add Date to podcast list -- "date" is a reserved word in rails check
 Size podcast image. - Check. Hacked in view. Zach?
 Add podcast image icon to /podcasts list check
 Removed Description from podcasts/index list. Check
 highlight "Creat Star" link. Add a </br> there. wait on highlight color. 
 Display star last name with a capital letter. Check
 On star/show - don't show podcasts or th's if there are no episodes. check
 Change "date" on Episode check
 Added Jason Lemkin Podcasts change:to Displayed JL Podcasts Check
 Change star link to Wikipedia. - No, we'll do Wikipedia or angellist links manually. Check
 Larger Episode description in the potential list. Limited (500 chars) description in the actual list. Check
 Podcast image links to /podcast check
 Clean up all of the puts in controllers. check
 Add ++++++++ CONTROLLER#ACTION to puts in controllers. check


pull all of episodes, not just the first 10. check
Sort by date and save all episodes from the last 3 years. check
---Need to rebuild from github changes.---
BUGS
-Klosterman - can't connect to listen notes - in the star#new controller. Sabat works, so thinking this has something to do with more than 10 results. 
-Lemkin - loading show page for existing Star - FeedURL is nil? *Problem seems to be with more than 10 results - NoMethodError in StarsController#show
-Zach van ness - stars#show - URI ASCii bug -- for the name we lookup in itunes fixed!! https://stackoverflow.com/questions/15700784/how-to-fix-bad-uri-is-not-uri

Add a display boolean to the Episodes Model. Check
If display boolean is checked, then show the episode on the Star Show page. check
After Episode update, reload star#show. check
Don't lookup new episodes if the search has been done within last 2 weeks. Works!
Queue the search off of the last search... not the last episode updated_at. works




May 29 -Template PUSH THIS LATER









  - Download Audio for episode and put it in player on the site. 




** We cannot link directly to an episode in itunes. It will just link to the page.
 -- Can we find a way to link directly.
 -- Can we put a player on the site?
 -- Can we figure out a schema to install a player given itunes link, episode information and feed URL?
