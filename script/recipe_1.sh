
##### RECIPE 1 #####
#
# 1- chose task type
#	- manual
#	- automatic (random: fix/feature)
# 2- move to tagret branch_x
#	- fix (hotfix/coldfix/bugfix/patch)
#	- feature
# 3- read content from source file_x
# 4- pass file content to target file_x in branch_x
# 5- stash changes from file_x
# 6- copy stash to branch_x-stash branch (cherry-pick)
# 7- apply stash to target branch_x
# 8- commit task
# 9- tag commit
# 10- create patch from commit: task-commit-patch_x
# 11- test task-commit-patch_x 
#	- IF FAIL: correct
#	- IF PASS: pass task-commit-patch_x to target branch (dev-patch)
# 12- pass task-commit-patch_x from dev-patch branch to target branch (dev-test)
# 13- pass task-commit-patch_x from dev-test branch to target branch (dev)
# 14- update remote: fetch remote target bare repo/branch 
# 15- push task-commit-patch_x to remote target bare repo/branch
# 16- issue pull request on remote target bare repo/branch
#
####################


#!/usr/bin/bash

### Variables ###
	authorName="Sosthene Grosset-Janin"
	timeline=$(date)	

	sourceFilePath="./"
	# sourceFileName=$0
	sourceFileName="sourceFile.txt"	
	sourceFullName=$sourceFileName
	sourceFileLineCount=$( wc -l < $sourceFullName )
	#sourceFileLineCount=100
	targetFileName="targetFile.txt"
	targetFullName=$targetFileName	

	minRange=1 
	maxRange=3    
	randomNumber=0

	counterVar=0
	featureCounter=0
	fixCounter=0	
	fixCounterMax=$(( sourceFileLineCount * 15 / 100 ))
	patchCounter=0
	patchCounterMax=$(( sourceFileLineCount * 45 / 100 ))


	tagName="Tag-"
	tag_version="version-"
	tag_release="release-"	
	tag_test="test-"	
	tag_dev="dev-"
		tag_feature="feature-"
			tag_featureMajor="major-"
			tag_featureMinor="minor-"	
		tag_fix="fix-"
			tag_fixHot="HOT-"
			tag_fixCold="COLD-"
			tag_fixBug="BUG-"
			tag_patch="PATCH-"
		tag_stash="stash-"
	tagMessage="Tag Message: "
	

	taskType=0
	branchName=""
	lineRead=""
	issueName="RFC-"	

	commitRef=$counterVar
	commitIssue="RFC: $commitRef"	
	commitGoal="Goal: "
	commitTarget="Target: "
	commitAction="Action: "
	commitActionType=""
	#	commitAction options:
	#	create: add a new item
	#	read: show an item
	#	update: edit/update an item
	#	delete: remove an item
	commitAction="$commitAction $commitActionType xxx"
	commitMessage="$commitGoal - $commitTarget - $commitAction"

	stashName=$commitMessage

	targetHash="hash: "





	### Functions ###
#
#	showMessage()
#		This function aims to display a message on the screen based on its first input argument
#
#		args: 1
#		return: 0
#
showMessage()
{
	### Variables ###
		local functionName="showMessage()"

	## logic ###
		echo
		echo "starting $1 ..."
		echo
}
#
##########################################################


#
#	showStats()
#		This function aims to display the base statistics of tasks chosen
#
#		args: 0
#		return: 0
#
showStats()
{
	echo
	echo
	echo

	echo "loop Statistics:"
	echo "----------------"
	echo
	echo "featureCounter: $featureCounter"
	echo
	echo "fixCounter Max: $fixCounterMax"
	echo "fixCounter: $fixCounter"
	echo
	echo "patchCounter Max: $patchCounterMax"
	echo "patchCounter: $patchCounter"
}
#
##########################################################




