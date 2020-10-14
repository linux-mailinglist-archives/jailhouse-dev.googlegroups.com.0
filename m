Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBYPNTL6AKGQE5UDP33Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63f.google.com (mail-ej1-x63f.google.com [IPv6:2a00:1450:4864:20::63f])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B90228DB70
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:22 +0200 (CEST)
Received: by mail-ej1-x63f.google.com with SMTP id k13sf872845ejv.16
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664162; cv=pass;
        d=google.com; s=arc-20160816;
        b=Oo+6HkFBDsu7XPPRkCt53ymsK/S7Zyc7wHjx+Wcwp+KvSwj6VVUAG7DXCKk1mWElHE
         rTbanH8x1vcegbCRwpTsXKQD++q0QKq2ayNMCO3RhGAICZpPQHCa8/It+EjNTGRrlLkz
         V1xQc09k0PQZCJMLaePRXQU6ZHTNikWRW3TB53e4/4xbPeKF1AqO4IasY/KiL90UN0gf
         7vMSjt5x1cBBNSK0U4EOQ05ttteZnij95+EYceLq/vEqsVIOd9qijfJi3tX6Cit5ol1V
         Kp2wxZ0SnxQRNKnf/x7MnNUOOCUoLKKJCsGiY1q+u+4Z7lCjI6HkPZYRpaqiOCi4ZdDc
         GLmA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=AqOGK3Qe7RxXkXHCWMtB84aAfjQ+lbn2O1tY0OquRwY=;
        b=q262xiIh1ab5+Yc2N/Sde9rqjf23pnkiJll4XUKd6aiQW4vZ3uO3YF14Ij7a7FieS3
         ecq+nByOV4a2JjdoX+LkHE6VArCAIMNjaPpzODHBDPogc6fYk2AdvYOyPGbRuhjU9I1L
         PJ5sAdjdS5h1GjAtYY+Deb+VrwkB9vv/G9W3BaNqYGtm0M7rGKUR6BdJ5EiJO++uRAcQ
         CfghxLTneB7seBt6r7FjprnfwnxzKcqBrPIzw0vPFx+YqzYIsu6jPwgZ5qPrHvraVj3v
         jtRcbhDhjzUjdo3IIVuHHe5P7cy9cInmlzJjopXfb1m5vO7mR87Lsm+CjwmViK4TDoFg
         aP2Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=AqOGK3Qe7RxXkXHCWMtB84aAfjQ+lbn2O1tY0OquRwY=;
        b=FT8sL7JPiBcKXMDjbYzOC4FFB1/J/mdbg3memSGoIWgCuN9/3B3WpoIcqLm5Zn4mF5
         sWRIsRjskJa/rwlsyT/MBU8d4XOjSMpthW3JWkGkdsLeyy0AaHQOmrMVfRN/QI6Ibt50
         ob/uF+MUPlONzhvg/aIjlczGZKr9oz/ldh9IsUd9aYufvd+AzwZk2qZG0+jZKzlAld8Q
         7iM7oFTBZDsSLjRhgFNLFjNm+eiklKUq2vtg+dutxuPNRNcLGhFF44S4cj7xv2u/sSdm
         UGbMBcBqP0Ix3U5xVlMgllL0c+G4FVXXUekDsaVOXQ+aSRhXA3lG52mbLQCByN8UQKXI
         FQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=AqOGK3Qe7RxXkXHCWMtB84aAfjQ+lbn2O1tY0OquRwY=;
        b=ccJbtlCT4euW2/VHK0hukbCeKkOkch6o1BAPM1LqQeFstISgSQsro0C8Ab9rnApaUO
         Vxt03qXs7Cy7h9RFeU8qfczL3rS7N0+m35LoKWkAuEBKlqncqR8C1tsJDoMViwQEDdcy
         TwLeFrsUDzu3DZ8zjkReSdBpj0J3BJDtmq3Wzy6Pqb0y33lMHIYNJV3aOF3QiswG0D7G
         Ij4x9T23xbfKPr2GJHi0J5dVOBO/EZk9AJwYv9f7/Kd2Iim5ZRo6sJUzXTArHO7LbzSA
         tOjyAjMxkaRCmUd1XZdy6ZT4pDNhl72Eck4RRyFWgcSEjgc0DK1VfSESVFo6B1pFp8B0
         TskQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532PYEYb6P8wUFoOmuHqKJrNN5e1sUQ9XSMTvG0ggRl3N+zziQy5
	9bu5wz2hwJyFA2Iu3ZLY/pY=
X-Google-Smtp-Source: ABdhPJw7IXLAv4oodkOXt+qeYhcOfdd+eQELtv838mNHGFFiWmm+Kh+75odPtpFK43HxF9SJSEOPvg==
X-Received: by 2002:a17:906:f110:: with SMTP id gv16mr4175391ejb.257.1602664162139;
        Wed, 14 Oct 2020 01:29:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:848:: with SMTP id f8ls1244167ejd.4.gmail; Wed, 14
 Oct 2020 01:29:20 -0700 (PDT)
