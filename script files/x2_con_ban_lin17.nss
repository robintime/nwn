//::///////////////////////////////////////////////
//:: x2_con_ban_lin17
//:: Copyright (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Try to start a conversation with Linu.
*/
//:://////////////////////////////////////////////
//:: Created By:  Brent
//:: Created On:  August 2003
//:://////////////////////////////////////////////
#include "x2_inc_banter"

int StartingConditional()
{
    if (TryBanterWith("x2_hen_linu", 17    ) == TRUE)
    {
        return TRUE;
    }
    return FALSE;


}