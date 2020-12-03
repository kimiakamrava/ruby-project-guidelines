
SelectedRoom.destroy_all
Player.destroy_all
SerialKiller.destroy_all

  
Player.create(name: "Engraved Sword", heart: 3)
Player.create(name: "Battle Axe", heart: 3)
Player.create(name: "Shield", heart: 3)

ted = SerialKiller.create(name: "Ted Bundy",bio:"Theodore Robert Bundy was
 an American serial killer who kidnapped, raped, and murdered numerous young
  women and girls during the 1970s and possibly earlier. After more than a 
  decade of denials, before his execution in 1989 he confessed to 30 homicides
   that he committed in seven states between 1974 and 1978.")
harold = SerialKiller.create(name:"Harold Shipman",bio:"Harold Frederick Shipman,
 known to acquaintances as Fred Shipman, was an English general practitioner who
  is believed to be the most prolific serial killer in modern history.
 On 31 January 2000, he was found guilty of the murder of 15 patients under his care;
 his total number of victims was approximately 250.")
belle = SerialKiller.create(name:"Belle Gunness",bio:"Belle Gunness, 
 born Brynhild Paulsdatter Storset, 
 was a Norwegian-American serial killer
 who was active in Illinois and Indiana between 1884 and 1908.")
ed = SerialKiller.create(name:"Ed Gein",bio:"Edward Theodore Gein, also known as the Butcher of Plainfield
 or the Plainfield Ghoul, was an American convicted murderer and body snatcher." )
john = SerialKiller.create(name:"John Wayne Gacy",bio:"John Wayne Gacy was an American 
serial killer and sex offender known as the Killer Clown who 
assaulted and murdered at least 33 young men and boys.")
jeffery = SerialKiller.create(name:"Jeffrey Dahmer",bio:"Jeffrey Lionel Dahmer, also known as the Milwaukee Cannibal or the Milwaukee Monster,
 was an American serial killer and sex offender who committed the murder
 and dismemberment of 17 men and boys from 1978 to 1991.")
jack = SerialKiller.create(name:"jack the ripper",bio:"Jack the Ripper was an unidentified serial killer active in the largely impoverished areas in and around the Whitechapel district of London in 1888.
 In both the criminal case files and contemporary journalistic accounts, the killer was called the Whitechapel Murderer and Leather Apron")



r1 = SelectedRoom.create(serial_killer_id:SerialKiller.all.sample.id,player_id:Player.all.sample.id,
description:" a relatively clean room with cupboards, a single mattress on the floor, and a low table.",name:"living room")
r2 = SelectedRoom.create(serial_killer_id:SerialKiller.all.sample.id,player_id:Player.all.sample.id,
description:"windowless kitchen with bloody broken tiled floor",name:"kitchen")
r3 = SelectedRoom.create(serial_killer_id:SerialKiller.all.sample.id,player_id:Player.all.sample.id,
description:"chilly dark airless rustic",name:"basement")
r4 = SelectedRoom.create(serial_killer_id:SerialKiller.all.sample.id,player_id:Player.all.sample.id,
description:"large featureless and empty",name:"master bedroom")
r5 = SelectedRoom.create(serial_killer_id:SerialKiller.all.sample.id,player_id:Player.all.sample.id,
description:"dim, wood-paneled old and somewhat valuable",name:"library")
r6 = SelectedRoom.create(serial_killer_id:SerialKiller.all.sample.id,player_id:Player.all.sample.id,
description:"hideously dark-blue with bleached spotless table but broken chair pieces everywhere",name:"dining room")
r7 = SelectedRoom.create(serial_killer_id:SerialKiller.all.sample.id,player_id:Player.all.sample.id,
description:"empty, thick-walled",name:"chimney room")
r8 = SelectedRoom.create(serial_killer_id:SerialKiller.all.sample.id,player_id:Player.all.sample.id,
description:"explosively hot oversize timbered",name:"garage")


puts'done'

