# LiveHumanBot for Vindinium

A bot for the [Vindinium](http://vindinium.org/) AI challenge that is actually not a bot, but a very simplistic client for a human player. Who is better at this game – humans or the bots that they make?

It works by exploiting the fact that the [Vindinium API](http://vindinium.org/starters) gives you 2 seconds to send your move before your bot times out and is marked as “crashed”. This program waits for user input for 1 second at the start of each turn, which gives it a 1-second margin to actually send its move over the network. If the user doesn’t input anything within that second, the program still sends a `Stay` command.

You can visit the [user page for `rory-live-human`](http://vindinium.org/ai/p20qptiv), which is me playing using this client, to see how a human fares against bots.

## Instructions for player

1.  In order to to play any kind of Vindinium match, even an unranked training match, you need a bot API key. You can create one for yourself at [Create a bot](http://vindinium.org/register). You can save this API key for later reference in a file `secrets.md`. Use the file `secrets.example.md` as a template.

2.  Start the client using these commands (taken from the README for the Vindinium starter Ruby client):
    
    ~~~sh
    bundle install
    bundle exec ruby client.rb <key> <[training|arena]> <number-of-games|number-of-turns> [server-url]
    ~~~
    
    For the arguments, you will usually want one of two values:
    
    - `bundle exec ruby client.rb <your-key> training 40`
    - `bundle exec ruby client.rb <your-key> arena 1`
    
    Some might consider it cheating to play arena (ranked) matches with this bot.
    
3.  After a game starts, the URL for it (e.g. [`http://vindinium.org/0cqr70i4`](http://vindinium.org/0cqr70i4)) will be copied to the clipboard. As quick as you can, switch to a web browser, paste the URL in the address bar, and load it. Then drag your terminal window out of the way so that you can see the visualization of the game. Leave the window slightly visible.
    
    During these few seconds, the game will have been going on without you, and your character will have been standing still. You’ll just have to use your superior intelligence to catch up in the rest of the game.
    
4.  In each turn during a game, you have one second to input your turn, if any. To input a move, press one of the WASD keys followed by Return/Enter in quick succession. `w` means north, `a` means west, `s` means south, `d` means east. If you don’t want to move, don’t press anything.
    
    You are forced to press Return for technical reasons – it was much easier to implement that way. Your inputted move is only executed when you press Return, so make sure to press it right after your type the letter. If you have typed something other than WASD, your input will be ignored.
    
5.  Keep inputting moves while watching the browser visualization to keep your bearings. Watch the half-hidden terminal window to see when the text in it changes abruptly – that means that it is the next turn. The terminal often updates before the browser visualization, so you may have to move ahead of what you see. Keep using your human wiles to out-mine those foolish, single-minded bots. Eventually the match(es) will end, and the program will quit on its own.
