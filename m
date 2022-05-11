Return-Path: <jailhouse-dev+bncBDVP3IWNW4CBBR6F5WJQMGQEOLC6WAY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x740.google.com (mail-qk1-x740.google.com [IPv6:2607:f8b0:4864:20::740])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F339522CFD
	for <lists+jailhouse-dev@lfdr.de>; Wed, 11 May 2022 09:16:25 +0200 (CEST)
Received: by mail-qk1-x740.google.com with SMTP id bj2-20020a05620a190200b005084968bb24sf1174103qkb.23
        for <lists+jailhouse-dev@lfdr.de>; Wed, 11 May 2022 00:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=gMJHMI9Jm0j94Ac5rNkNzc+rcPSctBaJsPi11+4qKkA=;
        b=WC/f8O4SsFoX6bZe4kUzCXL8zNBCRPQHF3WgRgf4tV4kOrU6HDmWyY1mT9ewmiD8iO
         dC/wDOhfrE9KA6BH6hxXTN/IcuOEPFU1Zcq4s12qBny1/ox3AEK/j7eu9KnVzXacPFHc
         xdEICmt+hlgi4t2aC5g015axyMK/Yzlt1d9TJuHOW+18K3rikTJC9q/9lAi9Wlm2bF0s
         yUlyv/dUfXEQFekB/I2YBlQJOzzqbjdhxOAGir+Ym8m3c+9IQGcZFo3LN35mdiUvHOWI
         EAJA/tkhKrCd7HP4qgpOtAlNlpT0IVxc9ldnm2wgt15LfcyQvgTrKwSz/5Nf0i2obutH
         T9yA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=gMJHMI9Jm0j94Ac5rNkNzc+rcPSctBaJsPi11+4qKkA=;
        b=NxIict2cKz29QC8AOMmsm8JVaKW3qKGQ/MBQs1JNv7tqjYeJvF+8uuOlTCDLHc8Odt
         PRX8sXkk5hN7MzSh3RZhP1thjN92AMA/YqcQ+VG3ifAJz9HnxaIu95zx2Cxp9hJdwk1b
         nbEtghoG83Vn9MWtv1qBzyXdnjcQppP9DhUAEksMVOVhJHDi6ndEeXzhedE49dhPKIeq
         BxaXpL/AlmxtuTNtWrk2HT97k6W+i/T6WQN2vDerN6bKUD8Domlm5LVZcYn5VVD2QhcH
         ZIftIBYld/W8il16PKeCxNwt5Y3FWmD4Dz4BMT5ahgLCWTG7RSHoFtPoMUAJo8ir/yY3
         q+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=gMJHMI9Jm0j94Ac5rNkNzc+rcPSctBaJsPi11+4qKkA=;
        b=X0aLX6nA12dU9hcNYsQKle3mTn9/Nr+OLS+KAsj9QpH5ITizfGT+odLlLZ5kfWANtF
         bmqXFiEYYE1nhBkWdJl5Ku8D5TGAPzkGEJD8InPkwsnbPw/CalEEA8rAxiGCMxk3bRcL
         zuR0G0hmiS7vdRhk9WKoRO0B2T7hkmXsU8TExn1fQyibFduTEyAGbrjbfmptHCw7mWcc
         HXpOQALxlSWISuFwIbZZoa9ZJMPcBCeu8a4oKyfLCMTBL6KKMw9Iv5WThsgRUidg9y7B
         jB3jcAChad2nz8xWWlMuLy6WGHOZMcEGuHU38vCBsnneKN9tmSj+LAV041dbhok0EbH1
         HMXw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532uTT2+EcGBmAnrrCB+6t215hFppXe3thBfgdZv8lWt3KX+iBMa
	r+BiSirQ5o6Zf7VYejwA3WU=
X-Google-Smtp-Source: ABdhPJxVGxxUCiYnm7OBkPuh1CcqGulhvXzquVe6iYpjq6dXyOO82rcY8VSzyzAf3H33Fs3vMRdFVw==
X-Received: by 2002:ad4:596e:0:b0:45a:b06d:d8cb with SMTP id eq14-20020ad4596e000000b0045ab06dd8cbmr20844496qvb.97.1652253384117;
        Wed, 11 May 2022 00:16:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:2902:b0:6a0:858b:a9ec with SMTP id
 m2-20020a05620a290200b006a0858ba9ecls719833qkp.10.gmail; Wed, 11 May 2022
 00:16:23 -0700 (PDT)
X-Received: by 2002:a37:670b:0:b0:69f:b5e2:5e2d with SMTP id b11-20020a37670b000000b0069fb5e25e2dmr18207651qkc.326.1652253382988;
        Wed, 11 May 2022 00:16:22 -0700 (PDT)
Date: Wed, 11 May 2022 00:16:22 -0700 (PDT)
From: "vsun...@gmail.com" <vsuneja63@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <ab9f5a7b-d479-44a1-8ae6-a2ad564fe1b1n@googlegroups.com>
Subject: Jailhouse 0.12 on i.MX8MQ EVK
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_634_458791253.1652253382374"
X-Original-Sender: vsuneja63@gmail.com
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

------=_Part_634_458791253.1652253382374
Content-Type: multipart/alternative; 
	boundary="----=_Part_635_162105136.1652253382374"

------=_Part_635_162105136.1652253382374
Content-Type: text/plain; charset="UTF-8"

Hi All,

I am building jailhouse 0.12 on kernel 5.4.147 i.MX8, but its failing with 
below logs. I could successfully build jailhouse 0.11 on the same kernel. 
Any suggestions on this, does 0.12 version support i.MX8?

 *vipulkumar@A812DBLR:~/platform/AGL_lamprey/build$ bitbake -k 
agl-demo-platform*

*Loading cache: 100% 
|#####################################################################################################################################| 
Time: 0:00:01*
*Loaded 4682 entries from dependency cache.*
*Parsing recipes: 100% 
|###################################################################################################################################| 
Time: 0:00:02*
*Parsing of 3146 .bb files complete (3145 cached, 1 parsed). 4683 targets, 
405 skipped, 10 masked, 0 errors.*
*NOTE: Resolving any missing task queue dependencies*

*Build Configuration:*
*BB_VERSION           = "1.46.0"*
*BUILD_SYS            = "x86_64-linux"*
*NATIVELSBSTRING      = "universal"*
*TARGET_SYS           = "aarch64-agl-linux"*
*MACHINE              = "imx8mqevk"*
*DISTRO               = "poky-agl"*
*DISTRO_VERSION       = "12.1.2"*
*TUNE_FEATURES        = "aarch64"*
*TARGET_FPU           = ""*
*meta-pipewire*        
*meta-netboot         = "HEAD:825a674a08bb6478f93065d6f1823ae52ccaa0ff"*
*meta-security        = "HEAD:b76698c788cb8ca632077a972031899ef15025d6"*
*meta-perl            = "HEAD:0722ff6f021df91542b5efa1ff5b5f6269f66add"*
*meta-app-framework   = "HEAD:825a674a08bb6478f93065d6f1823ae52ccaa0ff"*
*meta-speech-framework = "HEAD:c0085760179255579ffac8faa6cd5d216b8a3384"*
*meta-aac             = "HEAD:e1564482a33648bede36740796c8d69ae3c6f7fb"*
*meta-arm-toolchain   = "HEAD:c4f04f3fb66f8f4365b08b553af8206372e90a63"*
*meta-agl-jailhouse   = "HEAD:c0085760179255579ffac8faa6cd5d216b8a3384"*
*meta-arm             = "HEAD:c4f04f3fb66f8f4365b08b553af8206372e90a63"*
*meta-iot-cloud       = "HEAD:5431f91969087d631972d73cd03b16eed0a61987"*
*meta-qt5             = "HEAD:b4d24d70aca75791902df5cd59a4f4a54aa4a125"*
*meta-python2         = "HEAD:b901080cf57d9a7f5476ab4d96e56c30db8170a8"*
*meta-agl-demo        = "HEAD:12ad591d3038db609db5290d8bbe809a34c743de"*
*meta-freescale       = "HEAD:a6199966375875fdfc295e6687c86a83fb53bf04"*
*meta-networking*      
*meta-python*          
*meta-filesystems*     
*meta-oe              = "HEAD:0722ff6f021df91542b5efa1ff5b5f6269f66add"*
*meta-agl-core*        
*meta-agl-core-test*   
*meta-agl-bsp         = "HEAD:825a674a08bb6478f93065d6f1823ae52ccaa0ff"*
*meta*                 
*meta-poky            = "HEAD:3ec873af83c7b09468605d8aadd0933aecbdb56d"*

