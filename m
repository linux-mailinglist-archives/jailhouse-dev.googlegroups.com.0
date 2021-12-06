Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBV5CXCGQMGQE47U27CA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4E9469731
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Dec 2021 14:34:16 +0100 (CET)
Received: by mail-lj1-x238.google.com with SMTP id 2-20020a2e0902000000b00218c22336absf3489920ljj.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Dec 2021 05:34:16 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1638797655; cv=pass;
        d=google.com; s=arc-20160816;
        b=mvyPyE2TCgD6q8cnq+5hgTOGeU13cKVJdPuOjyJv2XGQS6UkchwQxO00GODoQ1cwXj
         WKJF1vH9doxnha5Y8BfYZFt45vK8NBnj+P9zlsslAD4/4n3c1tU2dLpYnhnmA/bD5iIi
         WDwnHHorqTTTT8nhK18Lv6QB/bAhkp9krZkmiyNQhapZ8Ump4gtFNQHJZrCEDNOo9klm
         bkZK9h+2UP8FNsy1KxAxUssAFWsJ6LOh1lWKG3fnwUgR4xDbklKct2ES2t8DNeatGtDR
         UbQlDWQgfz/u+I65TBqvZIEvxj+p0UCc5R8EH7HGP4MtOu1L9GBDfefYiiJF68zh4yZh
         V8Dg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=oL1osTxisDSr7s+/cuh5iMMDhabBav17qMr43DcNu7w=;
        b=YICQvzfky2E43ZL1Id2KHs43caZkl4RT43EoDjJuBWcOJASEzL6rlzGUoSvRWDbAMK
         iNn76Ip2SuzJcv+/JY/v2s93gYJDQQvetkadUuwdkSYiirTYTyvCHUiwaHr774BFB9t8
         AQctHelQvwRI1YzDcEggXxMc2klq2INP62pqfXPexRDX8vsUUyCr1QFG+aTGCHQq01Z0
         xqTC/CVd2IX+wD8wdTuaF85fh1SHgHaXtoWsAfW0TrwePkMCHsCSWzr4AvEI+PnZzmlG
         2q1DKT0d/RNnzJK6n7KeS8Zk5OoKBoSAqpM7+8co6BLMFkprke4YVeEvVsK/DHSC/yMa
         Wv8g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=LJ2SGMG+;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=oL1osTxisDSr7s+/cuh5iMMDhabBav17qMr43DcNu7w=;
        b=O2c+7hbhvH4vn8F5vguXAQG4YnSF0F/E54IJfGgJ5P7poWArbX9YuZTJx9f0FgcyYf
         Y15xg87pxBfV9KrWRgIiLR5HhwCpkHx/SsWhiFPZZXDKv+rez8UdBzzLgUQW3u5LU10N
         bA9ZWzVYDlt3hgi30z6eHOzLHCojwqUS1Hvk5o04TlMIk8qR7hDqVW/WPkHLg322H2FT
         nJ0gDzDdC4qkUSCKGe2B9iPr1tzWS6KmK0mSyLP65o56eedJSV9/73JxyrwAXYMOqX33
         U7xsP2gGE61NSJmRcXXit9z16o1HSzQ4H9WvZXPVbpdtpqEqb4Z2zO6oMT+Fz8knAi3k
         Gm7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=oL1osTxisDSr7s+/cuh5iMMDhabBav17qMr43DcNu7w=;
        b=r1AuWi0x3ocrWUdSthidTBZork9GjI1E0qaWqIyh0G5gDjz7xkcBrAWchV1F3uxGcg
         w4v23w+xpUtYLzH8gP66e+nSTgg64MGn7a2xvpFksKhhOC4p5/z6ltjbQMvIH0HrR0Rn
         J2i9yOuwQw8e6KyBcd412oLUAa1YAR4hpTObdLdkaz8NFpM7BOvYeMuBSwx7nwwm8uMC
         98bEzO5HLwDixm2yYPx6627EXD2FBJKLF/YDNnV1+d50UEgghUIsTH66F86+gnsnwzOU
         gp95EKQeI42CAWUWrSi97i7Dh/PZYF7mpRp36q9rxFMAxijHjZqOySnzgzaE6Bm78rcX
         fZkA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530YdaOAQANcJ8S7LuAbbV02ctxKhTPRjXTqY+jPTLaY/fh+jZTk
	Deaz/BhQKnhRBrXAUmE93hw=
X-Google-Smtp-Source: ABdhPJzNv2m8q5uZzY3gcoll51laMMNB6P2R6OZ9L70lBJBkFT+KYdzZlMXseBXbthRs6OlUzfMRMw==
X-Received: by 2002:ac2:4e09:: with SMTP id e9mr33807740lfr.657.1638797655807;
        Mon, 06 Dec 2021 05:34:15 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:201a:: with SMTP id s26ls2579610ljo.5.gmail; Mon,
 06 Dec 2021 05:34:14 -0800 (PST)