X-Received: by 2002:a17:906:647:: with SMTP id t7mr4194413ejb.428.1602664160844;
        Wed, 14 Oct 2020 01:29:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664160; cv=none;
        d=google.com; s=arc-20160816;
        b=D0L7ePoRUrrFVnBghlZB+bvfLnySFkapAWAUs8wcS6vagrrTCRkMdBPwRg32ZUPZ7/
         hbH30EPixHCYPM4dBsdwMfNDthtWvKrqyIHCvOFtZ4w91OrDSfAHqn+XWMRsfuA/yyse
         NSxfy/YBvV+3hVf8ORCbEwKF6Shcv5zQPDos5dpxDyYwTE7Nqnhf0HDFUFDoWd0yvRYA
         XYRFKFh9NQcGJqlnOI2e3pM6lg8FGKDSyCWfaGCWsJNpgX3YbyNMQLdkTXcjBJtZjM7v
         Cb502mLSiIzqDMwa8Cos58i62gGCwzeR0ZI4wgRSO4R83nPMgTmiXKLWMpgcLNb7TVpk
         ocfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=VlpfhakSZfKY/UccAtvLLUzmVf5ARpBI3fzw6+QSCZQ=;
        b=mHOl3H0hjbitgXxoUK0OCqA1mtM1NLm6sJM1wEJujnZvjI5zEXnGtlign+G0pDBU+z
         tkwxEN204scit3mA/MM23GYAjdY0waac50B1bDwHhohsXtz31cS1KIbQ+WN7bB/9qZ+7
         bAMuRxzd438P067figWvQAVwnSKI4oHJLfD9BnCfA802EHe0DC4SC8qqBGeJwGoHzQ3A
         0WA4oKELPrFunpX0uCocYnXFKsDvLuaZgaKW7fppl/DY7uQc2QqhZE4qMd05JB6Gw7Zf
         37D/0dN1vt57zWIKfg2RlTRwqDqLWOrlmpXpq+S86jSzJHMyYSXqf3B0YRqRXDq2/TjY
         dapg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id n11si79218edi.1.2020.10.14.01.29.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 09E8TKAg021831
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:20 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAJR002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:20 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 41/46] arm64: smmu: Catch VMID exhaustion
Date: Wed, 14 Oct 2020 10:29:05 +0200
Message-Id: <9f6d8ebe7ff660f8c86c9ae105271af04500f1b3.1602664150.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602664149.git.jan.kiszka@siemens.com>
References: <cover.1602664149.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

As we map each cell on an exclusively used context bank, make sure we do
not overrun the hardware limits.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index e316a553..da904d1d 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -466,6 +466,7 @@ static int arm_smmu_find_sme(u16 id, struct arm_smmu_device *smmu)
 
 static int arm_smmu_cell_init(struct cell *cell)
 {
+	unsigned int vmid = cell->config->id;
 	struct arm_smmu_device *smmu;
 	struct arm_smmu_cfg *cfg;
 	struct arm_smmu_smr *smr;
@@ -477,7 +478,10 @@ static int arm_smmu_cell_init(struct cell *cell)
 		return 0;
 
 	for_each_smmu(smmu, dev) {
-		cfg = &smmu->cfgs[cell->config->id];
+		if (vmid >= smmu->num_context_banks)
+			return trace_error(-ERANGE);
+
+		cfg = &smmu->cfgs[vmid];
 
 		cfg->cbar = CBAR_TYPE_S2_TRANS;
 
@@ -485,7 +489,7 @@ static int arm_smmu_cell_init(struct cell *cell)
 		 * We use the cell ID here, one cell use one context, and its
 		 * index is also the VMID.
 		 */
-		cfg->id = cell->config->id;
+		cfg->id = vmid;
 
 		ret = arm_smmu_init_context_bank(smmu, cfg, cell);
 		if (ret)
@@ -504,8 +508,7 @@ static int arm_smmu_cell_init(struct cell *cell)
 			printk("Assigning StreamID 0x%x to cell \"%s\"\n",
 			       sid, cell->config->name);
 
-			arm_smmu_write_s2cr(smmu, idx, S2CR_TYPE_TRANS,
-					    cfg->id);
+			arm_smmu_write_s2cr(smmu, idx, S2CR_TYPE_TRANS, vmid);
 
 			smr[idx].id = sid;
 			smr[idx].mask = smmu->arm_sid_mask;
@@ -514,8 +517,7 @@ static int arm_smmu_cell_init(struct cell *cell)
 			arm_smmu_write_smr(smmu, idx);
 		}
 
-		mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_TLBIVMID,
-			     cfg->id);
+		mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_TLBIVMID, vmid);
 		ret = arm_smmu_tlb_sync_global(smmu);
 		if (ret < 0)
 			return ret;
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9f6d8ebe7ff660f8c86c9ae105271af04500f1b3.1602664150.git.jan.kiszka%40siemens.com.