*Initialising tasks: 100% 
|################################################################################################################################| 
Time: 0:00:06*
*Sstate summary: Wanted 27 Found 0 Missed 27 Current 4574 (0% match, 99% 
complete)*
*NOTE: Executing Tasks*
*ERROR: jailhouse-0.12+gitAUTOINC+4ce7658ddd-r0 do_compile: oe_runmake 
failed*
*ERROR: jailhouse-0.12+gitAUTOINC+4ce7658ddd-r0 do_compile: Execution of 
'/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/temp/run.do_compile.14389' 
failed with exit code 1*
*ERROR: Logfile of failure stored in: 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/temp/log.do_compile.14389*
*Log data follows:*
*| DEBUG: Executing shell function do_compile*
*| NOTE: make j 8 ARCH=arm64 
CROSS_COMPILE=aarch64-agl-linux CC=aarch64-agl-linux-gcc 
 -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security 
-Werror=format-security 
--sysroot=/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/recipe-sysroot 
KDIR=/home/vipulkumar/platform/AGL_lamprey/build/tmp/work-shared/imx8mqevk/kernel-build-artifacts*
*|   GEN     
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/pyjailhouse/pci_defs.py*
*|   UPD     
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/include/generated/config.mk*
*|   UPD     
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/include/generated/version.h*
*|   
CC [M]  /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver/cell.o*
*|   
CC [M]  /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver/main.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/lib/arm64/../arm-common/../alloc.o*
*|   
CC [M]  /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver/sysfs.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/lib/arm64/../arm-common/../cmdline.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/amd-seattle-inmate-demo.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/asm-defines.s*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/lib/arm64/../arm-common/../pci.o*
*|   LDS     
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/hypervisor.lds*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/amd-seattle-linux-demo.o*
*| WARNING: Could not create the helper script to generate configurations 
on remote machines ("jailhouse-conf-collect"). You need Python and the Mako 
library for it.*
*|   GEN     
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/include/generated/asm/asm-defines.h*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/tools/jailhouse.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/setup.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/printk.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/amd-seattle.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/espressobin-inmate-demo.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/lib/arm64/../arm-common/../printk.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/espressobin-linux-demo.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/lib/arm64/../arm-common/../setup.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/paging.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/espressobin.o*
*| 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver/main.c:88:21: 
error: conflicting types for '**hyp_stub_vectors'*
*|    88 | extern unsigned int __hyp_stub_vectors[];*
*|       |                     ^~~~~~~~~~~~~~~~~~*
*| In file included from 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/hw_breakpoint.h:11,*
*|                  from 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/processor.h:32,*
*|                  from 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work-shared/imx8mqevk/kernel-source/include/asm-generic/qrwlock.h:14,*
*|                  from ./arch/arm64/include/generated/asm/qrwlock.h:1,*
*|                  from 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/spinlock.h:8,*
*|                  from 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work-shared/imx8mqevk/kernel-source/include/linux/spinlock.h:89,*
*|                  from 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work-shared/imx8mqevk/kernel-source/include/linux/seqlock.h:36,*
*|                  from 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work-shared/imx8mqevk/kernel-source/include/linux/time.h:6,*
*|                  from 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/stat.h:12,*
*|                  from 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work-shared/imx8mqevk/kernel-source/include/linux/stat.h:6,*
*|                  from 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work-shared/imx8mqevk/kernel-source/include/linux/module.h:10,*
*|                  from 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver/main.c:19:*
*| 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work-shared/imx8mqevk/kernel-source/arch/arm64/include/asm/virt.h:65:13: 
note: previous declaration of '**hyp_stub_vectors' was here*
*|    65 | extern char __hyp_stub_vectors[];*
*|       |             ^~~~~~~~~~~~~~~~~~*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/foundation-v8-inmate-demo.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/lib/arm64/../arm-common/../string.o*
*| make[4]: 
*** [/home/vipulkumar/platform/AGL_lamprey/build/tmp/work-shared/imx8mqevk/kernel-source/scripts/Makefile.build:262: 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver/main.o] Error 
1*
*| make[4]: *** Waiting for unfinished jobs....*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/lib/arm64/../arm-common/../uart-8250.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/foundation-v8-linux-demo.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/tools/ivshmem-demo.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/lib/arm64/../arm-common/gic-v2.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/lib/arm64/../arm-common/gic-v3.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/foundation-v8.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/lib/arm64/../arm-common/gic.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/hikey-inmate-demo.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/hikey-linux-demo.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/hikey.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/tools/jailhouse-gcov-extract.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/lib/arm64/../arm-common/mem.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/control.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/imx8mm-inmate-demo.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/lib/arm64/../arm-common/pci.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/imx8mm-linux-demo.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/imx8mm.o*
*|   GEN     
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/tools/jailhouse.8*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/lib/arm64/../arm-common/printk.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/lib.o*
*|   GEN     
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/tools/jailhouse-cell.8*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/mmio.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/imx8mn-inmate-demo.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/imx8mn-linux-demo.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/lib/arm64/../arm-common/setup.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/lib/arm64/../arm-common/timing.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/lib/arm64/../arm-common/uart-hscif.o*
*|   GEN     
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/tools/jailhouse-enable.8*
*|   LD     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/tools/jailhouse*
*| make[3]: 
*** [/home/vipulkumar/platform/AGL_lamprey/build/tmp/work-shared/imx8mqevk/kernel-source/scripts/Makefile.build:497: 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver] Error 
2*
*| make[3]: *** Waiting for unfinished jobs....*
*|   LD     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/tools/ivshmem-demo*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/imx8mn.o*
*|   LD     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/tools/jailhouse-gcov-extract*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/lib/arm64/../arm-common/uart-imx.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/lib/arm64/../arm-common/uart-mvebu.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/imx8mp-inmate-demo.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/imx8mp-linux-demo.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/lib/arm64/../arm-common/uart-pl011.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/imx8mp.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/pci.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/lib/arm64/../arm-common/uart-scifa.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/imx8mq-inmate-demo.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/imx8mq-linux-demo.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/ivshmem.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/lib/arm64/../arm-common/uart-xuartps.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/lib/arm64/../arm-common/uart.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/imx8mq.o*
*|   AS     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/lib/arm64/header.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/jetson-tx1-inmate-demo.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/jetson-tx1-linux-demo.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/jetson-tx1.o*
*|   LDS     
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/lib/arm64/inmate.lds*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/uart.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/jetson-tx2-inmate-demo.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/jetson-tx2.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/uart-8250.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/k3-am654-idk-linux-demo.o*
*|   AR     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/lib/arm64/lib.a*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/demos/arm64/../arm/gic-demo.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/k3-am654-idk.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/demos/arm64/../arm/uart-demo.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/k3-am654-inmate-demo.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/../arm-common/control.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/demos/arm64/../ivshmem-demo.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/tools/arm64/linux-loader.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/../arm-common/dbg-write.o*
*|   LD     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/demos/arm64/gic-demo-linked.o*
*|   LD     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/demos/arm64/uart-demo-linked.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/k3-j721e-evm-inmate-demo.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/../arm-common/gic-v2.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/../arm-common/gic-v3.o*
*|   LD     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/tools/arm64/linux-loader-linked.o*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/tools/arm64/linux-loader.bin*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/demos/arm64/gic-demo.bin*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/demos/arm64/uart-demo.bin*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/k3-j721e-evm-linux-demo.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/../arm-common/irqchip.o*
*|   LD     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/demos/arm64/ivshmem-demo-linked.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/k3-j721e-evm.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/../arm-common/ivshmem.o*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/demos/arm64/ivshmem-demo.bin*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/../arm-common/lib.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/macchiatobin-inmate-demo.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/macchiatobin-linux-demo.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/../arm-common/mmu_cell.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/macchiatobin.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/../arm-common/paging.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/miriac-sbc-ls1046a-inmate-demo.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/../arm-common/pci.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/miriac-sbc-ls1046a-linux-demo.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/miriac-sbc-ls1046a.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/pine64-plus-inmate-demo.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/pine64-plus.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/pine64-plus-linux-demo.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/../arm-common/setup.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/../arm-common/psci.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/qemu-agl.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/qemu-arm64-inmate-demo.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/../arm-common/smccc.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/../arm-common/uart-hscif.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/../arm-common/uart-imx.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/../arm-common/uart-mvebu.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/../arm-common/uart-pl011.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/qemu-arm64-linux-demo.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/qemu-arm64.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/rpi4-inmate-demo.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/rpi4-linux-demo.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/rpi4.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/../arm-common/uart-scifa.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/ultra96-inmate-demo.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/../arm-common/uart-xuartps.o*
*|   AS     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/caches.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/control.o*
*|   AS     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/entry.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/ultra96-linux-demo.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/iommu.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/ultra96.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/zynqmp-zcu102-inmate-demo.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/zynqmp-zcu102-linux-demo-2.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/mmio.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/zynqmp-zcu102-linux-demo.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/paging.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/zynqmp-zcu102.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/setup.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/smmu-v3.o*
*|   DTC     
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/dts/inmate-amd-seattle.dtb*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/ti-pvu.o*
*|   CC     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/traps.o*
*|   DTC     
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/dts/inmate-espressobin.dtb*
*|   DTC     
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/dts/inmate-foundation-v8.dtb*
*|   DTC     
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/dts/inmate-hikey.dtb*
*|   DTC     
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/dts/inmate-imx8mm-evk.dtb*
*|   DTC     
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/dts/inmate-imx8mn-ddr4-evk.dtb*
*|   DTC     
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/dts/inmate-imx8mp-evk.dtb*
*|   DTC     
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/dts/inmate-imx8mq-evk.dtb*
*|   DTC     
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/dts/inmate-jetson-tx1.dtb*
*|   DTC     
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/dts/inmate-k3-am654-idk.dtb*
*|   DTC     
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/dts/inmate-k3-j721e-evm.dtb*
*|   DTC     
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/dts/inmate-macchiatobin.dtb*
*|   DTC     
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/dts/inmate-miriac-sbc-ls1046a.dtb*
*|   DTC     
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/dts/inmate-pine64-plus.dtb*
*|   DTC     
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/dts/inmate-qemu-arm64.dtb*
*|   DTC     
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/dts/inmate-rpi4.dtb*
*|   DTC     
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/dts/inmate-zynqmp-zcu102-2.dtb*
*|   DTC     
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/dts/inmate-zynqmp.dtb*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/amd-seattle-inmate-demo.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/amd-seattle-linux-demo.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/amd-seattle.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/espressobin-inmate-demo.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/espressobin-linux-demo.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/espressobin.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/foundation-v8-inmate-demo.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/foundation-v8-linux-demo.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/foundation-v8.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/hikey-inmate-demo.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/hikey-linux-demo.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/hikey.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/imx8mm-inmate-demo.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/imx8mm-linux-demo.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/imx8mm.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/imx8mn-inmate-demo.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/imx8mn-linux-demo.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/imx8mn.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/imx8mp-inmate-demo.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/imx8mp-linux-demo.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/imx8mp.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/imx8mq-inmate-demo.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/imx8mq-linux-demo.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/imx8mq.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/jetson-tx1-inmate-demo.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/jetson-tx1-linux-demo.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/jetson-tx1.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/jetson-tx2-inmate-demo.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/jetson-tx2.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/k3-am654-idk-linux-demo.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/k3-am654-idk.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/k3-am654-inmate-demo.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/k3-j721e-evm-inmate-demo.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/k3-j721e-evm-linux-demo.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/k3-j721e-evm.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/macchiatobin-inmate-demo.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/macchiatobin-linux-demo.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/macchiatobin.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/miriac-sbc-ls1046a-inmate-demo.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/miriac-sbc-ls1046a-linux-demo.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/miriac-sbc-ls1046a.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/pine64-plus-inmate-demo.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/pine64-plus-linux-demo.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/pine64-plus.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/qemu-agl.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/qemu-arm64-inmate-demo.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/qemu-arm64-linux-demo.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/qemu-arm64.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/rpi4-inmate-demo.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/rpi4-linux-demo.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/rpi4.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/ultra96-inmate-demo.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/ultra96-linux-demo.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/ultra96.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/zynqmp-zcu102-linux-demo-2.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/zynqmp-zcu102-inmate-demo.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/zynqmp-zcu102-linux-demo.cell*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/zynqmp-zcu102.cell*
*|   AR     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/lib.a*
*|   LD     
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/hypervisor.o*
*|   OBJCOPY 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/jailhouse.bin*
*| make[2]: 
*** [/home/vipulkumar/platform/AGL_lamprey/build/tmp/work-shared/imx8mqevk/kernel-source/Makefile:1734: 
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git] Error 
2*
*| make[1]: 
*** [/home/vipulkumar/platform/AGL_lamprey/build/tmp/work-shared/imx8mqevk/kernel-source/Makefile:179: 
sub-make] Error 2*
*| make: *** [Makefile:40: modules] Error 2*
*| ERROR: oe_runmake failed*
*| WARNING: exit code 1 from a shell command.*
*| ERROR: Execution of 
'/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/temp/run.do_compile.14389' 
failed with exit code 1*
*ERROR: Task 
(/home/vipulkumar/platform/AGL_lamprey/meta-agl-devel/meta-agl-jailhouse/recipes-extended/jailhouse/jailhouse_git.bb:do_compile) 
failed with exit code '1'*
*NOTE: Tasks Summary: Attempted 10846 tasks of which 10819 didn't need to 
be rerun and 1 failed.*

