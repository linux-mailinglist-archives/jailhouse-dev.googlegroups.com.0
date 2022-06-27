Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBA6242KQMGQE6LRRJYA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0670355B9BA
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:13:40 +0200 (CEST)
Received: by mail-lf1-x137.google.com with SMTP id h18-20020a056512055200b004810d1b257asf2110193lfl.13
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:13:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656335619; cv=pass;
        d=google.com; s=arc-20160816;
        b=b3vJF0a6/v5qjPowW/fPz3qYBpjwCzzUONSa5hEyjH//EtTL+qBWNEgauq7HsZvNaJ
         tmtEt1h14rIjQ0IWrlDPdiR2QmlabRFJWUXQFkTc84+BBYqIlqNzO4P8fJvg/jRo6NF5
         O8fntFdmD7uzzXy9o5KO0Kgg7sDkHhPzI6a4fMZpdyrdT91uS/3josct757J76HnTSTy
         19FGPytb8QF0V+Le6BXnDUa3npOLp9hDf7EhSRQuMQzaijKfyECcHTW9bCr55k2Drt8D
         drAHnN/wOFg9+wCF1o3eIYHy0KtDPXBecTrBNKPGxc/KqHc5niCBz1SsfemQez0mpzPS
         L/OA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=2DSidK21JUnPmZj6TJ8PuGqhdUFY+KB3EFp+qFFMdfI=;
        b=kgewzvV+VyGYT4EVBHoloVC+ZqFN3I8mBaTV6SCBn1iVEx2J1WaSoG6ynzzXlkc8id
         qNd9p50TYj9YoyzO0UPFPgcnXknEiAzZjzdyfWd1XqUNoclMjVplqIjteZ45OyPvDX7w
         vcnCa0DgucHQdY2TTc7tmrt9Sqo72T1/Dvr931ED+3JIsA78OZr8gia3xXHu1EXIBhpg
         Rcz8P+nuN0JrIc9a0RpfkgxCDSabuI/RR1Gsx9ClXPaYXLEHBHLU1+hge4jskYRoAtoM
         k39+BO1HaTKKXxcMWEzg9jq/NSTKvxwwwScisr7uG1PjfeXUbNP2EuWRQDz8L/kjdorO
         S9CQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=O+5ysJFD;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2DSidK21JUnPmZj6TJ8PuGqhdUFY+KB3EFp+qFFMdfI=;
        b=cY6CVqnRSr5wVVdUYtOuGzgwZW8fJvMVwxIc2Ix+4L5/mAQU8ZoNlBihBNN9Txvw5T
         LRpxSFvrNro/X5E5nyuCp0zQmOGnbQPnPwXTIt80Au+fMxSAeJXvXsgE0k8Q6ECicn9U
         Osxc3gAN882IK3NFTVAe45mCT2+CDsLrwL/871oETZBsf2jLr8i2lzMjaQkprwkRocwo
         kBT2+akFLkTgXPv7jnnVsmepdejD2l42IX2Da+FnoIhtLMNCTbpbKJSpjiR5PKopycrc
         FU0Hh60zeIC1UiJXtVFpIPJO3tSGS27us837KKxs+9G36mM1lCkRRdaPP1XclUbQ3Cqt
         bpjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2DSidK21JUnPmZj6TJ8PuGqhdUFY+KB3EFp+qFFMdfI=;
        b=zZOfFaS7fMegNHjcgkMJTcpIt38iJo2e0Y6axcL1Cub+zAbESqvrxA/rYlONASg9F0
         J+Qbh+TlBo9IG+nWrQQmcBlCG8aN/bvBmVEdFzXOyHtGxHffU1uBOOuRuY1+pols9STx
         h8d8jQ4O1um1mxK7+0nv3qS+H4aMmNmYTzUo0ujuTP/jXKCS718NCmfVHWGKnNAXXTGn
         y2SLCo2FCYq1NSWkqXjB4wzIUmgQjVx2E7U77XWi45QqIdNdcwuuZPbxJANDlfV6+U9D
         BUe4l4OdNk1ASLfDuOZCwLQho92ALKKCVVY03HMlma+WX1vOjKAoEhNtgO8uFQ7TcXwB
         HeYQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora9l4rwRtxXfDCqyIISSy3/WEp+7rm1p5Cx5LNtMO9VNzmZ14JUy
	KcIgl+pfd6+RHlVfqulNjwg=
