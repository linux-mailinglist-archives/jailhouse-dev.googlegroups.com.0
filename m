Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBMXB42KQMGQEMEWMDAA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9606755B9FF
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:29:23 +0200 (CEST)
Received: by mail-lf1-x137.google.com with SMTP id y8-20020ac24208000000b0047f9fc8f632sf4713310lfh.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:29:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656336563; cv=pass;
        d=google.com; s=arc-20160816;
        b=cY2sUmjBaQ/ZHKkLE+fDQfWMvaL1Bq8UBf3I5sPK2wTQC3H1FluRSe0/hs0ktzym6R
         DoVxomXf6kY8OmtmI0oaU2oGzC/JeXIuHz5jkW+dJqg7NqybM2FMZHsqY/TJgxmyGYMl
         F5DHyr0cezURRvcSbTknMN0ulhS0N3SoJdCLSIMGB2HO0Bok5NWV18jH1u5pYRMAMrud
         dIqU/4OUJa0m4+omjHU1ru+11YEbRUAINU9W2Nj2a4L+UTz4MLCFUSEyhy5iND+FY5a7
         MoZBNxv61vMQGUrktGhD7iRlCZX0NI/ombogUpe7ULeDhQSOsC/1+j/LtG6vomEOsoRV
         +9Sg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=ZDSz4cllqQru2S9Kp90eyrdbTXtLTDzGAyDcies1miY=;
        b=STqL0qGC03HUYYBEy9ORxfc83UkQRAaPw0ZZcV9cwbjn5pjUTvnRfNNnjgPIMzqmGf
         R6wn1V20Kyh1i+EfRQ5HIozxXNW8qoItj+met/tfmJm0No/nrFwsraLYsd2NRDwpDL+t
         lrpDGuCe1vXX1DwRmAYkv3VBrXc6uND4zEinL8wksc76wXnD6pfaCDEoLCwCs1OJsBaC
         WVw/HCEubYJqjGoBT1I0PjesxUv3MN3FMmzsAzl2d2fa/llzD/LQR2WqOAU+aswoDvDC
         FfowVJhqKhrbjzt63vpiG2EQ78AKIkqUWnb81FK8/jWslRe/97da7l+AiHqiS6lAZbFc
         BpWw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=PZ4r+lWb;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ZDSz4cllqQru2S9Kp90eyrdbTXtLTDzGAyDcies1miY=;
        b=hYh6whCYQftymPpQUBhuvfFfCsB4Y9C2pUc9FA+yWP5JqhKVwr/4qJX6aVDTMqr8du
         NPvOp5yapxlKsWDaOy5E0x1OUNLUYkVy4+E9rb9iDE/Qo23IRRMRw4zfNoni4sJ0vM5H
         S2jEpkHztojjqFGrYwyP0wbMyhCEEL7i/JlTyGIyqduWhHzRnwTl9+5IRp9kK3Oi3Vs3
         Z1VmzoaFeXGOFsOtIP2c02Bk2sD8doK6P6NXXGnlXi5RXlO7ZlY2iflMI6Y60MvhhiIC
         cNHopkl3O2UcHXhar7CLJLmNZ06pPHuGK3xw58jPViH2L6KzyLzKtRgaaBdyo493WNC3
         BEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ZDSz4cllqQru2S9Kp90eyrdbTXtLTDzGAyDcies1miY=;
        b=YmUahLdmhWr38dXcE6l2vhOC6kWjmCvvYpE8IqPzzOozSy2COqvMgclTW/EVd9oLlv
         Hmmto3j/5B1oOawxit9/GW9Lqi+z3H1XVHlKw6S+68gMLFrBUFaeQRmtG8kbdJ0HMA5w
         kFgfiLeIboo5vWrXSULy4Lm6fHfNEyyx5ekLrqNTdToCs9GszgtIImhuYuOoUeTM9jl1
         5x/Wm3CrdV+7d20OpxLzMwd3LaDvXqjKU7tQYBqLydEpTV9v9+pkRExSMtqPkPrl1/g6
         Ld5xo4hY1ozt2VgIgN+1SbV3JL54RXHXYk3xn3s8eBSW/Rw82VrroNxR0pkZM0uo0eF2
         MZtg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora+xcQKjaXhgop3zvTLoN+8MVkKJ8rlUxuZhiUPv6ts9D2NSFD2U
	tgEPjqScVH0hKx/cf5f1NEg=
X-Google-Smtp-Source: AGRyM1tS1tRQMvSz6SV5WJMeHV3/f8S965h0cOGGcXOEUCxENTPv1u+wug/w0Td/GKF8ZoqkqGkBug==
X-Received: by 2002:a05:6512:32c1:b0:47f:9d5b:d558 with SMTP id f1-20020a05651232c100b0047f9d5bd558mr9092329lfg.488.1656336563188;
        Mon, 27 Jun 2022 06:29:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9e03:0:b0:25b:c694:1134 with SMTP id e3-20020a2e9e03000000b0025bc6941134ls324038ljk.7.gmail;
 Mon, 27 Jun 2022 06:29:21 -0700 (PDT)
