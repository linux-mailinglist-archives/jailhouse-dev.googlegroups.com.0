Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBW5I5T7AKGQEMJSATVA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A482DCD82
	for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Dec 2020 09:18:36 +0100 (CET)
Received: by mail-lf1-x139.google.com with SMTP id x187sf14111367lfa.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Dec 2020 00:18:36 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1608193116; cv=pass;
        d=google.com; s=arc-20160816;
        b=GCeir0pnirFTPoyH8dquQKouB+AN1nl+RSOSMLi6Rsm7hn5H0M3wXHaMIfHSSa3ZdZ
         jxAFb8HcgETA2J6Y+lXxh46rWPm0K0JKTBLZM0G/JCX3hrdfDbuif3YfkbKMbv7i6fwI
         3UEg2KP5d0LR/5R44Pxi/N+E2BhORx7f10NIiBidZDvVSo9EJbc7ZbhbxLxHfh3WCOWS
         m88WEn/vSsppNsxQKQ1cr6cUE8PP9cv7Fn1jeafd11O8nh75wVbGzi4x2VIloAGQBcEF
         GIHkAo5fvAwoTBkO4J3qeA+4lPiASEwlB6GQHeORkJOhlN2QVTMQB+LQv5s1tPTLzZM0
         dEtg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=/aDVorT5s+QHkkGK5l6fUwWrnotLLwzaD5yBD6LiPD4=;
        b=wHOaZidJYHtettxhg4Vr73WGWr9zmBZ3O8WuoXgxVgoc3eSrT5pFydailcABUTlUZc
         EEnKjxsoXafGc7I4e/H2umfVEkuC1oBXQ9D6qw+7UCqFgPj2CHrCprasZYfvOEzMjR4i
         DnuWNEB50AFJF8mXUbrCltW7N8iPVjmitxX3FsxMvy8QVwHFLDB4DAg/Nm4eZ3yApjd/
         K3K8UQHJdhnHwTpzz7lEL6sdY4RwdMY4Zj4mzdjzUdG3PL7vkZK5SHG7OywjfhE5gkc7
         7j/iVD5K8AodNknH2nRr9u/9pcgg8+v0Xkd9JrJC7tEKYneQilXuCHRiA+5Dp/9ja8wF
         UyQg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=O4vShQmI;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/aDVorT5s+QHkkGK5l6fUwWrnotLLwzaD5yBD6LiPD4=;
        b=jf9kuntHrFRoJok7orf4CeQXJKTrW9EDezj+9rjSNCwZ6rMweV0p5i0EF3DL4gKkEd
         4mAb+xH1nMmS1xyflzIUVJBaTBhwqGMi0RoUl8gqweqH3wDbjXxwMa5VffP5o/e3SSih
         vr/e8xXz95cvOiXsKwkkfgTrR+MHPIZTNMolSMvjT8SJTEGHqEd/2a0LgGRsdogEjYgD
         /AEUzLNHd4T5Bmu0+BozQR4gdbbjVKmqAPuufWuZI8KB2QLE3HtwutfPcjvTSnyR7BYd
         4OXcvD/grjQabpyARWMMo/CcTkVioSA2ohqL7MUJKgV9FNrdf4GQqTeF9ZJzeAb3FJiX
         giWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/aDVorT5s+QHkkGK5l6fUwWrnotLLwzaD5yBD6LiPD4=;
        b=izou2BJhOC9YuUmtEaNVZVbr7ppBjzjyBfc9P2rC2jpaclwyaONLx/ohzQwf4z3fhA
         JqA56BoyQ3/eFtxizGJNcRRigqTsbory+eyve2KP/UEdfatkMAuABRQChQPFv+9+QJHA
         EMZ7xDT13AGWpaPjt2PwjGxdRdtI3Htd2xKyIwuGFQX04QIkfo5VpoBX1kvcx2nHGoYV
         DVKnECtQlAmf+gE8fwk/oxwh/S090uHfA9X5V9ZESfF6BX56ZakubQ9wtOxFEVx3+9hn
         XOhdJBkO5V7x+qez8akP4fWyxUicoosmCRKqSdV0LnkMGkP5fWc6ew7GqMLapOS2GBTt
         PAuQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531pguB/uv3dc2T5DQoC968eJFdY9rvUjO37+DpPkrq84ifnN+fk
	7z7Diu3t+DWT37TEdHhHQdw=
X-Google-Smtp-Source: ABdhPJyhjNMDIVa1ghSv+qDK91jH0QkO02fRUKLxrSxoGi9tp45ULkANPY165PEP/84JkFQC+L/zHw==
X-Received: by 2002:a05:651c:1075:: with SMTP id y21mr11585461ljm.186.1608193115840;
        Thu, 17 Dec 2020 00:18:35 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:7d0d:: with SMTP id y13ls3843085ljc.9.gmail; Thu, 17 Dec
 2020 00:18:34 -0800 (PST)