X-Google-Smtp-Source: AGRyM1vmitXBzDBsPhpjLgSy7aEUAQU5WzStM9hRU1sagp9zow5Q+rYFmwrmex7oujbiuygDU7Aaxg==
X-Received: by 2002:a05:651c:b25:b0:25b:bb66:94f7 with SMTP id b37-20020a05651c0b2500b0025bbb6694f7mr3694513ljr.333.1656335619554;
        Mon, 27 Jun 2022 06:13:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:238e:b0:481:2fa:2826 with SMTP id
 c14-20020a056512238e00b0048102fa2826ls186297lfv.0.gmail; Mon, 27 Jun 2022
 06:13:37 -0700 (PDT)
X-Received: by 2002:a05:6512:3e24:b0:47f:6e80:42ac with SMTP id i36-20020a0565123e2400b0047f6e8042acmr8054307lfv.125.1656335617830;
        Mon, 27 Jun 2022 06:13:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656335617; cv=none;
        d=google.com; s=arc-20160816;
        b=DrzEwSP8sVvI0MVEUc0PqZakkFJjb2jgOoktsfZco1FOsLP9bvqgoq7iuFZkiEmJab
         zPxdwZVA9rj5ZXs2VF9kCUahjyZwGtY+JmsvpPGq93TCyi9NHqrpJ2uQHKyngqVN2oAH
         7SKsp8h2pdy/Jl/HAaP78i2fIDS/MfUVEZN8IDJrbmk+buocxWDTbOGud/15mvCCPsF1
         Kcs3cvnKwPj6QOasVLP0ruLUlvuQ2Tl2T1lBOf4ot7zO1LkwLyIfW5s8iNlfSDvqd6Cn
         QlHHBpziunQ2PMwn9B8Pr2d9rIXweWqlZHj/0wSWclgAATCqRFXmTdepWVVmyBCGHkfz
         H/0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=sTYQ5+yPzT3X3szRTSWTP7vTQSRifrRDU6GKUqXn/oc=;
        b=BJFxallMgHO4dRImS9I6j7RUYac2oG6bfFyn5NfoblLK63jxnVzp7ZU0bCHOMB7kpD
         uiKYgyu9AyODK/YXWOcPm8Wfv7YACBxkNcJyBeWGa0tR9wpIYIGn0zCZeY7HquD+ZJY2
         5U5TVFozlsz9H3ox5n1QgwNFLcHY9XJyMxLer180MC9lLuNsuOlqGvYRNm4lm7gJbP+b
         oG24LNv4eJzjKK35aA5BOaqMjloIFZK//cewRdu3eadypJsFLQWSJlIN4KjBDuoIdGHd
         7jQB4l5Lclc9NRdNcEKiA0dXi+09nQIVBMJsoRneeETQUINLDpZQhf04rnwQRQRgNtGM
         BGWw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=O+5ysJFD;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id p16-20020a2eb7d0000000b0025a71229262si380771ljo.3.2022.06.27.06.13.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:13:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4LWp811zJ4zy87;
	Mon, 27 Jun 2022 15:13:37 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:13:37 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 08/20] x86: Rename CPU_ID_INVALID to APIC_INVALID_CPU
Date: Mon, 27 Jun 2022 15:13:17 +0200
Message-ID: <20220627131329.3659-9-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627131329.3659-1-ralf.ramsauer@oth-regensburg.de>
References: <20220627131329.3659-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=O+5ysJFD;
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