#
#	showHeader()
#		This function aims to display the script header information
#
#		args: 0
#		return: 0
#
showHeader()
{
	echo
	echo
	echo "### ==================================================== ###"
	echo "				RECIPE                            "
	echo " ---------------------------------------------------------  "
	echo
	echo -e "\tWelcome to the Version Control Recipe by               "
	echo -e "\t"$authorName"                                          "
	echo -e "\t"$timeline"                                            "
	echo
	echo "### ==================================================== ###"

	echo
	echo
	echo
}
#
##########################################################



#
#	showMenu()
#		This function aims to display the script menu information
#
#		args: 0
#		return: 0
#
showMenu()
{
	echo "Choose a task type"
	echo "Bug Fix:       (1)"
	echo "New Feature:   (2)"
	echo "Feature Patch: (3)"
}
#
##########################################################




#
#	randNumGen()
#		This function aims to generate a random integer number variable between minRange and maxRange values
#
#		args: 0
#		return: randomNumber
#
randNumGen()
{
	### Variables ###
		local functionName="randNumGen()"
		local localRandomNumber=0

	## logic ### 
		# showMessage $functionName   
    	localRandomNumber=$(($RANDOM%($maxRange-$minRange+1)+$minRange))
        
	# return value
		echo ${localRandomNumber}
}
#
##########################################################


#
#	chooseTask_Auto()
#		This function aims to choose a task automatically (randomly)
#		args: 0
#		return: 0
#
chooseTask_Auto()
{
	### Variables ###
		local functionName="chooseTask_Auto()"
		local localTaskType=0

	## logic ###
		localTaskType=$(randNumGen)

	## return ###
		echo ${localTaskType}
}
#
##########################################################





#
#	runTask()
#		This function aims to process (run) a task depending on the input taskType
#
#		args: 1
#		return: 0
runTask()
{
	### Variables ###
		local functionName="runTask()"
		local localTaskType=0
		local localTaskType=""
		local locallineRead=""
		local localSourceFileName=""
		local localTargetFileName=""
		

	## logic ###
		# showMessage $functionName
		localTaskType=$1
		localBranchName=$2
		localCounterVar=$3		
		localSourceFileName=$sourceFileName
		localTargetFileName=$targetFileName

		echo
		echo "###=== Start Reading....."
		echo "	running task $localTaskType on $localBranchName"
		echo "	Reading line ($localCounterVar) from file [$localSourceFileName]"

		locallineRead=$( readLineFromFile $localSourceFileName $localCounterVar )
		
		echo "	>>>		$locallineRead"		
		echo "###=== Sop Reading....."
		echo 		
		echo "###=== Start Writing....."
		echo "	Writing line ($localCounterVar) into file [$localTargetFileName]"
		echo $locallineRead >> $localTargetFileName
		echo "###=== Sop Writing....."
		echo
		

	## return ##
	lineRead=$locallineRead
	branchName=$localBranchName
	taskType=$localTaskType	
	localCounterVar=$localCounterVar

	versionControl
}
#
##########################################################
#
#	readLineFromFile()
#		This function aims to one line from an input file at input arg 2 line number
#
#		args: 2
#		return: lineRead
#
readLineFromFile()
{
	### Variables ###
		local functionName="readLineFromFile()"
		local sourceFile="$1"
		local lineNumber=$2
		local lineCounter=0
		local lineRead=""		

	## logic ###
		# showMessage $functionName				
		lineRead=$( sed -n $lineNumber'p'  $sourceFile)

	# return value			
		echo ${lineRead}		
}
#
##########################################################



