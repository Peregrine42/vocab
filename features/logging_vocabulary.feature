Feature: logging vocabulary

Scenario: I need somewhere to store the words I use as a file
  When I run the cli with a new word, e.g "build"
  Then "build" appears in the log file

Scenario: I want to see the most commonly entered words
  Given there is a file called "fixtures/example.log"
  When I run the cli in read mode
  Then the cli returns a histogram of the words entered
