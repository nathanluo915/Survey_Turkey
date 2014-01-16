# Survey Gorilla 
 
##Learning Competencies 

##Summary 

 We're going to build a survey application that lets users create their own multiple-choice polls and other users to vote in them.

This is going to use a combination of pure JavaScript and AJAX to achieve the desired effects.

A survey will have many questions.  Each question will have many possible responses.  A voter will select one (and only one) response for each question in a survey.

## Objectives

### Models

Go back to the polling schema challenges.  This schema will be fairly complex and it will help to think in terms of survey-creators versus survey-voters.

There should be at least 6 core models/tables.  You'll need a table to hold rows that represent the following sort of facts:

1. User A exists
2. User A created Survey X
3. Question Y belongs to Survey X
4. Possible Choice Z belongs to Question Y
5. User B completed Survey X
6. User B chose Possible Choice Z for Question Y

Each of these should correspond to a single table in your database and a single model in your app.

Users need to be signed in to create a survey and vote in a survey.

### Wireframes

Work through wireframes and discuss what your core pages are and what your core user flows are.  There should be two core flows: survey creation and survey completion.

One possible division of labor would be to separate these two flows.

### Survey Creation

Users will want to create their surveys in "one go" by adding multiple questions and choices per question on a single page.  This is an opportunity to create some fun dynamic forms.  Check these out:

* [Adding Form Fields Dynamically with jQuery](http://www.mustbebuilt.co.uk/2012/07/27/adding-form-fields-dynamically-with-jquery/)
* [Dynamically Add Input Fields To Form Using jQuery](http://www.infotuts.com/dynamically-add-input-fields-to-form-jquery/)
* Google "jquery dynamic form fields" to find more

To start and for your own sanity, maybe limit each survey to a single question.  Create a version with a single question per survey working first and add support for multiple questions later.

Surveys should also have an optional image associated with them.  [CarrierWave](https://github.com/jnicklas/carrierwave) is your friend; you'll come to love it with time.

### Survey Taking

For now, a user has to answer every question in a survey.  You should be able to implement this constraint using a single custom validation on a single model.

### Survey Results

Create a nice page that shows the survey creator the results of a survey.  If you want to do something fancy, try using [d3.js](http://d3js.org/).  This is very advanced.

There are other charting libraries like [Flot](http://www.flotcharts.org/) or [Highcharts](http://www.highcharts.com/).

At the very least, create some simple HTML bar charts by having percentage-width divs with a fixed height and solid background color so that we can see how people responded for each question in a particular survey.

### Advanced Features

If you're looking for more advanced features, how about something that lets a user view a survey without logging in but pops up a [modal dialog](http://www.ericmmartin.com/projects/simplemodal/) to prompt a user to sign in/sign up right before they vote?

How about more advanced visualizations, like time series?

How about focusing on making the user interface really nice?

How about multiple question types? 

##Releases
###Release 0 

##Optimize Your Learning 

##Resources