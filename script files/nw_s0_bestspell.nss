//::///////////////////////////////////////////////
//:: Aura of Fuck Truesight
//:: A robintime Original
//:://////////////////////////////////////////////
/*
    Upon entering the BASED STEALTHER's aura, anyone
    effected by Truesight suffers the painful death
    they've earned.
*/
//:://////////////////////////////////////////////
//:: Created By: robin :p
//:: Created On: January 31st, 2023
//:://////////////////////////////////////////////

void main()
{
    object oSpotbot = GetEnteringObject();
    object oBasedStealther = OBJECT_SELF;
    effect eBadManners = EffectVisualEffect(VFX_IMP_RESTORATION_GREATER);

    int nDuration = GetAbilityScore(OBJECT_SELF, ABILITY_DEXTERITY) * 2;
    int nMetaMagic = GetMetaMagicFeat();
    if (nMetaMagic == METAMAGIC_EXTEND)
    {
         nDuration = nDuration * 2;
    }

    oSpotbot = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_COLOSSAL, GetLocation(OBJECT_SELF));
    while(GetIsObjectValid(oSpotbot))
    {
        if (GetHasSpellEffect(SPELL_TRUE_SEEING, oSpotbot) == TRUE)
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oSpotbot);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eBadManners, oSpotbot);
        }
    
        oSpotbot = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_COLOSSAL, GetLocation(OBJECT_SELF));
    }
}