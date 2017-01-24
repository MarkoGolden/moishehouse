==Moishe House Mintranet

Download the source code, run the database migrations, then run the import tasks through the console using:

    bundle exec rake import:all

The import will take a few minutes to populate the entire database.

Once the import is finished boot up the server with:

    rails s

The app makes use of subdomains, so we'll use http://lvh.me:3000 instead of localhost to utilize that.

    http://lvh.me:3000 -- this will show you the main Moishe House (client-facing) website
    http://mhwow.lvh.me:3000 -- this will take you to the Moishe House Without Walls (client-facing) website
    http://lvh.me:3000/mintranet -- this will take you to the Mintranet, which is the backend of the Moishe House system and is where all of our operations are handled.

The main Moishe House website is missing a few things (see http://moishehouse.org for comparison):
  - Photo slideshow for homepage
  - Child pages for individual houses
  - News ticker jquery plugin
  - Learning (static pages)
  	- Resources page is mostly links
  	-	Retreats pages is a simple list of dates and an embedded Wufoo application
  - Our Team (this gets pulled from the Mintranet)
  - Supporters and Partners (static page but would benefit from a CMS to update it regularly)
  - Press page (would also benefit from CMS)
  - Miscellaneous styling details
    
Mintranet:

You can use a test admin login to get on:

    login: roey@moishehouse.org
    password: password

Once you're logged in, you can access different views based on user "role" in two ways:

1) create a new user with a different role (i.e. "resident" or "mhwow")

2) alter the url (i.e. "http://localhost:3000/residents" for residents view, and "/host_center" for mhwow view)

Use the Admin controls to view data/reports of user activity. Use the General controls to create your own programs/receipts etc. MHWOW is a branch of Moishe House that was given its own admin area to avoid confusion for our staff.

Admin tasks:
- Look up programs by house. 
- Click "Programs". Select a few houses from the checkbox table. Select a valid date range. Then click search and view the results. 
- Click on some of the receipts (they are links to receipts/edit pages) to get an idea of what most of our admins are doing on the site (looking up programs, recording numbers from their searches, approving/rejecting receipts).

Residents/MHWOW user tasks:
- Create a program. 
- Create a receipt for that program. 
- Go back and edit program after it has happened to report total number attendees, etc.
- View your budget.

Please email or call me with questions!
