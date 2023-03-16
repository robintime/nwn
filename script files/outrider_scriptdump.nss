// ======================================
// Lupine Attack & Wild Plains Infliction
// ======================================
// While mounted, whenever the Outrider makes
// a successful attack against an opponent who
// is flat-footed, cannot see them, or who is
// flanked, the Outrider's blow delivers extra
// damage. This extra damage is not multiplied
// in the case of a critical hit.
// ======================================

//OnDamaged event or something idk
void main()
{
    object oAttacker = GetLastAttacker();
    int nFlanking = NWNX_Creature_GetIsFlanking(oAttacker, OBJECT_SELF);
    int nFlatfooted = NWNX_Creature_GetFlatFooted(OBJECT_SELF);
    int nOutrider = (GetLevelByClass(CLASS_TYPE_OUTRID, oAttacker));
    //HOW DO I CHECK PERCEPTION??? HELLO?//
    //there Has to be a way to get a creature's perception list and check if oAttacker is on that list.//
    //actually if we're using OnDamaged, then the creature has already exited stealth to attack UUUUUGHHHHH!!!!!!AAAAAAAA//
    //HNNRNRNM,M,//
    // :( //

    if(HorseGetIsMounted(oAttacker)) && if(nOutrider = >0)
    {
        if(nFlanking = TRUE || nFlatfooted = TRUE || /* PERCEPTION HELLO??? */)
        {
            if(GetHasFeat(FEAT_LUPINE_ATTACK_1, oAttacker) >0 ||
            GetHasFeat(FEAT_LUPINE_ATTACK_2, oAttacker) >0 ||
            GetHasFeat(FEAT_LUPINE_ATTACK_3, oAttacker) >0);
            {
                ExecuteScript("lupine_attack", OBJECT_SELF);
            }
        }
        else if(/*insert check for charge cd timer*/ >18 && (GetHasFeat(FEAT_WPINFLICT, oAttacker) >0))
        {        
            if(GetHasFeat(FEAT_LUPINE_ATTACK_1, oAttacker) >0 ||
            GetHasFeat(FEAT_LUPINE_ATTACK_2, oAttacker) >0 ||
            GetHasFeat(FEAT_LUPINE_ATTACK_3, oAttacker) >0);
            {
                ExecuteScript("lupine_attack", OBJECT_SELF);
            }
        }
    }
}
    //there's got to be a better way to do this that doesnt involve reflavoring improved sneak attack
        // FUCK YOU, ENGINE CODE
    //should a wolf attack respect sneak attack immunity? i dont think so, but then, balance stuff. idk


//rt_s2_lupineatk.nss
void main()
{
    object oAttacker = GetLastAttacker();
    int nDamage;
    effect eDam;
    eDam = EffectDamage(nDamage, DAMAGE_TYPE_BLEEDING);
    //bleeding because its cooler idk :) *counters your class ability with healing kits lol*

    if(GetHasFeat(FEAT_LUPINE_ATTACK_1, oAttacker) >0)
    {
        nDamage = d6(2);
    }
    if(GetHasFeat(FEAT_LUPINE_ATTACK_2, oAttacker) >0)
    {
        nDamage = d6(4);
    }
    if(GetHasFeat(FEAT_LUPINE_ATTACK_3, oAttacker) >0)
    {
        nDamage = d6(6);
    }

    if(nDamage > 0)
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, OBJECT_SELF);
    }

    //how to print this to the combat log / add floating combat text?
}


// ======================================
// Rend and Tear
// ======================================
// The Outrider gains the ability to make an
// instant attack against one target. The
// Outrider applies their Dexterity modifier
// to their attack roll. While unmounted, Rend
// and Tear does 8d6 piercing damage plus the
// Outrider's class level. While mounted, Rend
// and Tear does an extra 2d6 bleeding damage.
// Rend and Tear has one use which refreshes
// every three? two? minutes.
// ======================================