*Summary: 1 task failed:*
  
*/home/vipulkumar/platform/AGL_lamprey/meta-agl-devel/meta-agl-jailhouse/recipes-extended/jailhouse/jailhouse_git.bb:do_compile*
*Summary: There were 2 ERROR messages shown, returning a non-zero exit 
code.*

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ab9f5a7b-d479-44a1-8ae6-a2ad564fe1b1n%40googlegroups.com.

------=_Part_635_162105136.1652253382374
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All,<div><br></div><div>I am building jailhouse 0.12 on kernel 5.4.147 i=
.MX8, but its failing with below logs. I could successfully build jailhouse=
 0.11 on the same kernel. Any suggestions on this, does 0.12 version suppor=
t i.MX8?</div><div><br></div><div>&nbsp;<em><b>vipulkumar@A812DBLR:~/platfo=
rm/AGL_lamprey/build$ bitbake -k agl-demo-platform</b></em></div><p><em><b>=
Loading cache: 100% |######################################################=
###########################################################################=
####| Time: 0:00:01</b></em><br><em><b>Loaded 4682 entries from dependency =
cache.</b></em><br><em><b>Parsing recipes: 100% |##########################=
###########################################################################=
##############################| Time: 0:00:02</b></em><br><em><b>Parsing of=
 3146 .bb files complete (3145 cached, 1 parsed). 4683 targets, 405 skipped=
