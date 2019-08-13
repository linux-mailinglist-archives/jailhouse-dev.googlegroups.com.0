Return-Path: <jailhouse-dev+bncBDW25KHBUIPBBJFMZLVAKGQEH4LESKI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33d.google.com (mail-ot1-x33d.google.com [IPv6:2607:f8b0:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDB48B5EA
	for <lists+jailhouse-dev@lfdr.de>; Tue, 13 Aug 2019 12:51:18 +0200 (CEST)
Received: by mail-ot1-x33d.google.com with SMTP id x5sf90118241otb.4
        for <lists+jailhouse-dev@lfdr.de>; Tue, 13 Aug 2019 03:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=14lZAdsnjcvqmBJ1g9TyE0YijzdMYKQH/TRTn7BoWtQ=;
        b=g4bdbzuvsvrjHB/C64isZUqWPmPyycdiuqyYEOsUGxW0EoJTRxf+X9HG+ZElr88jnp
         zVfKVf8p++UdmNMis6jY8az8uwbR6VfmsEAOHLjgKO5Z1M2j9JIo8CrLVHw4D3DJl4Tc
         z7Mvq60+zzRMuPsHL770NpusIibmh8a03m1kPHLdIMBd+KLAITgBxo4sdkid6SPHyyw4
         ipYNtU1SC8c38F5mXoWWeJNRe83OMGNNEhMH4JVH/y3ppODMaRPUc24wakgth+OvFZb1
         vVW5d8dxOGExL9rWdU0fi9PzmbX4LBvp8uqgyYekjAw3efAkzv9XojxNJRI7jQG2TiUm
         lCVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=14lZAdsnjcvqmBJ1g9TyE0YijzdMYKQH/TRTn7BoWtQ=;
        b=KpsaFkTjRd8na1kloNqnxRwbKyhzQ9IBnTRetYEUZdkkqTWhDlS4R6XK6fsEGAz3kW
         ZP6Eh/2avvqIhIULVOVha3ZkG71QqpJdYzKWVsBiXBulykE+Kx4I+hL8RF67yzwoIWDJ
         AqrfKj/kZoIaxN+TUpVDuwMgVM00rXCXQWWeBadLLAjDEx/hwSG3nm17KBQNZuftvoj3
         pE9rumtrpd+VQGO3DO+DELmy1gP+ZRRVvVJfPJ47W+KHCmXOEuQuHSlBJL1joDYKL+1a
         Kg2RHqoEBrnhaQaeQZXSfCjp9wo4eYWLPVDzucqwbpfLnPhuRCT/87S3wIiVgNHrWhx4
         apGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=14lZAdsnjcvqmBJ1g9TyE0YijzdMYKQH/TRTn7BoWtQ=;
        b=P40qOAceE3F6I6Jt7HEUtbZueSE6LfaEjgIPdCcG2Uagj2Phh5bsGISTwMuJnmOH3L
         66efSTkg02Z5IcRw7ONiOrsE9Gxpn0wrtjDpeF0smzUyavb+51fuuQ4Hx78+YPUC2L7Q
         FVg/4i0QK096U80cXghXiHnQhXLcuBQgh26PiPgU9TLXuWIUWbPIfF7FAYGsHSCcX3+L
         HFBJXv3iW6wzRRL8obo2iPReE1MYOFC9Qq5qGX7O+wma7fnZSsXsRb0TOrd9pvFg40xA
         03H1Q+MTnt67FPFgcoCPjV2LKBIW6eYZwBUxNCHhjbvJwTUp3q0kRyr9j3CxQ+M3f31y
         GtmQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXUHbmz8N/Q1PMC/c+rwmD5iUGo/hSar+nV2odEGwrrvu0+Dsyq
	pSuwrafrweE7Vs87apS+2jc=
X-Google-Smtp-Source: APXvYqwiviLcCnj2l642EjCFwjOktb6T4nH0kpU6AR+1HFBcsZV3BTcJptMCWjfdBdOy8clG7UmG0g==
X-Received: by 2002:a05:6830:1303:: with SMTP id p3mr34891264otq.267.1565693476910;
        Tue, 13 Aug 2019 03:51:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:3f62:: with SMTP id m89ls1775067otc.1.gmail; Tue, 13 Aug
 2019 03:51:16 -0700 (PDT)
X-Received: by 2002:a05:6830:2055:: with SMTP id f21mr16893849otp.53.1565693475495;
        Tue, 13 Aug 2019 03:51:15 -0700 (PDT)
Date: Tue, 13 Aug 2019 03:51:14 -0700 (PDT)
From: =?UTF-8?Q?Cevat_Bostanc=C4=B1o=C4=9Flu?= <cevat0714@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <faf52b76-b1a1-4110-815a-32d778a97ba6@googlegroups.com>
Subject: Orange Pi Zero Jailhouse Yocto Integration
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2682_1808739877.1565693474800"
X-Original-Sender: cevat0714@gmail.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

------=_Part_2682_1808739877.1565693474800
Content-Type: multipart/alternative; 
	boundary="----=_Part_2683_1430512410.1565693474802"

------=_Part_2683_1430512410.1565693474802
Content-Type: text/plain; charset="UTF-8"

Hello, 
I am trying to learn/play embedded virtualization tools and i saw Isar 
Integrated jailhouse-image repo, tested orange pi zero(256mb) image and 
everything is fine. 
I am trying to integrate latest jailhouse(0.11) into yocto project and i 
saw https://bitbucket.org/retotech/meta-jailhouse/src/master/ , which is 
for banana pi with jailhouse_0.8.

Anyway, I ported jailhouse-images and meta-jailhouse 
together(meta-orangepi, 
https://github.com/cevatbostancioglu/meta-orangepi/tree/dev) and trying to 
compile for orange pi zero(256mb) but I saw many errors while building. can 
you guys can guess what is the problem?

my status:
i am trying to build exact image with jailhouse-images so i patched u-boot 
& kernel, now i am trying to compile/install jailhouse.

You can see build error as follows,
also attached log outputs too.

My repo:
https://github.com/cevatbostancioglu/meta-orangepi/tree/dev

Thanks

Cevat

$ bitbake  jailhouse
WARNING: Layer meta-orangepi should set LAYERSERIES_COMPAT_meta-orangepi in 
its conf/layer.conf file to list the core layer names it is compatible with.
WARNING: Layer meta-orangepi should set LAYERSERIES_COMPAT_meta-orangepi in 
its conf/layer.conf file to list the core layer names it is compatible with.
Loading cache: 100% 
|###################################################################################################################################################################################################| 
Time: 0:00:01
Loaded 3309 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.43.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "ubuntu-16.04"
TARGET_SYS           = "arm-oe-linux-gnueabi"
MACHINE              = "orange-pi-zero"
DISTRO               = "orangepi"
DISTRO_VERSION       = "nodistro.0"
TUNE_FEATURES        = "arm vfp cortexa7 neon vfpv4 callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            = "HEAD:9983b07fffd19082abded7c3f15cc77d306dd69c"
meta-filesystems     
meta-oe              
meta-python          
meta-networking      = "HEAD:4e0538516b1e0ef42dc79bd08f7895f0052063ac"
meta-orangepi        = "dev:377e6533d05ef16dcbeac849f515a7a0b6a26110"

Initialising tasks: 100% 
|##############################################################################################################################################################################################| 
Time: 0:00:00
Sstate summary: Wanted 6 Found 0 Missed 6 Current 195 (0% match, 97% 
complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
WARNING: jailhouse-0.11-r0 do_populate_lic: jailhouse: No generic license 
file exists for: BSD-2-clause in any provider
ERROR: jailhouse-0.11-r0 do_compile: oe_runmake failed
ERROR: jailhouse-0.11-r0 do_compile: Execution of 
'/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/temp/run.do_compile.14598' 
failed with exit code 1:
  UPD     
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/include/generated/
config.mk
  CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../alloc.o
  CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../cmdline.o
  UPD     
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/include/generated/version.h
  CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../printk.o
  CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-gic-demo.o
  CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../setup.o
  CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-linux-demo.o
  CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-uart-demo.o
  CC [M] 
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/cell.o
  CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../string.o
  CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi.o
/tmp/ccWTZUPO.s: Assembler messages:
/tmp/ccWTZUPO.s:73: Error: selected processor does not support `cpsid if' 
in ARM mode
/tmp/ccWTZUPO.s:87: Error: selected processor does not support `wfi' in ARM 
mode
make[6]: *** 
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303: 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../setup.o] 
Error 1
make[6]: *** Waiting for unfinished jobs....
  CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../uart-8250.o
  CC [M] 
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/main.o
  CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/arch/arm/asm-defines.s
  CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-linux-demo.o
  LDS     
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/hypervisor.lds
  CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-uart-demo.o
  CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e.o
  CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h-linux-demo.o
  CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/setup.o
  CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h-uart-demo.o
  CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h.o
/tmp/ccreteLO.s: Assembler messages:
/tmp/ccreteLO.s:186: Error: architectural extension `virt' is not allowed 
for the current base architecture
/tmp/ccreteLO.s:187: Error: selected processor does not support `hvc 
#0x4a48' in ARM mode
  CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/printk.o
make[6]: *** 
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303: 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../printk.o] 
Error 1
make[5]: *** 
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:544: 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm] 
Error 2
make[4]: *** 
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:544: 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates] 
Error 2
make[4]: *** Waiting for unfinished jobs....
  CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m-linux-demo.o
  CC [M] 
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/sysfs.o
  CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/paging.o
/tmp/ccdwkr9Y.s: Assembler messages:
/tmp/ccdwkr9Y.s:16: Error: architectural extension `virt' is not allowed 
for the current base architecture
/tmp/ccdwkr9Y.s:42: Error: architectural extension `mp' is not allowed for 
the current base architecture
/tmp/ccdwkr9Y.s:43: Error: selected processor does not support `pldw [r2]' 
in ARM mode
/tmp/ccdwkr9Y.s:45: Error: selected processor does not support `ldrex 
r1,[r2]' in ARM mode
/tmp/ccdwkr9Y.s:47: Error: selected processor does not support `strex 
r0,r3,[r2]' in ARM mode
/tmp/ccdwkr9Y.s:70: Error: selected processor does not support `dmb ish' in 
ARM mode
/tmp/ccdwkr9Y.s:82: Error: selected processor does not support `wfe' in ARM 
mode
/tmp/ccdwkr9Y.s:179: Error: selected processor does not support `dmb ish' 
in ARM mode
/tmp/ccdwkr9Y.s:200: Error: selected processor does not support `dmb ish' 
in ARM mode
/tmp/ccdwkr9Y.s:212: Error: selected processor does not support `dsb ishst' 
in ARM mode
/tmp/ccdwkr9Y.s:216: Error: selected processor does not support `sev' in 
ARM mode
/tmp/ccdwkr9Y.s:598: Error: selected processor does not support `dmb ish' 
in ARM mode
/tmp/ccdwkr9Y.s:623: Error: selected processor does not support `dmb ish' 
in ARM mode
/tmp/ccdwkr9Y.s:635: Error: selected processor does not support `dsb ishst' 
in ARM mode
/tmp/ccdwkr9Y.s:639: Error: selected processor does not support `sev' in 
ARM mode
/tmp/ccdwkr9Y.s:966: Error: selected processor does not support `dmb ish' 
in ARM mode
  CC [M] 
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/pci.o
make[5]: *** 
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303: 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/setup.o] 
Error 1
make[5]: *** Waiting for unfinished jobs....
  CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m-uart-demo.o
  DTC     
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/vpci_template.dtb
/tmp/ccITUo2X.s: Assembler messages:
/tmp/ccITUo2X.s:16: Error: architectural extension `virt' is not allowed 
for the current base architecture
/tmp/ccITUo2X.s:165: Error: selected processor does not support `dmb ish' 
in ARM mode
/tmp/ccITUo2X.s:229: Error: selected processor does not support `dmb ish' 
in ARM mode
/tmp/ccITUo2X.s:1324: Error: architectural extension `mp' is not allowed 
for the current base architecture
/tmp/ccITUo2X.s:1325: Error: selected processor does not support `pldw 
[r2]' in ARM mode
/tmp/ccITUo2X.s:1327: Error: selected processor does not support `ldrex 
r1,[r2]' in ARM mode
/tmp/ccITUo2X.s:1329: Error: selected processor does not support `strex 
r0,r3,[r2]' in ARM mode
/tmp/ccITUo2X.s:1352: Error: selected processor does not support `dmb ish' 
in ARM mode
/tmp/ccITUo2X.s:1373: Error: selected processor does not support `dmb ish' 
in ARM mode
/tmp/ccITUo2X.s:1386: Error: selected processor does not support `dsb 
ishst' in ARM mode
/tmp/ccITUo2X.s:1390: Error: selected processor does not support `sev' in 
ARM mode
/tmp/ccITUo2X.s:1420: Error: selected processor does not support `wfe' in 
ARM mode
/tmp/ccITUo2X.s:1485: Error: architectural extension `mp' is not allowed 
for the current base architecture
/tmp/ccITUo2X.s:1486: Error: selected processor does not support `pldw 
[r3]' in ARM mode
/tmp/ccITUo2X.s:1499: Error: selected processor does not support `ldrex 
lr,[r3]' in ARM mode
/tmp/ccITUo2X.s:1503: Error: selected processor does not support `strex 
ip,lr,[r3]' in ARM mode
make[5]: *** 
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303: 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/printk.o] 
Error 1
  CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m.o
  CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-demo.o
  CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-linux-demo.o
  CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1.o
/tmp/ccr5KeF1.s: Assembler messages:
/tmp/ccr5KeF1.s:16: Error: architectural extension `virt' is not allowed 
for the current base architecture
/tmp/ccr5KeF1.s:132: Error: selected processor does not support `rbit 
r3,r3' in ARM mode
/tmp/ccr5KeF1.s:305: Error: architectural extension `mp' is not allowed for 
the current base architecture
/tmp/ccr5KeF1.s:306: Error: selected processor does not support `pldw [r3]' 
in ARM mode
/tmp/ccr5KeF1.s:323: Error: selected processor does not support `ldrex 
ip,[r3]' in ARM mode
/tmp/ccr5KeF1.s:325: Error: selected processor does not support `strex 
r0,ip,[r3]' in ARM mode
/tmp/ccr5KeF1.s:431: Error: selected processor does not support `dsb ' in 
ARM mode
/tmp/ccr5KeF1.s:447: Error: selected processor does not support `dsb ' in 
ARM mode
/tmp/ccr5KeF1.s:451: Error: selected processor does not support `isb' in 
ARM mode
/tmp/ccr5KeF1.s:661: Error: architectural extension `mp' is not allowed for 
the current base architecture
/tmp/ccr5KeF1.s:662: Error: selected processor does not support `pldw [r2]' 
in ARM mode
/tmp/ccr5KeF1.s:682: Error: selected processor does not support `ldrex 
r0,[r2]' in ARM mode
/tmp/ccr5KeF1.s:684: Error: selected processor does not support `strex 
r1,r0,[r2]' in ARM mode
/tmp/ccr5KeF1.s:2634: Error: architectural extension `mp' is not allowed 
for the current base architecture
/tmp/ccr5KeF1.s:2635: Error: selected processor does not support `pldw 
[r3]' in ARM mode
/tmp/ccr5KeF1.s:2652: Error: selected processor does not support `ldrex 
lr,[r3]' in ARM mode
/tmp/ccr5KeF1.s:2654: Error: selected processor does not support `strex 
ip,lr,[r3]' in ARM mode
make[5]: *** 
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303: 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/paging.o] 
Error 1
make[4]: *** 
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:544: 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor] 
Error 2
  DTB     
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/vpci_template.dtb.S
  CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0-gic-demo.o
  AS [M] 
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/vpci_template.dtb.o
  CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0-linux-demo.o
  CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0.o
  DTC     
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-bananapi.dtb
  DTC     
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-emtrion-emconrzg1e.dtb
  DTC     
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-emtrion-emconrzg1h.dtb
  DTC     
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-emtrion-emconrzg1m.dtb
  DTC     
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-jetson-tk1.dtb
  DTC     
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-orangepi0.dtb
  OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-gic-demo.cell
  OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-linux-demo.cell
  OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-uart-demo.cell
  OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi.cell
  OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-uart-demo.cell
  OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-linux-demo.cell
  OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e.cell
  OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h-linux-demo.cell
  OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h-uart-demo.cell
  OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h.cell
  OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m-linux-demo.cell
  OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m-uart-demo.cell
  OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m.cell
  OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-demo.cell
  OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-linux-demo.cell
  OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1.cell
  OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0-gic-demo.cell
  OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0-linux-demo.cell
  OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0.cell
  LD [M] 
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/jailhouse.o
make[3]: *** 
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/Makefile:1518: 
_module_/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git] 
Error 2
make[2]: *** [Makefile:146: sub-make] Error 2
make[1]: *** [Makefile:24: __sub-make] Error 2
make: *** [Makefile:40: modules] Error 2
WARNING: exit code 1 from a shell command.

ERROR: Logfile of failure stored in: 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/temp/log.do_compile.14598
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 8 
KERNEL_SRC=/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source 
V=0 CROSS_COMPILE=arm-oe-linux-gnueabi- 
KDIR=/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-build-artifacts
|   UPD     
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/include/generated/
config.mk
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../alloc.o
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../cmdline.o
|   UPD     
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/include/generated/version.h
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../printk.o
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-gic-demo.o
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../setup.o
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-linux-demo.o
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-uart-demo.o
|   CC [M] 
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/cell.o
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../string.o
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi.o
| /tmp/ccWTZUPO.s: Assembler messages:
| /tmp/ccWTZUPO.s:73: Error: selected processor does not support `cpsid if' 
in ARM mode
| /tmp/ccWTZUPO.s:87: Error: selected processor does not support `wfi' in 
ARM mode
| make[6]: *** 
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303: 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../setup.o] 
Error 1
| make[6]: *** Waiting for unfinished jobs....
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../uart-8250.o
|   CC [M] 
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/main.o
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/arch/arm/asm-defines.s
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-linux-demo.o
|   LDS     
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/hypervisor.lds
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-uart-demo.o
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e.o
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h-linux-demo.o
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/setup.o
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h-uart-demo.o
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h.o
| /tmp/ccreteLO.s: Assembler messages:
| /tmp/ccreteLO.s:186: Error: architectural extension `virt' is not allowed 
for the current base architecture
| /tmp/ccreteLO.s:187: Error: selected processor does not support `hvc 
#0x4a48' in ARM mode
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/printk.o
| make[6]: *** 
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303: 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../printk.o] 
Error 1
| make[5]: *** 
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:544: 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm] 
Error 2
| make[4]: *** 
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:544: 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates] 
Error 2
| make[4]: *** Waiting for unfinished jobs....
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m-linux-demo.o
|   CC [M] 
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/sysfs.o
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/paging.o
| /tmp/ccdwkr9Y.s: Assembler messages:
| /tmp/ccdwkr9Y.s:16: Error: architectural extension `virt' is not allowed 
for the current base architecture
| /tmp/ccdwkr9Y.s:42: Error: architectural extension `mp' is not allowed 
for the current base architecture
| /tmp/ccdwkr9Y.s:43: Error: selected processor does not support `pldw 
[r2]' in ARM mode
| /tmp/ccdwkr9Y.s:45: Error: selected processor does not support `ldrex 
r1,[r2]' in ARM mode
| /tmp/ccdwkr9Y.s:47: Error: selected processor does not support `strex 
r0,r3,[r2]' in ARM mode
| /tmp/ccdwkr9Y.s:70: Error: selected processor does not support `dmb ish' 
in ARM mode
| /tmp/ccdwkr9Y.s:82: Error: selected processor does not support `wfe' in 
ARM mode
| /tmp/ccdwkr9Y.s:179: Error: selected processor does not support `dmb ish' 
in ARM mode
| /tmp/ccdwkr9Y.s:200: Error: selected processor does not support `dmb ish' 
in ARM mode
| /tmp/ccdwkr9Y.s:212: Error: selected processor does not support `dsb 
ishst' in ARM mode
| /tmp/ccdwkr9Y.s:216: Error: selected processor does not support `sev' in 
ARM mode
| /tmp/ccdwkr9Y.s:598: Error: selected processor does not support `dmb ish' 
in ARM mode
| /tmp/ccdwkr9Y.s:623: Error: selected processor does not support `dmb ish' 
in ARM mode
| /tmp/ccdwkr9Y.s:635: Error: selected processor does not support `dsb 
ishst' in ARM mode
| /tmp/ccdwkr9Y.s:639: Error: selected processor does not support `sev' in 
ARM mode
| /tmp/ccdwkr9Y.s:966: Error: selected processor does not support `dmb ish' 
in ARM mode
|   CC [M] 
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/pci.o
| make[5]: *** 
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303: 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/setup.o] 
Error 1
| make[5]: *** Waiting for unfinished jobs....
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m-uart-demo.o
|   DTC     
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/vpci_template.dtb
| /tmp/ccITUo2X.s: Assembler messages:
| /tmp/ccITUo2X.s:16: Error: architectural extension `virt' is not allowed 
for the current base architecture
| /tmp/ccITUo2X.s:165: Error: selected processor does not support `dmb ish' 
in ARM mode
| /tmp/ccITUo2X.s:229: Error: selected processor does not support `dmb ish' 
in ARM mode
| /tmp/ccITUo2X.s:1324: Error: architectural extension `mp' is not allowed 
for the current base architecture
| /tmp/ccITUo2X.s:1325: Error: selected processor does not support `pldw 
[r2]' in ARM mode
| /tmp/ccITUo2X.s:1327: Error: selected processor does not support `ldrex 
r1,[r2]' in ARM mode
| /tmp/ccITUo2X.s:1329: Error: selected processor does not support `strex 
r0,r3,[r2]' in ARM mode
| /tmp/ccITUo2X.s:1352: Error: selected processor does not support `dmb 
ish' in ARM mode
| /tmp/ccITUo2X.s:1373: Error: selected processor does not support `dmb 
ish' in ARM mode
| /tmp/ccITUo2X.s:1386: Error: selected processor does not support `dsb 
ishst' in ARM mode
| /tmp/ccITUo2X.s:1390: Error: selected processor does not support `sev' in 
ARM mode
| /tmp/ccITUo2X.s:1420: Error: selected processor does not support `wfe' in 
ARM mode
| /tmp/ccITUo2X.s:1485: Error: architectural extension `mp' is not allowed 
for the current base architecture
| /tmp/ccITUo2X.s:1486: Error: selected processor does not support `pldw 
[r3]' in ARM mode
| /tmp/ccITUo2X.s:1499: Error: selected processor does not support `ldrex 
lr,[r3]' in ARM mode
| /tmp/ccITUo2X.s:1503: Error: selected processor does not support `strex 
ip,lr,[r3]' in ARM mode
| make[5]: *** 
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303: 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/printk.o] 
Error 1
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m.o
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-demo.o
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-linux-demo.o
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1.o
| /tmp/ccr5KeF1.s: Assembler messages:
| /tmp/ccr5KeF1.s:16: Error: architectural extension `virt' is not allowed 
for the current base architecture
| /tmp/ccr5KeF1.s:132: Error: selected processor does not support `rbit 
r3,r3' in ARM mode
| /tmp/ccr5KeF1.s:305: Error: architectural extension `mp' is not allowed 
for the current base architecture
| /tmp/ccr5KeF1.s:306: Error: selected processor does not support `pldw 
[r3]' in ARM mode
| /tmp/ccr5KeF1.s:323: Error: selected processor does not support `ldrex 
ip,[r3]' in ARM mode
| /tmp/ccr5KeF1.s:325: Error: selected processor does not support `strex 
r0,ip,[r3]' in ARM mode
| /tmp/ccr5KeF1.s:431: Error: selected processor does not support `dsb ' in 
ARM mode
| /tmp/ccr5KeF1.s:447: Error: selected processor does not support `dsb ' in 
ARM mode
| /tmp/ccr5KeF1.s:451: Error: selected processor does not support `isb' in 
ARM mode
| /tmp/ccr5KeF1.s:661: Error: architectural extension `mp' is not allowed 
for the current base architecture
| /tmp/ccr5KeF1.s:662: Error: selected processor does not support `pldw 
[r2]' in ARM mode
| /tmp/ccr5KeF1.s:682: Error: selected processor does not support `ldrex 
r0,[r2]' in ARM mode
| /tmp/ccr5KeF1.s:684: Error: selected processor does not support `strex 
r1,r0,[r2]' in ARM mode
| /tmp/ccr5KeF1.s:2634: Error: architectural extension `mp' is not allowed 
for the current base architecture
| /tmp/ccr5KeF1.s:2635: Error: selected processor does not support `pldw 
[r3]' in ARM mode
| /tmp/ccr5KeF1.s:2652: Error: selected processor does not support `ldrex 
lr,[r3]' in ARM mode
| /tmp/ccr5KeF1.s:2654: Error: selected processor does not support `strex 
ip,lr,[r3]' in ARM mode
| make[5]: *** 
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303: 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/paging.o] 
Error 1
| make[4]: *** 
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:544: 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor] 
Error 2
|   DTB     
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/vpci_template.dtb.S
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0-gic-demo.o
|   AS [M] 
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/vpci_template.dtb.o
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0-linux-demo.o
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0.o
|   DTC     
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-bananapi.dtb
|   DTC     
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-emtrion-emconrzg1e.dtb
|   DTC     
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-emtrion-emconrzg1h.dtb
|   DTC     
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-emtrion-emconrzg1m.dtb
|   DTC     
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-jetson-tk1.dtb
|   DTC     
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-orangepi0.dtb
|   OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-gic-demo.cell
|   OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-linux-demo.cell
|   OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-uart-demo.cell
|   OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi.cell
|   OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-uart-demo.cell
|   OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-linux-demo.cell
|   OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e.cell
|   OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h-linux-demo.cell
|   OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h-uart-demo.cell
|   OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h.cell
|   OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m-linux-demo.cell
|   OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m-uart-demo.cell
|   OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m.cell
|   OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-demo.cell
|   OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-linux-demo.cell
|   OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1.cell
|   OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0-gic-demo.cell
|   OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0-linux-demo.cell
|   OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0.cell
|   LD [M] 
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/jailhouse.o
| make[3]: *** 
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/Makefile:1518: 
_module_/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git] 
Error 2
| make[2]: *** [Makefile:146: sub-make] Error 2
| make[1]: *** [Makefile:24: __sub-make] Error 2
| make: *** [Makefile:40: modules] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Execution of 
'/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/temp/run.do_compile.14598' 
failed with exit code 1:
|   UPD     
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/include/generated/
config.mk
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../alloc.o
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../cmdline.o
|   UPD     
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/include/generated/version.h
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../printk.o
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-gic-demo.o
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../setup.o
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-linux-demo.o
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-uart-demo.o
|   CC [M] 
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/cell.o
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../string.o
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi.o
| /tmp/ccWTZUPO.s: Assembler messages:
| /tmp/ccWTZUPO.s:73: Error: selected processor does not support `cpsid if' 
in ARM mode
| /tmp/ccWTZUPO.s:87: Error: selected processor does not support `wfi' in 
ARM mode
| make[6]: *** 
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303: 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../setup.o] 
Error 1
| make[6]: *** Waiting for unfinished jobs....
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../uart-8250.o
|   CC [M] 
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/main.o
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/arch/arm/asm-defines.s
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-linux-demo.o
|   LDS     
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/hypervisor.lds
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-uart-demo.o
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e.o
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h-linux-demo.o
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/setup.o
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h-uart-demo.o
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h.o
| /tmp/ccreteLO.s: Assembler messages:
| /tmp/ccreteLO.s:186: Error: architectural extension `virt' is not allowed 
for the current base architecture
| /tmp/ccreteLO.s:187: Error: selected processor does not support `hvc 
#0x4a48' in ARM mode
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/printk.o
| make[6]: *** 
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303: 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../printk.o] 
Error 1
| make[5]: *** 
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:544: 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm] 
Error 2
| make[4]: *** 
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:544: 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates] 
Error 2
| make[4]: *** Waiting for unfinished jobs....
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m-linux-demo.o
|   CC [M] 
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/sysfs.o
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/paging.o
| /tmp/ccdwkr9Y.s: Assembler messages:
| /tmp/ccdwkr9Y.s:16: Error: architectural extension `virt' is not allowed 
for the current base architecture
| /tmp/ccdwkr9Y.s:42: Error: architectural extension `mp' is not allowed 
for the current base architecture
| /tmp/ccdwkr9Y.s:43: Error: selected processor does not support `pldw 
[r2]' in ARM mode
| /tmp/ccdwkr9Y.s:45: Error: selected processor does not support `ldrex 
r1,[r2]' in ARM mode
| /tmp/ccdwkr9Y.s:47: Error: selected processor does not support `strex 
r0,r3,[r2]' in ARM mode
| /tmp/ccdwkr9Y.s:70: Error: selected processor does not support `dmb ish' 
in ARM mode
| /tmp/ccdwkr9Y.s:82: Error: selected processor does not support `wfe' in 
ARM mode
| /tmp/ccdwkr9Y.s:179: Error: selected processor does not support `dmb ish' 
in ARM mode
| /tmp/ccdwkr9Y.s:200: Error: selected processor does not support `dmb ish' 
in ARM mode
| /tmp/ccdwkr9Y.s:212: Error: selected processor does not support `dsb 
ishst' in ARM mode
| /tmp/ccdwkr9Y.s:216: Error: selected processor does not support `sev' in 
ARM mode
| /tmp/ccdwkr9Y.s:598: Error: selected processor does not support `dmb ish' 
in ARM mode
| /tmp/ccdwkr9Y.s:623: Error: selected processor does not support `dmb ish' 
in ARM mode
| /tmp/ccdwkr9Y.s:635: Error: selected processor does not support `dsb 
ishst' in ARM mode
| /tmp/ccdwkr9Y.s:639: Error: selected processor does not support `sev' in 
ARM mode
| /tmp/ccdwkr9Y.s:966: Error: selected processor does not support `dmb ish' 
in ARM mode
|   CC [M] 
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/pci.o
| make[5]: *** 
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303: 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/setup.o] 
Error 1
| make[5]: *** Waiting for unfinished jobs....
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m-uart-demo.o
|   DTC     
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/vpci_template.dtb
| /tmp/ccITUo2X.s: Assembler messages:
| /tmp/ccITUo2X.s:16: Error: architectural extension `virt' is not allowed 
for the current base architecture
| /tmp/ccITUo2X.s:165: Error: selected processor does not support `dmb ish' 
in ARM mode
| /tmp/ccITUo2X.s:229: Error: selected processor does not support `dmb ish' 
in ARM mode
| /tmp/ccITUo2X.s:1324: Error: architectural extension `mp' is not allowed 
for the current base architecture
| /tmp/ccITUo2X.s:1325: Error: selected processor does not support `pldw 
[r2]' in ARM mode
| /tmp/ccITUo2X.s:1327: Error: selected processor does not support `ldrex 
r1,[r2]' in ARM mode
| /tmp/ccITUo2X.s:1329: Error: selected processor does not support `strex 
r0,r3,[r2]' in ARM mode
| /tmp/ccITUo2X.s:1352: Error: selected processor does not support `dmb 
ish' in ARM mode
| /tmp/ccITUo2X.s:1373: Error: selected processor does not support `dmb 
ish' in ARM mode
| /tmp/ccITUo2X.s:1386: Error: selected processor does not support `dsb 
ishst' in ARM mode
| /tmp/ccITUo2X.s:1390: Error: selected processor does not support `sev' in 
ARM mode
| /tmp/ccITUo2X.s:1420: Error: selected processor does not support `wfe' in 
ARM mode
| /tmp/ccITUo2X.s:1485: Error: architectural extension `mp' is not allowed 
for the current base architecture
| /tmp/ccITUo2X.s:1486: Error: selected processor does not support `pldw 
[r3]' in ARM mode
| /tmp/ccITUo2X.s:1499: Error: selected processor does not support `ldrex 
lr,[r3]' in ARM mode
| /tmp/ccITUo2X.s:1503: Error: selected processor does not support `strex 
ip,lr,[r3]' in ARM mode
| make[5]: *** 
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303: 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/printk.o] 
Error 1
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m.o
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-demo.o
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-linux-demo.o
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1.o
| /tmp/ccr5KeF1.s: Assembler messages:
| /tmp/ccr5KeF1.s:16: Error: architectural extension `virt' is not allowed 
for the current base architecture
| /tmp/ccr5KeF1.s:132: Error: selected processor does not support `rbit 
r3,r3' in ARM mode
| /tmp/ccr5KeF1.s:305: Error: architectural extension `mp' is not allowed 
for the current base architecture
| /tmp/ccr5KeF1.s:306: Error: selected processor does not support `pldw 
[r3]' in ARM mode
| /tmp/ccr5KeF1.s:323: Error: selected processor does not support `ldrex 
ip,[r3]' in ARM mode
| /tmp/ccr5KeF1.s:325: Error: selected processor does not support `strex 
r0,ip,[r3]' in ARM mode
| /tmp/ccr5KeF1.s:431: Error: selected processor does not support `dsb ' in 
ARM mode
| /tmp/ccr5KeF1.s:447: Error: selected processor does not support `dsb ' in 
ARM mode
| /tmp/ccr5KeF1.s:451: Error: selected processor does not support `isb' in 
ARM mode
| /tmp/ccr5KeF1.s:661: Error: architectural extension `mp' is not allowed 
for the current base architecture
| /tmp/ccr5KeF1.s:662: Error: selected processor does not support `pldw 
[r2]' in ARM mode
| /tmp/ccr5KeF1.s:682: Error: selected processor does not support `ldrex 
r0,[r2]' in ARM mode
| /tmp/ccr5KeF1.s:684: Error: selected processor does not support `strex 
r1,r0,[r2]' in ARM mode
| /tmp/ccr5KeF1.s:2634: Error: architectural extension `mp' is not allowed 
for the current base architecture
| /tmp/ccr5KeF1.s:2635: Error: selected processor does not support `pldw 
[r3]' in ARM mode
| /tmp/ccr5KeF1.s:2652: Error: selected processor does not support `ldrex 
lr,[r3]' in ARM mode
| /tmp/ccr5KeF1.s:2654: Error: selected processor does not support `strex 
ip,lr,[r3]' in ARM mode
| make[5]: *** 
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303: 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/paging.o] 
Error 1
| make[4]: *** 
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:544: 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor] 
Error 2
|   DTB     
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/vpci_template.dtb.S
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0-gic-demo.o
|   AS [M] 
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/vpci_template.dtb.o
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0-linux-demo.o
|   CC     
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0.o
|   DTC     
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-bananapi.dtb
|   DTC     
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-emtrion-emconrzg1e.dtb
|   DTC     
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-emtrion-emconrzg1h.dtb
|   DTC     
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-emtrion-emconrzg1m.dtb
|   DTC     
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-jetson-tk1.dtb
|   DTC     
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-orangepi0.dtb
|   OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-gic-demo.cell
|   OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-linux-demo.cell
|   OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-uart-demo.cell
|   OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi.cell
|   OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-uart-demo.cell
|   OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-linux-demo.cell
|   OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e.cell
|   OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h-linux-demo.cell
|   OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h-uart-demo.cell
|   OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h.cell
|   OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m-linux-demo.cell
|   OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m-uart-demo.cell
|   OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m.cell
|   OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-demo.cell
|   OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-linux-demo.cell
|   OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1.cell
|   OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0-gic-demo.cell
|   OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0-linux-demo.cell
|   OBJCOPY 
/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0.cell
|   LD [M] 
 /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/jailhouse.o
| make[3]: *** 
[/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/Makefile:1518: 
_module_/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git] 
Error 2
| make[2]: *** [Makefile:146: sub-make] Error 2
| make[1]: *** [Makefile:24: __sub-make] Error 2
| make: *** [Makefile:40: modules] Error 2
| WARNING: exit code 1 from a shell command.
| 
ERROR: Task 
(/home/cevat/Desktop/meta-orangepi/yocto/meta-orangepi/recipes-jailhouse/jailhouse/jailhouse_0.11.bb:do_compile) 
failed with exit code '1'
NOTE: Tasks Summary: Attempted 908 tasks of which 901 didn't need to be 
rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 0 seconds

Summary: 1 task failed:
  
/home/cevat/Desktop/meta-orangepi/yocto/meta-orangepi/recipes-jailhouse/jailhouse/jailhouse_0.11.bb:do_compile
Summary: There were 3 WARNING messages shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
cevat@cevat-MS-7970:~/Desktop/meta-orangepi/yocto/build_arm$

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/faf52b76-b1a1-4110-815a-32d778a97ba6%40googlegroups.com.

------=_Part_2683_1430512410.1565693474802
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-size: small;">Hello,=C2=A0</span><br s=
tyle=3D"font-size: small;"><span style=3D"font-size: small;">I am trying to=
 learn/play embedded virtualization tools and i saw Isar Integrated jailhou=
se-image repo, tested orange pi zero(256mb) image and everything is fine.=
=C2=A0</span><div style=3D"font-size: small;">I am trying to integrate late=
st jailhouse(0.11) into yocto project and i saw=C2=A0<a href=3D"https://bit=
bucket.org/retotech/meta-jailhouse/src/master/" target=3D"_blank" data-safe=
redirecturl=3D"https://www.google.com/url?q=3Dhttps://bitbucket.org/retotec=
h/meta-jailhouse/src/master/&amp;source=3Dgmail&amp;ust=3D1565779280137000&=
amp;usg=3DAFQjCNFpEbGSnLFNpzONaJ-LD3x_HfLj2Q" style=3D"color: rgb(17, 85, 2=
04);">https://bitbucket.org/<wbr>retotech/meta-jailhouse/src/<wbr>master/</=
a>=C2=A0, which is for banana pi with jailhouse_0.8.</div><div style=3D"fon=
t-size: small;"><br></div><div style=3D"font-size: small;">Anyway, I ported=
 jailhouse-images and meta-jailhouse together(meta-orangepi,=C2=A0<a href=
=3D"https://github.com/cevatbostancioglu/meta-orangepi/tree/dev" target=3D"=
_blank" data-saferedirecturl=3D"https://www.google.com/url?q=3Dhttps://gith=
ub.com/cevatbostancioglu/meta-orangepi/tree/dev&amp;source=3Dgmail&amp;ust=
=3D1565779280137000&amp;usg=3DAFQjCNFHCPYzIjUhm-UfS0AUNksqveVGUw" style=3D"=
color: rgb(17, 85, 204);">https:<wbr>//github.com/<wbr>cevatbostancioglu/me=
ta-<wbr>orangepi/tree/dev</a>) and trying to compile for orange pi zero(256=
mb) but I saw many errors while building. can you guys can guess what is th=
e problem?</div><div style=3D"font-size: small;"><br></div><div style=3D"fo=
nt-size: small;">my status:<br>i am trying to build exact image with jailho=
use-images so i patched u-boot &amp; kernel, now i am trying to compile/ins=
tall jailhouse.<br><br></div><div style=3D"font-size: small;">You can see b=
uild error as follows,</div><div style=3D"font-size: small;">also attached =
log outputs too.</div><div style=3D"font-size: small;"><br></div><div style=
=3D"font-size: small;">My repo:</div><div style=3D"font-size: small;"><a hr=
ef=3D"https://github.com/cevatbostancioglu/meta-orangepi/tree/dev" target=
=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?q=3Dhttps://=
github.com/cevatbostancioglu/meta-orangepi/tree/dev&amp;source=3Dgmail&amp;=
ust=3D1565779280138000&amp;usg=3DAFQjCNEf4QjcCrXivycfAhbrMB7GLV3Rmw" style=
=3D"color: rgb(17, 85, 204);">https://github.com/<wbr>cevatbostancioglu/met=
a-<wbr>orangepi/tree/dev</a></div><div style=3D"font-size: small;"><br></di=
v><div style=3D"font-size: small;">Thanks</div><div style=3D"font-size: sma=
ll;"><br></div><div style=3D"font-size: small;">Cevat</div><div style=3D"fo=
nt-size: small;"><br></div><div style=3D"font-size: small;">$ bitbake =C2=
=A0jailhouse<br>WARNING: Layer meta-orangepi should set LAYERSERIES_COMPAT_=
meta-<wbr>orangepi in its conf/layer.conf file to list the core layer names=
 it is compatible with.<br>WARNING: Layer meta-orangepi should set LAYERSER=
IES_COMPAT_meta-<wbr>orangepi in its conf/layer.conf file to list the core =
layer names it is compatible with.<br>Loading cache: 100% |################=
#############<wbr>##############################<wbr>######################=
########<wbr>##############################<wbr>###########################=
###<wbr>##############################<wbr>################| Time: 0:00:01<=
br>Loaded 3309 entries from dependency cache.<br>NOTE: Resolving any missin=
g task queue dependencies<br><br>Build Configuration:<br>BB_VERSION =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;1.43.1&quot;<br>BUILD_SYS =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64-linux&quot;<br>NATIVELSBSTR=
ING =C2=A0 =C2=A0 =C2=A0=3D &quot;ubuntu-16.04&quot;<br>TARGET_SYS =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;arm-oe-linux-gnueabi&quot;<br>MACHINE=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;orange-pi-zero&q=
uot;<br>DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;o=
rangepi&quot;<br>DISTRO_VERSION =C2=A0 =C2=A0 =C2=A0 =3D &quot;nodistro.0&q=
uot;<br>TUNE_FEATURES =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;arm vfp cortexa7=
 neon vfpv4 callconvention-hard&quot;<br>TARGET_FPU =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =3D &quot;hard&quot;<br>meta =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0<br>meta-poky =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D &quot;HEAD:<wbr>9983b07fffd19082abded7c3f15cc7<wbr>7d306dd69c=
&quot;<br>meta-filesystems =C2=A0 =C2=A0=C2=A0<br>meta-oe =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>meta-python =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0<br>meta-networking =C2=A0 =C2=A0 =C2=A0=3D &quot;HEAD:<wbr>4e0538516=
b1e0ef42dc79bd08f7895<wbr>f0052063ac&quot;<br>meta-orangepi =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D &quot;dev:<wbr>377e6533d05ef16dcbeac849f515a7<wbr>a0b6a261=
10&quot;<br><br>Initialising tasks: 100% |#############################<wbr=
>##############################<wbr>##############################<wbr>####=
##########################<wbr>##############################<wbr>#########=
#####################<wbr>###########| Time: 0:00:00<br>Sstate summary: Wan=
ted 6 Found 0 Missed 6 Current 195 (0% match, 97% complete)<br>NOTE: Execut=
ing Tasks<br>NOTE: Setscene tasks completed<br>WARNING: jailhouse-0.11-r0 d=
o_populate_lic: jailhouse: No generic license file exists for: BSD-2-clause=
 in any provider<br>ERROR: jailhouse-0.11-r0 do_compile: oe_runmake failed<=
br>ERROR: jailhouse-0.11-r0 do_compile: Execution of &#39;/home/cevat/Deskt=
op/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe=
-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/temp/run.do_compile.14598&#39; f=
ailed with exit code 1:<br>=C2=A0 UPD =C2=A0 =C2=A0 /home/cevat/Desktop/met=
a-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>=
linux-gnueabi/jailhouse/0.11-<wbr>r0/git/hypervisor/include/<wbr>generated/=
<a href=3D"http://config.mk/" target=3D"_blank" data-saferedirecturl=3D"htt=
ps://www.google.com/url?q=3Dhttp://config.mk&amp;source=3Dgmail&amp;ust=3D1=
565779280138000&amp;usg=3DAFQjCNGZRi-V5cy5nUcrYvzNRzsNz--2yw" style=3D"colo=
r: rgb(17, 85, 204);">config.mk</a><br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/=
cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange=
_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/inmates/lib/arm/.=
./arm-<wbr>common/../alloc.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/D=
esktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zer=
o-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/inmates/lib/arm/../arm-<=
wbr>common/../cmdline.o<br>=C2=A0 UPD =C2=A0 =C2=A0 /home/cevat/Desktop/met=
a-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>=
linux-gnueabi/jailhouse/0.11-<wbr>r0/git/hypervisor/include/<wbr>generated/=
version.h<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-<wbr>or=
angepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnu=
eabi/jailhouse/0.11-<wbr>r0/git/inmates/lib/arm/../arm-<wbr>common/../print=
k.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi=
/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/j=
ailhouse/0.11-<wbr>r0/git/configs/arm/bananapi-<wbr>gic-demo.o<br>=C2=A0 CC=
 =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm=
/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<w=
br>r0/git/inmates/lib/arm/../arm-<wbr>common/../setup.o<br>=C2=A0 CC =C2=A0=
 =C2=A0 =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<w=
br>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/g=
it/configs/arm/bananapi-<wbr>linux-demo.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0=
/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/=
orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm=
/bananapi-<wbr>uart-demo.o<br>=C2=A0 CC [M] =C2=A0/home/cevat/Desktop/meta-=
<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>li=
nux-gnueabi/jailhouse/0.11-<wbr>r0/git/driver/cell.o<br>=C2=A0 CC =C2=A0 =
=C2=A0 =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wb=
r>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/gi=
t/inmates/lib/arm/../arm-<wbr>common/../string.o<br>=C2=A0 CC =C2=A0 =C2=A0=
 =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glib=
c/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/conf=
igs/arm/bananapi.o<br>/tmp/ccWTZUPO.s: Assembler messages:<br>/tmp/ccWTZUPO=
.s:73: Error: selected processor does not support `cpsid if&#39; in ARM mod=
e<br>/tmp/ccWTZUPO.s:87: Error: selected processor does not support `wfi&#3=
9; in ARM mode<br>make[6]: *** [/home/cevat/Desktop/meta-<wbr>orangepi/yoct=
o/build_arm/tmp-<wbr>glibc/work-shared/orange-pi-<wbr>zero/kernel-source/sc=
ripts/<wbr>Makefile.build:303: /home/cevat/Desktop/meta-<wbr>orangepi/yocto=
/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhou=
se/0.11-<wbr>r0/git/inmates/lib/arm/../arm-<wbr>common/../setup.o] Error 1<=
br>make[6]: *** Waiting for unfinished jobs....<br>=C2=A0 CC =C2=A0 =C2=A0 =
=C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc=
/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/inmat=
es/lib/arm/../arm-<wbr>common/../uart-8250.o<br>=C2=A0 CC [M] =C2=A0/home/c=
evat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_=
pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/driver/main.o<br>=
=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/=
build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhous=
e/0.11-<wbr>r0/git/hypervisor/arch/arm/<wbr>asm-defines.s<br>=C2=A0 CC =C2=
=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp=
-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r=
0/git/configs/arm/emtrion-<wbr>rzg1e-linux-demo.o<br>=C2=A0 LDS =C2=A0 =C2=
=A0 /home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/w=
ork/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/hypervi=
sor/hypervisor.<wbr>lds<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Deskto=
p/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-=
<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/emtrion-<wbr>rzg1=
e-uart-demo.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-<wb=
r>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux=
-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/emtrion-<wbr>rzg1e.o<br>=C2=
=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/bui=
ld_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0=
.11-<wbr>r0/git/configs/arm/emtrion-<wbr>rzg1h-linux-demo.o<br>=C2=A0 CC =
=C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/=
tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wb=
r>r0/git/hypervisor/setup.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/De=
sktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero=
-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/emtrion-<wbr>=
rzg1h-uart-demo.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta=
-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>l=
inux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/emtrion-<wbr>rzg1h.o<br=
>/tmp/ccreteLO.s: Assembler messages:<br>/tmp/ccreteLO.s:186: Error: archit=
ectural extension `virt&#39; is not allowed for the current base architectu=
re<br>/tmp/ccreteLO.s:187: Error: selected processor does not support `hvc =
#0x4a48&#39; in ARM mode<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Deskt=
op/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe=
-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/hypervisor/printk.o<br>make[=
6]: *** [/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>gl=
ibc/work-shared/orange-pi-<wbr>zero/kernel-source/scripts/<wbr>Makefile.bui=
ld:303: /home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>gli=
bc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/inm=
ates/lib/arm/../arm-<wbr>common/../printk.o] Error 1<br>make[5]: *** [/home=
/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work-share=
d/orange-pi-<wbr>zero/kernel-source/scripts/<wbr>Makefile.build:544: /home/=
cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange=
_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/inmates/lib/arm] =
Error 2<br>make[4]: *** [/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build=
_arm/tmp-<wbr>glibc/work-shared/orange-pi-<wbr>zero/kernel-source/scripts/<=
wbr>Makefile.build:544: /home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_=
arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11=
-<wbr>r0/git/inmates] Error 2<br>make[4]: *** Waiting for unfinished jobs..=
..<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/=
yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/ja=
ilhouse/0.11-<wbr>r0/git/configs/arm/emtrion-<wbr>rzg1m-linux-demo.o<br>=C2=
=A0 CC [M] =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp=
-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r=
0/git/driver/sysfs.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/m=
eta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wb=
r>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/hypervisor/paging.o<br>/tmp/ccdw=
kr9Y.s: Assembler messages:<br>/tmp/ccdwkr9Y.s:16: Error: architectural ext=
ension `virt&#39; is not allowed for the current base architecture<br>/tmp/=
ccdwkr9Y.s:42: Error: architectural extension `mp&#39; is not allowed for t=
he current base architecture<br>/tmp/ccdwkr9Y.s:43: Error: selected process=
or does not support `pldw [r2]&#39; in ARM mode<br>/tmp/ccdwkr9Y.s:45: Erro=
r: selected processor does not support `ldrex r1,[r2]&#39; in ARM mode<br>/=
tmp/ccdwkr9Y.s:47: Error: selected processor does not support `strex r0,r3,=
[r2]&#39; in ARM mode<br>/tmp/ccdwkr9Y.s:70: Error: selected processor does=
 not support `dmb ish&#39; in ARM mode<br>/tmp/ccdwkr9Y.s:82: Error: select=
ed processor does not support `wfe&#39; in ARM mode<br>/tmp/ccdwkr9Y.s:179:=
 Error: selected processor does not support `dmb ish&#39; in ARM mode<br>/t=
mp/ccdwkr9Y.s:200: Error: selected processor does not support `dmb ish&#39;=
 in ARM mode<br>/tmp/ccdwkr9Y.s:212: Error: selected processor does not sup=
port `dsb ishst&#39; in ARM mode<br>/tmp/ccdwkr9Y.s:216: Error: selected pr=
ocessor does not support `sev&#39; in ARM mode<br>/tmp/ccdwkr9Y.s:598: Erro=
r: selected processor does not support `dmb ish&#39; in ARM mode<br>/tmp/cc=
dwkr9Y.s:623: Error: selected processor does not support `dmb ish&#39; in A=
RM mode<br>/tmp/ccdwkr9Y.s:635: Error: selected processor does not support =
`dsb ishst&#39; in ARM mode<br>/tmp/ccdwkr9Y.s:639: Error: selected process=
or does not support `sev&#39; in ARM mode<br>/tmp/ccdwkr9Y.s:966: Error: se=
lected processor does not support `dmb ish&#39; in ARM mode<br>=C2=A0 CC [M=
] =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>gli=
bc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/dri=
ver/pci.o<br>make[5]: *** [/home/cevat/Desktop/meta-<wbr>orangepi/yocto/bui=
ld_arm/tmp-<wbr>glibc/work-shared/orange-pi-<wbr>zero/kernel-source/scripts=
/<wbr>Makefile.build:303: /home/cevat/Desktop/meta-<wbr>orangepi/yocto/buil=
d_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.=
11-<wbr>r0/git/hypervisor/setup.o] Error 1<br>make[5]: *** Waiting for unfi=
nished jobs....<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-<=
wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>lin=
ux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/emtrion-<wbr>rzg1m-uart-d=
emo.o<br>=C2=A0 DTC =C2=A0 =C2=A0 /home/cevat/Desktop/meta-<wbr>orangepi/yo=
cto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jail=
house/0.11-<wbr>r0/git/driver/vpci_template.<wbr>dtb<br>/tmp/ccITUo2X.s: As=
sembler messages:<br>/tmp/ccITUo2X.s:16: Error: architectural extension `vi=
rt&#39; is not allowed for the current base architecture<br>/tmp/ccITUo2X.s=
:165: Error: selected processor does not support `dmb ish&#39; in ARM mode<=
br>/tmp/ccITUo2X.s:229: Error: selected processor does not support `dmb ish=
&#39; in ARM mode<br>/tmp/ccITUo2X.s:1324: Error: architectural extension `=
mp&#39; is not allowed for the current base architecture<br>/tmp/ccITUo2X.s=
:1325: Error: selected processor does not support `pldw [r2]&#39; in ARM mo=
de<br>/tmp/ccITUo2X.s:1327: Error: selected processor does not support `ldr=
ex r1,[r2]&#39; in ARM mode<br>/tmp/ccITUo2X.s:1329: Error: selected proces=
sor does not support `strex r0,r3,[r2]&#39; in ARM mode<br>/tmp/ccITUo2X.s:=
1352: Error: selected processor does not support `dmb ish&#39; in ARM mode<=
br>/tmp/ccITUo2X.s:1373: Error: selected processor does not support `dmb is=
h&#39; in ARM mode<br>/tmp/ccITUo2X.s:1386: Error: selected processor does =
not support `dsb ishst&#39; in ARM mode<br>/tmp/ccITUo2X.s:1390: Error: sel=
ected processor does not support `sev&#39; in ARM mode<br>/tmp/ccITUo2X.s:1=
420: Error: selected processor does not support `wfe&#39; in ARM mode<br>/t=
mp/ccITUo2X.s:1485: Error: architectural extension `mp&#39; is not allowed =
for the current base architecture<br>/tmp/ccITUo2X.s:1486: Error: selected =
processor does not support `pldw [r3]&#39; in ARM mode<br>/tmp/ccITUo2X.s:1=
499: Error: selected processor does not support `ldrex lr,[r3]&#39; in ARM =
mode<br>/tmp/ccITUo2X.s:1503: Error: selected processor does not support `s=
trex ip,lr,[r3]&#39; in ARM mode<br>make[5]: *** [/home/cevat/Desktop/meta-=
<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work-shared/orange-pi-<wbr>zer=
o/kernel-source/scripts/<wbr>Makefile.build:303: /home/cevat/Desktop/meta-<=
wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>lin=
ux-gnueabi/jailhouse/0.11-<wbr>r0/git/hypervisor/printk.o] Error 1<br>=C2=
=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/bui=
ld_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0=
.11-<wbr>r0/git/configs/arm/emtrion-<wbr>rzg1m.o<br>=C2=A0 CC =C2=A0 =C2=A0=
 =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glib=
c/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/conf=
igs/arm/jetson-tk1-<wbr>demo.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat=
/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_z=
ero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/jetson-tk1=
-<wbr>linux-demo.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/met=
a-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>=
linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/jetson-tk1.<wbr>o<br>/=
tmp/ccr5KeF1.s: Assembler messages:<br>/tmp/ccr5KeF1.s:16: Error: architect=
ural extension `virt&#39; is not allowed for the current base architecture<=
br>/tmp/ccr5KeF1.s:132: Error: selected processor does not support `rbit r3=
,r3&#39; in ARM mode<br>/tmp/ccr5KeF1.s:305: Error: architectural extension=
 `mp&#39; is not allowed for the current base architecture<br>/tmp/ccr5KeF1=
.s:306: Error: selected processor does not support `pldw [r3]&#39; in ARM m=
ode<br>/tmp/ccr5KeF1.s:323: Error: selected processor does not support `ldr=
ex ip,[r3]&#39; in ARM mode<br>/tmp/ccr5KeF1.s:325: Error: selected process=
or does not support `strex r0,ip,[r3]&#39; in ARM mode<br>/tmp/ccr5KeF1.s:4=
31: Error: selected processor does not support `dsb &#39; in ARM mode<br>/t=
mp/ccr5KeF1.s:447: Error: selected processor does not support `dsb &#39; in=
 ARM mode<br>/tmp/ccr5KeF1.s:451: Error: selected processor does not suppor=
t `isb&#39; in ARM mode<br>/tmp/ccr5KeF1.s:661: Error: architectural extens=
ion `mp&#39; is not allowed for the current base architecture<br>/tmp/ccr5K=
eF1.s:662: Error: selected processor does not support `pldw [r2]&#39; in AR=
M mode<br>/tmp/ccr5KeF1.s:682: Error: selected processor does not support `=
ldrex r0,[r2]&#39; in ARM mode<br>/tmp/ccr5KeF1.s:684: Error: selected proc=
essor does not support `strex r1,r0,[r2]&#39; in ARM mode<br>/tmp/ccr5KeF1.=
s:2634: Error: architectural extension `mp&#39; is not allowed for the curr=
ent base architecture<br>/tmp/ccr5KeF1.s:2635: Error: selected processor do=
es not support `pldw [r3]&#39; in ARM mode<br>/tmp/ccr5KeF1.s:2652: Error: =
selected processor does not support `ldrex lr,[r3]&#39; in ARM mode<br>/tmp=
/ccr5KeF1.s:2654: Error: selected processor does not support `strex ip,lr,[=
r3]&#39; in ARM mode<br>make[5]: *** [/home/cevat/Desktop/meta-<wbr>orangep=
i/yocto/build_arm/tmp-<wbr>glibc/work-shared/orange-pi-<wbr>zero/kernel-sou=
rce/scripts/<wbr>Makefile.build:303: /home/cevat/Desktop/meta-<wbr>orangepi=
/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/j=
ailhouse/0.11-<wbr>r0/git/hypervisor/paging.o] Error 1<br>make[4]: *** [/ho=
me/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work-sha=
red/orange-pi-<wbr>zero/kernel-source/scripts/<wbr>Makefile.build:544: /hom=
e/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/oran=
ge_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/hypervisor] Err=
or 2<br>=C2=A0 DTB =C2=A0 =C2=A0 /home/cevat/Desktop/meta-<wbr>orangepi/yoc=
to/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailh=
ouse/0.11-<wbr>r0/git/driver/vpci_template.<wbr>dtb.S<br>=C2=A0 CC =C2=A0 =
=C2=A0 =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wb=
r>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/gi=
t/configs/arm/orangepi0-<wbr>gic-demo.o<br>=C2=A0 AS [M] =C2=A0/home/cevat/=
Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_ze=
ro-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/driver/vpci_template.<w=
br>dtb.o<br>=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-<wbr>ora=
ngepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnue=
abi/jailhouse/0.11-<wbr>r0/git/configs/arm/orangepi0-<wbr>linux-demo.o<br>=
=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/=
build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhous=
e/0.11-<wbr>r0/git/configs/arm/orangepi0.o<br>=C2=A0 DTC =C2=A0 =C2=A0 /hom=
e/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/oran=
ge_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/dts=
/inmate-<wbr>bananapi.dtb<br>=C2=A0 DTC =C2=A0 =C2=A0 /home/cevat/Desktop/m=
eta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wb=
r>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/dts/inmate-<wbr>emtr=
ion-emconrzg1e.dtb<br>=C2=A0 DTC =C2=A0 =C2=A0 /home/cevat/Desktop/meta-<wb=
r>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux=
-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/dts/inmate-<wbr>emtrion-emc=
onrzg1h.dtb<br>=C2=A0 DTC =C2=A0 =C2=A0 /home/cevat/Desktop/meta-<wbr>orang=
epi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueab=
i/jailhouse/0.11-<wbr>r0/git/configs/arm/dts/inmate-<wbr>emtrion-emconrzg1m=
.dtb<br>=C2=A0 DTC =C2=A0 =C2=A0 /home/cevat/Desktop/meta-<wbr>orangepi/yoc=
to/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailh=
ouse/0.11-<wbr>r0/git/configs/arm/dts/inmate-<wbr>jetson-tk1.dtb<br>=C2=A0 =
DTC =C2=A0 =C2=A0 /home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tm=
p-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>=
r0/git/configs/arm/dts/inmate-<wbr>orangepi0.dtb<br>=C2=A0 OBJCOPY /home/ce=
vat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_p=
i_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/bananap=
i-<wbr>gic-demo.cell<br>=C2=A0 OBJCOPY /home/cevat/Desktop/meta-<wbr>orange=
pi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi=
/jailhouse/0.11-<wbr>r0/git/configs/arm/bananapi-<wbr>linux-demo.cell<br>=
=C2=A0 OBJCOPY /home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<=
wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/=
git/configs/arm/bananapi-<wbr>uart-demo.cell<br>=C2=A0 OBJCOPY /home/cevat/=
Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_ze=
ro-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/bananapi.<w=
br>cell<br>=C2=A0 OBJCOPY /home/cevat/Desktop/meta-<wbr>orangepi/yocto/buil=
d_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.=
11-<wbr>r0/git/configs/arm/emtrion-<wbr>rzg1e-uart-demo.cell<br>=C2=A0 OBJC=
OPY /home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/w=
ork/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs=
/arm/emtrion-<wbr>rzg1e-linux-demo.cell<br>=C2=A0 OBJCOPY /home/cevat/Deskt=
op/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe=
-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/emtrion-<wbr>rzg=
1e.cell<br>=C2=A0 OBJCOPY /home/cevat/Desktop/meta-<wbr>orangepi/yocto/buil=
d_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.=
11-<wbr>r0/git/configs/arm/emtrion-<wbr>rzg1h-linux-demo.cell<br>=C2=A0 OBJ=
COPY /home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/=
work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/config=
s/arm/emtrion-<wbr>rzg1h-uart-demo.cell<br>=C2=A0 OBJCOPY /home/cevat/Deskt=
op/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe=
-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/emtrion-<wbr>rzg=
1h.cell<br>=C2=A0 OBJCOPY /home/cevat/Desktop/meta-<wbr>orangepi/yocto/buil=
d_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.=
11-<wbr>r0/git/configs/arm/emtrion-<wbr>rzg1m-linux-demo.cell<br>=C2=A0 OBJ=
COPY /home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/=
work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/config=
s/arm/emtrion-<wbr>rzg1m-uart-demo.cell<br>=C2=A0 OBJCOPY /home/cevat/Deskt=
op/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe=
-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/emtrion-<wbr>rzg=
1m.cell<br>=C2=A0 OBJCOPY /home/cevat/Desktop/meta-<wbr>orangepi/yocto/buil=
d_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.=
11-<wbr>r0/git/configs/arm/jetson-tk1-<wbr>demo.cell<br>=C2=A0 OBJCOPY /hom=
e/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/oran=
ge_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/jet=
son-tk1-<wbr>linux-demo.cell<br>=C2=A0 OBJCOPY /home/cevat/Desktop/meta-<wb=
r>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux=
-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/jetson-tk1.<wbr>cell<br>=C2=
=A0 OBJCOPY /home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr=
>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git=
/configs/arm/orangepi0-<wbr>gic-demo.cell<br>=C2=A0 OBJCOPY /home/cevat/Des=
ktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-=
oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/orangepi0-<wbr=
>linux-demo.cell<br>=C2=A0 OBJCOPY /home/cevat/Desktop/meta-<wbr>orangepi/y=
octo/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jai=
lhouse/0.11-<wbr>r0/git/configs/arm/orangepi0.<wbr>cell<br>=C2=A0 LD [M] =
=C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc=
/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/drive=
r/jailhouse.o<br>make[3]: *** [/home/cevat/Desktop/meta-<wbr>orangepi/yocto=
/build_arm/tmp-<wbr>glibc/work-shared/orange-pi-<wbr>zero/kernel-source/Mak=
efile:<wbr>1518: _module_/home/cevat/Desktop/<wbr>meta-orangepi/yocto/build=
_arm/<wbr>tmp-glibc/work/orange_pi_zero-<wbr>oe-linux-gnueabi/jailhouse/0.<=
wbr>11-r0/git] Error 2<br>make[2]: *** [Makefile:146: sub-make] Error 2<br>=
make[1]: *** [Makefile:24: __sub-make] Error 2<br>make: *** [Makefile:40: m=
odules] Error 2<br>WARNING: exit code 1 from a shell command.<br><br>ERROR:=
 Logfile of failure stored in: /home/cevat/Desktop/meta-<wbr>orangepi/yocto=
/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhou=
se/0.11-<wbr>r0/temp/log.do_compile.14598<br>Log data follows:<br>| DEBUG: =
Executing shell function do_compile<br>| NOTE: make -j 8 KERNEL_SRC=3D/home=
/cevat/<wbr>Desktop/meta-orangepi/yocto/<wbr>build_arm/tmp-glibc/work-<wbr>=
shared/orange-pi-zero/kernel-<wbr>source V=3D0 CROSS_COMPILE=3Darm-oe-linux=
-<wbr>gnueabi- KDIR=3D/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_ar=
m/tmp-<wbr>glibc/work-shared/orange-pi-<wbr>zero/kernel-build-artifacts<br>=
| =C2=A0 UPD =C2=A0 =C2=A0 /home/cevat/Desktop/meta-<wbr>orangepi/yocto/bui=
ld_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0=
.11-<wbr>r0/git/hypervisor/include/<wbr>generated/<a href=3D"http://config.=
mk/" target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?q=
=3Dhttp://config.mk&amp;source=3Dgmail&amp;ust=3D1565779280138000&amp;usg=
=3DAFQjCNGZRi-V5cy5nUcrYvzNRzsNz--2yw" style=3D"color: rgb(17, 85, 204);">c=
onfig.mk</a><br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-<w=
br>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linu=
x-gnueabi/jailhouse/0.11-<wbr>r0/git/inmates/lib/arm/../arm-<wbr>common/../=
alloc.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-<wbr>or=
angepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnu=
eabi/jailhouse/0.11-<wbr>r0/git/inmates/lib/arm/../arm-<wbr>common/../cmdli=
ne.o<br>| =C2=A0 UPD =C2=A0 =C2=A0 /home/cevat/Desktop/meta-<wbr>orangepi/y=
octo/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jai=
lhouse/0.11-<wbr>r0/git/hypervisor/include/<wbr>generated/version.h<br>| =
=C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/=
build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhous=
e/0.11-<wbr>r0/git/inmates/lib/arm/../arm-<wbr>common/../printk.o<br>| =C2=
=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/bui=
ld_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0=
.11-<wbr>r0/git/configs/arm/bananapi-<wbr>gic-demo.o<br>| =C2=A0 CC =C2=A0 =
=C2=A0 =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wb=
r>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/gi=
t/inmates/lib/arm/../arm-<wbr>common/../setup.o<br>| =C2=A0 CC =C2=A0 =C2=
=A0 =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>g=
libc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/c=
onfigs/arm/bananapi-<wbr>linux-demo.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/h=
ome/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/or=
ange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/b=
ananapi-<wbr>uart-demo.o<br>| =C2=A0 CC [M] =C2=A0/home/cevat/Desktop/meta-=
<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>li=
nux-gnueabi/jailhouse/0.11-<wbr>r0/git/driver/cell.o<br>| =C2=A0 CC =C2=A0 =
=C2=A0 =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wb=
r>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/gi=
t/inmates/lib/arm/../arm-<wbr>common/../string.o<br>| =C2=A0 CC =C2=A0 =C2=
=A0 =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>g=
libc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/c=
onfigs/arm/bananapi.o<br>| /tmp/ccWTZUPO.s: Assembler messages:<br>| /tmp/c=
cWTZUPO.s:73: Error: selected processor does not support `cpsid if&#39; in =
ARM mode<br>| /tmp/ccWTZUPO.s:87: Error: selected processor does not suppor=
t `wfi&#39; in ARM mode<br>| make[6]: *** [/home/cevat/Desktop/meta-<wbr>or=
angepi/yocto/build_arm/tmp-<wbr>glibc/work-shared/orange-pi-<wbr>zero/kerne=
l-source/scripts/<wbr>Makefile.build:303: /home/cevat/Desktop/meta-<wbr>ora=
ngepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnue=
abi/jailhouse/0.11-<wbr>r0/git/inmates/lib/arm/../arm-<wbr>common/../setup.=
o] Error 1<br>| make[6]: *** Waiting for unfinished jobs....<br>| =C2=A0 CC=
 =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm=
/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<w=
br>r0/git/inmates/lib/arm/../arm-<wbr>common/../uart-8250.o<br>| =C2=A0 CC =
[M] =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>g=
libc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/d=
river/main.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-<w=
br>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linu=
x-gnueabi/jailhouse/0.11-<wbr>r0/git/hypervisor/arch/arm/<wbr>asm-defines.s=
<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/=
yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/ja=
ilhouse/0.11-<wbr>r0/git/configs/arm/emtrion-<wbr>rzg1e-linux-demo.o<br>| =
=C2=A0 LDS =C2=A0 =C2=A0 /home/cevat/Desktop/meta-<wbr>orangepi/yocto/build=
_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.1=
1-<wbr>r0/git/hypervisor/hypervisor.<wbr>lds<br>| =C2=A0 CC =C2=A0 =C2=A0 =
=C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc=
/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/confi=
gs/arm/emtrion-<wbr>rzg1e-uart-demo.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/h=
ome/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/or=
ange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/e=
mtrion-<wbr>rzg1e.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/=
meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<w=
br>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/emtrion-<wbr>rzg1h-=
linux-demo.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-<w=
br>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linu=
x-gnueabi/jailhouse/0.11-<wbr>r0/git/hypervisor/setup.o<br>| =C2=A0 CC =C2=
=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp=
-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r=
0/git/configs/arm/emtrion-<wbr>rzg1h-uart-demo.o<br>| =C2=A0 CC =C2=A0 =C2=
=A0 =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>g=
libc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/c=
onfigs/arm/emtrion-<wbr>rzg1h.o<br>| /tmp/ccreteLO.s: Assembler messages:<b=
r>| /tmp/ccreteLO.s:186: Error: architectural extension `virt&#39; is not a=
llowed for the current base architecture<br>| /tmp/ccreteLO.s:187: Error: s=
elected processor does not support `hvc #0x4a48&#39; in ARM mode<br>| =C2=
=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/bui=
ld_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0=
.11-<wbr>r0/git/hypervisor/printk.o<br>| make[6]: *** [/home/cevat/Desktop/=
meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work-shared/orange-pi-<wb=
r>zero/kernel-source/scripts/<wbr>Makefile.build:303: /home/cevat/Desktop/m=
eta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wb=
r>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/inmates/lib/arm/../arm-<wbr>comm=
on/../printk.o] Error 1<br>| make[5]: *** [/home/cevat/Desktop/meta-<wbr>or=
angepi/yocto/build_arm/tmp-<wbr>glibc/work-shared/orange-pi-<wbr>zero/kerne=
l-source/scripts/<wbr>Makefile.build:544: /home/cevat/Desktop/meta-<wbr>ora=
ngepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnue=
abi/jailhouse/0.11-<wbr>r0/git/inmates/lib/arm] Error 2<br>| make[4]: *** [=
/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work-=
shared/orange-pi-<wbr>zero/kernel-source/scripts/<wbr>Makefile.build:544: /=
home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/o=
range_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/inmates] Err=
or 2<br>| make[4]: *** Waiting for unfinished jobs....<br>| =C2=A0 CC =C2=
=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp=
-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r=
0/git/configs/arm/emtrion-<wbr>rzg1m-linux-demo.o<br>| =C2=A0 CC [M] =C2=A0=
/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/=
orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/driver/sysf=
s.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-<wbr>orange=
pi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi=
/jailhouse/0.11-<wbr>r0/git/hypervisor/paging.o<br>| /tmp/ccdwkr9Y.s: Assem=
bler messages:<br>| /tmp/ccdwkr9Y.s:16: Error: architectural extension `vir=
t&#39; is not allowed for the current base architecture<br>| /tmp/ccdwkr9Y.=
s:42: Error: architectural extension `mp&#39; is not allowed for the curren=
t base architecture<br>| /tmp/ccdwkr9Y.s:43: Error: selected processor does=
 not support `pldw [r2]&#39; in ARM mode<br>| /tmp/ccdwkr9Y.s:45: Error: se=
lected processor does not support `ldrex r1,[r2]&#39; in ARM mode<br>| /tmp=
/ccdwkr9Y.s:47: Error: selected processor does not support `strex r0,r3,[r2=
]&#39; in ARM mode<br>| /tmp/ccdwkr9Y.s:70: Error: selected processor does =
not support `dmb ish&#39; in ARM mode<br>| /tmp/ccdwkr9Y.s:82: Error: selec=
ted processor does not support `wfe&#39; in ARM mode<br>| /tmp/ccdwkr9Y.s:1=
79: Error: selected processor does not support `dmb ish&#39; in ARM mode<br=
>| /tmp/ccdwkr9Y.s:200: Error: selected processor does not support `dmb ish=
&#39; in ARM mode<br>| /tmp/ccdwkr9Y.s:212: Error: selected processor does =
not support `dsb ishst&#39; in ARM mode<br>| /tmp/ccdwkr9Y.s:216: Error: se=
lected processor does not support `sev&#39; in ARM mode<br>| /tmp/ccdwkr9Y.=
s:598: Error: selected processor does not support `dmb ish&#39; in ARM mode=
<br>| /tmp/ccdwkr9Y.s:623: Error: selected processor does not support `dmb =
ish&#39; in ARM mode<br>| /tmp/ccdwkr9Y.s:635: Error: selected processor do=
es not support `dsb ishst&#39; in ARM mode<br>| /tmp/ccdwkr9Y.s:639: Error:=
 selected processor does not support `sev&#39; in ARM mode<br>| /tmp/ccdwkr=
9Y.s:966: Error: selected processor does not support `dmb ish&#39; in ARM m=
ode<br>| =C2=A0 CC [M] =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/b=
uild_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse=
/0.11-<wbr>r0/git/driver/pci.o<br>| make[5]: *** [/home/cevat/Desktop/meta-=
<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work-shared/orange-pi-<wbr>zer=
o/kernel-source/scripts/<wbr>Makefile.build:303: /home/cevat/Desktop/meta-<=
wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>lin=
ux-gnueabi/jailhouse/0.11-<wbr>r0/git/hypervisor/setup.o] Error 1<br>| make=
[5]: *** Waiting for unfinished jobs....<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=
=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/wo=
rk/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/=
arm/emtrion-<wbr>rzg1m-uart-demo.o<br>| =C2=A0 DTC =C2=A0 =C2=A0 /home/ceva=
t/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_=
zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/driver/vpci_template.=
<wbr>dtb<br>| /tmp/ccITUo2X.s: Assembler messages:<br>| /tmp/ccITUo2X.s:16:=
 Error: architectural extension `virt&#39; is not allowed for the current b=
ase architecture<br>| /tmp/ccITUo2X.s:165: Error: selected processor does n=
ot support `dmb ish&#39; in ARM mode<br>| /tmp/ccITUo2X.s:229: Error: selec=
ted processor does not support `dmb ish&#39; in ARM mode<br>| /tmp/ccITUo2X=
.s:1324: Error: architectural extension `mp&#39; is not allowed for the cur=
rent base architecture<br>| /tmp/ccITUo2X.s:1325: Error: selected processor=
 does not support `pldw [r2]&#39; in ARM mode<br>| /tmp/ccITUo2X.s:1327: Er=
ror: selected processor does not support `ldrex r1,[r2]&#39; in ARM mode<br=
>| /tmp/ccITUo2X.s:1329: Error: selected processor does not support `strex =
r0,r3,[r2]&#39; in ARM mode<br>| /tmp/ccITUo2X.s:1352: Error: selected proc=
essor does not support `dmb ish&#39; in ARM mode<br>| /tmp/ccITUo2X.s:1373:=
 Error: selected processor does not support `dmb ish&#39; in ARM mode<br>| =
/tmp/ccITUo2X.s:1386: Error: selected processor does not support `dsb ishst=
&#39; in ARM mode<br>| /tmp/ccITUo2X.s:1390: Error: selected processor does=
 not support `sev&#39; in ARM mode<br>| /tmp/ccITUo2X.s:1420: Error: select=
ed processor does not support `wfe&#39; in ARM mode<br>| /tmp/ccITUo2X.s:14=
85: Error: architectural extension `mp&#39; is not allowed for the current =
base architecture<br>| /tmp/ccITUo2X.s:1486: Error: selected processor does=
 not support `pldw [r3]&#39; in ARM mode<br>| /tmp/ccITUo2X.s:1499: Error: =
selected processor does not support `ldrex lr,[r3]&#39; in ARM mode<br>| /t=
mp/ccITUo2X.s:1503: Error: selected processor does not support `strex ip,lr=
,[r3]&#39; in ARM mode<br>| make[5]: *** [/home/cevat/Desktop/meta-<wbr>ora=
ngepi/yocto/build_arm/tmp-<wbr>glibc/work-shared/orange-pi-<wbr>zero/kernel=
-source/scripts/<wbr>Makefile.build:303: /home/cevat/Desktop/meta-<wbr>oran=
gepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnuea=
bi/jailhouse/0.11-<wbr>r0/git/hypervisor/printk.o] Error 1<br>| =C2=A0 CC =
=C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/=
tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wb=
r>r0/git/configs/arm/emtrion-<wbr>rzg1m.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=
=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/wo=
rk/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/=
arm/jetson-tk1-<wbr>demo.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/D=
esktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zer=
o-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/jetson-tk1-<=
wbr>linux-demo.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/met=
a-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>=
linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/jetson-tk1.<wbr>o<br>|=
 /tmp/ccr5KeF1.s: Assembler messages:<br>| /tmp/ccr5KeF1.s:16: Error: archi=
tectural extension `virt&#39; is not allowed for the current base architect=
ure<br>| /tmp/ccr5KeF1.s:132: Error: selected processor does not support `r=
bit r3,r3&#39; in ARM mode<br>| /tmp/ccr5KeF1.s:305: Error: architectural e=
xtension `mp&#39; is not allowed for the current base architecture<br>| /tm=
p/ccr5KeF1.s:306: Error: selected processor does not support `pldw [r3]&#39=
; in ARM mode<br>| /tmp/ccr5KeF1.s:323: Error: selected processor does not =
support `ldrex ip,[r3]&#39; in ARM mode<br>| /tmp/ccr5KeF1.s:325: Error: se=
lected processor does not support `strex r0,ip,[r3]&#39; in ARM mode<br>| /=
tmp/ccr5KeF1.s:431: Error: selected processor does not support `dsb &#39; i=
n ARM mode<br>| /tmp/ccr5KeF1.s:447: Error: selected processor does not sup=
port `dsb &#39; in ARM mode<br>| /tmp/ccr5KeF1.s:451: Error: selected proce=
ssor does not support `isb&#39; in ARM mode<br>| /tmp/ccr5KeF1.s:661: Error=
: architectural extension `mp&#39; is not allowed for the current base arch=
itecture<br>| /tmp/ccr5KeF1.s:662: Error: selected processor does not suppo=
rt `pldw [r2]&#39; in ARM mode<br>| /tmp/ccr5KeF1.s:682: Error: selected pr=
ocessor does not support `ldrex r0,[r2]&#39; in ARM mode<br>| /tmp/ccr5KeF1=
.s:684: Error: selected processor does not support `strex r1,r0,[r2]&#39; i=
n ARM mode<br>| /tmp/ccr5KeF1.s:2634: Error: architectural extension `mp&#3=
9; is not allowed for the current base architecture<br>| /tmp/ccr5KeF1.s:26=
35: Error: selected processor does not support `pldw [r3]&#39; in ARM mode<=
br>| /tmp/ccr5KeF1.s:2652: Error: selected processor does not support `ldre=
x lr,[r3]&#39; in ARM mode<br>| /tmp/ccr5KeF1.s:2654: Error: selected proce=
ssor does not support `strex ip,lr,[r3]&#39; in ARM mode<br>| make[5]: *** =
[/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work=
-shared/orange-pi-<wbr>zero/kernel-source/scripts/<wbr>Makefile.build:303: =
/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/=
orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/hypervisor/=
paging.o] Error 1<br>| make[4]: *** [/home/cevat/Desktop/meta-<wbr>orangepi=
/yocto/build_arm/tmp-<wbr>glibc/work-shared/orange-pi-<wbr>zero/kernel-sour=
ce/scripts/<wbr>Makefile.build:544: /home/cevat/Desktop/meta-<wbr>orangepi/=
yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/ja=
ilhouse/0.11-<wbr>r0/git/hypervisor] Error 2<br>| =C2=A0 DTB =C2=A0 =C2=A0 =
/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/=
orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/driver/vpci=
_template.<wbr>dtb.S<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop=
/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<=
wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/orangepi0-<wbr>gic=
-demo.o<br>| =C2=A0 AS [M] =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yoc=
to/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailh=
ouse/0.11-<wbr>r0/git/driver/vpci_template.<wbr>dtb.o<br>| =C2=A0 CC =C2=A0=
 =C2=A0 =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<w=
br>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/g=
it/configs/arm/orangepi0-<wbr>linux-demo.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=
=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/wo=
rk/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/=
arm/orangepi0.o<br>| =C2=A0 DTC =C2=A0 =C2=A0 /home/cevat/Desktop/meta-<wbr=
>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-=
gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/dts/inmate-<wbr>bananapi.dtb=
<br>| =C2=A0 DTC =C2=A0 =C2=A0 /home/cevat/Desktop/meta-<wbr>orangepi/yocto=
/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhou=
se/0.11-<wbr>r0/git/configs/arm/dts/inmate-<wbr>emtrion-emconrzg1e.dtb<br>|=
 =C2=A0 DTC =C2=A0 =C2=A0 /home/cevat/Desktop/meta-<wbr>orangepi/yocto/buil=
d_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.=
11-<wbr>r0/git/configs/arm/dts/inmate-<wbr>emtrion-emconrzg1h.dtb<br>| =C2=
=A0 DTC =C2=A0 =C2=A0 /home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_ar=
m/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<=
wbr>r0/git/configs/arm/dts/inmate-<wbr>emtrion-emconrzg1m.dtb<br>| =C2=A0 D=
TC =C2=A0 =C2=A0 /home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp=
-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r=
0/git/configs/arm/dts/inmate-<wbr>jetson-tk1.dtb<br>| =C2=A0 DTC =C2=A0 =C2=
=A0 /home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/w=
ork/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs=
/arm/dts/inmate-<wbr>orangepi0.dtb<br>| =C2=A0 OBJCOPY /home/cevat/Desktop/=
meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<w=
br>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/bananapi-<wbr>gic-d=
emo.cell<br>| =C2=A0 OBJCOPY /home/cevat/Desktop/meta-<wbr>orangepi/yocto/b=
uild_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse=
/0.11-<wbr>r0/git/configs/arm/bananapi-<wbr>linux-demo.cell<br>| =C2=A0 OBJ=
COPY /home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/=
work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/config=
s/arm/bananapi-<wbr>uart-demo.cell<br>| =C2=A0 OBJCOPY /home/cevat/Desktop/=
meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<w=
br>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/bananapi.<wbr>cell<=
br>| =C2=A0 OBJCOPY /home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/=
tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wb=
r>r0/git/configs/arm/emtrion-<wbr>rzg1e-uart-demo.cell<br>| =C2=A0 OBJCOPY =
/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/=
orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm=
/emtrion-<wbr>rzg1e-linux-demo.cell<br>| =C2=A0 OBJCOPY /home/cevat/Desktop=
/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<=
wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/emtrion-<wbr>rzg1e=
.cell<br>| =C2=A0 OBJCOPY /home/cevat/Desktop/meta-<wbr>orangepi/yocto/buil=
d_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.=
11-<wbr>r0/git/configs/arm/emtrion-<wbr>rzg1h-linux-demo.cell<br>| =C2=A0 O=
BJCOPY /home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glib=
c/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/conf=
igs/arm/emtrion-<wbr>rzg1h-uart-demo.cell<br>| =C2=A0 OBJCOPY /home/cevat/D=
esktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zer=
o-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/emtrion-<wbr=
>rzg1h.cell<br>| =C2=A0 OBJCOPY /home/cevat/Desktop/meta-<wbr>orangepi/yoct=
o/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailho=
use/0.11-<wbr>r0/git/configs/arm/emtrion-<wbr>rzg1m-linux-demo.cell<br>| =
=C2=A0 OBJCOPY /home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<=
wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/=
git/configs/arm/emtrion-<wbr>rzg1m-uart-demo.cell<br>| =C2=A0 OBJCOPY /home=
/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orang=
e_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/emtr=
ion-<wbr>rzg1m.cell<br>| =C2=A0 OBJCOPY /home/cevat/Desktop/meta-<wbr>orang=
epi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueab=
i/jailhouse/0.11-<wbr>r0/git/configs/arm/jetson-tk1-<wbr>demo.cell<br>| =C2=
=A0 OBJCOPY /home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr=
>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git=
/configs/arm/jetson-tk1-<wbr>linux-demo.cell<br>| =C2=A0 OBJCOPY /home/ceva=
t/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_=
zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/jetson-tk=
1.<wbr>cell<br>| =C2=A0 OBJCOPY /home/cevat/Desktop/meta-<wbr>orangepi/yoct=
o/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailho=
use/0.11-<wbr>r0/git/configs/arm/orangepi0-<wbr>gic-demo.cell<br>| =C2=A0 O=
BJCOPY /home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glib=
c/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/conf=
igs/arm/orangepi0-<wbr>linux-demo.cell<br>| =C2=A0 OBJCOPY /home/cevat/Desk=
top/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-o=
e-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/orangepi0.<wbr>=
cell<br>| =C2=A0 LD [M] =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/=
build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhous=
e/0.11-<wbr>r0/git/driver/jailhouse.o<br>| make[3]: *** [/home/cevat/Deskto=
p/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work-shared/orange-pi-<=
wbr>zero/kernel-source/Makefile:<wbr>1518: _module_/home/cevat/Desktop/<wbr=
>meta-orangepi/yocto/build_arm/<wbr>tmp-glibc/work/orange_pi_zero-<wbr>oe-l=
inux-gnueabi/jailhouse/0.<wbr>11-r0/git] Error 2<br>| make[2]: *** [Makefil=
e:146: sub-make] Error 2<br>| make[1]: *** [Makefile:24: __sub-make] Error =
2<br>| make: *** [Makefile:40: modules] Error 2<br>| ERROR: oe_runmake fail=
ed<br>| WARNING: exit code 1 from a shell command.<br>| ERROR: Execution of=
 &#39;/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc=
/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/temp/run.=
do_compile.14598&#39; failed with exit code 1:<br>| =C2=A0 UPD =C2=A0 =C2=
=A0 /home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/w=
ork/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/hypervi=
sor/include/<wbr>generated/<a href=3D"http://config.mk/" target=3D"_blank" =
data-saferedirecturl=3D"https://www.google.com/url?q=3Dhttp://config.mk&amp=
;source=3Dgmail&amp;ust=3D1565779280138000&amp;usg=3DAFQjCNGZRi-V5cy5nUcrYv=
zNRzsNz--2yw" style=3D"color: rgb(17, 85, 204);">config.mk</a><br>| =C2=A0 =
CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_a=
rm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-=
<wbr>r0/git/inmates/lib/arm/../arm-<wbr>common/../alloc.o<br>| =C2=A0 CC =
=C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/=
tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wb=
r>r0/git/inmates/lib/arm/../arm-<wbr>common/../cmdline.o<br>| =C2=A0 UPD =
=C2=A0 =C2=A0 /home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<w=
br>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/g=
it/hypervisor/include/<wbr>generated/version.h<br>| =C2=A0 CC =C2=A0 =C2=A0=
 =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glib=
c/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/inma=
tes/lib/arm/../arm-<wbr>common/../printk.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=
=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/wo=
rk/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/=
arm/bananapi-<wbr>gic-demo.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat=
/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_z=
ero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/inmates/lib/arm/../arm=
-<wbr>common/../setup.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desk=
top/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-o=
e-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/bananapi-<wbr>l=
inux-demo.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-<wb=
r>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux=
-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/bananapi-<wbr>uart-demo.o<b=
r>| =C2=A0 CC [M] =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_=
arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11=
-<wbr>r0/git/driver/cell.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/D=
esktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zer=
o-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/inmates/lib/arm/../arm-<=
wbr>common/../string.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Deskt=
op/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe=
-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/bananapi.o<br>| =
/tmp/ccWTZUPO.s: Assembler messages:<br>| /tmp/ccWTZUPO.s:73: Error: select=
ed processor does not support `cpsid if&#39; in ARM mode<br>| /tmp/ccWTZUPO=
.s:87: Error: selected processor does not support `wfi&#39; in ARM mode<br>=
| make[6]: *** [/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-=
<wbr>glibc/work-shared/orange-pi-<wbr>zero/kernel-source/scripts/<wbr>Makef=
ile.build:303: /home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<=
wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/=
git/inmates/lib/arm/../arm-<wbr>common/../setup.o] Error 1<br>| make[6]: **=
* Waiting for unfinished jobs....<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/=
cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange=
_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/inmates/lib/arm/.=
./arm-<wbr>common/../uart-8250.o<br>| =C2=A0 CC [M] =C2=A0/home/cevat/Deskt=
op/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe=
-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/driver/main.o<br>| =C2=A0 CC=
 =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm=
/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<w=
br>r0/git/hypervisor/arch/arm/<wbr>asm-defines.s<br>| =C2=A0 CC =C2=A0 =C2=
=A0 =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>g=
libc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/c=
onfigs/arm/emtrion-<wbr>rzg1e-linux-demo.o<br>| =C2=A0 LDS =C2=A0 =C2=A0 /h=
ome/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/or=
ange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/hypervisor/hy=
pervisor.<wbr>lds<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/me=
ta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr=
>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/emtrion-<wbr>rzg1e-ua=
rt-demo.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-<wbr>=
orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-g=
nueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/emtrion-<wbr>rzg1e.o<br>| =C2=
=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/bui=
ld_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0=
.11-<wbr>r0/git/configs/arm/emtrion-<wbr>rzg1h-linux-demo.o<br>| =C2=A0 CC =
=C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/=
tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wb=
r>r0/git/hypervisor/setup.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/=
Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_ze=
ro-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/emtrion-<wb=
r>rzg1h-uart-demo.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/=
meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<w=
br>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/emtrion-<wbr>rzg1h.=
o<br>| /tmp/ccreteLO.s: Assembler messages:<br>| /tmp/ccreteLO.s:186: Error=
: architectural extension `virt&#39; is not allowed for the current base ar=
chitecture<br>| /tmp/ccreteLO.s:187: Error: selected processor does not sup=
port `hvc #0x4a48&#39; in ARM mode<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home=
/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orang=
e_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/hypervisor/print=
k.o<br>| make[6]: *** [/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_a=
rm/tmp-<wbr>glibc/work-shared/orange-pi-<wbr>zero/kernel-source/scripts/<wb=
r>Makefile.build:303: /home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_ar=
m/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<=
wbr>r0/git/inmates/lib/arm/../arm-<wbr>common/../printk.o] Error 1<br>| mak=
e[5]: *** [/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>=
glibc/work-shared/orange-pi-<wbr>zero/kernel-source/scripts/<wbr>Makefile.b=
uild:544: /home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>g=
libc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/i=
nmates/lib/arm] Error 2<br>| make[4]: *** [/home/cevat/Desktop/meta-<wbr>or=
angepi/yocto/build_arm/tmp-<wbr>glibc/work-shared/orange-pi-<wbr>zero/kerne=
l-source/scripts/<wbr>Makefile.build:544: /home/cevat/Desktop/meta-<wbr>ora=
ngepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnue=
abi/jailhouse/0.11-<wbr>r0/git/inmates] Error 2<br>| make[4]: *** Waiting f=
or unfinished jobs....<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Deskt=
op/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe=
-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/emtrion-<wbr>rzg=
1m-linux-demo.o<br>| =C2=A0 CC [M] =C2=A0/home/cevat/Desktop/meta-<wbr>oran=
gepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnuea=
bi/jailhouse/0.11-<wbr>r0/git/driver/sysfs.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =
=C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc=
/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/hyper=
visor/paging.o<br>| /tmp/ccdwkr9Y.s: Assembler messages:<br>| /tmp/ccdwkr9Y=
.s:16: Error: architectural extension `virt&#39; is not allowed for the cur=
rent base architecture<br>| /tmp/ccdwkr9Y.s:42: Error: architectural extens=
ion `mp&#39; is not allowed for the current base architecture<br>| /tmp/ccd=
wkr9Y.s:43: Error: selected processor does not support `pldw [r2]&#39; in A=
RM mode<br>| /tmp/ccdwkr9Y.s:45: Error: selected processor does not support=
 `ldrex r1,[r2]&#39; in ARM mode<br>| /tmp/ccdwkr9Y.s:47: Error: selected p=
rocessor does not support `strex r0,r3,[r2]&#39; in ARM mode<br>| /tmp/ccdw=
kr9Y.s:70: Error: selected processor does not support `dmb ish&#39; in ARM =
mode<br>| /tmp/ccdwkr9Y.s:82: Error: selected processor does not support `w=
fe&#39; in ARM mode<br>| /tmp/ccdwkr9Y.s:179: Error: selected processor doe=
s not support `dmb ish&#39; in ARM mode<br>| /tmp/ccdwkr9Y.s:200: Error: se=
lected processor does not support `dmb ish&#39; in ARM mode<br>| /tmp/ccdwk=
r9Y.s:212: Error: selected processor does not support `dsb ishst&#39; in AR=
M mode<br>| /tmp/ccdwkr9Y.s:216: Error: selected processor does not support=
 `sev&#39; in ARM mode<br>| /tmp/ccdwkr9Y.s:598: Error: selected processor =
does not support `dmb ish&#39; in ARM mode<br>| /tmp/ccdwkr9Y.s:623: Error:=
 selected processor does not support `dmb ish&#39; in ARM mode<br>| /tmp/cc=
dwkr9Y.s:635: Error: selected processor does not support `dsb ishst&#39; in=
 ARM mode<br>| /tmp/ccdwkr9Y.s:639: Error: selected processor does not supp=
ort `sev&#39; in ARM mode<br>| /tmp/ccdwkr9Y.s:966: Error: selected process=
or does not support `dmb ish&#39; in ARM mode<br>| =C2=A0 CC [M] =C2=A0/hom=
e/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/oran=
ge_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/driver/pci.o<br=
>| make[5]: *** [/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp=
-<wbr>glibc/work-shared/orange-pi-<wbr>zero/kernel-source/scripts/<wbr>Make=
file.build:303: /home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-=
<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0=
/git/hypervisor/setup.o] Error 1<br>| make[5]: *** Waiting for unfinished j=
obs....<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-<wbr>or=
angepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnu=
eabi/jailhouse/0.11-<wbr>r0/git/configs/arm/emtrion-<wbr>rzg1m-uart-demo.o<=
br>| =C2=A0 DTC =C2=A0 =C2=A0 /home/cevat/Desktop/meta-<wbr>orangepi/yocto/=
build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhous=
e/0.11-<wbr>r0/git/driver/vpci_template.<wbr>dtb<br>| /tmp/ccITUo2X.s: Asse=
mbler messages:<br>| /tmp/ccITUo2X.s:16: Error: architectural extension `vi=
rt&#39; is not allowed for the current base architecture<br>| /tmp/ccITUo2X=
.s:165: Error: selected processor does not support `dmb ish&#39; in ARM mod=
e<br>| /tmp/ccITUo2X.s:229: Error: selected processor does not support `dmb=
 ish&#39; in ARM mode<br>| /tmp/ccITUo2X.s:1324: Error: architectural exten=
sion `mp&#39; is not allowed for the current base architecture<br>| /tmp/cc=
ITUo2X.s:1325: Error: selected processor does not support `pldw [r2]&#39; i=
n ARM mode<br>| /tmp/ccITUo2X.s:1327: Error: selected processor does not su=
pport `ldrex r1,[r2]&#39; in ARM mode<br>| /tmp/ccITUo2X.s:1329: Error: sel=
ected processor does not support `strex r0,r3,[r2]&#39; in ARM mode<br>| /t=
mp/ccITUo2X.s:1352: Error: selected processor does not support `dmb ish&#39=
; in ARM mode<br>| /tmp/ccITUo2X.s:1373: Error: selected processor does not=
 support `dmb ish&#39; in ARM mode<br>| /tmp/ccITUo2X.s:1386: Error: select=
ed processor does not support `dsb ishst&#39; in ARM mode<br>| /tmp/ccITUo2=
X.s:1390: Error: selected processor does not support `sev&#39; in ARM mode<=
br>| /tmp/ccITUo2X.s:1420: Error: selected processor does not support `wfe&=
#39; in ARM mode<br>| /tmp/ccITUo2X.s:1485: Error: architectural extension =
`mp&#39; is not allowed for the current base architecture<br>| /tmp/ccITUo2=
X.s:1486: Error: selected processor does not support `pldw [r3]&#39; in ARM=
 mode<br>| /tmp/ccITUo2X.s:1499: Error: selected processor does not support=
 `ldrex lr,[r3]&#39; in ARM mode<br>| /tmp/ccITUo2X.s:1503: Error: selected=
 processor does not support `strex ip,lr,[r3]&#39; in ARM mode<br>| make[5]=
: *** [/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glib=
c/work-shared/orange-pi-<wbr>zero/kernel-source/scripts/<wbr>Makefile.build=
:303: /home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc=
/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/hyper=
visor/printk.o] Error 1<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desk=
top/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-o=
e-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/emtrion-<wbr>rz=
g1m.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-<wbr>oran=
gepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnuea=
bi/jailhouse/0.11-<wbr>r0/git/configs/arm/jetson-tk1-<wbr>demo.o<br>| =C2=
=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/bui=
ld_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0=
.11-<wbr>r0/git/configs/arm/jetson-tk1-<wbr>linux-demo.o<br>| =C2=A0 CC =C2=
=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp=
-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r=
0/git/configs/arm/jetson-tk1.<wbr>o<br>| /tmp/ccr5KeF1.s: Assembler message=
s:<br>| /tmp/ccr5KeF1.s:16: Error: architectural extension `virt&#39; is no=
t allowed for the current base architecture<br>| /tmp/ccr5KeF1.s:132: Error=
: selected processor does not support `rbit r3,r3&#39; in ARM mode<br>| /tm=
p/ccr5KeF1.s:305: Error: architectural extension `mp&#39; is not allowed fo=
r the current base architecture<br>| /tmp/ccr5KeF1.s:306: Error: selected p=
rocessor does not support `pldw [r3]&#39; in ARM mode<br>| /tmp/ccr5KeF1.s:=
323: Error: selected processor does not support `ldrex ip,[r3]&#39; in ARM =
mode<br>| /tmp/ccr5KeF1.s:325: Error: selected processor does not support `=
strex r0,ip,[r3]&#39; in ARM mode<br>| /tmp/ccr5KeF1.s:431: Error: selected=
 processor does not support `dsb &#39; in ARM mode<br>| /tmp/ccr5KeF1.s:447=
: Error: selected processor does not support `dsb &#39; in ARM mode<br>| /t=
mp/ccr5KeF1.s:451: Error: selected processor does not support `isb&#39; in =
ARM mode<br>| /tmp/ccr5KeF1.s:661: Error: architectural extension `mp&#39; =
is not allowed for the current base architecture<br>| /tmp/ccr5KeF1.s:662: =
Error: selected processor does not support `pldw [r2]&#39; in ARM mode<br>|=
 /tmp/ccr5KeF1.s:682: Error: selected processor does not support `ldrex r0,=
[r2]&#39; in ARM mode<br>| /tmp/ccr5KeF1.s:684: Error: selected processor d=
oes not support `strex r1,r0,[r2]&#39; in ARM mode<br>| /tmp/ccr5KeF1.s:263=
4: Error: architectural extension `mp&#39; is not allowed for the current b=
ase architecture<br>| /tmp/ccr5KeF1.s:2635: Error: selected processor does =
not support `pldw [r3]&#39; in ARM mode<br>| /tmp/ccr5KeF1.s:2652: Error: s=
elected processor does not support `ldrex lr,[r3]&#39; in ARM mode<br>| /tm=
p/ccr5KeF1.s:2654: Error: selected processor does not support `strex ip,lr,=
[r3]&#39; in ARM mode<br>| make[5]: *** [/home/cevat/Desktop/meta-<wbr>oran=
gepi/yocto/build_arm/tmp-<wbr>glibc/work-shared/orange-pi-<wbr>zero/kernel-=
source/scripts/<wbr>Makefile.build:303: /home/cevat/Desktop/meta-<wbr>orang=
epi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueab=
i/jailhouse/0.11-<wbr>r0/git/hypervisor/paging.o] Error 1<br>| make[4]: ***=
 [/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/wor=
k-shared/orange-pi-<wbr>zero/kernel-source/scripts/<wbr>Makefile.build:544:=
 /home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work=
/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/hypervisor=
] Error 2<br>| =C2=A0 DTB =C2=A0 =C2=A0 /home/cevat/Desktop/meta-<wbr>orang=
epi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueab=
i/jailhouse/0.11-<wbr>r0/git/driver/vpci_template.<wbr>dtb.S<br>| =C2=A0 CC=
 =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm=
/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<w=
br>r0/git/configs/arm/orangepi0-<wbr>gic-demo.o<br>| =C2=A0 AS [M] =C2=A0/h=
ome/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/or=
ange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/driver/vpci_t=
emplate.<wbr>dtb.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/m=
eta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wb=
r>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/orangepi0-<wbr>linux=
-demo.o<br>| =C2=A0 CC =C2=A0 =C2=A0 =C2=A0/home/cevat/Desktop/meta-<wbr>or=
angepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnu=
eabi/jailhouse/0.11-<wbr>r0/git/configs/arm/orangepi0.o<br>| =C2=A0 DTC =C2=
=A0 =C2=A0 /home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>=
glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/=
configs/arm/dts/inmate-<wbr>bananapi.dtb<br>| =C2=A0 DTC =C2=A0 =C2=A0 /hom=
e/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/oran=
ge_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/dts=
/inmate-<wbr>emtrion-emconrzg1e.dtb<br>| =C2=A0 DTC =C2=A0 =C2=A0 /home/cev=
at/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi=
_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/dts/inma=
te-<wbr>emtrion-emconrzg1h.dtb<br>| =C2=A0 DTC =C2=A0 =C2=A0 /home/cevat/De=
sktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero=
-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/dts/inmate-<w=
br>emtrion-emconrzg1m.dtb<br>| =C2=A0 DTC =C2=A0 =C2=A0 /home/cevat/Desktop=
/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<=
wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/dts/inmate-<wbr>je=
tson-tk1.dtb<br>| =C2=A0 DTC =C2=A0 =C2=A0 /home/cevat/Desktop/meta-<wbr>or=
angepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnu=
eabi/jailhouse/0.11-<wbr>r0/git/configs/arm/dts/inmate-<wbr>orangepi0.dtb<b=
r>| =C2=A0 OBJCOPY /home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/t=
mp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr=
>r0/git/configs/arm/bananapi-<wbr>gic-demo.cell<br>| =C2=A0 OBJCOPY /home/c=
evat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_=
pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/banana=
pi-<wbr>linux-demo.cell<br>| =C2=A0 OBJCOPY /home/cevat/Desktop/meta-<wbr>o=
rangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gn=
ueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/bananapi-<wbr>uart-demo.cell<b=
r>| =C2=A0 OBJCOPY /home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/t=
mp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr=
>r0/git/configs/arm/bananapi.<wbr>cell<br>| =C2=A0 OBJCOPY /home/cevat/Desk=
top/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-o=
e-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/emtrion-<wbr>rz=
g1e-uart-demo.cell<br>| =C2=A0 OBJCOPY /home/cevat/Desktop/meta-<wbr>orange=
pi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi=
/jailhouse/0.11-<wbr>r0/git/configs/arm/emtrion-<wbr>rzg1e-linux-demo.cell<=
br>| =C2=A0 OBJCOPY /home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/=
tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wb=
r>r0/git/configs/arm/emtrion-<wbr>rzg1e.cell<br>| =C2=A0 OBJCOPY /home/ceva=
t/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_=
zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/emtrion-<=
wbr>rzg1h-linux-demo.cell<br>| =C2=A0 OBJCOPY /home/cevat/Desktop/meta-<wbr=
>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-=
gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/emtrion-<wbr>rzg1h-uart-demo=
.cell<br>| =C2=A0 OBJCOPY /home/cevat/Desktop/meta-<wbr>orangepi/yocto/buil=
d_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.=
11-<wbr>r0/git/configs/arm/emtrion-<wbr>rzg1h.cell<br>| =C2=A0 OBJCOPY /hom=
e/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/oran=
ge_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/emt=
rion-<wbr>rzg1m-linux-demo.cell<br>| =C2=A0 OBJCOPY /home/cevat/Desktop/met=
a-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>=
linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/emtrion-<wbr>rzg1m-uar=
t-demo.cell<br>| =C2=A0 OBJCOPY /home/cevat/Desktop/meta-<wbr>orangepi/yoct=
o/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailho=
use/0.11-<wbr>r0/git/configs/arm/emtrion-<wbr>rzg1m.cell<br>| =C2=A0 OBJCOP=
Y /home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/wor=
k/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/a=
rm/jetson-tk1-<wbr>demo.cell<br>| =C2=A0 OBJCOPY /home/cevat/Desktop/meta-<=
wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>lin=
ux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/jetson-tk1-<wbr>linux-dem=
o.cell<br>| =C2=A0 OBJCOPY /home/cevat/Desktop/meta-<wbr>orangepi/yocto/bui=
ld_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0=
.11-<wbr>r0/git/configs/arm/jetson-tk1.<wbr>cell<br>| =C2=A0 OBJCOPY /home/=
cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange=
_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/orang=
epi0-<wbr>gic-demo.cell<br>| =C2=A0 OBJCOPY /home/cevat/Desktop/meta-<wbr>o=
rangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gn=
ueabi/jailhouse/0.11-<wbr>r0/git/configs/arm/orangepi0-<wbr>linux-demo.cell=
<br>| =C2=A0 OBJCOPY /home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm=
/tmp-<wbr>glibc/work/orange_pi_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<w=
br>r0/git/configs/arm/orangepi0.<wbr>cell<br>| =C2=A0 LD [M] =C2=A0/home/ce=
vat/Desktop/meta-<wbr>orangepi/yocto/build_arm/tmp-<wbr>glibc/work/orange_p=
i_zero-oe-<wbr>linux-gnueabi/jailhouse/0.11-<wbr>r0/git/driver/jailhouse.o<=
br>| make[3]: *** [/home/cevat/Desktop/meta-<wbr>orangepi/yocto/build_arm/t=
mp-<wbr>glibc/work-shared/orange-pi-<wbr>zero/kernel-source/Makefile:<wbr>1=
518: _module_/home/cevat/Desktop/<wbr>meta-orangepi/yocto/build_arm/<wbr>tm=
p-glibc/work/orange_pi_zero-<wbr>oe-linux-gnueabi/jailhouse/0.<wbr>11-r0/gi=
t] Error 2<br>| make[2]: *** [Makefile:146: sub-make] Error 2<br>| make[1]:=
 *** [Makefile:24: __sub-make] Error 2<br>| make: *** [Makefile:40: modules=
] Error 2<br>| WARNING: exit code 1 from a shell command.<br>|=C2=A0<br>ERR=
OR: Task (/home/cevat/Desktop/meta-<wbr>orangepi/yocto/meta-orangepi/<wbr>r=
ecipes-jailhouse/jailhouse/<wbr>jailhouse_0.11.bb:do_compile) failed with e=
xit code &#39;1&#39;<br>NOTE: Tasks Summary: Attempted 908 tasks of which 9=
01 didn&#39;t need to be rerun and 1 failed.<br>NOTE: Writing buildhistory<=
br>NOTE: Writing buildhistory took: 0 seconds<br><br>Summary: 1 task failed=
:<br>=C2=A0 /home/cevat/Desktop/meta-<wbr>orangepi/yocto/meta-orangepi/<wbr=
>recipes-jailhouse/jailhouse/<wbr>jailhouse_0.11.bb:do_compile<br>Summary: =
There were 3 WARNING messages shown.<br>Summary: There were 2 ERROR message=
s shown, returning a non-zero exit code.<br>cevat@cevat-MS-7970:~/Desktop/<=
wbr>meta-orangepi/yocto/build_arm$</div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/faf52b76-b1a1-4110-815a-32d778a97ba6%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/faf52b76-b1a1-4110-815a-32d778a97ba6%40googlegroups.com<=
/a>.<br />

------=_Part_2683_1430512410.1565693474802--

------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=log.do_cleansstate
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=log.do_cleansstate
X-Attachment-Id: 8b748680-c199-4cbc-9595-27356a4d4498
Content-ID: <8b748680-c199-4cbc-9595-27356a4d4498>

DEBUG: Executing python function do_cleansstate
NOTE: Removing /home/cevat/Desktop/meta-orangepi/yocto/build_arm/sstate-cache/*/sstate:jailhouse:orange_pi_zero-oe-linux-gnueabi:0.11:r0:orange_pi_zero:3:*_package.tgz*
NOTE: Removing /home/cevat/Desktop/meta-orangepi/yocto/build_arm/sstate-cache/*/sstate:jailhouse:orange_pi_zero-oe-linux-gnueabi:0.11:r0:orange_pi_zero:3:*_package_qa.tgz*
NOTE: Removing /home/cevat/Desktop/meta-orangepi/yocto/build_arm/sstate-cache/*/sstate:jailhouse:orange_pi_zero-oe-linux-gnueabi:0.11:r0:orange_pi_zero:3:*_package_write_ipk.tgz*
NOTE: Removing /home/cevat/Desktop/meta-orangepi/yocto/build_arm/sstate-cache/*/sstate:jailhouse:orange_pi_zero-oe-linux-gnueabi:0.11:r0:orange_pi_zero:3:*_packagedata.tgz*
NOTE: Removing /home/cevat/Desktop/meta-orangepi/yocto/build_arm/sstate-cache/*/sstate:jailhouse::0.11:r0::3:*_populate_lic.tgz*
NOTE: Removing /home/cevat/Desktop/meta-orangepi/yocto/build_arm/sstate-cache/*/sstate:jailhouse:orange_pi_zero-oe-linux-gnueabi:0.11:r0:orange_pi_zero:3:*_populate_sysroot.tgz*
DEBUG: Python function do_cleansstate finished

------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=log.do_cleansstate.14255
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=log.do_cleansstate.14255
X-Attachment-Id: 9f66f08a-135c-4a52-b534-5ba8d439259f
Content-ID: <9f66f08a-135c-4a52-b534-5ba8d439259f>

DEBUG: Executing python function do_cleansstate
NOTE: Removing /home/cevat/Desktop/meta-orangepi/yocto/build_arm/sstate-cache/*/sstate:jailhouse:orange_pi_zero-oe-linux-gnueabi:0.11:r0:orange_pi_zero:3:*_package.tgz*
NOTE: Removing /home/cevat/Desktop/meta-orangepi/yocto/build_arm/sstate-cache/*/sstate:jailhouse:orange_pi_zero-oe-linux-gnueabi:0.11:r0:orange_pi_zero:3:*_package_qa.tgz*
NOTE: Removing /home/cevat/Desktop/meta-orangepi/yocto/build_arm/sstate-cache/*/sstate:jailhouse:orange_pi_zero-oe-linux-gnueabi:0.11:r0:orange_pi_zero:3:*_package_write_ipk.tgz*
NOTE: Removing /home/cevat/Desktop/meta-orangepi/yocto/build_arm/sstate-cache/*/sstate:jailhouse:orange_pi_zero-oe-linux-gnueabi:0.11:r0:orange_pi_zero:3:*_packagedata.tgz*
NOTE: Removing /home/cevat/Desktop/meta-orangepi/yocto/build_arm/sstate-cache/*/sstate:jailhouse::0.11:r0::3:*_populate_lic.tgz*
NOTE: Removing /home/cevat/Desktop/meta-orangepi/yocto/build_arm/sstate-cache/*/sstate:jailhouse:orange_pi_zero-oe-linux-gnueabi:0.11:r0:orange_pi_zero:3:*_populate_sysroot.tgz*
DEBUG: Python function do_cleansstate finished

------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=log.do_compile
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=log.do_compile
X-Attachment-Id: 845769ff-e053-4ac0-8309-8ad34c31e186
Content-ID: <845769ff-e053-4ac0-8309-8ad34c31e186>

DEBUG: Executing shell function do_compile
NOTE: make -j 8 KERNEL_SRC=/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source V=0 CROSS_COMPILE=arm-oe-linux-gnueabi- KDIR=/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-build-artifacts
  UPD     /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/include/generated/config.mk
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../alloc.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../cmdline.o
  UPD     /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/include/generated/version.h
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../printk.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-gic-demo.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../setup.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-linux-demo.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-uart-demo.o
  CC [M]  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/cell.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../string.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi.o
/tmp/ccWTZUPO.s: Assembler messages:
/tmp/ccWTZUPO.s:73: Error: selected processor does not support `cpsid if' in ARM mode
/tmp/ccWTZUPO.s:87: Error: selected processor does not support `wfi' in ARM mode
make[6]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303: /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../setup.o] Error 1
make[6]: *** Waiting for unfinished jobs....
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../uart-8250.o
  CC [M]  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/main.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/arch/arm/asm-defines.s
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-linux-demo.o
  LDS     /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/hypervisor.lds
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-uart-demo.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h-linux-demo.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/setup.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h-uart-demo.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h.o
/tmp/ccreteLO.s: Assembler messages:
/tmp/ccreteLO.s:186: Error: architectural extension `virt' is not allowed for the current base architecture
/tmp/ccreteLO.s:187: Error: selected processor does not support `hvc #0x4a48' in ARM mode
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/printk.o
make[6]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303: /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../printk.o] Error 1
make[5]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:544: /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm] Error 2
make[4]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:544: /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates] Error 2
make[4]: *** Waiting for unfinished jobs....
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m-linux-demo.o
  CC [M]  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/sysfs.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/paging.o
/tmp/ccdwkr9Y.s: Assembler messages:
/tmp/ccdwkr9Y.s:16: Error: architectural extension `virt' is not allowed for the current base architecture
/tmp/ccdwkr9Y.s:42: Error: architectural extension `mp' is not allowed for the current base architecture
/tmp/ccdwkr9Y.s:43: Error: selected processor does not support `pldw [r2]' in ARM mode
/tmp/ccdwkr9Y.s:45: Error: selected processor does not support `ldrex r1,[r2]' in ARM mode
/tmp/ccdwkr9Y.s:47: Error: selected processor does not support `strex r0,r3,[r2]' in ARM mode
/tmp/ccdwkr9Y.s:70: Error: selected processor does not support `dmb ish' in ARM mode
/tmp/ccdwkr9Y.s:82: Error: selected processor does not support `wfe' in ARM mode
/tmp/ccdwkr9Y.s:179: Error: selected processor does not support `dmb ish' in ARM mode
/tmp/ccdwkr9Y.s:200: Error: selected processor does not support `dmb ish' in ARM mode
/tmp/ccdwkr9Y.s:212: Error: selected processor does not support `dsb ishst' in ARM mode
/tmp/ccdwkr9Y.s:216: Error: selected processor does not support `sev' in ARM mode
/tmp/ccdwkr9Y.s:598: Error: selected processor does not support `dmb ish' in ARM mode
/tmp/ccdwkr9Y.s:623: Error: selected processor does not support `dmb ish' in ARM mode
/tmp/ccdwkr9Y.s:635: Error: selected processor does not support `dsb ishst' in ARM mode
/tmp/ccdwkr9Y.s:639: Error: selected processor does not support `sev' in ARM mode
/tmp/ccdwkr9Y.s:966: Error: selected processor does not support `dmb ish' in ARM mode
  CC [M]  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/pci.o
make[5]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303: /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/setup.o] Error 1
make[5]: *** Waiting for unfinished jobs....
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m-uart-demo.o
  DTC     /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/vpci_template.dtb
/tmp/ccITUo2X.s: Assembler messages:
/tmp/ccITUo2X.s:16: Error: architectural extension `virt' is not allowed for the current base architecture
/tmp/ccITUo2X.s:165: Error: selected processor does not support `dmb ish' in ARM mode
/tmp/ccITUo2X.s:229: Error: selected processor does not support `dmb ish' in ARM mode
/tmp/ccITUo2X.s:1324: Error: architectural extension `mp' is not allowed for the current base architecture
/tmp/ccITUo2X.s:1325: Error: selected processor does not support `pldw [r2]' in ARM mode
/tmp/ccITUo2X.s:1327: Error: selected processor does not support `ldrex r1,[r2]' in ARM mode
/tmp/ccITUo2X.s:1329: Error: selected processor does not support `strex r0,r3,[r2]' in ARM mode
/tmp/ccITUo2X.s:1352: Error: selected processor does not support `dmb ish' in ARM mode
/tmp/ccITUo2X.s:1373: Error: selected processor does not support `dmb ish' in ARM mode
/tmp/ccITUo2X.s:1386: Error: selected processor does not support `dsb ishst' in ARM mode
/tmp/ccITUo2X.s:1390: Error: selected processor does not support `sev' in ARM mode
/tmp/ccITUo2X.s:1420: Error: selected processor does not support `wfe' in ARM mode
/tmp/ccITUo2X.s:1485: Error: architectural extension `mp' is not allowed for the current base architecture
/tmp/ccITUo2X.s:1486: Error: selected processor does not support `pldw [r3]' in ARM mode
/tmp/ccITUo2X.s:1499: Error: selected processor does not support `ldrex lr,[r3]' in ARM mode
/tmp/ccITUo2X.s:1503: Error: selected processor does not support `strex ip,lr,[r3]' in ARM mode
make[5]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303: /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/printk.o] Error 1
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-demo.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-linux-demo.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1.o
/tmp/ccr5KeF1.s: Assembler messages:
/tmp/ccr5KeF1.s:16: Error: architectural extension `virt' is not allowed for the current base architecture
/tmp/ccr5KeF1.s:132: Error: selected processor does not support `rbit r3,r3' in ARM mode
/tmp/ccr5KeF1.s:305: Error: architectural extension `mp' is not allowed for the current base architecture
/tmp/ccr5KeF1.s:306: Error: selected processor does not support `pldw [r3]' in ARM mode
/tmp/ccr5KeF1.s:323: Error: selected processor does not support `ldrex ip,[r3]' in ARM mode
/tmp/ccr5KeF1.s:325: Error: selected processor does not support `strex r0,ip,[r3]' in ARM mode
/tmp/ccr5KeF1.s:431: Error: selected processor does not support `dsb ' in ARM mode
/tmp/ccr5KeF1.s:447: Error: selected processor does not support `dsb ' in ARM mode
/tmp/ccr5KeF1.s:451: Error: selected processor does not support `isb' in ARM mode
/tmp/ccr5KeF1.s:661: Error: architectural extension `mp' is not allowed for the current base architecture
/tmp/ccr5KeF1.s:662: Error: selected processor does not support `pldw [r2]' in ARM mode
/tmp/ccr5KeF1.s:682: Error: selected processor does not support `ldrex r0,[r2]' in ARM mode
/tmp/ccr5KeF1.s:684: Error: selected processor does not support `strex r1,r0,[r2]' in ARM mode
/tmp/ccr5KeF1.s:2634: Error: architectural extension `mp' is not allowed for the current base architecture
/tmp/ccr5KeF1.s:2635: Error: selected processor does not support `pldw [r3]' in ARM mode
/tmp/ccr5KeF1.s:2652: Error: selected processor does not support `ldrex lr,[r3]' in ARM mode
/tmp/ccr5KeF1.s:2654: Error: selected processor does not support `strex ip,lr,[r3]' in ARM mode
make[5]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303: /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/paging.o] Error 1
make[4]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:544: /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor] Error 2
  DTB     /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/vpci_template.dtb.S
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0-gic-demo.o
  AS [M]  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/vpci_template.dtb.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0-linux-demo.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0.o
  DTC     /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-bananapi.dtb
  DTC     /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-emtrion-emconrzg1e.dtb
  DTC     /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-emtrion-emconrzg1h.dtb
  DTC     /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-emtrion-emconrzg1m.dtb
  DTC     /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-jetson-tk1.dtb
  DTC     /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-orangepi0.dtb
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-gic-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-linux-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-uart-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-uart-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-linux-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h-linux-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h-uart-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m-linux-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m-uart-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-linux-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0-gic-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0-linux-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0.cell
  LD [M]  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/jailhouse.o
make[3]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/Makefile:1518: _module_/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git] Error 2
make[2]: *** [Makefile:146: sub-make] Error 2
make[1]: *** [Makefile:24: __sub-make] Error 2
make: *** [Makefile:40: modules] Error 2
ERROR: oe_runmake failed
WARNING: exit code 1 from a shell command.
ERROR: Execution of '/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/temp/run.do_compile.14598' failed with exit code 1:
  UPD     /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/include/generated/config.mk
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../alloc.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../cmdline.o
  UPD     /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/include/generated/version.h
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../printk.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-gic-demo.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../setup.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-linux-demo.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-uart-demo.o
  CC [M]  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/cell.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../string.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi.o
/tmp/ccWTZUPO.s: Assembler messages:
/tmp/ccWTZUPO.s:73: Error: selected processor does not support `cpsid if' in ARM mode
/tmp/ccWTZUPO.s:87: Error: selected processor does not support `wfi' in ARM mode
make[6]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303: /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../setup.o] Error 1
make[6]: *** Waiting for unfinished jobs....
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../uart-8250.o
  CC [M]  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/main.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/arch/arm/asm-defines.s
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-linux-demo.o
  LDS     /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/hypervisor.lds
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-uart-demo.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h-linux-demo.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/setup.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h-uart-demo.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h.o
/tmp/ccreteLO.s: Assembler messages:
/tmp/ccreteLO.s:186: Error: architectural extension `virt' is not allowed for the current base architecture
/tmp/ccreteLO.s:187: Error: selected processor does not support `hvc #0x4a48' in ARM mode
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/printk.o
make[6]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303: /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../printk.o] Error 1
make[5]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:544: /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm] Error 2
make[4]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:544: /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates] Error 2
make[4]: *** Waiting for unfinished jobs....
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m-linux-demo.o
  CC [M]  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/sysfs.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/paging.o
/tmp/ccdwkr9Y.s: Assembler messages:
/tmp/ccdwkr9Y.s:16: Error: architectural extension `virt' is not allowed for the current base architecture
/tmp/ccdwkr9Y.s:42: Error: architectural extension `mp' is not allowed for the current base architecture
/tmp/ccdwkr9Y.s:43: Error: selected processor does not support `pldw [r2]' in ARM mode
/tmp/ccdwkr9Y.s:45: Error: selected processor does not support `ldrex r1,[r2]' in ARM mode
/tmp/ccdwkr9Y.s:47: Error: selected processor does not support `strex r0,r3,[r2]' in ARM mode
/tmp/ccdwkr9Y.s:70: Error: selected processor does not support `dmb ish' in ARM mode
/tmp/ccdwkr9Y.s:82: Error: selected processor does not support `wfe' in ARM mode
/tmp/ccdwkr9Y.s:179: Error: selected processor does not support `dmb ish' in ARM mode
/tmp/ccdwkr9Y.s:200: Error: selected processor does not support `dmb ish' in ARM mode
/tmp/ccdwkr9Y.s:212: Error: selected processor does not support `dsb ishst' in ARM mode
/tmp/ccdwkr9Y.s:216: Error: selected processor does not support `sev' in ARM mode
/tmp/ccdwkr9Y.s:598: Error: selected processor does not support `dmb ish' in ARM mode
/tmp/ccdwkr9Y.s:623: Error: selected processor does not support `dmb ish' in ARM mode
/tmp/ccdwkr9Y.s:635: Error: selected processor does not support `dsb ishst' in ARM mode
/tmp/ccdwkr9Y.s:639: Error: selected processor does not support `sev' in ARM mode
/tmp/ccdwkr9Y.s:966: Error: selected processor does not support `dmb ish' in ARM mode
  CC [M]  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/pci.o
make[5]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303: /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/setup.o] Error 1
make[5]: *** Waiting for unfinished jobs....
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m-uart-demo.o
  DTC     /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/vpci_template.dtb
/tmp/ccITUo2X.s: Assembler messages:
/tmp/ccITUo2X.s:16: Error: architectural extension `virt' is not allowed for the current base architecture
/tmp/ccITUo2X.s:165: Error: selected processor does not support `dmb ish' in ARM mode
/tmp/ccITUo2X.s:229: Error: selected processor does not support `dmb ish' in ARM mode
/tmp/ccITUo2X.s:1324: Error: architectural extension `mp' is not allowed for the current base architecture
/tmp/ccITUo2X.s:1325: Error: selected processor does not support `pldw [r2]' in ARM mode
/tmp/ccITUo2X.s:1327: Error: selected processor does not support `ldrex r1,[r2]' in ARM mode
/tmp/ccITUo2X.s:1329: Error: selected processor does not support `strex r0,r3,[r2]' in ARM mode
/tmp/ccITUo2X.s:1352: Error: selected processor does not support `dmb ish' in ARM mode
/tmp/ccITUo2X.s:1373: Error: selected processor does not support `dmb ish' in ARM mode
/tmp/ccITUo2X.s:1386: Error: selected processor does not support `dsb ishst' in ARM mode
/tmp/ccITUo2X.s:1390: Error: selected processor does not support `sev' in ARM mode
/tmp/ccITUo2X.s:1420: Error: selected processor does not support `wfe' in ARM mode
/tmp/ccITUo2X.s:1485: Error: architectural extension `mp' is not allowed for the current base architecture
/tmp/ccITUo2X.s:1486: Error: selected processor does not support `pldw [r3]' in ARM mode
/tmp/ccITUo2X.s:1499: Error: selected processor does not support `ldrex lr,[r3]' in ARM mode
/tmp/ccITUo2X.s:1503: Error: selected processor does not support `strex ip,lr,[r3]' in ARM mode
make[5]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303: /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/printk.o] Error 1
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-demo.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-linux-demo.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1.o
/tmp/ccr5KeF1.s: Assembler messages:
/tmp/ccr5KeF1.s:16: Error: architectural extension `virt' is not allowed for the current base architecture
/tmp/ccr5KeF1.s:132: Error: selected processor does not support `rbit r3,r3' in ARM mode
/tmp/ccr5KeF1.s:305: Error: architectural extension `mp' is not allowed for the current base architecture
/tmp/ccr5KeF1.s:306: Error: selected processor does not support `pldw [r3]' in ARM mode
/tmp/ccr5KeF1.s:323: Error: selected processor does not support `ldrex ip,[r3]' in ARM mode
/tmp/ccr5KeF1.s:325: Error: selected processor does not support `strex r0,ip,[r3]' in ARM mode
/tmp/ccr5KeF1.s:431: Error: selected processor does not support `dsb ' in ARM mode
/tmp/ccr5KeF1.s:447: Error: selected processor does not support `dsb ' in ARM mode
/tmp/ccr5KeF1.s:451: Error: selected processor does not support `isb' in ARM mode
/tmp/ccr5KeF1.s:661: Error: architectural extension `mp' is not allowed for the current base architecture
/tmp/ccr5KeF1.s:662: Error: selected processor does not support `pldw [r2]' in ARM mode
/tmp/ccr5KeF1.s:682: Error: selected processor does not support `ldrex r0,[r2]' in ARM mode
/tmp/ccr5KeF1.s:684: Error: selected processor does not support `strex r1,r0,[r2]' in ARM mode
/tmp/ccr5KeF1.s:2634: Error: architectural extension `mp' is not allowed for the current base architecture
/tmp/ccr5KeF1.s:2635: Error: selected processor does not support `pldw [r3]' in ARM mode
/tmp/ccr5KeF1.s:2652: Error: selected processor does not support `ldrex lr,[r3]' in ARM mode
/tmp/ccr5KeF1.s:2654: Error: selected processor does not support `strex ip,lr,[r3]' in ARM mode
make[5]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303: /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/paging.o] Error 1
make[4]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:544: /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor] Error 2
  DTB     /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/vpci_template.dtb.S
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0-gic-demo.o
  AS [M]  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/vpci_template.dtb.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0-linux-demo.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0.o
  DTC     /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-bananapi.dtb
  DTC     /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-emtrion-emconrzg1e.dtb
  DTC     /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-emtrion-emconrzg1h.dtb
  DTC     /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-emtrion-emconrzg1m.dtb
  DTC     /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-jetson-tk1.dtb
  DTC     /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-orangepi0.dtb
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-gic-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-linux-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-uart-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-uart-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-linux-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h-linux-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h-uart-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m-linux-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m-uart-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-linux-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0-gic-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0-linux-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0.cell
  LD [M]  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/jailhouse.o
make[3]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/Makefile:1518: _module_/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git] Error 2
make[2]: *** [Makefile:146: sub-make] Error 2
make[1]: *** [Makefile:24: __sub-make] Error 2
make: *** [Makefile:40: modules] Error 2
WARNING: exit code 1 from a shell command.


------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=log.do_compile.14598
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=log.do_compile.14598
X-Attachment-Id: cc65bfc6-2809-42a5-8be8-095ed01851c2
Content-ID: <cc65bfc6-2809-42a5-8be8-095ed01851c2>

DEBUG: Executing shell function do_compile
NOTE: make -j 8 KERNEL_SRC=/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source V=0 CROSS_COMPILE=arm-oe-linux-gnueabi- KDIR=/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-build-artifacts
  UPD     /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/include/generated/config.mk
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../alloc.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../cmdline.o
  UPD     /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/include/generated/version.h
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../printk.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-gic-demo.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../setup.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-linux-demo.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-uart-demo.o
  CC [M]  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/cell.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../string.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi.o
/tmp/ccWTZUPO.s: Assembler messages:
/tmp/ccWTZUPO.s:73: Error: selected processor does not support `cpsid if' in ARM mode
/tmp/ccWTZUPO.s:87: Error: selected processor does not support `wfi' in ARM mode
make[6]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303: /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../setup.o] Error 1
make[6]: *** Waiting for unfinished jobs....
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../uart-8250.o
  CC [M]  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/main.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/arch/arm/asm-defines.s
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-linux-demo.o
  LDS     /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/hypervisor.lds
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-uart-demo.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h-linux-demo.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/setup.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h-uart-demo.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h.o
/tmp/ccreteLO.s: Assembler messages:
/tmp/ccreteLO.s:186: Error: architectural extension `virt' is not allowed for the current base architecture
/tmp/ccreteLO.s:187: Error: selected processor does not support `hvc #0x4a48' in ARM mode
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/printk.o
make[6]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303: /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../printk.o] Error 1
make[5]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:544: /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm] Error 2
make[4]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:544: /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates] Error 2
make[4]: *** Waiting for unfinished jobs....
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m-linux-demo.o
  CC [M]  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/sysfs.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/paging.o
/tmp/ccdwkr9Y.s: Assembler messages:
/tmp/ccdwkr9Y.s:16: Error: architectural extension `virt' is not allowed for the current base architecture
/tmp/ccdwkr9Y.s:42: Error: architectural extension `mp' is not allowed for the current base architecture
/tmp/ccdwkr9Y.s:43: Error: selected processor does not support `pldw [r2]' in ARM mode
/tmp/ccdwkr9Y.s:45: Error: selected processor does not support `ldrex r1,[r2]' in ARM mode
/tmp/ccdwkr9Y.s:47: Error: selected processor does not support `strex r0,r3,[r2]' in ARM mode
/tmp/ccdwkr9Y.s:70: Error: selected processor does not support `dmb ish' in ARM mode
/tmp/ccdwkr9Y.s:82: Error: selected processor does not support `wfe' in ARM mode
/tmp/ccdwkr9Y.s:179: Error: selected processor does not support `dmb ish' in ARM mode
/tmp/ccdwkr9Y.s:200: Error: selected processor does not support `dmb ish' in ARM mode
/tmp/ccdwkr9Y.s:212: Error: selected processor does not support `dsb ishst' in ARM mode
/tmp/ccdwkr9Y.s:216: Error: selected processor does not support `sev' in ARM mode
/tmp/ccdwkr9Y.s:598: Error: selected processor does not support `dmb ish' in ARM mode
/tmp/ccdwkr9Y.s:623: Error: selected processor does not support `dmb ish' in ARM mode
/tmp/ccdwkr9Y.s:635: Error: selected processor does not support `dsb ishst' in ARM mode
/tmp/ccdwkr9Y.s:639: Error: selected processor does not support `sev' in ARM mode
/tmp/ccdwkr9Y.s:966: Error: selected processor does not support `dmb ish' in ARM mode
  CC [M]  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/pci.o
make[5]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303: /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/setup.o] Error 1
make[5]: *** Waiting for unfinished jobs....
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m-uart-demo.o
  DTC     /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/vpci_template.dtb
/tmp/ccITUo2X.s: Assembler messages:
/tmp/ccITUo2X.s:16: Error: architectural extension `virt' is not allowed for the current base architecture
/tmp/ccITUo2X.s:165: Error: selected processor does not support `dmb ish' in ARM mode
/tmp/ccITUo2X.s:229: Error: selected processor does not support `dmb ish' in ARM mode
/tmp/ccITUo2X.s:1324: Error: architectural extension `mp' is not allowed for the current base architecture
/tmp/ccITUo2X.s:1325: Error: selected processor does not support `pldw [r2]' in ARM mode
/tmp/ccITUo2X.s:1327: Error: selected processor does not support `ldrex r1,[r2]' in ARM mode
/tmp/ccITUo2X.s:1329: Error: selected processor does not support `strex r0,r3,[r2]' in ARM mode
/tmp/ccITUo2X.s:1352: Error: selected processor does not support `dmb ish' in ARM mode
/tmp/ccITUo2X.s:1373: Error: selected processor does not support `dmb ish' in ARM mode
/tmp/ccITUo2X.s:1386: Error: selected processor does not support `dsb ishst' in ARM mode
/tmp/ccITUo2X.s:1390: Error: selected processor does not support `sev' in ARM mode
/tmp/ccITUo2X.s:1420: Error: selected processor does not support `wfe' in ARM mode
/tmp/ccITUo2X.s:1485: Error: architectural extension `mp' is not allowed for the current base architecture
/tmp/ccITUo2X.s:1486: Error: selected processor does not support `pldw [r3]' in ARM mode
/tmp/ccITUo2X.s:1499: Error: selected processor does not support `ldrex lr,[r3]' in ARM mode
/tmp/ccITUo2X.s:1503: Error: selected processor does not support `strex ip,lr,[r3]' in ARM mode
make[5]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303: /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/printk.o] Error 1
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-demo.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-linux-demo.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1.o
/tmp/ccr5KeF1.s: Assembler messages:
/tmp/ccr5KeF1.s:16: Error: architectural extension `virt' is not allowed for the current base architecture
/tmp/ccr5KeF1.s:132: Error: selected processor does not support `rbit r3,r3' in ARM mode
/tmp/ccr5KeF1.s:305: Error: architectural extension `mp' is not allowed for the current base architecture
/tmp/ccr5KeF1.s:306: Error: selected processor does not support `pldw [r3]' in ARM mode
/tmp/ccr5KeF1.s:323: Error: selected processor does not support `ldrex ip,[r3]' in ARM mode
/tmp/ccr5KeF1.s:325: Error: selected processor does not support `strex r0,ip,[r3]' in ARM mode
/tmp/ccr5KeF1.s:431: Error: selected processor does not support `dsb ' in ARM mode
/tmp/ccr5KeF1.s:447: Error: selected processor does not support `dsb ' in ARM mode
/tmp/ccr5KeF1.s:451: Error: selected processor does not support `isb' in ARM mode
/tmp/ccr5KeF1.s:661: Error: architectural extension `mp' is not allowed for the current base architecture
/tmp/ccr5KeF1.s:662: Error: selected processor does not support `pldw [r2]' in ARM mode
/tmp/ccr5KeF1.s:682: Error: selected processor does not support `ldrex r0,[r2]' in ARM mode
/tmp/ccr5KeF1.s:684: Error: selected processor does not support `strex r1,r0,[r2]' in ARM mode
/tmp/ccr5KeF1.s:2634: Error: architectural extension `mp' is not allowed for the current base architecture
/tmp/ccr5KeF1.s:2635: Error: selected processor does not support `pldw [r3]' in ARM mode
/tmp/ccr5KeF1.s:2652: Error: selected processor does not support `ldrex lr,[r3]' in ARM mode
/tmp/ccr5KeF1.s:2654: Error: selected processor does not support `strex ip,lr,[r3]' in ARM mode
make[5]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303: /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/paging.o] Error 1
make[4]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:544: /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor] Error 2
  DTB     /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/vpci_template.dtb.S
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0-gic-demo.o
  AS [M]  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/vpci_template.dtb.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0-linux-demo.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0.o
  DTC     /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-bananapi.dtb
  DTC     /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-emtrion-emconrzg1e.dtb
  DTC     /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-emtrion-emconrzg1h.dtb
  DTC     /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-emtrion-emconrzg1m.dtb
  DTC     /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-jetson-tk1.dtb
  DTC     /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-orangepi0.dtb
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-gic-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-linux-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-uart-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-uart-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-linux-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h-linux-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h-uart-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m-linux-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m-uart-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-linux-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0-gic-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0-linux-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0.cell
  LD [M]  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/jailhouse.o
make[3]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/Makefile:1518: _module_/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git] Error 2
make[2]: *** [Makefile:146: sub-make] Error 2
make[1]: *** [Makefile:24: __sub-make] Error 2
make: *** [Makefile:40: modules] Error 2
ERROR: oe_runmake failed
WARNING: exit code 1 from a shell command.
ERROR: Execution of '/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/temp/run.do_compile.14598' failed with exit code 1:
  UPD     /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/include/generated/config.mk
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../alloc.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../cmdline.o
  UPD     /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/include/generated/version.h
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../printk.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-gic-demo.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../setup.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-linux-demo.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-uart-demo.o
  CC [M]  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/cell.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../string.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi.o
/tmp/ccWTZUPO.s: Assembler messages:
/tmp/ccWTZUPO.s:73: Error: selected processor does not support `cpsid if' in ARM mode
/tmp/ccWTZUPO.s:87: Error: selected processor does not support `wfi' in ARM mode
make[6]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303: /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../setup.o] Error 1
make[6]: *** Waiting for unfinished jobs....
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../uart-8250.o
  CC [M]  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/main.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/arch/arm/asm-defines.s
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-linux-demo.o
  LDS     /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/hypervisor.lds
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-uart-demo.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h-linux-demo.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/setup.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h-uart-demo.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h.o
/tmp/ccreteLO.s: Assembler messages:
/tmp/ccreteLO.s:186: Error: architectural extension `virt' is not allowed for the current base architecture
/tmp/ccreteLO.s:187: Error: selected processor does not support `hvc #0x4a48' in ARM mode
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/printk.o
make[6]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303: /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm/../arm-common/../printk.o] Error 1
make[5]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:544: /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates/lib/arm] Error 2
make[4]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:544: /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/inmates] Error 2
make[4]: *** Waiting for unfinished jobs....
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m-linux-demo.o
  CC [M]  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/sysfs.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/paging.o
/tmp/ccdwkr9Y.s: Assembler messages:
/tmp/ccdwkr9Y.s:16: Error: architectural extension `virt' is not allowed for the current base architecture
/tmp/ccdwkr9Y.s:42: Error: architectural extension `mp' is not allowed for the current base architecture
/tmp/ccdwkr9Y.s:43: Error: selected processor does not support `pldw [r2]' in ARM mode
/tmp/ccdwkr9Y.s:45: Error: selected processor does not support `ldrex r1,[r2]' in ARM mode
/tmp/ccdwkr9Y.s:47: Error: selected processor does not support `strex r0,r3,[r2]' in ARM mode
/tmp/ccdwkr9Y.s:70: Error: selected processor does not support `dmb ish' in ARM mode
/tmp/ccdwkr9Y.s:82: Error: selected processor does not support `wfe' in ARM mode
/tmp/ccdwkr9Y.s:179: Error: selected processor does not support `dmb ish' in ARM mode
/tmp/ccdwkr9Y.s:200: Error: selected processor does not support `dmb ish' in ARM mode
/tmp/ccdwkr9Y.s:212: Error: selected processor does not support `dsb ishst' in ARM mode
/tmp/ccdwkr9Y.s:216: Error: selected processor does not support `sev' in ARM mode
/tmp/ccdwkr9Y.s:598: Error: selected processor does not support `dmb ish' in ARM mode
/tmp/ccdwkr9Y.s:623: Error: selected processor does not support `dmb ish' in ARM mode
/tmp/ccdwkr9Y.s:635: Error: selected processor does not support `dsb ishst' in ARM mode
/tmp/ccdwkr9Y.s:639: Error: selected processor does not support `sev' in ARM mode
/tmp/ccdwkr9Y.s:966: Error: selected processor does not support `dmb ish' in ARM mode
  CC [M]  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/pci.o
make[5]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303: /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/setup.o] Error 1
make[5]: *** Waiting for unfinished jobs....
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m-uart-demo.o
  DTC     /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/vpci_template.dtb
/tmp/ccITUo2X.s: Assembler messages:
/tmp/ccITUo2X.s:16: Error: architectural extension `virt' is not allowed for the current base architecture
/tmp/ccITUo2X.s:165: Error: selected processor does not support `dmb ish' in ARM mode
/tmp/ccITUo2X.s:229: Error: selected processor does not support `dmb ish' in ARM mode
/tmp/ccITUo2X.s:1324: Error: architectural extension `mp' is not allowed for the current base architecture
/tmp/ccITUo2X.s:1325: Error: selected processor does not support `pldw [r2]' in ARM mode
/tmp/ccITUo2X.s:1327: Error: selected processor does not support `ldrex r1,[r2]' in ARM mode
/tmp/ccITUo2X.s:1329: Error: selected processor does not support `strex r0,r3,[r2]' in ARM mode
/tmp/ccITUo2X.s:1352: Error: selected processor does not support `dmb ish' in ARM mode
/tmp/ccITUo2X.s:1373: Error: selected processor does not support `dmb ish' in ARM mode
/tmp/ccITUo2X.s:1386: Error: selected processor does not support `dsb ishst' in ARM mode
/tmp/ccITUo2X.s:1390: Error: selected processor does not support `sev' in ARM mode
/tmp/ccITUo2X.s:1420: Error: selected processor does not support `wfe' in ARM mode
/tmp/ccITUo2X.s:1485: Error: architectural extension `mp' is not allowed for the current base architecture
/tmp/ccITUo2X.s:1486: Error: selected processor does not support `pldw [r3]' in ARM mode
/tmp/ccITUo2X.s:1499: Error: selected processor does not support `ldrex lr,[r3]' in ARM mode
/tmp/ccITUo2X.s:1503: Error: selected processor does not support `strex ip,lr,[r3]' in ARM mode
make[5]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303: /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/printk.o] Error 1
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-demo.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-linux-demo.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1.o
/tmp/ccr5KeF1.s: Assembler messages:
/tmp/ccr5KeF1.s:16: Error: architectural extension `virt' is not allowed for the current base architecture
/tmp/ccr5KeF1.s:132: Error: selected processor does not support `rbit r3,r3' in ARM mode
/tmp/ccr5KeF1.s:305: Error: architectural extension `mp' is not allowed for the current base architecture
/tmp/ccr5KeF1.s:306: Error: selected processor does not support `pldw [r3]' in ARM mode
/tmp/ccr5KeF1.s:323: Error: selected processor does not support `ldrex ip,[r3]' in ARM mode
/tmp/ccr5KeF1.s:325: Error: selected processor does not support `strex r0,ip,[r3]' in ARM mode
/tmp/ccr5KeF1.s:431: Error: selected processor does not support `dsb ' in ARM mode
/tmp/ccr5KeF1.s:447: Error: selected processor does not support `dsb ' in ARM mode
/tmp/ccr5KeF1.s:451: Error: selected processor does not support `isb' in ARM mode
/tmp/ccr5KeF1.s:661: Error: architectural extension `mp' is not allowed for the current base architecture
/tmp/ccr5KeF1.s:662: Error: selected processor does not support `pldw [r2]' in ARM mode
/tmp/ccr5KeF1.s:682: Error: selected processor does not support `ldrex r0,[r2]' in ARM mode
/tmp/ccr5KeF1.s:684: Error: selected processor does not support `strex r1,r0,[r2]' in ARM mode
/tmp/ccr5KeF1.s:2634: Error: architectural extension `mp' is not allowed for the current base architecture
/tmp/ccr5KeF1.s:2635: Error: selected processor does not support `pldw [r3]' in ARM mode
/tmp/ccr5KeF1.s:2652: Error: selected processor does not support `ldrex lr,[r3]' in ARM mode
/tmp/ccr5KeF1.s:2654: Error: selected processor does not support `strex ip,lr,[r3]' in ARM mode
make[5]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:303: /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor/paging.o] Error 1
make[4]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/scripts/Makefile.build:544: /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/hypervisor] Error 2
  DTB     /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/vpci_template.dtb.S
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0-gic-demo.o
  AS [M]  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/vpci_template.dtb.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0-linux-demo.o
  CC      /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0.o
  DTC     /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-bananapi.dtb
  DTC     /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-emtrion-emconrzg1e.dtb
  DTC     /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-emtrion-emconrzg1h.dtb
  DTC     /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-emtrion-emconrzg1m.dtb
  DTC     /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-jetson-tk1.dtb
  DTC     /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/dts/inmate-orangepi0.dtb
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-gic-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-linux-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi-uart-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/bananapi.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-uart-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e-linux-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1e.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h-linux-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h-uart-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1h.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m-linux-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m-uart-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/emtrion-rzg1m.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1-linux-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/jetson-tk1.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0-gic-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0-linux-demo.cell
  OBJCOPY /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/configs/arm/orangepi0.cell
  LD [M]  /home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/driver/jailhouse.o
make[3]: *** [/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work-shared/orange-pi-zero/kernel-source/Makefile:1518: _module_/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git] Error 2
make[2]: *** [Makefile:146: sub-make] Error 2
make[1]: *** [Makefile:24: __sub-make] Error 2
make: *** [Makefile:40: modules] Error 2
WARNING: exit code 1 from a shell command.


------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=log.do_configure
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=log.do_configure
X-Attachment-Id: 839e50fc-048c-40b1-a8e1-f68abc9a439d
Content-ID: <839e50fc-048c-40b1-a8e1-f68abc9a439d>

DEBUG: Executing shell function do_configure
'/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/ci/jailhouse-config-banana-pi.h' -> '/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/include/jailhouse/config.h'
DEBUG: Shell function do_configure finished
DEBUG: Executing python function do_qa_configure
DEBUG: Python function do_qa_configure finished

------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=log.do_configure.14592
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=log.do_configure.14592
X-Attachment-Id: 564ffcda-3916-4ec8-852c-1b7e05ef01a1
Content-ID: <564ffcda-3916-4ec8-852c-1b7e05ef01a1>

DEBUG: Executing shell function do_configure
'/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/ci/jailhouse-config-banana-pi.h' -> '/home/cevat/Desktop/meta-orangepi/yocto/build_arm/tmp-glibc/work/orange_pi_zero-oe-linux-gnueabi/jailhouse/0.11-r0/git/include/jailhouse/config.h'
DEBUG: Shell function do_configure finished
DEBUG: Executing python function do_qa_configure
DEBUG: Python function do_qa_configure finished

------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=log.do_fetch
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=log.do_fetch
X-Attachment-Id: a8d3d9d0-a7c4-4d2e-8c41-1110ef5ecb37
Content-ID: <a8d3d9d0-a7c4-4d2e-8c41-1110ef5ecb37>

REVCVUc6IEV4ZWN1dGluZyBweXRob24gZnVuY3Rpb24gZXh0ZW5kX3JlY2lwZV9zeXNyb290Ck5P
VEU6IERpcmVjdCBkZXBlbmRlbmNpZXMgYXJlIFtdCk5PVEU6IEluc3RhbGxlZCBpbnRvIHN5c3Jv
b3Q6IFtdCk5PVEU6IFNraXBwaW5nIGFzIGFscmVhZHkgZXhpc3RzIGluIHN5c3Jvb3Q6IFtdCkRF
QlVHOiBQeXRob24gZnVuY3Rpb24gZXh0ZW5kX3JlY2lwZV9zeXNyb290IGZpbmlzaGVkCkRFQlVH
OiBFeGVjdXRpbmcgcHl0aG9uIGZ1bmN0aW9uIGRvX2ZldGNoCkRFQlVHOiBFeGVjdXRpbmcgcHl0
aG9uIGZ1bmN0aW9uIGJhc2VfZG9fZmV0Y2gKREVCVUc6IFRyeWluZyBQUkVNSVJST1JTCkRFQlVH
OiBUcnlpbmcgVXBzdHJlYW0KREVCVUc6IEZldGNoZXIgYWNjZXNzZWQgdGhlIG5ldHdvcmsgd2l0
aCB0aGUgY29tbWFuZCBMQU5HPUMgZ2l0IC1jIGNvcmUuZnN5bmNvYmplY3RmaWxlcz0wIGNsb25l
IC0tYmFyZSAtLW1pcnJvciBnaXQ6Ly9naXRodWIuY29tL3NpZW1lbnMvamFpbGhvdXNlIC9ob21l
L2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vZG93bmxvYWRzL2dp
dDIvZ2l0aHViLmNvbS5zaWVtZW5zLmphaWxob3VzZSAtLXByb2dyZXNzCkRFQlVHOiBSdW5uaW5n
IGV4cG9ydCBQU0VVRE9fRElTQUJMRUQ9MTsgdW5zZXQgX1BZVEhPTl9TWVNDT05GSUdEQVRBX05B
TUU7IGV4cG9ydCBEQlVTX1NFU1NJT05fQlVTX0FERFJFU1M9InVuaXg6YWJzdHJhY3Q9L3RtcC9k
YnVzLU9yVk5BaVVoMzkiOyBleHBvcnQgU1NIX0FVVEhfU09DSz0iL3J1bi91c2VyLzEwMDAva2V5
cmluZy9zc2giOyBleHBvcnQgUEFUSD0iL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBp
L3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1n
bnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmluL3B5
dGhvbi1uYXRpdmU6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL3Bva3kv
c2NyaXB0czovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJt
L3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNl
LzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vYXJtLW9lLWxpbnV4LWdudWVh
Ymk6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL3JlY2lwZS1zeXNyb290L3Vzci9iaW4vY3Jvc3NzY3JpcHRzOi9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3Bp
X3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1u
YXRpdmUvdXNyL3NiaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1
aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2ph
aWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmluOi9ob21lL2NldmF0
L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3Jh
bmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lz
cm9vdC1uYXRpdmUvc2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkv
amFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL2JpbjovaG9tZS9jZXZhdC9E
ZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vcG9reS9iaXRiYWtlL2JpbjovaG9tZS9jZXZhdC9E
ZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy9ob3N0dG9vbHMi
OyBleHBvcnQgSE9NRT0iL2hvbWUvY2V2YXQiOyBMQU5HPUMgZ2l0IC1jIGNvcmUuZnN5bmNvYmpl
Y3RmaWxlcz0wIGNsb25lIC0tYmFyZSAtLW1pcnJvciBnaXQ6Ly9naXRodWIuY29tL3NpZW1lbnMv
amFpbGhvdXNlIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9h
cm0vZG93bmxvYWRzL2dpdDIvZ2l0aHViLmNvbS5zaWVtZW5zLmphaWxob3VzZSAtLXByb2dyZXNz
CkNsb25pbmcgaW50byBiYXJlIHJlcG9zaXRvcnkgJy9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vZG93bmxvYWRzL2dpdDIvZ2l0aHViLmNvbS5zaWVtZW5z
LmphaWxob3VzZScuLi4KcmVtb3RlOiBFbnVtZXJhdGluZyBvYmplY3RzOiA2MCwgZG9uZS4gICAg
ICAgIApyZW1vdGU6IENvdW50aW5nIG9iamVjdHM6IDEwMCUgKDYwLzYwKSwgZG9uZS4gICAgICAg
IApyZW1vdGU6IENvbXByZXNzaW5nIG9iamVjdHM6IDEwMCUgKDQ4LzQ4KSwgZG9uZS4gICAgICAg
IApyZW1vdGU6IFRvdGFsIDIxNTM5IChkZWx0YSAxOSksIHJldXNlZCAyNiAoZGVsdGEgMTApLCBw
YWNrLXJldXNlZCAyMTQ3OSAgICAgICAgClJlY2VpdmluZyBvYmplY3RzOiAxMDAlICgyMTUzOS8y
MTUzOSksIDQuNTQgTWlCIHwgMS41MSBNaUIvcywgZG9uZS4KUmVzb2x2aW5nIGRlbHRhczogMTAw
JSAoMTUwNzUvMTUwNzUpLCBkb25lLgpDaGVja2luZyBjb25uZWN0aXZpdHkuLi4gZG9uZS4KREVC
VUc6IFJ1bm5pbmcgJ2V4cG9ydCBQU0VVRE9fRElTQUJMRUQ9MTsgdW5zZXQgX1BZVEhPTl9TWVND
T05GSUdEQVRBX05BTUU7IGV4cG9ydCBEQlVTX1NFU1NJT05fQlVTX0FERFJFU1M9InVuaXg6YWJz
dHJhY3Q9L3RtcC9kYnVzLU9yVk5BaVVoMzkiOyBleHBvcnQgU1NIX0FVVEhfU09DSz0iL3J1bi91
c2VyLzEwMDAva2V5cmluZy9zc2giOyBleHBvcnQgUEFUSD0iL2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVy
by1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2
ZS91c3IvYmluL3B5dGhvbi1uYXRpdmU6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBp
L3lvY3RvL3Bva3kvc2NyaXB0czovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vYXJtLW9l
LWxpbnV4LWdudWVhYmk6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1
aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2ph
aWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290L3Vzci9iaW4vY3Jvc3NzY3JpcHRzOi9ob21l
L2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dv
cmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNp
cGUtc3lzcm9vdC1uYXRpdmUvdXNyL3NiaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5n
ZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51
eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmlu
Oi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWds
aWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1y
MC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvc2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3Jh
bmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxp
bnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL2Jpbjov
aG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vcG9reS9iaXRiYWtlL2Jpbjov
aG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGli
Yy9ob3N0dG9vbHMiOyBleHBvcnQgSE9NRT0iL2hvbWUvY2V2YXQiOyBnaXQgLWMgY29yZS5mc3lu
Y29iamVjdGZpbGVzPTAgYnJhbmNoIC0tY29udGFpbnMgNTgwNTJhN2E5ZDFmNTkwNGQ3MmIxNjM3
MjgyYzg3NzE3MmVlNjlmNiAtLWxpc3QgbmV4dCAyPiAvZGV2L251bGwgfCB3YyAtbCcgaW4gL2hv
bWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS9kb3dubG9hZHMv
Z2l0Mi9naXRodWIuY29tLnNpZW1lbnMuamFpbGhvdXNlCkRFQlVHOiBSdW5uaW5nICdleHBvcnQg
UFNFVURPX0RJU0FCTEVEPTE7IHVuc2V0IF9QWVRIT05fU1lTQ09ORklHREFUQV9OQU1FOyBleHBv
cnQgREJVU19TRVNTSU9OX0JVU19BRERSRVNTPSJ1bml4OmFic3RyYWN0PS90bXAvZGJ1cy1PclZO
QWlVaDM5IjsgZXhwb3J0IFNTSF9BVVRIX1NPQ0s9Ii9ydW4vdXNlci8xMDAwL2tleXJpbmcvc3No
IjsgZXhwb3J0IFBBVEg9Ii9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9i
dWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9q
YWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2Jpbi9weXRob24tbmF0
aXZlOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9wb2t5L3NjcmlwdHM6
L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xp
YmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIw
L3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmluL2FybS1vZS1saW51eC1nbnVlYWJpOi9ob21l
L2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dv
cmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNp
cGUtc3lzcm9vdC91c3IvYmluL2Nyb3Nzc2NyaXB0czovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEt
b3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9l
LWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vz
ci9zYmluOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0v
dG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2Uv
MC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2JpbjovaG9tZS9jZXZhdC9EZXNrdG9w
L21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96
ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0
aXZlL3NiaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2Fy
bS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3Vz
ZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS9iaW46L2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL3Bva3kvYml0YmFrZS9iaW46L2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvaG9zdHRvb2xzIjsgZXhwb3J0
IEhPTUU9Ii9ob21lL2NldmF0IjsgZ2l0IC1jIGNvcmUuZnN5bmNvYmplY3RmaWxlcz0wIGJyYW5j
aCAtLWNvbnRhaW5zIDU4MDUyYTdhOWQxZjU5MDRkNzJiMTYzNzI4MmM4NzcxNzJlZTY5ZjYgLS1s
aXN0IG5leHQgMj4gL2Rldi9udWxsIHwgd2MgLWwnIGluIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0
YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vZG93bmxvYWRzL2dpdDIvZ2l0aHViLmNvbS5zaWVt
ZW5zLmphaWxob3VzZQpERUJVRzogU2VhcmNoaW5nIGZvciAwMDAxLWZpeC1tYWtlZmlsZXMucGF0
Y2ggaW4gcGF0aHM6CiAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
bWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWphaWxob3VzZS9qYWlsaG91c2UvamFpbGhvdXNlLTAuMTEv
b3JhbmdlcGkKICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRh
LW9yYW5nZXBpL3JlY2lwZXMtamFpbGhvdXNlL2phaWxob3VzZS9qYWlsaG91c2Uvb3JhbmdlcGkK
ICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9yYW5nZXBp
L3JlY2lwZXMtamFpbGhvdXNlL2phaWxob3VzZS9maWxlcy9vcmFuZ2VwaQogICAgL2hvbWUvY2V2
YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWls
aG91c2UvamFpbGhvdXNlL2phaWxob3VzZS0wLjExL29yYW5nZS1waS16ZXJvCiAgICAvaG9tZS9j
ZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWph
aWxob3VzZS9qYWlsaG91c2UvamFpbGhvdXNlL29yYW5nZS1waS16ZXJvCiAgICAvaG9tZS9jZXZh
dC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWphaWxo
b3VzZS9qYWlsaG91c2UvZmlsZXMvb3JhbmdlLXBpLXplcm8KICAgIC9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9yYW5nZXBpL3JlY2lwZXMtamFpbGhvdXNlL2ph
aWxob3VzZS9qYWlsaG91c2UtMC4xMS9zdW44aQogICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRh
LW9yYW5nZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWlsaG91c2UvamFpbGhvdXNl
L2phaWxob3VzZS9zdW44aQogICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lv
Y3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWlsaG91c2UvamFpbGhvdXNlL2ZpbGVzL3N1bjhp
CiAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vbWV0YS1vcmFuZ2Vw
aS9yZWNpcGVzLWphaWxob3VzZS9qYWlsaG91c2UvamFpbGhvdXNlLTAuMTEvYXJtdjd2ZQogICAg
L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVj
aXBlcy1qYWlsaG91c2UvamFpbGhvdXNlL2phaWxob3VzZS9hcm12N3ZlCiAgICAvaG9tZS9jZXZh
dC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWphaWxo
b3VzZS9qYWlsaG91c2UvZmlsZXMvYXJtdjd2ZQogICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRh
LW9yYW5nZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWlsaG91c2UvamFpbGhvdXNl
L2phaWxob3VzZS0wLjExL2FybQogICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBp
L3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWlsaG91c2UvamFpbGhvdXNlL2phaWxob3Vz
ZS9hcm0KICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9y
YW5nZXBpL3JlY2lwZXMtamFpbGhvdXNlL2phaWxob3VzZS9maWxlcy9hcm0KICAgIC9ob21lL2Nl
dmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9yYW5nZXBpL3JlY2lwZXMtamFp
bGhvdXNlL2phaWxob3VzZS9qYWlsaG91c2UtMC4xMS8KICAgIC9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9yYW5nZXBpL3JlY2lwZXMtamFpbGhvdXNlL2phaWxo
b3VzZS9qYWlsaG91c2UvCiAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWphaWxob3VzZS9qYWlsaG91c2UvZmlsZXMvCkRFQlVH
OiBQeXRob24gZnVuY3Rpb24gYmFzZV9kb19mZXRjaCBmaW5pc2hlZApERUJVRzogUHl0aG9uIGZ1
bmN0aW9uIGRvX2ZldGNoIGZpbmlzaGVkCkRFQlVHOiBFeGVjdXRpbmcgcHl0aG9uIGZ1bmN0aW9u
IHdyaXRlX3NyY3JldgpERUJVRzogUHl0aG9uIGZ1bmN0aW9uIHdyaXRlX3NyY3JldiBmaW5pc2hl
ZAo=
------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=log.do_fetch.14470
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=log.do_fetch.14470
X-Attachment-Id: 6596344d-1919-408c-a658-c51760bf1423
Content-ID: <6596344d-1919-408c-a658-c51760bf1423>

REVCVUc6IEV4ZWN1dGluZyBweXRob24gZnVuY3Rpb24gZXh0ZW5kX3JlY2lwZV9zeXNyb290Ck5P
VEU6IERpcmVjdCBkZXBlbmRlbmNpZXMgYXJlIFtdCk5PVEU6IEluc3RhbGxlZCBpbnRvIHN5c3Jv
b3Q6IFtdCk5PVEU6IFNraXBwaW5nIGFzIGFscmVhZHkgZXhpc3RzIGluIHN5c3Jvb3Q6IFtdCkRF
QlVHOiBQeXRob24gZnVuY3Rpb24gZXh0ZW5kX3JlY2lwZV9zeXNyb290IGZpbmlzaGVkCkRFQlVH
OiBFeGVjdXRpbmcgcHl0aG9uIGZ1bmN0aW9uIGRvX2ZldGNoCkRFQlVHOiBFeGVjdXRpbmcgcHl0
aG9uIGZ1bmN0aW9uIGJhc2VfZG9fZmV0Y2gKREVCVUc6IFRyeWluZyBQUkVNSVJST1JTCkRFQlVH
OiBUcnlpbmcgVXBzdHJlYW0KREVCVUc6IEZldGNoZXIgYWNjZXNzZWQgdGhlIG5ldHdvcmsgd2l0
aCB0aGUgY29tbWFuZCBMQU5HPUMgZ2l0IC1jIGNvcmUuZnN5bmNvYmplY3RmaWxlcz0wIGNsb25l
IC0tYmFyZSAtLW1pcnJvciBnaXQ6Ly9naXRodWIuY29tL3NpZW1lbnMvamFpbGhvdXNlIC9ob21l
L2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vZG93bmxvYWRzL2dp
dDIvZ2l0aHViLmNvbS5zaWVtZW5zLmphaWxob3VzZSAtLXByb2dyZXNzCkRFQlVHOiBSdW5uaW5n
IGV4cG9ydCBQU0VVRE9fRElTQUJMRUQ9MTsgdW5zZXQgX1BZVEhPTl9TWVNDT05GSUdEQVRBX05B
TUU7IGV4cG9ydCBEQlVTX1NFU1NJT05fQlVTX0FERFJFU1M9InVuaXg6YWJzdHJhY3Q9L3RtcC9k
YnVzLU9yVk5BaVVoMzkiOyBleHBvcnQgU1NIX0FVVEhfU09DSz0iL3J1bi91c2VyLzEwMDAva2V5
cmluZy9zc2giOyBleHBvcnQgUEFUSD0iL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBp
L3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1n
bnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmluL3B5
dGhvbi1uYXRpdmU6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL3Bva3kv
c2NyaXB0czovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJt
L3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNl
LzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vYXJtLW9lLWxpbnV4LWdudWVh
Ymk6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL3JlY2lwZS1zeXNyb290L3Vzci9iaW4vY3Jvc3NzY3JpcHRzOi9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3Bp
X3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1u
YXRpdmUvdXNyL3NiaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1
aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2ph
aWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmluOi9ob21lL2NldmF0
L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3Jh
bmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lz
cm9vdC1uYXRpdmUvc2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkv
amFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL2JpbjovaG9tZS9jZXZhdC9E
ZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vcG9reS9iaXRiYWtlL2JpbjovaG9tZS9jZXZhdC9E
ZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy9ob3N0dG9vbHMi
OyBleHBvcnQgSE9NRT0iL2hvbWUvY2V2YXQiOyBMQU5HPUMgZ2l0IC1jIGNvcmUuZnN5bmNvYmpl
Y3RmaWxlcz0wIGNsb25lIC0tYmFyZSAtLW1pcnJvciBnaXQ6Ly9naXRodWIuY29tL3NpZW1lbnMv
amFpbGhvdXNlIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9h
cm0vZG93bmxvYWRzL2dpdDIvZ2l0aHViLmNvbS5zaWVtZW5zLmphaWxob3VzZSAtLXByb2dyZXNz
CkNsb25pbmcgaW50byBiYXJlIHJlcG9zaXRvcnkgJy9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vZG93bmxvYWRzL2dpdDIvZ2l0aHViLmNvbS5zaWVtZW5z
LmphaWxob3VzZScuLi4KcmVtb3RlOiBFbnVtZXJhdGluZyBvYmplY3RzOiA2MCwgZG9uZS4gICAg
ICAgIApyZW1vdGU6IENvdW50aW5nIG9iamVjdHM6IDEwMCUgKDYwLzYwKSwgZG9uZS4gICAgICAg
IApyZW1vdGU6IENvbXByZXNzaW5nIG9iamVjdHM6IDEwMCUgKDQ4LzQ4KSwgZG9uZS4gICAgICAg
IApyZW1vdGU6IFRvdGFsIDIxNTM5IChkZWx0YSAxOSksIHJldXNlZCAyNiAoZGVsdGEgMTApLCBw
YWNrLXJldXNlZCAyMTQ3OSAgICAgICAgClJlY2VpdmluZyBvYmplY3RzOiAxMDAlICgyMTUzOS8y
MTUzOSksIDQuNTQgTWlCIHwgMS41MSBNaUIvcywgZG9uZS4KUmVzb2x2aW5nIGRlbHRhczogMTAw
JSAoMTUwNzUvMTUwNzUpLCBkb25lLgpDaGVja2luZyBjb25uZWN0aXZpdHkuLi4gZG9uZS4KREVC
VUc6IFJ1bm5pbmcgJ2V4cG9ydCBQU0VVRE9fRElTQUJMRUQ9MTsgdW5zZXQgX1BZVEhPTl9TWVND
T05GSUdEQVRBX05BTUU7IGV4cG9ydCBEQlVTX1NFU1NJT05fQlVTX0FERFJFU1M9InVuaXg6YWJz
dHJhY3Q9L3RtcC9kYnVzLU9yVk5BaVVoMzkiOyBleHBvcnQgU1NIX0FVVEhfU09DSz0iL3J1bi91
c2VyLzEwMDAva2V5cmluZy9zc2giOyBleHBvcnQgUEFUSD0iL2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVy
by1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2
ZS91c3IvYmluL3B5dGhvbi1uYXRpdmU6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBp
L3lvY3RvL3Bva3kvc2NyaXB0czovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vYXJtLW9l
LWxpbnV4LWdudWVhYmk6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1
aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2ph
aWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290L3Vzci9iaW4vY3Jvc3NzY3JpcHRzOi9ob21l
L2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dv
cmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNp
cGUtc3lzcm9vdC1uYXRpdmUvdXNyL3NiaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5n
ZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51
eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmlu
Oi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWds
aWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1y
MC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvc2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3Jh
bmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxp
bnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL2Jpbjov
aG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vcG9reS9iaXRiYWtlL2Jpbjov
aG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGli
Yy9ob3N0dG9vbHMiOyBleHBvcnQgSE9NRT0iL2hvbWUvY2V2YXQiOyBnaXQgLWMgY29yZS5mc3lu
Y29iamVjdGZpbGVzPTAgYnJhbmNoIC0tY29udGFpbnMgNTgwNTJhN2E5ZDFmNTkwNGQ3MmIxNjM3
MjgyYzg3NzE3MmVlNjlmNiAtLWxpc3QgbmV4dCAyPiAvZGV2L251bGwgfCB3YyAtbCcgaW4gL2hv
bWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS9kb3dubG9hZHMv
Z2l0Mi9naXRodWIuY29tLnNpZW1lbnMuamFpbGhvdXNlCkRFQlVHOiBSdW5uaW5nICdleHBvcnQg
UFNFVURPX0RJU0FCTEVEPTE7IHVuc2V0IF9QWVRIT05fU1lTQ09ORklHREFUQV9OQU1FOyBleHBv
cnQgREJVU19TRVNTSU9OX0JVU19BRERSRVNTPSJ1bml4OmFic3RyYWN0PS90bXAvZGJ1cy1PclZO
QWlVaDM5IjsgZXhwb3J0IFNTSF9BVVRIX1NPQ0s9Ii9ydW4vdXNlci8xMDAwL2tleXJpbmcvc3No
IjsgZXhwb3J0IFBBVEg9Ii9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9i
dWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9q
YWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2Jpbi9weXRob24tbmF0
aXZlOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9wb2t5L3NjcmlwdHM6
L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xp
YmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIw
L3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmluL2FybS1vZS1saW51eC1nbnVlYWJpOi9ob21l
L2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dv
cmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNp
cGUtc3lzcm9vdC91c3IvYmluL2Nyb3Nzc2NyaXB0czovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEt
b3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9l
LWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vz
ci9zYmluOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0v
dG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2Uv
MC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2JpbjovaG9tZS9jZXZhdC9EZXNrdG9w
L21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96
ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0
aXZlL3NiaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2Fy
bS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3Vz
ZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS9iaW46L2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL3Bva3kvYml0YmFrZS9iaW46L2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvaG9zdHRvb2xzIjsgZXhwb3J0
IEhPTUU9Ii9ob21lL2NldmF0IjsgZ2l0IC1jIGNvcmUuZnN5bmNvYmplY3RmaWxlcz0wIGJyYW5j
aCAtLWNvbnRhaW5zIDU4MDUyYTdhOWQxZjU5MDRkNzJiMTYzNzI4MmM4NzcxNzJlZTY5ZjYgLS1s
aXN0IG5leHQgMj4gL2Rldi9udWxsIHwgd2MgLWwnIGluIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0
YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vZG93bmxvYWRzL2dpdDIvZ2l0aHViLmNvbS5zaWVt
ZW5zLmphaWxob3VzZQpERUJVRzogU2VhcmNoaW5nIGZvciAwMDAxLWZpeC1tYWtlZmlsZXMucGF0
Y2ggaW4gcGF0aHM6CiAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
bWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWphaWxob3VzZS9qYWlsaG91c2UvamFpbGhvdXNlLTAuMTEv
b3JhbmdlcGkKICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRh
LW9yYW5nZXBpL3JlY2lwZXMtamFpbGhvdXNlL2phaWxob3VzZS9qYWlsaG91c2Uvb3JhbmdlcGkK
ICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9yYW5nZXBp
L3JlY2lwZXMtamFpbGhvdXNlL2phaWxob3VzZS9maWxlcy9vcmFuZ2VwaQogICAgL2hvbWUvY2V2
YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWls
aG91c2UvamFpbGhvdXNlL2phaWxob3VzZS0wLjExL29yYW5nZS1waS16ZXJvCiAgICAvaG9tZS9j
ZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWph
aWxob3VzZS9qYWlsaG91c2UvamFpbGhvdXNlL29yYW5nZS1waS16ZXJvCiAgICAvaG9tZS9jZXZh
dC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWphaWxo
b3VzZS9qYWlsaG91c2UvZmlsZXMvb3JhbmdlLXBpLXplcm8KICAgIC9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9yYW5nZXBpL3JlY2lwZXMtamFpbGhvdXNlL2ph
aWxob3VzZS9qYWlsaG91c2UtMC4xMS9zdW44aQogICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRh
LW9yYW5nZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWlsaG91c2UvamFpbGhvdXNl
L2phaWxob3VzZS9zdW44aQogICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lv
Y3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWlsaG91c2UvamFpbGhvdXNlL2ZpbGVzL3N1bjhp
CiAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vbWV0YS1vcmFuZ2Vw
aS9yZWNpcGVzLWphaWxob3VzZS9qYWlsaG91c2UvamFpbGhvdXNlLTAuMTEvYXJtdjd2ZQogICAg
L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVj
aXBlcy1qYWlsaG91c2UvamFpbGhvdXNlL2phaWxob3VzZS9hcm12N3ZlCiAgICAvaG9tZS9jZXZh
dC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWphaWxo
b3VzZS9qYWlsaG91c2UvZmlsZXMvYXJtdjd2ZQogICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRh
LW9yYW5nZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWlsaG91c2UvamFpbGhvdXNl
L2phaWxob3VzZS0wLjExL2FybQogICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBp
L3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWlsaG91c2UvamFpbGhvdXNlL2phaWxob3Vz
ZS9hcm0KICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9y
YW5nZXBpL3JlY2lwZXMtamFpbGhvdXNlL2phaWxob3VzZS9maWxlcy9hcm0KICAgIC9ob21lL2Nl
dmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9yYW5nZXBpL3JlY2lwZXMtamFp
bGhvdXNlL2phaWxob3VzZS9qYWlsaG91c2UtMC4xMS8KICAgIC9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9yYW5nZXBpL3JlY2lwZXMtamFpbGhvdXNlL2phaWxo
b3VzZS9qYWlsaG91c2UvCiAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWphaWxob3VzZS9qYWlsaG91c2UvZmlsZXMvCkRFQlVH
OiBQeXRob24gZnVuY3Rpb24gYmFzZV9kb19mZXRjaCBmaW5pc2hlZApERUJVRzogUHl0aG9uIGZ1
bmN0aW9uIGRvX2ZldGNoIGZpbmlzaGVkCkRFQlVHOiBFeGVjdXRpbmcgcHl0aG9uIGZ1bmN0aW9u
IHdyaXRlX3NyY3JldgpERUJVRzogUHl0aG9uIGZ1bmN0aW9uIHdyaXRlX3NyY3JldiBmaW5pc2hl
ZAo=
------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=log.do_patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=log.do_patch
X-Attachment-Id: 504bf807-e656-472c-a7f6-fa4278a9d4dc
Content-ID: <504bf807-e656-472c-a7f6-fa4278a9d4dc>

DEBUG: Executing python function extend_recipe_sysroot
NOTE: Direct dependencies are ['/home/cevat/Desktop/meta-orangepi/yocto/poky/meta/recipes-devtools/quilt/quilt-native_0.66.bb:do_populate_sysroot']
NOTE: Installed into sysroot: []
NOTE: Skipping as already exists in sysroot: ['quilt-native']
DEBUG: Python function extend_recipe_sysroot finished
DEBUG: Executing python function do_patch
DEBUG: Executing python function patch_do_patch
DEBUG: Searching for 0001-fix-makefiles.patch in paths:
    /home/cevat/Desktop/meta-orangepi/yocto/meta-orangepi/recipes-jailhouse/jailhouse/jailhouse-0.11/orangepi
    /home/cevat/Desktop/meta-orangepi/yocto/meta-orangepi/recipes-jailhouse/jailhouse/jailhouse/orangepi
    /home/cevat/Desktop/meta-orangepi/yocto/meta-orangepi/recipes-jailhouse/jailhouse/files/orangepi
    /home/cevat/Desktop/meta-orangepi/yocto/meta-orangepi/recipes-jailhouse/jailhouse/jailhouse-0.11/orange-pi-zero
    /home/cevat/Desktop/meta-orangepi/yocto/meta-orangepi/recipes-jailhouse/jailhouse/jailhouse/orange-pi-zero
    /home/cevat/Desktop/meta-orangepi/yocto/meta-orangepi/recipes-jailhouse/jailhouse/files/orange-pi-zero
    /home/cevat/Desktop/meta-orangepi/yocto/meta-orangepi/recipes-jailhouse/jailhouse/jailhouse-0.11/sun8i
    /home/cevat/Desktop/meta-orangepi/yocto/meta-orangepi/recipes-jailhouse/jailhouse/jailhouse/sun8i
    /home/cevat/Desktop/meta-orangepi/yocto/meta-orangepi/recipes-jailhouse/jailhouse/files/sun8i
    /home/cevat/Desktop/meta-orangepi/yocto/meta-orangepi/recipes-jailhouse/jailhouse/jailhouse-0.11/armv7ve
    /home/cevat/Desktop/meta-orangepi/yocto/meta-orangepi/recipes-jailhouse/jailhouse/jailhouse/armv7ve
    /home/cevat/Desktop/meta-orangepi/yocto/meta-orangepi/recipes-jailhouse/jailhouse/files/armv7ve
    /home/cevat/Desktop/meta-orangepi/yocto/meta-orangepi/recipes-jailhouse/jailhouse/jailhouse-0.11/arm
    /home/cevat/Desktop/meta-orangepi/yocto/meta-orangepi/recipes-jailhouse/jailhouse/jailhouse/arm
    /home/cevat/Desktop/meta-orangepi/yocto/meta-orangepi/recipes-jailhouse/jailhouse/files/arm
    /home/cevat/Desktop/meta-orangepi/yocto/meta-orangepi/recipes-jailhouse/jailhouse/jailhouse-0.11/
    /home/cevat/Desktop/meta-orangepi/yocto/meta-orangepi/recipes-jailhouse/jailhouse/jailhouse/
    /home/cevat/Desktop/meta-orangepi/yocto/meta-orangepi/recipes-jailhouse/jailhouse/files/
NOTE: Applying patch '0001-fix-makefiles.patch' (../meta-orangepi/recipes-jailhouse/jailhouse/jailhouse/0001-fix-makefiles.patch)
DEBUG: Python function patch_do_patch finished
DEBUG: Python function do_patch finished
DEBUG: Executing python function do_qa_patch
DEBUG: Python function do_qa_patch finished

------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=log.do_patch.14518
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=log.do_patch.14518
X-Attachment-Id: 9d6c6fb3-39f2-4697-b0a7-6dae71b62164
Content-ID: <9d6c6fb3-39f2-4697-b0a7-6dae71b62164>

DEBUG: Executing python function extend_recipe_sysroot
NOTE: Direct dependencies are ['/home/cevat/Desktop/meta-orangepi/yocto/poky/meta/recipes-devtools/quilt/quilt-native_0.66.bb:do_populate_sysroot']
NOTE: Installed into sysroot: []
NOTE: Skipping as already exists in sysroot: ['quilt-native']
DEBUG: Python function extend_recipe_sysroot finished
DEBUG: Executing python function do_patch
DEBUG: Executing python function patch_do_patch
DEBUG: Searching for 0001-fix-makefiles.patch in paths:
    /home/cevat/Desktop/meta-orangepi/yocto/meta-orangepi/recipes-jailhouse/jailhouse/jailhouse-0.11/orangepi
    /home/cevat/Desktop/meta-orangepi/yocto/meta-orangepi/recipes-jailhouse/jailhouse/jailhouse/orangepi
    /home/cevat/Desktop/meta-orangepi/yocto/meta-orangepi/recipes-jailhouse/jailhouse/files/orangepi
    /home/cevat/Desktop/meta-orangepi/yocto/meta-orangepi/recipes-jailhouse/jailhouse/jailhouse-0.11/orange-pi-zero
    /home/cevat/Desktop/meta-orangepi/yocto/meta-orangepi/recipes-jailhouse/jailhouse/jailhouse/orange-pi-zero
    /home/cevat/Desktop/meta-orangepi/yocto/meta-orangepi/recipes-jailhouse/jailhouse/files/orange-pi-zero
    /home/cevat/Desktop/meta-orangepi/yocto/meta-orangepi/recipes-jailhouse/jailhouse/jailhouse-0.11/sun8i
    /home/cevat/Desktop/meta-orangepi/yocto/meta-orangepi/recipes-jailhouse/jailhouse/jailhouse/sun8i
    /home/cevat/Desktop/meta-orangepi/yocto/meta-orangepi/recipes-jailhouse/jailhouse/files/sun8i
    /home/cevat/Desktop/meta-orangepi/yocto/meta-orangepi/recipes-jailhouse/jailhouse/jailhouse-0.11/armv7ve
    /home/cevat/Desktop/meta-orangepi/yocto/meta-orangepi/recipes-jailhouse/jailhouse/jailhouse/armv7ve
    /home/cevat/Desktop/meta-orangepi/yocto/meta-orangepi/recipes-jailhouse/jailhouse/files/armv7ve
    /home/cevat/Desktop/meta-orangepi/yocto/meta-orangepi/recipes-jailhouse/jailhouse/jailhouse-0.11/arm
    /home/cevat/Desktop/meta-orangepi/yocto/meta-orangepi/recipes-jailhouse/jailhouse/jailhouse/arm
    /home/cevat/Desktop/meta-orangepi/yocto/meta-orangepi/recipes-jailhouse/jailhouse/files/arm
    /home/cevat/Desktop/meta-orangepi/yocto/meta-orangepi/recipes-jailhouse/jailhouse/jailhouse-0.11/
    /home/cevat/Desktop/meta-orangepi/yocto/meta-orangepi/recipes-jailhouse/jailhouse/jailhouse/
    /home/cevat/Desktop/meta-orangepi/yocto/meta-orangepi/recipes-jailhouse/jailhouse/files/
NOTE: Applying patch '0001-fix-makefiles.patch' (../meta-orangepi/recipes-jailhouse/jailhouse/jailhouse/0001-fix-makefiles.patch)
DEBUG: Python function patch_do_patch finished
DEBUG: Python function do_patch finished
DEBUG: Executing python function do_qa_patch
DEBUG: Python function do_qa_patch finished

------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=log.do_populate_lic
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=log.do_populate_lic
X-Attachment-Id: fe018d2b-3297-49ad-870b-2e2ade8a0f88
Content-ID: <fe018d2b-3297-49ad-870b-2e2ade8a0f88>

REVCVUc6IEV4ZWN1dGluZyBweXRob24gZnVuY3Rpb24gc3N0YXRlX3Rhc2tfcHJlZnVuYwpERUJV
RzogUHl0aG9uIGZ1bmN0aW9uIHNzdGF0ZV90YXNrX3ByZWZ1bmMgZmluaXNoZWQKREVCVUc6IEV4
ZWN1dGluZyBweXRob24gZnVuY3Rpb24gZG9fcG9wdWxhdGVfbGljCldBUk5JTkc6IGphaWxob3Vz
ZTogTm8gZ2VuZXJpYyBsaWNlbnNlIGZpbGUgZXhpc3RzIGZvcjogQlNELTItY2xhdXNlIGluIGFu
eSBwcm92aWRlcgpERUJVRzogUHl0aG9uIGZ1bmN0aW9uIGRvX3BvcHVsYXRlX2xpYyBmaW5pc2hl
ZApERUJVRzogRXhlY3V0aW5nIHB5dGhvbiBmdW5jdGlvbiBwb3B1bGF0ZV9saWNfcWFfY2hlY2tz
dW0KTk9URTogamFpbGhvdXNlOiBtZDUgY2hlY2tzdW0gbWF0Y2hlZCBmb3IgZmlsZTovL0NPUFlJ
Tkc7bWQ1PTlmYTdmODk1Zjk2YmRlMmQ0N2ZkNWI3ZDk1YjZiYTRkCkRFQlVHOiBQeXRob24gZnVu
Y3Rpb24gcG9wdWxhdGVfbGljX3FhX2NoZWNrc3VtIGZpbmlzaGVkCkRFQlVHOiBFeGVjdXRpbmcg
cHl0aG9uIGZ1bmN0aW9uIHNzdGF0ZV90YXNrX3Bvc3RmdW5jCkRFQlVHOiBQcmVwYXJpbmcgdHJl
ZSAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1n
bGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEt
cjAvbGljZW5zZS1kZXN0ZGlyIGZvciBwYWNrYWdpbmcgYXQgL2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVy
by1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3NzdGF0ZS1idWlsZC1wb3B1bGF0
ZV9saWMvbGljZW5zZS1kZXN0ZGlyCkRFQlVHOiBFeGVjdXRpbmcgcHl0aG9uIGZ1bmN0aW9uIHNz
dGF0ZV9oYXJkY29kZV9wYXRoCk5PVEU6IFJlbW92aW5nIGhhcmRjb2RlZCBwYXRocyBmcm9tIHNz
dGF0ZSBwYWNrYWdlOiAnZmluZCAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjAvc3N0YXRlLWJ1aWxkLXBvcHVsYXRlX2xpYy8gXCggLW5hbWUg
IioubGEiIC1vIC1uYW1lICIqLWNvbmZpZyIgLW8gLW5hbWUgIipfY29uZmlnIiAtbyAtbmFtZSAi
cG9zdGluc3QtKiIgXCkgLXR5cGUgZiB8IHhhcmdzIGdyZXAgLWwgLWUgJy9ob21lL2NldmF0L0Rl
c2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3Jhbmdl
X3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9v
dCcgLWUgJy9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0v
dG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2Uv
MC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUnIC1lICcvaG9tZS9jZXZhdC9EZXNrdG9wL21l
dGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy9ob3N0dG9vbHMnIHwgdGVlIC9o
b21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJj
L3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9z
c3RhdGUtYnVpbGQtcG9wdWxhdGVfbGljL2ZpeG1lcGF0aCB8IHhhcmdzIC0tbm8tcnVuLWlmLWVt
cHR5IHNlZCAtaSAtZSAnczovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkv
amFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlOkZJWE1FU1RBR0lOR0RJUkhP
U1Q6ZycgLWUgJ3M6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxk
X2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxo
b3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290OkZJWE1FU1RBR0lOR0RJUlRBUkdFVDpnJyAtZSAn
czovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1n
bGliYy9ob3N0dG9vbHM6RklYTUVfSE9TVFRPT0xTX0RJUjpnJycKREVCVUc6IFB5dGhvbiBmdW5j
dGlvbiBzc3RhdGVfaGFyZGNvZGVfcGF0aCBmaW5pc2hlZApERUJVRzogRXhlY3V0aW5nIHB5dGhv
biBmdW5jdGlvbiBzc3RhdGVfcmVwb3J0X3VuaWhhc2gKREVCVUc6IFB5dGhvbiBmdW5jdGlvbiBz
c3RhdGVfcmVwb3J0X3VuaWhhc2ggZmluaXNoZWQKREVCVUc6IEV4ZWN1dGluZyBzaGVsbCBmdW5j
dGlvbiBzc3RhdGVfY3JlYXRlX3BhY2thZ2UKREVCVUc6IFNoZWxsIGZ1bmN0aW9uIHNzdGF0ZV9j
cmVhdGVfcGFja2FnZSBmaW5pc2hlZApERUJVRzogRXhlY3V0aW5nIHB5dGhvbiBmdW5jdGlvbiBz
c3RhdGVfaGFyZGNvZGVfcGF0aF91bnBhY2sKREVCVUc6IFB5dGhvbiBmdW5jdGlvbiBzc3RhdGVf
aGFyZGNvZGVfcGF0aF91bnBhY2sgZmluaXNoZWQKREVCVUc6IEV4ZWN1dGluZyBweXRob24gZnVu
Y3Rpb24gYnVpbGRoaXN0b3J5X2VtaXRfb3V0cHV0c2lncwpERUJVRzogUHl0aG9uIGZ1bmN0aW9u
IGJ1aWxkaGlzdG9yeV9lbWl0X291dHB1dHNpZ3MgZmluaXNoZWQKREVCVUc6IFN0YWdpbmcgZmls
ZXMgZnJvbSAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJt
L3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNl
LzAuMTEtcjAvbGljZW5zZS1kZXN0ZGlyIHRvIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFu
Z2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL2RlcGxveS9saWNlbnNlcwpERUJVRzogRXhl
Y3V0aW5nIHB5dGhvbiBmdW5jdGlvbiBidWlsZGhpc3RvcnlfZW1pdF9wa2doaXN0b3J5CkRFQlVH
OiBQeXRob24gZnVuY3Rpb24gYnVpbGRoaXN0b3J5X2VtaXRfcGtnaGlzdG9yeSBmaW5pc2hlZApE
RUJVRzogUHl0aG9uIGZ1bmN0aW9uIHNzdGF0ZV90YXNrX3Bvc3RmdW5jIGZpbmlzaGVkCg==
------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=log.do_populate_lic.14593
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=log.do_populate_lic.14593
X-Attachment-Id: 5c736f28-9bb5-4a02-8e45-d6198e714c1a
Content-ID: <5c736f28-9bb5-4a02-8e45-d6198e714c1a>

REVCVUc6IEV4ZWN1dGluZyBweXRob24gZnVuY3Rpb24gc3N0YXRlX3Rhc2tfcHJlZnVuYwpERUJV
RzogUHl0aG9uIGZ1bmN0aW9uIHNzdGF0ZV90YXNrX3ByZWZ1bmMgZmluaXNoZWQKREVCVUc6IEV4
ZWN1dGluZyBweXRob24gZnVuY3Rpb24gZG9fcG9wdWxhdGVfbGljCldBUk5JTkc6IGphaWxob3Vz
ZTogTm8gZ2VuZXJpYyBsaWNlbnNlIGZpbGUgZXhpc3RzIGZvcjogQlNELTItY2xhdXNlIGluIGFu
eSBwcm92aWRlcgpERUJVRzogUHl0aG9uIGZ1bmN0aW9uIGRvX3BvcHVsYXRlX2xpYyBmaW5pc2hl
ZApERUJVRzogRXhlY3V0aW5nIHB5dGhvbiBmdW5jdGlvbiBwb3B1bGF0ZV9saWNfcWFfY2hlY2tz
dW0KTk9URTogamFpbGhvdXNlOiBtZDUgY2hlY2tzdW0gbWF0Y2hlZCBmb3IgZmlsZTovL0NPUFlJ
Tkc7bWQ1PTlmYTdmODk1Zjk2YmRlMmQ0N2ZkNWI3ZDk1YjZiYTRkCkRFQlVHOiBQeXRob24gZnVu
Y3Rpb24gcG9wdWxhdGVfbGljX3FhX2NoZWNrc3VtIGZpbmlzaGVkCkRFQlVHOiBFeGVjdXRpbmcg
cHl0aG9uIGZ1bmN0aW9uIHNzdGF0ZV90YXNrX3Bvc3RmdW5jCkRFQlVHOiBQcmVwYXJpbmcgdHJl
ZSAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1n
bGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEt
cjAvbGljZW5zZS1kZXN0ZGlyIGZvciBwYWNrYWdpbmcgYXQgL2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVy
by1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3NzdGF0ZS1idWlsZC1wb3B1bGF0
ZV9saWMvbGljZW5zZS1kZXN0ZGlyCkRFQlVHOiBFeGVjdXRpbmcgcHl0aG9uIGZ1bmN0aW9uIHNz
dGF0ZV9oYXJkY29kZV9wYXRoCk5PVEU6IFJlbW92aW5nIGhhcmRjb2RlZCBwYXRocyBmcm9tIHNz
dGF0ZSBwYWNrYWdlOiAnZmluZCAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjAvc3N0YXRlLWJ1aWxkLXBvcHVsYXRlX2xpYy8gXCggLW5hbWUg
IioubGEiIC1vIC1uYW1lICIqLWNvbmZpZyIgLW8gLW5hbWUgIipfY29uZmlnIiAtbyAtbmFtZSAi
cG9zdGluc3QtKiIgXCkgLXR5cGUgZiB8IHhhcmdzIGdyZXAgLWwgLWUgJy9ob21lL2NldmF0L0Rl
c2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3Jhbmdl
X3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9v
dCcgLWUgJy9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0v
dG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2Uv
MC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUnIC1lICcvaG9tZS9jZXZhdC9EZXNrdG9wL21l
dGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy9ob3N0dG9vbHMnIHwgdGVlIC9o
b21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJj
L3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9z
c3RhdGUtYnVpbGQtcG9wdWxhdGVfbGljL2ZpeG1lcGF0aCB8IHhhcmdzIC0tbm8tcnVuLWlmLWVt
cHR5IHNlZCAtaSAtZSAnczovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkv
amFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlOkZJWE1FU1RBR0lOR0RJUkhP
U1Q6ZycgLWUgJ3M6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxk
X2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxo
b3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290OkZJWE1FU1RBR0lOR0RJUlRBUkdFVDpnJyAtZSAn
czovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1n
bGliYy9ob3N0dG9vbHM6RklYTUVfSE9TVFRPT0xTX0RJUjpnJycKREVCVUc6IFB5dGhvbiBmdW5j
dGlvbiBzc3RhdGVfaGFyZGNvZGVfcGF0aCBmaW5pc2hlZApERUJVRzogRXhlY3V0aW5nIHB5dGhv
biBmdW5jdGlvbiBzc3RhdGVfcmVwb3J0X3VuaWhhc2gKREVCVUc6IFB5dGhvbiBmdW5jdGlvbiBz
c3RhdGVfcmVwb3J0X3VuaWhhc2ggZmluaXNoZWQKREVCVUc6IEV4ZWN1dGluZyBzaGVsbCBmdW5j
dGlvbiBzc3RhdGVfY3JlYXRlX3BhY2thZ2UKREVCVUc6IFNoZWxsIGZ1bmN0aW9uIHNzdGF0ZV9j
cmVhdGVfcGFja2FnZSBmaW5pc2hlZApERUJVRzogRXhlY3V0aW5nIHB5dGhvbiBmdW5jdGlvbiBz
c3RhdGVfaGFyZGNvZGVfcGF0aF91bnBhY2sKREVCVUc6IFB5dGhvbiBmdW5jdGlvbiBzc3RhdGVf
aGFyZGNvZGVfcGF0aF91bnBhY2sgZmluaXNoZWQKREVCVUc6IEV4ZWN1dGluZyBweXRob24gZnVu
Y3Rpb24gYnVpbGRoaXN0b3J5X2VtaXRfb3V0cHV0c2lncwpERUJVRzogUHl0aG9uIGZ1bmN0aW9u
IGJ1aWxkaGlzdG9yeV9lbWl0X291dHB1dHNpZ3MgZmluaXNoZWQKREVCVUc6IFN0YWdpbmcgZmls
ZXMgZnJvbSAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJt
L3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNl
LzAuMTEtcjAvbGljZW5zZS1kZXN0ZGlyIHRvIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFu
Z2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL2RlcGxveS9saWNlbnNlcwpERUJVRzogRXhl
Y3V0aW5nIHB5dGhvbiBmdW5jdGlvbiBidWlsZGhpc3RvcnlfZW1pdF9wa2doaXN0b3J5CkRFQlVH
OiBQeXRob24gZnVuY3Rpb24gYnVpbGRoaXN0b3J5X2VtaXRfcGtnaGlzdG9yeSBmaW5pc2hlZApE
RUJVRzogUHl0aG9uIGZ1bmN0aW9uIHNzdGF0ZV90YXNrX3Bvc3RmdW5jIGZpbmlzaGVkCg==
------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=log.do_prepare_recipe_sysroot
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=log.do_prepare_recipe_sysroot
X-Attachment-Id: 20430ef3-2f0a-428e-8656-4fba2613f6ae
Content-ID: <20430ef3-2f0a-428e-8656-4fba2613f6ae>

REVCVUc6IEV4ZWN1dGluZyBweXRob24gZnVuY3Rpb24gZG9fcHJlcGFyZV9yZWNpcGVfc3lzcm9v
dApERUJVRzogRXhlY3V0aW5nIHB5dGhvbiBmdW5jdGlvbiBleHRlbmRfcmVjaXBlX3N5c3Jvb3QK
Tk9URTogRGlyZWN0IGRlcGVuZGVuY2llcyBhcmUgWyd2aXJ0dWFsOm5hdGl2ZTovaG9tZS9jZXZh
dC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vcG9reS9tZXRhL3JlY2lwZXMta2VybmVsL2R0
Yy9kdGNfMS41LjAuYmI6ZG9fcG9wdWxhdGVfc3lzcm9vdCcsICcvaG9tZS9jZXZhdC9EZXNrdG9w
L21ldGEtb3JhbmdlcGkveW9jdG8vcG9reS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy1y
dW50aW1lXzkuMS5iYjpkb19wb3B1bGF0ZV9zeXNyb290JywgJy9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9wb2t5L21ldGEvcmVjaXBlcy1jb3JlL2dsaWJjL2dsaWJjXzIu
MzAuYmI6ZG9fcG9wdWxhdGVfc3lzcm9vdCcsICcvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3Jh
bmdlcGkveW9jdG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWtlcm5lbC9saW51eC1vcmFuZ2VwaS16
ZXJvL2xpbnV4LW9yYW5nZXBpLXplcm9fNC4xOS42My5iYjpkb19wb3B1bGF0ZV9zeXNyb290Jywg
Jy9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9wZW5lbWJlZGRl
ZC9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tbWFrb18xLjEuMC5i
Yjpkb19wb3B1bGF0ZV9zeXNyb290JywgJy9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2Vw
aS95b2N0by9wb2t5L21ldGEvcmVjaXBlcy1zdXBwb3J0L2Jhc2gtY29tcGxldGlvbi9iYXNoLWNv
bXBsZXRpb25fMi45LmJiOmRvX3BvcHVsYXRlX3N5c3Jvb3QnLCAnL2hvbWUvY2V2YXQvRGVza3Rv
cC9tZXRhLW9yYW5nZXBpL3lvY3RvL3Bva3kvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24tbmF0aXZlXzIuNy4xNi5iYjpkb19wb3B1bGF0ZV9zeXNyb290JywgJ3ZpcnR1YWw6bmF0
aXZlOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9wZW5lbWJl
ZGRlZC9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tbWFrb18xLjEu
MC5iYjpkb19wb3B1bGF0ZV9zeXNyb290JywgJ3ZpcnR1YWw6bmF0aXZlOi9ob21lL2NldmF0L0Rl
c2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9wb2t5L21ldGEvcmVjaXBlcy1kZXZ0b29scy9wa2dj
b25maWcvcGtnY29uZmlnX2dpdC5iYjpkb19wb3B1bGF0ZV9zeXNyb290JywgJy9ob21lL2NldmF0
L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9wb2t5L21ldGEvcmVjaXBlcy1kZXZ0b29scy9n
Y2MvZ2NjLWNyb3NzXzkuMS5iYjpkb19wb3B1bGF0ZV9zeXNyb290JywgJ3ZpcnR1YWw6bmF0aXZl
Oi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9wb2t5L21ldGEvcmVjaXBl
cy1kZXZ0b29scy9tYWtlL21ha2VfNC4yLjEuYmI6ZG9fcG9wdWxhdGVfc3lzcm9vdCddCk5PVEU6
IEluc3RhbGxlZCBpbnRvIHN5c3Jvb3Q6IFsnZHRjLW5hdGl2ZScsICdnY2MtcnVudGltZScsICdn
bGliYycsICdsaW51eC1vcmFuZ2VwaS16ZXJvJywgJ3B5dGhvbi1tYWtvJywgJ2Jhc2gtY29tcGxl
dGlvbicsICdweXRob24tbmF0aXZlJywgJ3B5dGhvbi1tYWtvLW5hdGl2ZScsICdwa2djb25maWct
bmF0aXZlJywgJ2djYy1jcm9zcy1hcm0nLCAnbWFrZS1uYXRpdmUnLCAncXVpbHQtbmF0aXZlJywg
J2ZsZXgtbmF0aXZlJywgJ2xpbnV4LWxpYmMtaGVhZGVycycsICdsaWJnY2MnLCAnbHo0JywgJ3B5
dGhvbicsICd4ei1uYXRpdmUnLCAnYXV0b21ha2UtbmF0aXZlJywgJ3JlYWRsaW5lLW5hdGl2ZScs
ICdvcGVuc3NsLW5hdGl2ZScsICdleHBhdC1uYXRpdmUnLCAnYXV0b2NvbmYtbmF0aXZlJywgJ2J6
aXAyLW5hdGl2ZScsICd6bGliLW5hdGl2ZScsICdzcWxpdGUzLW5hdGl2ZScsICdnbnUtY29uZmln
LW5hdGl2ZScsICdsaWJ0b29sLW5hdGl2ZScsICdnZGJtLW5hdGl2ZScsICdkYi1uYXRpdmUnLCAn
cHl0aG9uLXNldHVwdG9vbHMtbmF0aXZlJywgJ21wZnItbmF0aXZlJywgJ3RleGluZm8tZHVtbXkt
bmF0aXZlJywgJ2JpbnV0aWxzLWNyb3NzLWFybScsICdsaWJtcGMtbmF0aXZlJywgJ2dtcC1uYXRp
dmUnLCAnZ2V0dGV4dC1taW5pbWFsLW5hdGl2ZScsICdtNC1uYXRpdmUnLCAnbGliZmZpJywgJ3Jl
YWRsaW5lJywgJ3NxbGl0ZTMnLCAnZGInLCAnb3BlbnNzbCcsICdiemlwMicsICdnZGJtJywgJ2xp
YnhjcnlwdCcsICd6bGliJywgJ25jdXJzZXMtbmF0aXZlJywgJ3VuemlwLW5hdGl2ZScsICduY3Vy
c2VzJywgJ29wa2ctdXRpbHMnXQpOT1RFOiBTa2lwcGluZyBhcyBhbHJlYWR5IGV4aXN0cyBpbiBz
eXNyb290OiBbXQpERUJVRzogc2VkIC1lICdzOl5bXi9dKi86L2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVy
by1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LzpnJyAv
aG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGli
Yy9zeXNyb290cy1jb21wb25lbnRzL2NvcnRleGE3aGYtbmVvbi12ZnB2NC9weXRob24vZml4bWVw
YXRoIHwgeGFyZ3Mgc2VkIC1pIC1lICdzOkZJWE1FU1RBR0lOR0RJUlRBUkdFVDovaG9tZS9jZXZh
dC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29y
YW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5
c3Jvb3Q6ZzsgczpGSVhNRVNUQUdJTkdESVJIT1NUOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2Ut
bGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmU6Zycg
LWUgJ3M6RklYTUVfUFNFVURPX1NZU1JPT1Q6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5n
ZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvc3lzcm9vdHMtY29tcG9uZW50cy94ODZfNjQv
cHNldWRvLW5hdGl2ZTpnJyAtZSAnczpGSVhNRV9IT1NUVE9PTFNfRElSOi9ob21lL2NldmF0L0Rl
c2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL2hvc3R0b29sczpn
JyAtZSAnczpGSVhNRV9QS0dEQVRBX0RJUjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3Jhbmdl
cGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy9wa2dkYXRhL29yYW5nZS1waS16ZXJvOmcnIC1l
ICdzOkZJWE1FX1BTRVVET19MT0NBTFNUQVRFRElSOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2Ut
bGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9wc2V1ZG8vOmcnIC1lICdzOkZJWE1FX0xP
R0ZJRk86L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90
bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8w
LjExLXIwL3RlbXAvZmlmby4xNDQ4OTpnJwpERUJVRzogc2VkIC1lICdzOl5bXi9dKi86L2hvbWUv
Y2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29y
ay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lw
ZS1zeXNyb290LW5hdGl2ZS86ZycgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lv
Y3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvc3lzcm9vdHMtY29tcG9uZW50cy94ODZfNjQvcHl0aG9u
LW5hdGl2ZS9maXhtZXBhdGggL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3Rv
L2J1aWxkX2FybS90bXAtZ2xpYmMvc3lzcm9vdHMtY29tcG9uZW50cy94ODZfNjQvcGtnY29uZmln
LW5hdGl2ZS9maXhtZXBhdGggL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3Rv
L2J1aWxkX2FybS90bXAtZ2xpYmMvc3lzcm9vdHMtY29tcG9uZW50cy94ODZfNjQvZ2NjLWNyb3Nz
LWFybS9maXhtZXBhdGggL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1
aWxkX2FybS90bXAtZ2xpYmMvc3lzcm9vdHMtY29tcG9uZW50cy94ODZfNjQvcXVpbHQtbmF0aXZl
L2ZpeG1lcGF0aCAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRf
YXJtL3RtcC1nbGliYy9zeXNyb290cy1jb21wb25lbnRzL3g4Nl82NC9hdXRvbWFrZS1uYXRpdmUv
Zml4bWVwYXRoIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9h
cm0vdG1wLWdsaWJjL3N5c3Jvb3RzLWNvbXBvbmVudHMveDg2XzY0L29wZW5zc2wtbmF0aXZlL2Zp
eG1lcGF0aCAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJt
L3RtcC1nbGliYy9zeXNyb290cy1jb21wb25lbnRzL3g4Nl82NC9hdXRvY29uZi1uYXRpdmUvZml4
bWVwYXRoIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0v
dG1wLWdsaWJjL3N5c3Jvb3RzLWNvbXBvbmVudHMveDg2XzY0L2dudS1jb25maWctbmF0aXZlL2Zp
eG1lcGF0aCAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJt
L3RtcC1nbGliYy9zeXNyb290cy1jb21wb25lbnRzL3g4Nl82NC9saWJ0b29sLW5hdGl2ZS9maXht
ZXBhdGggL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90
bXAtZ2xpYmMvc3lzcm9vdHMtY29tcG9uZW50cy94ODZfNjQvZ21wLW5hdGl2ZS9maXhtZXBhdGgg
L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xp
YmMvc3lzcm9vdHMtY29tcG9uZW50cy94ODZfNjQvbmN1cnNlcy1uYXRpdmUvZml4bWVwYXRoIHwg
eGFyZ3Mgc2VkIC1pIC1lICdzOkZJWE1FU1RBR0lOR0RJUlRBUkdFVDovaG9tZS9jZXZhdC9EZXNr
dG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9w
aV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3Q6
ZzsgczpGSVhNRVNUQUdJTkdESVJIT1NUOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2Vw
aS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgt
Z251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmU6ZycgLWUgJ3M6
RklYTUVfUFNFVURPX1NZU1JPT1Q6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lv
Y3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvc3lzcm9vdHMtY29tcG9uZW50cy94ODZfNjQvcHNldWRv
LW5hdGl2ZTpnJyAtZSAnczpGSVhNRV9IT1NUVE9PTFNfRElSOi9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL2hvc3R0b29sczpnJyAtZSAn
czpGSVhNRV9QS0dEQVRBX0RJUjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy9wa2dkYXRhL29yYW5nZS1waS16ZXJvOmcnIC1lICdzOkZJ
WE1FX1BTRVVET19MT0NBTFNUQVRFRElSOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2Vw
aS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgt
Z251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9wc2V1ZG8vOmcnIC1lICdzOkZJWE1FX0xPR0ZJRk86
L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xp
YmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIw
L3RlbXAvZmlmby4xNDQ4OTpnJwpERUJVRzogUHl0aG9uIGZ1bmN0aW9uIGV4dGVuZF9yZWNpcGVf
c3lzcm9vdCBmaW5pc2hlZApERUJVRzogUHl0aG9uIGZ1bmN0aW9uIGRvX3ByZXBhcmVfcmVjaXBl
X3N5c3Jvb3QgZmluaXNoZWQK
------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; 
	name=log.do_prepare_recipe_sysroot.14489
Content-Transfer-Encoding: base64
Content-Disposition: attachment; 
	filename=log.do_prepare_recipe_sysroot.14489
X-Attachment-Id: eefa11cb-970a-4f18-b82a-84d8345b1cf9
Content-ID: <eefa11cb-970a-4f18-b82a-84d8345b1cf9>

REVCVUc6IEV4ZWN1dGluZyBweXRob24gZnVuY3Rpb24gZG9fcHJlcGFyZV9yZWNpcGVfc3lzcm9v
dApERUJVRzogRXhlY3V0aW5nIHB5dGhvbiBmdW5jdGlvbiBleHRlbmRfcmVjaXBlX3N5c3Jvb3QK
Tk9URTogRGlyZWN0IGRlcGVuZGVuY2llcyBhcmUgWyd2aXJ0dWFsOm5hdGl2ZTovaG9tZS9jZXZh
dC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vcG9reS9tZXRhL3JlY2lwZXMta2VybmVsL2R0
Yy9kdGNfMS41LjAuYmI6ZG9fcG9wdWxhdGVfc3lzcm9vdCcsICcvaG9tZS9jZXZhdC9EZXNrdG9w
L21ldGEtb3JhbmdlcGkveW9jdG8vcG9reS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy1y
dW50aW1lXzkuMS5iYjpkb19wb3B1bGF0ZV9zeXNyb290JywgJy9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9wb2t5L21ldGEvcmVjaXBlcy1jb3JlL2dsaWJjL2dsaWJjXzIu
MzAuYmI6ZG9fcG9wdWxhdGVfc3lzcm9vdCcsICcvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3Jh
bmdlcGkveW9jdG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWtlcm5lbC9saW51eC1vcmFuZ2VwaS16
ZXJvL2xpbnV4LW9yYW5nZXBpLXplcm9fNC4xOS42My5iYjpkb19wb3B1bGF0ZV9zeXNyb290Jywg
Jy9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9wZW5lbWJlZGRl
ZC9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tbWFrb18xLjEuMC5i
Yjpkb19wb3B1bGF0ZV9zeXNyb290JywgJy9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2Vw
aS95b2N0by9wb2t5L21ldGEvcmVjaXBlcy1zdXBwb3J0L2Jhc2gtY29tcGxldGlvbi9iYXNoLWNv
bXBsZXRpb25fMi45LmJiOmRvX3BvcHVsYXRlX3N5c3Jvb3QnLCAnL2hvbWUvY2V2YXQvRGVza3Rv
cC9tZXRhLW9yYW5nZXBpL3lvY3RvL3Bva3kvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24tbmF0aXZlXzIuNy4xNi5iYjpkb19wb3B1bGF0ZV9zeXNyb290JywgJ3ZpcnR1YWw6bmF0
aXZlOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9wZW5lbWJl
ZGRlZC9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tbWFrb18xLjEu
MC5iYjpkb19wb3B1bGF0ZV9zeXNyb290JywgJ3ZpcnR1YWw6bmF0aXZlOi9ob21lL2NldmF0L0Rl
c2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9wb2t5L21ldGEvcmVjaXBlcy1kZXZ0b29scy9wa2dj
b25maWcvcGtnY29uZmlnX2dpdC5iYjpkb19wb3B1bGF0ZV9zeXNyb290JywgJy9ob21lL2NldmF0
L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9wb2t5L21ldGEvcmVjaXBlcy1kZXZ0b29scy9n
Y2MvZ2NjLWNyb3NzXzkuMS5iYjpkb19wb3B1bGF0ZV9zeXNyb290JywgJ3ZpcnR1YWw6bmF0aXZl
Oi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9wb2t5L21ldGEvcmVjaXBl
cy1kZXZ0b29scy9tYWtlL21ha2VfNC4yLjEuYmI6ZG9fcG9wdWxhdGVfc3lzcm9vdCddCk5PVEU6
IEluc3RhbGxlZCBpbnRvIHN5c3Jvb3Q6IFsnZHRjLW5hdGl2ZScsICdnY2MtcnVudGltZScsICdn
bGliYycsICdsaW51eC1vcmFuZ2VwaS16ZXJvJywgJ3B5dGhvbi1tYWtvJywgJ2Jhc2gtY29tcGxl
dGlvbicsICdweXRob24tbmF0aXZlJywgJ3B5dGhvbi1tYWtvLW5hdGl2ZScsICdwa2djb25maWct
bmF0aXZlJywgJ2djYy1jcm9zcy1hcm0nLCAnbWFrZS1uYXRpdmUnLCAncXVpbHQtbmF0aXZlJywg
J2ZsZXgtbmF0aXZlJywgJ2xpbnV4LWxpYmMtaGVhZGVycycsICdsaWJnY2MnLCAnbHo0JywgJ3B5
dGhvbicsICd4ei1uYXRpdmUnLCAnYXV0b21ha2UtbmF0aXZlJywgJ3JlYWRsaW5lLW5hdGl2ZScs
ICdvcGVuc3NsLW5hdGl2ZScsICdleHBhdC1uYXRpdmUnLCAnYXV0b2NvbmYtbmF0aXZlJywgJ2J6
aXAyLW5hdGl2ZScsICd6bGliLW5hdGl2ZScsICdzcWxpdGUzLW5hdGl2ZScsICdnbnUtY29uZmln
LW5hdGl2ZScsICdsaWJ0b29sLW5hdGl2ZScsICdnZGJtLW5hdGl2ZScsICdkYi1uYXRpdmUnLCAn
cHl0aG9uLXNldHVwdG9vbHMtbmF0aXZlJywgJ21wZnItbmF0aXZlJywgJ3RleGluZm8tZHVtbXkt
bmF0aXZlJywgJ2JpbnV0aWxzLWNyb3NzLWFybScsICdsaWJtcGMtbmF0aXZlJywgJ2dtcC1uYXRp
dmUnLCAnZ2V0dGV4dC1taW5pbWFsLW5hdGl2ZScsICdtNC1uYXRpdmUnLCAnbGliZmZpJywgJ3Jl
YWRsaW5lJywgJ3NxbGl0ZTMnLCAnZGInLCAnb3BlbnNzbCcsICdiemlwMicsICdnZGJtJywgJ2xp
YnhjcnlwdCcsICd6bGliJywgJ25jdXJzZXMtbmF0aXZlJywgJ3VuemlwLW5hdGl2ZScsICduY3Vy
c2VzJywgJ29wa2ctdXRpbHMnXQpOT1RFOiBTa2lwcGluZyBhcyBhbHJlYWR5IGV4aXN0cyBpbiBz
eXNyb290OiBbXQpERUJVRzogc2VkIC1lICdzOl5bXi9dKi86L2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVy
by1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LzpnJyAv
aG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGli
Yy9zeXNyb290cy1jb21wb25lbnRzL2NvcnRleGE3aGYtbmVvbi12ZnB2NC9weXRob24vZml4bWVw
YXRoIHwgeGFyZ3Mgc2VkIC1pIC1lICdzOkZJWE1FU1RBR0lOR0RJUlRBUkdFVDovaG9tZS9jZXZh
dC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29y
YW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5
c3Jvb3Q6ZzsgczpGSVhNRVNUQUdJTkdESVJIT1NUOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2Ut
bGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmU6Zycg
LWUgJ3M6RklYTUVfUFNFVURPX1NZU1JPT1Q6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5n
ZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvc3lzcm9vdHMtY29tcG9uZW50cy94ODZfNjQv
cHNldWRvLW5hdGl2ZTpnJyAtZSAnczpGSVhNRV9IT1NUVE9PTFNfRElSOi9ob21lL2NldmF0L0Rl
c2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL2hvc3R0b29sczpn
JyAtZSAnczpGSVhNRV9QS0dEQVRBX0RJUjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3Jhbmdl
cGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy9wa2dkYXRhL29yYW5nZS1waS16ZXJvOmcnIC1l
ICdzOkZJWE1FX1BTRVVET19MT0NBTFNUQVRFRElSOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2Ut
bGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9wc2V1ZG8vOmcnIC1lICdzOkZJWE1FX0xP
R0ZJRk86L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90
bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8w
LjExLXIwL3RlbXAvZmlmby4xNDQ4OTpnJwpERUJVRzogc2VkIC1lICdzOl5bXi9dKi86L2hvbWUv
Y2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29y
ay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lw
ZS1zeXNyb290LW5hdGl2ZS86ZycgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lv
Y3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvc3lzcm9vdHMtY29tcG9uZW50cy94ODZfNjQvcHl0aG9u
LW5hdGl2ZS9maXhtZXBhdGggL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3Rv
L2J1aWxkX2FybS90bXAtZ2xpYmMvc3lzcm9vdHMtY29tcG9uZW50cy94ODZfNjQvcGtnY29uZmln
LW5hdGl2ZS9maXhtZXBhdGggL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3Rv
L2J1aWxkX2FybS90bXAtZ2xpYmMvc3lzcm9vdHMtY29tcG9uZW50cy94ODZfNjQvZ2NjLWNyb3Nz
LWFybS9maXhtZXBhdGggL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1
aWxkX2FybS90bXAtZ2xpYmMvc3lzcm9vdHMtY29tcG9uZW50cy94ODZfNjQvcXVpbHQtbmF0aXZl
L2ZpeG1lcGF0aCAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRf
YXJtL3RtcC1nbGliYy9zeXNyb290cy1jb21wb25lbnRzL3g4Nl82NC9hdXRvbWFrZS1uYXRpdmUv
Zml4bWVwYXRoIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9h
cm0vdG1wLWdsaWJjL3N5c3Jvb3RzLWNvbXBvbmVudHMveDg2XzY0L29wZW5zc2wtbmF0aXZlL2Zp
eG1lcGF0aCAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJt
L3RtcC1nbGliYy9zeXNyb290cy1jb21wb25lbnRzL3g4Nl82NC9hdXRvY29uZi1uYXRpdmUvZml4
bWVwYXRoIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0v
dG1wLWdsaWJjL3N5c3Jvb3RzLWNvbXBvbmVudHMveDg2XzY0L2dudS1jb25maWctbmF0aXZlL2Zp
eG1lcGF0aCAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJt
L3RtcC1nbGliYy9zeXNyb290cy1jb21wb25lbnRzL3g4Nl82NC9saWJ0b29sLW5hdGl2ZS9maXht
ZXBhdGggL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90
bXAtZ2xpYmMvc3lzcm9vdHMtY29tcG9uZW50cy94ODZfNjQvZ21wLW5hdGl2ZS9maXhtZXBhdGgg
L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xp
YmMvc3lzcm9vdHMtY29tcG9uZW50cy94ODZfNjQvbmN1cnNlcy1uYXRpdmUvZml4bWVwYXRoIHwg
eGFyZ3Mgc2VkIC1pIC1lICdzOkZJWE1FU1RBR0lOR0RJUlRBUkdFVDovaG9tZS9jZXZhdC9EZXNr
dG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9w
aV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3Q6
ZzsgczpGSVhNRVNUQUdJTkdESVJIT1NUOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2Vw
aS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgt
Z251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmU6ZycgLWUgJ3M6
RklYTUVfUFNFVURPX1NZU1JPT1Q6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lv
Y3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvc3lzcm9vdHMtY29tcG9uZW50cy94ODZfNjQvcHNldWRv
LW5hdGl2ZTpnJyAtZSAnczpGSVhNRV9IT1NUVE9PTFNfRElSOi9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL2hvc3R0b29sczpnJyAtZSAn
czpGSVhNRV9QS0dEQVRBX0RJUjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy9wa2dkYXRhL29yYW5nZS1waS16ZXJvOmcnIC1lICdzOkZJ
WE1FX1BTRVVET19MT0NBTFNUQVRFRElSOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2Vw
aS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgt
Z251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9wc2V1ZG8vOmcnIC1lICdzOkZJWE1FX0xPR0ZJRk86
L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xp
YmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIw
L3RlbXAvZmlmby4xNDQ4OTpnJwpERUJVRzogUHl0aG9uIGZ1bmN0aW9uIGV4dGVuZF9yZWNpcGVf
c3lzcm9vdCBmaW5pc2hlZApERUJVRzogUHl0aG9uIGZ1bmN0aW9uIGRvX3ByZXBhcmVfcmVjaXBl
X3N5c3Jvb3QgZmluaXNoZWQK
------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=log.do_unpack
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=log.do_unpack
X-Attachment-Id: 9b3cdbec-515b-4d2c-8ca4-e69590392ed9
Content-ID: <9b3cdbec-515b-4d2c-8ca4-e69590392ed9>

REVCVUc6IEV4ZWN1dGluZyBweXRob24gZnVuY3Rpb24gZG9fdW5wYWNrCkRFQlVHOiBFeGVjdXRp
bmcgcHl0aG9uIGZ1bmN0aW9uIGJhc2VfZG9fdW5wYWNrCkRFQlVHOiBSdW5uaW5nICdleHBvcnQg
UFNFVURPX0RJU0FCTEVEPTE7IHVuc2V0IF9QWVRIT05fU1lTQ09ORklHREFUQV9OQU1FOyBleHBv
cnQgREJVU19TRVNTSU9OX0JVU19BRERSRVNTPSJ1bml4OmFic3RyYWN0PS90bXAvZGJ1cy1PclZO
QWlVaDM5IjsgZXhwb3J0IFNTSF9BVVRIX1NPQ0s9Ii9ydW4vdXNlci8xMDAwL2tleXJpbmcvc3No
IjsgZXhwb3J0IFBBVEg9Ii9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9i
dWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9q
YWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2Jpbi9weXRob24tbmF0
aXZlOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9wb2t5L3NjcmlwdHM6
L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xp
YmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIw
L3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmluL2FybS1vZS1saW51eC1nbnVlYWJpOi9ob21l
L2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dv
cmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNp
cGUtc3lzcm9vdC91c3IvYmluL2Nyb3Nzc2NyaXB0czovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEt
b3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9l
LWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vz
ci9zYmluOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0v
dG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2Uv
MC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2JpbjovaG9tZS9jZXZhdC9EZXNrdG9w
L21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96
ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0
aXZlL3NiaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2Fy
bS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3Vz
ZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS9iaW46L2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL3Bva3kvYml0YmFrZS9iaW46L2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvaG9zdHRvb2xzIjsgZXhwb3J0
IEhPTUU9Ii9ob21lL2NldmF0IjsgZ2l0IC1jIGNvcmUuZnN5bmNvYmplY3RmaWxlcz0wIGJyYW5j
aCAtLWNvbnRhaW5zIDU4MDUyYTdhOWQxZjU5MDRkNzJiMTYzNzI4MmM4NzcxNzJlZTY5ZjYgLS1s
aXN0IG5leHQgMj4gL2Rldi9udWxsIHwgd2MgLWwnIGluIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0
YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vZG93bmxvYWRzL2dpdDIvZ2l0aHViLmNvbS5zaWVt
ZW5zLmphaWxob3VzZQpERUJVRzogUnVubmluZyBleHBvcnQgUFNFVURPX0RJU0FCTEVEPTE7IHVu
c2V0IF9QWVRIT05fU1lTQ09ORklHREFUQV9OQU1FOyBleHBvcnQgREJVU19TRVNTSU9OX0JVU19B
RERSRVNTPSJ1bml4OmFic3RyYWN0PS90bXAvZGJ1cy1PclZOQWlVaDM5IjsgZXhwb3J0IFNTSF9B
VVRIX1NPQ0s9Ii9ydW4vdXNlci8xMDAwL2tleXJpbmcvc3NoIjsgZXhwb3J0IFBBVEg9Ii9ob21l
L2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dv
cmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNp
cGUtc3lzcm9vdC1uYXRpdmUvdXNyL2Jpbi9weXRob24tbmF0aXZlOi9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9wb2t5L3NjcmlwdHM6L2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVy
by1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2
ZS91c3IvYmluL2FybS1vZS1saW51eC1nbnVlYWJpOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2Ut
bGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC91c3IvYmluL2Ny
b3Nzc2NyaXB0czovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRf
YXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhv
dXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9zYmluOi9ob21lL2NldmF0L0Rl
c2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3Jhbmdl
X3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9v
dC1uYXRpdmUvdXNyL2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkv
amFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3NiaW46L2hvbWUvY2V2YXQv
RGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFu
Z2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNy
b290LW5hdGl2ZS9iaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL3Bv
a3kvYml0YmFrZS9iaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1
aWxkX2FybS90bXAtZ2xpYmMvaG9zdHRvb2xzIjsgZXhwb3J0IEhPTUU9Ii9ob21lL2NldmF0Ijsg
Z2l0IC1jIGNvcmUuZnN5bmNvYmplY3RmaWxlcz0wIGNsb25lIC1zIC1uIC9ob21lL2NldmF0L0Rl
c2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vZG93bmxvYWRzL2dpdDIvZ2l0aHVi
LmNvbS5zaWVtZW5zLmphaWxob3VzZS8gL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBp
L3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1n
bnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC8KREVCVUc6IFJ1bm5pbmcgJ2V4cG9ydCBQU0VV
RE9fRElTQUJMRUQ9MTsgdW5zZXQgX1BZVEhPTl9TWVNDT05GSUdEQVRBX05BTUU7IGV4cG9ydCBE
QlVTX1NFU1NJT05fQlVTX0FERFJFU1M9InVuaXg6YWJzdHJhY3Q9L3RtcC9kYnVzLU9yVk5BaVVo
MzkiOyBleHBvcnQgU1NIX0FVVEhfU09DSz0iL3J1bi91c2VyLzEwMDAva2V5cmluZy9zc2giOyBl
eHBvcnQgUEFUSD0iL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxk
X2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxo
b3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmluL3B5dGhvbi1uYXRpdmU6
L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL3Bva3kvc2NyaXB0czovaG9t
ZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93
b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVj
aXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vYXJtLW9lLWxpbnV4LWdudWVhYmk6L2hvbWUvY2V2
YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9v
cmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1z
eXNyb290L3Vzci9iaW4vY3Jvc3NzY3JpcHRzOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFu
Z2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGlu
dXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL3Ni
aW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmluOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0
YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8t
b2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUv
c2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3Rt
cC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAu
MTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEt
b3JhbmdlcGkveW9jdG8vcG9reS9iaXRiYWtlL2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEt
b3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy9ob3N0dG9vbHMiOyBleHBvcnQgSE9N
RT0iL2hvbWUvY2V2YXQiOyBnaXQgLWMgY29yZS5mc3luY29iamVjdGZpbGVzPTAgcmVtb3RlIHNl
dC11cmwgb3JpZ2luIGdpdDovL2dpdGh1Yi5jb20vc2llbWVucy9qYWlsaG91c2UnIGluIC9ob21l
L2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dv
cmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQv
CkRFQlVHOiBSdW5uaW5nICdleHBvcnQgUFNFVURPX0RJU0FCTEVEPTE7IHVuc2V0IF9QWVRIT05f
U1lTQ09ORklHREFUQV9OQU1FOyBleHBvcnQgREJVU19TRVNTSU9OX0JVU19BRERSRVNTPSJ1bml4
OmFic3RyYWN0PS90bXAvZGJ1cy1PclZOQWlVaDM5IjsgZXhwb3J0IFNTSF9BVVRIX1NPQ0s9Ii9y
dW4vdXNlci8xMDAwL2tleXJpbmcvc3NoIjsgZXhwb3J0IFBBVEg9Ii9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3Bp
X3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1u
YXRpdmUvdXNyL2Jpbi9weXRob24tbmF0aXZlOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFu
Z2VwaS95b2N0by9wb2t5L3NjcmlwdHM6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBp
L3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1n
bnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmluL2Fy
bS1vZS1saW51eC1nbnVlYWJpOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0
by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFi
aS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC91c3IvYmluL2Nyb3Nzc2NyaXB0czov
aG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGli
Yy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAv
cmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9zYmluOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2Ut
bGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNy
L2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3Rt
cC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAu
MTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3NiaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRh
LW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1v
ZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS9i
aW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL3Bva3kvYml0YmFrZS9i
aW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvaG9zdHRvb2xzIjsgZXhwb3J0IEhPTUU9Ii9ob21lL2NldmF0IjsgZ2l0IC1jIGNvcmUu
ZnN5bmNvYmplY3RmaWxlcz0wIGdyZXAgbGZzIEhFQUQ6LmdpdGF0dHJpYnV0ZXMgfCB3YyAtbCcg
aW4gL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL2dpdC8KREVCVUc6IFJ1bm5pbmcgJ2V4cG9ydCBQU0VVRE9fRElTQUJMRUQ9MTsgdW5zZXQg
X1BZVEhPTl9TWVNDT05GSUdEQVRBX05BTUU7IGV4cG9ydCBEQlVTX1NFU1NJT05fQlVTX0FERFJF
U1M9InVuaXg6YWJzdHJhY3Q9L3RtcC9kYnVzLU9yVk5BaVVoMzkiOyBleHBvcnQgU1NIX0FVVEhf
U09DSz0iL3J1bi91c2VyLzEwMDAva2V5cmluZy9zc2giOyBleHBvcnQgUEFUSD0iL2hvbWUvY2V2
YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9v
cmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1z
eXNyb290LW5hdGl2ZS91c3IvYmluL3B5dGhvbi1uYXRpdmU6L2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL3Bva3kvc2NyaXB0czovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEt
b3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9l
LWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vz
ci9iaW4vYXJtLW9lLWxpbnV4LWdudWVhYmk6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5n
ZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51
eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290L3Vzci9iaW4vY3Jvc3Nz
Y3JpcHRzOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0v
dG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2Uv
MC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL3NiaW46L2hvbWUvY2V2YXQvRGVza3Rv
cC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlf
emVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5h
dGl2ZS91c3IvYmluOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWls
ZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWls
aG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvc2JpbjovaG9tZS9jZXZhdC9EZXNr
dG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9w
aV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3Qt
bmF0aXZlL2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vcG9reS9i
aXRiYWtlL2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRf
YXJtL3RtcC1nbGliYy9ob3N0dG9vbHMiOyBleHBvcnQgSE9NRT0iL2hvbWUvY2V2YXQiOyBnaXQg
LWMgY29yZS5mc3luY29iamVjdGZpbGVzPTAgY2hlY2tvdXQgLUIgbmV4dCA1ODA1MmE3YTlkMWY1
OTA0ZDcyYjE2MzcyODJjODc3MTcyZWU2OWY2JyBpbiAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEt
b3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9l
LWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0LwpERUJVRzogUnVubmluZyAnZXhw
b3J0IFBTRVVET19ESVNBQkxFRD0xOyB1bnNldCBfUFlUSE9OX1NZU0NPTkZJR0RBVEFfTkFNRTsg
ZXhwb3J0IERCVVNfU0VTU0lPTl9CVVNfQUREUkVTUz0idW5peDphYnN0cmFjdD0vdG1wL2RidXMt
T3JWTkFpVWgzOSI7IGV4cG9ydCBTU0hfQVVUSF9TT0NLPSIvcnVuL3VzZXIvMTAwMC9rZXlyaW5n
L3NzaCI7IGV4cG9ydCBQQVRIPSIvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vcHl0aG9u
LW5hdGl2ZTovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vcG9reS9zY3Jp
cHRzOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1w
LWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4x
MS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2Jpbi9hcm0tb2UtbGludXgtZ251ZWFiaTov
aG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGli
Yy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAv
cmVjaXBlLXN5c3Jvb3QvdXNyL2Jpbi9jcm9zc3NjcmlwdHM6L2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVy
by1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2
ZS91c3Ivc2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRf
YXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhv
dXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW46L2hvbWUvY2V2YXQvRGVz
a3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2Vf
cGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290
LW5hdGl2ZS9zYmluOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWls
ZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWls
aG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvYmluOi9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9wb2t5L2JpdGJha2UvYmluOi9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL2hvc3R0b29scyI7IGV4
cG9ydCBIT01FPSIvaG9tZS9jZXZhdCI7IGdpdCAtYyBjb3JlLmZzeW5jb2JqZWN0ZmlsZXM9MCBi
cmFuY2ggbmV4dCAtLXNldC11cHN0cmVhbS10byBvcmlnaW4vbmV4dCcgaW4gL2hvbWUvY2V2YXQv
RGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFu
Z2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC8KREVCVUc6
IFNlYXJjaGluZyBmb3IgMDAwMS1maXgtbWFrZWZpbGVzLnBhdGNoIGluIHBhdGhzOgogICAgL2hv
bWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBl
cy1qYWlsaG91c2UvamFpbGhvdXNlL2phaWxob3VzZS0wLjExL29yYW5nZXBpCiAgICAvaG9tZS9j
ZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWph
aWxob3VzZS9qYWlsaG91c2UvamFpbGhvdXNlL29yYW5nZXBpCiAgICAvaG9tZS9jZXZhdC9EZXNr
dG9wL21ldGEtb3JhbmdlcGkveW9jdG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWphaWxob3VzZS9q
YWlsaG91c2UvZmlsZXMvb3JhbmdlcGkKICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFu
Z2VwaS95b2N0by9tZXRhLW9yYW5nZXBpL3JlY2lwZXMtamFpbGhvdXNlL2phaWxob3VzZS9qYWls
aG91c2UtMC4xMS9vcmFuZ2UtcGktemVybwogICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9y
YW5nZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWlsaG91c2UvamFpbGhvdXNlL2ph
aWxob3VzZS9vcmFuZ2UtcGktemVybwogICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5n
ZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWlsaG91c2UvamFpbGhvdXNlL2ZpbGVz
L29yYW5nZS1waS16ZXJvCiAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWphaWxob3VzZS9qYWlsaG91c2UvamFpbGhvdXNlLTAu
MTEvc3VuOGkKICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRh
LW9yYW5nZXBpL3JlY2lwZXMtamFpbGhvdXNlL2phaWxob3VzZS9qYWlsaG91c2Uvc3VuOGkKICAg
IC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9yYW5nZXBpL3Jl
Y2lwZXMtamFpbGhvdXNlL2phaWxob3VzZS9maWxlcy9zdW44aQogICAgL2hvbWUvY2V2YXQvRGVz
a3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWlsaG91c2Uv
amFpbGhvdXNlL2phaWxob3VzZS0wLjExL2FybXY3dmUKICAgIC9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9yYW5nZXBpL3JlY2lwZXMtamFpbGhvdXNlL2phaWxo
b3VzZS9qYWlsaG91c2UvYXJtdjd2ZQogICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5n
ZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWlsaG91c2UvamFpbGhvdXNlL2ZpbGVz
L2FybXY3dmUKICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRh
LW9yYW5nZXBpL3JlY2lwZXMtamFpbGhvdXNlL2phaWxob3VzZS9qYWlsaG91c2UtMC4xMS9hcm0K
ICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9yYW5nZXBp
L3JlY2lwZXMtamFpbGhvdXNlL2phaWxob3VzZS9qYWlsaG91c2UvYXJtCiAgICAvaG9tZS9jZXZh
dC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWphaWxo
b3VzZS9qYWlsaG91c2UvZmlsZXMvYXJtCiAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3Jh
bmdlcGkveW9jdG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWphaWxob3VzZS9qYWlsaG91c2UvamFp
bGhvdXNlLTAuMTEvCiAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
bWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWphaWxob3VzZS9qYWlsaG91c2UvamFpbGhvdXNlLwogICAg
L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVj
aXBlcy1qYWlsaG91c2UvamFpbGhvdXNlL2ZpbGVzLwpOT1RFOiBVbnBhY2tpbmcgL2hvbWUvY2V2
YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWls
aG91c2UvamFpbGhvdXNlL2phaWxob3VzZS8wMDAxLWZpeC1tYWtlZmlsZXMucGF0Y2ggdG8gL2hv
bWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMv
d29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwLwpE
RUJVRzogUHl0aG9uIGZ1bmN0aW9uIGJhc2VfZG9fdW5wYWNrIGZpbmlzaGVkCkRFQlVHOiBQeXRo
b24gZnVuY3Rpb24gZG9fdW5wYWNrIGZpbmlzaGVkCkRFQlVHOiBFeGVjdXRpbmcgcHl0aG9uIGZ1
bmN0aW9uIGRvX3FhX3VucGFjawpERUJVRzogUHl0aG9uIGZ1bmN0aW9uIGRvX3FhX3VucGFjayBm
aW5pc2hlZAo=
------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=log.do_unpack.14488
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=log.do_unpack.14488
X-Attachment-Id: b28f9d70-3439-4ac7-865a-98dfe4b9192a
Content-ID: <b28f9d70-3439-4ac7-865a-98dfe4b9192a>

REVCVUc6IEV4ZWN1dGluZyBweXRob24gZnVuY3Rpb24gZG9fdW5wYWNrCkRFQlVHOiBFeGVjdXRp
bmcgcHl0aG9uIGZ1bmN0aW9uIGJhc2VfZG9fdW5wYWNrCkRFQlVHOiBSdW5uaW5nICdleHBvcnQg
UFNFVURPX0RJU0FCTEVEPTE7IHVuc2V0IF9QWVRIT05fU1lTQ09ORklHREFUQV9OQU1FOyBleHBv
cnQgREJVU19TRVNTSU9OX0JVU19BRERSRVNTPSJ1bml4OmFic3RyYWN0PS90bXAvZGJ1cy1PclZO
QWlVaDM5IjsgZXhwb3J0IFNTSF9BVVRIX1NPQ0s9Ii9ydW4vdXNlci8xMDAwL2tleXJpbmcvc3No
IjsgZXhwb3J0IFBBVEg9Ii9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9i
dWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9q
YWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2Jpbi9weXRob24tbmF0
aXZlOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9wb2t5L3NjcmlwdHM6
L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xp
YmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIw
L3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmluL2FybS1vZS1saW51eC1nbnVlYWJpOi9ob21l
L2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dv
cmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNp
cGUtc3lzcm9vdC91c3IvYmluL2Nyb3Nzc2NyaXB0czovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEt
b3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9l
LWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vz
ci9zYmluOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0v
dG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2Uv
MC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2JpbjovaG9tZS9jZXZhdC9EZXNrdG9w
L21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96
ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0
aXZlL3NiaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2Fy
bS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3Vz
ZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS9iaW46L2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL3Bva3kvYml0YmFrZS9iaW46L2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvaG9zdHRvb2xzIjsgZXhwb3J0
IEhPTUU9Ii9ob21lL2NldmF0IjsgZ2l0IC1jIGNvcmUuZnN5bmNvYmplY3RmaWxlcz0wIGJyYW5j
aCAtLWNvbnRhaW5zIDU4MDUyYTdhOWQxZjU5MDRkNzJiMTYzNzI4MmM4NzcxNzJlZTY5ZjYgLS1s
aXN0IG5leHQgMj4gL2Rldi9udWxsIHwgd2MgLWwnIGluIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0
YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vZG93bmxvYWRzL2dpdDIvZ2l0aHViLmNvbS5zaWVt
ZW5zLmphaWxob3VzZQpERUJVRzogUnVubmluZyBleHBvcnQgUFNFVURPX0RJU0FCTEVEPTE7IHVu
c2V0IF9QWVRIT05fU1lTQ09ORklHREFUQV9OQU1FOyBleHBvcnQgREJVU19TRVNTSU9OX0JVU19B
RERSRVNTPSJ1bml4OmFic3RyYWN0PS90bXAvZGJ1cy1PclZOQWlVaDM5IjsgZXhwb3J0IFNTSF9B
VVRIX1NPQ0s9Ii9ydW4vdXNlci8xMDAwL2tleXJpbmcvc3NoIjsgZXhwb3J0IFBBVEg9Ii9ob21l
L2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dv
cmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNp
cGUtc3lzcm9vdC1uYXRpdmUvdXNyL2Jpbi9weXRob24tbmF0aXZlOi9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9wb2t5L3NjcmlwdHM6L2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVy
by1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2
ZS91c3IvYmluL2FybS1vZS1saW51eC1nbnVlYWJpOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2Ut
bGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC91c3IvYmluL2Ny
b3Nzc2NyaXB0czovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRf
YXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhv
dXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9zYmluOi9ob21lL2NldmF0L0Rl
c2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3Jhbmdl
X3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9v
dC1uYXRpdmUvdXNyL2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkv
amFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3NiaW46L2hvbWUvY2V2YXQv
RGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFu
Z2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNy
b290LW5hdGl2ZS9iaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL3Bv
a3kvYml0YmFrZS9iaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1
aWxkX2FybS90bXAtZ2xpYmMvaG9zdHRvb2xzIjsgZXhwb3J0IEhPTUU9Ii9ob21lL2NldmF0Ijsg
Z2l0IC1jIGNvcmUuZnN5bmNvYmplY3RmaWxlcz0wIGNsb25lIC1zIC1uIC9ob21lL2NldmF0L0Rl
c2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vZG93bmxvYWRzL2dpdDIvZ2l0aHVi
LmNvbS5zaWVtZW5zLmphaWxob3VzZS8gL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBp
L3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1n
bnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC8KREVCVUc6IFJ1bm5pbmcgJ2V4cG9ydCBQU0VV
RE9fRElTQUJMRUQ9MTsgdW5zZXQgX1BZVEhPTl9TWVNDT05GSUdEQVRBX05BTUU7IGV4cG9ydCBE
QlVTX1NFU1NJT05fQlVTX0FERFJFU1M9InVuaXg6YWJzdHJhY3Q9L3RtcC9kYnVzLU9yVk5BaVVo
MzkiOyBleHBvcnQgU1NIX0FVVEhfU09DSz0iL3J1bi91c2VyLzEwMDAva2V5cmluZy9zc2giOyBl
eHBvcnQgUEFUSD0iL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxk
X2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxo
b3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmluL3B5dGhvbi1uYXRpdmU6
L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL3Bva3kvc2NyaXB0czovaG9t
ZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93
b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVj
aXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vYXJtLW9lLWxpbnV4LWdudWVhYmk6L2hvbWUvY2V2
YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9v
cmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1z
eXNyb290L3Vzci9iaW4vY3Jvc3NzY3JpcHRzOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFu
Z2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGlu
dXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL3Ni
aW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmluOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0
YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8t
b2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUv
c2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3Rt
cC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAu
MTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEt
b3JhbmdlcGkveW9jdG8vcG9reS9iaXRiYWtlL2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEt
b3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy9ob3N0dG9vbHMiOyBleHBvcnQgSE9N
RT0iL2hvbWUvY2V2YXQiOyBnaXQgLWMgY29yZS5mc3luY29iamVjdGZpbGVzPTAgcmVtb3RlIHNl
dC11cmwgb3JpZ2luIGdpdDovL2dpdGh1Yi5jb20vc2llbWVucy9qYWlsaG91c2UnIGluIC9ob21l
L2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dv
cmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQv
CkRFQlVHOiBSdW5uaW5nICdleHBvcnQgUFNFVURPX0RJU0FCTEVEPTE7IHVuc2V0IF9QWVRIT05f
U1lTQ09ORklHREFUQV9OQU1FOyBleHBvcnQgREJVU19TRVNTSU9OX0JVU19BRERSRVNTPSJ1bml4
OmFic3RyYWN0PS90bXAvZGJ1cy1PclZOQWlVaDM5IjsgZXhwb3J0IFNTSF9BVVRIX1NPQ0s9Ii9y
dW4vdXNlci8xMDAwL2tleXJpbmcvc3NoIjsgZXhwb3J0IFBBVEg9Ii9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3Bp
X3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1u
YXRpdmUvdXNyL2Jpbi9weXRob24tbmF0aXZlOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFu
Z2VwaS95b2N0by9wb2t5L3NjcmlwdHM6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBp
L3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1n
bnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvYmluL2Fy
bS1vZS1saW51eC1nbnVlYWJpOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0
by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFi
aS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC91c3IvYmluL2Nyb3Nzc2NyaXB0czov
aG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGli
Yy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAv
cmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9zYmluOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2Ut
bGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNy
L2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3Rt
cC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAu
MTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3NiaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRh
LW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1v
ZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS9i
aW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL3Bva3kvYml0YmFrZS9i
aW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvaG9zdHRvb2xzIjsgZXhwb3J0IEhPTUU9Ii9ob21lL2NldmF0IjsgZ2l0IC1jIGNvcmUu
ZnN5bmNvYmplY3RmaWxlcz0wIGdyZXAgbGZzIEhFQUQ6LmdpdGF0dHJpYnV0ZXMgfCB3YyAtbCcg
aW4gL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL2dpdC8KREVCVUc6IFJ1bm5pbmcgJ2V4cG9ydCBQU0VVRE9fRElTQUJMRUQ9MTsgdW5zZXQg
X1BZVEhPTl9TWVNDT05GSUdEQVRBX05BTUU7IGV4cG9ydCBEQlVTX1NFU1NJT05fQlVTX0FERFJF
U1M9InVuaXg6YWJzdHJhY3Q9L3RtcC9kYnVzLU9yVk5BaVVoMzkiOyBleHBvcnQgU1NIX0FVVEhf
U09DSz0iL3J1bi91c2VyLzEwMDAva2V5cmluZy9zc2giOyBleHBvcnQgUEFUSD0iL2hvbWUvY2V2
YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9v
cmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1z
eXNyb290LW5hdGl2ZS91c3IvYmluL3B5dGhvbi1uYXRpdmU6L2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL3Bva3kvc2NyaXB0czovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEt
b3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9l
LWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vz
ci9iaW4vYXJtLW9lLWxpbnV4LWdudWVhYmk6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5n
ZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51
eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290L3Vzci9iaW4vY3Jvc3Nz
Y3JpcHRzOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0v
dG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2Uv
MC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL3NiaW46L2hvbWUvY2V2YXQvRGVza3Rv
cC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlf
emVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5h
dGl2ZS91c3IvYmluOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWls
ZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWls
aG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvc2JpbjovaG9tZS9jZXZhdC9EZXNr
dG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9w
aV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3Qt
bmF0aXZlL2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vcG9reS9i
aXRiYWtlL2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRf
YXJtL3RtcC1nbGliYy9ob3N0dG9vbHMiOyBleHBvcnQgSE9NRT0iL2hvbWUvY2V2YXQiOyBnaXQg
LWMgY29yZS5mc3luY29iamVjdGZpbGVzPTAgY2hlY2tvdXQgLUIgbmV4dCA1ODA1MmE3YTlkMWY1
OTA0ZDcyYjE2MzcyODJjODc3MTcyZWU2OWY2JyBpbiAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEt
b3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9l
LWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0LwpERUJVRzogUnVubmluZyAnZXhw
b3J0IFBTRVVET19ESVNBQkxFRD0xOyB1bnNldCBfUFlUSE9OX1NZU0NPTkZJR0RBVEFfTkFNRTsg
ZXhwb3J0IERCVVNfU0VTU0lPTl9CVVNfQUREUkVTUz0idW5peDphYnN0cmFjdD0vdG1wL2RidXMt
T3JWTkFpVWgzOSI7IGV4cG9ydCBTU0hfQVVUSF9TT0NLPSIvcnVuL3VzZXIvMTAwMC9rZXlyaW5n
L3NzaCI7IGV4cG9ydCBQQVRIPSIvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vcHl0aG9u
LW5hdGl2ZTovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vcG9reS9zY3Jp
cHRzOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1w
LWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4x
MS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2Jpbi9hcm0tb2UtbGludXgtZ251ZWFiaTov
aG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGli
Yy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAv
cmVjaXBlLXN5c3Jvb3QvdXNyL2Jpbi9jcm9zc3NjcmlwdHM6L2hvbWUvY2V2YXQvRGVza3RvcC9t
ZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVy
by1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2
ZS91c3Ivc2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRf
YXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhv
dXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW46L2hvbWUvY2V2YXQvRGVz
a3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2Vf
cGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290
LW5hdGl2ZS9zYmluOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWls
ZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWls
aG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvYmluOi9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9wb2t5L2JpdGJha2UvYmluOi9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL2hvc3R0b29scyI7IGV4
cG9ydCBIT01FPSIvaG9tZS9jZXZhdCI7IGdpdCAtYyBjb3JlLmZzeW5jb2JqZWN0ZmlsZXM9MCBi
cmFuY2ggbmV4dCAtLXNldC11cHN0cmVhbS10byBvcmlnaW4vbmV4dCcgaW4gL2hvbWUvY2V2YXQv
RGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFu
Z2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC8KREVCVUc6
IFNlYXJjaGluZyBmb3IgMDAwMS1maXgtbWFrZWZpbGVzLnBhdGNoIGluIHBhdGhzOgogICAgL2hv
bWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBl
cy1qYWlsaG91c2UvamFpbGhvdXNlL2phaWxob3VzZS0wLjExL29yYW5nZXBpCiAgICAvaG9tZS9j
ZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWph
aWxob3VzZS9qYWlsaG91c2UvamFpbGhvdXNlL29yYW5nZXBpCiAgICAvaG9tZS9jZXZhdC9EZXNr
dG9wL21ldGEtb3JhbmdlcGkveW9jdG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWphaWxob3VzZS9q
YWlsaG91c2UvZmlsZXMvb3JhbmdlcGkKICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFu
Z2VwaS95b2N0by9tZXRhLW9yYW5nZXBpL3JlY2lwZXMtamFpbGhvdXNlL2phaWxob3VzZS9qYWls
aG91c2UtMC4xMS9vcmFuZ2UtcGktemVybwogICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9y
YW5nZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWlsaG91c2UvamFpbGhvdXNlL2ph
aWxob3VzZS9vcmFuZ2UtcGktemVybwogICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5n
ZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWlsaG91c2UvamFpbGhvdXNlL2ZpbGVz
L29yYW5nZS1waS16ZXJvCiAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWphaWxob3VzZS9qYWlsaG91c2UvamFpbGhvdXNlLTAu
MTEvc3VuOGkKICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRh
LW9yYW5nZXBpL3JlY2lwZXMtamFpbGhvdXNlL2phaWxob3VzZS9qYWlsaG91c2Uvc3VuOGkKICAg
IC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9yYW5nZXBpL3Jl
Y2lwZXMtamFpbGhvdXNlL2phaWxob3VzZS9maWxlcy9zdW44aQogICAgL2hvbWUvY2V2YXQvRGVz
a3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWlsaG91c2Uv
amFpbGhvdXNlL2phaWxob3VzZS0wLjExL2FybXY3dmUKICAgIC9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9yYW5nZXBpL3JlY2lwZXMtamFpbGhvdXNlL2phaWxo
b3VzZS9qYWlsaG91c2UvYXJtdjd2ZQogICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5n
ZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWlsaG91c2UvamFpbGhvdXNlL2ZpbGVz
L2FybXY3dmUKICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRh
LW9yYW5nZXBpL3JlY2lwZXMtamFpbGhvdXNlL2phaWxob3VzZS9qYWlsaG91c2UtMC4xMS9hcm0K
ICAgIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9tZXRhLW9yYW5nZXBp
L3JlY2lwZXMtamFpbGhvdXNlL2phaWxob3VzZS9qYWlsaG91c2UvYXJtCiAgICAvaG9tZS9jZXZh
dC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWphaWxo
b3VzZS9qYWlsaG91c2UvZmlsZXMvYXJtCiAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3Jh
bmdlcGkveW9jdG8vbWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWphaWxob3VzZS9qYWlsaG91c2UvamFp
bGhvdXNlLTAuMTEvCiAgICAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
bWV0YS1vcmFuZ2VwaS9yZWNpcGVzLWphaWxob3VzZS9qYWlsaG91c2UvamFpbGhvdXNlLwogICAg
L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVj
aXBlcy1qYWlsaG91c2UvamFpbGhvdXNlL2ZpbGVzLwpOT1RFOiBVbnBhY2tpbmcgL2hvbWUvY2V2
YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL21ldGEtb3JhbmdlcGkvcmVjaXBlcy1qYWls
aG91c2UvamFpbGhvdXNlL2phaWxob3VzZS8wMDAxLWZpeC1tYWtlZmlsZXMucGF0Y2ggdG8gL2hv
bWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMv
d29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwLwpE
RUJVRzogUHl0aG9uIGZ1bmN0aW9uIGJhc2VfZG9fdW5wYWNrIGZpbmlzaGVkCkRFQlVHOiBQeXRo
b24gZnVuY3Rpb24gZG9fdW5wYWNrIGZpbmlzaGVkCkRFQlVHOiBFeGVjdXRpbmcgcHl0aG9uIGZ1
bmN0aW9uIGRvX3FhX3VucGFjawpERUJVRzogUHl0aG9uIGZ1bmN0aW9uIGRvX3FhX3VucGFjayBm
aW5pc2hlZAo=
------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=log.task_order
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=log.task_order
X-Attachment-Id: f42a9819-ee5e-4838-b71e-582477f251c5
Content-ID: <f42a9819-ee5e-4838-b71e-582477f251c5>

do_cleansstate (14255): log.do_cleansstate.14255
do_fetch (14470): log.do_fetch.14470
do_unpack (14488): log.do_unpack.14488
do_prepare_recipe_sysroot (14489): log.do_prepare_recipe_sysroot.14489
do_patch (14518): log.do_patch.14518
do_configure (14592): log.do_configure.14592
do_populate_lic (14593): log.do_populate_lic.14593
do_compile (14598): log.do_compile.14598

------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=run.base_do_fetch.14470
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=run.base_do_fetch.14470
X-Attachment-Id: 21be46ea-8e13-4aa9-855c-c13144a07da5
Content-ID: <21be46ea-8e13-4aa9-855c-c13144a07da5>

def base_do_fetch(d):

    src_uri = (d.getVar('SRC_URI') or "").split()
    if len(src_uri) == 0:
        return

    try:
        fetcher = bb.fetch2.Fetch(src_uri, d)
        fetcher.download()
    except bb.fetch2.BBFetchException as e:
        bb.fatal(str(e))

base_do_fetch(d)


------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=run.base_do_unpack.14488
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=run.base_do_unpack.14488
X-Attachment-Id: 009155c0-c967-42f5-9e1b-467905e4f56b
Content-ID: <009155c0-c967-42f5-9e1b-467905e4f56b>

def base_do_unpack(d):
    src_uri = (d.getVar('SRC_URI') or "").split()
    if len(src_uri) == 0:
        return

    try:
        fetcher = bb.fetch2.Fetch(src_uri, d)
        fetcher.unpack(d.getVar('WORKDIR'))
    except bb.fetch2.BBFetchException as e:
        bb.fatal(str(e))

base_do_unpack(d)


------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; 
	name=run.buildhistory_emit_outputsigs.14593
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; 
	filename=run.buildhistory_emit_outputsigs.14593
X-Attachment-Id: a0a72d87-f64d-4fb7-8960-f2543150a6ed
Content-ID: <a0a72d87-f64d-4fb7-8960-f2543150a6ed>

def buildhistory_emit_outputsigs(d):
    if not "task" in (d.getVar('BUILDHISTORY_FEATURES') or "").split():
        return

    import hashlib

    taskoutdir = os.path.join(d.getVar('BUILDHISTORY_DIR'), 'task', 'output')
    bb.utils.mkdirhier(taskoutdir)
    currenttask = d.getVar('BB_CURRENTTASK')
    pn = d.getVar('PN')
    taskfile = os.path.join(taskoutdir, '%s.%s' % (pn, currenttask))

    cwd = os.getcwd()
    filesigs = {}
    for root, _, files in os.walk(cwd):
        for fname in files:
            if fname == 'fixmepath':
                continue
            fullpath = os.path.join(root, fname)
            try:
                if os.path.islink(fullpath):
                    sha256 = hashlib.sha256(os.readlink(fullpath).encode('utf-8')).hexdigest()
                elif os.path.isfile(fullpath):
                    sha256 = bb.utils.sha256_file(fullpath)
                else:
                    continue
            except OSError:
                bb.warn('buildhistory: unable to read %s to get output signature' % fullpath)
                continue
            filesigs[os.path.relpath(fullpath, cwd)] = sha256
    with open(taskfile, 'w') as f:
        for fpath, fsig in sorted(filesigs.items(), key=lambda item: item[0]):
            f.write('%s %s\n' % (fpath, fsig))

buildhistory_emit_outputsigs(d)


------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; 
	name=run.buildhistory_emit_pkghistory.14593
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; 
	filename=run.buildhistory_emit_pkghistory.14593
X-Attachment-Id: ee336493-0800-4704-bc90-399bf2282103
Content-ID: <ee336493-0800-4704-bc90-399bf2282103>

def buildhistory_emit_pkghistory(d):
    if d.getVar('BB_CURRENTTASK') in ['populate_sysroot', 'populate_sysroot_setscene']:
        bb.build.exec_func("buildhistory_emit_sysroot", d)

    if not d.getVar('BB_CURRENTTASK') in ['packagedata', 'packagedata_setscene']:
        return 0

    if not "package" in (d.getVar('BUILDHISTORY_FEATURES') or "").split():
        return 0

    import re
    import json
    import shlex
    import errno

    pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE')
    oldpkghistdir = d.getVar('BUILDHISTORY_OLD_DIR_PACKAGE')

    class RecipeInfo:
        def __init__(self, name):
            self.name = name
            self.pe = "0"
            self.pv = "0"
            self.pr = "r0"
            self.depends = ""
            self.packages = ""
            self.srcrev = ""
            self.layer = ""


    class PackageInfo:
        def __init__(self, name):
            self.name = name
            self.pe = "0"
            self.pv = "0"
            self.pr = "r0"
            # pkg/pkge/pkgv/pkgr should be empty because we want to be able to default them
            self.pkg = ""
            self.pkge = ""
            self.pkgv = ""
            self.pkgr = ""
            self.size = 0
            self.depends = ""
            self.rprovides = ""
            self.rdepends = ""
            self.rrecommends = ""
            self.rsuggests = ""
            self.rreplaces = ""
            self.rconflicts = ""
            self.files = ""
            self.filelist = ""
            # Variables that need to be written to their own separate file
            self.filevars = dict.fromkeys(['pkg_preinst', 'pkg_postinst', 'pkg_prerm', 'pkg_postrm'])

    # Should check PACKAGES here to see if anything removed

    def readPackageInfo(pkg, histfile):
        pkginfo = PackageInfo(pkg)
        with open(histfile, "r") as f:
            for line in f:
                lns = line.split('=', 1)
                name = lns[0].strip()
                value = lns[1].strip(" \t\r\n").strip('"')
                if name == "PE":
                    pkginfo.pe = value
                elif name == "PV":
                    pkginfo.pv = value
                elif name == "PR":
                    pkginfo.pr = value
                elif name == "PKG":
                    pkginfo.pkg = value
                elif name == "PKGE":
                    pkginfo.pkge = value
                elif name == "PKGV":
                    pkginfo.pkgv = value
                elif name == "PKGR":
                    pkginfo.pkgr = value
                elif name == "RPROVIDES":
                    pkginfo.rprovides = value
                elif name == "RDEPENDS":
                    pkginfo.rdepends = value
                elif name == "RRECOMMENDS":
                    pkginfo.rrecommends = value
                elif name == "RSUGGESTS":
                    pkginfo.rsuggests = value
                elif name == "RREPLACES":
                    pkginfo.rreplaces = value
                elif name == "RCONFLICTS":
                    pkginfo.rconflicts = value
                elif name == "PKGSIZE":
                    pkginfo.size = int(value)
                elif name == "FILES":
                    pkginfo.files = value
                elif name == "FILELIST":
                    pkginfo.filelist = value
        # Apply defaults
        if not pkginfo.pkg:
            pkginfo.pkg = pkginfo.name
        if not pkginfo.pkge:
            pkginfo.pkge = pkginfo.pe
        if not pkginfo.pkgv:
            pkginfo.pkgv = pkginfo.pv
        if not pkginfo.pkgr:
            pkginfo.pkgr = pkginfo.pr
        return pkginfo

    def getlastpkgversion(pkg):
        try:
            histfile = os.path.join(oldpkghistdir, pkg, "latest")
            return readPackageInfo(pkg, histfile)
        except EnvironmentError:
            return None

    def sortpkglist(string):
        pkgiter = re.finditer(r'[a-zA-Z0-9.+-]+( \([><=]+[^)]+\))?', string, 0)
        pkglist = [p.group(0) for p in pkgiter]
        pkglist.sort()
        return ' '.join(pkglist)

    def sortlist(string):
        items = string.split(' ')
        items.sort()
        return ' '.join(items)

    pn = d.getVar('PN')
    pe = d.getVar('PE') or "0"
    pv = d.getVar('PV')
    pr = d.getVar('PR')
    layer = bb.utils.get_file_layer(d.getVar('FILE'), d)

    pkgdata_dir = d.getVar('PKGDATA_DIR')
    packages = ""
    try:
        with open(os.path.join(pkgdata_dir, pn)) as f:
            for line in f.readlines():
                if line.startswith('PACKAGES: '):
                    packages = oe.utils.squashspaces(line.split(': ', 1)[1])
                    break
    except IOError as e:
        if e.errno == errno.ENOENT:
            # Probably a -cross recipe, just ignore
            return 0
        else:
            raise

    packagelist = packages.split()
    preserve = d.getVar('BUILDHISTORY_PRESERVE').split()
    if not os.path.exists(pkghistdir):
        bb.utils.mkdirhier(pkghistdir)
    else:
        # Remove files for packages that no longer exist
        for item in os.listdir(pkghistdir):
            if item not in preserve:
                if item not in packagelist:
                    itempath = os.path.join(pkghistdir, item)
                    if os.path.isdir(itempath):
                        for subfile in os.listdir(itempath):
                            os.unlink(os.path.join(itempath, subfile))
                        os.rmdir(itempath)
                    else:
                        os.unlink(itempath)

    rcpinfo = RecipeInfo(pn)
    rcpinfo.pe = pe
    rcpinfo.pv = pv
    rcpinfo.pr = pr
    rcpinfo.depends = sortlist(oe.utils.squashspaces(d.getVar('DEPENDS') or ""))
    rcpinfo.packages = packages
    rcpinfo.layer = layer
    write_recipehistory(rcpinfo, d)

    pkgdest = d.getVar('PKGDEST')
    for pkg in packagelist:
        pkgdata = {}
        with open(os.path.join(pkgdata_dir, 'runtime', pkg)) as f:
            for line in f.readlines():
                item = line.rstrip('\n').split(': ', 1)
                key = item[0]
                if key.endswith('_' + pkg):
                    key = key[:-len(pkg)-1]
                pkgdata[key] = item[1].encode('latin-1').decode('unicode_escape')

        pkge = pkgdata.get('PKGE', '0')
        pkgv = pkgdata['PKGV']
        pkgr = pkgdata['PKGR']
        #
        # Find out what the last version was
        # Make sure the version did not decrease
        #
        lastversion = getlastpkgversion(pkg)
        if lastversion:
            last_pkge = lastversion.pkge
            last_pkgv = lastversion.pkgv
            last_pkgr = lastversion.pkgr
            r = bb.utils.vercmp((pkge, pkgv, pkgr), (last_pkge, last_pkgv, last_pkgr))
            if r < 0:
                msg = "Package version for package %s went backwards which would break package feeds from (%s:%s-%s to %s:%s-%s)" % (pkg, last_pkge, last_pkgv, last_pkgr, pkge, pkgv, pkgr)
                package_qa_handle_error("version-going-backwards", msg, d)

        pkginfo = PackageInfo(pkg)
        # Apparently the version can be different on a per-package basis (see Python)
        pkginfo.pe = pkgdata.get('PE', '0')
        pkginfo.pv = pkgdata['PV']
        pkginfo.pr = pkgdata['PR']
        pkginfo.pkg = pkgdata['PKG']
        pkginfo.pkge = pkge
        pkginfo.pkgv = pkgv
        pkginfo.pkgr = pkgr
        pkginfo.rprovides = sortpkglist(oe.utils.squashspaces(pkgdata.get('RPROVIDES', "")))
        pkginfo.rdepends = sortpkglist(oe.utils.squashspaces(pkgdata.get('RDEPENDS', "")))
        pkginfo.rrecommends = sortpkglist(oe.utils.squashspaces(pkgdata.get('RRECOMMENDS', "")))
        pkginfo.rsuggests = sortpkglist(oe.utils.squashspaces(pkgdata.get('RSUGGESTS', "")))
        pkginfo.rreplaces = sortpkglist(oe.utils.squashspaces(pkgdata.get('RREPLACES', "")))
        pkginfo.rconflicts = sortpkglist(oe.utils.squashspaces(pkgdata.get('RCONFLICTS', "")))
        pkginfo.files = oe.utils.squashspaces(pkgdata.get('FILES', ""))
        for filevar in pkginfo.filevars:
            pkginfo.filevars[filevar] = pkgdata.get(filevar, "")

        # Gather information about packaged files
        val = pkgdata.get('FILES_INFO', '')
        dictval = json.loads(val)
        filelist = list(dictval.keys())
        filelist.sort()
        pkginfo.filelist = " ".join([shlex.quote(x) for x in filelist])

        pkginfo.size = int(pkgdata['PKGSIZE'])

        write_pkghistory(pkginfo, d)

    # Create files-in-<package-name>.txt files containing a list of files of each recipe's package
    bb.build.exec_func("buildhistory_list_pkg_files", d)

buildhistory_emit_pkghistory(d)

def package_qa_handle_error(error_class, error_msg, d):
    if error_class in (d.getVar("ERROR_QA") or "").split():
        package_qa_write_error(error_class, error_msg, d)
        bb.error("QA Issue: %s [%s]" % (error_msg, error_class))
        d.setVar("QA_SANE", False)
        return False
    elif error_class in (d.getVar("WARN_QA") or "").split():
        package_qa_write_error(error_class, error_msg, d)
        bb.warn("QA Issue: %s [%s]" % (error_msg, error_class))
    else:
        bb.note("QA Issue: %s [%s]" % (error_msg, error_class))
    return True

def write_pkghistory(pkginfo, d):
    bb.debug(2, "Writing package history for package %s" % pkginfo.name)

    pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE')

    pkgpath = os.path.join(pkghistdir, pkginfo.name)
    if not os.path.exists(pkgpath):
        bb.utils.mkdirhier(pkgpath)

    infofile = os.path.join(pkgpath, "latest")
    with open(infofile, "w") as f:
        if pkginfo.pe != "0":
            f.write(u"PE = %s\n" %  pkginfo.pe)
        f.write(u"PV = %s\n" %  pkginfo.pv)
        f.write(u"PR = %s\n" %  pkginfo.pr)

        if pkginfo.pkg != pkginfo.name:
            f.write(u"PKG = %s\n" % pkginfo.pkg)
        if pkginfo.pkge != pkginfo.pe:
            f.write(u"PKGE = %s\n" % pkginfo.pkge)
        if pkginfo.pkgv != pkginfo.pv:
            f.write(u"PKGV = %s\n" % pkginfo.pkgv)
        if pkginfo.pkgr != pkginfo.pr:
            f.write(u"PKGR = %s\n" % pkginfo.pkgr)
        f.write(u"RPROVIDES = %s\n" %  pkginfo.rprovides)
        f.write(u"RDEPENDS = %s\n" %  pkginfo.rdepends)
        f.write(u"RRECOMMENDS = %s\n" %  pkginfo.rrecommends)
        if pkginfo.rsuggests:
            f.write(u"RSUGGESTS = %s\n" %  pkginfo.rsuggests)
        if pkginfo.rreplaces:
            f.write(u"RREPLACES = %s\n" %  pkginfo.rreplaces)
        if pkginfo.rconflicts:
            f.write(u"RCONFLICTS = %s\n" %  pkginfo.rconflicts)
        f.write(u"PKGSIZE = %d\n" %  pkginfo.size)
        f.write(u"FILES = %s\n" %  pkginfo.files)
        f.write(u"FILELIST = %s\n" %  pkginfo.filelist)

    for filevar in pkginfo.filevars:
        filevarpath = os.path.join(pkgpath, "latest.%s" % filevar)
        val = pkginfo.filevars[filevar]
        if val:
            with open(filevarpath, "w") as f:
                f.write(val)
        else:
            if os.path.exists(filevarpath):
                os.unlink(filevarpath)

#
# rootfs_type can be: image, sdk_target, sdk_host
#

def write_recipehistory(rcpinfo, d):
    bb.debug(2, "Writing recipe history")

    pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE')

    infofile = os.path.join(pkghistdir, "latest")
    with open(infofile, "w") as f:
        if rcpinfo.pe != "0":
            f.write(u"PE = %s\n" %  rcpinfo.pe)
        f.write(u"PV = %s\n" %  rcpinfo.pv)
        f.write(u"PR = %s\n" %  rcpinfo.pr)
        f.write(u"DEPENDS = %s\n" %  rcpinfo.depends)
        f.write(u"PACKAGES = %s\n" %  rcpinfo.packages)
        f.write(u"LAYER = %s\n" %  rcpinfo.layer)

    write_latest_srcrev(d, pkghistdir)

def write_latest_srcrev(d, pkghistdir):
    srcrevfile = os.path.join(pkghistdir, 'latest_srcrev')

    srcrevs, tag_srcrevs = _get_srcrev_values(d)
    if srcrevs:
        if not os.path.exists(pkghistdir):
            bb.utils.mkdirhier(pkghistdir)
        old_tag_srcrevs = {}
        if os.path.exists(srcrevfile):
            with open(srcrevfile) as f:
                for line in f:
                    if line.startswith('# tag_'):
                        key, value = line.split("=", 1)
                        key = key.replace('# tag_', '').strip()
                        value = value.replace('"', '').strip()
                        old_tag_srcrevs[key] = value
        with open(srcrevfile, 'w') as f:
            orig_srcrev = d.getVar('SRCREV', False) or 'INVALID'
            if orig_srcrev != 'INVALID':
                f.write('# SRCREV = "%s"\n' % orig_srcrev)
            if len(srcrevs) > 1:
                for name, srcrev in sorted(srcrevs.items()):
                    orig_srcrev = d.getVar('SRCREV_%s' % name, False)
                    if orig_srcrev:
                        f.write('# SRCREV_%s = "%s"\n' % (name, orig_srcrev))
                    f.write('SRCREV_%s = "%s"\n' % (name, srcrev))
            else:
                f.write('SRCREV = "%s"\n' % next(iter(srcrevs.values())))
            if len(tag_srcrevs) > 0:
                for name, srcrev in sorted(tag_srcrevs.items()):
                    f.write('# tag_%s = "%s"\n' % (name, srcrev))
                    if name in old_tag_srcrevs and old_tag_srcrevs[name] != srcrev:
                        pkg = d.getVar('PN')
                        bb.warn("Revision for tag %s in package %s was changed since last build (from %s to %s)" % (name, pkg, old_tag_srcrevs[name], srcrev))

    else:
        if os.path.exists(srcrevfile):
            os.remove(srcrevfile)

def package_qa_write_error(type, error, d):
    logfile = d.getVar('QA_LOGFILE')
    if logfile:
        p = d.getVar('P')
        with open(logfile, "a+") as f:
            f.write("%s: %s [%s]\n" % (p, error, type))

def _get_srcrev_values(d):
    """
    Return the version strings for the current recipe
    """

    scms = []
    fetcher = bb.fetch.Fetch(d.getVar('SRC_URI').split(), d)
    urldata = fetcher.ud
    for u in urldata:
        if urldata[u].method.supports_srcrev():
            scms.append(u)

    autoinc_templ = 'AUTOINC+'
    dict_srcrevs = {}
    dict_tag_srcrevs = {}
    for scm in scms:
        ud = urldata[scm]
        for name in ud.names:
            try:
                rev = ud.method.sortable_revision(ud, d, name)
            except TypeError:
                # support old bitbake versions
                rev = ud.method.sortable_revision(scm, ud, d, name)
            # Clean this up when we next bump bitbake version
            if type(rev) != str:
                autoinc, rev = rev
            elif rev.startswith(autoinc_templ):
                rev = rev[len(autoinc_templ):]
            dict_srcrevs[name] = rev
            if 'tag' in ud.parm:
                tag = ud.parm['tag'];
                key = name+'_'+tag
                dict_tag_srcrevs[key] = rev
    return (dict_srcrevs, dict_tag_srcrevs)


------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=run.do_cleansstate
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=run.do_cleansstate
X-Attachment-Id: daf07482-1b87-4aeb-8d7f-e1c4cfa12add
Content-ID: <daf07482-1b87-4aeb-8d7f-e1c4cfa12add>

def do_cleansstate(d):
        sstate_clean_cachefiles(d)

do_cleansstate(d)

def sstate_clean_cachefiles(d):
    for task in (d.getVar('SSTATETASKS') or "").split():
        ld = d.createCopy()
        ss = sstate_state_fromvars(ld, task)
        sstate_clean_cachefile(ss, ld)

def sstate_clean_cachefile(ss, d):
    import oe.path

    sstatepkgfile = d.getVar('SSTATE_PATHSPEC') + "*_" + ss['task'] + ".tgz*"
    if d.getVarFlag('do_%s' % ss['task'], 'task'):
        bb.note("Removing %s" % sstatepkgfile)
        oe.path.remove(sstatepkgfile)

def sstate_state_fromvars(d, task = None):
    if task is None:
        task = d.getVar('BB_CURRENTTASK')
        if not task:
            bb.fatal("sstate code running without task context?!")
        task = task.replace("_setscene", "")

    if task.startswith("do_"):
        task = task[3:]
    inputs = (d.getVarFlag("do_" + task, 'sstate-inputdirs') or "").split()
    outputs = (d.getVarFlag("do_" + task, 'sstate-outputdirs') or "").split()
    plaindirs = (d.getVarFlag("do_" + task, 'sstate-plaindirs') or "").split()
    lockfiles = (d.getVarFlag("do_" + task, 'sstate-lockfile') or "").split()
    lockfilesshared = (d.getVarFlag("do_" + task, 'sstate-lockfile-shared') or "").split()
    interceptfuncs = (d.getVarFlag("do_" + task, 'sstate-interceptfuncs') or "").split()
    fixmedir = d.getVarFlag("do_" + task, 'sstate-fixmedir') or ""
    if not task or len(inputs) != len(outputs):
        bb.fatal("sstate variables not setup correctly?!")

    if task == "populate_lic":
        d.setVar("SSTATE_PKGSPEC", "${SSTATE_SWSPEC}")
        d.setVar("SSTATE_EXTRAPATH", "")
        d.setVar('SSTATE_EXTRAPATHWILDCARD', "")

    ss = sstate_init(task, d)
    for i in range(len(inputs)):
        sstate_add(ss, inputs[i], outputs[i], d)
    ss['lockfiles'] = lockfiles
    ss['lockfiles-shared'] = lockfilesshared
    ss['plaindirs'] = plaindirs
    ss['interceptfuncs'] = interceptfuncs
    ss['fixmedir'] = fixmedir
    return ss

def sstate_init(task, d):
    ss = {}
    ss['task'] = task
    ss['dirs'] = []
    ss['plaindirs'] = []
    ss['lockfiles'] = []
    ss['lockfiles-shared'] = []
    return ss

def sstate_add(ss, source, dest, d):
    if not source.endswith("/"):
         source = source + "/"
    if not dest.endswith("/"):
         dest = dest + "/"
    source = os.path.normpath(source)
    dest = os.path.normpath(dest)
    srcbase = os.path.basename(source)
    ss['dirs'].append([srcbase, source, dest])
    return ss


------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=run.do_cleansstate.14255
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=run.do_cleansstate.14255
X-Attachment-Id: b26c87d4-be0f-466d-9505-65ef2c1bd8a3
Content-ID: <b26c87d4-be0f-466d-9505-65ef2c1bd8a3>

def do_cleansstate(d):
        sstate_clean_cachefiles(d)

do_cleansstate(d)

def sstate_clean_cachefiles(d):
    for task in (d.getVar('SSTATETASKS') or "").split():
        ld = d.createCopy()
        ss = sstate_state_fromvars(ld, task)
        sstate_clean_cachefile(ss, ld)

def sstate_clean_cachefile(ss, d):
    import oe.path

    sstatepkgfile = d.getVar('SSTATE_PATHSPEC') + "*_" + ss['task'] + ".tgz*"
    if d.getVarFlag('do_%s' % ss['task'], 'task'):
        bb.note("Removing %s" % sstatepkgfile)
        oe.path.remove(sstatepkgfile)

def sstate_state_fromvars(d, task = None):
    if task is None:
        task = d.getVar('BB_CURRENTTASK')
        if not task:
            bb.fatal("sstate code running without task context?!")
        task = task.replace("_setscene", "")

    if task.startswith("do_"):
        task = task[3:]
    inputs = (d.getVarFlag("do_" + task, 'sstate-inputdirs') or "").split()
    outputs = (d.getVarFlag("do_" + task, 'sstate-outputdirs') or "").split()
    plaindirs = (d.getVarFlag("do_" + task, 'sstate-plaindirs') or "").split()
    lockfiles = (d.getVarFlag("do_" + task, 'sstate-lockfile') or "").split()
    lockfilesshared = (d.getVarFlag("do_" + task, 'sstate-lockfile-shared') or "").split()
    interceptfuncs = (d.getVarFlag("do_" + task, 'sstate-interceptfuncs') or "").split()
    fixmedir = d.getVarFlag("do_" + task, 'sstate-fixmedir') or ""
    if not task or len(inputs) != len(outputs):
        bb.fatal("sstate variables not setup correctly?!")

    if task == "populate_lic":
        d.setVar("SSTATE_PKGSPEC", "${SSTATE_SWSPEC}")
        d.setVar("SSTATE_EXTRAPATH", "")
        d.setVar('SSTATE_EXTRAPATHWILDCARD', "")

    ss = sstate_init(task, d)
    for i in range(len(inputs)):
        sstate_add(ss, inputs[i], outputs[i], d)
    ss['lockfiles'] = lockfiles
    ss['lockfiles-shared'] = lockfilesshared
    ss['plaindirs'] = plaindirs
    ss['interceptfuncs'] = interceptfuncs
    ss['fixmedir'] = fixmedir
    return ss

def sstate_init(task, d):
    ss = {}
    ss['task'] = task
    ss['dirs'] = []
    ss['plaindirs'] = []
    ss['lockfiles'] = []
    ss['lockfiles-shared'] = []
    return ss

def sstate_add(ss, source, dest, d):
    if not source.endswith("/"):
         source = source + "/"
    if not dest.endswith("/"):
         dest = dest + "/"
    source = os.path.normpath(source)
    dest = os.path.normpath(dest)
    srcbase = os.path.basename(source)
    ss['dirs'].append([srcbase, source, dest])
    return ss


------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=run.do_compile
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=run.do_compile
X-Attachment-Id: a778e988-7d4a-45b5-a59a-1510746a2646
Content-ID: <a778e988-7d4a-45b5-a59a-1510746a2646>

IyEvYmluL3NoCgojIEVtaXQgYSB1c2VmdWwgZGlhZ25vc3RpYyBpZiBzb21ldGhpbmcgZmFpbHM6
CmJiX2V4aXRfaGFuZGxlcigpIHsKICAgIHJldD0kPwogICAgY2FzZSAkcmV0IGluCiAgICAwKSAg
OzsKICAgICopICBjYXNlICRCQVNIX1ZFUlNJT04gaW4KICAgICAgICAiIikgZWNobyAiV0FSTklO
RzogZXhpdCBjb2RlICRyZXQgZnJvbSBhIHNoZWxsIGNvbW1hbmQuIjs7CiAgICAgICAgKikgIGVj
aG8gIldBUk5JTkc6ICR7QkFTSF9TT1VSQ0VbMF19OiR7QkFTSF9MSU5FTk9bMF19IGV4aXQgJHJl
dCBmcm9tICckQkFTSF9DT01NQU5EJyI7OwogICAgICAgIGVzYWMKICAgICAgICBleGl0ICRyZXQK
ICAgIGVzYWMKfQp0cmFwICdiYl9leGl0X2hhbmRsZXInIDAKc2V0IC1lCmV4cG9ydCBBUj0iYXJt
LW9lLWxpbnV4LWdudWVhYmktZ2NjLWFyIgpleHBvcnQgQVJDSD0iYXJtIgpleHBvcnQgQVM9ImFy
bS1vZS1saW51eC1nbnVlYWJpLWFzICIKZXhwb3J0IEJVSUxEX0FSPSJhciIKZXhwb3J0IEJVSUxE
X0FTPSJhcyAiCmV4cG9ydCBCVUlMRF9DQz0iZ2NjICIKZXhwb3J0IEJVSUxEX0NDTEQ9ImdjYyAi
CmV4cG9ydCBCVUlMRF9DRkxBR1M9Ii1pc3lzdGVtL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9y
YW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1s
aW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3Iv
aW5jbHVkZSAtTzIgLXBpcGUiCmV4cG9ydCBCVUlMRF9DUFA9ImdjYyAgLUUiCmV4cG9ydCBCVUlM
RF9DUFBGTEFHUz0iLWlzeXN0ZW0vaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9pbmNsdWRlIgpl
eHBvcnQgQlVJTERfQ1hYPSJnKysgIgpleHBvcnQgQlVJTERfQ1hYRkxBR1M9Ii1pc3lzdGVtL2hv
bWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMv
d29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3Jl
Y2lwZS1zeXNyb290LW5hdGl2ZS91c3IvaW5jbHVkZSAtTzIgLXBpcGUiCmV4cG9ydCBCVUlMRF9G
Qz0iZ2ZvcnRyYW4gIgpleHBvcnQgQlVJTERfTEQ9ImxkICIKZXhwb3J0IEJVSUxEX0xERkxBR1M9
Ii1ML2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvbGliICAgICAgICAgICAgICAgICAgICAgICAg
IC1ML2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS9saWIgICAgICAgICAgICAgICAgICAgICAgICAgLVds
LC0tZW5hYmxlLW5ldy1kdGFncyAgICAgICAgICAgICAgICAgICAgICAgICAtV2wsLXJwYXRoLWxp
bmssL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvbGliICAgICAgICAgICAgICAgICAgICAgICAg
IC1XbCwtcnBhdGgtbGluaywvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkv
amFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL2xpYiAgICAgICAgICAgICAg
ICAgICAgICAgICAtV2wsLXJwYXRoLC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95
b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251
ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2xpYiAgICAg
ICAgICAgICAgICAgICAgICAgICAtV2wsLXJwYXRoLC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2Ut
bGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvbGli
ICAgICAgICAgICAgICAgICAgICAgICAgIC1XbCwtTzEiCmV4cG9ydCBCVUlMRF9OTT0ibm0iCmV4
cG9ydCBCVUlMRF9SQU5MSUI9InJhbmxpYiIKZXhwb3J0IEJVSUxEX1NUUklQPSJzdHJpcCIKZXhw
b3J0IENDPSJhcm0tb2UtbGludXgtZ251ZWFiaS1nY2MgIC1tZnB1PW5lb24tdmZwdjQgLW1mbG9h
dC1hYmk9aGFyZCAtbWNwdT1jb3J0ZXgtYTcgLS1zeXNyb290PS9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3pl
cm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdCIKZXhw
b3J0IENDTEQ9ImFybS1vZS1saW51eC1nbnVlYWJpLWdjYyAgLW1mcHU9bmVvbi12ZnB2NCAtbWZs
b2F0LWFiaT1oYXJkIC1tY3B1PWNvcnRleC1hNyAtLXN5c3Jvb3Q9L2hvbWUvY2V2YXQvRGVza3Rv
cC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlf
emVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290Igpl
eHBvcnQgQ0ZMQUdTPSIgLU8yIC1waXBlIC1nIC1mZWxpbWluYXRlLXVudXNlZC1kZWJ1Zy10eXBl
cyAtZm1hY3JvLXByZWZpeC1tYXA9L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lv
Y3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVl
YWJpL2phaWxob3VzZS8wLjExLXIwPS91c3Ivc3JjL2RlYnVnL2phaWxob3VzZS8wLjExLXIwICAg
ICAgICAgICAgICAgICAgICAgIC1mZGVidWctcHJlZml4LW1hcD0vaG9tZS9jZXZhdC9EZXNrdG9w
L21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96
ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjA9L3Vzci9zcmMvZGVidWcvamFp
bGhvdXNlLzAuMTEtcjAgICAgICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9o
b21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJj
L3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9y
ZWNpcGUtc3lzcm9vdD0gICAgICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9o
b21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJj
L3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9y
ZWNpcGUtc3lzcm9vdC1uYXRpdmU9ICIKZXhwb3J0IENQUD0iYXJtLW9lLWxpbnV4LWdudWVhYmkt
Z2NjIC1FIC0tc3lzcm9vdD0vaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkv
amFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QgIC1tZnB1PW5lb24tdmZwdjQgLW1mbG9h
dC1hYmk9aGFyZCAtbWNwdT1jb3J0ZXgtYTciCmV4cG9ydCBDUFBGTEFHUz0iIgpleHBvcnQgQ1JP
U1NfQ09NUElMRT0iYXJtLW9lLWxpbnV4LWdudWVhYmktIgpleHBvcnQgQ1hYPSJhcm0tb2UtbGlu
dXgtZ251ZWFiaS1nKysgIC1tZnB1PW5lb24tdmZwdjQgLW1mbG9hdC1hYmk9aGFyZCAtbWNwdT1j
b3J0ZXgtYTcgLS1zeXNyb290PS9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0
by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFi
aS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdCIKZXhwb3J0IENYWEZMQUdTPSIgLU8y
IC1waXBlIC1nIC1mZWxpbWluYXRlLXVudXNlZC1kZWJ1Zy10eXBlcyAtZm1hY3JvLXByZWZpeC1t
YXA9L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwPS91c3Ivc3JjL2RlYnVnL2phaWxob3VzZS8wLjExLXIwICAgICAgICAgICAgICAgICAgICAg
IC1mZGVidWctcHJlZml4LW1hcD0vaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjA9L3Vzci9zcmMvZGVidWcvamFpbGhvdXNlLzAuMTEtcjAgICAg
ICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3pl
cm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdD0gICAg
ICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3pl
cm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRp
dmU9ICAtZnZpc2liaWxpdHktaW5saW5lcy1oaWRkZW4iCnVuc2V0IERJU1RSTwpleHBvcnQgRkM9
ImFybS1vZS1saW51eC1nbnVlYWJpLWdmb3J0cmFuICAtbWZwdT1uZW9uLXZmcHY0IC1tZmxvYXQt
YWJpPWhhcmQgLW1jcHU9Y29ydGV4LWE3IC0tc3lzcm9vdD0vaG9tZS9jZXZhdC9EZXNrdG9wL21l
dGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJv
LW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QiCmV4cG9y
dCBIT01FPSIvaG9tZS9jZXZhdCIKZXhwb3J0IEtCVUlMRF9PVVRQVVQ9Ii9ob21lL2NldmF0L0Rl
c2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmstc2hhcmVk
L29yYW5nZS1waS16ZXJvL2tlcm5lbC1idWlsZC1hcnRpZmFjdHMiCmV4cG9ydCBLRVJORUxfVkVS
U0lPTj0iNC4xOS42MyIKZXhwb3J0IExDX0FMTD0iZW5fVVMuVVRGLTgiCmV4cG9ydCBMRD0iYXJt
LW9lLWxpbnV4LWdudWVhYmktbGQgLS1zeXNyb290PS9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2Ut
bGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdCAiCmV4cG9ydCBM
REZMQUdTPSItV2wsLU8xIC1XbCwtLWhhc2gtc3R5bGU9Z251IC1XbCwtLWFzLW5lZWRlZCIKZXhw
b3J0IExPR05BTUU9ImNldmF0Igp1bnNldCBNQUNISU5FCmV4cG9ydCBNQUtFPSJtYWtlIgpleHBv
cnQgTk09ImFybS1vZS1saW51eC1nbnVlYWJpLW5tIgpleHBvcnQgT0JKQ09QWT0iYXJtLW9lLWxp
bnV4LWdudWVhYmktb2JqY29weSIKZXhwb3J0IE9CSkRVTVA9ImFybS1vZS1saW51eC1nbnVlYWJp
LW9iamR1bXAiCmV4cG9ydCBPUz0ibGludXgtZ251ZWFiaSIKZXhwb3J0IFBBVEg9Ii9ob21lL2Nl
dmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsv
b3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUt
c3lzcm9vdC1uYXRpdmUvdXNyL2Jpbi9weXRob24tbmF0aXZlOi9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9wb2t5L3NjcmlwdHM6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRh
LW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1v
ZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91
c3IvYmluL2FybS1vZS1saW51eC1nbnVlYWJpOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFu
Z2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGlu
dXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC91c3IvYmluL2Nyb3Nz
c2NyaXB0czovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJt
L3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNl
LzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9zYmluOi9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3Bp
X3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1u
YXRpdmUvdXNyL2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVp
bGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFp
bGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3NiaW46L2hvbWUvY2V2YXQvRGVz
a3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2Vf
cGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290
LW5hdGl2ZS9iaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL3Bva3kv
Yml0YmFrZS9iaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxk
X2FybS90bXAtZ2xpYmMvaG9zdHRvb2xzIgpleHBvcnQgUEtHX0NPTkZJR19ESVI9Ii9ob21lL2Nl
dmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsv
b3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUt
c3lzcm9vdC91c3IvbGliL3BrZ2NvbmZpZyIKZXhwb3J0IFBLR19DT05GSUdfRElTQUJMRV9VTklO
U1RBTExFRD0ieWVzIgpleHBvcnQgUEtHX0NPTkZJR19MSUJESVI9Ii9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3Bp
X3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC91
c3IvbGliL3BrZ2NvbmZpZyIKZXhwb3J0IFBLR19DT05GSUdfUEFUSD0iL2hvbWUvY2V2YXQvRGVz
a3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2Vf
cGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290
L3Vzci9saWIvcGtnY29uZmlnOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0
by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFi
aS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC91c3Ivc2hhcmUvcGtnY29uZmlnIgpl
eHBvcnQgUEtHX0NPTkZJR19TWVNST09UX0RJUj0iL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9y
YW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1s
aW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290IgpleHBvcnQgUEtH
X0NPTkZJR19TWVNURU1fSU5DTFVERV9QQVRIPSIvdXNyL2luY2x1ZGUiCmV4cG9ydCBQS0dfQ09O
RklHX1NZU1RFTV9MSUJSQVJZX1BBVEg9Ii9saWI6L3Vzci9saWIiCmV4cG9ydCBQU0VVRE9fRElT
QUJMRUQ9IjEiCmV4cG9ydCBQU0VVRE9fVU5MT0FEPSIxIgpleHBvcnQgUFlUSE9OPSIvaG9tZS9j
ZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3Jr
L29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBl
LXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vcHl0aG9uLW5hdGl2ZS9weXRob24iCmV4cG9ydCBQWVRI
T05OT1VTRVJTSVRFPSIxIgpleHBvcnQgUkFOTElCPSJhcm0tb2UtbGludXgtZ251ZWFiaS1nY2Mt
cmFubGliIgpleHBvcnQgUkVBREVMRj0iYXJtLW9lLWxpbnV4LWdudWVhYmktcmVhZGVsZiIKdW5z
ZXQgU0hFTEwKZXhwb3J0IFNUQUdJTkdfSU5DRElSPSIvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEt
b3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9l
LWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QvdXNyL2luY2x1
ZGUiCmV4cG9ydCBTVEFHSU5HX0xJQkRJUj0iL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5n
ZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51
eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290L3Vzci9saWIiCmV4cG9y
dCBTVFJJTkdTPSJhcm0tb2UtbGludXgtZ251ZWFiaS1zdHJpbmdzIgpleHBvcnQgU1RSSVA9ImFy
bS1vZS1saW51eC1nbnVlYWJpLXN0cmlwIgp1bnNldCBUQVJHRVRfQVJDSApleHBvcnQgVEVSTT0i
eHRlcm0iCmV4cG9ydCBUWj0iVVRDIgpleHBvcnQgVUJPT1RfQVJDSD0iYXJtIgpleHBvcnQgVVNF
Uj0iY2V2YXQiCmV4cG9ydCBiYXNlX2JpbmRpcj0iL2JpbiIKZXhwb3J0IGJhc2VfbGliZGlyPSIv
bGliIgpleHBvcnQgYmFzZV9wcmVmaXg9IiIKZXhwb3J0IGJhc2Vfc2JpbmRpcj0iL3NiaW4iCmV4
cG9ydCBiaW5kaXI9Ii91c3IvYmluIgpleHBvcnQgZGF0YWRpcj0iL3Vzci9zaGFyZSIKZXhwb3J0
IGRvY2Rpcj0iL3Vzci9zaGFyZS9kb2MiCmV4cG9ydCBleGVjX3ByZWZpeD0iL3VzciIKZXhwb3J0
IGluY2x1ZGVkaXI9Ii91c3IvaW5jbHVkZSIKZXhwb3J0IGluZm9kaXI9Ii91c3Ivc2hhcmUvaW5m
byIKZXhwb3J0IGxpYmRpcj0iL3Vzci9saWIiCmV4cG9ydCBsaWJleGVjZGlyPSIvdXNyL2xpYmV4
ZWMiCmV4cG9ydCBsb2NhbHN0YXRlZGlyPSIvdmFyIgpleHBvcnQgbWFuZGlyPSIvdXNyL3NoYXJl
L21hbiIKZXhwb3J0IG5vbmFyY2hfYmFzZV9saWJkaXI9Ii9saWIiCmV4cG9ydCBub25hcmNoX2xp
YmRpcj0iL3Vzci9saWIiCmV4cG9ydCBvbGRpbmNsdWRlZGlyPSIvdXNyL2luY2x1ZGUiCmV4cG9y
dCBwcmVmaXg9Ii91c3IiCmV4cG9ydCBzYmluZGlyPSIvdXNyL3NiaW4iCmV4cG9ydCBzZXJ2aWNl
ZGlyPSIvc3J2IgpleHBvcnQgc2hhcmVkc3RhdGVkaXI9Ii9jb20iCmV4cG9ydCBzeXNjb25mZGly
PSIvZXRjIgpleHBvcnQgc3lzdGVtZF9zeXN0ZW1fdW5pdGRpcj0iL2xpYi9zeXN0ZW1kL3N5c3Rl
bSIKZXhwb3J0IHN5c3RlbWRfdW5pdGRpcj0iL2xpYi9zeXN0ZW1kIgpleHBvcnQgc3lzdGVtZF91
c2VyX3VuaXRkaXI9Ii91c3IvbGliL3N5c3RlbWQvdXNlciIKCmRvX2NvbXBpbGUoKSB7CiAgIG9l
X3J1bm1ha2UgVj0wIFwKICAgICAgICBDUk9TU19DT01QSUxFPWFybS1vZS1saW51eC1nbnVlYWJp
LSBcCiAgICAgICAgS0RJUj0vaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrLXNoYXJlZC9vcmFuZ2UtcGktemVyby9rZXJuZWwtYnVp
bGQtYXJ0aWZhY3RzCgogICBjZCAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L3Rvb2xzCiAgIGV4cG9ydCBKQUlMSE9VU0VfVkVSU0lP
Tj0kKGNhdCAuLi9WRVJTSU9OKQogICBvZV9ydW5tYWtlIFY9MCBcCiAgIAkgICAgICAgQ0ZMQUdT
PSIgLU8yIC1waXBlIC1nIC1mZWxpbWluYXRlLXVudXNlZC1kZWJ1Zy10eXBlcyAtZm1hY3JvLXBy
ZWZpeC1tYXA9L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2Fy
bS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3Vz
ZS8wLjExLXIwPS91c3Ivc3JjL2RlYnVnL2phaWxob3VzZS8wLjExLXIwICAgICAgICAgICAgICAg
ICAgICAgIC1mZGVidWctcHJlZml4LW1hcD0vaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3Jhbmdl
cGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4
LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjA9L3Vzci9zcmMvZGVidWcvamFpbGhvdXNlLzAuMTEt
cjAgICAgICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL2NldmF0L0Rl
c2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3Jhbmdl
X3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9v
dD0gICAgICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL2NldmF0L0Rl
c2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3Jhbmdl
X3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9v
dC1uYXRpdmU9ICAtRExJQkVYRUNESVI9XFxcIi91c3IvbGliZXhlY1xcXCIgCQkgIC1ESkFJTEhP
VVNFX1ZFUlNJT049XFxcIiRKQUlMSE9VU0VfVkVSU0lPTlxcXCIgCQkgIC1XYWxsIC1XZXh0cmEg
LVdtaXNzaW5nLWRlY2xhcmF0aW9ucyAtV21pc3NpbmctcHJvdG90eXBlcyAtV2Vycm9yIAkJICAt
SS4uL2RyaXZlciIgXAogICAgICAgICAgICAgICBzcmM9L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRh
LW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1v
ZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC90b29scyBvYmo9L2hvbWUvY2V2
YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9v
cmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC90b29s
cyBcCgkgICAgICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxk
X2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxo
b3VzZS8wLjExLXIwL2dpdC90b29scy9qYWlsaG91c2UtY29uZmlnLWNvbGxlY3QgL2hvbWUvY2V2
YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9v
cmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC90b29s
cy9qYWlsaG91c2UKfQoKb2VfcnVubWFrZSgpIHsKCW9lX3J1bm1ha2VfY2FsbCAiJEAiIHx8IGRp
ZSAib2VfcnVubWFrZSBmYWlsZWQiCn0KCm9lX3J1bm1ha2VfY2FsbCgpIHsKCWJibm90ZSBtYWtl
IC1qIDggIEtFUk5FTF9TUkM9L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3Rv
L2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay1zaGFyZWQvb3JhbmdlLXBpLXplcm8va2VybmVsLXNv
dXJjZSAiJEAiCgltYWtlIC1qIDggIEtFUk5FTF9TUkM9L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRh
LW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay1zaGFyZWQvb3JhbmdlLXBp
LXplcm8va2VybmVsLXNvdXJjZSAiJEAiCn0KCmRpZSgpIHsKCWJiZmF0YWxfbG9nICIkKiIKfQoK
YmJmYXRhbF9sb2coKSB7CglpZiBbIC1wIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2Vw
aS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgt
Z251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC90ZW1wL2ZpZm8uMTQ1OTggXSA7IHRoZW4KCQlwcmlu
dGYgIiViXDAiICJiYmZhdGFsX2xvZyAkKiIgPiAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3Jh
bmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxp
bnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvdGVtcC9maWZvLjE0NTk4CgllbHNlCgkJZWNo
byAiRVJST1I6ICQqIgoJZmkKCWV4aXQgMQp9CgpiYm5vdGUoKSB7CglpZiBbIC1wIC9ob21lL2Nl
dmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsv
b3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC90ZW1wL2Zp
Zm8uMTQ1OTggXSA7IHRoZW4KCQlwcmludGYgIiViXDAiICJiYm5vdGUgJCoiID4gL2hvbWUvY2V2
YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9v
cmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3RlbXAvZmlm
by4xNDU5OAoJZWxzZQoJCWVjaG8gIk5PVEU6ICQqIgoJZmkKfQoKY2QgJy9ob21lL2NldmF0L0Rl
c2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3Jhbmdl
X3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQnCmRvX2NvbXBp
bGUKCiMgY2xlYW51cApyZXQ9JD8KdHJhcCAnJyAwCmV4aXQgJHJldAo=
------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=run.do_compile.14598
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=run.do_compile.14598
X-Attachment-Id: c3f6f274-d0cd-49d9-a682-38d29a0d8258
Content-ID: <c3f6f274-d0cd-49d9-a682-38d29a0d8258>

IyEvYmluL3NoCgojIEVtaXQgYSB1c2VmdWwgZGlhZ25vc3RpYyBpZiBzb21ldGhpbmcgZmFpbHM6
CmJiX2V4aXRfaGFuZGxlcigpIHsKICAgIHJldD0kPwogICAgY2FzZSAkcmV0IGluCiAgICAwKSAg
OzsKICAgICopICBjYXNlICRCQVNIX1ZFUlNJT04gaW4KICAgICAgICAiIikgZWNobyAiV0FSTklO
RzogZXhpdCBjb2RlICRyZXQgZnJvbSBhIHNoZWxsIGNvbW1hbmQuIjs7CiAgICAgICAgKikgIGVj
aG8gIldBUk5JTkc6ICR7QkFTSF9TT1VSQ0VbMF19OiR7QkFTSF9MSU5FTk9bMF19IGV4aXQgJHJl
dCBmcm9tICckQkFTSF9DT01NQU5EJyI7OwogICAgICAgIGVzYWMKICAgICAgICBleGl0ICRyZXQK
ICAgIGVzYWMKfQp0cmFwICdiYl9leGl0X2hhbmRsZXInIDAKc2V0IC1lCmV4cG9ydCBBUj0iYXJt
LW9lLWxpbnV4LWdudWVhYmktZ2NjLWFyIgpleHBvcnQgQVJDSD0iYXJtIgpleHBvcnQgQVM9ImFy
bS1vZS1saW51eC1nbnVlYWJpLWFzICIKZXhwb3J0IEJVSUxEX0FSPSJhciIKZXhwb3J0IEJVSUxE
X0FTPSJhcyAiCmV4cG9ydCBCVUlMRF9DQz0iZ2NjICIKZXhwb3J0IEJVSUxEX0NDTEQ9ImdjYyAi
CmV4cG9ydCBCVUlMRF9DRkxBR1M9Ii1pc3lzdGVtL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9y
YW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1s
aW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3Iv
aW5jbHVkZSAtTzIgLXBpcGUiCmV4cG9ydCBCVUlMRF9DUFA9ImdjYyAgLUUiCmV4cG9ydCBCVUlM
RF9DUFBGTEFHUz0iLWlzeXN0ZW0vaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9pbmNsdWRlIgpl
eHBvcnQgQlVJTERfQ1hYPSJnKysgIgpleHBvcnQgQlVJTERfQ1hYRkxBR1M9Ii1pc3lzdGVtL2hv
bWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMv
d29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3Jl
Y2lwZS1zeXNyb290LW5hdGl2ZS91c3IvaW5jbHVkZSAtTzIgLXBpcGUiCmV4cG9ydCBCVUlMRF9G
Qz0iZ2ZvcnRyYW4gIgpleHBvcnQgQlVJTERfTEQ9ImxkICIKZXhwb3J0IEJVSUxEX0xERkxBR1M9
Ii1ML2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvbGliICAgICAgICAgICAgICAgICAgICAgICAg
IC1ML2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS9saWIgICAgICAgICAgICAgICAgICAgICAgICAgLVds
LC0tZW5hYmxlLW5ldy1kdGFncyAgICAgICAgICAgICAgICAgICAgICAgICAtV2wsLXJwYXRoLWxp
bmssL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvbGliICAgICAgICAgICAgICAgICAgICAgICAg
IC1XbCwtcnBhdGgtbGluaywvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkv
amFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL2xpYiAgICAgICAgICAgICAg
ICAgICAgICAgICAtV2wsLXJwYXRoLC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95
b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251
ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2xpYiAgICAg
ICAgICAgICAgICAgICAgICAgICAtV2wsLXJwYXRoLC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2Ut
bGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvbGli
ICAgICAgICAgICAgICAgICAgICAgICAgIC1XbCwtTzEiCmV4cG9ydCBCVUlMRF9OTT0ibm0iCmV4
cG9ydCBCVUlMRF9SQU5MSUI9InJhbmxpYiIKZXhwb3J0IEJVSUxEX1NUUklQPSJzdHJpcCIKZXhw
b3J0IENDPSJhcm0tb2UtbGludXgtZ251ZWFiaS1nY2MgIC1tZnB1PW5lb24tdmZwdjQgLW1mbG9h
dC1hYmk9aGFyZCAtbWNwdT1jb3J0ZXgtYTcgLS1zeXNyb290PS9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3pl
cm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdCIKZXhw
b3J0IENDTEQ9ImFybS1vZS1saW51eC1nbnVlYWJpLWdjYyAgLW1mcHU9bmVvbi12ZnB2NCAtbWZs
b2F0LWFiaT1oYXJkIC1tY3B1PWNvcnRleC1hNyAtLXN5c3Jvb3Q9L2hvbWUvY2V2YXQvRGVza3Rv
cC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlf
emVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290Igpl
eHBvcnQgQ0ZMQUdTPSIgLU8yIC1waXBlIC1nIC1mZWxpbWluYXRlLXVudXNlZC1kZWJ1Zy10eXBl
cyAtZm1hY3JvLXByZWZpeC1tYXA9L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lv
Y3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVl
YWJpL2phaWxob3VzZS8wLjExLXIwPS91c3Ivc3JjL2RlYnVnL2phaWxob3VzZS8wLjExLXIwICAg
ICAgICAgICAgICAgICAgICAgIC1mZGVidWctcHJlZml4LW1hcD0vaG9tZS9jZXZhdC9EZXNrdG9w
L21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96
ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjA9L3Vzci9zcmMvZGVidWcvamFp
bGhvdXNlLzAuMTEtcjAgICAgICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9o
b21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJj
L3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9y
ZWNpcGUtc3lzcm9vdD0gICAgICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9o
b21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJj
L3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9y
ZWNpcGUtc3lzcm9vdC1uYXRpdmU9ICIKZXhwb3J0IENQUD0iYXJtLW9lLWxpbnV4LWdudWVhYmkt
Z2NjIC1FIC0tc3lzcm9vdD0vaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkv
amFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QgIC1tZnB1PW5lb24tdmZwdjQgLW1mbG9h
dC1hYmk9aGFyZCAtbWNwdT1jb3J0ZXgtYTciCmV4cG9ydCBDUFBGTEFHUz0iIgpleHBvcnQgQ1JP
U1NfQ09NUElMRT0iYXJtLW9lLWxpbnV4LWdudWVhYmktIgpleHBvcnQgQ1hYPSJhcm0tb2UtbGlu
dXgtZ251ZWFiaS1nKysgIC1tZnB1PW5lb24tdmZwdjQgLW1mbG9hdC1hYmk9aGFyZCAtbWNwdT1j
b3J0ZXgtYTcgLS1zeXNyb290PS9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0
by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFi
aS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdCIKZXhwb3J0IENYWEZMQUdTPSIgLU8y
IC1waXBlIC1nIC1mZWxpbWluYXRlLXVudXNlZC1kZWJ1Zy10eXBlcyAtZm1hY3JvLXByZWZpeC1t
YXA9L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwPS91c3Ivc3JjL2RlYnVnL2phaWxob3VzZS8wLjExLXIwICAgICAgICAgICAgICAgICAgICAg
IC1mZGVidWctcHJlZml4LW1hcD0vaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjA9L3Vzci9zcmMvZGVidWcvamFpbGhvdXNlLzAuMTEtcjAgICAg
ICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3pl
cm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdD0gICAg
ICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3pl
cm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRp
dmU9ICAtZnZpc2liaWxpdHktaW5saW5lcy1oaWRkZW4iCnVuc2V0IERJU1RSTwpleHBvcnQgRkM9
ImFybS1vZS1saW51eC1nbnVlYWJpLWdmb3J0cmFuICAtbWZwdT1uZW9uLXZmcHY0IC1tZmxvYXQt
YWJpPWhhcmQgLW1jcHU9Y29ydGV4LWE3IC0tc3lzcm9vdD0vaG9tZS9jZXZhdC9EZXNrdG9wL21l
dGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJv
LW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QiCmV4cG9y
dCBIT01FPSIvaG9tZS9jZXZhdCIKZXhwb3J0IEtCVUlMRF9PVVRQVVQ9Ii9ob21lL2NldmF0L0Rl
c2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmstc2hhcmVk
L29yYW5nZS1waS16ZXJvL2tlcm5lbC1idWlsZC1hcnRpZmFjdHMiCmV4cG9ydCBLRVJORUxfVkVS
U0lPTj0iNC4xOS42MyIKZXhwb3J0IExDX0FMTD0iZW5fVVMuVVRGLTgiCmV4cG9ydCBMRD0iYXJt
LW9lLWxpbnV4LWdudWVhYmktbGQgLS1zeXNyb290PS9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2Ut
bGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdCAiCmV4cG9ydCBM
REZMQUdTPSItV2wsLU8xIC1XbCwtLWhhc2gtc3R5bGU9Z251IC1XbCwtLWFzLW5lZWRlZCIKZXhw
b3J0IExPR05BTUU9ImNldmF0Igp1bnNldCBNQUNISU5FCmV4cG9ydCBNQUtFPSJtYWtlIgpleHBv
cnQgTk09ImFybS1vZS1saW51eC1nbnVlYWJpLW5tIgpleHBvcnQgT0JKQ09QWT0iYXJtLW9lLWxp
bnV4LWdudWVhYmktb2JqY29weSIKZXhwb3J0IE9CSkRVTVA9ImFybS1vZS1saW51eC1nbnVlYWJp
LW9iamR1bXAiCmV4cG9ydCBPUz0ibGludXgtZ251ZWFiaSIKZXhwb3J0IFBBVEg9Ii9ob21lL2Nl
dmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsv
b3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUt
c3lzcm9vdC1uYXRpdmUvdXNyL2Jpbi9weXRob24tbmF0aXZlOi9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9wb2t5L3NjcmlwdHM6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRh
LW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1v
ZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91
c3IvYmluL2FybS1vZS1saW51eC1nbnVlYWJpOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFu
Z2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGlu
dXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC91c3IvYmluL2Nyb3Nz
c2NyaXB0czovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJt
L3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNl
LzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9zYmluOi9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3Bp
X3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1u
YXRpdmUvdXNyL2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVp
bGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFp
bGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3NiaW46L2hvbWUvY2V2YXQvRGVz
a3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2Vf
cGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290
LW5hdGl2ZS9iaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL3Bva3kv
Yml0YmFrZS9iaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxk
X2FybS90bXAtZ2xpYmMvaG9zdHRvb2xzIgpleHBvcnQgUEtHX0NPTkZJR19ESVI9Ii9ob21lL2Nl
dmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsv
b3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUt
c3lzcm9vdC91c3IvbGliL3BrZ2NvbmZpZyIKZXhwb3J0IFBLR19DT05GSUdfRElTQUJMRV9VTklO
U1RBTExFRD0ieWVzIgpleHBvcnQgUEtHX0NPTkZJR19MSUJESVI9Ii9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3Bp
X3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC91
c3IvbGliL3BrZ2NvbmZpZyIKZXhwb3J0IFBLR19DT05GSUdfUEFUSD0iL2hvbWUvY2V2YXQvRGVz
a3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2Vf
cGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290
L3Vzci9saWIvcGtnY29uZmlnOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0
by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFi
aS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC91c3Ivc2hhcmUvcGtnY29uZmlnIgpl
eHBvcnQgUEtHX0NPTkZJR19TWVNST09UX0RJUj0iL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9y
YW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1s
aW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290IgpleHBvcnQgUEtH
X0NPTkZJR19TWVNURU1fSU5DTFVERV9QQVRIPSIvdXNyL2luY2x1ZGUiCmV4cG9ydCBQS0dfQ09O
RklHX1NZU1RFTV9MSUJSQVJZX1BBVEg9Ii9saWI6L3Vzci9saWIiCmV4cG9ydCBQU0VVRE9fRElT
QUJMRUQ9IjEiCmV4cG9ydCBQU0VVRE9fVU5MT0FEPSIxIgpleHBvcnQgUFlUSE9OPSIvaG9tZS9j
ZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3Jr
L29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBl
LXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vcHl0aG9uLW5hdGl2ZS9weXRob24iCmV4cG9ydCBQWVRI
T05OT1VTRVJTSVRFPSIxIgpleHBvcnQgUkFOTElCPSJhcm0tb2UtbGludXgtZ251ZWFiaS1nY2Mt
cmFubGliIgpleHBvcnQgUkVBREVMRj0iYXJtLW9lLWxpbnV4LWdudWVhYmktcmVhZGVsZiIKdW5z
ZXQgU0hFTEwKZXhwb3J0IFNUQUdJTkdfSU5DRElSPSIvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEt
b3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9l
LWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QvdXNyL2luY2x1
ZGUiCmV4cG9ydCBTVEFHSU5HX0xJQkRJUj0iL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5n
ZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51
eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290L3Vzci9saWIiCmV4cG9y
dCBTVFJJTkdTPSJhcm0tb2UtbGludXgtZ251ZWFiaS1zdHJpbmdzIgpleHBvcnQgU1RSSVA9ImFy
bS1vZS1saW51eC1nbnVlYWJpLXN0cmlwIgp1bnNldCBUQVJHRVRfQVJDSApleHBvcnQgVEVSTT0i
eHRlcm0iCmV4cG9ydCBUWj0iVVRDIgpleHBvcnQgVUJPT1RfQVJDSD0iYXJtIgpleHBvcnQgVVNF
Uj0iY2V2YXQiCmV4cG9ydCBiYXNlX2JpbmRpcj0iL2JpbiIKZXhwb3J0IGJhc2VfbGliZGlyPSIv
bGliIgpleHBvcnQgYmFzZV9wcmVmaXg9IiIKZXhwb3J0IGJhc2Vfc2JpbmRpcj0iL3NiaW4iCmV4
cG9ydCBiaW5kaXI9Ii91c3IvYmluIgpleHBvcnQgZGF0YWRpcj0iL3Vzci9zaGFyZSIKZXhwb3J0
IGRvY2Rpcj0iL3Vzci9zaGFyZS9kb2MiCmV4cG9ydCBleGVjX3ByZWZpeD0iL3VzciIKZXhwb3J0
IGluY2x1ZGVkaXI9Ii91c3IvaW5jbHVkZSIKZXhwb3J0IGluZm9kaXI9Ii91c3Ivc2hhcmUvaW5m
byIKZXhwb3J0IGxpYmRpcj0iL3Vzci9saWIiCmV4cG9ydCBsaWJleGVjZGlyPSIvdXNyL2xpYmV4
ZWMiCmV4cG9ydCBsb2NhbHN0YXRlZGlyPSIvdmFyIgpleHBvcnQgbWFuZGlyPSIvdXNyL3NoYXJl
L21hbiIKZXhwb3J0IG5vbmFyY2hfYmFzZV9saWJkaXI9Ii9saWIiCmV4cG9ydCBub25hcmNoX2xp
YmRpcj0iL3Vzci9saWIiCmV4cG9ydCBvbGRpbmNsdWRlZGlyPSIvdXNyL2luY2x1ZGUiCmV4cG9y
dCBwcmVmaXg9Ii91c3IiCmV4cG9ydCBzYmluZGlyPSIvdXNyL3NiaW4iCmV4cG9ydCBzZXJ2aWNl
ZGlyPSIvc3J2IgpleHBvcnQgc2hhcmVkc3RhdGVkaXI9Ii9jb20iCmV4cG9ydCBzeXNjb25mZGly
PSIvZXRjIgpleHBvcnQgc3lzdGVtZF9zeXN0ZW1fdW5pdGRpcj0iL2xpYi9zeXN0ZW1kL3N5c3Rl
bSIKZXhwb3J0IHN5c3RlbWRfdW5pdGRpcj0iL2xpYi9zeXN0ZW1kIgpleHBvcnQgc3lzdGVtZF91
c2VyX3VuaXRkaXI9Ii91c3IvbGliL3N5c3RlbWQvdXNlciIKCmRvX2NvbXBpbGUoKSB7CiAgIG9l
X3J1bm1ha2UgVj0wIFwKICAgICAgICBDUk9TU19DT01QSUxFPWFybS1vZS1saW51eC1nbnVlYWJp
LSBcCiAgICAgICAgS0RJUj0vaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrLXNoYXJlZC9vcmFuZ2UtcGktemVyby9rZXJuZWwtYnVp
bGQtYXJ0aWZhY3RzCgogICBjZCAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L3Rvb2xzCiAgIGV4cG9ydCBKQUlMSE9VU0VfVkVSU0lP
Tj0kKGNhdCAuLi9WRVJTSU9OKQogICBvZV9ydW5tYWtlIFY9MCBcCiAgIAkgICAgICAgQ0ZMQUdT
PSIgLU8yIC1waXBlIC1nIC1mZWxpbWluYXRlLXVudXNlZC1kZWJ1Zy10eXBlcyAtZm1hY3JvLXBy
ZWZpeC1tYXA9L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2Fy
bS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3Vz
ZS8wLjExLXIwPS91c3Ivc3JjL2RlYnVnL2phaWxob3VzZS8wLjExLXIwICAgICAgICAgICAgICAg
ICAgICAgIC1mZGVidWctcHJlZml4LW1hcD0vaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3Jhbmdl
cGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4
LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjA9L3Vzci9zcmMvZGVidWcvamFpbGhvdXNlLzAuMTEt
cjAgICAgICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL2NldmF0L0Rl
c2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3Jhbmdl
X3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9v
dD0gICAgICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL2NldmF0L0Rl
c2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3Jhbmdl
X3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9v
dC1uYXRpdmU9ICAtRExJQkVYRUNESVI9XFxcIi91c3IvbGliZXhlY1xcXCIgCQkgIC1ESkFJTEhP
VVNFX1ZFUlNJT049XFxcIiRKQUlMSE9VU0VfVkVSU0lPTlxcXCIgCQkgIC1XYWxsIC1XZXh0cmEg
LVdtaXNzaW5nLWRlY2xhcmF0aW9ucyAtV21pc3NpbmctcHJvdG90eXBlcyAtV2Vycm9yIAkJICAt
SS4uL2RyaXZlciIgXAogICAgICAgICAgICAgICBzcmM9L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRh
LW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1v
ZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC90b29scyBvYmo9L2hvbWUvY2V2
YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9v
cmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC90b29s
cyBcCgkgICAgICAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxk
X2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxo
b3VzZS8wLjExLXIwL2dpdC90b29scy9qYWlsaG91c2UtY29uZmlnLWNvbGxlY3QgL2hvbWUvY2V2
YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9v
cmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC90b29s
cy9qYWlsaG91c2UKfQoKb2VfcnVubWFrZSgpIHsKCW9lX3J1bm1ha2VfY2FsbCAiJEAiIHx8IGRp
ZSAib2VfcnVubWFrZSBmYWlsZWQiCn0KCm9lX3J1bm1ha2VfY2FsbCgpIHsKCWJibm90ZSBtYWtl
IC1qIDggIEtFUk5FTF9TUkM9L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3Rv
L2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay1zaGFyZWQvb3JhbmdlLXBpLXplcm8va2VybmVsLXNv
dXJjZSAiJEAiCgltYWtlIC1qIDggIEtFUk5FTF9TUkM9L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRh
LW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay1zaGFyZWQvb3JhbmdlLXBp
LXplcm8va2VybmVsLXNvdXJjZSAiJEAiCn0KCmRpZSgpIHsKCWJiZmF0YWxfbG9nICIkKiIKfQoK
YmJmYXRhbF9sb2coKSB7CglpZiBbIC1wIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2Vw
aS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgt
Z251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC90ZW1wL2ZpZm8uMTQ1OTggXSA7IHRoZW4KCQlwcmlu
dGYgIiViXDAiICJiYmZhdGFsX2xvZyAkKiIgPiAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3Jh
bmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxp
bnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvdGVtcC9maWZvLjE0NTk4CgllbHNlCgkJZWNo
byAiRVJST1I6ICQqIgoJZmkKCWV4aXQgMQp9CgpiYm5vdGUoKSB7CglpZiBbIC1wIC9ob21lL2Nl
dmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsv
b3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC90ZW1wL2Zp
Zm8uMTQ1OTggXSA7IHRoZW4KCQlwcmludGYgIiViXDAiICJiYm5vdGUgJCoiID4gL2hvbWUvY2V2
YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9v
cmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3RlbXAvZmlm
by4xNDU5OAoJZWxzZQoJCWVjaG8gIk5PVEU6ICQqIgoJZmkKfQoKY2QgJy9ob21lL2NldmF0L0Rl
c2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3Jhbmdl
X3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQnCmRvX2NvbXBp
bGUKCiMgY2xlYW51cApyZXQ9JD8KdHJhcCAnJyAwCmV4aXQgJHJldAo=
------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=run.do_configure
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=run.do_configure
X-Attachment-Id: 6456bb17-47d8-49bb-aa19-13edacf17726
Content-ID: <6456bb17-47d8-49bb-aa19-13edacf17726>

IyEvYmluL3NoCgojIEVtaXQgYSB1c2VmdWwgZGlhZ25vc3RpYyBpZiBzb21ldGhpbmcgZmFpbHM6
CmJiX2V4aXRfaGFuZGxlcigpIHsKICAgIHJldD0kPwogICAgY2FzZSAkcmV0IGluCiAgICAwKSAg
OzsKICAgICopICBjYXNlICRCQVNIX1ZFUlNJT04gaW4KICAgICAgICAiIikgZWNobyAiV0FSTklO
RzogZXhpdCBjb2RlICRyZXQgZnJvbSBhIHNoZWxsIGNvbW1hbmQuIjs7CiAgICAgICAgKikgIGVj
aG8gIldBUk5JTkc6ICR7QkFTSF9TT1VSQ0VbMF19OiR7QkFTSF9MSU5FTk9bMF19IGV4aXQgJHJl
dCBmcm9tICckQkFTSF9DT01NQU5EJyI7OwogICAgICAgIGVzYWMKICAgICAgICBleGl0ICRyZXQK
ICAgIGVzYWMKfQp0cmFwICdiYl9leGl0X2hhbmRsZXInIDAKc2V0IC1lCmV4cG9ydCBBUj0iYXJt
LW9lLWxpbnV4LWdudWVhYmktZ2NjLWFyIgpleHBvcnQgQVJDSD0iYXJtIgpleHBvcnQgQVM9ImFy
bS1vZS1saW51eC1nbnVlYWJpLWFzICIKZXhwb3J0IEJVSUxEX0FSPSJhciIKZXhwb3J0IEJVSUxE
X0FTPSJhcyAiCmV4cG9ydCBCVUlMRF9DQz0iZ2NjICIKZXhwb3J0IEJVSUxEX0NDTEQ9ImdjYyAi
CmV4cG9ydCBCVUlMRF9DRkxBR1M9Ii1pc3lzdGVtL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9y
YW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1s
aW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3Iv
aW5jbHVkZSAtTzIgLXBpcGUiCmV4cG9ydCBCVUlMRF9DUFA9ImdjYyAgLUUiCmV4cG9ydCBCVUlM
RF9DUFBGTEFHUz0iLWlzeXN0ZW0vaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9pbmNsdWRlIgpl
eHBvcnQgQlVJTERfQ1hYPSJnKysgIgpleHBvcnQgQlVJTERfQ1hYRkxBR1M9Ii1pc3lzdGVtL2hv
bWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMv
d29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3Jl
Y2lwZS1zeXNyb290LW5hdGl2ZS91c3IvaW5jbHVkZSAtTzIgLXBpcGUiCmV4cG9ydCBCVUlMRF9G
Qz0iZ2ZvcnRyYW4gIgpleHBvcnQgQlVJTERfTEQ9ImxkICIKZXhwb3J0IEJVSUxEX0xERkxBR1M9
Ii1ML2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvbGliICAgICAgICAgICAgICAgICAgICAgICAg
IC1ML2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS9saWIgICAgICAgICAgICAgICAgICAgICAgICAgLVds
LC0tZW5hYmxlLW5ldy1kdGFncyAgICAgICAgICAgICAgICAgICAgICAgICAtV2wsLXJwYXRoLWxp
bmssL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvbGliICAgICAgICAgICAgICAgICAgICAgICAg
IC1XbCwtcnBhdGgtbGluaywvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkv
amFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL2xpYiAgICAgICAgICAgICAg
ICAgICAgICAgICAtV2wsLXJwYXRoLC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95
b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251
ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2xpYiAgICAg
ICAgICAgICAgICAgICAgICAgICAtV2wsLXJwYXRoLC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2Ut
bGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvbGli
ICAgICAgICAgICAgICAgICAgICAgICAgIC1XbCwtTzEiCmV4cG9ydCBCVUlMRF9OTT0ibm0iCmV4
cG9ydCBCVUlMRF9SQU5MSUI9InJhbmxpYiIKZXhwb3J0IEJVSUxEX1NUUklQPSJzdHJpcCIKZXhw
b3J0IENDPSJhcm0tb2UtbGludXgtZ251ZWFiaS1nY2MgIC1tZnB1PW5lb24tdmZwdjQgLW1mbG9h
dC1hYmk9aGFyZCAtbWNwdT1jb3J0ZXgtYTcgLS1zeXNyb290PS9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3pl
cm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdCIKZXhw
b3J0IENDTEQ9ImFybS1vZS1saW51eC1nbnVlYWJpLWdjYyAgLW1mcHU9bmVvbi12ZnB2NCAtbWZs
b2F0LWFiaT1oYXJkIC1tY3B1PWNvcnRleC1hNyAtLXN5c3Jvb3Q9L2hvbWUvY2V2YXQvRGVza3Rv
cC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlf
emVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290Igpl
eHBvcnQgQ0ZMQUdTPSIgLU8yIC1waXBlIC1nIC1mZWxpbWluYXRlLXVudXNlZC1kZWJ1Zy10eXBl
cyAtZm1hY3JvLXByZWZpeC1tYXA9L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lv
Y3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVl
YWJpL2phaWxob3VzZS8wLjExLXIwPS91c3Ivc3JjL2RlYnVnL2phaWxob3VzZS8wLjExLXIwICAg
ICAgICAgICAgICAgICAgICAgIC1mZGVidWctcHJlZml4LW1hcD0vaG9tZS9jZXZhdC9EZXNrdG9w
L21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96
ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjA9L3Vzci9zcmMvZGVidWcvamFp
bGhvdXNlLzAuMTEtcjAgICAgICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9o
b21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJj
L3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9y
ZWNpcGUtc3lzcm9vdD0gICAgICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9o
b21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJj
L3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9y
ZWNpcGUtc3lzcm9vdC1uYXRpdmU9ICIKZXhwb3J0IENQUD0iYXJtLW9lLWxpbnV4LWdudWVhYmkt
Z2NjIC1FIC0tc3lzcm9vdD0vaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkv
amFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QgIC1tZnB1PW5lb24tdmZwdjQgLW1mbG9h
dC1hYmk9aGFyZCAtbWNwdT1jb3J0ZXgtYTciCmV4cG9ydCBDUFBGTEFHUz0iIgpleHBvcnQgQ1JP
U1NfQ09NUElMRT0iYXJtLW9lLWxpbnV4LWdudWVhYmktIgpleHBvcnQgQ1hYPSJhcm0tb2UtbGlu
dXgtZ251ZWFiaS1nKysgIC1tZnB1PW5lb24tdmZwdjQgLW1mbG9hdC1hYmk9aGFyZCAtbWNwdT1j
b3J0ZXgtYTcgLS1zeXNyb290PS9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0
by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFi
aS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdCIKZXhwb3J0IENYWEZMQUdTPSIgLU8y
IC1waXBlIC1nIC1mZWxpbWluYXRlLXVudXNlZC1kZWJ1Zy10eXBlcyAtZm1hY3JvLXByZWZpeC1t
YXA9L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwPS91c3Ivc3JjL2RlYnVnL2phaWxob3VzZS8wLjExLXIwICAgICAgICAgICAgICAgICAgICAg
IC1mZGVidWctcHJlZml4LW1hcD0vaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjA9L3Vzci9zcmMvZGVidWcvamFpbGhvdXNlLzAuMTEtcjAgICAg
ICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3pl
cm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdD0gICAg
ICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3pl
cm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRp
dmU9ICAtZnZpc2liaWxpdHktaW5saW5lcy1oaWRkZW4iCnVuc2V0IERJU1RSTwpleHBvcnQgRkM9
ImFybS1vZS1saW51eC1nbnVlYWJpLWdmb3J0cmFuICAtbWZwdT1uZW9uLXZmcHY0IC1tZmxvYXQt
YWJpPWhhcmQgLW1jcHU9Y29ydGV4LWE3IC0tc3lzcm9vdD0vaG9tZS9jZXZhdC9EZXNrdG9wL21l
dGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJv
LW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QiCmV4cG9y
dCBIT01FPSIvaG9tZS9jZXZhdCIKZXhwb3J0IEtCVUlMRF9PVVRQVVQ9Ii9ob21lL2NldmF0L0Rl
c2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmstc2hhcmVk
L29yYW5nZS1waS16ZXJvL2tlcm5lbC1idWlsZC1hcnRpZmFjdHMiCmV4cG9ydCBLRVJORUxfVkVS
U0lPTj0iNC4xOS42MyIKZXhwb3J0IExDX0FMTD0iZW5fVVMuVVRGLTgiCmV4cG9ydCBMRD0iYXJt
LW9lLWxpbnV4LWdudWVhYmktbGQgLS1zeXNyb290PS9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2Ut
bGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdCAiCmV4cG9ydCBM
REZMQUdTPSItV2wsLU8xIC1XbCwtLWhhc2gtc3R5bGU9Z251IC1XbCwtLWFzLW5lZWRlZCIKZXhw
b3J0IExPR05BTUU9ImNldmF0Igp1bnNldCBNQUNISU5FCmV4cG9ydCBNQUtFPSJtYWtlIgpleHBv
cnQgTk09ImFybS1vZS1saW51eC1nbnVlYWJpLW5tIgpleHBvcnQgT0JKQ09QWT0iYXJtLW9lLWxp
bnV4LWdudWVhYmktb2JqY29weSIKZXhwb3J0IE9CSkRVTVA9ImFybS1vZS1saW51eC1nbnVlYWJp
LW9iamR1bXAiCmV4cG9ydCBPUz0ibGludXgtZ251ZWFiaSIKZXhwb3J0IFBBVEg9Ii9ob21lL2Nl
dmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsv
b3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUt
c3lzcm9vdC1uYXRpdmUvdXNyL2Jpbi9weXRob24tbmF0aXZlOi9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9wb2t5L3NjcmlwdHM6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRh
LW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1v
ZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91
c3IvYmluL2FybS1vZS1saW51eC1nbnVlYWJpOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFu
Z2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGlu
dXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC91c3IvYmluL2Nyb3Nz
c2NyaXB0czovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJt
L3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNl
LzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9zYmluOi9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3Bp
X3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1u
YXRpdmUvdXNyL2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVp
bGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFp
bGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3NiaW46L2hvbWUvY2V2YXQvRGVz
a3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2Vf
cGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290
LW5hdGl2ZS9iaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL3Bva3kv
Yml0YmFrZS9iaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxk
X2FybS90bXAtZ2xpYmMvaG9zdHRvb2xzIgpleHBvcnQgUEtHX0NPTkZJR19ESVI9Ii9ob21lL2Nl
dmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsv
b3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUt
c3lzcm9vdC91c3IvbGliL3BrZ2NvbmZpZyIKZXhwb3J0IFBLR19DT05GSUdfRElTQUJMRV9VTklO
U1RBTExFRD0ieWVzIgpleHBvcnQgUEtHX0NPTkZJR19MSUJESVI9Ii9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3Bp
X3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC91
c3IvbGliL3BrZ2NvbmZpZyIKZXhwb3J0IFBLR19DT05GSUdfUEFUSD0iL2hvbWUvY2V2YXQvRGVz
a3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2Vf
cGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290
L3Vzci9saWIvcGtnY29uZmlnOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0
by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFi
aS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC91c3Ivc2hhcmUvcGtnY29uZmlnIgpl
eHBvcnQgUEtHX0NPTkZJR19TWVNST09UX0RJUj0iL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9y
YW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1s
aW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290IgpleHBvcnQgUEtH
X0NPTkZJR19TWVNURU1fSU5DTFVERV9QQVRIPSIvdXNyL2luY2x1ZGUiCmV4cG9ydCBQS0dfQ09O
RklHX1NZU1RFTV9MSUJSQVJZX1BBVEg9Ii9saWI6L3Vzci9saWIiCmV4cG9ydCBQU0VVRE9fRElT
QUJMRUQ9IjEiCmV4cG9ydCBQU0VVRE9fVU5MT0FEPSIxIgpleHBvcnQgUFlUSE9OPSIvaG9tZS9j
ZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3Jr
L29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBl
LXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vcHl0aG9uLW5hdGl2ZS9weXRob24iCmV4cG9ydCBQWVRI
T05OT1VTRVJTSVRFPSIxIgpleHBvcnQgUkFOTElCPSJhcm0tb2UtbGludXgtZ251ZWFiaS1nY2Mt
cmFubGliIgpleHBvcnQgUkVBREVMRj0iYXJtLW9lLWxpbnV4LWdudWVhYmktcmVhZGVsZiIKdW5z
ZXQgU0hFTEwKZXhwb3J0IFNUQUdJTkdfSU5DRElSPSIvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEt
b3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9l
LWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QvdXNyL2luY2x1
ZGUiCmV4cG9ydCBTVEFHSU5HX0xJQkRJUj0iL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5n
ZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51
eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290L3Vzci9saWIiCmV4cG9y
dCBTVFJJTkdTPSJhcm0tb2UtbGludXgtZ251ZWFiaS1zdHJpbmdzIgpleHBvcnQgU1RSSVA9ImFy
bS1vZS1saW51eC1nbnVlYWJpLXN0cmlwIgp1bnNldCBUQVJHRVRfQVJDSApleHBvcnQgVEVSTT0i
eHRlcm0iCmV4cG9ydCBUWj0iVVRDIgpleHBvcnQgVUJPT1RfQVJDSD0iYXJtIgpleHBvcnQgVVNF
Uj0iY2V2YXQiCmV4cG9ydCBiYXNlX2JpbmRpcj0iL2JpbiIKZXhwb3J0IGJhc2VfbGliZGlyPSIv
bGliIgpleHBvcnQgYmFzZV9wcmVmaXg9IiIKZXhwb3J0IGJhc2Vfc2JpbmRpcj0iL3NiaW4iCmV4
cG9ydCBiaW5kaXI9Ii91c3IvYmluIgpleHBvcnQgZGF0YWRpcj0iL3Vzci9zaGFyZSIKZXhwb3J0
IGRvY2Rpcj0iL3Vzci9zaGFyZS9kb2MiCmV4cG9ydCBleGVjX3ByZWZpeD0iL3VzciIKZXhwb3J0
IGluY2x1ZGVkaXI9Ii91c3IvaW5jbHVkZSIKZXhwb3J0IGluZm9kaXI9Ii91c3Ivc2hhcmUvaW5m
byIKZXhwb3J0IGxpYmRpcj0iL3Vzci9saWIiCmV4cG9ydCBsaWJleGVjZGlyPSIvdXNyL2xpYmV4
ZWMiCmV4cG9ydCBsb2NhbHN0YXRlZGlyPSIvdmFyIgpleHBvcnQgbWFuZGlyPSIvdXNyL3NoYXJl
L21hbiIKZXhwb3J0IG5vbmFyY2hfYmFzZV9saWJkaXI9Ii9saWIiCmV4cG9ydCBub25hcmNoX2xp
YmRpcj0iL3Vzci9saWIiCmV4cG9ydCBvbGRpbmNsdWRlZGlyPSIvdXNyL2luY2x1ZGUiCmV4cG9y
dCBwcmVmaXg9Ii91c3IiCmV4cG9ydCBzYmluZGlyPSIvdXNyL3NiaW4iCmV4cG9ydCBzZXJ2aWNl
ZGlyPSIvc3J2IgpleHBvcnQgc2hhcmVkc3RhdGVkaXI9Ii9jb20iCmV4cG9ydCBzeXNjb25mZGly
PSIvZXRjIgpleHBvcnQgc3lzdGVtZF9zeXN0ZW1fdW5pdGRpcj0iL2xpYi9zeXN0ZW1kL3N5c3Rl
bSIKZXhwb3J0IHN5c3RlbWRfdW5pdGRpcj0iL2xpYi9zeXN0ZW1kIgpleHBvcnQgc3lzdGVtZF91
c2VyX3VuaXRkaXI9Ii91c3IvbGliL3N5c3RlbWQvdXNlciIKCmRvX2NvbmZpZ3VyZSgpIHsKICAg
aWYgWyAtZCAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJt
L3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNl
LzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QvL3Vzci9zaGFyZS9qYWlsaG91c2UvY29uZmlncyBdOwog
ICB0aGVuCiAgICAgIGNwICIvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkv
amFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QvL3Vzci9zaGFyZS9qYWlsaG91c2UvY29u
Zmlncy8iKi5jIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9h
cm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91
c2UvMC4xMS1yMC9naXQvY29uZmlncy8KICAgZmkKCiAgIGlmIFsgISAteiAvaG9tZS9jZXZhdC9E
ZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5n
ZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NpL2phaWxo
b3VzZS1jb25maWctYmFuYW5hLXBpLmggXTsKICAgdGhlbgogICAgICBjcCAtYXYgL2hvbWUvY2V2
YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9v
cmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9jaS9q
YWlsaG91c2UtY29uZmlnLWJhbmFuYS1waS5oIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFu
Z2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGlu
dXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvaW5jbHVkZS9qYWlsaG91c2UvY29uZmln
LmgKICAgZmkKfQoKY2QgJy9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9i
dWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9q
YWlsaG91c2UvMC4xMS1yMC9naXQnCmRvX2NvbmZpZ3VyZQoKIyBjbGVhbnVwCnJldD0kPwp0cmFw
ICcnIDAKZXhpdCAkcmV0Cg==
------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=run.do_configure.14592
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=run.do_configure.14592
X-Attachment-Id: 0291395d-445c-4b0a-95ef-1566d7aa1d87
Content-ID: <0291395d-445c-4b0a-95ef-1566d7aa1d87>

IyEvYmluL3NoCgojIEVtaXQgYSB1c2VmdWwgZGlhZ25vc3RpYyBpZiBzb21ldGhpbmcgZmFpbHM6
CmJiX2V4aXRfaGFuZGxlcigpIHsKICAgIHJldD0kPwogICAgY2FzZSAkcmV0IGluCiAgICAwKSAg
OzsKICAgICopICBjYXNlICRCQVNIX1ZFUlNJT04gaW4KICAgICAgICAiIikgZWNobyAiV0FSTklO
RzogZXhpdCBjb2RlICRyZXQgZnJvbSBhIHNoZWxsIGNvbW1hbmQuIjs7CiAgICAgICAgKikgIGVj
aG8gIldBUk5JTkc6ICR7QkFTSF9TT1VSQ0VbMF19OiR7QkFTSF9MSU5FTk9bMF19IGV4aXQgJHJl
dCBmcm9tICckQkFTSF9DT01NQU5EJyI7OwogICAgICAgIGVzYWMKICAgICAgICBleGl0ICRyZXQK
ICAgIGVzYWMKfQp0cmFwICdiYl9leGl0X2hhbmRsZXInIDAKc2V0IC1lCmV4cG9ydCBBUj0iYXJt
LW9lLWxpbnV4LWdudWVhYmktZ2NjLWFyIgpleHBvcnQgQVJDSD0iYXJtIgpleHBvcnQgQVM9ImFy
bS1vZS1saW51eC1nbnVlYWJpLWFzICIKZXhwb3J0IEJVSUxEX0FSPSJhciIKZXhwb3J0IEJVSUxE
X0FTPSJhcyAiCmV4cG9ydCBCVUlMRF9DQz0iZ2NjICIKZXhwb3J0IEJVSUxEX0NDTEQ9ImdjYyAi
CmV4cG9ydCBCVUlMRF9DRkxBR1M9Ii1pc3lzdGVtL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9y
YW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1s
aW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3Iv
aW5jbHVkZSAtTzIgLXBpcGUiCmV4cG9ydCBCVUlMRF9DUFA9ImdjYyAgLUUiCmV4cG9ydCBCVUlM
RF9DUFBGTEFHUz0iLWlzeXN0ZW0vaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9pbmNsdWRlIgpl
eHBvcnQgQlVJTERfQ1hYPSJnKysgIgpleHBvcnQgQlVJTERfQ1hYRkxBR1M9Ii1pc3lzdGVtL2hv
bWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMv
d29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3Jl
Y2lwZS1zeXNyb290LW5hdGl2ZS91c3IvaW5jbHVkZSAtTzIgLXBpcGUiCmV4cG9ydCBCVUlMRF9G
Qz0iZ2ZvcnRyYW4gIgpleHBvcnQgQlVJTERfTEQ9ImxkICIKZXhwb3J0IEJVSUxEX0xERkxBR1M9
Ii1ML2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvbGliICAgICAgICAgICAgICAgICAgICAgICAg
IC1ML2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS9saWIgICAgICAgICAgICAgICAgICAgICAgICAgLVds
LC0tZW5hYmxlLW5ldy1kdGFncyAgICAgICAgICAgICAgICAgICAgICAgICAtV2wsLXJwYXRoLWxp
bmssL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvbGliICAgICAgICAgICAgICAgICAgICAgICAg
IC1XbCwtcnBhdGgtbGluaywvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkv
amFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL2xpYiAgICAgICAgICAgICAg
ICAgICAgICAgICAtV2wsLXJwYXRoLC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95
b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251
ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2xpYiAgICAg
ICAgICAgICAgICAgICAgICAgICAtV2wsLXJwYXRoLC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2Ut
bGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvbGli
ICAgICAgICAgICAgICAgICAgICAgICAgIC1XbCwtTzEiCmV4cG9ydCBCVUlMRF9OTT0ibm0iCmV4
cG9ydCBCVUlMRF9SQU5MSUI9InJhbmxpYiIKZXhwb3J0IEJVSUxEX1NUUklQPSJzdHJpcCIKZXhw
b3J0IENDPSJhcm0tb2UtbGludXgtZ251ZWFiaS1nY2MgIC1tZnB1PW5lb24tdmZwdjQgLW1mbG9h
dC1hYmk9aGFyZCAtbWNwdT1jb3J0ZXgtYTcgLS1zeXNyb290PS9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3pl
cm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdCIKZXhw
b3J0IENDTEQ9ImFybS1vZS1saW51eC1nbnVlYWJpLWdjYyAgLW1mcHU9bmVvbi12ZnB2NCAtbWZs
b2F0LWFiaT1oYXJkIC1tY3B1PWNvcnRleC1hNyAtLXN5c3Jvb3Q9L2hvbWUvY2V2YXQvRGVza3Rv
cC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlf
emVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290Igpl
eHBvcnQgQ0ZMQUdTPSIgLU8yIC1waXBlIC1nIC1mZWxpbWluYXRlLXVudXNlZC1kZWJ1Zy10eXBl
cyAtZm1hY3JvLXByZWZpeC1tYXA9L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lv
Y3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVl
YWJpL2phaWxob3VzZS8wLjExLXIwPS91c3Ivc3JjL2RlYnVnL2phaWxob3VzZS8wLjExLXIwICAg
ICAgICAgICAgICAgICAgICAgIC1mZGVidWctcHJlZml4LW1hcD0vaG9tZS9jZXZhdC9EZXNrdG9w
L21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96
ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjA9L3Vzci9zcmMvZGVidWcvamFp
bGhvdXNlLzAuMTEtcjAgICAgICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9o
b21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJj
L3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9y
ZWNpcGUtc3lzcm9vdD0gICAgICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9o
b21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJj
L3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9y
ZWNpcGUtc3lzcm9vdC1uYXRpdmU9ICIKZXhwb3J0IENQUD0iYXJtLW9lLWxpbnV4LWdudWVhYmkt
Z2NjIC1FIC0tc3lzcm9vdD0vaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkv
amFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QgIC1tZnB1PW5lb24tdmZwdjQgLW1mbG9h
dC1hYmk9aGFyZCAtbWNwdT1jb3J0ZXgtYTciCmV4cG9ydCBDUFBGTEFHUz0iIgpleHBvcnQgQ1JP
U1NfQ09NUElMRT0iYXJtLW9lLWxpbnV4LWdudWVhYmktIgpleHBvcnQgQ1hYPSJhcm0tb2UtbGlu
dXgtZ251ZWFiaS1nKysgIC1tZnB1PW5lb24tdmZwdjQgLW1mbG9hdC1hYmk9aGFyZCAtbWNwdT1j
b3J0ZXgtYTcgLS1zeXNyb290PS9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0
by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFi
aS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdCIKZXhwb3J0IENYWEZMQUdTPSIgLU8y
IC1waXBlIC1nIC1mZWxpbWluYXRlLXVudXNlZC1kZWJ1Zy10eXBlcyAtZm1hY3JvLXByZWZpeC1t
YXA9L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwPS91c3Ivc3JjL2RlYnVnL2phaWxob3VzZS8wLjExLXIwICAgICAgICAgICAgICAgICAgICAg
IC1mZGVidWctcHJlZml4LW1hcD0vaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjA9L3Vzci9zcmMvZGVidWcvamFpbGhvdXNlLzAuMTEtcjAgICAg
ICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3pl
cm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdD0gICAg
ICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3pl
cm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRp
dmU9ICAtZnZpc2liaWxpdHktaW5saW5lcy1oaWRkZW4iCnVuc2V0IERJU1RSTwpleHBvcnQgRkM9
ImFybS1vZS1saW51eC1nbnVlYWJpLWdmb3J0cmFuICAtbWZwdT1uZW9uLXZmcHY0IC1tZmxvYXQt
YWJpPWhhcmQgLW1jcHU9Y29ydGV4LWE3IC0tc3lzcm9vdD0vaG9tZS9jZXZhdC9EZXNrdG9wL21l
dGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJv
LW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QiCmV4cG9y
dCBIT01FPSIvaG9tZS9jZXZhdCIKZXhwb3J0IEtCVUlMRF9PVVRQVVQ9Ii9ob21lL2NldmF0L0Rl
c2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmstc2hhcmVk
L29yYW5nZS1waS16ZXJvL2tlcm5lbC1idWlsZC1hcnRpZmFjdHMiCmV4cG9ydCBLRVJORUxfVkVS
U0lPTj0iNC4xOS42MyIKZXhwb3J0IExDX0FMTD0iZW5fVVMuVVRGLTgiCmV4cG9ydCBMRD0iYXJt
LW9lLWxpbnV4LWdudWVhYmktbGQgLS1zeXNyb290PS9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2Ut
bGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdCAiCmV4cG9ydCBM
REZMQUdTPSItV2wsLU8xIC1XbCwtLWhhc2gtc3R5bGU9Z251IC1XbCwtLWFzLW5lZWRlZCIKZXhw
b3J0IExPR05BTUU9ImNldmF0Igp1bnNldCBNQUNISU5FCmV4cG9ydCBNQUtFPSJtYWtlIgpleHBv
cnQgTk09ImFybS1vZS1saW51eC1nbnVlYWJpLW5tIgpleHBvcnQgT0JKQ09QWT0iYXJtLW9lLWxp
bnV4LWdudWVhYmktb2JqY29weSIKZXhwb3J0IE9CSkRVTVA9ImFybS1vZS1saW51eC1nbnVlYWJp
LW9iamR1bXAiCmV4cG9ydCBPUz0ibGludXgtZ251ZWFiaSIKZXhwb3J0IFBBVEg9Ii9ob21lL2Nl
dmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsv
b3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUt
c3lzcm9vdC1uYXRpdmUvdXNyL2Jpbi9weXRob24tbmF0aXZlOi9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9wb2t5L3NjcmlwdHM6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRh
LW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1v
ZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91
c3IvYmluL2FybS1vZS1saW51eC1nbnVlYWJpOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFu
Z2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGlu
dXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC91c3IvYmluL2Nyb3Nz
c2NyaXB0czovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJt
L3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNl
LzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9zYmluOi9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3Bp
X3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1u
YXRpdmUvdXNyL2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVp
bGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFp
bGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3NiaW46L2hvbWUvY2V2YXQvRGVz
a3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2Vf
cGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290
LW5hdGl2ZS9iaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL3Bva3kv
Yml0YmFrZS9iaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxk
X2FybS90bXAtZ2xpYmMvaG9zdHRvb2xzIgpleHBvcnQgUEtHX0NPTkZJR19ESVI9Ii9ob21lL2Nl
dmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsv
b3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUt
c3lzcm9vdC91c3IvbGliL3BrZ2NvbmZpZyIKZXhwb3J0IFBLR19DT05GSUdfRElTQUJMRV9VTklO
U1RBTExFRD0ieWVzIgpleHBvcnQgUEtHX0NPTkZJR19MSUJESVI9Ii9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3Bp
X3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC91
c3IvbGliL3BrZ2NvbmZpZyIKZXhwb3J0IFBLR19DT05GSUdfUEFUSD0iL2hvbWUvY2V2YXQvRGVz
a3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2Vf
cGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290
L3Vzci9saWIvcGtnY29uZmlnOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0
by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFi
aS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC91c3Ivc2hhcmUvcGtnY29uZmlnIgpl
eHBvcnQgUEtHX0NPTkZJR19TWVNST09UX0RJUj0iL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9y
YW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1s
aW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290IgpleHBvcnQgUEtH
X0NPTkZJR19TWVNURU1fSU5DTFVERV9QQVRIPSIvdXNyL2luY2x1ZGUiCmV4cG9ydCBQS0dfQ09O
RklHX1NZU1RFTV9MSUJSQVJZX1BBVEg9Ii9saWI6L3Vzci9saWIiCmV4cG9ydCBQU0VVRE9fRElT
QUJMRUQ9IjEiCmV4cG9ydCBQU0VVRE9fVU5MT0FEPSIxIgpleHBvcnQgUFlUSE9OPSIvaG9tZS9j
ZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3Jr
L29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBl
LXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vcHl0aG9uLW5hdGl2ZS9weXRob24iCmV4cG9ydCBQWVRI
T05OT1VTRVJTSVRFPSIxIgpleHBvcnQgUkFOTElCPSJhcm0tb2UtbGludXgtZ251ZWFiaS1nY2Mt
cmFubGliIgpleHBvcnQgUkVBREVMRj0iYXJtLW9lLWxpbnV4LWdudWVhYmktcmVhZGVsZiIKdW5z
ZXQgU0hFTEwKZXhwb3J0IFNUQUdJTkdfSU5DRElSPSIvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEt
b3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9l
LWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QvdXNyL2luY2x1
ZGUiCmV4cG9ydCBTVEFHSU5HX0xJQkRJUj0iL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5n
ZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51
eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290L3Vzci9saWIiCmV4cG9y
dCBTVFJJTkdTPSJhcm0tb2UtbGludXgtZ251ZWFiaS1zdHJpbmdzIgpleHBvcnQgU1RSSVA9ImFy
bS1vZS1saW51eC1nbnVlYWJpLXN0cmlwIgp1bnNldCBUQVJHRVRfQVJDSApleHBvcnQgVEVSTT0i
eHRlcm0iCmV4cG9ydCBUWj0iVVRDIgpleHBvcnQgVUJPT1RfQVJDSD0iYXJtIgpleHBvcnQgVVNF
Uj0iY2V2YXQiCmV4cG9ydCBiYXNlX2JpbmRpcj0iL2JpbiIKZXhwb3J0IGJhc2VfbGliZGlyPSIv
bGliIgpleHBvcnQgYmFzZV9wcmVmaXg9IiIKZXhwb3J0IGJhc2Vfc2JpbmRpcj0iL3NiaW4iCmV4
cG9ydCBiaW5kaXI9Ii91c3IvYmluIgpleHBvcnQgZGF0YWRpcj0iL3Vzci9zaGFyZSIKZXhwb3J0
IGRvY2Rpcj0iL3Vzci9zaGFyZS9kb2MiCmV4cG9ydCBleGVjX3ByZWZpeD0iL3VzciIKZXhwb3J0
IGluY2x1ZGVkaXI9Ii91c3IvaW5jbHVkZSIKZXhwb3J0IGluZm9kaXI9Ii91c3Ivc2hhcmUvaW5m
byIKZXhwb3J0IGxpYmRpcj0iL3Vzci9saWIiCmV4cG9ydCBsaWJleGVjZGlyPSIvdXNyL2xpYmV4
ZWMiCmV4cG9ydCBsb2NhbHN0YXRlZGlyPSIvdmFyIgpleHBvcnQgbWFuZGlyPSIvdXNyL3NoYXJl
L21hbiIKZXhwb3J0IG5vbmFyY2hfYmFzZV9saWJkaXI9Ii9saWIiCmV4cG9ydCBub25hcmNoX2xp
YmRpcj0iL3Vzci9saWIiCmV4cG9ydCBvbGRpbmNsdWRlZGlyPSIvdXNyL2luY2x1ZGUiCmV4cG9y
dCBwcmVmaXg9Ii91c3IiCmV4cG9ydCBzYmluZGlyPSIvdXNyL3NiaW4iCmV4cG9ydCBzZXJ2aWNl
ZGlyPSIvc3J2IgpleHBvcnQgc2hhcmVkc3RhdGVkaXI9Ii9jb20iCmV4cG9ydCBzeXNjb25mZGly
PSIvZXRjIgpleHBvcnQgc3lzdGVtZF9zeXN0ZW1fdW5pdGRpcj0iL2xpYi9zeXN0ZW1kL3N5c3Rl
bSIKZXhwb3J0IHN5c3RlbWRfdW5pdGRpcj0iL2xpYi9zeXN0ZW1kIgpleHBvcnQgc3lzdGVtZF91
c2VyX3VuaXRkaXI9Ii91c3IvbGliL3N5c3RlbWQvdXNlciIKCmRvX2NvbmZpZ3VyZSgpIHsKICAg
aWYgWyAtZCAvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJt
L3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNl
LzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QvL3Vzci9zaGFyZS9qYWlsaG91c2UvY29uZmlncyBdOwog
ICB0aGVuCiAgICAgIGNwICIvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkv
amFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QvL3Vzci9zaGFyZS9qYWlsaG91c2UvY29u
Zmlncy8iKi5jIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9h
cm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91
c2UvMC4xMS1yMC9naXQvY29uZmlncy8KICAgZmkKCiAgIGlmIFsgISAteiAvaG9tZS9jZXZhdC9E
ZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5n
ZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvZ2l0L2NpL2phaWxo
b3VzZS1jb25maWctYmFuYW5hLXBpLmggXTsKICAgdGhlbgogICAgICBjcCAtYXYgL2hvbWUvY2V2
YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9v
cmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL2dpdC9jaS9q
YWlsaG91c2UtY29uZmlnLWJhbmFuYS1waS5oIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFu
Z2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGlu
dXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9naXQvaW5jbHVkZS9qYWlsaG91c2UvY29uZmln
LmgKICAgZmkKfQoKY2QgJy9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9i
dWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9q
YWlsaG91c2UvMC4xMS1yMC9naXQnCmRvX2NvbmZpZ3VyZQoKIyBjbGVhbnVwCnJldD0kPwp0cmFw
ICcnIDAKZXhpdCAkcmV0Cg==
------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=run.do_fetch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=run.do_fetch
X-Attachment-Id: 9a82d394-940c-41ae-a1f7-8ebecc0fc21c
Content-ID: <9a82d394-940c-41ae-a1f7-8ebecc0fc21c>

def do_fetch(d):
    bb.build.exec_func('base_do_fetch', d)

do_fetch(d)

def base_do_fetch(d):

    src_uri = (d.getVar('SRC_URI') or "").split()
    if len(src_uri) == 0:
        return

    try:
        fetcher = bb.fetch2.Fetch(src_uri, d)
        fetcher.download()
    except bb.fetch2.BBFetchException as e:
        bb.fatal(str(e))


------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=run.do_fetch.14470
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=run.do_fetch.14470
X-Attachment-Id: fc066d86-d82a-4736-8bdb-c9dd4285f2cd
Content-ID: <fc066d86-d82a-4736-8bdb-c9dd4285f2cd>

def do_fetch(d):
    bb.build.exec_func('base_do_fetch', d)

do_fetch(d)

def base_do_fetch(d):

    src_uri = (d.getVar('SRC_URI') or "").split()
    if len(src_uri) == 0:
        return

    try:
        fetcher = bb.fetch2.Fetch(src_uri, d)
        fetcher.download()
    except bb.fetch2.BBFetchException as e:
        bb.fatal(str(e))


------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=run.do_patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=run.do_patch
X-Attachment-Id: 1d378b78-5389-4c77-a456-c7ffc406a7f3
Content-ID: <1d378b78-5389-4c77-a456-c7ffc406a7f3>

def do_patch(d):
    bb.build.exec_func('patch_do_patch', d)

do_patch(d)

def patch_do_patch(d):
    import oe.patch

    patchsetmap = {
        "patch": oe.patch.PatchTree,
        "quilt": oe.patch.QuiltTree,
        "git": oe.patch.GitApplyTree,
    }

    cls = patchsetmap[d.getVar('PATCHTOOL') or 'quilt']

    resolvermap = {
        "noop": oe.patch.NOOPResolver,
        "user": oe.patch.UserResolver,
    }

    rcls = resolvermap[d.getVar('PATCHRESOLVE') or 'user']

    classes = {}

    s = d.getVar('S')

    os.putenv('PATH', d.getVar('PATH'))

    # We must use one TMPDIR per process so that the "patch" processes
    # don't generate the same temp file name.

    import tempfile
    process_tmpdir = tempfile.mkdtemp()
    os.environ['TMPDIR'] = process_tmpdir

    for patch in src_patches(d):
        _, _, local, _, _, parm = bb.fetch.decodeurl(patch)

        if "patchdir" in parm:
            patchdir = parm["patchdir"]
            if not os.path.isabs(patchdir):
                patchdir = os.path.join(s, patchdir)
        else:
            patchdir = s

        if not patchdir in classes:
            patchset = cls(patchdir, d)
            resolver = rcls(patchset, oe_terminal)
            classes[patchdir] = (patchset, resolver)
            patchset.Clean()
        else:
            patchset, resolver = classes[patchdir]

        bb.note("Applying patch '%s' (%s)" % (parm['patchname'], oe.path.format_display(local, d)))
        try:
            patchset.Import({"file":local, "strippath": parm['striplevel']}, True)
        except Exception as exc:
            bb.utils.remove(process_tmpdir, True)
            bb.fatal(str(exc))
        try:
            resolver.Resolve()
        except bb.BBHandledException as e:
            bb.utils.remove(process_tmpdir, True)
            bb.fatal(str(e))

    bb.utils.remove(process_tmpdir, True)
    del os.environ['TMPDIR']

def src_patches(d, all=False, expand=True):
    import oe.patch
    return oe.patch.src_patches(d, all, expand)


------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=run.do_patch.14518
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=run.do_patch.14518
X-Attachment-Id: 3c2f98aa-4117-4d14-a2fc-b029ad6d2e93
Content-ID: <3c2f98aa-4117-4d14-a2fc-b029ad6d2e93>

def do_patch(d):
    bb.build.exec_func('patch_do_patch', d)

do_patch(d)

def patch_do_patch(d):
    import oe.patch

    patchsetmap = {
        "patch": oe.patch.PatchTree,
        "quilt": oe.patch.QuiltTree,
        "git": oe.patch.GitApplyTree,
    }

    cls = patchsetmap[d.getVar('PATCHTOOL') or 'quilt']

    resolvermap = {
        "noop": oe.patch.NOOPResolver,
        "user": oe.patch.UserResolver,
    }

    rcls = resolvermap[d.getVar('PATCHRESOLVE') or 'user']

    classes = {}

    s = d.getVar('S')

    os.putenv('PATH', d.getVar('PATH'))

    # We must use one TMPDIR per process so that the "patch" processes
    # don't generate the same temp file name.

    import tempfile
    process_tmpdir = tempfile.mkdtemp()
    os.environ['TMPDIR'] = process_tmpdir

    for patch in src_patches(d):
        _, _, local, _, _, parm = bb.fetch.decodeurl(patch)

        if "patchdir" in parm:
            patchdir = parm["patchdir"]
            if not os.path.isabs(patchdir):
                patchdir = os.path.join(s, patchdir)
        else:
            patchdir = s

        if not patchdir in classes:
            patchset = cls(patchdir, d)
            resolver = rcls(patchset, oe_terminal)
            classes[patchdir] = (patchset, resolver)
            patchset.Clean()
        else:
            patchset, resolver = classes[patchdir]

        bb.note("Applying patch '%s' (%s)" % (parm['patchname'], oe.path.format_display(local, d)))
        try:
            patchset.Import({"file":local, "strippath": parm['striplevel']}, True)
        except Exception as exc:
            bb.utils.remove(process_tmpdir, True)
            bb.fatal(str(exc))
        try:
            resolver.Resolve()
        except bb.BBHandledException as e:
            bb.utils.remove(process_tmpdir, True)
            bb.fatal(str(e))

    bb.utils.remove(process_tmpdir, True)
    del os.environ['TMPDIR']

def src_patches(d, all=False, expand=True):
    import oe.patch
    return oe.patch.src_patches(d, all, expand)


------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=run.do_populate_lic
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=run.do_populate_lic
X-Attachment-Id: 04b06c04-b90c-4d88-bc25-4aad7d8acf85
Content-ID: <04b06c04-b90c-4d88-bc25-4aad7d8acf85>

def do_populate_lic(d):
    """
    Populate LICENSE_DIRECTORY with licenses.
    """
    lic_files_paths = find_license_files(d)

    # The base directory we wrangle licenses to
    destdir = os.path.join(d.getVar('LICSSTATEDIR'), d.getVar('PN'))
    copy_license_files(lic_files_paths, destdir)
    info = get_recipe_info(d)
    with open(os.path.join(destdir, "recipeinfo"), "w") as f:
        for key in sorted(info.keys()):
            f.write("%s: %s\n" % (key, info[key]))

do_populate_lic(d)

def copy_license_files(lic_files_paths, destdir):
    import shutil
    import errno

    bb.utils.mkdirhier(destdir)
    for (basename, path, beginline, endline) in lic_files_paths:
        try:
            src = path
            dst = os.path.join(destdir, basename)
            if os.path.exists(dst):
                os.remove(dst)
            if os.path.islink(src):
                src = os.path.realpath(src)
            canlink = os.access(src, os.W_OK) and (os.stat(src).st_dev == os.stat(destdir).st_dev) and beginline is None and endline is None
            if canlink:
                try:
                    os.link(src, dst)
                except OSError as err:
                    if err.errno == errno.EXDEV:
                        # Copy license files if hard-link is not possible even if st_dev is the
                        # same on source and destination (docker container with device-mapper?)
                        canlink = False
                    else:
                        raise
                # Only chown if we did hardling, and, we're running under pseudo
                if canlink and os.environ.get('PSEUDO_DISABLED') == '0':
                    os.chown(dst,0,0)
            if not canlink:
                begin_idx = int(beginline)-1 if beginline is not None else None
                end_idx = int(endline) if endline is not None else None
                if begin_idx is None and end_idx is None:
                    shutil.copyfile(src, dst)
                else:
                    with open(src, 'rb') as src_f:
                        with open(dst, 'wb') as dst_f:
                            dst_f.write(b''.join(src_f.readlines()[begin_idx:end_idx]))

        except Exception as e:
            bb.warn("Could not copy license file %s to %s: %s" % (src, dst, e))

def get_recipe_info(d):
    info = {}
    info["PV"] = d.getVar("PV")
    info["PR"] = d.getVar("PR")
    info["LICENSE"] = d.getVar("LICENSE")
    return info

def find_license_files(d):
    """
    Creates list of files used in LIC_FILES_CHKSUM and generic LICENSE files.
    """
    import shutil
    import oe.license
    from collections import defaultdict, OrderedDict

    # All the license files for the package
    lic_files = d.getVar('LIC_FILES_CHKSUM') or ""
    pn = d.getVar('PN')
    # The license files are located in S/LIC_FILE_CHECKSUM.
    srcdir = d.getVar('S')
    # Directory we store the generic licenses as set in the distro configuration
    generic_directory = d.getVar('COMMON_LICENSE_DIR')
    # List of basename, path tuples
    lic_files_paths = []
    # hash for keep track generic lics mappings
    non_generic_lics = {}
    # Entries from LIC_FILES_CHKSUM
    lic_chksums = {}
    license_source_dirs = []
    license_source_dirs.append(generic_directory)
    try:
        additional_lic_dirs = d.getVar('LICENSE_PATH').split()
        for lic_dir in additional_lic_dirs:
            license_source_dirs.append(lic_dir)
    except:
        pass

    class FindVisitor(oe.license.LicenseVisitor):
        def visit_Str(self, node):
            #
            # Until I figure out what to do with
            # the two modifiers I support (or greater = +
            # and "with exceptions" being *
            # we'll just strip out the modifier and put
            # the base license.
            find_license(node.s.replace("+", "").replace("*", ""))
            self.generic_visit(node)

    def find_license(license_type):
        try:
            bb.utils.mkdirhier(gen_lic_dest)
        except:
            pass
        spdx_generic = None
        license_source = None
        # If the generic does not exist we need to check to see if there is an SPDX mapping to it,
        # unless NO_GENERIC_LICENSE is set.
        for lic_dir in license_source_dirs:
            if not os.path.isfile(os.path.join(lic_dir, license_type)):
                if d.getVarFlag('SPDXLICENSEMAP', license_type) != None:
                    # Great, there is an SPDXLICENSEMAP. We can copy!
                    bb.debug(1, "We need to use a SPDXLICENSEMAP for %s" % (license_type))
                    spdx_generic = d.getVarFlag('SPDXLICENSEMAP', license_type)
                    license_source = lic_dir
                    break
            elif os.path.isfile(os.path.join(lic_dir, license_type)):
                spdx_generic = license_type
                license_source = lic_dir
                break

        non_generic_lic = d.getVarFlag('NO_GENERIC_LICENSE', license_type)
        if spdx_generic and license_source:
            # we really should copy to generic_ + spdx_generic, however, that ends up messing the manifest
            # audit up. This should be fixed in emit_pkgdata (or, we actually got and fix all the recipes)

            lic_files_paths.append(("generic_" + license_type, os.path.join(license_source, spdx_generic),
                                    None, None))

            # The user may attempt to use NO_GENERIC_LICENSE for a generic license which doesn't make sense
            # and should not be allowed, warn the user in this case.
            if d.getVarFlag('NO_GENERIC_LICENSE', license_type):
                bb.warn("%s: %s is a generic license, please don't use NO_GENERIC_LICENSE for it." % (pn, license_type))

        elif non_generic_lic and non_generic_lic in lic_chksums:
            # if NO_GENERIC_LICENSE is set, we copy the license files from the fetched source
            # of the package rather than the license_source_dirs.
            lic_files_paths.append(("generic_" + license_type,
                                    os.path.join(srcdir, non_generic_lic), None, None))
            non_generic_lics[non_generic_lic] = license_type
        else:
            # Add explicity avoid of CLOSED license because this isn't generic
            if license_type != 'CLOSED':
                # And here is where we warn people that their licenses are lousy
                bb.warn("%s: No generic license file exists for: %s in any provider" % (pn, license_type))
            pass

    if not generic_directory:
        bb.fatal("COMMON_LICENSE_DIR is unset. Please set this in your distro config")

    for url in lic_files.split():
        try:
            (method, host, path, user, pswd, parm) = bb.fetch.decodeurl(url)
            if method != "file" or not path:
                raise bb.fetch.MalformedUrl()
        except bb.fetch.MalformedUrl:
            bb.fatal("%s: LIC_FILES_CHKSUM contains an invalid URL:  %s" % (d.getVar('PF'), url))
        # We want the license filename and path
        chksum = parm.get('md5', None)
        beginline = parm.get('beginline')
        endline = parm.get('endline')
        lic_chksums[path] = (chksum, beginline, endline)

    v = FindVisitor()
    try:
        v.visit_string(d.getVar('LICENSE'))
    except oe.license.InvalidLicense as exc:
        bb.fatal('%s: %s' % (d.getVar('PF'), exc))
    except SyntaxError:
        bb.warn("%s: Failed to parse it's LICENSE field." % (d.getVar('PF')))
    # Add files from LIC_FILES_CHKSUM to list of license files
    lic_chksum_paths = defaultdict(OrderedDict)
    for path, data in sorted(lic_chksums.items()):
        lic_chksum_paths[os.path.basename(path)][data] = (os.path.join(srcdir, path), data[1], data[2])
    for basename, files in lic_chksum_paths.items():
        if len(files) == 1:
            # Don't copy again a LICENSE already handled as non-generic
            if basename in non_generic_lics:
                continue
            data = list(files.values())[0]
            lic_files_paths.append(tuple([basename] + list(data)))
        else:
            # If there are multiple different license files with identical
            # basenames we rename them to <file>.0, <file>.1, ...
            for i, data in enumerate(files.values()):
                lic_files_paths.append(tuple(["%s.%d" % (basename, i)] + list(data)))

    return lic_files_paths


------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=run.do_populate_lic.14593
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=run.do_populate_lic.14593
X-Attachment-Id: 6e041a76-9f5b-4293-99b1-43064c9cc580
Content-ID: <6e041a76-9f5b-4293-99b1-43064c9cc580>

def do_populate_lic(d):
    """
    Populate LICENSE_DIRECTORY with licenses.
    """
    lic_files_paths = find_license_files(d)

    # The base directory we wrangle licenses to
    destdir = os.path.join(d.getVar('LICSSTATEDIR'), d.getVar('PN'))
    copy_license_files(lic_files_paths, destdir)
    info = get_recipe_info(d)
    with open(os.path.join(destdir, "recipeinfo"), "w") as f:
        for key in sorted(info.keys()):
            f.write("%s: %s\n" % (key, info[key]))

do_populate_lic(d)

def copy_license_files(lic_files_paths, destdir):
    import shutil
    import errno

    bb.utils.mkdirhier(destdir)
    for (basename, path, beginline, endline) in lic_files_paths:
        try:
            src = path
            dst = os.path.join(destdir, basename)
            if os.path.exists(dst):
                os.remove(dst)
            if os.path.islink(src):
                src = os.path.realpath(src)
            canlink = os.access(src, os.W_OK) and (os.stat(src).st_dev == os.stat(destdir).st_dev) and beginline is None and endline is None
            if canlink:
                try:
                    os.link(src, dst)
                except OSError as err:
                    if err.errno == errno.EXDEV:
                        # Copy license files if hard-link is not possible even if st_dev is the
                        # same on source and destination (docker container with device-mapper?)
                        canlink = False
                    else:
                        raise
                # Only chown if we did hardling, and, we're running under pseudo
                if canlink and os.environ.get('PSEUDO_DISABLED') == '0':
                    os.chown(dst,0,0)
            if not canlink:
                begin_idx = int(beginline)-1 if beginline is not None else None
                end_idx = int(endline) if endline is not None else None
                if begin_idx is None and end_idx is None:
                    shutil.copyfile(src, dst)
                else:
                    with open(src, 'rb') as src_f:
                        with open(dst, 'wb') as dst_f:
                            dst_f.write(b''.join(src_f.readlines()[begin_idx:end_idx]))

        except Exception as e:
            bb.warn("Could not copy license file %s to %s: %s" % (src, dst, e))

def get_recipe_info(d):
    info = {}
    info["PV"] = d.getVar("PV")
    info["PR"] = d.getVar("PR")
    info["LICENSE"] = d.getVar("LICENSE")
    return info

def find_license_files(d):
    """
    Creates list of files used in LIC_FILES_CHKSUM and generic LICENSE files.
    """
    import shutil
    import oe.license
    from collections import defaultdict, OrderedDict

    # All the license files for the package
    lic_files = d.getVar('LIC_FILES_CHKSUM') or ""
    pn = d.getVar('PN')
    # The license files are located in S/LIC_FILE_CHECKSUM.
    srcdir = d.getVar('S')
    # Directory we store the generic licenses as set in the distro configuration
    generic_directory = d.getVar('COMMON_LICENSE_DIR')
    # List of basename, path tuples
    lic_files_paths = []
    # hash for keep track generic lics mappings
    non_generic_lics = {}
    # Entries from LIC_FILES_CHKSUM
    lic_chksums = {}
    license_source_dirs = []
    license_source_dirs.append(generic_directory)
    try:
        additional_lic_dirs = d.getVar('LICENSE_PATH').split()
        for lic_dir in additional_lic_dirs:
            license_source_dirs.append(lic_dir)
    except:
        pass

    class FindVisitor(oe.license.LicenseVisitor):
        def visit_Str(self, node):
            #
            # Until I figure out what to do with
            # the two modifiers I support (or greater = +
            # and "with exceptions" being *
            # we'll just strip out the modifier and put
            # the base license.
            find_license(node.s.replace("+", "").replace("*", ""))
            self.generic_visit(node)

    def find_license(license_type):
        try:
            bb.utils.mkdirhier(gen_lic_dest)
        except:
            pass
        spdx_generic = None
        license_source = None
        # If the generic does not exist we need to check to see if there is an SPDX mapping to it,
        # unless NO_GENERIC_LICENSE is set.
        for lic_dir in license_source_dirs:
            if not os.path.isfile(os.path.join(lic_dir, license_type)):
                if d.getVarFlag('SPDXLICENSEMAP', license_type) != None:
                    # Great, there is an SPDXLICENSEMAP. We can copy!
                    bb.debug(1, "We need to use a SPDXLICENSEMAP for %s" % (license_type))
                    spdx_generic = d.getVarFlag('SPDXLICENSEMAP', license_type)
                    license_source = lic_dir
                    break
            elif os.path.isfile(os.path.join(lic_dir, license_type)):
                spdx_generic = license_type
                license_source = lic_dir
                break

        non_generic_lic = d.getVarFlag('NO_GENERIC_LICENSE', license_type)
        if spdx_generic and license_source:
            # we really should copy to generic_ + spdx_generic, however, that ends up messing the manifest
            # audit up. This should be fixed in emit_pkgdata (or, we actually got and fix all the recipes)

            lic_files_paths.append(("generic_" + license_type, os.path.join(license_source, spdx_generic),
                                    None, None))

            # The user may attempt to use NO_GENERIC_LICENSE for a generic license which doesn't make sense
            # and should not be allowed, warn the user in this case.
            if d.getVarFlag('NO_GENERIC_LICENSE', license_type):
                bb.warn("%s: %s is a generic license, please don't use NO_GENERIC_LICENSE for it." % (pn, license_type))

        elif non_generic_lic and non_generic_lic in lic_chksums:
            # if NO_GENERIC_LICENSE is set, we copy the license files from the fetched source
            # of the package rather than the license_source_dirs.
            lic_files_paths.append(("generic_" + license_type,
                                    os.path.join(srcdir, non_generic_lic), None, None))
            non_generic_lics[non_generic_lic] = license_type
        else:
            # Add explicity avoid of CLOSED license because this isn't generic
            if license_type != 'CLOSED':
                # And here is where we warn people that their licenses are lousy
                bb.warn("%s: No generic license file exists for: %s in any provider" % (pn, license_type))
            pass

    if not generic_directory:
        bb.fatal("COMMON_LICENSE_DIR is unset. Please set this in your distro config")

    for url in lic_files.split():
        try:
            (method, host, path, user, pswd, parm) = bb.fetch.decodeurl(url)
            if method != "file" or not path:
                raise bb.fetch.MalformedUrl()
        except bb.fetch.MalformedUrl:
            bb.fatal("%s: LIC_FILES_CHKSUM contains an invalid URL:  %s" % (d.getVar('PF'), url))
        # We want the license filename and path
        chksum = parm.get('md5', None)
        beginline = parm.get('beginline')
        endline = parm.get('endline')
        lic_chksums[path] = (chksum, beginline, endline)

    v = FindVisitor()
    try:
        v.visit_string(d.getVar('LICENSE'))
    except oe.license.InvalidLicense as exc:
        bb.fatal('%s: %s' % (d.getVar('PF'), exc))
    except SyntaxError:
        bb.warn("%s: Failed to parse it's LICENSE field." % (d.getVar('PF')))
    # Add files from LIC_FILES_CHKSUM to list of license files
    lic_chksum_paths = defaultdict(OrderedDict)
    for path, data in sorted(lic_chksums.items()):
        lic_chksum_paths[os.path.basename(path)][data] = (os.path.join(srcdir, path), data[1], data[2])
    for basename, files in lic_chksum_paths.items():
        if len(files) == 1:
            # Don't copy again a LICENSE already handled as non-generic
            if basename in non_generic_lics:
                continue
            data = list(files.values())[0]
            lic_files_paths.append(tuple([basename] + list(data)))
        else:
            # If there are multiple different license files with identical
            # basenames we rename them to <file>.0, <file>.1, ...
            for i, data in enumerate(files.values()):
                lic_files_paths.append(tuple(["%s.%d" % (basename, i)] + list(data)))

    return lic_files_paths


------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=run.do_prepare_recipe_sysroot
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=run.do_prepare_recipe_sysroot
X-Attachment-Id: bbb2eedd-8eba-4566-a75f-e82f5977e836
Content-ID: <bbb2eedd-8eba-4566-a75f-e82f5977e836>

def do_prepare_recipe_sysroot(d):
    bb.build.exec_func("extend_recipe_sysroot", d)

do_prepare_recipe_sysroot(d)

def extend_recipe_sysroot(d):
    import copy
    import subprocess
    import errno
    import collections
    import glob

    taskdepdata = d.getVar("BB_TASKDEPDATA", False)
    mytaskname = d.getVar("BB_RUNTASK")
    if mytaskname.endswith("_setscene"):
        mytaskname = mytaskname.replace("_setscene", "")
    workdir = d.getVar("WORKDIR")
    #bb.warn(str(taskdepdata))
    pn = d.getVar("PN")
    stagingdir = d.getVar("STAGING_DIR")
    sharedmanifests = d.getVar("COMPONENTS_DIR") + "/manifests"
    recipesysroot = d.getVar("RECIPE_SYSROOT")
    recipesysrootnative = d.getVar("RECIPE_SYSROOT_NATIVE")

    # Detect bitbake -b usage
    nodeps = d.getVar("BB_LIMITEDDEPS") or False
    if nodeps:
        lock = bb.utils.lockfile(recipesysroot + "/sysroot.lock")
        staging_populate_sysroot_dir(recipesysroot, recipesysrootnative, True, d)
        staging_populate_sysroot_dir(recipesysroot, recipesysrootnative, False, d)
        bb.utils.unlockfile(lock)
        return

    start = None
    configuredeps = []
    for dep in taskdepdata:
        data = taskdepdata[dep]
        if data[1] == mytaskname and data[0] == pn:
            start = dep
            break
    if start is None:
        bb.fatal("Couldn't find ourself in BB_TASKDEPDATA?")

    # We need to figure out which sysroot files we need to expose to this task.
    # This needs to match what would get restored from sstate, which is controlled
    # ultimately by calls from bitbake to setscene_depvalid().
    # That function expects a setscene dependency tree. We build a dependency tree
    # condensed to inter-sstate task dependencies, similar to that used by setscene
    # tasks. We can then call into setscene_depvalid() and decide
    # which dependencies we can "see" and should expose in the recipe specific sysroot.
    setscenedeps = copy.deepcopy(taskdepdata)

    start = set([start])

    sstatetasks = d.getVar("SSTATETASKS").split()
    # Add recipe specific tasks referenced by setscene_depvalid()
    sstatetasks.append("do_stash_locale")

    def print_dep_tree(deptree):
        data = ""
        for dep in deptree:
            deps = "    " + "\n    ".join(deptree[dep][3]) + "\n"
            data = data + "%s:\n  %s\n  %s\n%s  %s\n  %s\n" % (deptree[dep][0], deptree[dep][1], deptree[dep][2], deps, deptree[dep][4], deptree[dep][5])
        return data

    #bb.note("Full dep tree is:\n%s" % print_dep_tree(taskdepdata))

    #bb.note(" start2 is %s" % str(start))

    # If start is an sstate task (like do_package) we need to add in its direct dependencies
    # else the code below won't recurse into them.
    for dep in set(start):
        for dep2 in setscenedeps[dep][3]:
            start.add(dep2)
        start.remove(dep)

    #bb.note(" start3 is %s" % str(start))

    # Create collapsed do_populate_sysroot -> do_populate_sysroot tree
    for dep in taskdepdata:
        data = setscenedeps[dep]
        if data[1] not in sstatetasks:
            for dep2 in setscenedeps:
                data2 = setscenedeps[dep2]
                if dep in data2[3]:
                    data2[3].update(setscenedeps[dep][3])
                    data2[3].remove(dep)
            if dep in start:
                start.update(setscenedeps[dep][3])
                start.remove(dep)
            del setscenedeps[dep]

    # Remove circular references
    for dep in setscenedeps:
        if dep in setscenedeps[dep][3]:
            setscenedeps[dep][3].remove(dep)

    #bb.note("Computed dep tree is:\n%s" % print_dep_tree(setscenedeps))
    #bb.note(" start is %s" % str(start))

    # Direct dependencies should be present and can be depended upon
    for dep in set(start):
        if setscenedeps[dep][1] == "do_populate_sysroot":
            if dep not in configuredeps:
                configuredeps.append(dep)
    bb.note("Direct dependencies are %s" % str(configuredeps))
    #bb.note(" or %s" % str(start))

    msgbuf = []
    # Call into setscene_depvalid for each sub-dependency and only copy sysroot files
    # for ones that would be restored from sstate.
    done = list(start)
    next = list(start)
    while next:
        new = []
        for dep in next:
            data = setscenedeps[dep]
            for datadep in data[3]:
                if datadep in done:
                    continue
                taskdeps = {}
                taskdeps[dep] = setscenedeps[dep][:2]
                taskdeps[datadep] = setscenedeps[datadep][:2]
                retval = setscene_depvalid(datadep, taskdeps, [], d, msgbuf)
                if retval:
                    msgbuf.append("Skipping setscene dependency %s for installation into the sysroot" % datadep)
                    continue
                done.append(datadep)
                new.append(datadep)
                if datadep not in configuredeps and setscenedeps[datadep][1] == "do_populate_sysroot":
                    configuredeps.append(datadep)
                    msgbuf.append("Adding dependency on %s" % setscenedeps[datadep][0])
                else:
                    msgbuf.append("Following dependency on %s" % setscenedeps[datadep][0])
        next = new

    # This logging is too verbose for day to day use sadly
    #bb.debug(2, "\n".join(msgbuf))

    depdir = recipesysrootnative + "/installeddeps"
    bb.utils.mkdirhier(depdir)
    bb.utils.mkdirhier(sharedmanifests)

    lock = bb.utils.lockfile(recipesysroot + "/sysroot.lock")

    fixme = {}
    seendirs = set()
    postinsts = []
    multilibs = {}
    manifests = {}
    # All files that we're going to be installing, to find conflicts.
    fileset = {}

    for f in os.listdir(depdir):
        if not f.endswith(".complete"):
            continue
        f = depdir + "/" + f
        if os.path.islink(f) and not os.path.exists(f):
            bb.note("%s no longer exists, removing from sysroot" % f)
            lnk = os.readlink(f.replace(".complete", ""))
            sstate_clean_manifest(depdir + "/" + lnk, d, workdir)
            os.unlink(f)
            os.unlink(f.replace(".complete", ""))

    installed = []
    for dep in configuredeps:
        c = setscenedeps[dep][0]
        if mytaskname in ["do_sdk_depends", "do_populate_sdk_ext"] and c.endswith("-initial"):
            bb.note("Skipping initial setscene dependency %s for installation into the sysroot" % c)
            continue
        installed.append(c)

    # We want to remove anything which this task previously installed but is no longer a dependency
    taskindex = depdir + "/" + "index." + mytaskname
    if os.path.exists(taskindex):
        potential = []
        with open(taskindex, "r") as f:
            for l in f:
                l = l.strip()
                if l not in installed:
                    fl = depdir + "/" + l
                    if not os.path.exists(fl):
                        # Was likely already uninstalled
                        continue
                    potential.append(l)
        # We need to ensure not other task needs this dependency. We hold the sysroot
        # lock so we ca search the indexes to check
        if potential:
            for i in glob.glob(depdir + "/index.*"):
                if i.endswith("." + mytaskname):
                    continue
                with open(i, "r") as f:
                    for l in f:
                        l = l.strip()
                        if l in potential:
                            potential.remove(l)
        for l in potential:
            fl = depdir + "/" + l
            bb.note("Task %s no longer depends on %s, removing from sysroot" % (mytaskname, l))
            lnk = os.readlink(fl)
            sstate_clean_manifest(depdir + "/" + lnk, d, workdir)
            os.unlink(fl)
            os.unlink(fl + ".complete")

    msg_exists = []
    msg_adding = []

    for dep in configuredeps:
        c = setscenedeps[dep][0]
        if c not in installed:
            continue
        taskhash = setscenedeps[dep][5]
        taskmanifest = depdir + "/" + c + "." + taskhash

        if os.path.exists(depdir + "/" + c):
            lnk = os.readlink(depdir + "/" + c)
            if lnk == c + "." + taskhash and os.path.exists(depdir + "/" + c + ".complete"):
                msg_exists.append(c)
                continue
            else:
                bb.note("%s exists in sysroot, but is stale (%s vs. %s), removing." % (c, lnk, c + "." + taskhash))
                sstate_clean_manifest(depdir + "/" + lnk, d, workdir)
                os.unlink(depdir + "/" + c)
                if os.path.lexists(depdir + "/" + c + ".complete"):
                    os.unlink(depdir + "/" + c + ".complete")
        elif os.path.lexists(depdir + "/" + c):
            os.unlink(depdir + "/" + c)

        msg_adding.append(c)

        os.symlink(c + "." + taskhash, depdir + "/" + c)

        manifest, d2 = oe.sstatesig.find_sstate_manifest(c, setscenedeps[dep][2], "populate_sysroot", d, multilibs)
        if d2 is not d:
            # If we don't do this, the recipe sysroot will be placed in the wrong WORKDIR for multilibs
            # We need a consistent WORKDIR for the image
            d2.setVar("WORKDIR", d.getVar("WORKDIR"))
        destsysroot = d2.getVar("RECIPE_SYSROOT")
        # We put allarch recipes into the default sysroot
        if manifest and "allarch" in manifest:
            destsysroot = d.getVar("RECIPE_SYSROOT")

        native = False
        if c.endswith("-native") or "-cross-" in c or "-crosssdk" in c:
            native = True

        if manifest:
            newmanifest = collections.OrderedDict()
            targetdir = destsysroot
            if native:
                targetdir = recipesysrootnative
            if targetdir not in fixme:
                fixme[targetdir] = []
            fm = fixme[targetdir]

            with open(manifest, "r") as f:
                manifests[dep] = manifest
                for l in f:
                    l = l.strip()
                    if l.endswith("/fixmepath"):
                        fm.append(l)
                        continue
                    if l.endswith("/fixmepath.cmd"):
                        continue
                    dest = l.replace(stagingdir, "")
                    dest = "/" + "/".join(dest.split("/")[3:])
                    newmanifest[l] = targetdir + dest

                    # Check if files have already been installed by another
                    # recipe and abort if they have, explaining what recipes are
                    # conflicting.
                    hashname = targetdir + dest
                    if not hashname.endswith("/"):
                        if hashname in fileset:
                            bb.fatal("The file %s is installed by both %s and %s, aborting" % (dest, c, fileset[hashname]))
                        else:
                            fileset[hashname] = c

            # Having multiple identical manifests in each sysroot eats diskspace so
            # create a shared pool of them and hardlink if we can.
            # We create the manifest in advance so that if something fails during installation,
            # or the build is interrupted, subsequent exeuction can cleanup.
            sharedm = sharedmanifests + "/" + os.path.basename(taskmanifest)
            if not os.path.exists(sharedm):
                smlock = bb.utils.lockfile(sharedm + ".lock")
                # Can race here. You'd think it just means we may not end up with all copies hardlinked to each other
                # but python can lose file handles so we need to do this under a lock.
                if not os.path.exists(sharedm):
                    with open(sharedm, 'w') as m:
                       for l in newmanifest:
                           dest = newmanifest[l]
                           m.write(dest.replace(workdir + "/", "") + "\n")
                bb.utils.unlockfile(smlock)
            try:
                os.link(sharedm, taskmanifest)
            except OSError as err:
                if err.errno == errno.EXDEV:
                    bb.utils.copyfile(sharedm, taskmanifest)
                else:
                    raise
            # Finally actually install the files
            for l in newmanifest:
                    dest = newmanifest[l]
                    if l.endswith("/"):
                        staging_copydir(l, targetdir, dest, seendirs)
                        continue
                    staging_copyfile(l, targetdir, dest, postinsts, seendirs)

    bb.note("Installed into sysroot: %s" % str(msg_adding))
    bb.note("Skipping as already exists in sysroot: %s" % str(msg_exists))

    for f in fixme:
        staging_processfixme(fixme[f], f, recipesysroot, recipesysrootnative, d)

    for p in postinsts:
        subprocess.check_output(p, shell=True, stderr=subprocess.STDOUT)

    for dep in manifests:
        c = setscenedeps[dep][0]
        os.symlink(manifests[dep], depdir + "/" + c + ".complete")

    with open(taskindex, "w") as f:
        for l in sorted(installed):
            f.write(l + "\n")

    bb.utils.unlockfile(lock)

def staging_processfixme(fixme, target, recipesysroot, recipesysrootnative, d):
    import subprocess

    if not fixme:
        return
    cmd = "sed -e 's:^[^/]*/:%s/:g' %s | xargs sed -i -e 's:FIXMESTAGINGDIRTARGET:%s:g; s:FIXMESTAGINGDIRHOST:%s:g'" % (target, " ".join(fixme), recipesysroot, recipesysrootnative)
    for fixmevar in ['PSEUDO_SYSROOT', 'HOSTTOOLS_DIR', 'PKGDATA_DIR', 'PSEUDO_LOCALSTATEDIR', 'LOGFIFO']:
        fixme_path = d.getVar(fixmevar)
        cmd += " -e 's:FIXME_%s:%s:g'" % (fixmevar, fixme_path)
    bb.debug(2, cmd)
    subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)

def staging_copydir(c, target, dest, seendirs):
    if dest not in seendirs:
        bb.utils.mkdirhier(dest)
        seendirs.add(dest)

def staging_populate_sysroot_dir(targetsysroot, nativesysroot, native, d):
    import glob
    import subprocess
    import errno

    fixme = []
    postinsts = []
    seendirs = set()
    stagingdir = d.getVar("STAGING_DIR")
    if native:
        pkgarchs = ['${BUILD_ARCH}', '${BUILD_ARCH}_*']
        targetdir = nativesysroot
    else:
        pkgarchs = ['${MACHINE_ARCH}']
        pkgarchs = pkgarchs + list(reversed(d.getVar("PACKAGE_EXTRA_ARCHS").split()))
        pkgarchs.append('allarch')
        targetdir = targetsysroot

    bb.utils.mkdirhier(targetdir)
    for pkgarch in pkgarchs:
        for manifest in glob.glob(d.expand("${SSTATE_MANIFESTS}/manifest-%s-*.populate_sysroot" % pkgarch)):
            if manifest.endswith("-initial.populate_sysroot"):
                # skip glibc-initial and libgcc-initial due to file overlap
                continue
            if not native and (manifest.endswith("-native.populate_sysroot") or "nativesdk-" in manifest):
                continue
            if native and not (manifest.endswith("-native.populate_sysroot") or manifest.endswith("-cross.populate_sysroot") or "-cross-" in manifest):
                continue
            tmanifest = targetdir + "/" + os.path.basename(manifest)
            if os.path.exists(tmanifest):
                continue
            try:
                os.link(manifest, tmanifest)
            except OSError as err:
                if err.errno == errno.EXDEV:
                    bb.utils.copyfile(manifest, tmanifest)
                else:
                    raise
            with open(manifest, "r") as f:
                for l in f:
                    l = l.strip()
                    if l.endswith("/fixmepath"):
                        fixme.append(l)
                        continue
                    if l.endswith("/fixmepath.cmd"):
                        continue
                    dest = l.replace(stagingdir, "")
                    dest = targetdir + "/" + "/".join(dest.split("/")[3:])
                    if l.endswith("/"):
                        staging_copydir(l, targetdir, dest, seendirs)
                        continue
                    try:
                        staging_copyfile(l, targetdir, dest, postinsts, seendirs)
                    except FileExistsError:
                        continue

    staging_processfixme(fixme, targetdir, targetsysroot, nativesysroot, d)
    for p in postinsts:
        subprocess.check_output(p, shell=True, stderr=subprocess.STDOUT)

#
# Manifests here are complicated. The main sysroot area has the unpacked sstate
# which us unrelocated and tracked by the main sstate manifests. Each recipe
# specific sysroot has manifests for each dependency that is installed there.
# The task hash is used to tell whether the data needs to be reinstalled. We
# use a symlink to point to the currently installed hash. There is also a
# "complete" stamp file which is used to mark if installation completed. If
# something fails (e.g. a postinst), this won't get written and we would
# remove and reinstall the dependency. This also means partially installed
# dependencies should get cleaned up correctly.
#

def staging_copyfile(c, target, dest, postinsts, seendirs):
    import errno

    destdir = os.path.dirname(dest)
    if destdir not in seendirs:
        bb.utils.mkdirhier(destdir)
        seendirs.add(destdir)
    if "/usr/bin/postinst-" in c:
        postinsts.append(dest)
    if os.path.islink(c):
        linkto = os.readlink(c)
        if os.path.lexists(dest):
            if not os.path.islink(dest):
                raise OSError(errno.EEXIST, "Link %s already exists as a file" % dest, dest)
            if os.readlink(dest) == linkto:
                return dest
            raise OSError(errno.EEXIST, "Link %s already exists to a different location? (%s vs %s)" % (dest, os.readlink(dest), linkto), dest)
        os.symlink(linkto, dest)
        #bb.warn(c)
    else:
        try:
            os.link(c, dest)
        except OSError as err:
            if err.errno == errno.EXDEV:
                bb.utils.copyfile(c, dest)
            else:
                raise
    return dest

def sstate_clean_manifest(manifest, d, prefix=None):
    import oe.path

    mfile = open(manifest)
    entries = mfile.readlines()
    mfile.close()

    for entry in entries:
        entry = entry.strip()
        if prefix and not entry.startswith("/"):
            entry = prefix + "/" + entry
        bb.debug(2, "Removing manifest: %s" % entry)
        # We can race against another package populating directories as we're removing them
        # so we ignore errors here.
        try:
            if entry.endswith("/"):
                if os.path.islink(entry[:-1]):
                    os.remove(entry[:-1])
                elif os.path.exists(entry) and len(os.listdir(entry)) == 0:
                    os.rmdir(entry[:-1])
            else:
                os.remove(entry)
        except OSError:
            pass

    postrm = manifest + ".postrm"
    if os.path.exists(manifest + ".postrm"):
        import subprocess
        os.chmod(postrm, 0o755)
        subprocess.check_call(postrm, shell=True)
        oe.path.remove(postrm)

    oe.path.remove(manifest)

def setscene_depvalid(task, taskdependees, notneeded, d, log=None):
    # taskdependees is a dict of tasks which depend on task, each being a 3 item list of [PN, TASKNAME, FILENAME]
    # task is included in taskdependees too
    # Return - False - We need this dependency
    #        - True - We can skip this dependency
    import re

    def logit(msg, log):
        if log is not None:
            log.append(msg)
        else:
            bb.debug(2, msg)

    logit("Considering setscene task: %s" % (str(taskdependees[task])), log)

    def isNativeCross(x):
        return x.endswith("-native") or "-cross-" in x or "-crosssdk" in x or x.endswith("-cross")

    # We only need to trigger populate_lic through direct dependencies
    if taskdependees[task][1] == "do_populate_lic":
        return True

    # stash_locale and gcc_stash_builddir are never needed as a dependency for built objects
    if taskdependees[task][1] == "do_stash_locale" or taskdependees[task][1] == "do_gcc_stash_builddir":
        return True

    # We only need to trigger packagedata through direct dependencies
    # but need to preserve packagedata on packagedata links
    if taskdependees[task][1] == "do_packagedata":
        for dep in taskdependees:
            if taskdependees[dep][1] == "do_packagedata":
                return False
        return True

    for dep in taskdependees:
        logit("  considering dependency: %s" % (str(taskdependees[dep])), log)
        if task == dep:
            continue
        if dep in notneeded:
            continue
        # do_package_write_* and do_package doesn't need do_package
        if taskdependees[task][1] == "do_package" and taskdependees[dep][1] in ['do_package', 'do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm', 'do_packagedata', 'do_package_qa']:
            continue
        # do_package_write_* need do_populate_sysroot as they're mainly postinstall dependencies
        if taskdependees[task][1] == "do_populate_sysroot" and taskdependees[dep][1] in ['do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm']:
            return False
        # do_package/packagedata/package_qa don't need do_populate_sysroot
        if taskdependees[task][1] == "do_populate_sysroot" and taskdependees[dep][1] in ['do_package', 'do_packagedata', 'do_package_qa']:
            continue
        # Native/Cross packages don't exist and are noexec anyway
        if isNativeCross(taskdependees[dep][0]) and taskdependees[dep][1] in ['do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm', 'do_packagedata', 'do_package', 'do_package_qa']:
            continue

        # This is due to the [depends] in useradd.bbclass complicating matters
        # The logic *is* reversed here due to the way hard setscene dependencies are injected
        if (taskdependees[task][1] == 'do_package' or taskdependees[task][1] == 'do_populate_sysroot') and taskdependees[dep][0].endswith(('shadow-native', 'shadow-sysroot', 'base-passwd', 'pseudo-native')) and taskdependees[dep][1] == 'do_populate_sysroot':
            continue

        # Consider sysroot depending on sysroot tasks
        if taskdependees[task][1] == 'do_populate_sysroot' and taskdependees[dep][1] == 'do_populate_sysroot':
            # Allow excluding certain recursive dependencies. If a recipe needs it should add a
            # specific dependency itself, rather than relying on one of its dependees to pull
            # them in.
            # See also http://lists.openembedded.org/pipermail/openembedded-core/2018-January/146324.html
            not_needed = False
            excludedeps = d.getVar('_SSTATE_EXCLUDEDEPS_SYSROOT')
            if excludedeps is None:
                # Cache the regular expressions for speed
                excludedeps = []
                for excl in (d.getVar('SSTATE_EXCLUDEDEPS_SYSROOT') or "").split():
                    excludedeps.append((re.compile(excl.split('->', 1)[0]), re.compile(excl.split('->', 1)[1])))
                d.setVar('_SSTATE_EXCLUDEDEPS_SYSROOT', excludedeps)
            for excl in excludedeps:
                if excl[0].match(taskdependees[dep][0]):
                    if excl[1].match(taskdependees[task][0]):
                        not_needed = True
                        break
            if not_needed:
                continue
            # For meta-extsdk-toolchain we want all sysroot dependencies
            if taskdependees[dep][0] == 'meta-extsdk-toolchain':
                return False
            # Native/Cross populate_sysroot need their dependencies
            if isNativeCross(taskdependees[task][0]) and isNativeCross(taskdependees[dep][0]):
                return False
            # Target populate_sysroot depended on by cross tools need to be installed
            if isNativeCross(taskdependees[dep][0]):
                return False
            # Native/cross tools depended upon by target sysroot are not needed
            # Add an exception for shadow-native as required by useradd.bbclass
            if isNativeCross(taskdependees[task][0]) and taskdependees[task][0] != 'shadow-native':
                continue
            # Target populate_sysroot need their dependencies
            return False

        if taskdependees[task][1] == 'do_shared_workdir':
            continue

        if taskdependees[dep][1] == "do_populate_lic":
            continue


        # Safe fallthrough default
        logit(" Default setscene dependency fall through due to dependency: %s" % (str(taskdependees[dep])), log)
        return False
    return True


------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; 
	name=run.do_prepare_recipe_sysroot.14489
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; 
	filename=run.do_prepare_recipe_sysroot.14489
X-Attachment-Id: e8bef5b0-4629-4901-93f4-2ee8b0113867
Content-ID: <e8bef5b0-4629-4901-93f4-2ee8b0113867>

def do_prepare_recipe_sysroot(d):
    bb.build.exec_func("extend_recipe_sysroot", d)

do_prepare_recipe_sysroot(d)

def extend_recipe_sysroot(d):
    import copy
    import subprocess
    import errno
    import collections
    import glob

    taskdepdata = d.getVar("BB_TASKDEPDATA", False)
    mytaskname = d.getVar("BB_RUNTASK")
    if mytaskname.endswith("_setscene"):
        mytaskname = mytaskname.replace("_setscene", "")
    workdir = d.getVar("WORKDIR")
    #bb.warn(str(taskdepdata))
    pn = d.getVar("PN")
    stagingdir = d.getVar("STAGING_DIR")
    sharedmanifests = d.getVar("COMPONENTS_DIR") + "/manifests"
    recipesysroot = d.getVar("RECIPE_SYSROOT")
    recipesysrootnative = d.getVar("RECIPE_SYSROOT_NATIVE")

    # Detect bitbake -b usage
    nodeps = d.getVar("BB_LIMITEDDEPS") or False
    if nodeps:
        lock = bb.utils.lockfile(recipesysroot + "/sysroot.lock")
        staging_populate_sysroot_dir(recipesysroot, recipesysrootnative, True, d)
        staging_populate_sysroot_dir(recipesysroot, recipesysrootnative, False, d)
        bb.utils.unlockfile(lock)
        return

    start = None
    configuredeps = []
    for dep in taskdepdata:
        data = taskdepdata[dep]
        if data[1] == mytaskname and data[0] == pn:
            start = dep
            break
    if start is None:
        bb.fatal("Couldn't find ourself in BB_TASKDEPDATA?")

    # We need to figure out which sysroot files we need to expose to this task.
    # This needs to match what would get restored from sstate, which is controlled
    # ultimately by calls from bitbake to setscene_depvalid().
    # That function expects a setscene dependency tree. We build a dependency tree
    # condensed to inter-sstate task dependencies, similar to that used by setscene
    # tasks. We can then call into setscene_depvalid() and decide
    # which dependencies we can "see" and should expose in the recipe specific sysroot.
    setscenedeps = copy.deepcopy(taskdepdata)

    start = set([start])

    sstatetasks = d.getVar("SSTATETASKS").split()
    # Add recipe specific tasks referenced by setscene_depvalid()
    sstatetasks.append("do_stash_locale")

    def print_dep_tree(deptree):
        data = ""
        for dep in deptree:
            deps = "    " + "\n    ".join(deptree[dep][3]) + "\n"
            data = data + "%s:\n  %s\n  %s\n%s  %s\n  %s\n" % (deptree[dep][0], deptree[dep][1], deptree[dep][2], deps, deptree[dep][4], deptree[dep][5])
        return data

    #bb.note("Full dep tree is:\n%s" % print_dep_tree(taskdepdata))

    #bb.note(" start2 is %s" % str(start))

    # If start is an sstate task (like do_package) we need to add in its direct dependencies
    # else the code below won't recurse into them.
    for dep in set(start):
        for dep2 in setscenedeps[dep][3]:
            start.add(dep2)
        start.remove(dep)

    #bb.note(" start3 is %s" % str(start))

    # Create collapsed do_populate_sysroot -> do_populate_sysroot tree
    for dep in taskdepdata:
        data = setscenedeps[dep]
        if data[1] not in sstatetasks:
            for dep2 in setscenedeps:
                data2 = setscenedeps[dep2]
                if dep in data2[3]:
                    data2[3].update(setscenedeps[dep][3])
                    data2[3].remove(dep)
            if dep in start:
                start.update(setscenedeps[dep][3])
                start.remove(dep)
            del setscenedeps[dep]

    # Remove circular references
    for dep in setscenedeps:
        if dep in setscenedeps[dep][3]:
            setscenedeps[dep][3].remove(dep)

    #bb.note("Computed dep tree is:\n%s" % print_dep_tree(setscenedeps))
    #bb.note(" start is %s" % str(start))

    # Direct dependencies should be present and can be depended upon
    for dep in set(start):
        if setscenedeps[dep][1] == "do_populate_sysroot":
            if dep not in configuredeps:
                configuredeps.append(dep)
    bb.note("Direct dependencies are %s" % str(configuredeps))
    #bb.note(" or %s" % str(start))

    msgbuf = []
    # Call into setscene_depvalid for each sub-dependency and only copy sysroot files
    # for ones that would be restored from sstate.
    done = list(start)
    next = list(start)
    while next:
        new = []
        for dep in next:
            data = setscenedeps[dep]
            for datadep in data[3]:
                if datadep in done:
                    continue
                taskdeps = {}
                taskdeps[dep] = setscenedeps[dep][:2]
                taskdeps[datadep] = setscenedeps[datadep][:2]
                retval = setscene_depvalid(datadep, taskdeps, [], d, msgbuf)
                if retval:
                    msgbuf.append("Skipping setscene dependency %s for installation into the sysroot" % datadep)
                    continue
                done.append(datadep)
                new.append(datadep)
                if datadep not in configuredeps and setscenedeps[datadep][1] == "do_populate_sysroot":
                    configuredeps.append(datadep)
                    msgbuf.append("Adding dependency on %s" % setscenedeps[datadep][0])
                else:
                    msgbuf.append("Following dependency on %s" % setscenedeps[datadep][0])
        next = new

    # This logging is too verbose for day to day use sadly
    #bb.debug(2, "\n".join(msgbuf))

    depdir = recipesysrootnative + "/installeddeps"
    bb.utils.mkdirhier(depdir)
    bb.utils.mkdirhier(sharedmanifests)

    lock = bb.utils.lockfile(recipesysroot + "/sysroot.lock")

    fixme = {}
    seendirs = set()
    postinsts = []
    multilibs = {}
    manifests = {}
    # All files that we're going to be installing, to find conflicts.
    fileset = {}

    for f in os.listdir(depdir):
        if not f.endswith(".complete"):
            continue
        f = depdir + "/" + f
        if os.path.islink(f) and not os.path.exists(f):
            bb.note("%s no longer exists, removing from sysroot" % f)
            lnk = os.readlink(f.replace(".complete", ""))
            sstate_clean_manifest(depdir + "/" + lnk, d, workdir)
            os.unlink(f)
            os.unlink(f.replace(".complete", ""))

    installed = []
    for dep in configuredeps:
        c = setscenedeps[dep][0]
        if mytaskname in ["do_sdk_depends", "do_populate_sdk_ext"] and c.endswith("-initial"):
            bb.note("Skipping initial setscene dependency %s for installation into the sysroot" % c)
            continue
        installed.append(c)

    # We want to remove anything which this task previously installed but is no longer a dependency
    taskindex = depdir + "/" + "index." + mytaskname
    if os.path.exists(taskindex):
        potential = []
        with open(taskindex, "r") as f:
            for l in f:
                l = l.strip()
                if l not in installed:
                    fl = depdir + "/" + l
                    if not os.path.exists(fl):
                        # Was likely already uninstalled
                        continue
                    potential.append(l)
        # We need to ensure not other task needs this dependency. We hold the sysroot
        # lock so we ca search the indexes to check
        if potential:
            for i in glob.glob(depdir + "/index.*"):
                if i.endswith("." + mytaskname):
                    continue
                with open(i, "r") as f:
                    for l in f:
                        l = l.strip()
                        if l in potential:
                            potential.remove(l)
        for l in potential:
            fl = depdir + "/" + l
            bb.note("Task %s no longer depends on %s, removing from sysroot" % (mytaskname, l))
            lnk = os.readlink(fl)
            sstate_clean_manifest(depdir + "/" + lnk, d, workdir)
            os.unlink(fl)
            os.unlink(fl + ".complete")

    msg_exists = []
    msg_adding = []

    for dep in configuredeps:
        c = setscenedeps[dep][0]
        if c not in installed:
            continue
        taskhash = setscenedeps[dep][5]
        taskmanifest = depdir + "/" + c + "." + taskhash

        if os.path.exists(depdir + "/" + c):
            lnk = os.readlink(depdir + "/" + c)
            if lnk == c + "." + taskhash and os.path.exists(depdir + "/" + c + ".complete"):
                msg_exists.append(c)
                continue
            else:
                bb.note("%s exists in sysroot, but is stale (%s vs. %s), removing." % (c, lnk, c + "." + taskhash))
                sstate_clean_manifest(depdir + "/" + lnk, d, workdir)
                os.unlink(depdir + "/" + c)
                if os.path.lexists(depdir + "/" + c + ".complete"):
                    os.unlink(depdir + "/" + c + ".complete")
        elif os.path.lexists(depdir + "/" + c):
            os.unlink(depdir + "/" + c)

        msg_adding.append(c)

        os.symlink(c + "." + taskhash, depdir + "/" + c)

        manifest, d2 = oe.sstatesig.find_sstate_manifest(c, setscenedeps[dep][2], "populate_sysroot", d, multilibs)
        if d2 is not d:
            # If we don't do this, the recipe sysroot will be placed in the wrong WORKDIR for multilibs
            # We need a consistent WORKDIR for the image
            d2.setVar("WORKDIR", d.getVar("WORKDIR"))
        destsysroot = d2.getVar("RECIPE_SYSROOT")
        # We put allarch recipes into the default sysroot
        if manifest and "allarch" in manifest:
            destsysroot = d.getVar("RECIPE_SYSROOT")

        native = False
        if c.endswith("-native") or "-cross-" in c or "-crosssdk" in c:
            native = True

        if manifest:
            newmanifest = collections.OrderedDict()
            targetdir = destsysroot
            if native:
                targetdir = recipesysrootnative
            if targetdir not in fixme:
                fixme[targetdir] = []
            fm = fixme[targetdir]

            with open(manifest, "r") as f:
                manifests[dep] = manifest
                for l in f:
                    l = l.strip()
                    if l.endswith("/fixmepath"):
                        fm.append(l)
                        continue
                    if l.endswith("/fixmepath.cmd"):
                        continue
                    dest = l.replace(stagingdir, "")
                    dest = "/" + "/".join(dest.split("/")[3:])
                    newmanifest[l] = targetdir + dest

                    # Check if files have already been installed by another
                    # recipe and abort if they have, explaining what recipes are
                    # conflicting.
                    hashname = targetdir + dest
                    if not hashname.endswith("/"):
                        if hashname in fileset:
                            bb.fatal("The file %s is installed by both %s and %s, aborting" % (dest, c, fileset[hashname]))
                        else:
                            fileset[hashname] = c

            # Having multiple identical manifests in each sysroot eats diskspace so
            # create a shared pool of them and hardlink if we can.
            # We create the manifest in advance so that if something fails during installation,
            # or the build is interrupted, subsequent exeuction can cleanup.
            sharedm = sharedmanifests + "/" + os.path.basename(taskmanifest)
            if not os.path.exists(sharedm):
                smlock = bb.utils.lockfile(sharedm + ".lock")
                # Can race here. You'd think it just means we may not end up with all copies hardlinked to each other
                # but python can lose file handles so we need to do this under a lock.
                if not os.path.exists(sharedm):
                    with open(sharedm, 'w') as m:
                       for l in newmanifest:
                           dest = newmanifest[l]
                           m.write(dest.replace(workdir + "/", "") + "\n")
                bb.utils.unlockfile(smlock)
            try:
                os.link(sharedm, taskmanifest)
            except OSError as err:
                if err.errno == errno.EXDEV:
                    bb.utils.copyfile(sharedm, taskmanifest)
                else:
                    raise
            # Finally actually install the files
            for l in newmanifest:
                    dest = newmanifest[l]
                    if l.endswith("/"):
                        staging_copydir(l, targetdir, dest, seendirs)
                        continue
                    staging_copyfile(l, targetdir, dest, postinsts, seendirs)

    bb.note("Installed into sysroot: %s" % str(msg_adding))
    bb.note("Skipping as already exists in sysroot: %s" % str(msg_exists))

    for f in fixme:
        staging_processfixme(fixme[f], f, recipesysroot, recipesysrootnative, d)

    for p in postinsts:
        subprocess.check_output(p, shell=True, stderr=subprocess.STDOUT)

    for dep in manifests:
        c = setscenedeps[dep][0]
        os.symlink(manifests[dep], depdir + "/" + c + ".complete")

    with open(taskindex, "w") as f:
        for l in sorted(installed):
            f.write(l + "\n")

    bb.utils.unlockfile(lock)

def staging_processfixme(fixme, target, recipesysroot, recipesysrootnative, d):
    import subprocess

    if not fixme:
        return
    cmd = "sed -e 's:^[^/]*/:%s/:g' %s | xargs sed -i -e 's:FIXMESTAGINGDIRTARGET:%s:g; s:FIXMESTAGINGDIRHOST:%s:g'" % (target, " ".join(fixme), recipesysroot, recipesysrootnative)
    for fixmevar in ['PSEUDO_SYSROOT', 'HOSTTOOLS_DIR', 'PKGDATA_DIR', 'PSEUDO_LOCALSTATEDIR', 'LOGFIFO']:
        fixme_path = d.getVar(fixmevar)
        cmd += " -e 's:FIXME_%s:%s:g'" % (fixmevar, fixme_path)
    bb.debug(2, cmd)
    subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)

def staging_copydir(c, target, dest, seendirs):
    if dest not in seendirs:
        bb.utils.mkdirhier(dest)
        seendirs.add(dest)

def staging_populate_sysroot_dir(targetsysroot, nativesysroot, native, d):
    import glob
    import subprocess
    import errno

    fixme = []
    postinsts = []
    seendirs = set()
    stagingdir = d.getVar("STAGING_DIR")
    if native:
        pkgarchs = ['${BUILD_ARCH}', '${BUILD_ARCH}_*']
        targetdir = nativesysroot
    else:
        pkgarchs = ['${MACHINE_ARCH}']
        pkgarchs = pkgarchs + list(reversed(d.getVar("PACKAGE_EXTRA_ARCHS").split()))
        pkgarchs.append('allarch')
        targetdir = targetsysroot

    bb.utils.mkdirhier(targetdir)
    for pkgarch in pkgarchs:
        for manifest in glob.glob(d.expand("${SSTATE_MANIFESTS}/manifest-%s-*.populate_sysroot" % pkgarch)):
            if manifest.endswith("-initial.populate_sysroot"):
                # skip glibc-initial and libgcc-initial due to file overlap
                continue
            if not native and (manifest.endswith("-native.populate_sysroot") or "nativesdk-" in manifest):
                continue
            if native and not (manifest.endswith("-native.populate_sysroot") or manifest.endswith("-cross.populate_sysroot") or "-cross-" in manifest):
                continue
            tmanifest = targetdir + "/" + os.path.basename(manifest)
            if os.path.exists(tmanifest):
                continue
            try:
                os.link(manifest, tmanifest)
            except OSError as err:
                if err.errno == errno.EXDEV:
                    bb.utils.copyfile(manifest, tmanifest)
                else:
                    raise
            with open(manifest, "r") as f:
                for l in f:
                    l = l.strip()
                    if l.endswith("/fixmepath"):
                        fixme.append(l)
                        continue
                    if l.endswith("/fixmepath.cmd"):
                        continue
                    dest = l.replace(stagingdir, "")
                    dest = targetdir + "/" + "/".join(dest.split("/")[3:])
                    if l.endswith("/"):
                        staging_copydir(l, targetdir, dest, seendirs)
                        continue
                    try:
                        staging_copyfile(l, targetdir, dest, postinsts, seendirs)
                    except FileExistsError:
                        continue

    staging_processfixme(fixme, targetdir, targetsysroot, nativesysroot, d)
    for p in postinsts:
        subprocess.check_output(p, shell=True, stderr=subprocess.STDOUT)

#
# Manifests here are complicated. The main sysroot area has the unpacked sstate
# which us unrelocated and tracked by the main sstate manifests. Each recipe
# specific sysroot has manifests for each dependency that is installed there.
# The task hash is used to tell whether the data needs to be reinstalled. We
# use a symlink to point to the currently installed hash. There is also a
# "complete" stamp file which is used to mark if installation completed. If
# something fails (e.g. a postinst), this won't get written and we would
# remove and reinstall the dependency. This also means partially installed
# dependencies should get cleaned up correctly.
#

def staging_copyfile(c, target, dest, postinsts, seendirs):
    import errno

    destdir = os.path.dirname(dest)
    if destdir not in seendirs:
        bb.utils.mkdirhier(destdir)
        seendirs.add(destdir)
    if "/usr/bin/postinst-" in c:
        postinsts.append(dest)
    if os.path.islink(c):
        linkto = os.readlink(c)
        if os.path.lexists(dest):
            if not os.path.islink(dest):
                raise OSError(errno.EEXIST, "Link %s already exists as a file" % dest, dest)
            if os.readlink(dest) == linkto:
                return dest
            raise OSError(errno.EEXIST, "Link %s already exists to a different location? (%s vs %s)" % (dest, os.readlink(dest), linkto), dest)
        os.symlink(linkto, dest)
        #bb.warn(c)
    else:
        try:
            os.link(c, dest)
        except OSError as err:
            if err.errno == errno.EXDEV:
                bb.utils.copyfile(c, dest)
            else:
                raise
    return dest

def sstate_clean_manifest(manifest, d, prefix=None):
    import oe.path

    mfile = open(manifest)
    entries = mfile.readlines()
    mfile.close()

    for entry in entries:
        entry = entry.strip()
        if prefix and not entry.startswith("/"):
            entry = prefix + "/" + entry
        bb.debug(2, "Removing manifest: %s" % entry)
        # We can race against another package populating directories as we're removing them
        # so we ignore errors here.
        try:
            if entry.endswith("/"):
                if os.path.islink(entry[:-1]):
                    os.remove(entry[:-1])
                elif os.path.exists(entry) and len(os.listdir(entry)) == 0:
                    os.rmdir(entry[:-1])
            else:
                os.remove(entry)
        except OSError:
            pass

    postrm = manifest + ".postrm"
    if os.path.exists(manifest + ".postrm"):
        import subprocess
        os.chmod(postrm, 0o755)
        subprocess.check_call(postrm, shell=True)
        oe.path.remove(postrm)

    oe.path.remove(manifest)

def setscene_depvalid(task, taskdependees, notneeded, d, log=None):
    # taskdependees is a dict of tasks which depend on task, each being a 3 item list of [PN, TASKNAME, FILENAME]
    # task is included in taskdependees too
    # Return - False - We need this dependency
    #        - True - We can skip this dependency
    import re

    def logit(msg, log):
        if log is not None:
            log.append(msg)
        else:
            bb.debug(2, msg)

    logit("Considering setscene task: %s" % (str(taskdependees[task])), log)

    def isNativeCross(x):
        return x.endswith("-native") or "-cross-" in x or "-crosssdk" in x or x.endswith("-cross")

    # We only need to trigger populate_lic through direct dependencies
    if taskdependees[task][1] == "do_populate_lic":
        return True

    # stash_locale and gcc_stash_builddir are never needed as a dependency for built objects
    if taskdependees[task][1] == "do_stash_locale" or taskdependees[task][1] == "do_gcc_stash_builddir":
        return True

    # We only need to trigger packagedata through direct dependencies
    # but need to preserve packagedata on packagedata links
    if taskdependees[task][1] == "do_packagedata":
        for dep in taskdependees:
            if taskdependees[dep][1] == "do_packagedata":
                return False
        return True

    for dep in taskdependees:
        logit("  considering dependency: %s" % (str(taskdependees[dep])), log)
        if task == dep:
            continue
        if dep in notneeded:
            continue
        # do_package_write_* and do_package doesn't need do_package
        if taskdependees[task][1] == "do_package" and taskdependees[dep][1] in ['do_package', 'do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm', 'do_packagedata', 'do_package_qa']:
            continue
        # do_package_write_* need do_populate_sysroot as they're mainly postinstall dependencies
        if taskdependees[task][1] == "do_populate_sysroot" and taskdependees[dep][1] in ['do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm']:
            return False
        # do_package/packagedata/package_qa don't need do_populate_sysroot
        if taskdependees[task][1] == "do_populate_sysroot" and taskdependees[dep][1] in ['do_package', 'do_packagedata', 'do_package_qa']:
            continue
        # Native/Cross packages don't exist and are noexec anyway
        if isNativeCross(taskdependees[dep][0]) and taskdependees[dep][1] in ['do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm', 'do_packagedata', 'do_package', 'do_package_qa']:
            continue

        # This is due to the [depends] in useradd.bbclass complicating matters
        # The logic *is* reversed here due to the way hard setscene dependencies are injected
        if (taskdependees[task][1] == 'do_package' or taskdependees[task][1] == 'do_populate_sysroot') and taskdependees[dep][0].endswith(('shadow-native', 'shadow-sysroot', 'base-passwd', 'pseudo-native')) and taskdependees[dep][1] == 'do_populate_sysroot':
            continue

        # Consider sysroot depending on sysroot tasks
        if taskdependees[task][1] == 'do_populate_sysroot' and taskdependees[dep][1] == 'do_populate_sysroot':
            # Allow excluding certain recursive dependencies. If a recipe needs it should add a
            # specific dependency itself, rather than relying on one of its dependees to pull
            # them in.
            # See also http://lists.openembedded.org/pipermail/openembedded-core/2018-January/146324.html
            not_needed = False
            excludedeps = d.getVar('_SSTATE_EXCLUDEDEPS_SYSROOT')
            if excludedeps is None:
                # Cache the regular expressions for speed
                excludedeps = []
                for excl in (d.getVar('SSTATE_EXCLUDEDEPS_SYSROOT') or "").split():
                    excludedeps.append((re.compile(excl.split('->', 1)[0]), re.compile(excl.split('->', 1)[1])))
                d.setVar('_SSTATE_EXCLUDEDEPS_SYSROOT', excludedeps)
            for excl in excludedeps:
                if excl[0].match(taskdependees[dep][0]):
                    if excl[1].match(taskdependees[task][0]):
                        not_needed = True
                        break
            if not_needed:
                continue
            # For meta-extsdk-toolchain we want all sysroot dependencies
            if taskdependees[dep][0] == 'meta-extsdk-toolchain':
                return False
            # Native/Cross populate_sysroot need their dependencies
            if isNativeCross(taskdependees[task][0]) and isNativeCross(taskdependees[dep][0]):
                return False
            # Target populate_sysroot depended on by cross tools need to be installed
            if isNativeCross(taskdependees[dep][0]):
                return False
            # Native/cross tools depended upon by target sysroot are not needed
            # Add an exception for shadow-native as required by useradd.bbclass
            if isNativeCross(taskdependees[task][0]) and taskdependees[task][0] != 'shadow-native':
                continue
            # Target populate_sysroot need their dependencies
            return False

        if taskdependees[task][1] == 'do_shared_workdir':
            continue

        if taskdependees[dep][1] == "do_populate_lic":
            continue


        # Safe fallthrough default
        logit(" Default setscene dependency fall through due to dependency: %s" % (str(taskdependees[dep])), log)
        return False
    return True


------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=run.do_qa_configure.14592
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=run.do_qa_configure.14592
X-Attachment-Id: ba7abed6-3543-4f4a-b76a-922fecc2be90
Content-ID: <ba7abed6-3543-4f4a-b76a-922fecc2be90>

def do_qa_configure(d):
    import subprocess

    ###########################################################################
    # Check config.log for cross compile issues
    ###########################################################################

    configs = []
    workdir = d.getVar('WORKDIR')

    skip = (d.getVar('INSANE_SKIP') or "").split()
    skip_configure_unsafe = False
    if 'configure-unsafe' in skip:
        bb.note("Recipe %s skipping qa checking: configure-unsafe" % d.getVar('PN'))
        skip_configure_unsafe = True

    if bb.data.inherits_class('autotools', d) and not skip_configure_unsafe:
        bb.note("Checking autotools environment for common misconfiguration")
        for root, dirs, files in os.walk(workdir):
            statement = "grep -q -F -e 'CROSS COMPILE Badness:' -e 'is unsafe for cross-compilation' %s" % \
                        os.path.join(root,"config.log")
            if "config.log" in files:
                if subprocess.call(statement, shell=True) == 0:
                    error_msg = """This autoconf log indicates errors, it looked at host include and/or library paths while determining system capabilities.
Rerun configure task after fixing this."""
                    package_qa_handle_error("configure-unsafe", error_msg, d)

            if "configure.ac" in files:
                configs.append(os.path.join(root,"configure.ac"))
            if "configure.in" in files:
                configs.append(os.path.join(root, "configure.in"))

    ###########################################################################
    # Check gettext configuration and dependencies are correct
    ###########################################################################

    skip_configure_gettext = False
    if 'configure-gettext' in skip:
        bb.note("Recipe %s skipping qa checking: configure-gettext" % d.getVar('PN'))
        skip_configure_gettext = True

    cnf = d.getVar('EXTRA_OECONF') or ""
    if not ("gettext" in d.getVar('P') or "gcc-runtime" in d.getVar('P') or \
            "--disable-nls" in cnf or skip_configure_gettext):
        ml = d.getVar("MLPREFIX") or ""
        if bb.data.inherits_class('cross-canadian', d):
            gt = "nativesdk-gettext"
        else:
            gt = "gettext-native"
        deps = bb.utils.explode_deps(d.getVar('DEPENDS') or "")
        if gt not in deps:
            for config in configs:
                gnu = "grep \"^[[:space:]]*AM_GNU_GETTEXT\" %s >/dev/null" % config
                if subprocess.call(gnu, shell=True) == 0:
                    error_msg = "AM_GNU_GETTEXT used but no inherit gettext"
                    package_qa_handle_error("configure-gettext", error_msg, d)

    ###########################################################################
    # Check unrecognised configure options (with a white list)
    ###########################################################################
    if bb.data.inherits_class("autotools", d) or bb.data.inherits_class("meson", d):
        bb.note("Checking configure output for unrecognised options")
        try:
            if bb.data.inherits_class("autotools", d):
                flag = "WARNING: unrecognized options:"
                log = os.path.join(d.getVar('B'), 'config.log')
            if bb.data.inherits_class("meson", d):
                flag = "WARNING: Unknown options:"
                log = os.path.join(d.getVar('T'), 'log.do_configure')
            output = subprocess.check_output(['grep', '-F', flag, log]).decode("utf-8").replace(', ', ' ').replace('"', '')
            options = set()
            for line in output.splitlines():
                options |= set(line.partition(flag)[2].split())
            whitelist = set(d.getVar("UNKNOWN_CONFIGURE_WHITELIST").split())
            options -= whitelist
            if options:
                pn = d.getVar('PN')
                error_msg = pn + ": configure was passed unrecognised options: " + " ".join(options)
                package_qa_handle_error("unknown-configure-option", error_msg, d)
        except subprocess.CalledProcessError:
            pass

    # Check invalid PACKAGECONFIG
    pkgconfig = (d.getVar("PACKAGECONFIG") or "").split()
    if pkgconfig:
        pkgconfigflags = d.getVarFlags("PACKAGECONFIG") or {}
        for pconfig in pkgconfig:
            if pconfig not in pkgconfigflags:
                pn = d.getVar('PN')
                error_msg = "%s: invalid PACKAGECONFIG: %s" % (pn, pconfig)
                package_qa_handle_error("invalid-packageconfig", error_msg, d)

    qa_sane = d.getVar("QA_SANE")
    if not qa_sane:
        bb.fatal("Fatal QA errors found, failing task.")

do_qa_configure(d)

def package_qa_handle_error(error_class, error_msg, d):
    if error_class in (d.getVar("ERROR_QA") or "").split():
        package_qa_write_error(error_class, error_msg, d)
        bb.error("QA Issue: %s [%s]" % (error_msg, error_class))
        d.setVar("QA_SANE", False)
        return False
    elif error_class in (d.getVar("WARN_QA") or "").split():
        package_qa_write_error(error_class, error_msg, d)
        bb.warn("QA Issue: %s [%s]" % (error_msg, error_class))
    else:
        bb.note("QA Issue: %s [%s]" % (error_msg, error_class))
    return True

def package_qa_write_error(type, error, d):
    logfile = d.getVar('QA_LOGFILE')
    if logfile:
        p = d.getVar('P')
        with open(logfile, "a+") as f:
            f.write("%s: %s [%s]\n" % (p, error, type))


------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=run.do_qa_patch.14518
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=run.do_qa_patch.14518
X-Attachment-Id: ad1f1222-7150-49d1-8914-c9190300c00f
Content-ID: <ad1f1222-7150-49d1-8914-c9190300c00f>

def do_qa_patch(d):
    import subprocess

    ###########################################################################
    # Check patch.log for fuzz warnings
    #
    # Further information on why we check for patch fuzz warnings:
    # http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
    # https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
    ###########################################################################

    logdir = d.getVar('T')
    patchlog = os.path.join(logdir,"log.do_patch")

    if os.path.exists(patchlog):
        fuzzheader = '--- Patch fuzz start ---'
        fuzzfooter = '--- Patch fuzz end ---'
        statement = "grep -e '%s' %s > /dev/null" % (fuzzheader, patchlog)
        if subprocess.call(statement, shell=True) == 0:
            msg = "Fuzz detected:\n\n"
            fuzzmsg = ""
            inFuzzInfo = False
            f = open(patchlog, "r")
            for line in f:
                if fuzzheader in line:
                    inFuzzInfo = True
                    fuzzmsg = ""
                elif fuzzfooter in line:
                    fuzzmsg = fuzzmsg.replace('\n\n', '\n')
                    msg += fuzzmsg
                    msg += "\n"
                    inFuzzInfo = False
                elif inFuzzInfo and not 'Now at patch' in line:
                    fuzzmsg += line
            f.close()
            msg += "The context lines in the patches can be updated with devtool:\n"
            msg += "\n"
            msg += "    devtool modify %s\n" % d.getVar('PN')
            msg += "    devtool finish --force-patch-refresh %s <layer_path>\n\n" % d.getVar('PN')
            msg += "Don't forget to review changes done by devtool!\n"
            if 'patch-fuzz' in d.getVar('ERROR_QA'):
                bb.error(msg)
            elif 'patch-fuzz' in d.getVar('WARN_QA'):
                bb.warn(msg)
            msg = "Patch log indicates that patches do not apply cleanly."
            package_qa_handle_error("patch-fuzz", msg, d)

do_qa_patch(d)

def package_qa_handle_error(error_class, error_msg, d):
    if error_class in (d.getVar("ERROR_QA") or "").split():
        package_qa_write_error(error_class, error_msg, d)
        bb.error("QA Issue: %s [%s]" % (error_msg, error_class))
        d.setVar("QA_SANE", False)
        return False
    elif error_class in (d.getVar("WARN_QA") or "").split():
        package_qa_write_error(error_class, error_msg, d)
        bb.warn("QA Issue: %s [%s]" % (error_msg, error_class))
    else:
        bb.note("QA Issue: %s [%s]" % (error_msg, error_class))
    return True

def package_qa_write_error(type, error, d):
    logfile = d.getVar('QA_LOGFILE')
    if logfile:
        p = d.getVar('P')
        with open(logfile, "a+") as f:
            f.write("%s: %s [%s]\n" % (p, error, type))


------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=run.do_qa_unpack.14488
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=run.do_qa_unpack.14488
X-Attachment-Id: ac37bc98-0d1d-409e-80ab-07e640302e75
Content-ID: <ac37bc98-0d1d-409e-80ab-07e640302e75>

def do_qa_unpack(d):
    src_uri = d.getVar('SRC_URI')
    s_dir = d.getVar('S')
    if src_uri and not os.path.exists(s_dir):
        bb.warn('%s: the directory %s (%s) pointed to by the S variable doesn\'t exist - please set S within the recipe to point to where the source has been unpacked to' % (d.getVar('PN'), d.getVar('S', False), s_dir))

do_qa_unpack(d)


------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=run.do_unpack
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=run.do_unpack
X-Attachment-Id: 5fb2b0a0-8b64-4285-9f13-c70efadbff97
Content-ID: <5fb2b0a0-8b64-4285-9f13-c70efadbff97>

def do_unpack(d):
    bb.build.exec_func('base_do_unpack', d)

do_unpack(d)

def base_do_unpack(d):
    src_uri = (d.getVar('SRC_URI') or "").split()
    if len(src_uri) == 0:
        return

    try:
        fetcher = bb.fetch2.Fetch(src_uri, d)
        fetcher.unpack(d.getVar('WORKDIR'))
    except bb.fetch2.BBFetchException as e:
        bb.fatal(str(e))


------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=run.do_unpack.14488
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=run.do_unpack.14488
X-Attachment-Id: 26e8e341-02c6-40aa-8a52-6cffaad462cd
Content-ID: <26e8e341-02c6-40aa-8a52-6cffaad462cd>

def do_unpack(d):
    bb.build.exec_func('base_do_unpack', d)

do_unpack(d)

def base_do_unpack(d):
    src_uri = (d.getVar('SRC_URI') or "").split()
    if len(src_uri) == 0:
        return

    try:
        fetcher = bb.fetch2.Fetch(src_uri, d)
        fetcher.unpack(d.getVar('WORKDIR'))
    except bb.fetch2.BBFetchException as e:
        bb.fatal(str(e))


------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=run.extend_recipe_sysroot.14470
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=run.extend_recipe_sysroot.14470
X-Attachment-Id: 4c7738d8-efdb-4489-8888-279ed8791be8
Content-ID: <4c7738d8-efdb-4489-8888-279ed8791be8>

def extend_recipe_sysroot(d):
    import copy
    import subprocess
    import errno
    import collections
    import glob

    taskdepdata = d.getVar("BB_TASKDEPDATA", False)
    mytaskname = d.getVar("BB_RUNTASK")
    if mytaskname.endswith("_setscene"):
        mytaskname = mytaskname.replace("_setscene", "")
    workdir = d.getVar("WORKDIR")
    #bb.warn(str(taskdepdata))
    pn = d.getVar("PN")
    stagingdir = d.getVar("STAGING_DIR")
    sharedmanifests = d.getVar("COMPONENTS_DIR") + "/manifests"
    recipesysroot = d.getVar("RECIPE_SYSROOT")
    recipesysrootnative = d.getVar("RECIPE_SYSROOT_NATIVE")

    # Detect bitbake -b usage
    nodeps = d.getVar("BB_LIMITEDDEPS") or False
    if nodeps:
        lock = bb.utils.lockfile(recipesysroot + "/sysroot.lock")
        staging_populate_sysroot_dir(recipesysroot, recipesysrootnative, True, d)
        staging_populate_sysroot_dir(recipesysroot, recipesysrootnative, False, d)
        bb.utils.unlockfile(lock)
        return

    start = None
    configuredeps = []
    for dep in taskdepdata:
        data = taskdepdata[dep]
        if data[1] == mytaskname and data[0] == pn:
            start = dep
            break
    if start is None:
        bb.fatal("Couldn't find ourself in BB_TASKDEPDATA?")

    # We need to figure out which sysroot files we need to expose to this task.
    # This needs to match what would get restored from sstate, which is controlled
    # ultimately by calls from bitbake to setscene_depvalid().
    # That function expects a setscene dependency tree. We build a dependency tree
    # condensed to inter-sstate task dependencies, similar to that used by setscene
    # tasks. We can then call into setscene_depvalid() and decide
    # which dependencies we can "see" and should expose in the recipe specific sysroot.
    setscenedeps = copy.deepcopy(taskdepdata)

    start = set([start])

    sstatetasks = d.getVar("SSTATETASKS").split()
    # Add recipe specific tasks referenced by setscene_depvalid()
    sstatetasks.append("do_stash_locale")

    def print_dep_tree(deptree):
        data = ""
        for dep in deptree:
            deps = "    " + "\n    ".join(deptree[dep][3]) + "\n"
            data = data + "%s:\n  %s\n  %s\n%s  %s\n  %s\n" % (deptree[dep][0], deptree[dep][1], deptree[dep][2], deps, deptree[dep][4], deptree[dep][5])
        return data

    #bb.note("Full dep tree is:\n%s" % print_dep_tree(taskdepdata))

    #bb.note(" start2 is %s" % str(start))

    # If start is an sstate task (like do_package) we need to add in its direct dependencies
    # else the code below won't recurse into them.
    for dep in set(start):
        for dep2 in setscenedeps[dep][3]:
            start.add(dep2)
        start.remove(dep)

    #bb.note(" start3 is %s" % str(start))

    # Create collapsed do_populate_sysroot -> do_populate_sysroot tree
    for dep in taskdepdata:
        data = setscenedeps[dep]
        if data[1] not in sstatetasks:
            for dep2 in setscenedeps:
                data2 = setscenedeps[dep2]
                if dep in data2[3]:
                    data2[3].update(setscenedeps[dep][3])
                    data2[3].remove(dep)
            if dep in start:
                start.update(setscenedeps[dep][3])
                start.remove(dep)
            del setscenedeps[dep]

    # Remove circular references
    for dep in setscenedeps:
        if dep in setscenedeps[dep][3]:
            setscenedeps[dep][3].remove(dep)

    #bb.note("Computed dep tree is:\n%s" % print_dep_tree(setscenedeps))
    #bb.note(" start is %s" % str(start))

    # Direct dependencies should be present and can be depended upon
    for dep in set(start):
        if setscenedeps[dep][1] == "do_populate_sysroot":
            if dep not in configuredeps:
                configuredeps.append(dep)
    bb.note("Direct dependencies are %s" % str(configuredeps))
    #bb.note(" or %s" % str(start))

    msgbuf = []
    # Call into setscene_depvalid for each sub-dependency and only copy sysroot files
    # for ones that would be restored from sstate.
    done = list(start)
    next = list(start)
    while next:
        new = []
        for dep in next:
            data = setscenedeps[dep]
            for datadep in data[3]:
                if datadep in done:
                    continue
                taskdeps = {}
                taskdeps[dep] = setscenedeps[dep][:2]
                taskdeps[datadep] = setscenedeps[datadep][:2]
                retval = setscene_depvalid(datadep, taskdeps, [], d, msgbuf)
                if retval:
                    msgbuf.append("Skipping setscene dependency %s for installation into the sysroot" % datadep)
                    continue
                done.append(datadep)
                new.append(datadep)
                if datadep not in configuredeps and setscenedeps[datadep][1] == "do_populate_sysroot":
                    configuredeps.append(datadep)
                    msgbuf.append("Adding dependency on %s" % setscenedeps[datadep][0])
                else:
                    msgbuf.append("Following dependency on %s" % setscenedeps[datadep][0])
        next = new

    # This logging is too verbose for day to day use sadly
    #bb.debug(2, "\n".join(msgbuf))

    depdir = recipesysrootnative + "/installeddeps"
    bb.utils.mkdirhier(depdir)
    bb.utils.mkdirhier(sharedmanifests)

    lock = bb.utils.lockfile(recipesysroot + "/sysroot.lock")

    fixme = {}
    seendirs = set()
    postinsts = []
    multilibs = {}
    manifests = {}
    # All files that we're going to be installing, to find conflicts.
    fileset = {}

    for f in os.listdir(depdir):
        if not f.endswith(".complete"):
            continue
        f = depdir + "/" + f
        if os.path.islink(f) and not os.path.exists(f):
            bb.note("%s no longer exists, removing from sysroot" % f)
            lnk = os.readlink(f.replace(".complete", ""))
            sstate_clean_manifest(depdir + "/" + lnk, d, workdir)
            os.unlink(f)
            os.unlink(f.replace(".complete", ""))

    installed = []
    for dep in configuredeps:
        c = setscenedeps[dep][0]
        if mytaskname in ["do_sdk_depends", "do_populate_sdk_ext"] and c.endswith("-initial"):
            bb.note("Skipping initial setscene dependency %s for installation into the sysroot" % c)
            continue
        installed.append(c)

    # We want to remove anything which this task previously installed but is no longer a dependency
    taskindex = depdir + "/" + "index." + mytaskname
    if os.path.exists(taskindex):
        potential = []
        with open(taskindex, "r") as f:
            for l in f:
                l = l.strip()
                if l not in installed:
                    fl = depdir + "/" + l
                    if not os.path.exists(fl):
                        # Was likely already uninstalled
                        continue
                    potential.append(l)
        # We need to ensure not other task needs this dependency. We hold the sysroot
        # lock so we ca search the indexes to check
        if potential:
            for i in glob.glob(depdir + "/index.*"):
                if i.endswith("." + mytaskname):
                    continue
                with open(i, "r") as f:
                    for l in f:
                        l = l.strip()
                        if l in potential:
                            potential.remove(l)
        for l in potential:
            fl = depdir + "/" + l
            bb.note("Task %s no longer depends on %s, removing from sysroot" % (mytaskname, l))
            lnk = os.readlink(fl)
            sstate_clean_manifest(depdir + "/" + lnk, d, workdir)
            os.unlink(fl)
            os.unlink(fl + ".complete")

    msg_exists = []
    msg_adding = []

    for dep in configuredeps:
        c = setscenedeps[dep][0]
        if c not in installed:
            continue
        taskhash = setscenedeps[dep][5]
        taskmanifest = depdir + "/" + c + "." + taskhash

        if os.path.exists(depdir + "/" + c):
            lnk = os.readlink(depdir + "/" + c)
            if lnk == c + "." + taskhash and os.path.exists(depdir + "/" + c + ".complete"):
                msg_exists.append(c)
                continue
            else:
                bb.note("%s exists in sysroot, but is stale (%s vs. %s), removing." % (c, lnk, c + "." + taskhash))
                sstate_clean_manifest(depdir + "/" + lnk, d, workdir)
                os.unlink(depdir + "/" + c)
                if os.path.lexists(depdir + "/" + c + ".complete"):
                    os.unlink(depdir + "/" + c + ".complete")
        elif os.path.lexists(depdir + "/" + c):
            os.unlink(depdir + "/" + c)

        msg_adding.append(c)

        os.symlink(c + "." + taskhash, depdir + "/" + c)

        manifest, d2 = oe.sstatesig.find_sstate_manifest(c, setscenedeps[dep][2], "populate_sysroot", d, multilibs)
        if d2 is not d:
            # If we don't do this, the recipe sysroot will be placed in the wrong WORKDIR for multilibs
            # We need a consistent WORKDIR for the image
            d2.setVar("WORKDIR", d.getVar("WORKDIR"))
        destsysroot = d2.getVar("RECIPE_SYSROOT")
        # We put allarch recipes into the default sysroot
        if manifest and "allarch" in manifest:
            destsysroot = d.getVar("RECIPE_SYSROOT")

        native = False
        if c.endswith("-native") or "-cross-" in c or "-crosssdk" in c:
            native = True

        if manifest:
            newmanifest = collections.OrderedDict()
            targetdir = destsysroot
            if native:
                targetdir = recipesysrootnative
            if targetdir not in fixme:
                fixme[targetdir] = []
            fm = fixme[targetdir]

            with open(manifest, "r") as f:
                manifests[dep] = manifest
                for l in f:
                    l = l.strip()
                    if l.endswith("/fixmepath"):
                        fm.append(l)
                        continue
                    if l.endswith("/fixmepath.cmd"):
                        continue
                    dest = l.replace(stagingdir, "")
                    dest = "/" + "/".join(dest.split("/")[3:])
                    newmanifest[l] = targetdir + dest

                    # Check if files have already been installed by another
                    # recipe and abort if they have, explaining what recipes are
                    # conflicting.
                    hashname = targetdir + dest
                    if not hashname.endswith("/"):
                        if hashname in fileset:
                            bb.fatal("The file %s is installed by both %s and %s, aborting" % (dest, c, fileset[hashname]))
                        else:
                            fileset[hashname] = c

            # Having multiple identical manifests in each sysroot eats diskspace so
            # create a shared pool of them and hardlink if we can.
            # We create the manifest in advance so that if something fails during installation,
            # or the build is interrupted, subsequent exeuction can cleanup.
            sharedm = sharedmanifests + "/" + os.path.basename(taskmanifest)
            if not os.path.exists(sharedm):
                smlock = bb.utils.lockfile(sharedm + ".lock")
                # Can race here. You'd think it just means we may not end up with all copies hardlinked to each other
                # but python can lose file handles so we need to do this under a lock.
                if not os.path.exists(sharedm):
                    with open(sharedm, 'w') as m:
                       for l in newmanifest:
                           dest = newmanifest[l]
                           m.write(dest.replace(workdir + "/", "") + "\n")
                bb.utils.unlockfile(smlock)
            try:
                os.link(sharedm, taskmanifest)
            except OSError as err:
                if err.errno == errno.EXDEV:
                    bb.utils.copyfile(sharedm, taskmanifest)
                else:
                    raise
            # Finally actually install the files
            for l in newmanifest:
                    dest = newmanifest[l]
                    if l.endswith("/"):
                        staging_copydir(l, targetdir, dest, seendirs)
                        continue
                    staging_copyfile(l, targetdir, dest, postinsts, seendirs)

    bb.note("Installed into sysroot: %s" % str(msg_adding))
    bb.note("Skipping as already exists in sysroot: %s" % str(msg_exists))

    for f in fixme:
        staging_processfixme(fixme[f], f, recipesysroot, recipesysrootnative, d)

    for p in postinsts:
        subprocess.check_output(p, shell=True, stderr=subprocess.STDOUT)

    for dep in manifests:
        c = setscenedeps[dep][0]
        os.symlink(manifests[dep], depdir + "/" + c + ".complete")

    with open(taskindex, "w") as f:
        for l in sorted(installed):
            f.write(l + "\n")

    bb.utils.unlockfile(lock)

extend_recipe_sysroot(d)

def staging_processfixme(fixme, target, recipesysroot, recipesysrootnative, d):
    import subprocess

    if not fixme:
        return
    cmd = "sed -e 's:^[^/]*/:%s/:g' %s | xargs sed -i -e 's:FIXMESTAGINGDIRTARGET:%s:g; s:FIXMESTAGINGDIRHOST:%s:g'" % (target, " ".join(fixme), recipesysroot, recipesysrootnative)
    for fixmevar in ['PSEUDO_SYSROOT', 'HOSTTOOLS_DIR', 'PKGDATA_DIR', 'PSEUDO_LOCALSTATEDIR', 'LOGFIFO']:
        fixme_path = d.getVar(fixmevar)
        cmd += " -e 's:FIXME_%s:%s:g'" % (fixmevar, fixme_path)
    bb.debug(2, cmd)
    subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)

def staging_copydir(c, target, dest, seendirs):
    if dest not in seendirs:
        bb.utils.mkdirhier(dest)
        seendirs.add(dest)

def staging_populate_sysroot_dir(targetsysroot, nativesysroot, native, d):
    import glob
    import subprocess
    import errno

    fixme = []
    postinsts = []
    seendirs = set()
    stagingdir = d.getVar("STAGING_DIR")
    if native:
        pkgarchs = ['${BUILD_ARCH}', '${BUILD_ARCH}_*']
        targetdir = nativesysroot
    else:
        pkgarchs = ['${MACHINE_ARCH}']
        pkgarchs = pkgarchs + list(reversed(d.getVar("PACKAGE_EXTRA_ARCHS").split()))
        pkgarchs.append('allarch')
        targetdir = targetsysroot

    bb.utils.mkdirhier(targetdir)
    for pkgarch in pkgarchs:
        for manifest in glob.glob(d.expand("${SSTATE_MANIFESTS}/manifest-%s-*.populate_sysroot" % pkgarch)):
            if manifest.endswith("-initial.populate_sysroot"):
                # skip glibc-initial and libgcc-initial due to file overlap
                continue
            if not native and (manifest.endswith("-native.populate_sysroot") or "nativesdk-" in manifest):
                continue
            if native and not (manifest.endswith("-native.populate_sysroot") or manifest.endswith("-cross.populate_sysroot") or "-cross-" in manifest):
                continue
            tmanifest = targetdir + "/" + os.path.basename(manifest)
            if os.path.exists(tmanifest):
                continue
            try:
                os.link(manifest, tmanifest)
            except OSError as err:
                if err.errno == errno.EXDEV:
                    bb.utils.copyfile(manifest, tmanifest)
                else:
                    raise
            with open(manifest, "r") as f:
                for l in f:
                    l = l.strip()
                    if l.endswith("/fixmepath"):
                        fixme.append(l)
                        continue
                    if l.endswith("/fixmepath.cmd"):
                        continue
                    dest = l.replace(stagingdir, "")
                    dest = targetdir + "/" + "/".join(dest.split("/")[3:])
                    if l.endswith("/"):
                        staging_copydir(l, targetdir, dest, seendirs)
                        continue
                    try:
                        staging_copyfile(l, targetdir, dest, postinsts, seendirs)
                    except FileExistsError:
                        continue

    staging_processfixme(fixme, targetdir, targetsysroot, nativesysroot, d)
    for p in postinsts:
        subprocess.check_output(p, shell=True, stderr=subprocess.STDOUT)

#
# Manifests here are complicated. The main sysroot area has the unpacked sstate
# which us unrelocated and tracked by the main sstate manifests. Each recipe
# specific sysroot has manifests for each dependency that is installed there.
# The task hash is used to tell whether the data needs to be reinstalled. We
# use a symlink to point to the currently installed hash. There is also a
# "complete" stamp file which is used to mark if installation completed. If
# something fails (e.g. a postinst), this won't get written and we would
# remove and reinstall the dependency. This also means partially installed
# dependencies should get cleaned up correctly.
#

def staging_copyfile(c, target, dest, postinsts, seendirs):
    import errno

    destdir = os.path.dirname(dest)
    if destdir not in seendirs:
        bb.utils.mkdirhier(destdir)
        seendirs.add(destdir)
    if "/usr/bin/postinst-" in c:
        postinsts.append(dest)
    if os.path.islink(c):
        linkto = os.readlink(c)
        if os.path.lexists(dest):
            if not os.path.islink(dest):
                raise OSError(errno.EEXIST, "Link %s already exists as a file" % dest, dest)
            if os.readlink(dest) == linkto:
                return dest
            raise OSError(errno.EEXIST, "Link %s already exists to a different location? (%s vs %s)" % (dest, os.readlink(dest), linkto), dest)
        os.symlink(linkto, dest)
        #bb.warn(c)
    else:
        try:
            os.link(c, dest)
        except OSError as err:
            if err.errno == errno.EXDEV:
                bb.utils.copyfile(c, dest)
            else:
                raise
    return dest

def sstate_clean_manifest(manifest, d, prefix=None):
    import oe.path

    mfile = open(manifest)
    entries = mfile.readlines()
    mfile.close()

    for entry in entries:
        entry = entry.strip()
        if prefix and not entry.startswith("/"):
            entry = prefix + "/" + entry
        bb.debug(2, "Removing manifest: %s" % entry)
        # We can race against another package populating directories as we're removing them
        # so we ignore errors here.
        try:
            if entry.endswith("/"):
                if os.path.islink(entry[:-1]):
                    os.remove(entry[:-1])
                elif os.path.exists(entry) and len(os.listdir(entry)) == 0:
                    os.rmdir(entry[:-1])
            else:
                os.remove(entry)
        except OSError:
            pass

    postrm = manifest + ".postrm"
    if os.path.exists(manifest + ".postrm"):
        import subprocess
        os.chmod(postrm, 0o755)
        subprocess.check_call(postrm, shell=True)
        oe.path.remove(postrm)

    oe.path.remove(manifest)

def setscene_depvalid(task, taskdependees, notneeded, d, log=None):
    # taskdependees is a dict of tasks which depend on task, each being a 3 item list of [PN, TASKNAME, FILENAME]
    # task is included in taskdependees too
    # Return - False - We need this dependency
    #        - True - We can skip this dependency
    import re

    def logit(msg, log):
        if log is not None:
            log.append(msg)
        else:
            bb.debug(2, msg)

    logit("Considering setscene task: %s" % (str(taskdependees[task])), log)

    def isNativeCross(x):
        return x.endswith("-native") or "-cross-" in x or "-crosssdk" in x or x.endswith("-cross")

    # We only need to trigger populate_lic through direct dependencies
    if taskdependees[task][1] == "do_populate_lic":
        return True

    # stash_locale and gcc_stash_builddir are never needed as a dependency for built objects
    if taskdependees[task][1] == "do_stash_locale" or taskdependees[task][1] == "do_gcc_stash_builddir":
        return True

    # We only need to trigger packagedata through direct dependencies
    # but need to preserve packagedata on packagedata links
    if taskdependees[task][1] == "do_packagedata":
        for dep in taskdependees:
            if taskdependees[dep][1] == "do_packagedata":
                return False
        return True

    for dep in taskdependees:
        logit("  considering dependency: %s" % (str(taskdependees[dep])), log)
        if task == dep:
            continue
        if dep in notneeded:
            continue
        # do_package_write_* and do_package doesn't need do_package
        if taskdependees[task][1] == "do_package" and taskdependees[dep][1] in ['do_package', 'do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm', 'do_packagedata', 'do_package_qa']:
            continue
        # do_package_write_* need do_populate_sysroot as they're mainly postinstall dependencies
        if taskdependees[task][1] == "do_populate_sysroot" and taskdependees[dep][1] in ['do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm']:
            return False
        # do_package/packagedata/package_qa don't need do_populate_sysroot
        if taskdependees[task][1] == "do_populate_sysroot" and taskdependees[dep][1] in ['do_package', 'do_packagedata', 'do_package_qa']:
            continue
        # Native/Cross packages don't exist and are noexec anyway
        if isNativeCross(taskdependees[dep][0]) and taskdependees[dep][1] in ['do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm', 'do_packagedata', 'do_package', 'do_package_qa']:
            continue

        # This is due to the [depends] in useradd.bbclass complicating matters
        # The logic *is* reversed here due to the way hard setscene dependencies are injected
        if (taskdependees[task][1] == 'do_package' or taskdependees[task][1] == 'do_populate_sysroot') and taskdependees[dep][0].endswith(('shadow-native', 'shadow-sysroot', 'base-passwd', 'pseudo-native')) and taskdependees[dep][1] == 'do_populate_sysroot':
            continue

        # Consider sysroot depending on sysroot tasks
        if taskdependees[task][1] == 'do_populate_sysroot' and taskdependees[dep][1] == 'do_populate_sysroot':
            # Allow excluding certain recursive dependencies. If a recipe needs it should add a
            # specific dependency itself, rather than relying on one of its dependees to pull
            # them in.
            # See also http://lists.openembedded.org/pipermail/openembedded-core/2018-January/146324.html
            not_needed = False
            excludedeps = d.getVar('_SSTATE_EXCLUDEDEPS_SYSROOT')
            if excludedeps is None:
                # Cache the regular expressions for speed
                excludedeps = []
                for excl in (d.getVar('SSTATE_EXCLUDEDEPS_SYSROOT') or "").split():
                    excludedeps.append((re.compile(excl.split('->', 1)[0]), re.compile(excl.split('->', 1)[1])))
                d.setVar('_SSTATE_EXCLUDEDEPS_SYSROOT', excludedeps)
            for excl in excludedeps:
                if excl[0].match(taskdependees[dep][0]):
                    if excl[1].match(taskdependees[task][0]):
                        not_needed = True
                        break
            if not_needed:
                continue
            # For meta-extsdk-toolchain we want all sysroot dependencies
            if taskdependees[dep][0] == 'meta-extsdk-toolchain':
                return False
            # Native/Cross populate_sysroot need their dependencies
            if isNativeCross(taskdependees[task][0]) and isNativeCross(taskdependees[dep][0]):
                return False
            # Target populate_sysroot depended on by cross tools need to be installed
            if isNativeCross(taskdependees[dep][0]):
                return False
            # Native/cross tools depended upon by target sysroot are not needed
            # Add an exception for shadow-native as required by useradd.bbclass
            if isNativeCross(taskdependees[task][0]) and taskdependees[task][0] != 'shadow-native':
                continue
            # Target populate_sysroot need their dependencies
            return False

        if taskdependees[task][1] == 'do_shared_workdir':
            continue

        if taskdependees[dep][1] == "do_populate_lic":
            continue


        # Safe fallthrough default
        logit(" Default setscene dependency fall through due to dependency: %s" % (str(taskdependees[dep])), log)
        return False
    return True


------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=run.extend_recipe_sysroot.14489
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=run.extend_recipe_sysroot.14489
X-Attachment-Id: 7c3db2c8-05c5-4551-b63b-7a4351cce079
Content-ID: <7c3db2c8-05c5-4551-b63b-7a4351cce079>

def extend_recipe_sysroot(d):
    import copy
    import subprocess
    import errno
    import collections
    import glob

    taskdepdata = d.getVar("BB_TASKDEPDATA", False)
    mytaskname = d.getVar("BB_RUNTASK")
    if mytaskname.endswith("_setscene"):
        mytaskname = mytaskname.replace("_setscene", "")
    workdir = d.getVar("WORKDIR")
    #bb.warn(str(taskdepdata))
    pn = d.getVar("PN")
    stagingdir = d.getVar("STAGING_DIR")
    sharedmanifests = d.getVar("COMPONENTS_DIR") + "/manifests"
    recipesysroot = d.getVar("RECIPE_SYSROOT")
    recipesysrootnative = d.getVar("RECIPE_SYSROOT_NATIVE")

    # Detect bitbake -b usage
    nodeps = d.getVar("BB_LIMITEDDEPS") or False
    if nodeps:
        lock = bb.utils.lockfile(recipesysroot + "/sysroot.lock")
        staging_populate_sysroot_dir(recipesysroot, recipesysrootnative, True, d)
        staging_populate_sysroot_dir(recipesysroot, recipesysrootnative, False, d)
        bb.utils.unlockfile(lock)
        return

    start = None
    configuredeps = []
    for dep in taskdepdata:
        data = taskdepdata[dep]
        if data[1] == mytaskname and data[0] == pn:
            start = dep
            break
    if start is None:
        bb.fatal("Couldn't find ourself in BB_TASKDEPDATA?")

    # We need to figure out which sysroot files we need to expose to this task.
    # This needs to match what would get restored from sstate, which is controlled
    # ultimately by calls from bitbake to setscene_depvalid().
    # That function expects a setscene dependency tree. We build a dependency tree
    # condensed to inter-sstate task dependencies, similar to that used by setscene
    # tasks. We can then call into setscene_depvalid() and decide
    # which dependencies we can "see" and should expose in the recipe specific sysroot.
    setscenedeps = copy.deepcopy(taskdepdata)

    start = set([start])

    sstatetasks = d.getVar("SSTATETASKS").split()
    # Add recipe specific tasks referenced by setscene_depvalid()
    sstatetasks.append("do_stash_locale")

    def print_dep_tree(deptree):
        data = ""
        for dep in deptree:
            deps = "    " + "\n    ".join(deptree[dep][3]) + "\n"
            data = data + "%s:\n  %s\n  %s\n%s  %s\n  %s\n" % (deptree[dep][0], deptree[dep][1], deptree[dep][2], deps, deptree[dep][4], deptree[dep][5])
        return data

    #bb.note("Full dep tree is:\n%s" % print_dep_tree(taskdepdata))

    #bb.note(" start2 is %s" % str(start))

    # If start is an sstate task (like do_package) we need to add in its direct dependencies
    # else the code below won't recurse into them.
    for dep in set(start):
        for dep2 in setscenedeps[dep][3]:
            start.add(dep2)
        start.remove(dep)

    #bb.note(" start3 is %s" % str(start))

    # Create collapsed do_populate_sysroot -> do_populate_sysroot tree
    for dep in taskdepdata:
        data = setscenedeps[dep]
        if data[1] not in sstatetasks:
            for dep2 in setscenedeps:
                data2 = setscenedeps[dep2]
                if dep in data2[3]:
                    data2[3].update(setscenedeps[dep][3])
                    data2[3].remove(dep)
            if dep in start:
                start.update(setscenedeps[dep][3])
                start.remove(dep)
            del setscenedeps[dep]

    # Remove circular references
    for dep in setscenedeps:
        if dep in setscenedeps[dep][3]:
            setscenedeps[dep][3].remove(dep)

    #bb.note("Computed dep tree is:\n%s" % print_dep_tree(setscenedeps))
    #bb.note(" start is %s" % str(start))

    # Direct dependencies should be present and can be depended upon
    for dep in set(start):
        if setscenedeps[dep][1] == "do_populate_sysroot":
            if dep not in configuredeps:
                configuredeps.append(dep)
    bb.note("Direct dependencies are %s" % str(configuredeps))
    #bb.note(" or %s" % str(start))

    msgbuf = []
    # Call into setscene_depvalid for each sub-dependency and only copy sysroot files
    # for ones that would be restored from sstate.
    done = list(start)
    next = list(start)
    while next:
        new = []
        for dep in next:
            data = setscenedeps[dep]
            for datadep in data[3]:
                if datadep in done:
                    continue
                taskdeps = {}
                taskdeps[dep] = setscenedeps[dep][:2]
                taskdeps[datadep] = setscenedeps[datadep][:2]
                retval = setscene_depvalid(datadep, taskdeps, [], d, msgbuf)
                if retval:
                    msgbuf.append("Skipping setscene dependency %s for installation into the sysroot" % datadep)
                    continue
                done.append(datadep)
                new.append(datadep)
                if datadep not in configuredeps and setscenedeps[datadep][1] == "do_populate_sysroot":
                    configuredeps.append(datadep)
                    msgbuf.append("Adding dependency on %s" % setscenedeps[datadep][0])
                else:
                    msgbuf.append("Following dependency on %s" % setscenedeps[datadep][0])
        next = new

    # This logging is too verbose for day to day use sadly
    #bb.debug(2, "\n".join(msgbuf))

    depdir = recipesysrootnative + "/installeddeps"
    bb.utils.mkdirhier(depdir)
    bb.utils.mkdirhier(sharedmanifests)

    lock = bb.utils.lockfile(recipesysroot + "/sysroot.lock")

    fixme = {}
    seendirs = set()
    postinsts = []
    multilibs = {}
    manifests = {}
    # All files that we're going to be installing, to find conflicts.
    fileset = {}

    for f in os.listdir(depdir):
        if not f.endswith(".complete"):
            continue
        f = depdir + "/" + f
        if os.path.islink(f) and not os.path.exists(f):
            bb.note("%s no longer exists, removing from sysroot" % f)
            lnk = os.readlink(f.replace(".complete", ""))
            sstate_clean_manifest(depdir + "/" + lnk, d, workdir)
            os.unlink(f)
            os.unlink(f.replace(".complete", ""))

    installed = []
    for dep in configuredeps:
        c = setscenedeps[dep][0]
        if mytaskname in ["do_sdk_depends", "do_populate_sdk_ext"] and c.endswith("-initial"):
            bb.note("Skipping initial setscene dependency %s for installation into the sysroot" % c)
            continue
        installed.append(c)

    # We want to remove anything which this task previously installed but is no longer a dependency
    taskindex = depdir + "/" + "index." + mytaskname
    if os.path.exists(taskindex):
        potential = []
        with open(taskindex, "r") as f:
            for l in f:
                l = l.strip()
                if l not in installed:
                    fl = depdir + "/" + l
                    if not os.path.exists(fl):
                        # Was likely already uninstalled
                        continue
                    potential.append(l)
        # We need to ensure not other task needs this dependency. We hold the sysroot
        # lock so we ca search the indexes to check
        if potential:
            for i in glob.glob(depdir + "/index.*"):
                if i.endswith("." + mytaskname):
                    continue
                with open(i, "r") as f:
                    for l in f:
                        l = l.strip()
                        if l in potential:
                            potential.remove(l)
        for l in potential:
            fl = depdir + "/" + l
            bb.note("Task %s no longer depends on %s, removing from sysroot" % (mytaskname, l))
            lnk = os.readlink(fl)
            sstate_clean_manifest(depdir + "/" + lnk, d, workdir)
            os.unlink(fl)
            os.unlink(fl + ".complete")

    msg_exists = []
    msg_adding = []

    for dep in configuredeps:
        c = setscenedeps[dep][0]
        if c not in installed:
            continue
        taskhash = setscenedeps[dep][5]
        taskmanifest = depdir + "/" + c + "." + taskhash

        if os.path.exists(depdir + "/" + c):
            lnk = os.readlink(depdir + "/" + c)
            if lnk == c + "." + taskhash and os.path.exists(depdir + "/" + c + ".complete"):
                msg_exists.append(c)
                continue
            else:
                bb.note("%s exists in sysroot, but is stale (%s vs. %s), removing." % (c, lnk, c + "." + taskhash))
                sstate_clean_manifest(depdir + "/" + lnk, d, workdir)
                os.unlink(depdir + "/" + c)
                if os.path.lexists(depdir + "/" + c + ".complete"):
                    os.unlink(depdir + "/" + c + ".complete")
        elif os.path.lexists(depdir + "/" + c):
            os.unlink(depdir + "/" + c)

        msg_adding.append(c)

        os.symlink(c + "." + taskhash, depdir + "/" + c)

        manifest, d2 = oe.sstatesig.find_sstate_manifest(c, setscenedeps[dep][2], "populate_sysroot", d, multilibs)
        if d2 is not d:
            # If we don't do this, the recipe sysroot will be placed in the wrong WORKDIR for multilibs
            # We need a consistent WORKDIR for the image
            d2.setVar("WORKDIR", d.getVar("WORKDIR"))
        destsysroot = d2.getVar("RECIPE_SYSROOT")
        # We put allarch recipes into the default sysroot
        if manifest and "allarch" in manifest:
            destsysroot = d.getVar("RECIPE_SYSROOT")

        native = False
        if c.endswith("-native") or "-cross-" in c or "-crosssdk" in c:
            native = True

        if manifest:
            newmanifest = collections.OrderedDict()
            targetdir = destsysroot
            if native:
                targetdir = recipesysrootnative
            if targetdir not in fixme:
                fixme[targetdir] = []
            fm = fixme[targetdir]

            with open(manifest, "r") as f:
                manifests[dep] = manifest
                for l in f:
                    l = l.strip()
                    if l.endswith("/fixmepath"):
                        fm.append(l)
                        continue
                    if l.endswith("/fixmepath.cmd"):
                        continue
                    dest = l.replace(stagingdir, "")
                    dest = "/" + "/".join(dest.split("/")[3:])
                    newmanifest[l] = targetdir + dest

                    # Check if files have already been installed by another
                    # recipe and abort if they have, explaining what recipes are
                    # conflicting.
                    hashname = targetdir + dest
                    if not hashname.endswith("/"):
                        if hashname in fileset:
                            bb.fatal("The file %s is installed by both %s and %s, aborting" % (dest, c, fileset[hashname]))
                        else:
                            fileset[hashname] = c

            # Having multiple identical manifests in each sysroot eats diskspace so
            # create a shared pool of them and hardlink if we can.
            # We create the manifest in advance so that if something fails during installation,
            # or the build is interrupted, subsequent exeuction can cleanup.
            sharedm = sharedmanifests + "/" + os.path.basename(taskmanifest)
            if not os.path.exists(sharedm):
                smlock = bb.utils.lockfile(sharedm + ".lock")
                # Can race here. You'd think it just means we may not end up with all copies hardlinked to each other
                # but python can lose file handles so we need to do this under a lock.
                if not os.path.exists(sharedm):
                    with open(sharedm, 'w') as m:
                       for l in newmanifest:
                           dest = newmanifest[l]
                           m.write(dest.replace(workdir + "/", "") + "\n")
                bb.utils.unlockfile(smlock)
            try:
                os.link(sharedm, taskmanifest)
            except OSError as err:
                if err.errno == errno.EXDEV:
                    bb.utils.copyfile(sharedm, taskmanifest)
                else:
                    raise
            # Finally actually install the files
            for l in newmanifest:
                    dest = newmanifest[l]
                    if l.endswith("/"):
                        staging_copydir(l, targetdir, dest, seendirs)
                        continue
                    staging_copyfile(l, targetdir, dest, postinsts, seendirs)

    bb.note("Installed into sysroot: %s" % str(msg_adding))
    bb.note("Skipping as already exists in sysroot: %s" % str(msg_exists))

    for f in fixme:
        staging_processfixme(fixme[f], f, recipesysroot, recipesysrootnative, d)

    for p in postinsts:
        subprocess.check_output(p, shell=True, stderr=subprocess.STDOUT)

    for dep in manifests:
        c = setscenedeps[dep][0]
        os.symlink(manifests[dep], depdir + "/" + c + ".complete")

    with open(taskindex, "w") as f:
        for l in sorted(installed):
            f.write(l + "\n")

    bb.utils.unlockfile(lock)

extend_recipe_sysroot(d)

def staging_processfixme(fixme, target, recipesysroot, recipesysrootnative, d):
    import subprocess

    if not fixme:
        return
    cmd = "sed -e 's:^[^/]*/:%s/:g' %s | xargs sed -i -e 's:FIXMESTAGINGDIRTARGET:%s:g; s:FIXMESTAGINGDIRHOST:%s:g'" % (target, " ".join(fixme), recipesysroot, recipesysrootnative)
    for fixmevar in ['PSEUDO_SYSROOT', 'HOSTTOOLS_DIR', 'PKGDATA_DIR', 'PSEUDO_LOCALSTATEDIR', 'LOGFIFO']:
        fixme_path = d.getVar(fixmevar)
        cmd += " -e 's:FIXME_%s:%s:g'" % (fixmevar, fixme_path)
    bb.debug(2, cmd)
    subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)

def staging_copydir(c, target, dest, seendirs):
    if dest not in seendirs:
        bb.utils.mkdirhier(dest)
        seendirs.add(dest)

def staging_populate_sysroot_dir(targetsysroot, nativesysroot, native, d):
    import glob
    import subprocess
    import errno

    fixme = []
    postinsts = []
    seendirs = set()
    stagingdir = d.getVar("STAGING_DIR")
    if native:
        pkgarchs = ['${BUILD_ARCH}', '${BUILD_ARCH}_*']
        targetdir = nativesysroot
    else:
        pkgarchs = ['${MACHINE_ARCH}']
        pkgarchs = pkgarchs + list(reversed(d.getVar("PACKAGE_EXTRA_ARCHS").split()))
        pkgarchs.append('allarch')
        targetdir = targetsysroot

    bb.utils.mkdirhier(targetdir)
    for pkgarch in pkgarchs:
        for manifest in glob.glob(d.expand("${SSTATE_MANIFESTS}/manifest-%s-*.populate_sysroot" % pkgarch)):
            if manifest.endswith("-initial.populate_sysroot"):
                # skip glibc-initial and libgcc-initial due to file overlap
                continue
            if not native and (manifest.endswith("-native.populate_sysroot") or "nativesdk-" in manifest):
                continue
            if native and not (manifest.endswith("-native.populate_sysroot") or manifest.endswith("-cross.populate_sysroot") or "-cross-" in manifest):
                continue
            tmanifest = targetdir + "/" + os.path.basename(manifest)
            if os.path.exists(tmanifest):
                continue
            try:
                os.link(manifest, tmanifest)
            except OSError as err:
                if err.errno == errno.EXDEV:
                    bb.utils.copyfile(manifest, tmanifest)
                else:
                    raise
            with open(manifest, "r") as f:
                for l in f:
                    l = l.strip()
                    if l.endswith("/fixmepath"):
                        fixme.append(l)
                        continue
                    if l.endswith("/fixmepath.cmd"):
                        continue
                    dest = l.replace(stagingdir, "")
                    dest = targetdir + "/" + "/".join(dest.split("/")[3:])
                    if l.endswith("/"):
                        staging_copydir(l, targetdir, dest, seendirs)
                        continue
                    try:
                        staging_copyfile(l, targetdir, dest, postinsts, seendirs)
                    except FileExistsError:
                        continue

    staging_processfixme(fixme, targetdir, targetsysroot, nativesysroot, d)
    for p in postinsts:
        subprocess.check_output(p, shell=True, stderr=subprocess.STDOUT)

#
# Manifests here are complicated. The main sysroot area has the unpacked sstate
# which us unrelocated and tracked by the main sstate manifests. Each recipe
# specific sysroot has manifests for each dependency that is installed there.
# The task hash is used to tell whether the data needs to be reinstalled. We
# use a symlink to point to the currently installed hash. There is also a
# "complete" stamp file which is used to mark if installation completed. If
# something fails (e.g. a postinst), this won't get written and we would
# remove and reinstall the dependency. This also means partially installed
# dependencies should get cleaned up correctly.
#

def staging_copyfile(c, target, dest, postinsts, seendirs):
    import errno

    destdir = os.path.dirname(dest)
    if destdir not in seendirs:
        bb.utils.mkdirhier(destdir)
        seendirs.add(destdir)
    if "/usr/bin/postinst-" in c:
        postinsts.append(dest)
    if os.path.islink(c):
        linkto = os.readlink(c)
        if os.path.lexists(dest):
            if not os.path.islink(dest):
                raise OSError(errno.EEXIST, "Link %s already exists as a file" % dest, dest)
            if os.readlink(dest) == linkto:
                return dest
            raise OSError(errno.EEXIST, "Link %s already exists to a different location? (%s vs %s)" % (dest, os.readlink(dest), linkto), dest)
        os.symlink(linkto, dest)
        #bb.warn(c)
    else:
        try:
            os.link(c, dest)
        except OSError as err:
            if err.errno == errno.EXDEV:
                bb.utils.copyfile(c, dest)
            else:
                raise
    return dest

def sstate_clean_manifest(manifest, d, prefix=None):
    import oe.path

    mfile = open(manifest)
    entries = mfile.readlines()
    mfile.close()

    for entry in entries:
        entry = entry.strip()
        if prefix and not entry.startswith("/"):
            entry = prefix + "/" + entry
        bb.debug(2, "Removing manifest: %s" % entry)
        # We can race against another package populating directories as we're removing them
        # so we ignore errors here.
        try:
            if entry.endswith("/"):
                if os.path.islink(entry[:-1]):
                    os.remove(entry[:-1])
                elif os.path.exists(entry) and len(os.listdir(entry)) == 0:
                    os.rmdir(entry[:-1])
            else:
                os.remove(entry)
        except OSError:
            pass

    postrm = manifest + ".postrm"
    if os.path.exists(manifest + ".postrm"):
        import subprocess
        os.chmod(postrm, 0o755)
        subprocess.check_call(postrm, shell=True)
        oe.path.remove(postrm)

    oe.path.remove(manifest)

def setscene_depvalid(task, taskdependees, notneeded, d, log=None):
    # taskdependees is a dict of tasks which depend on task, each being a 3 item list of [PN, TASKNAME, FILENAME]
    # task is included in taskdependees too
    # Return - False - We need this dependency
    #        - True - We can skip this dependency
    import re

    def logit(msg, log):
        if log is not None:
            log.append(msg)
        else:
            bb.debug(2, msg)

    logit("Considering setscene task: %s" % (str(taskdependees[task])), log)

    def isNativeCross(x):
        return x.endswith("-native") or "-cross-" in x or "-crosssdk" in x or x.endswith("-cross")

    # We only need to trigger populate_lic through direct dependencies
    if taskdependees[task][1] == "do_populate_lic":
        return True

    # stash_locale and gcc_stash_builddir are never needed as a dependency for built objects
    if taskdependees[task][1] == "do_stash_locale" or taskdependees[task][1] == "do_gcc_stash_builddir":
        return True

    # We only need to trigger packagedata through direct dependencies
    # but need to preserve packagedata on packagedata links
    if taskdependees[task][1] == "do_packagedata":
        for dep in taskdependees:
            if taskdependees[dep][1] == "do_packagedata":
                return False
        return True

    for dep in taskdependees:
        logit("  considering dependency: %s" % (str(taskdependees[dep])), log)
        if task == dep:
            continue
        if dep in notneeded:
            continue
        # do_package_write_* and do_package doesn't need do_package
        if taskdependees[task][1] == "do_package" and taskdependees[dep][1] in ['do_package', 'do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm', 'do_packagedata', 'do_package_qa']:
            continue
        # do_package_write_* need do_populate_sysroot as they're mainly postinstall dependencies
        if taskdependees[task][1] == "do_populate_sysroot" and taskdependees[dep][1] in ['do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm']:
            return False
        # do_package/packagedata/package_qa don't need do_populate_sysroot
        if taskdependees[task][1] == "do_populate_sysroot" and taskdependees[dep][1] in ['do_package', 'do_packagedata', 'do_package_qa']:
            continue
        # Native/Cross packages don't exist and are noexec anyway
        if isNativeCross(taskdependees[dep][0]) and taskdependees[dep][1] in ['do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm', 'do_packagedata', 'do_package', 'do_package_qa']:
            continue

        # This is due to the [depends] in useradd.bbclass complicating matters
        # The logic *is* reversed here due to the way hard setscene dependencies are injected
        if (taskdependees[task][1] == 'do_package' or taskdependees[task][1] == 'do_populate_sysroot') and taskdependees[dep][0].endswith(('shadow-native', 'shadow-sysroot', 'base-passwd', 'pseudo-native')) and taskdependees[dep][1] == 'do_populate_sysroot':
            continue

        # Consider sysroot depending on sysroot tasks
        if taskdependees[task][1] == 'do_populate_sysroot' and taskdependees[dep][1] == 'do_populate_sysroot':
            # Allow excluding certain recursive dependencies. If a recipe needs it should add a
            # specific dependency itself, rather than relying on one of its dependees to pull
            # them in.
            # See also http://lists.openembedded.org/pipermail/openembedded-core/2018-January/146324.html
            not_needed = False
            excludedeps = d.getVar('_SSTATE_EXCLUDEDEPS_SYSROOT')
            if excludedeps is None:
                # Cache the regular expressions for speed
                excludedeps = []
                for excl in (d.getVar('SSTATE_EXCLUDEDEPS_SYSROOT') or "").split():
                    excludedeps.append((re.compile(excl.split('->', 1)[0]), re.compile(excl.split('->', 1)[1])))
                d.setVar('_SSTATE_EXCLUDEDEPS_SYSROOT', excludedeps)
            for excl in excludedeps:
                if excl[0].match(taskdependees[dep][0]):
                    if excl[1].match(taskdependees[task][0]):
                        not_needed = True
                        break
            if not_needed:
                continue
            # For meta-extsdk-toolchain we want all sysroot dependencies
            if taskdependees[dep][0] == 'meta-extsdk-toolchain':
                return False
            # Native/Cross populate_sysroot need their dependencies
            if isNativeCross(taskdependees[task][0]) and isNativeCross(taskdependees[dep][0]):
                return False
            # Target populate_sysroot depended on by cross tools need to be installed
            if isNativeCross(taskdependees[dep][0]):
                return False
            # Native/cross tools depended upon by target sysroot are not needed
            # Add an exception for shadow-native as required by useradd.bbclass
            if isNativeCross(taskdependees[task][0]) and taskdependees[task][0] != 'shadow-native':
                continue
            # Target populate_sysroot need their dependencies
            return False

        if taskdependees[task][1] == 'do_shared_workdir':
            continue

        if taskdependees[dep][1] == "do_populate_lic":
            continue


        # Safe fallthrough default
        logit(" Default setscene dependency fall through due to dependency: %s" % (str(taskdependees[dep])), log)
        return False
    return True


------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=run.extend_recipe_sysroot.14518
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=run.extend_recipe_sysroot.14518
X-Attachment-Id: c90fdaaf-0d54-4eb0-9ff8-8c8cfa15bd0e
Content-ID: <c90fdaaf-0d54-4eb0-9ff8-8c8cfa15bd0e>

def extend_recipe_sysroot(d):
    import copy
    import subprocess
    import errno
    import collections
    import glob

    taskdepdata = d.getVar("BB_TASKDEPDATA", False)
    mytaskname = d.getVar("BB_RUNTASK")
    if mytaskname.endswith("_setscene"):
        mytaskname = mytaskname.replace("_setscene", "")
    workdir = d.getVar("WORKDIR")
    #bb.warn(str(taskdepdata))
    pn = d.getVar("PN")
    stagingdir = d.getVar("STAGING_DIR")
    sharedmanifests = d.getVar("COMPONENTS_DIR") + "/manifests"
    recipesysroot = d.getVar("RECIPE_SYSROOT")
    recipesysrootnative = d.getVar("RECIPE_SYSROOT_NATIVE")

    # Detect bitbake -b usage
    nodeps = d.getVar("BB_LIMITEDDEPS") or False
    if nodeps:
        lock = bb.utils.lockfile(recipesysroot + "/sysroot.lock")
        staging_populate_sysroot_dir(recipesysroot, recipesysrootnative, True, d)
        staging_populate_sysroot_dir(recipesysroot, recipesysrootnative, False, d)
        bb.utils.unlockfile(lock)
        return

    start = None
    configuredeps = []
    for dep in taskdepdata:
        data = taskdepdata[dep]
        if data[1] == mytaskname and data[0] == pn:
            start = dep
            break
    if start is None:
        bb.fatal("Couldn't find ourself in BB_TASKDEPDATA?")

    # We need to figure out which sysroot files we need to expose to this task.
    # This needs to match what would get restored from sstate, which is controlled
    # ultimately by calls from bitbake to setscene_depvalid().
    # That function expects a setscene dependency tree. We build a dependency tree
    # condensed to inter-sstate task dependencies, similar to that used by setscene
    # tasks. We can then call into setscene_depvalid() and decide
    # which dependencies we can "see" and should expose in the recipe specific sysroot.
    setscenedeps = copy.deepcopy(taskdepdata)

    start = set([start])

    sstatetasks = d.getVar("SSTATETASKS").split()
    # Add recipe specific tasks referenced by setscene_depvalid()
    sstatetasks.append("do_stash_locale")

    def print_dep_tree(deptree):
        data = ""
        for dep in deptree:
            deps = "    " + "\n    ".join(deptree[dep][3]) + "\n"
            data = data + "%s:\n  %s\n  %s\n%s  %s\n  %s\n" % (deptree[dep][0], deptree[dep][1], deptree[dep][2], deps, deptree[dep][4], deptree[dep][5])
        return data

    #bb.note("Full dep tree is:\n%s" % print_dep_tree(taskdepdata))

    #bb.note(" start2 is %s" % str(start))

    # If start is an sstate task (like do_package) we need to add in its direct dependencies
    # else the code below won't recurse into them.
    for dep in set(start):
        for dep2 in setscenedeps[dep][3]:
            start.add(dep2)
        start.remove(dep)

    #bb.note(" start3 is %s" % str(start))

    # Create collapsed do_populate_sysroot -> do_populate_sysroot tree
    for dep in taskdepdata:
        data = setscenedeps[dep]
        if data[1] not in sstatetasks:
            for dep2 in setscenedeps:
                data2 = setscenedeps[dep2]
                if dep in data2[3]:
                    data2[3].update(setscenedeps[dep][3])
                    data2[3].remove(dep)
            if dep in start:
                start.update(setscenedeps[dep][3])
                start.remove(dep)
            del setscenedeps[dep]

    # Remove circular references
    for dep in setscenedeps:
        if dep in setscenedeps[dep][3]:
            setscenedeps[dep][3].remove(dep)

    #bb.note("Computed dep tree is:\n%s" % print_dep_tree(setscenedeps))
    #bb.note(" start is %s" % str(start))

    # Direct dependencies should be present and can be depended upon
    for dep in set(start):
        if setscenedeps[dep][1] == "do_populate_sysroot":
            if dep not in configuredeps:
                configuredeps.append(dep)
    bb.note("Direct dependencies are %s" % str(configuredeps))
    #bb.note(" or %s" % str(start))

    msgbuf = []
    # Call into setscene_depvalid for each sub-dependency and only copy sysroot files
    # for ones that would be restored from sstate.
    done = list(start)
    next = list(start)
    while next:
        new = []
        for dep in next:
            data = setscenedeps[dep]
            for datadep in data[3]:
                if datadep in done:
                    continue
                taskdeps = {}
                taskdeps[dep] = setscenedeps[dep][:2]
                taskdeps[datadep] = setscenedeps[datadep][:2]
                retval = setscene_depvalid(datadep, taskdeps, [], d, msgbuf)
                if retval:
                    msgbuf.append("Skipping setscene dependency %s for installation into the sysroot" % datadep)
                    continue
                done.append(datadep)
                new.append(datadep)
                if datadep not in configuredeps and setscenedeps[datadep][1] == "do_populate_sysroot":
                    configuredeps.append(datadep)
                    msgbuf.append("Adding dependency on %s" % setscenedeps[datadep][0])
                else:
                    msgbuf.append("Following dependency on %s" % setscenedeps[datadep][0])
        next = new

    # This logging is too verbose for day to day use sadly
    #bb.debug(2, "\n".join(msgbuf))

    depdir = recipesysrootnative + "/installeddeps"
    bb.utils.mkdirhier(depdir)
    bb.utils.mkdirhier(sharedmanifests)

    lock = bb.utils.lockfile(recipesysroot + "/sysroot.lock")

    fixme = {}
    seendirs = set()
    postinsts = []
    multilibs = {}
    manifests = {}
    # All files that we're going to be installing, to find conflicts.
    fileset = {}

    for f in os.listdir(depdir):
        if not f.endswith(".complete"):
            continue
        f = depdir + "/" + f
        if os.path.islink(f) and not os.path.exists(f):
            bb.note("%s no longer exists, removing from sysroot" % f)
            lnk = os.readlink(f.replace(".complete", ""))
            sstate_clean_manifest(depdir + "/" + lnk, d, workdir)
            os.unlink(f)
            os.unlink(f.replace(".complete", ""))

    installed = []
    for dep in configuredeps:
        c = setscenedeps[dep][0]
        if mytaskname in ["do_sdk_depends", "do_populate_sdk_ext"] and c.endswith("-initial"):
            bb.note("Skipping initial setscene dependency %s for installation into the sysroot" % c)
            continue
        installed.append(c)

    # We want to remove anything which this task previously installed but is no longer a dependency
    taskindex = depdir + "/" + "index." + mytaskname
    if os.path.exists(taskindex):
        potential = []
        with open(taskindex, "r") as f:
            for l in f:
                l = l.strip()
                if l not in installed:
                    fl = depdir + "/" + l
                    if not os.path.exists(fl):
                        # Was likely already uninstalled
                        continue
                    potential.append(l)
        # We need to ensure not other task needs this dependency. We hold the sysroot
        # lock so we ca search the indexes to check
        if potential:
            for i in glob.glob(depdir + "/index.*"):
                if i.endswith("." + mytaskname):
                    continue
                with open(i, "r") as f:
                    for l in f:
                        l = l.strip()
                        if l in potential:
                            potential.remove(l)
        for l in potential:
            fl = depdir + "/" + l
            bb.note("Task %s no longer depends on %s, removing from sysroot" % (mytaskname, l))
            lnk = os.readlink(fl)
            sstate_clean_manifest(depdir + "/" + lnk, d, workdir)
            os.unlink(fl)
            os.unlink(fl + ".complete")

    msg_exists = []
    msg_adding = []

    for dep in configuredeps:
        c = setscenedeps[dep][0]
        if c not in installed:
            continue
        taskhash = setscenedeps[dep][5]
        taskmanifest = depdir + "/" + c + "." + taskhash

        if os.path.exists(depdir + "/" + c):
            lnk = os.readlink(depdir + "/" + c)
            if lnk == c + "." + taskhash and os.path.exists(depdir + "/" + c + ".complete"):
                msg_exists.append(c)
                continue
            else:
                bb.note("%s exists in sysroot, but is stale (%s vs. %s), removing." % (c, lnk, c + "." + taskhash))
                sstate_clean_manifest(depdir + "/" + lnk, d, workdir)
                os.unlink(depdir + "/" + c)
                if os.path.lexists(depdir + "/" + c + ".complete"):
                    os.unlink(depdir + "/" + c + ".complete")
        elif os.path.lexists(depdir + "/" + c):
            os.unlink(depdir + "/" + c)

        msg_adding.append(c)

        os.symlink(c + "." + taskhash, depdir + "/" + c)

        manifest, d2 = oe.sstatesig.find_sstate_manifest(c, setscenedeps[dep][2], "populate_sysroot", d, multilibs)
        if d2 is not d:
            # If we don't do this, the recipe sysroot will be placed in the wrong WORKDIR for multilibs
            # We need a consistent WORKDIR for the image
            d2.setVar("WORKDIR", d.getVar("WORKDIR"))
        destsysroot = d2.getVar("RECIPE_SYSROOT")
        # We put allarch recipes into the default sysroot
        if manifest and "allarch" in manifest:
            destsysroot = d.getVar("RECIPE_SYSROOT")

        native = False
        if c.endswith("-native") or "-cross-" in c or "-crosssdk" in c:
            native = True

        if manifest:
            newmanifest = collections.OrderedDict()
            targetdir = destsysroot
            if native:
                targetdir = recipesysrootnative
            if targetdir not in fixme:
                fixme[targetdir] = []
            fm = fixme[targetdir]

            with open(manifest, "r") as f:
                manifests[dep] = manifest
                for l in f:
                    l = l.strip()
                    if l.endswith("/fixmepath"):
                        fm.append(l)
                        continue
                    if l.endswith("/fixmepath.cmd"):
                        continue
                    dest = l.replace(stagingdir, "")
                    dest = "/" + "/".join(dest.split("/")[3:])
                    newmanifest[l] = targetdir + dest

                    # Check if files have already been installed by another
                    # recipe and abort if they have, explaining what recipes are
                    # conflicting.
                    hashname = targetdir + dest
                    if not hashname.endswith("/"):
                        if hashname in fileset:
                            bb.fatal("The file %s is installed by both %s and %s, aborting" % (dest, c, fileset[hashname]))
                        else:
                            fileset[hashname] = c

            # Having multiple identical manifests in each sysroot eats diskspace so
            # create a shared pool of them and hardlink if we can.
            # We create the manifest in advance so that if something fails during installation,
            # or the build is interrupted, subsequent exeuction can cleanup.
            sharedm = sharedmanifests + "/" + os.path.basename(taskmanifest)
            if not os.path.exists(sharedm):
                smlock = bb.utils.lockfile(sharedm + ".lock")
                # Can race here. You'd think it just means we may not end up with all copies hardlinked to each other
                # but python can lose file handles so we need to do this under a lock.
                if not os.path.exists(sharedm):
                    with open(sharedm, 'w') as m:
                       for l in newmanifest:
                           dest = newmanifest[l]
                           m.write(dest.replace(workdir + "/", "") + "\n")
                bb.utils.unlockfile(smlock)
            try:
                os.link(sharedm, taskmanifest)
            except OSError as err:
                if err.errno == errno.EXDEV:
                    bb.utils.copyfile(sharedm, taskmanifest)
                else:
                    raise
            # Finally actually install the files
            for l in newmanifest:
                    dest = newmanifest[l]
                    if l.endswith("/"):
                        staging_copydir(l, targetdir, dest, seendirs)
                        continue
                    staging_copyfile(l, targetdir, dest, postinsts, seendirs)

    bb.note("Installed into sysroot: %s" % str(msg_adding))
    bb.note("Skipping as already exists in sysroot: %s" % str(msg_exists))

    for f in fixme:
        staging_processfixme(fixme[f], f, recipesysroot, recipesysrootnative, d)

    for p in postinsts:
        subprocess.check_output(p, shell=True, stderr=subprocess.STDOUT)

    for dep in manifests:
        c = setscenedeps[dep][0]
        os.symlink(manifests[dep], depdir + "/" + c + ".complete")

    with open(taskindex, "w") as f:
        for l in sorted(installed):
            f.write(l + "\n")

    bb.utils.unlockfile(lock)

extend_recipe_sysroot(d)

def staging_processfixme(fixme, target, recipesysroot, recipesysrootnative, d):
    import subprocess

    if not fixme:
        return
    cmd = "sed -e 's:^[^/]*/:%s/:g' %s | xargs sed -i -e 's:FIXMESTAGINGDIRTARGET:%s:g; s:FIXMESTAGINGDIRHOST:%s:g'" % (target, " ".join(fixme), recipesysroot, recipesysrootnative)
    for fixmevar in ['PSEUDO_SYSROOT', 'HOSTTOOLS_DIR', 'PKGDATA_DIR', 'PSEUDO_LOCALSTATEDIR', 'LOGFIFO']:
        fixme_path = d.getVar(fixmevar)
        cmd += " -e 's:FIXME_%s:%s:g'" % (fixmevar, fixme_path)
    bb.debug(2, cmd)
    subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)

def staging_copydir(c, target, dest, seendirs):
    if dest not in seendirs:
        bb.utils.mkdirhier(dest)
        seendirs.add(dest)

def staging_populate_sysroot_dir(targetsysroot, nativesysroot, native, d):
    import glob
    import subprocess
    import errno

    fixme = []
    postinsts = []
    seendirs = set()
    stagingdir = d.getVar("STAGING_DIR")
    if native:
        pkgarchs = ['${BUILD_ARCH}', '${BUILD_ARCH}_*']
        targetdir = nativesysroot
    else:
        pkgarchs = ['${MACHINE_ARCH}']
        pkgarchs = pkgarchs + list(reversed(d.getVar("PACKAGE_EXTRA_ARCHS").split()))
        pkgarchs.append('allarch')
        targetdir = targetsysroot

    bb.utils.mkdirhier(targetdir)
    for pkgarch in pkgarchs:
        for manifest in glob.glob(d.expand("${SSTATE_MANIFESTS}/manifest-%s-*.populate_sysroot" % pkgarch)):
            if manifest.endswith("-initial.populate_sysroot"):
                # skip glibc-initial and libgcc-initial due to file overlap
                continue
            if not native and (manifest.endswith("-native.populate_sysroot") or "nativesdk-" in manifest):
                continue
            if native and not (manifest.endswith("-native.populate_sysroot") or manifest.endswith("-cross.populate_sysroot") or "-cross-" in manifest):
                continue
            tmanifest = targetdir + "/" + os.path.basename(manifest)
            if os.path.exists(tmanifest):
                continue
            try:
                os.link(manifest, tmanifest)
            except OSError as err:
                if err.errno == errno.EXDEV:
                    bb.utils.copyfile(manifest, tmanifest)
                else:
                    raise
            with open(manifest, "r") as f:
                for l in f:
                    l = l.strip()
                    if l.endswith("/fixmepath"):
                        fixme.append(l)
                        continue
                    if l.endswith("/fixmepath.cmd"):
                        continue
                    dest = l.replace(stagingdir, "")
                    dest = targetdir + "/" + "/".join(dest.split("/")[3:])
                    if l.endswith("/"):
                        staging_copydir(l, targetdir, dest, seendirs)
                        continue
                    try:
                        staging_copyfile(l, targetdir, dest, postinsts, seendirs)
                    except FileExistsError:
                        continue

    staging_processfixme(fixme, targetdir, targetsysroot, nativesysroot, d)
    for p in postinsts:
        subprocess.check_output(p, shell=True, stderr=subprocess.STDOUT)

#
# Manifests here are complicated. The main sysroot area has the unpacked sstate
# which us unrelocated and tracked by the main sstate manifests. Each recipe
# specific sysroot has manifests for each dependency that is installed there.
# The task hash is used to tell whether the data needs to be reinstalled. We
# use a symlink to point to the currently installed hash. There is also a
# "complete" stamp file which is used to mark if installation completed. If
# something fails (e.g. a postinst), this won't get written and we would
# remove and reinstall the dependency. This also means partially installed
# dependencies should get cleaned up correctly.
#

def staging_copyfile(c, target, dest, postinsts, seendirs):
    import errno

    destdir = os.path.dirname(dest)
    if destdir not in seendirs:
        bb.utils.mkdirhier(destdir)
        seendirs.add(destdir)
    if "/usr/bin/postinst-" in c:
        postinsts.append(dest)
    if os.path.islink(c):
        linkto = os.readlink(c)
        if os.path.lexists(dest):
            if not os.path.islink(dest):
                raise OSError(errno.EEXIST, "Link %s already exists as a file" % dest, dest)
            if os.readlink(dest) == linkto:
                return dest
            raise OSError(errno.EEXIST, "Link %s already exists to a different location? (%s vs %s)" % (dest, os.readlink(dest), linkto), dest)
        os.symlink(linkto, dest)
        #bb.warn(c)
    else:
        try:
            os.link(c, dest)
        except OSError as err:
            if err.errno == errno.EXDEV:
                bb.utils.copyfile(c, dest)
            else:
                raise
    return dest

def sstate_clean_manifest(manifest, d, prefix=None):
    import oe.path

    mfile = open(manifest)
    entries = mfile.readlines()
    mfile.close()

    for entry in entries:
        entry = entry.strip()
        if prefix and not entry.startswith("/"):
            entry = prefix + "/" + entry
        bb.debug(2, "Removing manifest: %s" % entry)
        # We can race against another package populating directories as we're removing them
        # so we ignore errors here.
        try:
            if entry.endswith("/"):
                if os.path.islink(entry[:-1]):
                    os.remove(entry[:-1])
                elif os.path.exists(entry) and len(os.listdir(entry)) == 0:
                    os.rmdir(entry[:-1])
            else:
                os.remove(entry)
        except OSError:
            pass

    postrm = manifest + ".postrm"
    if os.path.exists(manifest + ".postrm"):
        import subprocess
        os.chmod(postrm, 0o755)
        subprocess.check_call(postrm, shell=True)
        oe.path.remove(postrm)

    oe.path.remove(manifest)

def setscene_depvalid(task, taskdependees, notneeded, d, log=None):
    # taskdependees is a dict of tasks which depend on task, each being a 3 item list of [PN, TASKNAME, FILENAME]
    # task is included in taskdependees too
    # Return - False - We need this dependency
    #        - True - We can skip this dependency
    import re

    def logit(msg, log):
        if log is not None:
            log.append(msg)
        else:
            bb.debug(2, msg)

    logit("Considering setscene task: %s" % (str(taskdependees[task])), log)

    def isNativeCross(x):
        return x.endswith("-native") or "-cross-" in x or "-crosssdk" in x or x.endswith("-cross")

    # We only need to trigger populate_lic through direct dependencies
    if taskdependees[task][1] == "do_populate_lic":
        return True

    # stash_locale and gcc_stash_builddir are never needed as a dependency for built objects
    if taskdependees[task][1] == "do_stash_locale" or taskdependees[task][1] == "do_gcc_stash_builddir":
        return True

    # We only need to trigger packagedata through direct dependencies
    # but need to preserve packagedata on packagedata links
    if taskdependees[task][1] == "do_packagedata":
        for dep in taskdependees:
            if taskdependees[dep][1] == "do_packagedata":
                return False
        return True

    for dep in taskdependees:
        logit("  considering dependency: %s" % (str(taskdependees[dep])), log)
        if task == dep:
            continue
        if dep in notneeded:
            continue
        # do_package_write_* and do_package doesn't need do_package
        if taskdependees[task][1] == "do_package" and taskdependees[dep][1] in ['do_package', 'do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm', 'do_packagedata', 'do_package_qa']:
            continue
        # do_package_write_* need do_populate_sysroot as they're mainly postinstall dependencies
        if taskdependees[task][1] == "do_populate_sysroot" and taskdependees[dep][1] in ['do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm']:
            return False
        # do_package/packagedata/package_qa don't need do_populate_sysroot
        if taskdependees[task][1] == "do_populate_sysroot" and taskdependees[dep][1] in ['do_package', 'do_packagedata', 'do_package_qa']:
            continue
        # Native/Cross packages don't exist and are noexec anyway
        if isNativeCross(taskdependees[dep][0]) and taskdependees[dep][1] in ['do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm', 'do_packagedata', 'do_package', 'do_package_qa']:
            continue

        # This is due to the [depends] in useradd.bbclass complicating matters
        # The logic *is* reversed here due to the way hard setscene dependencies are injected
        if (taskdependees[task][1] == 'do_package' or taskdependees[task][1] == 'do_populate_sysroot') and taskdependees[dep][0].endswith(('shadow-native', 'shadow-sysroot', 'base-passwd', 'pseudo-native')) and taskdependees[dep][1] == 'do_populate_sysroot':
            continue

        # Consider sysroot depending on sysroot tasks
        if taskdependees[task][1] == 'do_populate_sysroot' and taskdependees[dep][1] == 'do_populate_sysroot':
            # Allow excluding certain recursive dependencies. If a recipe needs it should add a
            # specific dependency itself, rather than relying on one of its dependees to pull
            # them in.
            # See also http://lists.openembedded.org/pipermail/openembedded-core/2018-January/146324.html
            not_needed = False
            excludedeps = d.getVar('_SSTATE_EXCLUDEDEPS_SYSROOT')
            if excludedeps is None:
                # Cache the regular expressions for speed
                excludedeps = []
                for excl in (d.getVar('SSTATE_EXCLUDEDEPS_SYSROOT') or "").split():
                    excludedeps.append((re.compile(excl.split('->', 1)[0]), re.compile(excl.split('->', 1)[1])))
                d.setVar('_SSTATE_EXCLUDEDEPS_SYSROOT', excludedeps)
            for excl in excludedeps:
                if excl[0].match(taskdependees[dep][0]):
                    if excl[1].match(taskdependees[task][0]):
                        not_needed = True
                        break
            if not_needed:
                continue
            # For meta-extsdk-toolchain we want all sysroot dependencies
            if taskdependees[dep][0] == 'meta-extsdk-toolchain':
                return False
            # Native/Cross populate_sysroot need their dependencies
            if isNativeCross(taskdependees[task][0]) and isNativeCross(taskdependees[dep][0]):
                return False
            # Target populate_sysroot depended on by cross tools need to be installed
            if isNativeCross(taskdependees[dep][0]):
                return False
            # Native/cross tools depended upon by target sysroot are not needed
            # Add an exception for shadow-native as required by useradd.bbclass
            if isNativeCross(taskdependees[task][0]) and taskdependees[task][0] != 'shadow-native':
                continue
            # Target populate_sysroot need their dependencies
            return False

        if taskdependees[task][1] == 'do_shared_workdir':
            continue

        if taskdependees[dep][1] == "do_populate_lic":
            continue


        # Safe fallthrough default
        logit(" Default setscene dependency fall through due to dependency: %s" % (str(taskdependees[dep])), log)
        return False
    return True


------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=run.patch_do_patch.14518
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=run.patch_do_patch.14518
X-Attachment-Id: ea1c77e8-5227-4728-82db-cbd7b281d5c8
Content-ID: <ea1c77e8-5227-4728-82db-cbd7b281d5c8>

def patch_do_patch(d):
    import oe.patch

    patchsetmap = {
        "patch": oe.patch.PatchTree,
        "quilt": oe.patch.QuiltTree,
        "git": oe.patch.GitApplyTree,
    }

    cls = patchsetmap[d.getVar('PATCHTOOL') or 'quilt']

    resolvermap = {
        "noop": oe.patch.NOOPResolver,
        "user": oe.patch.UserResolver,
    }

    rcls = resolvermap[d.getVar('PATCHRESOLVE') or 'user']

    classes = {}

    s = d.getVar('S')

    os.putenv('PATH', d.getVar('PATH'))

    # We must use one TMPDIR per process so that the "patch" processes
    # don't generate the same temp file name.

    import tempfile
    process_tmpdir = tempfile.mkdtemp()
    os.environ['TMPDIR'] = process_tmpdir

    for patch in src_patches(d):
        _, _, local, _, _, parm = bb.fetch.decodeurl(patch)

        if "patchdir" in parm:
            patchdir = parm["patchdir"]
            if not os.path.isabs(patchdir):
                patchdir = os.path.join(s, patchdir)
        else:
            patchdir = s

        if not patchdir in classes:
            patchset = cls(patchdir, d)
            resolver = rcls(patchset, oe_terminal)
            classes[patchdir] = (patchset, resolver)
            patchset.Clean()
        else:
            patchset, resolver = classes[patchdir]

        bb.note("Applying patch '%s' (%s)" % (parm['patchname'], oe.path.format_display(local, d)))
        try:
            patchset.Import({"file":local, "strippath": parm['striplevel']}, True)
        except Exception as exc:
            bb.utils.remove(process_tmpdir, True)
            bb.fatal(str(exc))
        try:
            resolver.Resolve()
        except bb.BBHandledException as e:
            bb.utils.remove(process_tmpdir, True)
            bb.fatal(str(e))

    bb.utils.remove(process_tmpdir, True)
    del os.environ['TMPDIR']

patch_do_patch(d)

def src_patches(d, all=False, expand=True):
    import oe.patch
    return oe.patch.src_patches(d, all, expand)


------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; 
	name=run.populate_lic_qa_checksum.14593
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=run.populate_lic_qa_checksum.14593
X-Attachment-Id: f4ba4c31-acd7-4446-b74e-cc2d0776dd8a
Content-ID: <f4ba4c31-acd7-4446-b74e-cc2d0776dd8a>

def populate_lic_qa_checksum(d):
    """
    Check for changes in the license files.
    """
    sane = True

    lic_files = d.getVar('LIC_FILES_CHKSUM') or ''
    lic = d.getVar('LICENSE')
    pn = d.getVar('PN')

    if lic == "CLOSED":
        return

    if not lic_files and d.getVar('SRC_URI'):
        sane &= package_qa_handle_error("license-checksum", pn + ": Recipe file fetches files and does not have license file information (LIC_FILES_CHKSUM)", d)

    srcdir = d.getVar('S')
    corebase_licensefile = d.getVar('COREBASE') + "/LICENSE"
    for url in lic_files.split():
        try:
            (type, host, path, user, pswd, parm) = bb.fetch.decodeurl(url)
        except bb.fetch.MalformedUrl:
            sane &= package_qa_handle_error("license-checksum", pn + ": LIC_FILES_CHKSUM contains an invalid URL: " + url, d)
            continue
        srclicfile = os.path.join(srcdir, path)
        if not os.path.isfile(srclicfile):
            sane &= package_qa_handle_error("license-checksum", pn + ": LIC_FILES_CHKSUM points to an invalid file: " + srclicfile, d)
            continue

        if (srclicfile == corebase_licensefile):
            bb.warn("${COREBASE}/LICENSE is not a valid license file, please use '${COMMON_LICENSE_DIR}/MIT' for a MIT License file in LIC_FILES_CHKSUM. This will become an error in the future")

        recipemd5 = parm.get('md5', '')
        beginline, endline = 0, 0
        if 'beginline' in parm:
            beginline = int(parm['beginline'])
        if 'endline' in parm:
            endline = int(parm['endline'])

        if (not beginline) and (not endline):
            md5chksum = bb.utils.md5_file(srclicfile)
            with open(srclicfile, 'r', errors='replace') as f:
                license = f.read().splitlines()
        else:
            with open(srclicfile, 'rb') as f:
                import hashlib
                lineno = 0
                license = []
                m = hashlib.md5()
                for line in f:
                    lineno += 1
                    if (lineno >= beginline):
                        if ((lineno <= endline) or not endline):
                            m.update(line)
                            license.append(line.decode('utf-8', errors='replace').rstrip())
                        else:
                            break
                md5chksum = m.hexdigest()
        if recipemd5 == md5chksum:
            bb.note (pn + ": md5 checksum matched for ", url)
        else:
            if recipemd5:
                msg = pn + ": The LIC_FILES_CHKSUM does not match for " + url
                msg = msg + "\n" + pn + ": The new md5 checksum is " + md5chksum
                max_lines = int(d.getVar('QA_MAX_LICENSE_LINES') or 20)
                if not license or license[-1] != '':
                    # Ensure that our license text ends with a line break
                    # (will be added with join() below).
                    license.append('')
                remove = len(license) - max_lines
                if remove > 0:
                    start = max_lines // 2
                    end = start + remove - 1
                    del license[start:end]
                    license.insert(start, '...')
                msg = msg + "\n" + pn + ": Here is the selected license text:" + \
                        "\n" + \
                        "{:v^70}".format(" beginline=%d " % beginline if beginline else "") + \
                        "\n" + "\n".join(license) + \
                        "{:^^70}".format(" endline=%d " % endline if endline else "")
                if beginline:
                    if endline:
                        srcfiledesc = "%s (lines %d through to %d)" % (srclicfile, beginline, endline)
                    else:
                        srcfiledesc = "%s (beginning on line %d)" % (srclicfile, beginline)
                elif endline:
                    srcfiledesc = "%s (ending on line %d)" % (srclicfile, endline)
                else:
                    srcfiledesc = srclicfile
                msg = msg + "\n" + pn + ": Check if the license information has changed in %s to verify that the LICENSE value \"%s\" remains valid" % (srcfiledesc, lic)

            else:
                msg = pn + ": LIC_FILES_CHKSUM is not specified for " +  url
                msg = msg + "\n" + pn + ": The md5 checksum is " + md5chksum
            sane &= package_qa_handle_error("license-checksum", msg, d)

    if not sane:
        bb.fatal("Fatal QA errors found, failing task.")

populate_lic_qa_checksum(d)

def package_qa_handle_error(error_class, error_msg, d):
    if error_class in (d.getVar("ERROR_QA") or "").split():
        package_qa_write_error(error_class, error_msg, d)
        bb.error("QA Issue: %s [%s]" % (error_msg, error_class))
        d.setVar("QA_SANE", False)
        return False
    elif error_class in (d.getVar("WARN_QA") or "").split():
        package_qa_write_error(error_class, error_msg, d)
        bb.warn("QA Issue: %s [%s]" % (error_msg, error_class))
    else:
        bb.note("QA Issue: %s [%s]" % (error_msg, error_class))
    return True

def package_qa_write_error(type, error, d):
    logfile = d.getVar('QA_LOGFILE')
    if logfile:
        p = d.getVar('P')
        with open(logfile, "a+") as f:
            f.write("%s: %s [%s]\n" % (p, error, type))


------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=run.sstate_create_package.14593
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=run.sstate_create_package.14593
X-Attachment-Id: 3afa01ca-ddf3-4e8b-b19f-d5adb18a476d
Content-ID: <3afa01ca-ddf3-4e8b-b19f-d5adb18a476d>

IyEvYmluL3NoCgojIEVtaXQgYSB1c2VmdWwgZGlhZ25vc3RpYyBpZiBzb21ldGhpbmcgZmFpbHM6
CmJiX2V4aXRfaGFuZGxlcigpIHsKICAgIHJldD0kPwogICAgY2FzZSAkcmV0IGluCiAgICAwKSAg
OzsKICAgICopICBjYXNlICRCQVNIX1ZFUlNJT04gaW4KICAgICAgICAiIikgZWNobyAiV0FSTklO
RzogZXhpdCBjb2RlICRyZXQgZnJvbSBhIHNoZWxsIGNvbW1hbmQuIjs7CiAgICAgICAgKikgIGVj
aG8gIldBUk5JTkc6ICR7QkFTSF9TT1VSQ0VbMF19OiR7QkFTSF9MSU5FTk9bMF19IGV4aXQgJHJl
dCBmcm9tICckQkFTSF9DT01NQU5EJyI7OwogICAgICAgIGVzYWMKICAgICAgICBleGl0ICRyZXQK
ICAgIGVzYWMKfQp0cmFwICdiYl9leGl0X2hhbmRsZXInIDAKc2V0IC1lCmV4cG9ydCBBUj0iYXJt
LW9lLWxpbnV4LWdudWVhYmktZ2NjLWFyIgpleHBvcnQgQVJDSD0iYXJtIgpleHBvcnQgQVM9ImFy
bS1vZS1saW51eC1nbnVlYWJpLWFzICIKZXhwb3J0IEJVSUxEX0FSPSJhciIKZXhwb3J0IEJVSUxE
X0FTPSJhcyAiCmV4cG9ydCBCVUlMRF9DQz0iZ2NjICIKZXhwb3J0IEJVSUxEX0NDTEQ9ImdjYyAi
CmV4cG9ydCBCVUlMRF9DRkxBR1M9Ii1pc3lzdGVtL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9y
YW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1s
aW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3Iv
aW5jbHVkZSAtTzIgLXBpcGUiCmV4cG9ydCBCVUlMRF9DUFA9ImdjYyAgLUUiCmV4cG9ydCBCVUlM
RF9DUFBGTEFHUz0iLWlzeXN0ZW0vaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9pbmNsdWRlIgpl
eHBvcnQgQlVJTERfQ1hYPSJnKysgIgpleHBvcnQgQlVJTERfQ1hYRkxBR1M9Ii1pc3lzdGVtL2hv
bWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMv
d29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3Jl
Y2lwZS1zeXNyb290LW5hdGl2ZS91c3IvaW5jbHVkZSAtTzIgLXBpcGUiCmV4cG9ydCBCVUlMRF9G
Qz0iZ2ZvcnRyYW4gIgpleHBvcnQgQlVJTERfTEQ9ImxkICIKZXhwb3J0IEJVSUxEX0xERkxBR1M9
Ii1ML2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvbGliICAgICAgICAgICAgICAgICAgICAgICAg
IC1ML2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS9saWIgICAgICAgICAgICAgICAgICAgICAgICAgLVds
LC0tZW5hYmxlLW5ldy1kdGFncyAgICAgICAgICAgICAgICAgICAgICAgICAtV2wsLXJwYXRoLWxp
bmssL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvbGliICAgICAgICAgICAgICAgICAgICAgICAg
IC1XbCwtcnBhdGgtbGluaywvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkv
amFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL2xpYiAgICAgICAgICAgICAg
ICAgICAgICAgICAtV2wsLXJwYXRoLC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95
b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251
ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2xpYiAgICAg
ICAgICAgICAgICAgICAgICAgICAtV2wsLXJwYXRoLC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2Ut
bGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvbGli
ICAgICAgICAgICAgICAgICAgICAgICAgIC1XbCwtTzEiCmV4cG9ydCBCVUlMRF9OTT0ibm0iCmV4
cG9ydCBCVUlMRF9SQU5MSUI9InJhbmxpYiIKZXhwb3J0IEJVSUxEX1NUUklQPSJzdHJpcCIKZXhw
b3J0IENDPSJhcm0tb2UtbGludXgtZ251ZWFiaS1nY2MgIC1tZnB1PW5lb24tdmZwdjQgLW1mbG9h
dC1hYmk9aGFyZCAtbWNwdT1jb3J0ZXgtYTcgLS1zeXNyb290PS9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3pl
cm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdCIKZXhw
b3J0IENDTEQ9ImFybS1vZS1saW51eC1nbnVlYWJpLWdjYyAgLW1mcHU9bmVvbi12ZnB2NCAtbWZs
b2F0LWFiaT1oYXJkIC1tY3B1PWNvcnRleC1hNyAtLXN5c3Jvb3Q9L2hvbWUvY2V2YXQvRGVza3Rv
cC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlf
emVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290Igpl
eHBvcnQgQ0ZMQUdTPSIgLU8yIC1waXBlIC1nIC1mZWxpbWluYXRlLXVudXNlZC1kZWJ1Zy10eXBl
cyAtZm1hY3JvLXByZWZpeC1tYXA9L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lv
Y3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVl
YWJpL2phaWxob3VzZS8wLjExLXIwPS91c3Ivc3JjL2RlYnVnL2phaWxob3VzZS8wLjExLXIwICAg
ICAgICAgICAgICAgICAgICAgIC1mZGVidWctcHJlZml4LW1hcD0vaG9tZS9jZXZhdC9EZXNrdG9w
L21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96
ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjA9L3Vzci9zcmMvZGVidWcvamFp
bGhvdXNlLzAuMTEtcjAgICAgICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9o
b21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJj
L3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9y
ZWNpcGUtc3lzcm9vdD0gICAgICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9o
b21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJj
L3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9y
ZWNpcGUtc3lzcm9vdC1uYXRpdmU9ICIKZXhwb3J0IENQUD0iYXJtLW9lLWxpbnV4LWdudWVhYmkt
Z2NjIC1FIC0tc3lzcm9vdD0vaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8v
YnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkv
amFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QgIC1tZnB1PW5lb24tdmZwdjQgLW1mbG9h
dC1hYmk9aGFyZCAtbWNwdT1jb3J0ZXgtYTciCmV4cG9ydCBDUFBGTEFHUz0iIgpleHBvcnQgQ1JP
U1NfQ09NUElMRT0iYXJtLW9lLWxpbnV4LWdudWVhYmktIgpleHBvcnQgQ1hYPSJhcm0tb2UtbGlu
dXgtZ251ZWFiaS1nKysgIC1tZnB1PW5lb24tdmZwdjQgLW1mbG9hdC1hYmk9aGFyZCAtbWNwdT1j
b3J0ZXgtYTcgLS1zeXNyb290PS9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0
by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFi
aS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdCIKZXhwb3J0IENYWEZMQUdTPSIgLU8y
IC1waXBlIC1nIC1mZWxpbWluYXRlLXVudXNlZC1kZWJ1Zy10eXBlcyAtZm1hY3JvLXByZWZpeC1t
YXA9L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAt
Z2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjEx
LXIwPS91c3Ivc3JjL2RlYnVnL2phaWxob3VzZS8wLjExLXIwICAgICAgICAgICAgICAgICAgICAg
IC1mZGVidWctcHJlZml4LW1hcD0vaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9j
dG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVh
YmkvamFpbGhvdXNlLzAuMTEtcjA9L3Vzci9zcmMvZGVidWcvamFpbGhvdXNlLzAuMTEtcjAgICAg
ICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3pl
cm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdD0gICAg
ICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3pl
cm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRp
dmU9ICAtZnZpc2liaWxpdHktaW5saW5lcy1oaWRkZW4iCnVuc2V0IERJU1RSTwpleHBvcnQgRkM9
ImFybS1vZS1saW51eC1nbnVlYWJpLWdmb3J0cmFuICAtbWZwdT1uZW9uLXZmcHY0IC1tZmxvYXQt
YWJpPWhhcmQgLW1jcHU9Y29ydGV4LWE3IC0tc3lzcm9vdD0vaG9tZS9jZXZhdC9EZXNrdG9wL21l
dGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJv
LW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QiCmV4cG9y
dCBIT01FPSIvaG9tZS9jZXZhdCIKZXhwb3J0IEtCVUlMRF9PVVRQVVQ9Ii9ob21lL2NldmF0L0Rl
c2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmstc2hhcmVk
L29yYW5nZS1waS16ZXJvL2tlcm5lbC1idWlsZC1hcnRpZmFjdHMiCmV4cG9ydCBLRVJORUxfVkVS
U0lPTj0iNC4xOS42MyIKZXhwb3J0IExDX0FMTD0iZW5fVVMuVVRGLTgiCmV4cG9ydCBMRD0iYXJt
LW9lLWxpbnV4LWdudWVhYmktbGQgLS1zeXNyb290PS9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1v
cmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2Ut
bGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdCAiCmV4cG9ydCBM
REZMQUdTPSItV2wsLU8xIC1XbCwtLWhhc2gtc3R5bGU9Z251IC1XbCwtLWFzLW5lZWRlZCIKZXhw
b3J0IExPR05BTUU9ImNldmF0Igp1bnNldCBNQUNISU5FCmV4cG9ydCBNQUtFPSJtYWtlIgpleHBv
cnQgTk09ImFybS1vZS1saW51eC1nbnVlYWJpLW5tIgpleHBvcnQgT0JKQ09QWT0iYXJtLW9lLWxp
bnV4LWdudWVhYmktb2JqY29weSIKZXhwb3J0IE9CSkRVTVA9ImFybS1vZS1saW51eC1nbnVlYWJp
LW9iamR1bXAiCmV4cG9ydCBPUz0ibGludXgtZ251ZWFiaSIKZXhwb3J0IFBBVEg9Ii9ob21lL2Nl
dmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsv
b3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUt
c3lzcm9vdC1uYXRpdmUvdXNyL2Jpbi9weXRob24tbmF0aXZlOi9ob21lL2NldmF0L0Rlc2t0b3Av
bWV0YS1vcmFuZ2VwaS95b2N0by9wb2t5L3NjcmlwdHM6L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRh
LW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1v
ZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91
c3IvYmluL2FybS1vZS1saW51eC1nbnVlYWJpOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFu
Z2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGlu
dXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC91c3IvYmluL2Nyb3Nz
c2NyaXB0czovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJt
L3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNl
LzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9zYmluOi9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3Bp
X3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC1u
YXRpdmUvdXNyL2JpbjovaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVp
bGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFp
bGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3NiaW46L2hvbWUvY2V2YXQvRGVz
a3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2Vf
cGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290
LW5hdGl2ZS9iaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL3Bva3kv
Yml0YmFrZS9iaW46L2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxk
X2FybS90bXAtZ2xpYmMvaG9zdHRvb2xzIgpleHBvcnQgUEtHX0NPTkZJR19ESVI9Ii9ob21lL2Nl
dmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsv
b3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUt
c3lzcm9vdC91c3IvbGliL3BrZ2NvbmZpZyIKZXhwb3J0IFBLR19DT05GSUdfRElTQUJMRV9VTklO
U1RBTExFRD0ieWVzIgpleHBvcnQgUEtHX0NPTkZJR19MSUJESVI9Ii9ob21lL2NldmF0L0Rlc2t0
b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3Bp
X3plcm8tb2UtbGludXgtZ251ZWFiaS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC91
c3IvbGliL3BrZ2NvbmZpZyIKZXhwb3J0IFBLR19DT05GSUdfUEFUSD0iL2hvbWUvY2V2YXQvRGVz
a3RvcC9tZXRhLW9yYW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2Vf
cGlfemVyby1vZS1saW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290
L3Vzci9saWIvcGtnY29uZmlnOi9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0
by9idWlsZF9hcm0vdG1wLWdsaWJjL3dvcmsvb3JhbmdlX3BpX3plcm8tb2UtbGludXgtZ251ZWFi
aS9qYWlsaG91c2UvMC4xMS1yMC9yZWNpcGUtc3lzcm9vdC91c3Ivc2hhcmUvcGtnY29uZmlnIgpl
eHBvcnQgUEtHX0NPTkZJR19TWVNST09UX0RJUj0iL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9y
YW5nZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1s
aW51eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290IgpleHBvcnQgUEtH
X0NPTkZJR19TWVNURU1fSU5DTFVERV9QQVRIPSIvdXNyL2luY2x1ZGUiCmV4cG9ydCBQS0dfQ09O
RklHX1NZU1RFTV9MSUJSQVJZX1BBVEg9Ii9saWI6L3Vzci9saWIiCmV4cG9ydCBQU0VVRE9fRElT
QUJMRUQ9IjEiCmV4cG9ydCBQU0VVRE9fVU5MT0FEPSIxIgpleHBvcnQgUFlUSE9OPSIvaG9tZS9j
ZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3Jr
L29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBl
LXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vcHl0aG9uLW5hdGl2ZS9weXRob24iCmV4cG9ydCBQWVRI
T05OT1VTRVJTSVRFPSIxIgpleHBvcnQgUkFOTElCPSJhcm0tb2UtbGludXgtZ251ZWFiaS1nY2Mt
cmFubGliIgpleHBvcnQgUkVBREVMRj0iYXJtLW9lLWxpbnV4LWdudWVhYmktcmVhZGVsZiIKdW5z
ZXQgU0hFTEwKZXhwb3J0IFNUQUdJTkdfSU5DRElSPSIvaG9tZS9jZXZhdC9EZXNrdG9wL21ldGEt
b3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGliYy93b3JrL29yYW5nZV9waV96ZXJvLW9l
LWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAvcmVjaXBlLXN5c3Jvb3QvdXNyL2luY2x1
ZGUiCmV4cG9ydCBTVEFHSU5HX0xJQkRJUj0iL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5n
ZXBpL3lvY3RvL2J1aWxkX2FybS90bXAtZ2xpYmMvd29yay9vcmFuZ2VfcGlfemVyby1vZS1saW51
eC1nbnVlYWJpL2phaWxob3VzZS8wLjExLXIwL3JlY2lwZS1zeXNyb290L3Vzci9saWIiCmV4cG9y
dCBTVFJJTkdTPSJhcm0tb2UtbGludXgtZ251ZWFiaS1zdHJpbmdzIgpleHBvcnQgU1RSSVA9ImFy
bS1vZS1saW51eC1nbnVlYWJpLXN0cmlwIgp1bnNldCBUQVJHRVRfQVJDSApleHBvcnQgVEVSTT0i
eHRlcm0iCmV4cG9ydCBUWj0iVVRDIgpleHBvcnQgVUJPT1RfQVJDSD0iYXJtIgpleHBvcnQgVVNF
Uj0iY2V2YXQiCmV4cG9ydCBiYXNlX2JpbmRpcj0iL2JpbiIKZXhwb3J0IGJhc2VfbGliZGlyPSIv
bGliIgpleHBvcnQgYmFzZV9wcmVmaXg9IiIKZXhwb3J0IGJhc2Vfc2JpbmRpcj0iL3NiaW4iCmV4
cG9ydCBiaW5kaXI9Ii91c3IvYmluIgpleHBvcnQgZGF0YWRpcj0iL3Vzci9zaGFyZSIKZXhwb3J0
IGRvY2Rpcj0iL3Vzci9zaGFyZS9kb2MiCmV4cG9ydCBleGVjX3ByZWZpeD0iL3VzciIKZXhwb3J0
IGluY2x1ZGVkaXI9Ii91c3IvaW5jbHVkZSIKZXhwb3J0IGluZm9kaXI9Ii91c3Ivc2hhcmUvaW5m
byIKZXhwb3J0IGxpYmRpcj0iL3Vzci9saWIiCmV4cG9ydCBsaWJleGVjZGlyPSIvdXNyL2xpYmV4
ZWMiCmV4cG9ydCBsb2NhbHN0YXRlZGlyPSIvdmFyIgpleHBvcnQgbWFuZGlyPSIvdXNyL3NoYXJl
L21hbiIKZXhwb3J0IG5vbmFyY2hfYmFzZV9saWJkaXI9Ii9saWIiCmV4cG9ydCBub25hcmNoX2xp
YmRpcj0iL3Vzci9saWIiCmV4cG9ydCBvbGRpbmNsdWRlZGlyPSIvdXNyL2luY2x1ZGUiCmV4cG9y
dCBwcmVmaXg9Ii91c3IiCmV4cG9ydCBzYmluZGlyPSIvdXNyL3NiaW4iCmV4cG9ydCBzZXJ2aWNl
ZGlyPSIvc3J2IgpleHBvcnQgc2hhcmVkc3RhdGVkaXI9Ii9jb20iCmV4cG9ydCBzeXNjb25mZGly
PSIvZXRjIgpleHBvcnQgc3lzdGVtZF9zeXN0ZW1fdW5pdGRpcj0iL2xpYi9zeXN0ZW1kL3N5c3Rl
bSIKZXhwb3J0IHN5c3RlbWRfdW5pdGRpcj0iL2xpYi9zeXN0ZW1kIgpleHBvcnQgc3lzdGVtZF91
c2VyX3VuaXRkaXI9Ii91c3IvbGliL3N5c3RlbWQvdXNlciIKCnNzdGF0ZV9jcmVhdGVfcGFja2Fn
ZSgpIHsKCVRGSUxFPWBta3RlbXAgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lv
Y3RvL2J1aWxkX2FybS9zc3RhdGUtY2FjaGUvZGQvc3N0YXRlOmphaWxob3VzZTo6MC4xMTpyMDo6
MzpkZDIzZDkzNzI4NDk5ODFmNmRkNTZmNDk2ZmU2ZTE2ZGM0MDRkYjlmYzUxNjU1MmQxMTBmZTFi
NmM2ZDIzMmU4X3BvcHVsYXRlX2xpYy50Z3ouWFhYWFhYWFhgCgoJIyBFeGl0IGVhcmx1IGlmIGl0
IGFscmVhZHkgZXhpc3RzCglpZiBbIC1lIC9ob21lL2NldmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2Vw
aS95b2N0by9idWlsZF9hcm0vc3N0YXRlLWNhY2hlL2RkL3NzdGF0ZTpqYWlsaG91c2U6OjAuMTE6
cjA6OjM6ZGQyM2Q5MzcyODQ5OTgxZjZkZDU2ZjQ5NmZlNmUxNmRjNDA0ZGI5ZmM1MTY1NTJkMTEw
ZmUxYjZjNmQyMzJlOF9wb3B1bGF0ZV9saWMudGd6IF07IHRoZW4KCQlyZXR1cm4KCWZpCgogICAg
ICAgICMgVXNlIHBpZ3ogaWYgYXZhaWxhYmxlCiAgICAgICAgT1BUPSItY3pTIgogICAgICAgIGlm
IFsgLXggIiQoY29tbWFuZCAtdiBwaWd6KSIgXTsgdGhlbgogICAgICAgICAgICBPUFQ9Ii1JIHBp
Z3ogLWNTIgogICAgICAgIGZpCgoJIyBOZWVkIHRvIGhhbmRsZSBlbXB0eSBkaXJlY3RvcmllcwoJ
aWYgWyAiJChscyAtQSkiIF07IHRoZW4KCQlzZXQgK2UKCQl0YXIgJE9QVCAtZiAkVEZJTEUgKgoJ
CXJldD0kPwoJCWlmIFsgJHJldCAtbmUgMCBdICYmIFsgJHJldCAtbmUgMSBdOyB0aGVuCgkJCWV4
aXQgMQoJCWZpCgkJc2V0IC1lCgllbHNlCgkJdGFyICRPUFQgLS1maWxlPSRURklMRSAtLWZpbGVz
LWZyb209L2Rldi9udWxsCglmaQoJY2htb2QgMDY2NCAkVEZJTEUKCSMgU2tpcCBpZiBpdCB3YXMg
YWxyZWFkeSBjcmVhdGVkIGJ5IHNvbWUgb3RoZXIgcHJvY2VzcwoJaWYgWyAhIC1lIC9ob21lL2Nl
dmF0L0Rlc2t0b3AvbWV0YS1vcmFuZ2VwaS95b2N0by9idWlsZF9hcm0vc3N0YXRlLWNhY2hlL2Rk
L3NzdGF0ZTpqYWlsaG91c2U6OjAuMTE6cjA6OjM6ZGQyM2Q5MzcyODQ5OTgxZjZkZDU2ZjQ5NmZl
NmUxNmRjNDA0ZGI5ZmM1MTY1NTJkMTEwZmUxYjZjNmQyMzJlOF9wb3B1bGF0ZV9saWMudGd6IF07
IHRoZW4KCQltdiAtZiAkVEZJTEUgL2hvbWUvY2V2YXQvRGVza3RvcC9tZXRhLW9yYW5nZXBpL3lv
Y3RvL2J1aWxkX2FybS9zc3RhdGUtY2FjaGUvZGQvc3N0YXRlOmphaWxob3VzZTo6MC4xMTpyMDo6
MzpkZDIzZDkzNzI4NDk5ODFmNmRkNTZmNDk2ZmU2ZTE2ZGM0MDRkYjlmYzUxNjU1MmQxMTBmZTFi
NmM2ZDIzMmU4X3BvcHVsYXRlX2xpYy50Z3oKCWVsc2UKCQlybSAkVEZJTEUKCWZpCn0KCmNkICcv
aG9tZS9jZXZhdC9EZXNrdG9wL21ldGEtb3JhbmdlcGkveW9jdG8vYnVpbGRfYXJtL3RtcC1nbGli
Yy93b3JrL29yYW5nZV9waV96ZXJvLW9lLWxpbnV4LWdudWVhYmkvamFpbGhvdXNlLzAuMTEtcjAv
c3N0YXRlLWJ1aWxkLXBvcHVsYXRlX2xpYy8nCnNzdGF0ZV9jcmVhdGVfcGFja2FnZQoKIyBjbGVh
bnVwCnJldD0kPwp0cmFwICcnIDAKZXhpdCAkcmV0Cg==
------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=run.sstate_hardcode_path.14593
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=run.sstate_hardcode_path.14593
X-Attachment-Id: 33111bf4-ce70-4348-bcfe-1cb79663eedb
Content-ID: <33111bf4-ce70-4348-bcfe-1cb79663eedb>

def sstate_hardcode_path(d):
    import subprocess, platform

    # Need to remove hardcoded paths and fix these when we install the
    # staging packages.
    #
    # Note: the logic in this function needs to match the reverse logic
    # in sstate_installpkg(ss, d)

    staging_target = d.getVar('RECIPE_SYSROOT')
    staging_host = d.getVar('RECIPE_SYSROOT_NATIVE')
    sstate_builddir = d.getVar('SSTATE_BUILDDIR')

    sstate_sed_cmd = "sed -i -e 's:%s:FIXMESTAGINGDIRHOST:g'" % staging_host
    if bb.data.inherits_class('native', d) or bb.data.inherits_class('cross-canadian', d):
        sstate_grep_cmd = "grep -l -e '%s'" % (staging_host)
    elif bb.data.inherits_class('cross', d) or bb.data.inherits_class('crosssdk', d):
        sstate_grep_cmd = "grep -l -e '%s' -e '%s'" % (staging_target, staging_host)
        sstate_sed_cmd += " -e 's:%s:FIXMESTAGINGDIRTARGET:g'" % staging_target
    else:
        sstate_grep_cmd = "grep -l -e '%s' -e '%s'" % (staging_target, staging_host)
        sstate_sed_cmd += " -e 's:%s:FIXMESTAGINGDIRTARGET:g'" % staging_target

    extra_staging_fixmes = d.getVar('EXTRA_STAGING_FIXMES') or ''
    for fixmevar in extra_staging_fixmes.split():
        fixme_path = d.getVar(fixmevar)
        sstate_sed_cmd += " -e 's:%s:FIXME_%s:g'" % (fixme_path, fixmevar)
        sstate_grep_cmd += " -e '%s'" % (fixme_path)

    fixmefn =  sstate_builddir + "fixmepath"

    sstate_scan_cmd = d.getVar('SSTATE_SCAN_CMD')
    sstate_filelist_cmd = "tee %s" % (fixmefn)

    # fixmepath file needs relative paths, drop sstate_builddir prefix
    sstate_filelist_relative_cmd = "sed -i -e 's:^%s::g' %s" % (sstate_builddir, fixmefn)

    xargs_no_empty_run_cmd = '--no-run-if-empty'
    if platform.system() == 'Darwin':
        xargs_no_empty_run_cmd = ''

    # Limit the fixpaths and sed operations based on the initial grep search
    # This has the side effect of making sure the vfs cache is hot
    sstate_hardcode_cmd = "%s | xargs %s | %s | xargs %s %s" % (sstate_scan_cmd, sstate_grep_cmd, sstate_filelist_cmd, xargs_no_empty_run_cmd, sstate_sed_cmd)

    bb.note("Removing hardcoded paths from sstate package: '%s'" % (sstate_hardcode_cmd))
    subprocess.check_output(sstate_hardcode_cmd, shell=True, cwd=sstate_builddir)

        # If the fixmefn is empty, remove it..
    if os.stat(fixmefn).st_size == 0:
        os.remove(fixmefn)
    else:
        bb.note("Replacing absolute paths in fixmepath file: '%s'" % (sstate_filelist_relative_cmd))
        subprocess.check_output(sstate_filelist_relative_cmd, shell=True)

sstate_hardcode_path(d)


------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; 
	name=run.sstate_hardcode_path_unpack.14593
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; 
	filename=run.sstate_hardcode_path_unpack.14593
X-Attachment-Id: ad9ba130-4380-4928-910b-9aace12b5454
Content-ID: <ad9ba130-4380-4928-910b-9aace12b5454>

def sstate_hardcode_path_unpack(d):
    # Fixup hardcoded paths
    #
    # Note: The logic below must match the reverse logic in
    # sstate_hardcode_path(d)
    import subprocess

    sstateinst = d.getVar('SSTATE_INSTDIR')
    sstatefixmedir = d.getVar('SSTATE_FIXMEDIR')
    fixmefn = sstateinst + "fixmepath"
    if os.path.isfile(fixmefn):
        staging_target = d.getVar('RECIPE_SYSROOT')
        staging_host = d.getVar('RECIPE_SYSROOT_NATIVE')

        if bb.data.inherits_class('native', d) or bb.data.inherits_class('cross-canadian', d):
            sstate_sed_cmd = "sed -i -e 's:FIXMESTAGINGDIRHOST:%s:g'" % (staging_host)
        elif bb.data.inherits_class('cross', d) or bb.data.inherits_class('crosssdk', d):
            sstate_sed_cmd = "sed -i -e 's:FIXMESTAGINGDIRTARGET:%s:g; s:FIXMESTAGINGDIRHOST:%s:g'" % (staging_target, staging_host)
        else:
            sstate_sed_cmd = "sed -i -e 's:FIXMESTAGINGDIRTARGET:%s:g'" % (staging_target)

        extra_staging_fixmes = d.getVar('EXTRA_STAGING_FIXMES') or ''
        for fixmevar in extra_staging_fixmes.split():
            fixme_path = d.getVar(fixmevar)
            sstate_sed_cmd += " -e 's:FIXME_%s:%s:g'" % (fixmevar, fixme_path)

        # Add sstateinst to each filename in fixmepath, use xargs to efficiently call sed
        sstate_hardcode_cmd = "sed -e 's:^:%s:g' %s | xargs %s" % (sstateinst, fixmefn, sstate_sed_cmd)

        # Defer do_populate_sysroot relocation command
        if sstatefixmedir:
            bb.utils.mkdirhier(sstatefixmedir)
            with open(sstatefixmedir + "/fixmepath.cmd", "w") as f:
                sstate_hardcode_cmd = sstate_hardcode_cmd.replace(fixmefn, sstatefixmedir + "/fixmepath")
                sstate_hardcode_cmd = sstate_hardcode_cmd.replace(sstateinst, "FIXMEFINALSSTATEINST")
                sstate_hardcode_cmd = sstate_hardcode_cmd.replace(staging_host, "FIXMEFINALSSTATEHOST")
                sstate_hardcode_cmd = sstate_hardcode_cmd.replace(staging_target, "FIXMEFINALSSTATETARGET")
                f.write(sstate_hardcode_cmd)
            bb.utils.copyfile(fixmefn, sstatefixmedir + "/fixmepath")
            return

        bb.note("Replacing fixme paths in sstate package: %s" % (sstate_hardcode_cmd))
        subprocess.check_call(sstate_hardcode_cmd, shell=True)

        # Need to remove this or we'd copy it into the target directory and may
        # conflict with another writer
        os.remove(fixmefn)

sstate_hardcode_path_unpack(d)


------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=run.sstate_report_unihash.14593
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=run.sstate_report_unihash.14593
X-Attachment-Id: b7592d04-f145-44bb-9f3d-08e40fabebb4
Content-ID: <b7592d04-f145-44bb-9f3d-08e40fabebb4>

def sstate_report_unihash(d):
    report_unihash = getattr(bb.parse.siggen, 'report_unihash', None)

    if report_unihash:
        ss = sstate_state_fromvars(d)
        report_unihash(os.getcwd(), ss['task'], d)

sstate_report_unihash(d)

def sstate_state_fromvars(d, task = None):
    if task is None:
        task = d.getVar('BB_CURRENTTASK')
        if not task:
            bb.fatal("sstate code running without task context?!")
        task = task.replace("_setscene", "")

    if task.startswith("do_"):
        task = task[3:]
    inputs = (d.getVarFlag("do_" + task, 'sstate-inputdirs') or "").split()
    outputs = (d.getVarFlag("do_" + task, 'sstate-outputdirs') or "").split()
    plaindirs = (d.getVarFlag("do_" + task, 'sstate-plaindirs') or "").split()
    lockfiles = (d.getVarFlag("do_" + task, 'sstate-lockfile') or "").split()
    lockfilesshared = (d.getVarFlag("do_" + task, 'sstate-lockfile-shared') or "").split()
    interceptfuncs = (d.getVarFlag("do_" + task, 'sstate-interceptfuncs') or "").split()
    fixmedir = d.getVarFlag("do_" + task, 'sstate-fixmedir') or ""
    if not task or len(inputs) != len(outputs):
        bb.fatal("sstate variables not setup correctly?!")

    if task == "populate_lic":
        d.setVar("SSTATE_PKGSPEC", "${SSTATE_SWSPEC}")
        d.setVar("SSTATE_EXTRAPATH", "")
        d.setVar('SSTATE_EXTRAPATHWILDCARD', "")

    ss = sstate_init(task, d)
    for i in range(len(inputs)):
        sstate_add(ss, inputs[i], outputs[i], d)
    ss['lockfiles'] = lockfiles
    ss['lockfiles-shared'] = lockfilesshared
    ss['plaindirs'] = plaindirs
    ss['interceptfuncs'] = interceptfuncs
    ss['fixmedir'] = fixmedir
    return ss

def sstate_init(task, d):
    ss = {}
    ss['task'] = task
    ss['dirs'] = []
    ss['plaindirs'] = []
    ss['lockfiles'] = []
    ss['lockfiles-shared'] = []
    return ss

def sstate_add(ss, source, dest, d):
    if not source.endswith("/"):
         source = source + "/"
    if not dest.endswith("/"):
         dest = dest + "/"
    source = os.path.normpath(source)
    dest = os.path.normpath(dest)
    srcbase = os.path.basename(source)
    ss['dirs'].append([srcbase, source, dest])
    return ss


------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=run.sstate_task_postfunc.14593
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=run.sstate_task_postfunc.14593
X-Attachment-Id: 397750ae-3fdc-43e6-93b3-3381c5842f5d
Content-ID: <397750ae-3fdc-43e6-93b3-3381c5842f5d>

def sstate_task_postfunc(d):
    shared_state = sstate_state_fromvars(d)

    for intercept in shared_state['interceptfuncs']:
        bb.build.exec_func(intercept, d, (d.getVar("WORKDIR"),))

    omask = os.umask(0o002)
    if omask != 0o002:
       bb.note("Using umask 0o002 (not %0o) for sstate packaging" % omask)
    sstate_package(shared_state, d)
    os.umask(omask)

    sstateinst = d.getVar("SSTATE_INSTDIR")
    d.setVar('SSTATE_FIXMEDIR', shared_state['fixmedir'])

    sstate_installpkgdir(shared_state, d)

    bb.utils.remove(d.getVar("SSTATE_BUILDDIR"), recurse=True)

sstate_task_postfunc(d)

def sstate_state_fromvars(d, task = None):
    if task is None:
        task = d.getVar('BB_CURRENTTASK')
        if not task:
            bb.fatal("sstate code running without task context?!")
        task = task.replace("_setscene", "")

    if task.startswith("do_"):
        task = task[3:]
    inputs = (d.getVarFlag("do_" + task, 'sstate-inputdirs') or "").split()
    outputs = (d.getVarFlag("do_" + task, 'sstate-outputdirs') or "").split()
    plaindirs = (d.getVarFlag("do_" + task, 'sstate-plaindirs') or "").split()
    lockfiles = (d.getVarFlag("do_" + task, 'sstate-lockfile') or "").split()
    lockfilesshared = (d.getVarFlag("do_" + task, 'sstate-lockfile-shared') or "").split()
    interceptfuncs = (d.getVarFlag("do_" + task, 'sstate-interceptfuncs') or "").split()
    fixmedir = d.getVarFlag("do_" + task, 'sstate-fixmedir') or ""
    if not task or len(inputs) != len(outputs):
        bb.fatal("sstate variables not setup correctly?!")

    if task == "populate_lic":
        d.setVar("SSTATE_PKGSPEC", "${SSTATE_SWSPEC}")
        d.setVar("SSTATE_EXTRAPATH", "")
        d.setVar('SSTATE_EXTRAPATHWILDCARD', "")

    ss = sstate_init(task, d)
    for i in range(len(inputs)):
        sstate_add(ss, inputs[i], outputs[i], d)
    ss['lockfiles'] = lockfiles
    ss['lockfiles-shared'] = lockfilesshared
    ss['plaindirs'] = plaindirs
    ss['interceptfuncs'] = interceptfuncs
    ss['fixmedir'] = fixmedir
    return ss

def sstate_installpkgdir(ss, d):
    import oe.path
    import subprocess

    sstateinst = d.getVar("SSTATE_INSTDIR")
    d.setVar('SSTATE_FIXMEDIR', ss['fixmedir'])

    for f in (d.getVar('SSTATEPOSTUNPACKFUNCS') or '').split():
        # All hooks should run in the SSTATE_INSTDIR
        bb.build.exec_func(f, d, (sstateinst,))

    def prepdir(dir):
        # remove dir if it exists, ensure any parent directories do exist
        if os.path.exists(dir):
            oe.path.remove(dir)
        bb.utils.mkdirhier(dir)
        oe.path.remove(dir)

    for state in ss['dirs']:
        prepdir(state[1])
        os.rename(sstateinst + state[0], state[1])
    sstate_install(ss, d)

    for plain in ss['plaindirs']:
        workdir = d.getVar('WORKDIR')
        sharedworkdir = os.path.join(d.getVar('TMPDIR'), "work-shared")
        src = sstateinst + "/" + plain.replace(workdir, '')
        if sharedworkdir in plain:
            src = sstateinst + "/" + plain.replace(sharedworkdir, '')
        dest = plain
        bb.utils.mkdirhier(src)
        prepdir(dest)
        os.rename(src, dest)

    return True

def sstate_package(ss, d):
    import oe.path

    tmpdir = d.getVar('TMPDIR')

    sstatebuild = d.expand("${WORKDIR}/sstate-build-%s/" % ss['task'])
    sstatepkg = d.getVar('SSTATE_PKG') + '_'+ ss['task'] + ".tgz"
    bb.utils.remove(sstatebuild, recurse=True)
    bb.utils.mkdirhier(sstatebuild)
    bb.utils.mkdirhier(os.path.dirname(sstatepkg))
    for state in ss['dirs']:
        if not os.path.exists(state[1]):
            continue
        srcbase = state[0].rstrip("/").rsplit('/', 1)[0]
        # Find and error for absolute symlinks. We could attempt to relocate but its not
        # clear where the symlink is relative to in this context. We could add that markup
        # to sstate tasks but there aren't many of these so better just avoid them entirely.
        for walkroot, dirs, files in os.walk(state[1]):
            for file in files + dirs:
                srcpath = os.path.join(walkroot, file)
                if not os.path.islink(srcpath):
                    continue
                link = os.readlink(srcpath)
                if not os.path.isabs(link):
                    continue
                if not link.startswith(tmpdir):
                    continue
                bb.error("sstate found an absolute path symlink %s pointing at %s. Please replace this with a relative link." % (srcpath, link))
        bb.debug(2, "Preparing tree %s for packaging at %s" % (state[1], sstatebuild + state[0]))
        os.rename(state[1], sstatebuild + state[0])

    workdir = d.getVar('WORKDIR')
    sharedworkdir = os.path.join(d.getVar('TMPDIR'), "work-shared")
    for plain in ss['plaindirs']:
        pdir = plain.replace(workdir, sstatebuild)
        if sharedworkdir in plain:
            pdir = plain.replace(sharedworkdir, sstatebuild)
        bb.utils.mkdirhier(plain)
        bb.utils.mkdirhier(pdir)
        os.rename(plain, pdir)

    d.setVar('SSTATE_BUILDDIR', sstatebuild)
    d.setVar('SSTATE_PKG', sstatepkg)
    d.setVar('SSTATE_INSTDIR', sstatebuild)

    if d.getVar('SSTATE_SKIP_CREATION') == '1':
        return

    sstate_create_package = ['sstate_report_unihash', 'sstate_create_package']
    if d.getVar('SSTATE_SIG_KEY'):
        sstate_create_package.append('sstate_sign_package')

    for f in (d.getVar('SSTATECREATEFUNCS') or '').split() + \
             sstate_create_package + \
             (d.getVar('SSTATEPOSTCREATEFUNCS') or '').split():
        # All hooks should run in SSTATE_BUILDDIR.
        bb.build.exec_func(f, d, (sstatebuild,))

    bb.siggen.dump_this_task(sstatepkg + ".siginfo", d)

    return

def sstate_init(task, d):
    ss = {}
    ss['task'] = task
    ss['dirs'] = []
    ss['plaindirs'] = []
    ss['lockfiles'] = []
    ss['lockfiles-shared'] = []
    return ss

def sstate_install(ss, d):
    import oe.path
    import oe.sstatesig
    import subprocess

    sharedfiles = []
    shareddirs = []
    bb.utils.mkdirhier(d.expand("${SSTATE_MANIFESTS}"))

    sstateinst = d.expand("${WORKDIR}/sstate-install-%s/" % ss['task'])

    manifest, d2 = oe.sstatesig.sstate_get_manifest_filename(ss['task'], d)

    if os.access(manifest, os.R_OK):
        bb.fatal("Package already staged (%s)?!" % manifest)

    d.setVar("SSTATE_INST_POSTRM", manifest + ".postrm")

    locks = []
    for lock in ss['lockfiles-shared']:
        locks.append(bb.utils.lockfile(lock, True))
    for lock in ss['lockfiles']:
        locks.append(bb.utils.lockfile(lock))

    for state in ss['dirs']:
        bb.debug(2, "Staging files from %s to %s" % (state[1], state[2]))
        for walkroot, dirs, files in os.walk(state[1]):
            for file in files:
                srcpath = os.path.join(walkroot, file)
                dstpath = srcpath.replace(state[1], state[2])
                #bb.debug(2, "Staging %s to %s" % (srcpath, dstpath))
                sharedfiles.append(dstpath)
            for dir in dirs:
                srcdir = os.path.join(walkroot, dir)
                dstdir = srcdir.replace(state[1], state[2])
                #bb.debug(2, "Staging %s to %s" % (srcdir, dstdir))
                if os.path.islink(srcdir):
                    sharedfiles.append(dstdir)
                    continue
                if not dstdir.endswith("/"):
                    dstdir = dstdir + "/"
                shareddirs.append(dstdir)

    # Check the file list for conflicts against files which already exist
    whitelist = (d.getVar("SSTATE_DUPWHITELIST") or "").split()
    match = []
    for f in sharedfiles:
        if os.path.exists(f) and not os.path.islink(f):
            f = os.path.normpath(f)
            realmatch = True
            for w in whitelist:
                w = os.path.normpath(w)
                if f.startswith(w):
                    realmatch = False
                    break
            if realmatch:
                match.append(f)
                sstate_search_cmd = "grep -rlF '%s' %s --exclude=master.list | sed -e 's:^.*/::'" % (f, d.expand("${SSTATE_MANIFESTS}"))
                search_output = subprocess.Popen(sstate_search_cmd, shell=True, stdout=subprocess.PIPE).communicate()[0]
                if search_output:
                    match.append("  (matched in %s)" % search_output.decode('utf-8').rstrip())
                else:
                    match.append("  (not matched to any task)")
    if match:
        bb.error("The recipe %s is trying to install files into a shared " \
          "area when those files already exist. Those files and their manifest " \
          "location are:\n  %s\nPlease verify which recipe should provide the " \
          "above files.\n\nThe build has stopped, as continuing in this scenario WILL " \
          "break things - if not now, possibly in the future (we've seen builds fail " \
          "several months later). If the system knew how to recover from this " \
          "automatically it would, however there are several different scenarios " \
          "which can result in this and we don't know which one this is. It may be " \
          "you have switched providers of something like virtual/kernel (e.g. from " \
          "linux-yocto to linux-yocto-dev), in that case you need to execute the " \
          "clean task for both recipes and it will resolve this error. It may be " \
          "you changed DISTRO_FEATURES from systemd to udev or vice versa. Cleaning " \
          "those recipes should again resolve this error, however switching " \
          "DISTRO_FEATURES on an existing build directory is not supported - you " \
          "should really clean out tmp and rebuild (reusing sstate should be safe). " \
          "It could be the overlapping files detected are harmless in which case " \
          "adding them to SSTATE_DUPWHITELIST may be the correct solution. It could " \
          "also be your build is including two different conflicting versions of " \
          "things (e.g. bluez 4 and bluez 5 and the correct solution for that would " \
          "be to resolve the conflict. If in doubt, please ask on the mailing list, " \
          "sharing the error and filelist above." % \
          (d.getVar('PN'), "\n  ".join(match)))
        bb.fatal("If the above message is too much, the simpler version is you're advised to wipe out tmp and rebuild (reusing sstate is fine). That will likely fix things in most (but not all) cases.")

    if ss['fixmedir'] and os.path.exists(ss['fixmedir'] + "/fixmepath.cmd"):
        sharedfiles.append(ss['fixmedir'] + "/fixmepath.cmd")
        sharedfiles.append(ss['fixmedir'] + "/fixmepath")

    # Write out the manifest
    f = open(manifest, "w")
    for file in sharedfiles:
        f.write(file + "\n")

    # We want to ensure that directories appear at the end of the manifest
    # so that when we test to see if they should be deleted any contents
    # added by the task will have been removed first.
    dirs = sorted(shareddirs, key=len)
    # Must remove children first, which will have a longer path than the parent
    for di in reversed(dirs):
        f.write(di + "\n")
    f.close()

    # Append to the list of manifests for this PACKAGE_ARCH

    i = d2.expand("${SSTATE_MANIFESTS}/index-${SSTATE_MANMACH}")
    l = bb.utils.lockfile(i + ".lock")
    filedata = d.getVar("STAMP") + " " + d2.getVar("SSTATE_MANFILEPREFIX") + " " + d.getVar("WORKDIR") + "\n"
    manifests = []
    if os.path.exists(i):
        with open(i, "r") as f:
            manifests = f.readlines()
    if filedata not in manifests:
        with open(i, "a+") as f:
            f.write(filedata)
    bb.utils.unlockfile(l)

    # Run the actual file install
    for state in ss['dirs']:
        if os.path.exists(state[1]):
            oe.path.copyhardlinktree(state[1], state[2])

    for postinst in (d.getVar('SSTATEPOSTINSTFUNCS') or '').split():
        # All hooks should run in the SSTATE_INSTDIR
        bb.build.exec_func(postinst, d, (sstateinst,))

    for lock in locks:
        bb.utils.unlockfile(lock)

def sstate_add(ss, source, dest, d):
    if not source.endswith("/"):
         source = source + "/"
    if not dest.endswith("/"):
         dest = dest + "/"
    source = os.path.normpath(source)
    dest = os.path.normpath(dest)
    srcbase = os.path.basename(source)
    ss['dirs'].append([srcbase, source, dest])
    return ss

def buildhistory_emit_pkghistory(d):
    if d.getVar('BB_CURRENTTASK') in ['populate_sysroot', 'populate_sysroot_setscene']:
        bb.build.exec_func("buildhistory_emit_sysroot", d)

    if not d.getVar('BB_CURRENTTASK') in ['packagedata', 'packagedata_setscene']:
        return 0

    if not "package" in (d.getVar('BUILDHISTORY_FEATURES') or "").split():
        return 0

    import re
    import json
    import shlex
    import errno

    pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE')
    oldpkghistdir = d.getVar('BUILDHISTORY_OLD_DIR_PACKAGE')

    class RecipeInfo:
        def __init__(self, name):
            self.name = name
            self.pe = "0"
            self.pv = "0"
            self.pr = "r0"
            self.depends = ""
            self.packages = ""
            self.srcrev = ""
            self.layer = ""


    class PackageInfo:
        def __init__(self, name):
            self.name = name
            self.pe = "0"
            self.pv = "0"
            self.pr = "r0"
            # pkg/pkge/pkgv/pkgr should be empty because we want to be able to default them
            self.pkg = ""
            self.pkge = ""
            self.pkgv = ""
            self.pkgr = ""
            self.size = 0
            self.depends = ""
            self.rprovides = ""
            self.rdepends = ""
            self.rrecommends = ""
            self.rsuggests = ""
            self.rreplaces = ""
            self.rconflicts = ""
            self.files = ""
            self.filelist = ""
            # Variables that need to be written to their own separate file
            self.filevars = dict.fromkeys(['pkg_preinst', 'pkg_postinst', 'pkg_prerm', 'pkg_postrm'])

    # Should check PACKAGES here to see if anything removed

    def readPackageInfo(pkg, histfile):
        pkginfo = PackageInfo(pkg)
        with open(histfile, "r") as f:
            for line in f:
                lns = line.split('=', 1)
                name = lns[0].strip()
                value = lns[1].strip(" \t\r\n").strip('"')
                if name == "PE":
                    pkginfo.pe = value
                elif name == "PV":
                    pkginfo.pv = value
                elif name == "PR":
                    pkginfo.pr = value
                elif name == "PKG":
                    pkginfo.pkg = value
                elif name == "PKGE":
                    pkginfo.pkge = value
                elif name == "PKGV":
                    pkginfo.pkgv = value
                elif name == "PKGR":
                    pkginfo.pkgr = value
                elif name == "RPROVIDES":
                    pkginfo.rprovides = value
                elif name == "RDEPENDS":
                    pkginfo.rdepends = value
                elif name == "RRECOMMENDS":
                    pkginfo.rrecommends = value
                elif name == "RSUGGESTS":
                    pkginfo.rsuggests = value
                elif name == "RREPLACES":
                    pkginfo.rreplaces = value
                elif name == "RCONFLICTS":
                    pkginfo.rconflicts = value
                elif name == "PKGSIZE":
                    pkginfo.size = int(value)
                elif name == "FILES":
                    pkginfo.files = value
                elif name == "FILELIST":
                    pkginfo.filelist = value
        # Apply defaults
        if not pkginfo.pkg:
            pkginfo.pkg = pkginfo.name
        if not pkginfo.pkge:
            pkginfo.pkge = pkginfo.pe
        if not pkginfo.pkgv:
            pkginfo.pkgv = pkginfo.pv
        if not pkginfo.pkgr:
            pkginfo.pkgr = pkginfo.pr
        return pkginfo

    def getlastpkgversion(pkg):
        try:
            histfile = os.path.join(oldpkghistdir, pkg, "latest")
            return readPackageInfo(pkg, histfile)
        except EnvironmentError:
            return None

    def sortpkglist(string):
        pkgiter = re.finditer(r'[a-zA-Z0-9.+-]+( \([><=]+[^)]+\))?', string, 0)
        pkglist = [p.group(0) for p in pkgiter]
        pkglist.sort()
        return ' '.join(pkglist)

    def sortlist(string):
        items = string.split(' ')
        items.sort()
        return ' '.join(items)

    pn = d.getVar('PN')
    pe = d.getVar('PE') or "0"
    pv = d.getVar('PV')
    pr = d.getVar('PR')
    layer = bb.utils.get_file_layer(d.getVar('FILE'), d)

    pkgdata_dir = d.getVar('PKGDATA_DIR')
    packages = ""
    try:
        with open(os.path.join(pkgdata_dir, pn)) as f:
            for line in f.readlines():
                if line.startswith('PACKAGES: '):
                    packages = oe.utils.squashspaces(line.split(': ', 1)[1])
                    break
    except IOError as e:
        if e.errno == errno.ENOENT:
            # Probably a -cross recipe, just ignore
            return 0
        else:
            raise

    packagelist = packages.split()
    preserve = d.getVar('BUILDHISTORY_PRESERVE').split()
    if not os.path.exists(pkghistdir):
        bb.utils.mkdirhier(pkghistdir)
    else:
        # Remove files for packages that no longer exist
        for item in os.listdir(pkghistdir):
            if item not in preserve:
                if item not in packagelist:
                    itempath = os.path.join(pkghistdir, item)
                    if os.path.isdir(itempath):
                        for subfile in os.listdir(itempath):
                            os.unlink(os.path.join(itempath, subfile))
                        os.rmdir(itempath)
                    else:
                        os.unlink(itempath)

    rcpinfo = RecipeInfo(pn)
    rcpinfo.pe = pe
    rcpinfo.pv = pv
    rcpinfo.pr = pr
    rcpinfo.depends = sortlist(oe.utils.squashspaces(d.getVar('DEPENDS') or ""))
    rcpinfo.packages = packages
    rcpinfo.layer = layer
    write_recipehistory(rcpinfo, d)

    pkgdest = d.getVar('PKGDEST')
    for pkg in packagelist:
        pkgdata = {}
        with open(os.path.join(pkgdata_dir, 'runtime', pkg)) as f:
            for line in f.readlines():
                item = line.rstrip('\n').split(': ', 1)
                key = item[0]
                if key.endswith('_' + pkg):
                    key = key[:-len(pkg)-1]
                pkgdata[key] = item[1].encode('latin-1').decode('unicode_escape')

        pkge = pkgdata.get('PKGE', '0')
        pkgv = pkgdata['PKGV']
        pkgr = pkgdata['PKGR']
        #
        # Find out what the last version was
        # Make sure the version did not decrease
        #
        lastversion = getlastpkgversion(pkg)
        if lastversion:
            last_pkge = lastversion.pkge
            last_pkgv = lastversion.pkgv
            last_pkgr = lastversion.pkgr
            r = bb.utils.vercmp((pkge, pkgv, pkgr), (last_pkge, last_pkgv, last_pkgr))
            if r < 0:
                msg = "Package version for package %s went backwards which would break package feeds from (%s:%s-%s to %s:%s-%s)" % (pkg, last_pkge, last_pkgv, last_pkgr, pkge, pkgv, pkgr)
                package_qa_handle_error("version-going-backwards", msg, d)

        pkginfo = PackageInfo(pkg)
        # Apparently the version can be different on a per-package basis (see Python)
        pkginfo.pe = pkgdata.get('PE', '0')
        pkginfo.pv = pkgdata['PV']
        pkginfo.pr = pkgdata['PR']
        pkginfo.pkg = pkgdata['PKG']
        pkginfo.pkge = pkge
        pkginfo.pkgv = pkgv
        pkginfo.pkgr = pkgr
        pkginfo.rprovides = sortpkglist(oe.utils.squashspaces(pkgdata.get('RPROVIDES', "")))
        pkginfo.rdepends = sortpkglist(oe.utils.squashspaces(pkgdata.get('RDEPENDS', "")))
        pkginfo.rrecommends = sortpkglist(oe.utils.squashspaces(pkgdata.get('RRECOMMENDS', "")))
        pkginfo.rsuggests = sortpkglist(oe.utils.squashspaces(pkgdata.get('RSUGGESTS', "")))
        pkginfo.rreplaces = sortpkglist(oe.utils.squashspaces(pkgdata.get('RREPLACES', "")))
        pkginfo.rconflicts = sortpkglist(oe.utils.squashspaces(pkgdata.get('RCONFLICTS', "")))
        pkginfo.files = oe.utils.squashspaces(pkgdata.get('FILES', ""))
        for filevar in pkginfo.filevars:
            pkginfo.filevars[filevar] = pkgdata.get(filevar, "")

        # Gather information about packaged files
        val = pkgdata.get('FILES_INFO', '')
        dictval = json.loads(val)
        filelist = list(dictval.keys())
        filelist.sort()
        pkginfo.filelist = " ".join([shlex.quote(x) for x in filelist])

        pkginfo.size = int(pkgdata['PKGSIZE'])

        write_pkghistory(pkginfo, d)

    # Create files-in-<package-name>.txt files containing a list of files of each recipe's package
    bb.build.exec_func("buildhistory_list_pkg_files", d)

def package_qa_handle_error(error_class, error_msg, d):
    if error_class in (d.getVar("ERROR_QA") or "").split():
        package_qa_write_error(error_class, error_msg, d)
        bb.error("QA Issue: %s [%s]" % (error_msg, error_class))
        d.setVar("QA_SANE", False)
        return False
    elif error_class in (d.getVar("WARN_QA") or "").split():
        package_qa_write_error(error_class, error_msg, d)
        bb.warn("QA Issue: %s [%s]" % (error_msg, error_class))
    else:
        bb.note("QA Issue: %s [%s]" % (error_msg, error_class))
    return True

def write_pkghistory(pkginfo, d):
    bb.debug(2, "Writing package history for package %s" % pkginfo.name)

    pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE')

    pkgpath = os.path.join(pkghistdir, pkginfo.name)
    if not os.path.exists(pkgpath):
        bb.utils.mkdirhier(pkgpath)

    infofile = os.path.join(pkgpath, "latest")
    with open(infofile, "w") as f:
        if pkginfo.pe != "0":
            f.write(u"PE = %s\n" %  pkginfo.pe)
        f.write(u"PV = %s\n" %  pkginfo.pv)
        f.write(u"PR = %s\n" %  pkginfo.pr)

        if pkginfo.pkg != pkginfo.name:
            f.write(u"PKG = %s\n" % pkginfo.pkg)
        if pkginfo.pkge != pkginfo.pe:
            f.write(u"PKGE = %s\n" % pkginfo.pkge)
        if pkginfo.pkgv != pkginfo.pv:
            f.write(u"PKGV = %s\n" % pkginfo.pkgv)
        if pkginfo.pkgr != pkginfo.pr:
            f.write(u"PKGR = %s\n" % pkginfo.pkgr)
        f.write(u"RPROVIDES = %s\n" %  pkginfo.rprovides)
        f.write(u"RDEPENDS = %s\n" %  pkginfo.rdepends)
        f.write(u"RRECOMMENDS = %s\n" %  pkginfo.rrecommends)
        if pkginfo.rsuggests:
            f.write(u"RSUGGESTS = %s\n" %  pkginfo.rsuggests)
        if pkginfo.rreplaces:
            f.write(u"RREPLACES = %s\n" %  pkginfo.rreplaces)
        if pkginfo.rconflicts:
            f.write(u"RCONFLICTS = %s\n" %  pkginfo.rconflicts)
        f.write(u"PKGSIZE = %d\n" %  pkginfo.size)
        f.write(u"FILES = %s\n" %  pkginfo.files)
        f.write(u"FILELIST = %s\n" %  pkginfo.filelist)

    for filevar in pkginfo.filevars:
        filevarpath = os.path.join(pkgpath, "latest.%s" % filevar)
        val = pkginfo.filevars[filevar]
        if val:
            with open(filevarpath, "w") as f:
                f.write(val)
        else:
            if os.path.exists(filevarpath):
                os.unlink(filevarpath)

#
# rootfs_type can be: image, sdk_target, sdk_host
#

def write_recipehistory(rcpinfo, d):
    bb.debug(2, "Writing recipe history")

    pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE')

    infofile = os.path.join(pkghistdir, "latest")
    with open(infofile, "w") as f:
        if rcpinfo.pe != "0":
            f.write(u"PE = %s\n" %  rcpinfo.pe)
        f.write(u"PV = %s\n" %  rcpinfo.pv)
        f.write(u"PR = %s\n" %  rcpinfo.pr)
        f.write(u"DEPENDS = %s\n" %  rcpinfo.depends)
        f.write(u"PACKAGES = %s\n" %  rcpinfo.packages)
        f.write(u"LAYER = %s\n" %  rcpinfo.layer)

    write_latest_srcrev(d, pkghistdir)

def write_latest_srcrev(d, pkghistdir):
    srcrevfile = os.path.join(pkghistdir, 'latest_srcrev')

    srcrevs, tag_srcrevs = _get_srcrev_values(d)
    if srcrevs:
        if not os.path.exists(pkghistdir):
            bb.utils.mkdirhier(pkghistdir)
        old_tag_srcrevs = {}
        if os.path.exists(srcrevfile):
            with open(srcrevfile) as f:
                for line in f:
                    if line.startswith('# tag_'):
                        key, value = line.split("=", 1)
                        key = key.replace('# tag_', '').strip()
                        value = value.replace('"', '').strip()
                        old_tag_srcrevs[key] = value
        with open(srcrevfile, 'w') as f:
            orig_srcrev = d.getVar('SRCREV', False) or 'INVALID'
            if orig_srcrev != 'INVALID':
                f.write('# SRCREV = "%s"\n' % orig_srcrev)
            if len(srcrevs) > 1:
                for name, srcrev in sorted(srcrevs.items()):
                    orig_srcrev = d.getVar('SRCREV_%s' % name, False)
                    if orig_srcrev:
                        f.write('# SRCREV_%s = "%s"\n' % (name, orig_srcrev))
                    f.write('SRCREV_%s = "%s"\n' % (name, srcrev))
            else:
                f.write('SRCREV = "%s"\n' % next(iter(srcrevs.values())))
            if len(tag_srcrevs) > 0:
                for name, srcrev in sorted(tag_srcrevs.items()):
                    f.write('# tag_%s = "%s"\n' % (name, srcrev))
                    if name in old_tag_srcrevs and old_tag_srcrevs[name] != srcrev:
                        pkg = d.getVar('PN')
                        bb.warn("Revision for tag %s in package %s was changed since last build (from %s to %s)" % (name, pkg, old_tag_srcrevs[name], srcrev))

    else:
        if os.path.exists(srcrevfile):
            os.remove(srcrevfile)

def package_qa_write_error(type, error, d):
    logfile = d.getVar('QA_LOGFILE')
    if logfile:
        p = d.getVar('P')
        with open(logfile, "a+") as f:
            f.write("%s: %s [%s]\n" % (p, error, type))

def _get_srcrev_values(d):
    """
    Return the version strings for the current recipe
    """

    scms = []
    fetcher = bb.fetch.Fetch(d.getVar('SRC_URI').split(), d)
    urldata = fetcher.ud
    for u in urldata:
        if urldata[u].method.supports_srcrev():
            scms.append(u)

    autoinc_templ = 'AUTOINC+'
    dict_srcrevs = {}
    dict_tag_srcrevs = {}
    for scm in scms:
        ud = urldata[scm]
        for name in ud.names:
            try:
                rev = ud.method.sortable_revision(ud, d, name)
            except TypeError:
                # support old bitbake versions
                rev = ud.method.sortable_revision(scm, ud, d, name)
            # Clean this up when we next bump bitbake version
            if type(rev) != str:
                autoinc, rev = rev
            elif rev.startswith(autoinc_templ):
                rev = rev[len(autoinc_templ):]
            dict_srcrevs[name] = rev
            if 'tag' in ud.parm:
                tag = ud.parm['tag'];
                key = name+'_'+tag
                dict_tag_srcrevs[key] = rev
    return (dict_srcrevs, dict_tag_srcrevs)


------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=run.sstate_task_prefunc.14593
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=run.sstate_task_prefunc.14593
X-Attachment-Id: 525a27c3-3f0b-4bbe-82dc-43a020513e88
Content-ID: <525a27c3-3f0b-4bbe-82dc-43a020513e88>

def sstate_task_prefunc(d):
    shared_state = sstate_state_fromvars(d)
    sstate_clean(shared_state, d)

sstate_task_prefunc(d)

def sstate_state_fromvars(d, task = None):
    if task is None:
        task = d.getVar('BB_CURRENTTASK')
        if not task:
            bb.fatal("sstate code running without task context?!")
        task = task.replace("_setscene", "")

    if task.startswith("do_"):
        task = task[3:]
    inputs = (d.getVarFlag("do_" + task, 'sstate-inputdirs') or "").split()
    outputs = (d.getVarFlag("do_" + task, 'sstate-outputdirs') or "").split()
    plaindirs = (d.getVarFlag("do_" + task, 'sstate-plaindirs') or "").split()
    lockfiles = (d.getVarFlag("do_" + task, 'sstate-lockfile') or "").split()
    lockfilesshared = (d.getVarFlag("do_" + task, 'sstate-lockfile-shared') or "").split()
    interceptfuncs = (d.getVarFlag("do_" + task, 'sstate-interceptfuncs') or "").split()
    fixmedir = d.getVarFlag("do_" + task, 'sstate-fixmedir') or ""
    if not task or len(inputs) != len(outputs):
        bb.fatal("sstate variables not setup correctly?!")

    if task == "populate_lic":
        d.setVar("SSTATE_PKGSPEC", "${SSTATE_SWSPEC}")
        d.setVar("SSTATE_EXTRAPATH", "")
        d.setVar('SSTATE_EXTRAPATHWILDCARD', "")

    ss = sstate_init(task, d)
    for i in range(len(inputs)):
        sstate_add(ss, inputs[i], outputs[i], d)
    ss['lockfiles'] = lockfiles
    ss['lockfiles-shared'] = lockfilesshared
    ss['plaindirs'] = plaindirs
    ss['interceptfuncs'] = interceptfuncs
    ss['fixmedir'] = fixmedir
    return ss

def sstate_clean(ss, d):
    import oe.path
    import glob

    d2 = d.createCopy()
    stamp_clean = d.getVar("STAMPCLEAN")
    extrainf = d.getVarFlag("do_" + ss['task'], 'stamp-extra-info')
    if extrainf:
        d2.setVar("SSTATE_MANMACH", extrainf)
        wildcard_stfile = "%s.do_%s*.%s" % (stamp_clean, ss['task'], extrainf)
    else:
        wildcard_stfile = "%s.do_%s*" % (stamp_clean, ss['task'])

    manifest = d2.expand("${SSTATE_MANFILEPREFIX}.%s" % ss['task'])

    if os.path.exists(manifest):
        locks = []
        for lock in ss['lockfiles-shared']:
            locks.append(bb.utils.lockfile(lock))
        for lock in ss['lockfiles']:
            locks.append(bb.utils.lockfile(lock))

        sstate_clean_manifest(manifest, d)

        for lock in locks:
            bb.utils.unlockfile(lock)

    # Remove the current and previous stamps, but keep the sigdata.
    #
    # The glob() matches do_task* which may match multiple tasks, for
    # example: do_package and do_package_write_ipk, so we need to
    # exactly match *.do_task.* and *.do_task_setscene.*
    rm_stamp = '.do_%s.' % ss['task']
    rm_setscene = '.do_%s_setscene.' % ss['task']
    # For BB_SIGNATURE_HANDLER = "noop"
    rm_nohash = ".do_%s" % ss['task']
    for stfile in glob.glob(wildcard_stfile):
        # Keep the sigdata
        if ".sigdata." in stfile or ".sigbasedata." in stfile:
            continue
        # Preserve taint files in the stamps directory
        if stfile.endswith('.taint'):
            continue
        if rm_stamp in stfile or rm_setscene in stfile or \
                stfile.endswith(rm_nohash):
            oe.path.remove(stfile)

def sstate_init(task, d):
    ss = {}
    ss['task'] = task
    ss['dirs'] = []
    ss['plaindirs'] = []
    ss['lockfiles'] = []
    ss['lockfiles-shared'] = []
    return ss

def sstate_add(ss, source, dest, d):
    if not source.endswith("/"):
         source = source + "/"
    if not dest.endswith("/"):
         dest = dest + "/"
    source = os.path.normpath(source)
    dest = os.path.normpath(dest)
    srcbase = os.path.basename(source)
    ss['dirs'].append([srcbase, source, dest])
    return ss

def sstate_clean_manifest(manifest, d, prefix=None):
    import oe.path

    mfile = open(manifest)
    entries = mfile.readlines()
    mfile.close()

    for entry in entries:
        entry = entry.strip()
        if prefix and not entry.startswith("/"):
            entry = prefix + "/" + entry
        bb.debug(2, "Removing manifest: %s" % entry)
        # We can race against another package populating directories as we're removing them
        # so we ignore errors here.
        try:
            if entry.endswith("/"):
                if os.path.islink(entry[:-1]):
                    os.remove(entry[:-1])
                elif os.path.exists(entry) and len(os.listdir(entry)) == 0:
                    os.rmdir(entry[:-1])
            else:
                os.remove(entry)
        except OSError:
            pass

    postrm = manifest + ".postrm"
    if os.path.exists(manifest + ".postrm"):
        import subprocess
        os.chmod(postrm, 0o755)
        subprocess.check_call(postrm, shell=True)
        oe.path.remove(postrm)

    oe.path.remove(manifest)


------=_Part_2682_1808739877.1565693474800
Content-Type: application/octet-stream; name=run.write_srcrev.14470
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=run.write_srcrev.14470
X-Attachment-Id: a92759e9-123a-4de0-a5f2-02fd9eaa1030
Content-ID: <a92759e9-123a-4de0-a5f2-02fd9eaa1030>

def write_srcrev(d):
    write_latest_srcrev(d, d.getVar('BUILDHISTORY_DIR_PACKAGE'))

write_srcrev(d)

def write_latest_srcrev(d, pkghistdir):
    srcrevfile = os.path.join(pkghistdir, 'latest_srcrev')

    srcrevs, tag_srcrevs = _get_srcrev_values(d)
    if srcrevs:
        if not os.path.exists(pkghistdir):
            bb.utils.mkdirhier(pkghistdir)
        old_tag_srcrevs = {}
        if os.path.exists(srcrevfile):
            with open(srcrevfile) as f:
                for line in f:
                    if line.startswith('# tag_'):
                        key, value = line.split("=", 1)
                        key = key.replace('# tag_', '').strip()
                        value = value.replace('"', '').strip()
                        old_tag_srcrevs[key] = value
        with open(srcrevfile, 'w') as f:
            orig_srcrev = d.getVar('SRCREV', False) or 'INVALID'
            if orig_srcrev != 'INVALID':
                f.write('# SRCREV = "%s"\n' % orig_srcrev)
            if len(srcrevs) > 1:
                for name, srcrev in sorted(srcrevs.items()):
                    orig_srcrev = d.getVar('SRCREV_%s' % name, False)
                    if orig_srcrev:
                        f.write('# SRCREV_%s = "%s"\n' % (name, orig_srcrev))
                    f.write('SRCREV_%s = "%s"\n' % (name, srcrev))
            else:
                f.write('SRCREV = "%s"\n' % next(iter(srcrevs.values())))
            if len(tag_srcrevs) > 0:
                for name, srcrev in sorted(tag_srcrevs.items()):
                    f.write('# tag_%s = "%s"\n' % (name, srcrev))
                    if name in old_tag_srcrevs and old_tag_srcrevs[name] != srcrev:
                        pkg = d.getVar('PN')
                        bb.warn("Revision for tag %s in package %s was changed since last build (from %s to %s)" % (name, pkg, old_tag_srcrevs[name], srcrev))

    else:
        if os.path.exists(srcrevfile):
            os.remove(srcrevfile)

def _get_srcrev_values(d):
    """
    Return the version strings for the current recipe
    """

    scms = []
    fetcher = bb.fetch.Fetch(d.getVar('SRC_URI').split(), d)
    urldata = fetcher.ud
    for u in urldata:
        if urldata[u].method.supports_srcrev():
            scms.append(u)

    autoinc_templ = 'AUTOINC+'
    dict_srcrevs = {}
    dict_tag_srcrevs = {}
    for scm in scms:
        ud = urldata[scm]
        for name in ud.names:
            try:
                rev = ud.method.sortable_revision(ud, d, name)
            except TypeError:
                # support old bitbake versions
                rev = ud.method.sortable_revision(scm, ud, d, name)
            # Clean this up when we next bump bitbake version
            if type(rev) != str:
                autoinc, rev = rev
            elif rev.startswith(autoinc_templ):
                rev = rev[len(autoinc_templ):]
            dict_srcrevs[name] = rev
            if 'tag' in ud.parm:
                tag = ud.parm['tag'];
                key = name+'_'+tag
                dict_tag_srcrevs[key] = rev
    return (dict_srcrevs, dict_tag_srcrevs)


------=_Part_2682_1808739877.1565693474800--
