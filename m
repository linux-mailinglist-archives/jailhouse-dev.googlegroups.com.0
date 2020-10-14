Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWHNTL6AKGQEQFVWDZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F5028DB46
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:13 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id f2sf281989wml.6
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664153; cv=pass;
        d=google.com; s=arc-20160816;
        b=Fe7UUA9CWh7h12nRzVOYvtNvBCHYWBYSUrHZp9I48CaCNeIyD5luqlyUQ1gnOzowwh
         A1HsDDEnBY/BSHlzJbvV0b0uYrdEG0SzEy0NaORZHpfvH13+ZrNhP/fnPNsPD3caUTBK
         Tiyi4UV+1cl9/8TfutRuXM3x8fN+dQ+eTdutws77nLQbJ0cXwHPEQGI8OPBC2zwrA+vV
         ST4Nv7aO+PQZeVktWuU8LhhkF8AEHxzVoF2wmvj8ZqmGpQubH226sSJaXuwC81pMuq1P
         kELeHAscfQv90flkYNDT7i8VVSsGupH6appiWcHi5uaa7FkfP83mP2IJOVMSj5GoNECF
         LWiA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=6E0768x3GhkpZX1l9/nPBd8zREq1a/Iz8uD0zZO9oVU=;
        b=Ihcns+QHkoYvcz29gWNCcmz4h4ofCi+qcy0Qc+nB3EKZGnTpVmObxxVUBLke9hbObU
         wfUm5azXlS8l+NDcD8K1wAjDAXLTpjzfw4CzjPTaqO6/JzNHSkWLTDJHhP2mgeDJVVEA
         XePpVUpZTpaR8hhgDQAKKzeclFCst0kJbP7pTLrnsFla6YSpRDYialQ2+zsW+jYKsOpR
         dYEDzVQLYM92r0h2RCVWgMY4hv/n5PB+tG+1fKHHXObf1wiv4RHFFIAMS/syXPVWgfQA
         dI2HUCrMyM/MMUbnAcRQjgeortbIcd/3R73CvgjvywOvJOqbzqAwiYB0cL1gFVWgE7ki
         UJ/g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6E0768x3GhkpZX1l9/nPBd8zREq1a/Iz8uD0zZO9oVU=;
        b=AZ4fs7PKfArn2hN5yrp2FhCYDnLO+XrbgviK9H+aYXd9/OYYuLOJPdvqFIRnrpxxuW
         YE/D/sbr0eR/PHvzghzc9CDZPBalc2GhNLn5SaRNBAPsv0YpvIKh58PYhdqjfPzj6j5a
         02Db5lRAaSoS8GJUhf2/INIhGPGBUGCPj3PGFX5WCfYLcD2RL69VSEvstsOz8sG43ELO
         dgaWniPg+xVP2BXVq1Ksb6M3FI8pmjjuqPKp3BnqHKJAaTWevEqDuWGgBCZ4EoxqUPFb
         M0UTyy8MBS9023R6YxO6LbsnwjoknMA4WXO1w6m33gjh2FPT4xMeZZC12Yk1g2Pm4PCE
         8h3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6E0768x3GhkpZX1l9/nPBd8zREq1a/Iz8uD0zZO9oVU=;
        b=qPkVf50aM5CGJpSf87wXKQ8QgTV5TY0ldgvA3EO35utUW5fyXQmI8DwAAwtpDOublV
         7LfmnEB4TJIwnb+rj4LMtQq4i+odOXskNqHOU5jWbtyLBqjwr0X6bxli5l6DUwfNxVVF
         p0lmEr73qZv2p8NS1GEM42/Mct4R7Pw8wM3lmaOQ6TgAnVp4/6pPB3PHRNExIw574TzP
         pIwgvpFdGuXwml41whbBfDoeXMbgf8pqhaiz/bcvCakSuOTlJL63h25++YNSo10HDwPV
         JUQ3kNv0aNOUUeey2vg6SFTW9piU4BgEQ8WRHROhkg0Y8qw2iVoyR7HYCIjjNpmgARu9
         75Vg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531nI+5mjMFa58Aw+gSw93SZ0tUsHjww4+tMxGFgXTW7ahe+b+3f
	5Uee4CLh1QLZT3kgcYmNx5A=
X-Google-Smtp-Source: ABdhPJywayLnWRGO5+0tgubxP+i51A8EopiZmywi4TNyhBTPw8kMN55bwirDdr6i1T/lKyh4c0dFKw==
X-Received: by 2002:adf:bbd2:: with SMTP id z18mr4414258wrg.166.1602664152903;
        Wed, 14 Oct 2020 01:29:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:82ab:: with SMTP id 40ls3143931wrc.1.gmail; Wed, 14 Oct
 2020 01:29:11 -0700 (PDT)