, 10 masked, 0 errors.</b></em><br><em><b>NOTE: Resolving any missing task =
queue dependencies</b></em></p><p><em><b>Build Configuration:</b></em><br><=
em><b>BB_VERSION &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D "1.46.0"</b></em><b=
r><em><b>BUILD_SYS &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D "x86_64-lin=
ux"</b></em><br><em><b>NATIVELSBSTRING &nbsp; &nbsp; &nbsp;=3D "universal"<=
/b></em><br><em><b>TARGET_SYS &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D "aarch=
64-agl-linux"</b></em><br><em><b>MACHINE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;=3D "imx8mqevk"</b></em><br><em><b>DISTRO &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; =3D "poky-agl"</b></em><br><em><b>DISTRO_VERS=
ION &nbsp; &nbsp; &nbsp; =3D "12.1.2"</b></em><br><em><b>TUNE_FEATURES &nbs=
p; &nbsp; &nbsp; &nbsp;=3D "aarch64"</b></em><br><em><b>TARGET_FPU &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; =3D ""</b></em><br><em><b>meta-pipewire</b></em>=
&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;<br><em><b>meta-netboot &nbsp; &nbsp; &nbs=
p; &nbsp; =3D "HEAD:825a674a08bb6478f93065d6f1823ae52ccaa0ff"</b></em><br><=
em><b>meta-security &nbsp; &nbsp; &nbsp; &nbsp;=3D "HEAD:b76698c788cb8ca632=
077a972031899ef15025d6"</b></em><br><em><b>meta-perl &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;=3D "HEAD:0722ff6f021df91542b5efa1ff5b5f6269f66add"</b><=
/em><br><em><b>meta-app-framework &nbsp; =3D "HEAD:825a674a08bb6478f93065d6=
f1823ae52ccaa0ff"</b></em><br><em><b>meta-speech-framework =3D "HEAD:c00857=
60179255579ffac8faa6cd5d216b8a3384"</b></em><br><em><b>meta-aac &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; =3D "HEAD:e1564482a33648bede36740796c8d69ae3=
c6f7fb"</b></em><br><em><b>meta-arm-toolchain &nbsp; =3D "HEAD:c4f04f3fb66f=
8f4365b08b553af8206372e90a63"</b></em><br><em><b>meta-agl-jailhouse &nbsp; =
=3D "HEAD:c0085760179255579ffac8faa6cd5d216b8a3384"</b></em><br><em><b>meta=
-arm &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D "HEAD:c4f04f3fb66f8f4365=
b08b553af8206372e90a63"</b></em><br><em><b>meta-iot-cloud &nbsp; &nbsp; &nb=
sp; =3D "HEAD:5431f91969087d631972d73cd03b16eed0a61987"</b></em><br><em><b>=
meta-qt5 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D "HEAD:b4d24d70aca757=
91902df5cd59a4f4a54aa4a125"</b></em><br><em><b>meta-python2 &nbsp; &nbsp; &=
nbsp; &nbsp; =3D "HEAD:b901080cf57d9a7f5476ab4d96e56c30db8170a8"</b></em><b=
r><em><b>meta-agl-demo &nbsp; &nbsp; &nbsp; &nbsp;=3D "HEAD:12ad591d3038db6=
09db5290d8bbe809a34c743de"</b></em><br><em><b>meta-freescale &nbsp; &nbsp; =
&nbsp; =3D "HEAD:a6199966375875fdfc295e6687c86a83fb53bf04"</b></em><br><em>=
<b>meta-networking</b></em>&nbsp;&nbsp; &nbsp; &nbsp;<br><em><b>meta-python=
</b></em>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br><em><b>meta-filesystem=
s</b></em>&nbsp;&nbsp; &nbsp;&nbsp;<br><em><b>meta-oe &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;=3D "HEAD:0722ff6f021df91542b5efa1ff5b5f6269f66a=
dd"</b></em><br><em><b>meta-agl-core</b></em>&nbsp;&nbsp; &nbsp; &nbsp; &nb=
sp;<br><em><b>meta-agl-core-test</b></em>&nbsp;&nbsp;&nbsp;<br><em><b>meta-=
agl-bsp &nbsp; &nbsp; &nbsp; &nbsp; =3D "HEAD:825a674a08bb6478f93065d6f1823=
ae52ccaa0ff"</b></em><br><em><b>meta</b></em>&nbsp;&nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br><em><b>meta-poky &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;=3D "HEAD:3ec873af83c7b09468605d8aadd0933aecbdb56d"=
</b></em></p><p><em><b>Initialising tasks: 100% |##########################=
###########################################################################=
###########################| Time: 0:00:06</b></em><br><em><b>Sstate summar=
y: Wanted 27 Found 0 Missed 27 Current 4574 (0% match, 99% complete)</b></e=
m><br><em><b>NOTE: Executing Tasks</b></em><br><em><b>ERROR: jailhouse-0.12=
+gitAUTOINC+4ce7658ddd-r0 do_compile: oe_runmake failed</b></em><br><em><b>=
ERROR: jailhouse-0.12+gitAUTOINC+4ce7658ddd-r0 do_compile: Execution of '/h=
ome/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jail=
house/0.12+gitAUTOINC+4ce7658ddd-r0/temp/run.do_compile.14389' failed with =
exit code 1</b></em><br><em><b>ERROR: Logfile of failure stored in: /home/v=
ipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse=
/0.12+gitAUTOINC+4ce7658ddd-r0/temp/log.do_compile.14389</b></em><br><em><b=
>Log data follows:</b></em><br><em><b>| DEBUG: Executing shell function do_=
compile</b></em><br><em><b>| NOTE: make&nbsp;j 8 ARCH=3Darm64 CROSS_COMPILE=
=3Daarch64-agl-linux&nbsp;CC=3Daarch64-agl-linux-gcc &nbsp;-fstack-protecto=
r-strong &nbsp;-D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Df=
ormat-security --sysroot=3D/home/vipulkumar/platform/AGL_lamprey/build/tmp/=
work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/recipe-sys=
root KDIR=3D/home/vipulkumar/platform/AGL_lamprey/build/tmp/work-shared/imx=
8mqevk/kernel-build-artifacts</b></em><br><em><b>| &nbsp; GEN &nbsp; &nbsp;=
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/j=
ailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/pyjailhouse/pci_defs.py</b></em>=
<br><em><b>| &nbsp; UPD &nbsp; &nbsp; /home/vipulkumar/platform/AGL_lamprey=
/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0=
/git/hypervisor/include/generated/config.mk</b></em><br><em><b>| &nbsp; UPD=
 &nbsp; &nbsp; /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqe=
vk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/include=
/generated/version.h</b></em><br><em><b>| &nbsp; CC&nbsp;[M]&nbsp;&nbsp;/ho=
me/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailh=
ouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver/cell.o</b></em><br><em><b>| &=
nbsp; CC&nbsp;[M]&nbsp;&nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tm=
p/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/driv=
er/main.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkum=
ar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+g=
itAUTOINC+4ce7658ddd-r0/git/inmates/lib/arm64/../arm-common/../alloc.o</b><=
/em><br><em><b>| &nbsp; CC&nbsp;[M]&nbsp;&nbsp;/home/vipulkumar/platform/AG=
L_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7=
658ddd-r0/git/driver/sysfs.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &=
nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-lin=
ux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/lib/arm64/../arm-com=
mon/../cmdline.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/v=
ipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse=
/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/amd-seattle-inmate-demo.o<=
/b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platfor=
m/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+=
4ce7658ddd-r0/git/hypervisor/arch/arm64/asm-defines.s</b></em><br><em><b>| =
&nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/build/t=
mp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inm=
ates/lib/arm64/../arm-common/../pci.o</b></em><br><em><b>| &nbsp; LDS &nbsp=
; &nbsp; /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl=
-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/hypervisor.ld=
s</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platf=
orm/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOIN=
C+4ce7658ddd-r0/git/configs/arm64/amd-seattle-linux-demo.o</b></em><br><em>=
<b>| WARNING: Could not create the helper script to generate configurations=
 on remote machines ("jailhouse-conf-collect"). You need Python and the Mak=
o library for it.</b></em><br><em><b>| &nbsp; GEN &nbsp; &nbsp; /home/vipul=
kumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.1=
2+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/include/generated/asm/=
asm-defines.h</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipu=
lkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.=
12+gitAUTOINC+4ce7658ddd-r0/git/tools/jailhouse.o</b></em><br><em><b>| &nbs=
p; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/w=
ork/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervi=
sor/setup.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulk=
umar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12=
+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/printk.o</b></em><br><em><b>| &nbs=
p; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/w=
ork/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs=
/arm64/amd-seattle.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/ho=
me/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailh=
ouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/espressobin-inmate-dem=
o.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/pla=
tform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTO=
INC+4ce7658ddd-r0/git/inmates/lib/arm64/../arm-common/../printk.o</b></em><=
br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lam=
prey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658dd=
d-r0/git/configs/arm64/espressobin-linux-demo.o</b></em><br><em><b>| &nbsp;=
 CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/wor=
