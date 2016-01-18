Feature: logging vocabulary

Scenario: I need somewhere to store the words I use as a file
  When I run the cli with a new word, e.g "build"
  Then "build" appears in the log file
