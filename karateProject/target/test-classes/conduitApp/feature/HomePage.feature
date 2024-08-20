Feature: Test for home page

    Background: Define url
        Given url 'https://conduit-api.bondaracademy.com/api/'

    Scenario: Get All tag
        Given path 'tags'
        When method Get
        Then status 200
        # And match response.tags contains 'Zoom'
        And match response.tags contains ['Zoom', 'YouTube']
        And match response.tags !contains 'truck'
        And match response.tags == "#array"
        And match each response.tags == "#string"

    Scenario: Get 10 articals from the page
        Given path 'articles'
        Given params {limit:10, offset:0}
        When method Get 
        Then status 200
        And match response.articals == '#[10]'
        And match response.artical Count == 500