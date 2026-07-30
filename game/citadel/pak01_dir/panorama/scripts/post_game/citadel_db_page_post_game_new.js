"use strict";
/// <reference path="../citadel.d.ts" />
/// <reference path="../async.ts" />
// Called from C++ to get the testing data
function GetTestingProgressDataJSON() {
    let data = {
        match_id: "0",
        match_mode: 4 /* ECitadelMatchMode.k_ECitadelMatchMode_Ranked */,
        game_mode: 1 /* ECitadelGameMode.k_ECitadelGameMode_Normal */,
        winning_team: 0 /* ECitadelLobbyTeam.k_ECitadelLobbyTeam_Team0 */,
        ranked_type: 1 /* ECitadelRankedType.k_eCitadelRankedType_Normal */,
        rank_interval: 1,
        local_player: {
            player_slot: 0,
            account_id: 85501006,
            hero_id: 63,
            team: 0 /* ECitadelLobbyTeam.k_ECitadelLobbyTeam_Team0 */,
            mvp_rank: 0,
            player_rank_data: {
                initial_display_rank: 111,
                initial_flat_progress: 60100,
                final_flat_progress: 60425,
                desired_progress_change: 250,
                initial_calibration_games: 0,
                initial_demotion_protection_games: 2,
                consumed_demotion_protection: false,
                initial_win_streak: 3,
            },
            player_match_outcome: 1 /* EPlayerMatchOutcome.k_EPlayerMatchOutcome_Win */,
            accolades: [
                {
                    accolade_id: 1,
                    accolade_name: "#Citadel_VData_accolades_assists_FlavorName",
                    accolade_desc: "#Citadel_VData_accolades_assists_Description:p",
                    accolade_stars_achieved: 3,
                    accolade_stat_value: 23,
                },
                {
                    accolade_id: 2,
                    accolade_name: "#Citadel_VData_accolades_returned_idol_FlavorName",
                    accolade_desc: "#Citadel_VData_accolades_returned_idol_Description:p",
                    accolade_stars_achieved: 2,
                    accolade_stat_value: 2,
                },
                {
                    accolade_id: 3,
                    accolade_name: "#Citadel_VData_accolades_breakables_destroyed_FlavorName",
                    accolade_desc: "#Citadel_VData_accolades_breakables_destroyed_Description:p",
                    accolade_stars_achieved: 1,
                    accolade_stat_value: 123,
                },
            ],
        },
        mvp_players: [
            {
                player_slot: 1,
                account_id: 108002,
                hero_id: 6,
                team: 0 /* ECitadelLobbyTeam.k_ECitadelLobbyTeam_Team0 */,
                mvp_rank: 1,
                player_match_outcome: 1 /* EPlayerMatchOutcome.k_EPlayerMatchOutcome_Win */,
                accolades: [
                    {
                        accolade_id: 1,
                        accolade_name: "#Citadel_VData_accolades_assists_FlavorName",
                        accolade_desc: "Citadel_VData_accolades_assists_Description:p",
                        accolade_stars_achieved: 3,
                        accolade_stat_value: 23,
                    },
                    {
                        accolade_id: 2,
                        accolade_name: "#Citadel_VData_accolades_returned_idol_FlavorName",
                        accolade_desc: "#Citadel_VData_accolades_returned_idol_Description:p",
                        accolade_stars_achieved: 2,
                        accolade_stat_value: 2,
                    },
                    {
                        accolade_id: 3,
                        accolade_name: "#Citadel_VData_accolades_breakables_destroyed_FlavorName",
                        accolade_desc: "#Citadel_VData_accolades_breakables_destroyed_Description:p",
                        accolade_stars_achieved: 1,
                        accolade_stat_value: 123,
                    },
                ],
            },
            {
                player_slot: 2,
                account_id: 85501006,
                hero_id: 63,
                team: 1 /* ECitadelLobbyTeam.k_ECitadelLobbyTeam_Team1 */,
                mvp_rank: 2,
                player_match_outcome: 1 /* EPlayerMatchOutcome.k_EPlayerMatchOutcome_Win */,
                accolades: [
                    {
                        accolade_id: 1,
                        accolade_name: "#Citadel_VData_accolades_player_damage_FlavorName",
                        accolade_desc: "#Citadel_VData_accolades_player_damage_Description:p",
                        accolade_stars_achieved: 3,
                        accolade_stat_value: 83435,
                    },
                    {
                        accolade_id: 2,
                        accolade_name: "#Citadel_VData_accolades_killstreak_kills_FlavorName",
                        accolade_desc: "#Citadel_VData_accolades_killstreak_kills_Description:p",
                        accolade_stars_achieved: 2,
                        accolade_stat_value: 5,
                    },
                ],
            },
            {
                player_slot: 3,
                account_id: 85502759,
                hero_id: 2,
                team: 0 /* ECitadelLobbyTeam.k_ECitadelLobbyTeam_Team0 */,
                mvp_rank: 3,
                player_match_outcome: 1 /* EPlayerMatchOutcome.k_EPlayerMatchOutcome_Win */,
                accolades: [
                    {
                        accolade_id: 1,
                        accolade_name: "#Citadel_VData_accolades_long_distance_kills_FlavorName",
                        accolade_desc: "#Citadel_VData_accolades_long_distance_kills_Description:p",
                        accolade_stars_achieved: 3,
                        accolade_stat_value: 8,
                    },
                    {
                        accolade_id: 2,
                        accolade_name: "#Citadel_VData_accolades_ability_damage_FlavorName",
                        accolade_desc: "#Citadel_VData_accolades_ability_damage_Description:p",
                        accolade_stars_achieved: 2,
                        accolade_stat_value: 9345,
                    },
                ],
            },
        ]
    };
    return JSON.stringify(data);
}