X-Received: by 2002:adf:8362:: with SMTP id 89mr2857782wrd.280.1602664151805;
        Wed, 14 Oct 2020 01:29:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664151; cv=none;
        d=google.com; s=arc-20160816;
        b=JNd0eO1vtbhrc6IqjQNeMFh+p6lfmY+/VA6cf+NZr/m5tQ2TNTIAIxNHiGu+ILQCWC
         OCN+9/8W7V9+UF/Uin+ybB0bttTIKKZo6egXuMGZHIZ90EHf7BW4bTN/mpirUoBLhIUE
         P5ER7GYhsYICxcZXld4c7FkxIpPmH81WEd/iAMRlCoOvJrJS8lWrr2/oy+ENpvgAx6X7
         N80fWrI+3C51aLhu1P7Od0wf9iUB/0LvHZRVJMob+bFMvZ0lI/H2CVu/8hiws5Qt3zdM
         JmI51QLd9kRnwWQYwgcL+f2P6ZUGDSuKbJH8ehmP+rxr7TcFnSTmACw1T+rlz05fraUW
         FnRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=e1sE+2mGl4HlkJhcxatrMyq7i5Ew4+lNiQRiRM9zNEw=;
        b=OfmY86xv6ttuHxpGeMSPj142VDfagNaoHwg3YnJJAku+43a9yut1vb3obpTy+n0fXI
         LwhtimQkKDCNjFiGx86mT74bgRu+/ZiWqT+fu1ayWqg6mk3UfJKGpcYYVIK9G+bDvRyU
         rsWthqk1yXN9ekm9k7uN1uOZsctMlmzih6ASBgeXTG0dITwSGZ+n0a+DnBH+aLlvnAkP
         doqxUlKHfkxx3Rbw9G0F7v2+yqxthLBQZki6Y4I4aGmTaOcYulEd31mO0bhv8ElTjx76
         eJ+vBpepmXpridvDJNu6on/1K5dCKvIc3d8gi6F3UqJDSzqzqtx4aFzxgKC+FoTqcoca
         6gnw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id 72si44210wme.1.2020.10.14.01.29.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 09E8TB4h001494
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:11 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAIn002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:11 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 03/46] arm64: Introduce cpu_parange_encoded
Date: Wed, 14 Oct 2020 10:28:27 +0200
Message-Id: <bf6c27cec715beb6960459d287651965655f9c93.1602664150.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602664149.git.jan.kiszka@siemens.com>
References: <cover.1602664149.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Keep the encode parange value as well. This allows to use it directly in
VTCR_CELL, rather than re-encoding it via TCR_PS_CELL. It will also
allow reuse by the SMMUv2 code.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/include/asm/paging.h | 16 ++--------------
 hypervisor/arch/arm64/paging.c             | 13 ++++++++-----
 2 files changed, 10 insertions(+), 19 deletions(-)

diff --git a/hypervisor/arch/arm64/include/asm/paging.h b/hypervisor/arch/arm64/include/asm/paging.h
index 5713379c..67664efa 100644
--- a/hypervisor/arch/arm64/include/asm/paging.h
+++ b/hypervisor/arch/arm64/include/asm/paging.h
@@ -177,7 +177,7 @@ struct paging_structures;
 
 typedef u64 *pt_entry_t;
 
-extern unsigned int cpu_parange;
+extern unsigned int cpu_parange, cpu_parange_encoded;
 
 unsigned int get_cpu_parange(void);
 
@@ -193,23 +193,11 @@ unsigned int get_cpu_parange(void);
 	   ret; })
 
 /* Just match the host's PARange */
-#define TCR_PS_CELL					\
-	({ unsigned int ret = 0;			\
-	   switch (cpu_parange) {			\
-		case 32: ret = PARANGE_32B; break;	\
-		case 36: ret = PARANGE_36B; break;	\
-		case 40: ret = PARANGE_40B; break;	\
-		case 42: ret = PARANGE_42B; break;	\
-		case 44: ret = PARANGE_44B; break;	\
-		case 48: ret = PARANGE_48B; break;	\
-	   }						\
-	   ret; })
-
 #define VTCR_CELL		(T0SZ_CELL | (SL0_CELL << TCR_SL0_SHIFT)\
 				| (TCR_RGN_WB_WA << TCR_IRGN0_SHIFT)	\
 				| (TCR_RGN_WB_WA << TCR_ORGN0_SHIFT)	\
 				| (TCR_INNER_SHAREABLE << TCR_SH0_SHIFT)\
-				| (TCR_PS_CELL << TCR_PS_SHIFT)		\
+				| (cpu_parange_encoded << TCR_PS_SHIFT)	\
 				| VTCR_RES1)
 
 int arm_paging_cell_init(struct cell *cell);
diff --git a/hypervisor/arch/arm64/paging.c b/hypervisor/arch/arm64/paging.c
index 2942b8d7..3a4eb096 100644
--- a/hypervisor/arch/arm64/paging.c
+++ b/hypervisor/arch/arm64/paging.c
@@ -14,6 +14,8 @@
 #include <jailhouse/percpu.h>
 #include <asm/paging.h>
 
+unsigned int cpu_parange_encoded;
+
 /**
  * Return the physical address bits.
  *
@@ -24,10 +26,11 @@
  */
 unsigned int get_cpu_parange(void)
 {
-	/* Largest supported value (for 4K paging) */
-	unsigned int parange = PARANGE_48B;
 	unsigned int cpu;
 
+	/* Largest supported value (for 4K paging) */
+	cpu_parange_encoded = PARANGE_48B;
+
 	/*
 	 * early_init calls paging_init, which will indirectly call
 	 * get_cpu_parange, prior to cell_init, we cannot use
@@ -36,10 +39,10 @@ unsigned int get_cpu_parange(void)
 	 */
 	for (cpu = 0; cpu < system_config->root_cell.cpu_set_size * 8; cpu++)
 		if (cpu_id_valid(cpu) &&
-		    (per_cpu(cpu)->id_aa64mmfr0 & 0xf) < parange)
-			parange = per_cpu(cpu)->id_aa64mmfr0 & 0xf;
+		    (per_cpu(cpu)->id_aa64mmfr0 & 0xf) < cpu_parange_encoded)
+			cpu_parange_encoded = per_cpu(cpu)->id_aa64mmfr0 & 0xf;
 
-	switch (parange) {
+	switch (cpu_parange_encoded) {
 	case PARANGE_32B:
 		return 32;
 	case PARANGE_36B:
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bf6c27cec715beb6960459d287651965655f9c93.1602664150.git.jan.kiszka%40siemens.com.
