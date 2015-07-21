# Starcraft Matches API

Starcraft is a science fiction strategy video game set in a fictitious timeline during the Earth's 25th century.

The game revolves around three species fighting for dominance in a distant part of the Milky Way galaxy known as the Koprulu Sector: the Terrans, humans exiled from Earth skilled at adapting to any situation; the Zerg, a race of insectoid aliens in pursuit of genetic perfection, obsessed with assimilating other races; and the Protoss, a humanoid species with advanced technology and psionic abilities, attempting to preserve their civilization and strict philosophical way of living from the Zerg.

StarCraft's multiplayer has become really popular in countries like South Korea, where players and teams participate in professional competitions, earn sponsorships, and compete in televised tournaments.

Today we are going to build an API to support one of the major leagues in the planet. The objective is to give acces to all the information about the matches that take place, the statistics of the factions and the players, etc. So everyone interested, from profesional blogs to possible sponsors, can consume the information and use it as they want.

## Iteration 1

In the league every day takes place several matches between two players. In each match the player can select any faction he wants (unless the other player has selected the same faction first).

Each Match has one winner and one loser, both making reference to the Player model. In the migration of the Match model you can use the references option of the add_reference method to specify the model that is being referred to in cases that the association doesn't follow Rails naming conventions.

## Iteration 2

Now that we have our models, let's create a route that returns an index of the matches of a specific player in JSON. However, the new route should return what the following query would do. Create the query in Active Record and return the results in JSON.

```
SELECT "matches".* FROM "matches"
  INNER JOIN "players" ON "players"."id" = "matches"."winner_id"
```

After creating that index route, make a new one that lists matches by faction. You might have a route like /matches/:faction. If a user requested /matches/protoss your API should contain ActiveRecord code that runs this query:

```
SELECT "matches".* FROM "matches"
  INNER JOIN "players" ON "players"."id" = "matches"."winner_id"
WHERE winner_faction = 'protoss'
  OR loser_faction = 'protoss'
 ```

You should also return that faction's overall win percentage.

## Iteration 3

Make a route to display player profiles. The profile should show all the player's matches, as well as win and loss percentages.
