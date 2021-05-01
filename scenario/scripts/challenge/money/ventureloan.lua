-- ventureloan.lua
-- functions for the ventureloan challenge

include "scenario/scripts/ui.lua";
include "scenario/scripts/entity.lua";
include "scenario/scripts/economy.lua";
include "scenario/scripts/misc.lua";


CHALLENGE_NAME = "ventureloan";

function validate()
	
	if (isChalDeclinedForever(CHALLENGE_NAME) == true) then
		return 0;
	end
	
	-- Set the current challenge in a global variable for debugging purposes
	setglobalvar("current_challenge_name", CHALLENGE_NAME);
	
	local donealready = getglobalvar(CHALLENGE_NAME.."_over");
	
	if (donealready == nil) or (donealready ~= "true") then
		
		local mgr = queryObject("BFScenarioMgr");
		if (mgr) then
			-- If we are gathering prereqs, output the challenge name
			if (getPrereqGather() == true) then
				BFLOG(SYSTRACE, CHALLENGE_NAME);
			end
		
			-- Increment the number of challenges which have been offered
			incChallengesOffered();
		
			-- Only give the scenario if we are not suppressing them
			if (getAddScenarioSuppression() == false) then
				mgr:BFS_ADDSCENARIO("scenario/goals/challenge/ventureloan.xml");
			elseif (getPrereqGather() == false) then
				logDebugChallengeInfo(CHALLENGE_NAME, "skipped");
			end
			
			return 1;
		end
	end
	
	return 0;
end


-- gives you venture capitalist loan challenge
function evalventureloan(comp)


	challenge = getglobalvar("challenge")
	if (challenge == "accept") then

		local mgr = queryObject("BFScenarioMgr");
		if (mgr) then
			mgr:BFS_SHOWRULE(CHALLENGE_NAME);
		end
		
		logDebugChallengeInfo(CHALLENGE_NAME, "accepted");
		
		setchallengeactive();
		
		-- INIT THE LOAN
		if comp.loanactive == nil then
			-- Initialize the loan info
			comp.loanactive = 1;
			comp.loanpayback = 12000;
			comp.loanskim = .4;
			comp.loanmonth = getCurrentMonth();
			comp.prevMonthPaid = 0;
			
			-- Get the starting donations
			comp.prevDonations = getDonationsAllAnimals() + getDonations("Education");

			--BFLOG(SYSTRACE, "Loan initialized - size: 10000  payback: "..comp.loanpayback.." skim: "..comp.loanskim..".");

			-- Give them their money
			giveCash(10000);	
		end
		
		comp.accept = 1;
		
	elseif (challenge == "decline") then
		if (getDeclineForever() == true) then
			setglobalvar(CHALLENGE_NAME.."_decline_forever", "true");
			
			logDebugChallengeInfo(CHALLENGE_NAME, "declinedforever");
			
			-- If we make it here we want to reset decline forever
			setDeclineForever(false);
		elseif (getChallengeDebugMode() == true) then
			logDebugChallengeInfo(CHALLENGE_NAME, "declined");
		end

		return -1;
	end		
	
	if comp.accept == nil then
		if (challenge == nil) then
			local showchallengepanel = showchallengepanel("Challengetext:CHgrantmoney2");
			setglobalvar("challenge", "waiting");
		end	
	end

	if comp.accept == 1 then
		
		-- MAINTAIN THE LOAN
		
		-- Only if they currently have a loan
		if comp.loanactive ~= nil then
			local curMonth = getCurrentMonth();
			
			--BFLOG(SYSTRACE, "Last loan month: "..comp.loanmonth.." current month: "..curMonth..".");
	
	
			-- Only take the cash if they haven't paid everything back
			if (comp.loanpayback > 0) then
				-- Find any new donations and subtract them from the total
				local currentDonations = getDonationsAllAnimals() + getDonations("Education");
				local skimamount = (currentDonations - comp.prevDonations) * comp.loanskim;
				comp.prevDonations = currentDonations;
				comp.prevMonthPaid = comp.prevMonthPaid + skimamount;
				comp.loanpayback = comp.loanpayback - skimamount;
			
				--BFLOG(SYSNOTE, "Skim: "..skimamount.."  MonthTotal: "..comp.prevMonthPaid.."  LoanBalance: "..comp.loanpayback);
			
				-- Subtract this skim from their cash and loan payback
				takeCashNoPopup(skimamount);
			end

			-- If we have a new month to process
			if (curMonth > comp.loanmonth) then
				-- If they have paid back their fair share
				if comp.loanpayback < 0 then

					-- Give them back the overpay
					local overpay = 0 - comp.loanpayback;
					giveCashNoPopup(overpay);

					-- Now cancel the loan
					comp.loanactive = nil;
					--BFLOG(SYSTRACE, "Loan has been completely repaid!");
				
					return 1;
				end
				if(comp.prevMonthPaid ~= 0)then
					showgivecash("Challengetext:GenericMoneyLoss", (0 - comp.prevMonthPaid));
				end
				comp.prevMonthPaid = 0;
				-- If it's not paid off yet, then update the month
				comp.loanmonth = curMonth;
			end
		end
	end
	
	return 0;
end


function completeventureloan(comp)
	
	showchallengewin("Challengetext:CHgrantmoney2Success");	
	resetchallengeoverandcomplete(CHALLENGE_NAME);
	incrementglobalchallenges();
	
end

function failventureloan(comp)
	resetchallengeover(CHALLENGE_NAME);	
end