#
#	launchTask_Auto()
#		This function aims to loop through the sourceFileLineCount counter
#		and check if the (randomly) chosen taskType is
#			- (1) Fix
#				. limit the number of fixes to 15% of sourceFileLineCount
#			- (2) Feature
#			- (3) Patch
#				. limit the number of fixes to 45% of sourceFileLineCount
#
#		args: 0
#		return: 0
#
taskIterator()
{	
	### Variables ###
		local functionName="taskIterator()"
		local taskMode=0

	## logic ###
		# showMessage $functionName
		taskMode=$1

		for (( counter=1; counter<=$sourceFileLineCount; counter++  ))
		do
				echo "------------- loop ($counter / $sourceFileLineCount) ------------------------"		
				
				case $taskMode in
				1)
					taskType=$(chooseTask_Manual)
				;;
				2)
					taskType=$(chooseTask_Auto)
				;;				
				esac

				echo "You entered option: " $taskType
				echo "-------------------------------------------------------"
				echo

				case $taskType in
				1)
						if [[ $fixCounter -lt $fixCounterMax  ]]
						then							
								((fixCounter++))
								echo "fixCounter: $fixCounter"
								branchName="FixBranch"
						else
								#echo
								echo
								echo "		===== IMPORTANT ====="
								#echo "fixCounterMax: $fixCounterMax"
								#echo "fixCounter: $fixCounter"
								echo "		You have exceeded the RFC fix quota"
								echo "		NOTE: Issuing Feature RFC instead"
								echo "		===== IMPORTANT ====="
								echo
								#echo

								taskType=2	# assume taskType: feature chosen
								((featureCounter++))
								branchName="FeatureBranch"
						fi
				;;
				2)
						((featureCounter++))
						branchName="FeatureBranch"
				;;
				3)
						if [[ $patchCounter -lt $patchCounterMax  ]]
						then								
								((patchCounter++))      
								echo "patchCounter: $patchCounter"
								branchName="PatchBranch"
						else
								#echo
								echo
								echo "		===== IMPORTANT ====="
								#echo "patchCounterMax: $patchCounterMax"
								#echo "patchCounter: $patchCounter"
								echo "		You have exceeded the RFC patch quota"
								echo "		NOTE: Issuing Feature RFC instead"
								echo "		===== IMPORTANT ====="
								echo
								#echo

								taskType=2	# assume taskType: feature chosen
								((featureCounter++))
								branchName="FeatureBranch"
						fi
				;;
				esac

				runTask $taskType $branchName $counter
		done
}
#
##########################################################





