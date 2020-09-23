Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBXHFVX5QKGQE7SUWKBI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C93A275CCC
	for <lists+jailhouse-dev@lfdr.de>; Wed, 23 Sep 2020 18:07:57 +0200 (CEST)
Received: by mail-wr1-x43e.google.com with SMTP id l9sf5176wrq.20
        for <lists+jailhouse-dev@lfdr.de>; Wed, 23 Sep 2020 09:07:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600877277; cv=pass;
        d=google.com; s=arc-20160816;
        b=i/TwJjqHwjJ1UBtDUmoRCKGHrjt2nUAfGiU5x4VbBcoAShliMeGPNvR9qOeS2WS4d6
         Aj40ubX1rMzPDCXTlchy176bxGMFny3uZSqHl2knIRl42C+CPys5OPQeFwfyaG8Olpn9
         lDckaE/c3WIiMq8eTfVgaGS2O69WHLeRbcVl6yzkfQyz/t8ZqYkxuw9OpYtMUDdmLPYV
         Tih/m3FNL088W6YzbRzRW2drkj7NipBF2kA2WM6jQ33fAMIZ7ZG4l1pszfVFkoJK7sZd
         Tu909y38Pm9C2YP0iHj7jBzNufLecWTuEZxAfKppWGeV+VnlFIuN0PGYf6VmSk8VF/BG
         ctKw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=r+JwJl1FukWJnmLfsFlCnbwI1gq2KVKsNgbqDhMkLdw=;
        b=TsTgJpA/uqdk5HW+B/FVWe37wiwBCwvkpz9BH/1xMPK6xifnrGXyy4/RiqPF2ut7ds
         KBwz10QA92AdBzXFTJvKLu123pmm7aef4JF/pG5jSePYk6FcDiG2BzqHlsAjLM917QND
         tLt1JPgYDHTyGdIIkU5+5FkKoEax1vsuOmXsTTtpfZut9N/IZDnVKV0SkMyjsLPJDqnw
         1MISZCNNRFY9/D26lG8gF1bUcojLgxD/IQ3R4WNf37AWouC4nF/5EQNrdv7WgumhHXGU
         wWjRUZVxoVTNBU9qzwcvirDld90CJZQ+y1WJ8cPMAiA8/m+Mb5g8ywZsD77XcltAhYRc
         xjPg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="J/mLUh/q";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=r+JwJl1FukWJnmLfsFlCnbwI1gq2KVKsNgbqDhMkLdw=;
        b=qvFADbiXxSzFHFVJwF7n/CYKqtDH+COuUd8W0IoK0eZztiEKfXdyahTiQR132Ctzff
         iFc4G31liNOpMl6KcniwkjPSIox641DJkcvodeMUBn138qutke3GcMx32f6uia12choU
         V6MNNWV3yHTIeFvxFeaJJSJ+NYJrrCLikVfg+yOEDJS4G5VObUuhQ6krlqljhAq682C3
         PVmLbW3fSSyeVb2T0OqKUChW/u9G6kCXnvxJTeU+H8X18y+TnMMUhHpSzDD2acusNxcB
         JfRzgjkpNS6WzA7Gwoj22yJdLYBdgrcXo8MJNK/fIopg/4ag4OgoeNJAr5BfjRmtHH4+
         YI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=r+JwJl1FukWJnmLfsFlCnbwI1gq2KVKsNgbqDhMkLdw=;
        b=JFtAuVpMlrhHFlRDvjxy7GntRCfXfdidrusr/LClNaUyypnHHKhF9Lltu36Ns5icr2
         YpYPXP1PL5jjEpFP2wjiNeNB8rEn/pPNZwv7F7jiTb1SdFvRhZjwi4wkIE23t1iRd3s1
         z04Vy6nJ/OGqa0neHetYR/Hk+VleMYfoToIuKxRE5QVkGSDVqdsm8XlCy/J02IqFXkZS
         S8TueSmLDZ9qz+0k6OFIHbuTtOEn1RrF522e7blOTefc8ToEwAfTXT2Q5ocKvTWgbiVQ
         5Rv6BJ6bG+ou5OZwEAXRMPUF5HLLJojYlXFjnOZYJxHcpJx/Ga1q9sNQaiql4zQWda2O
         /vSA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530tTgrx1Xe6dhKmrE8xnWBfuDDNA70DL95vL7fmBDaVJsgTx55n
	fS62koC47r/aPKMp0sPRM7U=
X-Google-Smtp-Source: ABdhPJxtl7ZuSWO22163pX5ZGqvt1CrbKTzJVm2kBrjg/JP2wSOECPcuXZaFsQqYj4FPVRfxOb879A==
X-Received: by 2002:a1c:4e0a:: with SMTP id g10mr283335wmh.71.1600877276872;
        Wed, 23 Sep 2020 09:07:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:a58a:: with SMTP id o132ls33142wme.3.gmail; Wed, 23 Sep
 2020 09:07:55 -0700 (PDT)
