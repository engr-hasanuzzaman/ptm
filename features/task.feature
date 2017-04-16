Feature: Task
  In order to portray or pluralize food
  As a CLI
  I want to be as objective as possible

  Scenario: Broccoli is gross
    When I run `hello sumon`
    Then the output should contain "Hello, sumon"