k/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/l=
ib/arm64/../arm-common/../setup.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nb=
sp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-ag=
l-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/paging.o</b>=
</em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/A=
GL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce=
7658ddd-r0/git/configs/arm64/espressobin.o</b></em><br><em><b>| /home/vipul=
kumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.1=
2+gitAUTOINC+4ce7658ddd-r0/git/driver/main.c:88:21: error: conflicting type=
s for '</b></em><b><em>hyp_stub_vectors'</em></b><br><em><b>| &nbsp; &nbsp;=
88 | extern unsigned int __hyp_stub_vectors[];</b></em><br><em><b>| &nbsp; =
&nbsp; &nbsp; | &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; ^~~~~~~~~~~~~~~~~~</b></em><br><em><b>| In file included from /h=
ome/vipulkumar/platform/AGL_lamprey/build/tmp/work-shared/imx8mqevk/kernel-=
source/arch/arm64/include/asm/hw_breakpoint.h:11,</b></em><br><em><b>| &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from /home/vipulk=
umar/platform/AGL_lamprey/build/tmp/work-shared/imx8mqevk/kernel-source/arc=
h/arm64/include/asm/processor.h:32,</b></em><br><em><b>| &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from /home/vipulkumar/platform/=
AGL_lamprey/build/tmp/work-shared/imx8mqevk/kernel-source/include/asm-gener=
ic/qrwlock.h:14,</b></em><br><em><b>| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;from ./arch/arm64/include/generated/asm/qrwlock.h:=
1,</b></em><br><em><b>| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;from /home/vipulkumar/platform/AGL_lamprey/build/tmp/work-shared=
/imx8mqevk/kernel-source/arch/arm64/include/asm/spinlock.h:8,</b></em><br><=
em><b>| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from =
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work-shared/imx8mqevk/kerne=
l-source/include/linux/spinlock.h:89,</b></em><br><em><b>| &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from /home/vipulkumar/platfor=
m/AGL_lamprey/build/tmp/work-shared/imx8mqevk/kernel-source/include/linux/s=
eqlock.h:36,</b></em><br><em><b>| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;from /home/vipulkumar/platform/AGL_lamprey/build/tmp/w=
ork-shared/imx8mqevk/kernel-source/include/linux/time.h:6,</b></em><br><em>=
<b>| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from /ho=
me/vipulkumar/platform/AGL_lamprey/build/tmp/work-shared/imx8mqevk/kernel-s=
ource/arch/arm64/include/asm/stat.h:12,</b></em><br><em><b>| &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from /home/vipulkumar/platf=
orm/AGL_lamprey/build/tmp/work-shared/imx8mqevk/kernel-source/include/linux=
/stat.h:6,</b></em><br><em><b>| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;from /home/vipulkumar/platform/AGL_lamprey/build/tmp/wor=
k-shared/imx8mqevk/kernel-source/include/linux/module.h:10,</b></em><br><em=
><b>| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from /h=
ome/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jail=
house/0.12+gitAUTOINC+4ce7658ddd-r0/git/driver/main.c:19:</b></em><br><em><=
b>| /home/vipulkumar/platform/AGL_lamprey/build/tmp/work-shared/imx8mqevk/k=
ernel-source/arch/arm64/include/asm/virt.h:65:13: note: previous declaratio=
n of '</b></em><b><em>hyp_stub_vectors' was here</em></b><br><em><b>| &nbsp=
; &nbsp;65 | extern char __hyp_stub_vectors[];</b></em><br><em><b>| &nbsp; =
&nbsp; &nbsp; | &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ^~~~~~~~~~~~~~~~~=
~</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platf=
orm/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOIN=
C+4ce7658ddd-r0/git/configs/arm64/foundation-v8-inmate-demo.o</b></em><br><=
em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey=
/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0=
/git/inmates/lib/arm64/../arm-common/../string.o</b></em><br><em><b>| make[=
4]: ***&nbsp;[/home/vipulkumar/platform/AGL_lamprey/build/tmp/work-shared/i=
mx8mqevk/kernel-source/scripts/Makefile.build:262: /home/vipulkumar/platfor=
m/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+=
4ce7658ddd-r0/git/driver/main.o]&nbsp;Error 1</b></em><br><em><b>| make[4]:=
 *** Waiting for unfinished jobs....</b></em><br><em><b>| &nbsp; CC &nbsp; =
&nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk=
-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/lib/arm64/..=
/arm-common/../uart-8250.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nb=
sp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux=
/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/foundation-v8-li=
nux-demo.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulku=
mar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+=
gitAUTOINC+4ce7658ddd-r0/git/tools/ivshmem-demo.o</b></em><br><em><b>| &nbs=
p; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/w=
ork/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates=
/lib/arm64/../arm-common/gic-v2.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nb=
sp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-ag=
l-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/lib/arm64/../ar=
m-common/gic-v3.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/=
vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhous=
e/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/foundation-v8.o</b></em><=
br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lam=
prey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658dd=
d-r0/git/inmates/lib/arm64/../arm-common/gic.o</b></em><br><em><b>| &nbsp; =
CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/work=
/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/ar=
m64/hikey-inmate-demo.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;=
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/ja=
ilhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/hikey-linux-demo.o<=
/b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platfor=
m/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+=
4ce7658ddd-r0/git/configs/arm64/hikey.o</b></em><br><em><b>| &nbsp; CC &nbs=
p; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mq=
evk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/tools/jailhouse-g=
cov-extract.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipu=
lkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.=
12+gitAUTOINC+4ce7658ddd-r0/git/inmates/lib/arm64/../arm-common/mem.o</b></=
em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL=
_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce76=
58ddd-r0/git/hypervisor/control.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nb=
sp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-ag=
l-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/imx8mm-in=
mate-demo.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulk=
umar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12=
+gitAUTOINC+4ce7658ddd-r0/git/inmates/lib/arm64/../arm-common/pci.o</b></em=
><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_l=
amprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658=
ddd-r0/git/configs/arm64/imx8mm-linux-demo.o</b></em><br><em><b>| &nbsp; CC=
 &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/i=
mx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm6=
4/imx8mm.o</b></em><br><em><b>| &nbsp; GEN &nbsp; &nbsp; /home/vipulkumar/p=
latform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAU=
TOINC+4ce7658ddd-r0/git/tools/jailhouse.8</b></em><br><em><b>| &nbsp; CC &n=
bsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8=
mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/lib/arm=
64/../arm-common/printk.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbs=
p;/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/=
jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/lib.o</b></em><br><e=
m><b>| &nbsp; GEN &nbsp; &nbsp; /home/vipulkumar/platform/AGL_lamprey/build=
/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/t=
ools/jailhouse-cell.8</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/h=
ome/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jail=
house/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/mmio.o</b></em><br><em><=
b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/bui=
ld/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git=
/configs/arm64/imx8mn-inmate-demo.o</b></em><br><em><b>| &nbsp; CC &nbsp; &=
nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-=
agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/imx8mn-=
linux-demo.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipul=
kumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.1=
2+gitAUTOINC+4ce7658ddd-r0/git/inmates/lib/arm64/../arm-common/setup.o</b><=
/em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AG=
L_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7=
658ddd-r0/git/inmates/lib/arm64/../arm-common/timing.o</b></em><br><em><b>|=
 &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/build/=
tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/in=
mates/lib/arm64/../arm-common/uart-hscif.o</b></em><br><em><b>| &nbsp; GEN =
&nbsp; &nbsp; /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqev=
k-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/tools/jailhouse-ena=
ble.8</b></em><br><em><b>| &nbsp; LD &nbsp; &nbsp; &nbsp;/home/vipulkumar/p=
latform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAU=
TOINC+4ce7658ddd-r0/git/tools/jailhouse</b></em><br><em><b>| make[3]: ***&n=
bsp;[/home/vipulkumar/platform/AGL_lamprey/build/tmp/work-shared/imx8mqevk/=
kernel-source/scripts/Makefile.build:497: /home/vipulkumar/platform/AGL_lam=
prey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658dd=
d-r0/git/driver]&nbsp;Error 2</b></em><br><em><b>| make[3]: *** Waiting for=
 unfinished jobs....</b></em><br><em><b>| &nbsp; LD &nbsp; &nbsp; &nbsp;/ho=
me/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailh=
ouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/tools/ivshmem-demo</b></em><br><em><=
b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/bui=
ld/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git=
/configs/arm64/imx8mn.o</b></em><br><em><b>| &nbsp; LD &nbsp; &nbsp; &nbsp;=
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/ja=
ilhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/tools/jailhouse-gcov-extract</b><=
/em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AG=
L_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7=
658ddd-r0/git/inmates/lib/arm64/../arm-common/uart-imx.o</b></em><br><em><b=
>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/buil=
d/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/=
inmates/lib/arm64/../arm-common/uart-mvebu.o</b></em><br><em><b>| &nbsp; CC=
 &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/i=
mx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm6=
4/imx8mp-inmate-demo.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/=
home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jai=
lhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/imx8mp-linux-demo.o<=
/b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platfor=
m/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+=
4ce7658ddd-r0/git/inmates/lib/arm64/../arm-common/uart-pl011.o</b></em><br>=
<em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lampre=
y/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r=
0/git/configs/arm64/imx8mp.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &=
nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-lin=
ux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/pci.o</b></em><br=
><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lampr=
ey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-=
r0/git/inmates/lib/arm64/../arm-common/uart-scifa.o</b></em><br><em><b>| &n=
bsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tmp=
/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/confi=
gs/arm64/imx8mq-inmate-demo.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; =
&nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-li=
nux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/imx8mq-linux-=
demo.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/=
platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitA=
UTOINC+4ce7658ddd-r0/git/hypervisor/ivshmem.o</b></em><br><em><b>| &nbsp; C=
C &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/=
imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/lib=
/arm64/../arm-common/uart-xuartps.o</b></em><br><em><b>| &nbsp; CC &nbsp; &=
nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-=
agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/lib/arm64/../=
arm-common/uart.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/=
vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhous=
e/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/imx8mq.o</b></em><br><em>=
<b>| &nbsp; AS &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/bu=
ild/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/gi=
t/inmates/lib/arm64/header.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &=
nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-lin=
ux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/jetson-tx1-inm=
ate-demo.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulku=
mar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+=
gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/jetson-tx1-linux-demo.o</b></em>=
<br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_la=
mprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658d=
dd-r0/git/configs/arm64/jetson-tx1.o</b></em><br><em><b>| &nbsp; LDS &nbsp;=
 &nbsp; /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-=
linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/lib/arm64/inmate.=
lds</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/pla=
tform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTO=
INC+4ce7658ddd-r0/git/hypervisor/uart.o</b></em><br><em><b>| &nbsp; CC &nbs=
p; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mq=
evk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/jet=
son-tx2-inmate-demo.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/h=
ome/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jail=
house/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/jetson-tx2.o</b></em>=
<br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_la=
mprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658d=
dd-r0/git/hypervisor/uart-8250.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbs=
p; &nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl=
-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/k3-am654-i=
dk-linux-demo.o</b></em><br><em><b>| &nbsp; AR &nbsp; &nbsp; &nbsp;/home/vi=
pulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/=
0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/lib/arm64/lib.a</b></em><br><em><=
b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/bui=
ld/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git=
/inmates/demos/arm64/../arm/gic-demo.o</b></em><br><em><b>| &nbsp; CC &nbsp=
; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqe=
vk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/k3-a=
m654-idk.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulku=
mar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+=
gitAUTOINC+4ce7658ddd-r0/git/inmates/demos/arm64/../arm/uart-demo.o</b></em=
><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_l=
amprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658=
ddd-r0/git/configs/arm64/k3-am654-inmate-demo.o</b></em><br><em><b>| &nbsp;=
 CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/wor=
k/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hyperviso=
r/arch/arm64/../arm-common/control.o</b></em><br><em><b>| &nbsp; CC &nbsp; =
&nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk=
-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/demos/arm64/=
../ivshmem-demo.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/=
vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhous=
e/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/tools/arm64/linux-loader.o</b><=
/em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AG=
L_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7=
658ddd-r0/git/hypervisor/arch/arm64/../arm-common/dbg-write.o</b></em><br><=
em><b>| &nbsp; LD &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey=
/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0=
/git/inmates/demos/arm64/gic-demo-linked.o</b></em><br><em><b>| &nbsp; LD &=
nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx=
8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/demos/=
arm64/uart-demo-linked.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp=
;/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/j=
ailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/k3-j721e-evm-inmat=
e-demo.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkuma=
r/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gi=
tAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/../arm-common/gic-v2.o</b>=
</em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/A=
GL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce=
7658ddd-r0/git/hypervisor/arch/arm64/../arm-common/gic-v3.o</b></em><br><em=
><b>| &nbsp; LD &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/b=
uild/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/g=
it/inmates/tools/arm64/linux-loader-linked.o</b></em><br><em><b>| &nbsp; OB=
JCOPY /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-li=
nux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/tools/arm64/linux-l=
oader.bin</b></em><br><em><b>| &nbsp; OBJCOPY /home/vipulkumar/platform/AGL=
_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce76=
58ddd-r0/git/inmates/demos/arm64/gic-demo.bin</b></em><br><em><b>| &nbsp; O=
BJCOPY /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-l=
inux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/inmates/demos/arm64/uart-d=
emo.bin</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar=
/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+git=
AUTOINC+4ce7658ddd-r0/git/configs/arm64/k3-j721e-evm-linux-demo.o</b></em><=
br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lam=
prey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658dd=
d-r0/git/hypervisor/arch/arm64/../arm-common/irqchip.o</b></em><br><em><b>|=
 &nbsp; LD &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/build/=
tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/in=
mates/demos/arm64/ivshmem-demo-linked.o</b></em><br><em><b>| &nbsp; CC &nbs=
p; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mq=
evk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/k3-=
j721e-evm.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulk=
umar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12=
+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/../arm-common/ivshmem.o=
</b></em><br><em><b>| &nbsp; OBJCOPY /home/vipulkumar/platform/AGL_lamprey/=
build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/=
git/inmates/demos/arm64/ivshmem-demo.bin</b></em><br><em><b>| &nbsp; CC &nb=
sp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8m=
qevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/=
arm64/../arm-common/lib.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbs=
p;/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/=
jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/macchiatobin-inma=
te-demo.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkum=
ar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+g=
itAUTOINC+4ce7658ddd-r0/git/configs/arm64/macchiatobin-linux-demo.o</b></em=
><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_l=
amprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658=
ddd-r0/git/hypervisor/arch/arm64/../arm-common/mmu_cell.o</b></em><br><em><=
b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/bui=
ld/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git=
/configs/arm64/macchiatobin.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; =
&nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-li=
nux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/../ar=
m-common/paging.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/=
vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhous=
e/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/miriac-sbc-ls1046a-inmate=
-demo.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar=
/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+git=
AUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/../arm-common/pci.o</b></em=
><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_l=
amprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658=
ddd-r0/git/configs/arm64/miriac-sbc-ls1046a-linux-demo.o</b></em><br><em><b=
>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/buil=
d/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/=
configs/arm64/miriac-sbc-ls1046a.o</b></em><br><em><b>| &nbsp; CC &nbsp; &n=
bsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-a=
gl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/pine64-p=
lus-inmate-demo.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/=
vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhous=
e/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/pine64-plus.o</b></em><br=
><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lampr=
ey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-=
r0/git/configs/arm64/pine64-plus-linux-demo.o</b></em><br><em><b>| &nbsp; C=
C &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/=
imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/=
arch/arm64/../arm-common/setup.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbs=
p; &nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl=
-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/..=
/arm-common/psci.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home=
/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhou=
se/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/qemu-agl.o</b></em><br><=
em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey=
/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0=
/git/configs/arm64/qemu-arm64-inmate-demo.o</b></em><br><em><b>| &nbsp; CC =
&nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/im=
x8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/ar=
ch/arm64/../arm-common/smccc.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp;=
 &nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-l=
inux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/../a=
rm-common/uart-hscif.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/=
home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jai=
lhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/../arm-commo=
n/uart-imx.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipul=
kumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.1=
2+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/../arm-common/uart-mve=
bu.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/pl=
atform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUT=
OINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/../arm-common/uart-pl011.o</b>=
</em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/A=
GL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce=
7658ddd-r0/git/configs/arm64/qemu-arm64-linux-demo.o</b></em><br><em><b>| &=
nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tm=
p/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/conf=
igs/arm64/qemu-arm64.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/=
home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jai=
lhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/rpi4-inmate-demo.o</=
b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform=
/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4=
ce7658ddd-r0/git/configs/arm64/rpi4-linux-demo.o</b></em><br><em><b>| &nbsp=
; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/wo=
rk/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/=
arm64/rpi4.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipul=
kumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.1=
2+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/../arm-common/uart-sci=
fa.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/pl=
atform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUT=
OINC+4ce7658ddd-r0/git/configs/arm64/ultra96-inmate-demo.o</b></em><br><em>=
<b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/bu=
ild/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/gi=
t/hypervisor/arch/arm64/../arm-common/uart-xuartps.o</b></em><br><em><b>| &=
nbsp; AS &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tm=
p/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hype=
rvisor/arch/arm64/caches.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nb=
sp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux=
/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/control.=
o</b></em><br><em><b>| &nbsp; AS &nbsp; &nbsp; &nbsp;/home/vipulkumar/platf=
orm/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOIN=
C+4ce7658ddd-r0/git/hypervisor/arch/arm64/entry.o</b></em><br><em><b>| &nbs=
p; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/w=
ork/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs=
/arm64/ultra96-linux-demo.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &n=
bsp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linu=
x/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/iommu.o=
</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platfo=
rm/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC=
+4ce7658ddd-r0/git/configs/arm64/ultra96.o</b></em><br><em><b>| &nbsp; CC &=
nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx=
8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/=
zynqmp-zcu102-inmate-demo.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &n=
bsp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linu=
x/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/zynqmp-zcu102-l=
inux-demo-2.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipu=
lkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.=
12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/mmio.o</b></em><br><e=
m><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/=
build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/=
git/configs/arm64/zynqmp-zcu102-linux-demo.o</b></em><br><em><b>| &nbsp; CC=
 &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/i=
