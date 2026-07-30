"use strict";
/// <reference path="../citadel.d.ts" />
/// <reference path="../async.ts" />
let gProgressSequence = null;
function LocalPlayer_AnimateProgressScreen() {
    LocalPlayer_DoProgressAnimation();
}
async function LocalPlayer_DoProgressAnimation() {
    if (gProgressSequence && !gProgressSequence.IsFinished())
        gProgressSequence.Abort();
    gProgressSequence = new Async.SequenceController();
    let screen = $.GetContextPanel();
    let playerHeroXPRewards = screen.FindChildInLayoutFile("HeroXPRewards");
    let progressBar = screen.FindChildInLayoutFile("HeroLevelProgressBar");
    let nextLevelProgressBar = screen.FindChildInLayoutFile("NextLevelProgressBar");
    let heroBadge = screen.FindChildInLayoutFile("HeroBadge");
    let nextHeroBadgeIcon = screen.FindChildInLayoutFile("NextHeroBadgeIcon");
    // Reset to the initial state
    screen.RemoveClass('ShowPlayerHero');
    for (let i = 0; i < playerHeroXPRewards.GetChildCount(); ++i) {
        playerHeroXPRewards.GetChild(i).RemoveClass('ShowHeroXPReward');
    }
    let unCurrentHeroXP = screen.GetAttributeInt("current_hero_xp", 0);
    let unNextLevelXP = screen.GetAttributeInt("next_level_xp", 0);
    // Now do the actual sequence
    screen.AddClass('ShowPlayerHero');
    await gProgressSequence.Delay(2.0);
    let bLeveledUp = false;
    let totalXpAmount = 0;
    for (let i = 0; i < playerHeroXPRewards.GetChildCount(); ++i) {
        let heroxpRewardPanel = playerHeroXPRewards.GetChild(i);
        let xpAmount = heroxpRewardPanel.GetAttributeInt("reward_amount", 0);
        heroxpRewardPanel.AddClass('ShowHeroXPReward');
        PlayUISoundEvent("UI.PostGame.HeroXPReward");
        let nTicks = Math.min(25, xpAmount);
        for (let nTick = 0; nTick < nTicks; ++nTick) {
            let progressXP = unCurrentHeroXP + totalXpAmount + ((nTick + 1.0) / nTicks) * xpAmount;
            if (progressXP > unNextLevelXP && !bLeveledUp) {
                progressXP = unNextLevelXP;
                bLeveledUp = true;
                PlayUISoundEvent("UI.PostGame.HeroXPReward_LevelUp");
                heroBadge.heroxp = unNextLevelXP;
                heroBadge.AddClass("LevelUp");
                nextHeroBadgeIcon.AddClass("LevelUp");
                await gProgressSequence.Delay(1.0);
                nextHeroBadgeIcon.RemoveClass("LevelUp");
                heroBadge.RemoveClass("LevelUp");
            }
            PlayUISoundEvent("UI.PostGame.HeroXPReward_Tick");
            progressBar.uppervalue = progressXP;
            nextLevelProgressBar.value = progressXP;
            await gProgressSequence.Delay(0.01);
        }
        totalXpAmount += xpAmount;
        progressBar.uppervalue = unCurrentHeroXP + totalXpAmount;
        await gProgressSequence.Delay(0.5);
    }
    gProgressSequence.EndSkipping();
    if (bLeveledUp) {
        await gProgressSequence.Delay(3.0);
    }
    else {
        await gProgressSequence.Delay(1.5);
    }
    screen.NotifyFinishedAnimating();
}
function LocalPlayer_SkipForward() {
    if (!gProgressSequence)
        return;
    gProgressSequence.Skip();
}
function LocalPlayer_ShowScreenNoAnimation() {
    let screen = $.GetContextPanel();
    let playerHeroXPRewards = screen.FindChildInLayoutFile("HeroXPRewards");
    let progressBar = screen.FindChildInLayoutFile("HeroLevelProgressBar");
    let nextLevelProgressBar = screen.FindChildInLayoutFile("NextLevelProgressBar");
    let heroBadge = screen.FindChildInLayoutFile("HeroBadge");
    let unCurrentHeroXP = screen.GetAttributeInt("current_hero_xp", 0);
    screen.AddClass('ShowPlayerHero');
    let totalXpAmount = 0;
    for (let i = 0; i < playerHeroXPRewards.GetChildCount(); ++i) {
        let heroxpRewardPanel = playerHeroXPRewards.GetChild(i);
        let xpAmount = heroxpRewardPanel.GetAttributeInt("reward_amount", 0);
        heroxpRewardPanel.AddClass('ShowHeroXPReward');
        totalXpAmount += xpAmount;
    }
    heroBadge.heroxp = unCurrentHeroXP + totalXpAmount;
    progressBar.uppervalue = unCurrentHeroXP + totalXpAmount;
    nextLevelProgressBar.value = unCurrentHeroXP + totalXpAmount;
}
