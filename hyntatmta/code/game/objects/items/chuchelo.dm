/obj/item/pedal
  name = "Pedal"
  desc = "Godpower and Mental Disabilities in just one thing."
  icon = 'hyntatmta/icons/obj/zerg.dmi'
  icon_state = "pedal"

/obj/item/pedal/attack(mob/M as mob, mob/user as mob)
  M.visible_message(M, "<font color='red'><b>[user] BANNED [M] 4NORESIN!!!!<b></font>")
  to_chat(user, "<font color='red'> ЕБУЧИЙ ВАХТЕР! Ты <b>ЗАБАНИЛ</b> [M] на 1 минуту!</font>")
  if(user.client)
    AddBan(user.ckey, user.computer_id, "Shitspawn is no longer just a dream", "Goat Fart", 1, 1)
  user.drop_l_hand()
  user.drop_r_hand()
  to_chat(user, "<font color='notice'>Сила педали оказалась тебе не по зубам!</font>")
  user.Stun(10)

/obj/item/pedal/attack_self(mob/user as mob)
  user.CanBuild()
  user.visible_message("<font color='red'><b>Uh oh! [user] activated SANDBOX-PANEL! RUN FOR YOUR LIFE!<b></font>")
  to_chat(user, "<font color='notice'> ЕБУЧИЙ ЩИТОСПАВНЕР! Ты <b>АКТИВИРОВАЛ</b> САНДБОКС-ПАНЕЛЬ!! ОНА ВО ВКЛАДКЕ Commands</font>")
  user.drop_l_hand()
  user.drop_r_hand()
  to_chat(user, "<font color='notice'>Сила педали оказалась тебе не по зубам!</font>")
  user.Stun(10)

/obj/item/flag/zerg
	name = "Zergnyxx"
	desc = "Shitospawn do dobra ne dovedet"
	icon = 'hyntatmta/icons/obj/zerg.dmi'
	icon_override = 'hyntatmta/icons/obj/zerg.dmi'
	icon_state = "zergflag"
	burntime = 40

/obj/item/flag/zerg/burn()
	new /obj/item/pedal(loc)
	qdel(src)