X-Received: by 2002:a2e:9101:: with SMTP id m1mr9479272ljg.231.1608193114833;
        Thu, 17 Dec 2020 00:18:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608193114; cv=none;
        d=google.com; s=arc-20160816;
        b=RtpXwq4dexq2zYDMaUlS3bRszT0iMKQtOy03iW3K7O7v4I/Ei3FpGPF9FTyY92isIt
         sFG2Iu1Q8teLwFMNwk+TpTBzL/Z+Uq4TSx4/rZZEVw7jG1EPKEtdXdweFBDhWm7wjHhN
         fldP55kZDmbVtYKuccIT8YZNSSrqBBtq6QKc7jcgxp7M1U6kvDFin+pNy6D7farz9ENr
         kjOu5rxGLuGwJu1rYk7ez76s40n2HkL2abI0hsn9KuFXz60dz3tSrAP4T/qL8WEjuxEO
         xnD1DjUr/I0ePSbcm2FhmcWTOBrZmWL1eUnIpkrZaGUGW+IuWczcIt2Lnbd2ZXrdfaeU
         0JCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=MZIPi+UMuaz3IHQil2+Auk64Rv7gFHFnescKSoR2XYA=;
        b=KFcTukE22eSlFNq/J2Hnlo4XmiPWESXzjTwnN9JoT41srDroVXEacsLsszqf0mEKLc
         zHAlgmkVeIY6pbP+VWaHzEQFD92kFo0hvuBYf0uHwb4qN6NpzCvArzGzKDj2CFLhN1YO
         /eJdizES4YPLB60Qk5tKYtxGMvZ1qpPr0OutXXdaeEQJ9QiGuG8KZoT0bcrqf2o2ooIt
         tbxc/Flv5uaqXkBn9TEjpUy9PD4ZXh7M0BL69o61gQi48+wlJ6DpJu/y3F36PlPm09CR
         yCeTgEnlxCHDA6Jg6QfUowDaB2M6ucoQln+cbBPt0TIaQNtWqToEhpDC6P0BI/zqoMjv
         rCXA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=O4vShQmI;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id f21si197639lfe.9.2020.12.17.00.18.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Dec 2020 00:18:34 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CxPyf1KsPzyWP;
	Thu, 17 Dec 2020 09:18:34 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.875
X-Spam-Level: 
X-Spam-Status: No, score=-2.875 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_DMARC_FAIL=0.001, LRZ_DMARC_FAIL_NONE=0.001,
	LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
	LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_ENVFROM_TUM_S=0.001, LRZ_FROM_HAS_A=0.001,
	LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001,
	LRZ_FROM_HAS_MX=0.001, LRZ_FROM_HOSTED_DOMAIN=0.001,
	LRZ_FROM_NAME_IN_ADDR=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_SPF=0.001, LRZ_HAS_URL_HTTP=0.001,
	LRZ_TO_SHORT=0.001, LRZ_URL_HTTP_SINGLE=0.001,
	LRZ_URL_PLAIN_SINGLE=0.001] autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id SR6R-XJ4286D; Thu, 17 Dec 2020 09:18:33 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CxPyd3mtVzyT1;
	Thu, 17 Dec 2020 09:18:33 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Cc: jan.kiszka@siemens.com,
	bram.hooimeijer@prodrive-technologies.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH] configs, inmates: Makefile: remove .note.gnu.property section during objcopy
Date: Thu, 17 Dec 2020 09:18:14 +0100
Message-Id: <20201217081814.8338-1-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=O4vShQmI;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
Content-Type: text/plain; charset="UTF-8"
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

It seems that the .note.gnu.property section is interfering with objcpy and
causes the "JHSYST" identification to be removed from the .cell.

Removing the section while copying the .o fixes the issue:

objcopy --version
GNU objcopy (GNU Binutils for Ubuntu) 2.34

readelf -a jailhouse/configs/x86/qemu-x86.o
...
Displaying notes found in: .note.gnu.property
  Owner                Data size        Description
  GNU                  0x00000010       NT_GNU_PROPERTY_TYPE_0
      Properties: x86 feature: IBT, SHSTK

hexdump -C jailhouse/configs/x86/qemu-x86.cell
00000000  04 00 00 00 10 00 00 00  05 00 00 00 47 4e 55 00  |............GNU.|

objcopy -O binary --remove-section=.note.gnu.property
jailhouse/configs/x86/qemu-x86.o jailhouse/configs/x86/qemu-x86.cell

00000000  4a 48 53 59 53 54 0d 00  01 00 00 00 00 00 00 3a  |JHSYST.........:|

Maybe related to:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=906414

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 configs/Makefile | 2 +-
 inmates/Makefile | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/Makefile b/configs/Makefile
index 513b0a9b..0e617e4e 100644
--- a/configs/Makefile
+++ b/configs/Makefile
@@ -23,7 +23,7 @@ ifneq ($(wildcard $(obj)/../include/jailhouse/config.h),)
 KBUILD_CFLAGS += -include $(obj)/../include/jailhouse/config.h
 endif
 
-OBJCOPYFLAGS := -O binary
+OBJCOPYFLAGS := -O binary --remove-section=.note.gnu.property
 
 CONFIGS = $(shell cd $(src); ls $(SRCARCH)/*.c)
 
diff --git a/inmates/Makefile b/inmates/Makefile
index 7d3fafa0..a4ab7903 100644
--- a/inmates/Makefile
+++ b/inmates/Makefile
@@ -36,7 +36,7 @@ KBUILD_CFLAGS += -march=armv7ve
 KBUILD_AFLAGS += -march=armv7ve
 endif
 
-OBJCOPYFLAGS := -O binary
+OBJCOPYFLAGS := -O binary --remove-section=.note.gnu.property
 # prior to 4.19
 LDFLAGS += --gc-sections -T
 # since 4.19
-- 
2.29.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201217081814.8338-1-andrea.bastoni%40tum.de.