X-Received: by 2002:a2e:7310:: with SMTP id o16mr36177195ljc.394.1638797654740;
        Mon, 06 Dec 2021 05:34:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638797654; cv=none;
        d=google.com; s=arc-20160816;
        b=fJ6EbkjiXnqNac6pGk2CBJArupUw4M84pehJ3lSFJA2IyNWyiuNoPrqsQEJ62+wRhB
         kzx9Ql9oR97/4pQNrQ8PPh5/uSzhz5ZjyW4xf+JoMZ1kBJScfwtHD18548D031JUY4XR
         ZiMzZQFmusFZ4icUhQq/VGH7PBZmPFLtZJEuDEYAd3gM5PxDKsAyIL3yBC8LWWRaD9dw
         8jW9eTTaeHXhh9jIAHulhuTiQG6PprUvxwKhQQpqXsqguZi1pt4Vn3QLKTpVwDxKaHOA
         iFHia9xodqK9HHi/EXo58RB5rfrlXXxiYiFKXdJkGB+/4h1B4xg/Vu2I/OaSKQq+vCBR
         P6vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=+iwKvG4xmQCKUrPxKULcCAPF3sxkV2sWncNdxsoYeUg=;
        b=e1JRXNY2DRewtXbVzbGA064hX702rUTltsY9TUc+yGJsnul4AWk4AkryU5c/IjRieC
         drzmrhWYpZo0Ly6eS/1c6pxpqtawrUf/ooghvGaHn+gPH1y6CxQTNJmRS71pQhfA3cL+
         fSPBDR6lTLg/tImDfse/jj6vTbIHpnNREZfL74eNDXV8UEf/ikV+uUb9E6sCDOkff5/m
         gj66v2oZsOCu9kV9PkkOyZW9yDat1pvxVu0z5dQ2tPvC1H1vSwQWtc0T5oFc1vHiFP9O
         hjpP0nn5pbod7Q5mLX2KGWuRWJHWhDWi8boE+6YFIPFCP7DeJLnftLdEkozod5AO7Eom
         ePuw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=LJ2SGMG+;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id b29si725566ljf.6.2021.12.06.05.34.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Dec 2021 05:34:14 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4J74CT56KRzyBC;
	Mon,  6 Dec 2021 14:34:13 +0100 (CET)
Received: from atlantis.home (194.95.106.138) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 6 Dec
 2021 14:34:13 +0100
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>, Jan Kiszka
	<jan.kiszka@siemens.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, <meep@binary-kitchen.de>
Subject: [PATCH v2] configs: x86: qemu: Add an extra variant for AMD
Date: Mon, 6 Dec 2021 14:34:04 +0100
Message-ID: <20211206133404.155078-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=LJ2SGMG+;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

If we want to use the qemu-x86.c on AMD platforms, we must not define
Intel IOMMU units. Build an extra variant for AMD platforms.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 README.md              |  8 ++++++--
 configs/Makefile       | 11 +++++++++++
 configs/x86/qemu-x86.c |  2 ++
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/README.md b/README.md
index f1b0cbe3..ac457119 100644
--- a/README.md
+++ b/README.md
@@ -288,11 +288,15 @@ installation steps.
 The Jailhouse QEMU cell config will block use of the serial port by the guest
 OS, so make sure that the guest kernel command line does NOT have its console
 set to log to the serial port (ie remove any 'console=ttyS0' arguments from the
-grub config). Reboot the guest and load jailhouse.ko. Then enable Jailhouse
-like this:
+grub config). Reboot the guest and load jailhouse.ko. On Intel x86 platforms,
+enable Jailhouse like this:
 
     jailhouse enable /path/to/qemu-x86.cell
 
+On AMD platforms, use:
+
+    jailhouse enable /path/to/qemu-x86-amd.cell
+
 Next you can create a cell with a demonstration application as follows:
 
     jailhouse cell create /path/to/apic-demo.cell
diff --git a/configs/Makefile b/configs/Makefile
index 327043b7..5af0647a 100644
--- a/configs/Makefile
+++ b/configs/Makefile
@@ -28,6 +28,17 @@ OBJCOPYFLAGS := -O binary --remove-section=.note.gnu.property
 CONFIGS = $(shell cd $(src); ls $(SRCARCH)/*.c)
 
 always-y := $(CONFIGS:.c=.cell)
+ifeq ($(SRCARCH),x86)
+	always-y += x86/qemu-x86-amd.cell
+	targets += x86/qemu-x86-amd.o
+endif
+
+$(obj)/x86/qemu-x86-amd.cell: $(obj)/x86/qemu-x86-amd.o
+
+$(obj)/x86/qemu-x86-amd.o: $(obj)/x86/qemu-x86.c FORCE
+	$(call if_changed,cc_o_c)
+
+CFLAGS_x86/qemu-x86-amd.o += -D__IS_AMD
 
 targets += $(CONFIGS:.c=.o) $(CONFIGS:.c=.cell)
 
diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
index 9ca5c528..3f8f673b 100644
--- a/configs/x86/qemu-x86.c
+++ b/configs/x86/qemu-x86.c
@@ -45,6 +45,7 @@ struct {
 		.platform_info = {
 			.pci_mmconfig_base = 0xb0000000,
 			.pci_mmconfig_end_bus = 0xff,
+#ifndef __IS_AMD
 			.iommu_units = {
 				{
 					.type = JAILHOUSE_IOMMU_INTEL,
@@ -52,6 +53,7 @@ struct {
 					.size = 0x1000,
 				},
 			},
+#endif /* !__IS_AMD */
 			.x86 = {
 				.pm_timer_address = 0x608,
 				.vtd_interrupt_limit = 256,
-- 
2.34.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20211206133404.155078-1-ralf.ramsauer%40oth-regensburg.de.