X-Received: by 2002:a1c:2cc2:: with SMTP id s185mr276133wms.77.1600877275807;
        Wed, 23 Sep 2020 09:07:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600877275; cv=none;
        d=google.com; s=arc-20160816;
        b=ek8s/N5Izbav9NbJhhVxzZHeBJzzn9rHaU2iWyNPW/i7OL2EaIU47RnF3WPNVHwf2U
         vajPyJnzy4/P65NlCLhLpogRydtj58HkzN24Jrgqbd36x30lULtT54pXMYkRLwDDykMh
         +bLTiIFjCah9RBtnZ86KjCAiWFmVLw4994CBdlaL9pXSXutg6OENFpt9kyg2Z/YgICMA
         2DF5Eldm33RrgVnnngGxSM1qCfWID2+QcRkagrLH5Z13kpvacSials2pLJBZOUDlvXSB
         fl7OJo808gh/urTE96CUNjTERQCAbgVGZ8SOvpLID76aPncMEa7pNDDtg9D//weB3Klm
         4wYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=CdePJAnXfbNmnnONvx6ZDHhOHtV7Dhl4LyLGK1T7POE=;
        b=nfUSAhKbfwSZn28finqnkcS4nkvsNmrB+REnOucKZQz/bs6ck10hV5SHjyCwHlFFuU
         RiQJa9inuxxy/uCvKEpGyb8yVA4YeHbU/Vif7+DaeMOQfC6jxQ+nx2I14La7Qt7cLrbn
         +u2DoWhh4fG0oG5oUkHXyoBFQ7H12OEWGxkbahdQwIoLy8tah9FxiB/dk3/a775USP21
         cT/GzMTYDhqVphb9qIyFsiSyLJssUwY7/Fq/4ORjQB8j6egh5S6sl0GIM0fXNonKdSLs
         m4Md1+HcFwxmxim8ETI9b3sJA7jpNAlxLi1H70RqgycZsuP6BsvOdq6Jx8XdqObdBbQd
         kmjA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="J/mLUh/q";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id o13si29866wme.3.2020.09.23.09.07.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Sep 2020 09:07:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4BxNPR2Gn8zyjY
	for <jailhouse-dev@googlegroups.com>; Wed, 23 Sep 2020 18:07:55 +0200 (CEST)
Received: from omega.home (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 23 Sep
 2020 18:07:55 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH 1/2] inmates: x86: paging: move definitions to regs.h
Date: Wed, 23 Sep 2020 18:07:44 +0200
Message-ID: <20200923160745.580421-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b="J/mLUh/q";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

We'll need them in assembly, so move them over to regs.h and align the naming
with the hypervisor. And introduce the shorthand PAGE_DEFAULT_FLAGS.

No functional change.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 inmates/lib/x86/include/asm/regs.h |  7 +++++++
 inmates/lib/x86/mem.c              | 17 ++++++-----------
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/inmates/lib/x86/include/asm/regs.h b/inmates/lib/x86/include/asm/regs.h
index 1ae13591..16a0665e 100644
--- a/inmates/lib/x86/include/asm/regs.h
+++ b/inmates/lib/x86/include/asm/regs.h
@@ -49,6 +49,13 @@
 #define X86_XCR0_SSE		(1 << 1)
 #define X86_XCR0_AVX		(1 << 2)
 
+#define PAGE_FLAG_PRESENT	0x01
+#define PAGE_FLAG_RW		0x02
+#define PAGE_FLAG_PS		0x80
+#define PAGE_FLAG_PCD		0x10
+
+#define PAGE_DEFAULT_FLAGS	(PAGE_FLAG_PRESENT | PAGE_FLAG_RW)
+
 #define MSR_EFER		0xc0000080
 #define EFER_LME		0x00000100
 
diff --git a/inmates/lib/x86/mem.c b/inmates/lib/x86/mem.c
index e391f2b0..7e1c8b83 100644
--- a/inmates/lib/x86/mem.c
+++ b/inmates/lib/x86/mem.c
@@ -39,11 +39,6 @@
 #include <inmate.h>
 #include <asm/regs.h>
 
-#define PG_PRESENT	0x01
-#define PG_RW		0x02
-#define PG_PS		0x80
-#define PG_PCD		0x10
-
 void map_range(void *start, unsigned long size, enum map_type map_type)
 {
 	unsigned long pt_addr, *pt_entry, *pt;
@@ -59,25 +54,25 @@ void map_range(void *start, unsigned long size, enum map_type map_type)
 		pt = (unsigned long *)pt_addr;
 
 		pt_entry = &pt[(vaddr >> 39) & 0x1ff];
-		if (*pt_entry & PG_PRESENT) {
+		if (*pt_entry & PAGE_FLAG_PRESENT) {
 			pt = (unsigned long *)(*pt_entry & PAGE_MASK);
 		} else {
 			pt = alloc(PAGE_SIZE, PAGE_SIZE);
-			*pt_entry = (unsigned long)pt | PG_RW | PG_PRESENT;
+			*pt_entry = (unsigned long)pt | PAGE_DEFAULT_FLAGS;
 		}
 
 		pt_entry = &pt[(vaddr >> 30) & 0x1ff];
-		if (*pt_entry & PG_PRESENT) {
+		if (*pt_entry & PAGE_FLAG_PRESENT) {
 			pt = (unsigned long *)(*pt_entry & PAGE_MASK);
 		} else {
 			pt = alloc(PAGE_SIZE, PAGE_SIZE);
-			*pt_entry = (unsigned long)pt | PG_RW | PG_PRESENT;
+			*pt_entry = (unsigned long)pt | PAGE_DEFAULT_FLAGS;
 		}
 
 		pt_entry = &pt[(vaddr >> 21) & 0x1ff];
 		*pt_entry = (vaddr & HUGE_PAGE_MASK) |
-			(map_type == MAP_UNCACHED ? PG_PCD : 0) |
-			PG_PS | PG_RW | PG_PRESENT;
+			(map_type == MAP_UNCACHED ? PAGE_FLAG_PCD : 0) |
+			PAGE_FLAG_PS | PAGE_DEFAULT_FLAGS;
 #else
 #error not yet implemented
 #endif
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200923160745.580421-1-ralf.ramsauer%40oth-regensburg.de.
