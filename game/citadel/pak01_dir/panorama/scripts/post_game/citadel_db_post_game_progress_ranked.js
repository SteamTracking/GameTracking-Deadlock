"use strict";
/// <reference path="../citadel.d.ts" />
/// <reference path="../async.ts" />
/// <reference path="./citadel_db_page_post_game_new.ts" />
let gProgressSequence = null;
function CompareRanks(left, right) {
    if (left.packedRank < right.packedRank)
        return -1;
    if (left.packedRank > right.packedRank)
        return 1;
    return 0;
}
function AreRanksEqual(left, right) {
    return CompareRanks(left, right) == 0;
}
function ExtractPackedRank(packedRank) {
    let rankNum = Math.trunc(packedRank / 10.0);
    let subRankNum = Math.trunc(packedRank % 10.0);
    return { rank: rankNum, subRank: subRankNum };
}
function GetLowerRank(unpacked) {
    if (unpacked.rank == 1 /* CitadelBadgeRank_t.Citadel_Rank1 */ && unpacked.subRank == 1 /* CitadelBadgeSubRank_t.Citadel_SubRank1 */)
        return undefined;
    if (unpacked.subRank == 1 /* CitadelBadgeSubRank_t.Citadel_SubRank1 */)
        return { rank: unpacked.rank - 1, subRank: 6 /* CitadelBadgeSubRank_t.Citadel_SubRankMax */ };
    return { rank: unpacked.rank, subRank: unpacked.subRank - 1 };
}
function GetHigherRank(unpacked) {
    if (unpacked.rank == 11 /* CitadelBadgeRank_t.Citadel_RankMax */ && unpacked.subRank == 6 /* CitadelBadgeSubRank_t.Citadel_SubRankMax */)
        return undefined;
    if (unpacked.subRank == 6 /* CitadelBadgeSubRank_t.Citadel_SubRankMax */)
        return { rank: unpacked.rank + 1, subRank: 1 /* CitadelBadgeSubRank_t.Citadel_SubRank1 */ };
    return { rank: unpacked.rank, subRank: unpacked.subRank + 1 };
}
function GetLowerRankInfo(rankInfo) {
    if (!rankInfo)
        return undefined;
    if (rankInfo.rank == 1 /* CitadelBadgeRank_t.Citadel_Rank1 */ && rankInfo.subRank == 1 /* CitadelBadgeSubRank_t.Citadel_SubRank1 */)
        return undefined;
    let screen = $.GetContextPanel();
    return screen.GetProgressRankInfo(rankInfo.flatProgress - 1);
}
function GetHigherRankInfo(rankInfo) {
    if (!rankInfo)
        return undefined;
    if (rankInfo.rank == 11 /* CitadelBadgeRank_t.Citadel_RankMax */ && rankInfo.subRank == 6 /* CitadelBadgeSubRank_t.Citadel_SubRankMax */)
        return undefined;
    let screen = $.GetContextPanel();
    return screen.GetProgressRankInfo(rankInfo.flatProgress + rankInfo.levelProgress);
}
function Ranked_AnimateProgressScreen(progressDataString) {
    let progressData = JSON.parse(progressDataString);
    Ranked_DoProgressAnimation(progressData);
}
function SetupRankChange(screen, rankChange) {
    let rankChangePrefix = rankChange >= 0 ? "+" : "-";
    let rankChangeAbs = Math.abs(rankChange);
    screen.SetDialogVariable("rank_change_prefix", rankChangePrefix);
    screen.SetDialogVariableInt("rank_change", rankChangeAbs);
    if (rankChange > 0) {
        screen.SwitchClass("rank_change_type", "GainedRank");
    }
    else if (rankChange < 0) {
        screen.SwitchClass("rank_change_type", "LostRank");
    }
    else {
        screen.SwitchClass("rank_change_type", "NoRankChange");
    }
}
function Ranked_ResetScreen() {
    let screen = $.GetContextPanel();
    let rankBadges = screen.FindChildInLayoutFile("RankBadges");
    let rankEffects = screen.FindChildInLayoutFile("RankEffects");
    // Reset the controls
    rankBadges.RemoveAndDeleteChildren();
    screen.RemoveClass('ShowCalibrating');
    screen.RemoveClass('ShowRankReceived');
    screen.SwitchClass("received_class", "");
    screen.RemoveClass('ShowWinStreak');
    for (let i = 0; i < rankEffects.GetChildCount(); ++i) {
        let scenePanel = rankEffects.GetChild(i);
        scenePanel.StopParticlesImmediately(true);
    }
}
function Ranked_PlayScenePanelEffect(strPanelID) {
    let screen = $.GetContextPanel();
    let rankEffects = screen.FindChildInLayoutFile("RankEffects");
    // Stop any existing effects
    for (let i = 0; i < rankEffects.GetChildCount(); ++i) {
        let scenePanel = rankEffects.GetChild(i);
        scenePanel.StopParticlesWithEndcaps(true);
    }
    let scenePanel = rankEffects.FindChildInLayoutFile(strPanelID);
    scenePanel.AddClass("ShowEffects");
    scenePanel.StartParticles();
    $.Schedule(5.0, function () { scenePanel.RemoveClass("ShowEffects"); });
}
async function Ranked_AnimateRankReceived(rankInfo, reason) {
    let sequence = gProgressSequence;
    let screen = $.GetContextPanel();
    let rankReceivedBadge = screen.FindChildInLayoutFile("RankReceivedBadge");
    let rankEffects = screen.FindChildInLayoutFile("RankEffects");
    let bTreatAsRankUp = false;
    switch (reason) {
        case 0 /* ERankReceivedReason.k_eCalibrated */:
            screen.SwitchClass("received_class", "RankReceived_Calibrated");
            screen.SetDialogVariableLocString("rank_received_title", "#Citadel_RankedProgress_CalibratedRank");
            bTreatAsRankUp = true;
            break;
        case 1 /* ERankReceivedReason.k_eGainedRank */:
            screen.SwitchClass("received_class", "RankReceived_GainedRank");
            screen.SetDialogVariableLocString("rank_received_title", "#Citadel_RankedProgress_GainedRank");
            bTreatAsRankUp = true;
            break;
        case 2 /* ERankReceivedReason.k_eLostRank */:
            screen.SwitchClass("received_class", "RankReceived_LostRank");
            screen.SetDialogVariableLocString("rank_received_title", "#Citadel_RankedProgress_LostRank");
            break;
    }
    screen.SetDialogVariableInt("packed_rank_received", rankInfo.packedRank);
    rankReceivedBadge.packedRank = rankInfo.packedRank;
    screen.PlayRankRevealMusic(rankInfo.rank, rankInfo.subRank, bTreatAsRankUp);
    if (bTreatAsRankUp) {
        if (rankInfo.subRank == 1 /* CitadelBadgeSubRank_t.Citadel_SubRank1 */) {
            Ranked_PlayScenePanelEffect('RankUpEffects');
        }
        else {
            Ranked_PlayScenePanelEffect('SubRankUpEffects');
        }
    }
    else {
        Ranked_PlayScenePanelEffect('RankDownEffects');
    }
    screen.AddClass("ShowRankReceived");
    await sequence.Delay(3.0);
    screen.RemoveClass("ShowRankReceived");
}
async function Ranked_AnimateCalibration(progressData) {
    let sequence = gProgressSequence;
    let screen = $.GetContextPanel();
    let player = progressData.local_player;
    let rankData = player.player_rank_data;
    let calibratingPips = screen.FindChildInLayoutFile('CalibratingPips');
    let rankBadges = screen.FindChildInLayoutFile("RankBadges");
    // Setup the initial state
    screen.AddClass('ShowCalibrating');
    let centerBadge = CreateRankBadgePanel(rankBadges, { rank: 0, subRank: 0 });
    centerBadge?.AddClass("Center");
    // Now do the animation
    await sequence.Delay(2.0);
    // Find the first pip that is not highlighted. Add a class to highlight it.
    for (let i = 0; i < calibratingPips.GetChildCount(); ++i) {
        let pip = calibratingPips.GetChild(i);
        if (pip.BHasClass('MatchFinished'))
            continue;
        pip.AddClass('MatchHighlighted');
        let nHighlightSound = PlayUISoundEvent("UI.Ranked.Calibration.Progress");
        await sequence.Delay(1.0);
        StopUISoundEvent(nHighlightSound);
        pip.RemoveClass('MatchHighlighted');
        pip.AddClass('MatchCompleted');
        PlayUISoundEvent("UI.Ranked.Calibration.Complete");
        await sequence.Delay(1.0);
        break;
    }
    // If this was the last calibration match, show the rank you just received
    if (rankData.initial_calibration_games == 1) {
        let receivedRankInfo = screen.GetProgressRankInfo(rankData.final_flat_progress);
        if (receivedRankInfo) {
            // setup the display to the normal view so you can see the progress bar after we're done with the popup.
            // this assumes that your initial calibration rank will not be a leaderboard rank
            let progressBar = screen.FindChildInLayoutFile("RankProgressBar");
            let lowerRankInfo = GetLowerRankInfo(receivedRankInfo);
            let higherRankInfo = GetHigherRankInfo(receivedRankInfo);
            centerBadge?.DeleteAsync(0.0);
            centerBadge = CreateRankInfoBadgePanel(rankBadges, receivedRankInfo);
            let leftBadge = CreateRankInfoBadgePanel(rankBadges, lowerRankInfo);
            let rightBadge = CreateRankInfoBadgePanel(rankBadges, higherRankInfo);
            leftBadge?.SwitchClass("rank_class", "Left");
            centerBadge?.SwitchClass("rank_class", "Center");
            rightBadge?.SwitchClass("rank_class", "Right");
            let receivedRankProgress = rankData.final_flat_progress - receivedRankInfo.flatProgress;
            progressBar.min = 0;
            progressBar.max = receivedRankInfo.levelProgress;
            progressBar.lowervalue = receivedRankProgress;
            progressBar.uppervalue = receivedRankProgress;
            screen.SetDialogVariableInt("current_rank_progress", receivedRankProgress);
            screen.SetDialogVariableInt("max_rank_progress", receivedRankInfo.levelProgress);
            SetupRankChange(screen, 0);
            sequence.EndSkipping();
            await Ranked_AnimateRankReceived(receivedRankInfo, 0 /* ERankReceivedReason.k_eCalibrated */);
            screen.RemoveClass('ShowCalibrating');
            await sequence.Delay(2.0);
        }
    }
}
function StartProgressTickingSound(progressChange) {
    if (progressChange > 0) {
        return PlayUISoundEvent("UI.Ranked.ProgressUp");
    }
    else if (progressChange < 0) {
        return PlayUISoundEvent("UI.Ranked.ProgressDown");
    }
    return 0;
}
async function Ranked_AnimateRankProgress(progressData) {
    let sequence = gProgressSequence;
    let screen = $.GetContextPanel();
    let progressBar = screen.FindChildInLayoutFile("RankProgressBar");
    let rankBadges = screen.FindChildInLayoutFile("RankBadges");
    let player = progressData.local_player;
    let rankData = player.player_rank_data;
    let initialRankInfo = screen.GetProgressRankInfo(rankData.initial_flat_progress);
    let initialRankProgress = rankData.initial_flat_progress - initialRankInfo.flatProgress;
    let leftBadge = undefined;
    let centerBadge = undefined;
    let rightBadge = undefined;
    // Setup the initial state
    if (!initialRankInfo.bLeaderboardPlacement) {
        // Default case - a progress rank. Show the progress bar
        screen.RemoveClass("ShowingLeaderboardRank");
        progressBar.min = 0;
        progressBar.max = initialRankInfo.levelProgress;
        progressBar.lowervalue = initialRankProgress;
        progressBar.uppervalue = initialRankProgress;
        screen.SetDialogVariableInt("current_rank_progress", initialRankProgress);
        screen.SetDialogVariableInt("max_rank_progress", initialRankInfo.levelProgress);
        let lowerRankInfo = GetLowerRankInfo(initialRankInfo);
        let higherRankInfo = GetHigherRankInfo(initialRankInfo);
        leftBadge = CreateRankInfoBadgePanel(rankBadges, lowerRankInfo);
        centerBadge = CreateRankInfoBadgePanel(rankBadges, initialRankInfo);
        rightBadge = CreateRankInfoBadgePanel(rankBadges, higherRankInfo);
    }
    else {
        // A leaderboard rank - show the badge from the passed in display rank, and just show the rank points instead of a progress bar
        screen.AddClass("ShowingLeaderboardRank");
        screen.SetDialogVariableInt("leaderboard_packed_rank", initialRankInfo.packedRank);
        screen.SetDialogVariableInt("current_rank_progress", initialRankProgress);
        let initial = ExtractPackedRank(rankData.initial_display_rank);
        let lower = GetLowerRank(initial);
        let higher = GetHigherRank(initial);
        leftBadge = CreateRankBadgePanel(rankBadges, lower);
        centerBadge = CreateRankBadgePanel(rankBadges, initial);
        rightBadge = CreateRankBadgePanel(rankBadges, higher);
    }
    SetupRankChange(screen, rankData.desired_progress_change);
    let lowerRankInfo = GetLowerRankInfo(initialRankInfo);
    let higherRankInfo = GetHigherRankInfo(initialRankInfo);
    leftBadge?.SwitchClass("rank_class", "Left");
    centerBadge?.SwitchClass("rank_class", "Center");
    rightBadge?.SwitchClass("rank_class", "Right");
    // Now do the animation
    await sequence.Delay(1.0);
    leftBadge?.AddClass('Animate');
    centerBadge?.AddClass('Animate');
    rightBadge?.AddClass('Animate');
    // See if they got a win streak. If so, animate that appearing
    if (screen.BHasClass('HasWinStreakBonus')) {
        screen.AddClass('ShowWinStreak');
        PlayUISoundEvent("UI.Ranked.WinStreak.Appear");
        await sequence.Delay(1.0);
    }
    // Animate receiving the progress
    const progressAnimDefaultDuration = 1.0;
    // Adjust the duration so that if we were clamped it doesn't take as long
    let progressChange = rankData.final_flat_progress - rankData.initial_flat_progress;
    let progressChangeAbs = Math.abs(progressChange);
    let progressAnimDuration = progressAnimDefaultDuration * (progressChangeAbs / 250.0);
    // Start a ticking sound
    let nProgressSound = StartProgressTickingSound(progressChange);
    let progressAnimElapsed = 0.0;
    let prevRankInfo = initialRankInfo;
    let prevFrameTime = $.FrameTime();
    while (progressAnimElapsed < progressAnimDuration) {
        await sequence.Delay(0.0);
        let frameTime = $.FrameTime();
        progressAnimElapsed += frameTime - prevFrameTime;
        prevFrameTime = frameTime;
        // If skipping, just slam to the final value.
        if (sequence.IsSkipping()) {
            progressAnimElapsed = progressAnimDuration;
        }
        let progressPercent = progressAnimElapsed / progressAnimDuration;
        let currentFlatProgress = rankData.initial_flat_progress + progressPercent * (rankData.final_flat_progress - rankData.initial_flat_progress);
        if (rankData.final_flat_progress > rankData.initial_flat_progress) {
            currentFlatProgress = Math.min(currentFlatProgress, rankData.final_flat_progress);
        }
        else {
            currentFlatProgress = Math.max(currentFlatProgress, rankData.final_flat_progress);
        }
        let newRankInfo = screen.GetProgressRankInfo(currentFlatProgress);
        let compare = CompareRanks(prevRankInfo, newRankInfo);
        if (compare != 0) {
            // Stop the ticking
            if (nProgressSound != 0) {
                StopUISoundEvent(nProgressSound);
                nProgressSound = 0;
            }
            sequence.EndSkipping();
            if (compare < 0) {
                // Gained a rank. Force the progress bar to show the max of the previous rank
                progressBar.min = 0;
                progressBar.lowervalue = AreRanksEqual(prevRankInfo, initialRankInfo) ? (rankData.initial_flat_progress - initialRankInfo.flatProgress) : 0;
                progressBar.uppervalue = prevRankInfo.levelProgress;
                progressBar.max = prevRankInfo.levelProgress;
                screen.SetDialogVariableInt("current_rank_progress", prevRankInfo.levelProgress);
                screen.SetDialogVariableInt("max_rank_progress", prevRankInfo.levelProgress);
                await Ranked_AnimateRankReceived(newRankInfo, 1 /* ERankReceivedReason.k_eGainedRank */);
                let higherRankInfo = GetHigherRankInfo(newRankInfo);
                // Animate the badges to the left
                leftBadge?.SwitchClass("rank_class", "ExitLeft");
                leftBadge?.DeleteAsync(1.0);
                centerBadge?.SwitchClass("rank_class", "Left");
                leftBadge = centerBadge;
                rightBadge?.SwitchClass("rank_class", "Center");
                centerBadge = rightBadge;
                rightBadge = CreateRankInfoBadgePanel(rankBadges, higherRankInfo);
                rightBadge?.SwitchClass("rank_class", "ExitRight");
                rightBadge?.ApplyStyles(false);
                rightBadge?.AddClass('Animate');
                rightBadge?.ApplyStyles(false);
                rightBadge?.SwitchClass("rank_class", "Right");
                PlayUISoundEvent("UI.Ranked.Change");
            }
            else {
                // Lost a rank. Force the progress bar to show the min of the previous rank
                progressBar.min = 0;
                progressBar.lowervalue = 0;
                progressBar.uppervalue = AreRanksEqual(prevRankInfo, initialRankInfo) ? (rankData.initial_flat_progress - initialRankInfo.flatProgress) : prevRankInfo.levelProgress;
                progressBar.max = prevRankInfo.levelProgress;
                screen.SetDialogVariableInt("current_rank_progress", 0);
                screen.SetDialogVariableInt("max_rank_progress", prevRankInfo.levelProgress);
                await Ranked_AnimateRankReceived(newRankInfo, 2 /* ERankReceivedReason.k_eLostRank */);
                let lowerRankInfo = GetLowerRankInfo(newRankInfo);
                // Animate the badges to the right
                rightBadge?.SwitchClass("rank_class", "ExitRight");
                rightBadge?.DeleteAsync(1.0);
                centerBadge?.SwitchClass("rank_class", "Right");
                rightBadge = centerBadge;
                leftBadge?.SwitchClass("rank_class", "Center");
                centerBadge = leftBadge;
                leftBadge = CreateRankInfoBadgePanel(rankBadges, lowerRankInfo);
                leftBadge?.SwitchClass("rank_class", "ExitLeft");
                leftBadge?.ApplyStyles(false);
                leftBadge?.AddClass('Animate');
                leftBadge?.ApplyStyles(false);
                leftBadge?.SwitchClass("rank_class", "Left");
            }
            await sequence.Delay(1.0);
            // Resume the ticking sound if we have more progress to go
            if (currentFlatProgress != rankData.final_flat_progress) {
                nProgressSound = StartProgressTickingSound(progressChange);
            }
            prevFrameTime = $.FrameTime();
        }
        let progressInRank = currentFlatProgress - newRankInfo.flatProgress;
        if (!newRankInfo.bLeaderboardPlacement) {
            screen.RemoveClass("ShowingLeaderboardRank");
            progressBar.min = 0;
            progressBar.max = newRankInfo.levelProgress;
            if (AreRanksEqual(initialRankInfo, newRankInfo)) {
                if (rankData.final_flat_progress > rankData.initial_flat_progress) {
                    progressBar.lowervalue = rankData.initial_flat_progress - newRankInfo.flatProgress;
                    progressBar.uppervalue = progressInRank;
                }
                else {
                    progressBar.lowervalue = progressInRank;
                    progressBar.uppervalue = rankData.initial_flat_progress - newRankInfo.flatProgress;
                }
            }
            else {
                if (rankData.final_flat_progress > rankData.initial_flat_progress) {
                    progressBar.lowervalue = 0;
                    progressBar.uppervalue = progressInRank;
                }
                else {
                    progressBar.lowervalue = progressInRank;
                    progressBar.uppervalue = newRankInfo.levelProgress;
                }
            }
            screen.SetDialogVariableInt("current_rank_progress", progressInRank);
            screen.SetDialogVariableInt("max_rank_progress", newRankInfo.levelProgress);
        }
        else {
            screen.AddClass("ShowingLeaderboardRank");
            screen.SetDialogVariableInt("leaderboard_packed_rank", initialRankInfo.packedRank);
            screen.SetDialogVariableInt("current_rank_progress", progressInRank);
        }
        prevRankInfo = newRankInfo;
    }
    // Stop ticking
    if (nProgressSound != 0) {
        StopUISoundEvent(nProgressSound);
        nProgressSound = 0;
    }
    sequence.EndSkipping();
    if (rankData.consumed_demotion_protection) {
        let demotionPips = screen.FindChildInLayoutFile('DemotionProtectionPips');
        for (let i = demotionPips.GetChildCount() - 1; i >= 0; --i) {
            let pip = demotionPips.GetChild(i);
            if (!pip.BHasClass("Used")) {
                Ranked_PlayScenePanelEffect('RankLossPreventionEffects');
                PlayUISoundEvent('UI.Ranked.RankProtected');
                pip.AddClass("Highlighted");
                await sequence.Delay(1.0);
                pip.RemoveClass("Highlighted");
                pip.AddClass("Used");
                break;
            }
        }
        screen.SetDialogVariableInt("demotion_protection_remaining", rankData.initial_demotion_protection_games - 1);
    }
}
async function Ranked_DoProgressAnimation(progressData) {
    if (gProgressSequence && !gProgressSequence.IsFinished())
        gProgressSequence.Abort();
    gProgressSequence = new Async.SequenceController();
    let screen = $.GetContextPanel();
    Ranked_ResetScreen();
    let player = progressData.local_player;
    if (!player.player_rank_data) {
        $.Msg("Missing rank data!");
        screen.NotifyFinishedAnimating();
        return;
    }
    let rankData = player.player_rank_data;
    if (rankData.initial_calibration_games > 0) {
        await Ranked_AnimateCalibration(progressData);
    }
    else {
        await Ranked_AnimateRankProgress(progressData);
    }
    await gProgressSequence.Delay(2.0);
    screen.NotifyFinishedAnimating();
}
function Ranked_SkipForward() {
    if (!gProgressSequence)
        return;
    gProgressSequence.Skip();
}
function CreateRankBadgePanel(parent, unpacked) {
    if (!unpacked)
        return undefined;
    return $.CreatePanel('CitadelRankedBadgeFull', parent, "", { class: "RankBadge", rank: unpacked.rank, subrank: unpacked.subRank });
}
function CreateRankInfoBadgePanel(parent, rankInfo) {
    if (!rankInfo)
        return undefined;
    return CreateRankBadgePanel(parent, { rank: rankInfo.rank, subRank: rankInfo.subRank });
}
function Ranked_ShowScreenNoAnimation(progressDataString) {
    let progressData = JSON.parse(progressDataString);
    let screen = $.GetContextPanel();
    let progressBar = screen.FindChildInLayoutFile("RankProgressBar");
    let rankBadges = screen.FindChildInLayoutFile("RankBadges");
    Ranked_ResetScreen();
    let player = progressData.local_player;
    if (!player.player_rank_data) {
        $.Msg("Missing rank data!");
        return;
    }
    let rankData = player.player_rank_data;
    if (rankData.initial_calibration_games > 1) {
        let calibratingPips = screen.FindChildInLayoutFile('CalibratingPips');
        screen.AddClass('ShowCalibrating');
        // Find the first pip that is not highlighted. Add a class to highlight it.
        for (let i = 0; i < calibratingPips.GetChildCount(); ++i) {
            let pip = calibratingPips.GetChild(i);
            if (pip.BHasClass('MatchFinished'))
                continue;
            pip.AddClass('MatchCompleted');
            break;
        }
        let centerBadge = CreateRankBadgePanel(rankBadges, { rank: 0, subRank: 0 });
        centerBadge?.AddClass("Center");
        return;
    }
    let finalRankInfo = screen.GetProgressRankInfo(rankData.final_flat_progress);
    let initialRankInfo;
    if (rankData.initial_calibration_games == 1) {
        // If this is the final game before calibration, then we won't have an initial rank. So just set it to the final rank.
        initialRankInfo = finalRankInfo;
    }
    else {
        initialRankInfo = screen.GetProgressRankInfo(rankData.initial_flat_progress);
    }
    let finalProgressInRank = rankData.final_flat_progress - finalRankInfo.flatProgress;
    SetupRankChange(screen, rankData.desired_progress_change);
    if (screen.BHasClass('HasWinStreakBonus')) {
        screen.AddClass('ShowWinStreak');
    }
    let leftBadge = undefined;
    let centerBadge = undefined;
    let rightBadge = undefined;
    if (finalRankInfo.bLeaderboardPlacement) {
        screen.AddClass("ShowingLeaderboardRank");
        screen.SetDialogVariableInt("current_rank_progress", finalProgressInRank);
        // For leaderboard ranks, we assume that unless you deranked into a non-leaderboard rank,
        // your badge won't have changed since that happens async
        let initial = ExtractPackedRank(rankData.initial_display_rank);
        let lower = GetLowerRank(initial);
        let higher = GetHigherRank(initial);
        leftBadge = CreateRankBadgePanel(rankBadges, lower);
        centerBadge = CreateRankBadgePanel(rankBadges, initial);
        rightBadge = CreateRankBadgePanel(rankBadges, higher);
    }
    else {
        screen.RemoveClass("ShowingLeaderboardRank");
        progressBar.min = 0;
        progressBar.max = finalRankInfo.levelProgress;
        if (AreRanksEqual(initialRankInfo, finalRankInfo)) {
            if (rankData.final_flat_progress > rankData.initial_flat_progress) {
                progressBar.lowervalue = rankData.initial_flat_progress - finalRankInfo.flatProgress;
                progressBar.uppervalue = finalProgressInRank;
            }
            else {
                progressBar.lowervalue = finalProgressInRank;
                progressBar.uppervalue = rankData.initial_flat_progress - finalRankInfo.flatProgress;
            }
        }
        else {
            if (rankData.final_flat_progress > rankData.initial_flat_progress) {
                progressBar.lowervalue = 0;
                progressBar.uppervalue = finalProgressInRank;
            }
            else {
                progressBar.lowervalue = finalProgressInRank;
                progressBar.uppervalue = finalRankInfo.levelProgress;
            }
        }
        screen.SetDialogVariableInt("current_rank_progress", finalProgressInRank);
        screen.SetDialogVariableInt("max_rank_progress", finalRankInfo.levelProgress);
        let lowerRankInfo = GetLowerRankInfo(finalRankInfo);
        let higherRankInfo = GetHigherRankInfo(finalRankInfo);
        leftBadge = CreateRankInfoBadgePanel(rankBadges, lowerRankInfo);
        centerBadge = CreateRankInfoBadgePanel(rankBadges, finalRankInfo);
        rightBadge = CreateRankInfoBadgePanel(rankBadges, higherRankInfo);
    }
    leftBadge?.AddClass("Left");
    centerBadge?.AddClass("Center");
    rightBadge?.AddClass("Right");
    if (rankData.consumed_demotion_protection) {
        let demotionPips = screen.FindChildInLayoutFile('DemotionProtectionPips');
        for (let i = demotionPips.GetChildCount() - 1; i >= 0; --i) {
            let pip = demotionPips.GetChild(i);
            if (!pip.BHasClass("Used")) {
                pip.AddClass("Used");
                break;
            }
        }
        screen.SetDialogVariableInt("demotion_protection_remaining", rankData.initial_demotion_protection_games - 1);
    }
}
