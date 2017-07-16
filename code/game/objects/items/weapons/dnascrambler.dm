/obj/item/weapon/dnascrambler
	name = "dna scrambler"
	desc = "An illegal genetic serum designed to randomize the user's identity."
	icon = 'icons/obj/hypo.dmi'
	item_state = "syringe_0"
	icon_state = "lepopen"
	var/used = null

	update_icon()
		if(used)
			icon_state = "lepopen0"
		else
			icon_state = "lepopen"

	attack(mob/M as mob, mob/user as mob)
		if(!M || !user)
			return

		if(!ishuman(M) || !ishuman(user))
			return

		if(src.used)
			return

		if(ishuman(M))
			var/mob/living/carbon/human/H = M
			if(NO_DNA in H.species.species_traits)
				to_chat(user, "<span class='warning'>You failed to inject [M], as they have no DNA to scramble, nor flesh to inject.</span>")
				return

		if(M == user)
			user.visible_message("<span class='danger'>[user] injects \himself with [src]!</span>")
			src.injected(user,user)
		else
			user.visible_message("<span class='danger'>[user] is trying to inject [M] with [src]!</span>")
			if(do_mob(user,M,30))
				user.visible_message("<span class='danger'>[user] injects [M] with [src].</span>")
				src.injected(M, user)
			else
				to_chat(user, "<span class='warning'>You failed to inject [M].</span>")

	proc/injected(var/mob/living/carbon/target, var/mob/living/carbon/user)
		scramble(1, target, 100)
		target.generate_name()
		if(istype(target, /mob/living/carbon/human))
			var/mob/living/carbon/human/H = target
			H.sync_organ_dna(assimilate = 1)
			H.update_body(0)
			H.reset_hair() // No more winding up with hairstyles you're not supposed to have, and blowing your cover
			H.dna.ResetUIFrom(H)
		target.update_icons()

		log_attack("[key_name(user)] injected [key_name(target)] with the [name]")
		log_game("[key_name_admin(user)] injected [key_name_admin(target)] with the [name]")

		src.used = 1
		src.update_icon()
		src.name = "used " + src.name