mx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/a=
rch/arm64/paging.o</b></em><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home=
/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhou=
se/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/zynqmp-zcu102.o</b></em>=
<br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_la=
mprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658d=
dd-r0/git/hypervisor/arch/arm64/setup.o</b></em><br><em><b>| &nbsp; CC &nbs=
p; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mq=
evk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/a=
rm64/smmu-v3.o</b></em><br><em><b>| &nbsp; DTC &nbsp; &nbsp; /home/vipulkum=
ar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+g=
itAUTOINC+4ce7658ddd-r0/git/configs/arm64/dts/inmate-amd-seattle.dtb</b></e=
m><br><em><b>| &nbsp; CC &nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_=
lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce765=
8ddd-r0/git/hypervisor/arch/arm64/ti-pvu.o</b></em><br><em><b>| &nbsp; CC &=
nbsp; &nbsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx=
8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arc=
h/arm64/traps.o</b></em><br><em><b>| &nbsp; DTC &nbsp; &nbsp; /home/vipulku=
mar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+=
gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/dts/inmate-espressobin.dtb</b></=
em><br><em><b>| &nbsp; DTC &nbsp; &nbsp; /home/vipulkumar/platform/AGL_lamp=
rey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd=
-r0/git/configs/arm64/dts/inmate-foundation-v8.dtb</b></em><br><em><b>| &nb=
sp; DTC &nbsp; &nbsp; /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/=
imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm=
64/dts/inmate-hikey.dtb</b></em><br><em><b>| &nbsp; DTC &nbsp; &nbsp; /home=
/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhou=
se/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/dts/inmate-imx8mm-evk.dt=
b</b></em><br><em><b>| &nbsp; DTC &nbsp; &nbsp; /home/vipulkumar/platform/A=
GL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce=
7658ddd-r0/git/configs/arm64/dts/inmate-imx8mn-ddr4-evk.dtb</b></em><br><em=
><b>| &nbsp; DTC &nbsp; &nbsp; /home/vipulkumar/platform/AGL_lamprey/build/=
tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/co=
nfigs/arm64/dts/inmate-imx8mp-evk.dtb</b></em><br><em><b>| &nbsp; DTC &nbsp=
; &nbsp; /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl=
-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/dts/inmate=
-imx8mq-evk.dtb</b></em><br><em><b>| &nbsp; DTC &nbsp; &nbsp; /home/vipulku=
mar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+=
gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/dts/inmate-jetson-tx1.dtb</b></e=
m><br><em><b>| &nbsp; DTC &nbsp; &nbsp; /home/vipulkumar/platform/AGL_lampr=
ey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-=
r0/git/configs/arm64/dts/inmate-k3-am654-idk.dtb</b></em><br><em><b>| &nbsp=
; DTC &nbsp; &nbsp; /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/im=
x8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64=
/dts/inmate-k3-j721e-evm.dtb</b></em><br><em><b>| &nbsp; DTC &nbsp; &nbsp; =
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/ja=
ilhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/dts/inmate-macchiat=
obin.dtb</b></em><br><em><b>| &nbsp; DTC &nbsp; &nbsp; /home/vipulkumar/pla=
tform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTO=
INC+4ce7658ddd-r0/git/configs/arm64/dts/inmate-miriac-sbc-ls1046a.dtb</b></=
em><br><em><b>| &nbsp; DTC &nbsp; &nbsp; /home/vipulkumar/platform/AGL_lamp=
rey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd=
-r0/git/configs/arm64/dts/inmate-pine64-plus.dtb</b></em><br><em><b>| &nbsp=
; DTC &nbsp; &nbsp; /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/im=
x8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64=
/dts/inmate-qemu-arm64.dtb</b></em><br><em><b>| &nbsp; DTC &nbsp; &nbsp; /h=
ome/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jail=
house/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/dts/inmate-rpi4.dtb</=
b></em><br><em><b>| &nbsp; DTC &nbsp; &nbsp; /home/vipulkumar/platform/AGL_=
lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce765=
8ddd-r0/git/configs/arm64/dts/inmate-zynqmp-zcu102-2.dtb</b></em><br><em><b=
>| &nbsp; DTC &nbsp; &nbsp; /home/vipulkumar/platform/AGL_lamprey/build/tmp=
/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/confi=
gs/arm64/dts/inmate-zynqmp.dtb</b></em><br><em><b>| &nbsp; OBJCOPY /home/vi=
pulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/=
0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/amd-seattle-inmate-demo.cel=
l</b></em><br><em><b>| &nbsp; OBJCOPY /home/vipulkumar/platform/AGL_lamprey=
/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0=
/git/configs/arm64/amd-seattle-linux-demo.cell</b></em><br><em><b>| &nbsp; =
OBJCOPY /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-=
linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/amd-seattle=
.cell</b></em><br><em><b>| &nbsp; OBJCOPY /home/vipulkumar/platform/AGL_lam=
prey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658dd=
d-r0/git/configs/arm64/espressobin-inmate-demo.cell</b></em><br><em><b>| &n=
bsp; OBJCOPY /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk=
-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/espres=
sobin-linux-demo.cell</b></em><br><em><b>| &nbsp; OBJCOPY /home/vipulkumar/=
platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitA=
UTOINC+4ce7658ddd-r0/git/configs/arm64/espressobin.cell</b></em><br><em><b>=
| &nbsp; OBJCOPY /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8m=
qevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/fo=
undation-v8-inmate-demo.cell</b></em><br><em><b>| &nbsp; OBJCOPY /home/vipu=
lkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.=
12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/foundation-v8-linux-demo.cell=
</b></em><br><em><b>| &nbsp; OBJCOPY /home/vipulkumar/platform/AGL_lamprey/=
build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/=
git/configs/arm64/foundation-v8.cell</b></em><br><em><b>| &nbsp; OBJCOPY /h=
ome/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jail=
house/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/hikey-inmate-demo.cel=
l</b></em><br><em><b>| &nbsp; OBJCOPY /home/vipulkumar/platform/AGL_lamprey=
/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0=
/git/configs/arm64/hikey-linux-demo.cell</b></em><br><em><b>| &nbsp; OBJCOP=
Y /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/=
jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/hikey.cell</b></e=
m><br><em><b>| &nbsp; OBJCOPY /home/vipulkumar/platform/AGL_lamprey/build/t=
mp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/con=
figs/arm64/imx8mm-inmate-demo.cell</b></em><br><em><b>| &nbsp; OBJCOPY /hom=
e/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailho=
use/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/imx8mm-linux-demo.cell<=
/b></em><br><em><b>| &nbsp; OBJCOPY /home/vipulkumar/platform/AGL_lamprey/b=
uild/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/g=
it/configs/arm64/imx8mm.cell</b></em><br><em><b>| &nbsp; OBJCOPY /home/vipu=
lkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.=
12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/imx8mn-inmate-demo.cell</b></=
em><br><em><b>| &nbsp; OBJCOPY /home/vipulkumar/platform/AGL_lamprey/build/=
tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/co=
nfigs/arm64/imx8mn-linux-demo.cell</b></em><br><em><b>| &nbsp; OBJCOPY /hom=
e/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailho=
use/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/imx8mn.cell</b></em><br=
><em><b>| &nbsp; OBJCOPY /home/vipulkumar/platform/AGL_lamprey/build/tmp/wo=
rk/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/=
arm64/imx8mp-inmate-demo.cell</b></em><br><em><b>| &nbsp; OBJCOPY /home/vip=
ulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0=
.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/imx8mp-linux-demo.cell</b></=
em><br><em><b>| &nbsp; OBJCOPY /home/vipulkumar/platform/AGL_lamprey/build/=
tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/co=
nfigs/arm64/imx8mp.cell</b></em><br><em><b>| &nbsp; OBJCOPY /home/vipulkuma=
r/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gi=
tAUTOINC+4ce7658ddd-r0/git/configs/arm64/imx8mq-inmate-demo.cell</b></em><b=
r><em><b>| &nbsp; OBJCOPY /home/vipulkumar/platform/AGL_lamprey/build/tmp/w=
ork/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs=
/arm64/imx8mq-linux-demo.cell</b></em><br><em><b>| &nbsp; OBJCOPY /home/vip=
ulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0=
.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/imx8mq.cell</b></em><br><em>=
<b>| &nbsp; OBJCOPY /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/im=
x8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64=
/jetson-tx1-inmate-demo.cell</b></em><br><em><b>| &nbsp; OBJCOPY /home/vipu=
lkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.=
12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/jetson-tx1-linux-demo.cell</b=
></em><br><em><b>| &nbsp; OBJCOPY /home/vipulkumar/platform/AGL_lamprey/bui=
ld/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git=
/configs/arm64/jetson-tx1.cell</b></em><br><em><b>| &nbsp; OBJCOPY /home/vi=
pulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/=
0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/jetson-tx2-inmate-demo.cell=
</b></em><br><em><b>| &nbsp; OBJCOPY /home/vipulkumar/platform/AGL_lamprey/=
build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/=
git/configs/arm64/jetson-tx2.cell</b></em><br><em><b>| &nbsp; OBJCOPY /home=
/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhou=
se/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/k3-am654-idk-linux-demo.=
cell</b></em><br><em><b>| &nbsp; OBJCOPY /home/vipulkumar/platform/AGL_lamp=
rey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd=
-r0/git/configs/arm64/k3-am654-idk.cell</b></em><br><em><b>| &nbsp; OBJCOPY=
 /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/j=
ailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/k3-am654-inmate-de=
mo.cell</b></em><br><em><b>| &nbsp; OBJCOPY /home/vipulkumar/platform/AGL_l=
amprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658=
ddd-r0/git/configs/arm64/k3-j721e-evm-inmate-demo.cell</b></em><br><em><b>|=
 &nbsp; OBJCOPY /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mq=
evk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/k3-=
j721e-evm-linux-demo.cell</b></em><br><em><b>| &nbsp; OBJCOPY /home/vipulku=
mar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+=
gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/k3-j721e-evm.cell</b></em><br><e=
m><b>| &nbsp; OBJCOPY /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/=
imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm=
64/macchiatobin-inmate-demo.cell</b></em><br><em><b>| &nbsp; OBJCOPY /home/=
vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhous=
e/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/macchiatobin-linux-demo.c=
ell</b></em><br><em><b>| &nbsp; OBJCOPY /home/vipulkumar/platform/AGL_lampr=
ey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-=
r0/git/configs/arm64/macchiatobin.cell</b></em><br><em><b>| &nbsp; OBJCOPY =
/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/ja=
ilhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/miriac-sbc-ls1046a-=
inmate-demo.cell</b></em><br><em><b>| &nbsp; OBJCOPY /home/vipulkumar/platf=
orm/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOIN=
C+4ce7658ddd-r0/git/configs/arm64/miriac-sbc-ls1046a-linux-demo.cell</b></e=
m><br><em><b>| &nbsp; OBJCOPY /home/vipulkumar/platform/AGL_lamprey/build/t=
mp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/con=
figs/arm64/miriac-sbc-ls1046a.cell</b></em><br><em><b>| &nbsp; OBJCOPY /hom=
e/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailho=
use/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/pine64-plus-inmate-demo=
.cell</b></em><br><em><b>| &nbsp; OBJCOPY /home/vipulkumar/platform/AGL_lam=
prey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658dd=
d-r0/git/configs/arm64/pine64-plus-linux-demo.cell</b></em><br><em><b>| &nb=
sp; OBJCOPY /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-=
agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/pine64-=
plus.cell</b></em><br><em><b>| &nbsp; OBJCOPY /home/vipulkumar/platform/AGL=
_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce76=
58ddd-r0/git/configs/arm64/qemu-agl.cell</b></em><br><em><b>| &nbsp; OBJCOP=
Y /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/=
jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/qemu-arm64-inmate=
-demo.cell</b></em><br><em><b>| &nbsp; OBJCOPY /home/vipulkumar/platform/AG=
L_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7=
658ddd-r0/git/configs/arm64/qemu-arm64-linux-demo.cell</b></em><br><em><b>|=
 &nbsp; OBJCOPY /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mq=
evk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/qem=
u-arm64.cell</b></em><br><em><b>| &nbsp; OBJCOPY /home/vipulkumar/platform/=
AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4c=
e7658ddd-r0/git/configs/arm64/rpi4-inmate-demo.cell</b></em><br><em><b>| &n=
bsp; OBJCOPY /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk=
-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/rpi4-l=
inux-demo.cell</b></em><br><em><b>| &nbsp; OBJCOPY /home/vipulkumar/platfor=
m/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+=
4ce7658ddd-r0/git/configs/arm64/rpi4.cell</b></em><br><em><b>| &nbsp; OBJCO=
PY /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux=
/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/ultra96-inmate-d=
emo.cell</b></em><br><em><b>| &nbsp; OBJCOPY /home/vipulkumar/platform/AGL_=
lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce765=
8ddd-r0/git/configs/arm64/ultra96-linux-demo.cell</b></em><br><em><b>| &nbs=
p; OBJCOPY /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-a=
gl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/ultra96.=
cell</b></em><br><em><b>| &nbsp; OBJCOPY /home/vipulkumar/platform/AGL_lamp=
rey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd=
-r0/git/configs/arm64/zynqmp-zcu102-linux-demo-2.cell</b></em><br><em><b>| =
&nbsp; OBJCOPY /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqe=
vk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/zynq=
mp-zcu102-inmate-demo.cell</b></em><br><em><b>| &nbsp; OBJCOPY /home/vipulk=
umar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12=
+gitAUTOINC+4ce7658ddd-r0/git/configs/arm64/zynqmp-zcu102-linux-demo.cell</=
b></em><br><em><b>| &nbsp; OBJCOPY /home/vipulkumar/platform/AGL_lamprey/bu=
ild/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/gi=
t/configs/arm64/zynqmp-zcu102.cell</b></em><br><em><b>| &nbsp; AR &nbsp; &n=
bsp; &nbsp;/home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-a=
gl-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/arch/arm64/=
lib.a</b></em><br><em><b>| &nbsp; LD &nbsp; &nbsp; &nbsp;/home/vipulkumar/p=
latform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAU=
TOINC+4ce7658ddd-r0/git/hypervisor/hypervisor.o</b></em><br><em><b>| &nbsp;=
 OBJCOPY /home/vipulkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl=
-linux/jailhouse/0.12+gitAUTOINC+4ce7658ddd-r0/git/hypervisor/jailhouse.bin=
</b></em><br><em><b>| make[2]: ***&nbsp;[/home/vipulkumar/platform/AGL_lamp=
rey/build/tmp/work-shared/imx8mqevk/kernel-source/Makefile:1734: /home/vipu=
lkumar/platform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.=
12+gitAUTOINC+4ce7658ddd-r0/git]&nbsp;Error 2</b></em><br><em><b>| make[1]:=
 ***&nbsp;[/home/vipulkumar/platform/AGL_lamprey/build/tmp/work-shared/imx8=
mqevk/kernel-source/Makefile:179: sub-make]&nbsp;Error 2</b></em><br><em><b=
>| make: ***&nbsp;[Makefile:40: modules]&nbsp;Error 2</b></em><br><em><b>| =
ERROR: oe_runmake failed</b></em><br><em><b>| WARNING: exit code 1 from a s=
hell command.</b></em><br><em><b>| ERROR: Execution of '/home/vipulkumar/pl=
atform/AGL_lamprey/build/tmp/work/imx8mqevk-agl-linux/jailhouse/0.12+gitAUT=
OINC+4ce7658ddd-r0/temp/run.do_compile.14389' failed with exit code 1</b></=
em><br><em><b>ERROR: Task (/home/vipulkumar/platform/AGL_lamprey/meta-agl-d=
evel/meta-agl-jailhouse/recipes-extended/jailhouse/jailhouse_git.bb:do_comp=
ile) failed with exit code '1'</b></em><br><em><b>NOTE: Tasks Summary: Atte=
mpted 10846 tasks of which 10819 didn't need to be rerun and 1 failed.</b><=
/em></p><p><em><b>Summary: 1 task failed:</b></em><br>&nbsp;&nbsp;<em><b>/h=
ome/vipulkumar/platform/AGL_lamprey/meta-agl-devel/meta-agl-jailhouse/recip=
es-extended/jailhouse/jailhouse_git.bb:do_compile</b></em><br><em><b>Summar=
y: There were 2 ERROR messages shown, returning a non-zero exit code.</b></=
em></p>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/ab9f5a7b-d479-44a1-8ae6-a2ad564fe1b1n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/ab9f5a7b-d479-44a1-8ae6-a2ad564fe1b1n%40googlegroups.co=
m</a>.<br />

------=_Part_635_162105136.1652253382374--

------=_Part_634_458791253.1652253382374--