From: Jan Kiszka <jan.kiszka@siemens.com>

We already have INVALID_CPU_ID, so better make this 8-bit version of it
apic-specific in its name to reduce confusion.

No functional change.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/x86/apic.c             | 12 ++++++------
 hypervisor/arch/x86/include/asm/apic.h |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hypervisor/arch/x86/apic.c b/hypervisor/arch/x86/apic.c
index e861ec2f..95edb2db 100644
--- a/hypervisor/arch/x86/apic.c
+++ b/hypervisor/arch/x86/apic.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2013
+ * Copyright (c) Siemens AG, 2013-2022
  * Copyright (c) Valentine Sinitsyn, 2014
  *
  * Authors:
@@ -33,7 +33,7 @@ bool using_x2apic;
 /**
  * Mapping from a physical APIC ID to the logical CPU ID as used by Jailhouse.
  */
-static u8 apic_to_cpu_id[] = { [0 ... APIC_MAX_PHYS_ID] = CPU_ID_INVALID };
+static u8 apic_to_cpu_id[] = { [0 ... APIC_MAX_PHYS_ID] = APIC_INVALID_CPU };
 
 /* Initialized for x2APIC, adjusted for xAPIC during init */
 static u32 apic_reserved_bits[] = {
@@ -151,9 +151,9 @@ int apic_cpu_init(struct per_cpu *cpu_data)
 
 	printk("(APIC ID %d) ", apic_id);
 
-	if (apic_id > APIC_MAX_PHYS_ID || cpu_id == CPU_ID_INVALID)
+	if (apic_id > APIC_MAX_PHYS_ID || cpu_id == APIC_INVALID_CPU)
 		return trace_error(-ERANGE);
-	if (apic_to_cpu_id[apic_id] != CPU_ID_INVALID)
+	if (apic_to_cpu_id[apic_id] != APIC_INVALID_CPU)
 		return trace_error(-EBUSY);
 	/* only flat mode with LDR corresponding to logical ID supported */
 	if (!using_x2apic) {
@@ -386,7 +386,7 @@ static void apic_send_ipi(unsigned int target_cpu_id, u32 orig_icr_hi,
 
 static void apic_send_logical_dest_ipi(u32 lo_val, u32 hi_val)
 {
-	unsigned int target_cpu_id = CPU_ID_INVALID;
+	unsigned int target_cpu_id = APIC_INVALID_CPU;
 	unsigned long dest = hi_val;
 	unsigned int logical_id;
 	unsigned int cluster_id;
@@ -469,7 +469,7 @@ static bool apic_handle_icr_write(u32 lo_val, u32 hi_val)
 		lo_val &= ~APIC_ICR_DEST_LOGICAL;
 		apic_send_logical_dest_ipi(lo_val, hi_val);
 	} else {
-		target_cpu_id = CPU_ID_INVALID;
+		target_cpu_id = APIC_INVALID_CPU;
 		if (hi_val <= APIC_MAX_PHYS_ID)
 			target_cpu_id = apic_to_cpu_id[hi_val];
 		apic_send_ipi(target_cpu_id, hi_val, lo_val);
diff --git a/hypervisor/arch/x86/include/asm/apic.h b/hypervisor/arch/x86/include/asm/apic.h
index 5bddf4da..17001789 100644
--- a/hypervisor/arch/x86/include/asm/apic.h
+++ b/hypervisor/arch/x86/include/asm/apic.h
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2013-2017
+ * Copyright (c) Siemens AG, 2013-2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
@@ -19,7 +19,7 @@
 
 /* currently our limit due to fixed-size APID ID map */
 #define APIC_MAX_PHYS_ID		254
-#define CPU_ID_INVALID			255
+#define APIC_INVALID_CPU		255
 
 #define XAPIC_BASE			0xfee00000
 
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627131329.3659-9-ralf.ramsauer%40oth-regensburg.de.