X-Received: by 2002:a2e:b602:0:b0:25b:b233:8cb with SMTP id r2-20020a2eb602000000b0025bb23308cbmr5510338ljn.425.1656336561414;
        Mon, 27 Jun 2022 06:29:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656336561; cv=none;
        d=google.com; s=arc-20160816;
        b=DjhOvxYUSPApTUcKceL4tTS1Ou+f0fqKZ70bNXBgPgocgME+iN4ygoOMlNhAhOhLNE
         O4dZIAjjQY+pAEDCgdkG2coJRK9ckNi+lyucSI8MbepvUzsLXU+WoM9Uulofago/E9qL
         YHhGOXxF0zuSUWpE5LSJmv21ORkC8WmfuHWrNPm/uAXvBc1aHv0j1+sp3fVNlpK6iRAD
         Lz0zA1lP7D4WMM5/mrjSfCkl/b0IIsG9xodzEvZYSqT6vBpsVrOXYHGLKR1AvNkT7gUA
         CoD7uoqP9s7OLrB71jISLzeM74/83ydEVM6WCf3Xa7EYuiBUrWEhD2elyrOyTZxwLRIp
         d3Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Wts1iQHAKI2RCEg+O1SPqC7cmTgdXPCH40+ahPiO9gQ=;
        b=hzTzQcfgxoXDtaJFiwZZ02OcIveyfpXTG4iPbu01fcuzpQFfY2VbvrhAzhdZOBbYBp
         tZVvU2NPXUR8I3HdEWwndKXri4Wsx82oUPKf3E45/lTGHO5T4mNktJj58yBLOZ4kvdhp
         zIqa5/ZAGcbrdmt+CtuU2kNne+ohYxkmJ94hxDVvek9FLaZVU+aV2GxvKqC97j0y6A0Q
         oxwig6HbLMITldFZTL2+cfHKpbMeCodb7ZAdNQJmd2QuUgJ4kpjgC8nm+EjyptmPESkq
         6772X7ysHh4PKvjU8jdxfH0Dv6QYwqVec7OPilV0iApgDCi8ugVNBqjDy+9WYR9vTh7/
         RV7g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=PZ4r+lWb;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id o9-20020ac25e29000000b0047f8e0add59si488951lfg.10.2022.06.27.06.29.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:29:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4LWpV85LG7zy0y;
	Mon, 27 Jun 2022 15:29:20 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:29:20 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 22/42] core: riscv: Add spinlock primitives
Date: Mon, 27 Jun 2022 15:28:45 +0200
Message-ID: <20220627132905.4338-23-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
References: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=PZ4r+lWb;
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

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/include/asm/spinlock.h | 52 +++++++++++++++++++-
 1 file changed, 50 insertions(+), 2 deletions(-)

diff --git a/hypervisor/arch/riscv/include/asm/spinlock.h b/hypervisor/arch/riscv/include/asm/spinlock.h
index a5e707d7..db9b33bc 100644
--- a/hypervisor/arch/riscv/include/asm/spinlock.h
+++ b/hypervisor/arch/riscv/include/asm/spinlock.h
@@ -4,7 +4,7 @@
  * Copyright (c) Siemens AG, 2020
  *
  * Authors:
- *  Jan Kiszka <jan.kiszka@siemens.com>
+ *  Konrad Schwarz <konrad.schwarz@siemens.com>
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
@@ -13,15 +13,63 @@
 #ifndef _JAILHOUSE_ASM_SPINLOCK_H
 #define _JAILHOUSE_ASM_SPINLOCK_H
 
+#define	RISCV_USE_LR_SC	1
+
 typedef struct {
+	int unsigned spin; /* has to have offset 0 */
 } spinlock_t;
 
-static inline void spin_lock(spinlock_t *lock)
+static inline void spin_init(spinlock_t *lock)
 {
+	lock->spin = 0;
 }
 
 static inline void spin_unlock(spinlock_t *lock)
 {
+	__asm__ ("\n\
+	.if	%[use_lr_sc]\n\
+	fence	rw, w\n\
+	sw	zero, %[spin]\n\
+	.else\n\
+	amoswap.w.rl	x0, x0, %[spin]\n\
+	.endif\n"
+	: [spin] "=&m" (lock->spin):
+	[use_lr_sc] "n" (RISCV_USE_LR_SC):
+	"memory");
+}
+
+static inline void spin_lock(spinlock_t *lock)
+{
+	/* test and test and set */
+	__asm__ ("\n\
+	.if	%[use_lr_sc]\n\
+\n\
+	la	t2, 1\n\
+\n\
+1:	lw	t1, %[spin]\n\
+	bnez	t1, 1b\n\
+\n\
+2:	lr.w.aq	t1, %[spin]\n\
+	bnez	t1, 1b\n\
+	sc.w	t1, t2, %[spin]\n\
+	bnez	t1, 1b\n\
+\n\
+	.else\n\
+\n\
+	# see figure 8.2 in the RISC-V Unprivileged ISA\n\
+	li	t2, 1\n\
+\n\
+3:	lw	t1, %[spin]\n\
+	bnez	t1, 3b\n\
+\n\
+	amoswap.w.aq	t1, t2, %[spin]\n\
+	bnez	t1, 3b\n\
+\n\
+	.endif\n\
+"	:
+	[spin] "=&m" (lock->spin):
+	[use_lr_sc] "n" (RISCV_USE_LR_SC):
+	"t1", "t2", "memory");
 }
 
 #endif /* !_JAILHOUSE_ASM_SPINLOCK_H */
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627132905.4338-23-ralf.ramsauer%40oth-regensburg.de.