#
#	versionControl()
#		This function aims to process version control commands at the local branch level
#
#		args: 1
#		return: 0
versionControl()
{
	## Variables ##
	local localCounterVar=$counterVar

	local localTagName=$tagName
	local localTag_version=$tag_version
	local localTag_release=$tag_release	
	local localTag_test=$tag_test
	local localTag_dev=$tag_dev
		local localTag_feature=$tag_feature
			local localTag_featureMajor=$tag_featureMajor
			local localTag_featureMinor=$tag_featureMinor
		local localTag_fix=$tag_fix
			local localTag_fixHot=$tag_fixHot
			local localTag_fixCold=$tag_fixCold
			local localTag_fixBug=$tag_fixBug
			local localTag_patch=$tag_patch
		local localTag_stash=$tag_stash
	local localTagMessage=$tagMessage
	

	local localTaskType=$taskType
	local localBranchName=$branchName
	local localLineRead=$lineRead
	local localIssueName=$issueName	

	local localCommitRef=$localCounterVar
	local localCommitIssue="RFC: $localCommitRef"	
	local localCommitGoal="$commitGoal xxx"
	local localCommitTarget="$commitTarget $localBranchName"
	local localCommitActionType=""
	#	commitAction options:
	#	create: add a new item
	#	read: show an item
	#	update: edit/update an item
	#	delete: remove an item
	local localCommitAction="$commitAction $localCommitActionType xxx"
	local localCommitMessage="$localCommitGoal - $localCommitTarget - $localCommitAction"

	local localStashName=$localCommitMessage

	local localTargetHash="$targetHash xxxxxxxx"



	## Logic ###
	git checkout $localBranchName
	git add .
	git commit -m "ref: $localCounterVar"
	#git commit -m "$localCommitMessage"


	## Logic ##	
		# move to target branch
		
		# stage target file
		
		# 	git stage
		# check stash
		#	git stash --list
		#	git stash show stash@{1} --patch
		# stash changes to target file
		#	git stash save "$localStashName"
		# 	git stash
		#	git stash push -m "$localStashName"
		#	git stash --include-untracked		#  stash untracked files
		#	git stash --all stash untracked 	# files and ignored files
		# To stash specific files, you can use the command git stash -p or git stash –patch
		#	Download your stashes
		#		git stash show -p > patchFile
		#		git stash show -p --binary > changes.patch		# for binary files
		#
		#	Apply your stashes
		#		cd /new/project/dir
		#		git apply /old/project/dir/patchfile
		#		git stash
		# create new branch from stash
		#	This checks out a new branch based on the commit that you created your stash from, and then pops your stashed changes onto it.
		#	git stash branch <branch_name> stash@{revision}
		#	git stash branch <branch_name> stash@{1}
		#	git stash branch branchFromStash
		# copy stash changes to stash branch (cherry-pick)
		#	git stash save "$localStashName"
		#	git checkout $localBranchName
		#	git cherry-pick $localTargetHash
		#	git stash pop
		# apply stash changes to work branch ($localBranchName)
		#	git checkout $localBranchName
		#	git stash apply stash@{1}
		# commit stash changes to work branch ($localBranchName)
		
		# tag commit on work branch ($localBranchName)
		#	create tag: 
		#		git tag -a $localTagName -m "$localTagMessage"
		#	tag commit: 
		#		git tag -a $localTagName $localTargetHash -m $localTagMessage
		# patch commit to file.patch
		# test patch on test branch
		#	IF FAIL then correct
		#	IF PASS then apply patch to patch branch (cherry-pick)
		# pass commit to dev branch (cherry-pick)	








		####################################
		#		BACKUP & RESTORE BRANCHES
		#
		# to create both incremental and full backups of a repository, 
		# and to relay the state of the references in one repository to another.
		# 
		# Bundles are .pack files with a header indicating 
		# what references are contained within the bundle.
		#
		#	git bundle create file.bundle master		# create bundle of info on master
		#	git bundle create mybundle branch1..branch2	# create bundle from tag v1.0.0 to master
		# Note that both master and origin/master could be replaced with commit refs.
		#	git bundle create mybundle --since=10.days master	# create a bundle from what happened on master in the last 10 days
		#	git bundle create mybundle -10 master	# create a bundle from the last 10 commits on master branch
		#	git bundle verify mybundle	# verify that you can create a bundle from another bundle
		#	git bundle create repo.bundle --all	# Bundle all the branches in the current repo
		#		git clone --mirror git@example.org:path/repo.git
		#		git bundle create repo.bundle --all
		#
		#		git clone repo.bundle
		# To bundle only a single branch
		#	git bundle create master.bundle HEAD master
		#	git clone master.bundle OR git fetch -u patch.bundle master:temp
		#	git switch master
		#	git merge temp
		####################################




		###################################
		# Apply Stashed Changes to an Existing Branch
		# If the branch you wish to apply stashed changes to already exists, 
		# you could use a temporary branch to help add the stashed changes to it like so:

		# git stash
		# git stash branch temp-branch

		# git add .
		# git commit

		# git checkout destination-branch
		# git merge temp-branch

		# git branch -D temp-branch
		###################################



		##################################
		# Partial stashes
		#
		# You can also choose to stash just a single file, 
		# a collection of files, or individual changes from within files. 
		# If you pass the -p option (or --patch) to git stash, 
		# it will iterate through each changed "hunk" in your working copy 
		# and ask whether you wish to stash it:
		#
		# $ git stash -p
		# diff --git a/style.css b/style.css
		# new file mode 100644
		# index 0000000..d92368b
		# --- /dev/null
		# +++ b/style.css
		# @@ -0,0 +1,3 @@
		# +* {
		# +  text-decoration: blink;
		# +}
		# Stash this hunk [y,n,q,a,d,/,e,?]? y
		# diff --git a/index.html b/index.html
		# index 9daeafb..ebdcbd2 100644
		# --- a/index.html
		# +++ b/index.html
		# @@ -1 +1,2 @@
		# +<link rel="stylesheet" href="style.css"/>
		# Stash this hunk [y,n,q,a,d,/,e,?]? n
		##################################
}
#
##########################################################






### Logic ###
clear

showHeader

showMenu

showMessage 


taskMode=2
taskIterator $taskMode

showStats




