/obj/item/weapon/twohanded/ebalo
  name = "ebalo"
  desc = "apparently dead"
  icon = 'hyntatmta/icons/obj/ebalo_small.dmi'
  icon_state = "ebalo"
  var/awake = 0

/obj/item/weapon/twohanded/ebalo/attackby(obj/item/weapon/W, mob/user, params)
  if(istype(W, /obj/item/weapon/shovel))
    user.visible_message("[user] хоронит ebalo...","Ты хоронишь ebalo...")
    if(do_after(user, 30, target = src))
      user.visible_message("<font color='notice'>[user] похоронил ebalo!</font>","<font color='notice'>Ты похоронил ebalo!</font>")
      icon_state = "ebalo_rip"
      awake = 1
  if(istype(W, /obj/item/pedal))
    if(awake)
      awake = 0
      user.visible_message("<font color='notice'>[user] разбудил EBALO!</font>","<font color='notice'>ТЫ РАЗБУДИЛ EBALO!!!!11</font>")
      sleep(30)
      to_chat(world, "<font size='15' color='red'><b>EBALO HAS RISEN</b></font>")
      world << sound('sound/music/astronomia.ogg')
      sleep(50)
      new /obj/singularity/ebalo(loc)
      qdel(src)

/obj/singularity/ebalo
  name = "EBALO"
  desc = "Your mind begins to bubble and ooze as it tries to comprehend what it sees."
  icon = 'hyntatmta/icons/obj/ebalo.dmi'
  consume_range = 3
  grav_pull = 10

/obj/singularity/ebalo/New()
	..()
	sleep(70)
	shuttle_master.emergency.request(null, 0.3) // Cannot recall

/obj/singularity/ebalo/process()
	to_chat(world, "<font size='15' color='brown'><b>inEx RYTP СВИНКА ПЕППА И DISCO EBALO</b></font>")
	eat()
	move()
