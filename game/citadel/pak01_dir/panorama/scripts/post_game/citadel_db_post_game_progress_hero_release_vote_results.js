"use strict";
/// <reference path="../citadel.d.ts" />
/// <reference path="../async.ts" />
let gProgressSequence = null;
function HeroReleaseVoteResults_AnimateProgressScreen() {
    DoProgressAnimation();
}
function HeroReleaseVoteResults_ResetScreen() {
    let screen = $.GetContextPanel();
    let voteCategories = screen.FindChildInLayoutFile('VoteCategories');
    let categoryInfos = screen.FindChildInLayoutFile('CategoryInfos');
    for (let i = 0; i < voteCategories.GetChildCount(); ++i) {
        let voteCategory = voteCategories.GetChild(i);
        voteCategory.SwitchClass("highlight", "");
        for (let j = 0; j < voteCategory.GetChildCount(); ++j) {
            let voteSticker = voteCategory.GetChild(j);
            voteSticker.RemoveClass("Appear");
        }
    }
    for (let i = 0; i < categoryInfos.GetChildCount(); ++i) {
        let categoryInfo = categoryInfos.GetChild(i);
        categoryInfo.RemoveClass("Appear");
    }
}
async function DoProgressAnimation() {
    if (gProgressSequence && !gProgressSequence.IsFinished())
        gProgressSequence.Abort();
    gProgressSequence = new Async.SequenceController();
    let screen = $.GetContextPanel();
    let voteCategories = screen.FindChildInLayoutFile('VoteCategories');
    let categoryInfos = screen.FindChildInLayoutFile('CategoryInfos');
    HeroReleaseVoteResults_ResetScreen();
    await gProgressSequence.Delay(1.0);
    // We should either have accolades or awards.
    for (let i = 0; i < voteCategories.GetChildCount(); ++i) {
        let voteCategory = voteCategories.GetChild(i);
        let categoryInfo = categoryInfos.GetChild(i);
        categoryInfo.AddClass("Appear");
        voteCategory.SwitchClass("highlight", "Highlighted");
        let categorySound = voteCategory.GetAttributeString("category_sound", "");
        let stickerSound = voteCategory.GetAttributeString("sticker_sound", "");
        PlayUISoundEvent(categorySound);
        PlayUISoundEvent("UI.Vote.Hero.Tally.Toast");
        await gProgressSequence.Delay(0.2);
        let nLoopingSound = PlayUISoundEvent("UI.Vote.Hero.Tally.Lp");
        for (let j = 0; j < voteCategory.GetChildCount(); ++j) {
            let voteSticker = voteCategory.GetChild(j);
            voteSticker.AddClass("Appear");
            PlayUISoundEvent(stickerSound);
            // Add a little noise on the sticker placement delays to make them feel more organic
            let delayBaseSeconds = 0.05;
            let delayNoiseSeconds = 0.02;
            let delay = delayBaseSeconds + delayNoiseSeconds * Math.random() - delayNoiseSeconds / 2.0;
            await gProgressSequence.Delay(delay);
        }
        StopUISoundEvent(nLoopingSound);
        PlayUISoundEvent("UI.Vote.Hero.Tally.Lp.End");
        await gProgressSequence.Delay(1.0);
        voteCategory.SwitchClass("highlight", "Dimmed");
        gProgressSequence.EndSkipping();
    }
    for (let i = 0; i < voteCategories.GetChildCount(); ++i) {
        let voteCategory = voteCategories.GetChild(i);
        voteCategory.SwitchClass("highlight", "");
    }
    gProgressSequence.EndSkipping();
    await gProgressSequence.Delay(1.0);
    screen.NotifyFinishedAnimating();
}
function SkipForward() {
    if (!gProgressSequence)
        return;
    gProgressSequence.Skip();
}
function ShowScreenNoAnimation() {
    HeroReleaseVoteResults_ResetScreen();
    let screen = $.GetContextPanel();
    let voteCategories = screen.FindChildInLayoutFile('VoteCategories');
    let categoryInfos = screen.FindChildInLayoutFile('CategoryInfos');
    // We should either have accolades or awards.
    for (let i = 0; i < voteCategories.GetChildCount(); ++i) {
        let voteCategory = voteCategories.GetChild(i);
        let categoryInfo = categoryInfos.GetChild(i);
        categoryInfo.AddClass("Appear");
        for (let j = 0; j < voteCategory.GetChildCount(); ++j) {
            let voteSticker = voteCategory.GetChild(j);
            voteSticker.AddClass("Appear");
        }
    }
    for (let i = 0; i < voteCategories.GetChildCount(); ++i) {
        let voteCategory = voteCategories.GetChild(i);
        voteCategory.SwitchClass("highlight", "");
    }
}
