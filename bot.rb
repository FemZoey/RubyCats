require 'discordrb'
require 'httparty'

TOKEN =  ''
bot = Discordrb::Bot.new token: TOKEN
prefix = 'c'

#RubyCats 1.0
#BY FemZoey
#RubyCats is a ruby discord bot that sends images of
#nekos from catboys.com and neko-love.xyz.

#Help Command
bot.message(with_text: "#{prefix}help") do |event|
    event.channel.send_embed("") do |embed|
        embed.thumbnail = Discordrb::Webhooks::EmbedThumbnail.new(url: "https://cdn.discordapp.com/attachments/934568590177345576/942468132734373939/rb.cats.png")
        embed.description = "All the commands for RubiCats"
        
        embed.title = ":star: **Help**"
        embed.colour = 0x9b111e
        embed.timestamp = Time.at(1644769475)

        #commands
        embed.add_field(name: "Cute Bot Commands!", value: "Help, Info.", inline: true)
        embed.add_field(name: "Cute Neko Commands!", value: "Catboy, Catgirl.", inline: true)
        

        embed.footer = Discordrb::Webhooks::EmbedFooter.new(text: "RubyCats Edition!", icon_url: "https://cdn.discordapp.com/attachments/934568590177345576/942468132734373939/rb.cats.png")
    end
end
#

#Info Command
bot.message(with_text: "#{prefix}info") do |event|
    event.channel.send_embed("") do |embed|
        embed.thumbnail = Discordrb::Webhooks::EmbedThumbnail.new(url: "https://cdn.discordapp.com/attachments/934568590177345576/942468132734373939/rb.cats.png")
        embed.description = "All about RubyCats"
        
        embed.title = ":heart_exclamation: **Info**"
        embed.colour = 0x9b111e
        embed.timestamp = Time.at(1644769475)

        #commands
        embed.add_field(name: ":crown: Developed By", value: "FemZoey", inline: true)
        embed.add_field(name: ":zap: Version", value: "1.0", inline: true)
        

        embed.footer = Discordrb::Webhooks::EmbedFooter.new(text: "RubyCats Edition!", icon_url: "https://cdn.discordapp.com/attachments/934568590177345576/942468132734373939/rb.cats.png")
    end
end
#

#Catboy image command
bot.message(with_text: "#{prefix}catboy") do |event|

    #get the image from catboys.com
    response = HTTParty.get('https://api.catboys.com/img')
    puts response.body
    url= JSON.parse(response.body)['url']
    artist= JSON.parse(response.body)['artist']
    artisturl= JSON.parse(response.body)['artist_url']
    sourceurl= JSON.parse(response.body)['source_url']

    #send the image and it's info to the current channel

    event.channel.send_embed("") do |embed|
        embed.title = ":heart_eyes_cat: **Catboys**"
        embed.colour = 0x9b111e
        embed.url = "#{sourceurl}"
        embed.timestamp = Time.at(1644769475)
      
        embed.image = Discordrb::Webhooks::EmbedImage.new(url: "#{url}")
        embed.footer = Discordrb::Webhooks::EmbedFooter.new(text: "From catboys.com | Artist #{artist}", icon_url: "https://avatars.githubusercontent.com/u/81290115?s=200&v=4")
    end
end
#

#Catboy image command
bot.message(with_text: "#{prefix}catgirl") do |event|

    #get the image from catboys.com
    response = HTTParty.get('https://neko-love.xyz/api/v1/neko')
    puts response.body
    url= JSON.parse(response.body)['url']

    #send the image and it's info to the current channel

    event.channel.send_embed("") do |embed|
        embed.title = ":heart_eyes_cat: **Catgirls**"
        embed.colour = 0x9b111e
        embed.url = "#{url}"
        embed.timestamp = Time.at(1644769475)

        embed.image = Discordrb::Webhooks::EmbedImage.new(url: "#{url}")
        embed.footer = Discordrb::Webhooks::EmbedFooter.new(text: "From neko-love.xyz", icon_url: "https://neko-love.xyz/assets/icon-min.png")
    end
end
#

bot.run