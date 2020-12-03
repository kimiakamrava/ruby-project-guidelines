
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

r1 = SelectedRoom.create(serial_killer_id:SerialKiller.all.sample.id,player_id:Player.all.sample.id,
description:"dark room",name:"bathroom")
r2 = SelectedRoom.create(serial_killer_id:SerialKiller.all.sample.id,player_id:Player.all.sample.id,
description:"bright room",name:"kitchen")
r3 = SelectedRoom.create(serial_killer_id:SerialKiller.all.sample.id,player_id:Player.all.sample.id,
description:"stinky room",name:"basement")


puts'done'