//rt_s2_rendtear.nss
void main()
{
    object oTarget = GetSpellTargetObject();
    int nDexterity = GetAbilityModifier(int 1, OBJECT_SELF);
    int nOutriderLevel = (GetLevelByClass(CLASS_TYPE_OUTRID,OBJECT_SELF))

    if (GetIsObjectValid(oTarget) == TRUE)
    {
        if (d20 + GetABVersus(OBJECT_SELF, oTarget) + nDexterity) > GetACVersus(oTarget, OBJECT_SELF)
        { 
            int nDamageFoot = d6(8) + GetLevelByClass(CLASS_TYPE_OUTRID, OBJECT_SELF)
            effect eDamageFoot = EffectDamage(nDamageFoot, DAMAGE_TYPE_PIERCING);
            SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, 601));
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamageFoot, oTarget);
            if(HorseGetIsMounted(OBJECT_SELF))
            {
                int nDamageMounted = d6(5);
                effect eDamageMounted = EffectDamage(nDamageMounted, DAMAGE_TYPE_BLEEDING);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamageMounted, oTarget);
            }
        }
    }
}

    //add visual effect, like some sort of bloody strike or something
        // a dog / wolf growl sfx would be neat too but im not sure what
        // the code for calling a sfx is and i also don't care enough rn .
    //HOW TO MAKE IT RESTORE USES?
    //same problem as above - combat log?
        // should print well enough since its a spell


// ======================================
// Wild Plains Swiftness
// ======================================
// The Outrider receives +10% movement
// speed while mounted.
// ======================================

//x3_inc_horse.nss - HORSE_SupportIncreaseSpeed
if(GetHasFeat(FEAT_WPSWIFTNESS, oRider))
{
    nSpeed-=10;
}


// ======================================
// Wild Plains Stalker
// ======================================
// The Outrider's Hide and Move Silently
// are no longer penalized while mounted.
// ======================================

//x3_inc_horse.nss
void HORSE_SupportApplyOutriderSkillDecreases(object oRider)
{ // PURPOSE: Applies decreases to skills while mounted
    if (GetLocalInt(GetModule(),"X3_HORSE_DISABLE_SKILL")) return;
    object oMod=GetModule();
    effect eDisarmTrap = SupernaturalEffect(EffectSkillDecrease(SKILL_DISABLE_TRAP , 50));
    effect eOpenLock   = SupernaturalEffect(EffectSkillDecrease(SKILL_OPEN_LOCK    , 50));
    effect ePickPocket = SupernaturalEffect(EffectSkillDecrease(SKILL_PICK_POCKET  , 50));
    effect eSetTrap    = SupernaturalEffect(EffectSkillDecrease(SKILL_SET_TRAP     , 50));
    effect eTumble     = SupernaturalEffect(EffectSkillDecrease(SKILL_TUMBLE       , 50));
    AssignCommand(oMod,ApplyEffectToObject(DURATION_TYPE_PERMANENT,eDisarmTrap,oRider));
    AssignCommand(oMod,ApplyEffectToObject(DURATION_TYPE_PERMANENT,eOpenLock,oRider));
    AssignCommand(oMod,ApplyEffectToObject(DURATION_TYPE_PERMANENT,ePickPocket,oRider));
    AssignCommand(oMod,ApplyEffectToObject(DURATION_TYPE_PERMANENT,eSetTrap,oRider));
    AssignCommand(oMod,ApplyEffectToObject(DURATION_TYPE_PERMANENT,eTumble,oRider));
} // HORSE_SupportApplyMountedSkillDecreases()
    //because this is the same type of decrease as the regular mount penalties
    //it should also be removed by the regular decrease removal script


    if(GetHasFeat(FEAT_WPSTALKER, oRider))
    {
        DelayCommand(0.4,HORSE_SupportApplyOutriderSkillDecreases(oRider));    
    }
    else
    {
        DelayCommand(0.4,HORSE_SupportApplyMountedSkillDecreases(oRider));
    }
    //this will need to be appended to anywhere with ApplyMountedSkillDecrease
    //(2 spots: HorseMount and HorseInstantMount)


// ======================================
// Unbroken Charge
// ======================================
// While using the Wild Plains Offensive
// or Spirited Charge abilities, the Outrider
// ignores grease, web, and entangle effects.
// ======================================

//in web, grease, and entangle scripts
if((!GetHasFeat(FEAT_WOODLAND_STRIDE, oTarget) &&(GetCreatureFlag(OBJECT_SELF, CREATURE_VAR_IS_INCORPOREAL) != TRUE))
|| (if(GetHasFeat(FEAT_UNBRKNCHARGE, oTarget) && /*code for checking having spirited charge effect applied here*/)))

//i originally wanted this to also apply a 1-second FoM effect
//if charge was activated while entangled, greased, or webbed,
//so that itd cleanse the effect, but there's no handy way to
//check for grease or web like there is for being entangled...