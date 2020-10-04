Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQNX5D5QKGQEYRUKFJY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 213CF282CD0
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:18 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id v12sf3134188wrm.9
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838018; cv=pass;
        d=google.com; s=arc-20160816;
        b=UawqkTSQq9Kn1Yi5L93eZuGPIrGv6boQMUNPB3mM9LX0xGy4zJp/a5Z+MaeJvTWfOL
         5sn2sj384h7ygvh/7FUAtZJifWWzJsL8ZZ4qJgkxSNwoaucwow39X/IVhhHPqxMfPpH3
         4neyanEZT01mDjbuHGxkwp4aO2RLDzIYrR4R1RN3Ki8OGonrzc1u5JXbbpv6hdc1YtOA
         hWZR3OoyxxY9mLwZs0CXerOeTQEBx+ZT+Ykm2UeWUi7Vmy+pjehs8a95wuAuOkQ2Xi1b
         2ZPPFnWJhjUZ9w9gGv0llfSffwo/xEtagVKFJkHr5hgJGj2ZLLxY/5HEFOouwrFGvo9X
         /VwA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=pHMEhaIjTt2EYsXOHqaS8GdiBdTSETsC7uVN5lw2ZLc=;
        b=sG7AsBE6KXDRhmeGDd1vUzGNT+Yxum9u0PRn4MJrQxaIISlnEiia18fK2Sni6r70gb
         V1cI4upeznSRFFKzsefoFKL4x0IOaM8S7OGg34IIGRpiBo3zPNaytfRByS8L5IrmpjEX
         uB3tZdBpfbyqUPSfO4RybwDqBW7iyFIOpPjObnlGJeuxATt9o2nMvSQeSD0XbVEd3PjU
         RtyMgN6+IZodCXSvHEqeYgZmBHs9lgYy/7lvVpm1RBubxsfkHGNb+vFZuavL3AkSp+8y
         Vq7AjGinvPhEen6jpSjUkQ/Q/HKBxhN3Y2Sy33/Fd/LUB5O6rDifBFe3Maxi7pU2/vtQ
         vTGQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pHMEhaIjTt2EYsXOHqaS8GdiBdTSETsC7uVN5lw2ZLc=;
        b=bN4JVB+dDt9qxVJUd5ciUUYDyk8yKCH26MEhKn2wSwkj+YkypSZVGCR+af6JlJ/PsY
         OGvu422KJ3XtpfzKAtX3R7Q2f5kI6yJHHVdQ+FkVdF6/uOpmcH1gphq8JCKVEG8rWOz4
         SaB0znzy6D6T2708stVsRd7zQ9KWzEaXRMZ1yv06OqSDP0Uq3fCAk/NOnzLV01uqpH5w
         oOCWdbDgg0mwQ7Vzr9tyj82rl0Sfs9wYaImJnEJVi1t2H4oQHrJFYtu9czKPBuQ/723p
         mG1J+GfG3I0UDWkzuXgFV4Rd5jvL/klqBwdj8eq2W7sMoMjR/mR/c5GcaO0d0VBocpR3
         9few==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pHMEhaIjTt2EYsXOHqaS8GdiBdTSETsC7uVN5lw2ZLc=;
        b=Hb+lgJJAa9ET4qDaLf1X1mnEREwxEIvumz46987W49w7kb47e+VOyA/xHGnTRfcZEW
         nMGeJ51shk6J2LLWPvCfpplYQaZRImMneirawqT5Cm4PNJuouuA+pOne+9ET/J35O7xk
         ofZxOOdfDl+TVNVgehZG146TEALfATjQDuzJY+8p88Zyfg67uEXsKp0UpdQhkbadzTtT
         3cttW+yUDE8nacMnj1+VO/NqZSYcISVXHKMkQ2HQMbSTOenE54uWd63NN7Ik4+ZVTc7o
         WKzOcckK3kr1ZiCG7Xtf/PzHuS+a1RPmlII82vhINUmYu9QfWe6rU28pVITVFQezVAal
         /D6A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531r0REGZNdgb6wnFnAwmKQTOtUM8Oj+iCJ4k1NzgaylGcqjRiVP
	02YqYQJtWjbWBJW4g2Tqgx8=
X-Google-Smtp-Source: ABdhPJwfPrhhzb5MPUpsZ33DIIL4DTn39s1kBmqLrYADn9sKDS2xlvx5sGpgH96aTOWLex0BHg3m1Q==
X-Received: by 2002:a1c:4856:: with SMTP id v83mr8984359wma.118.1601838017891;
        Sun, 04 Oct 2020 12:00:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:e3c3:: with SMTP id k3ls5160814wrm.1.gmail; Sun, 04 Oct
 2020 12:00:17 -0700 (PDT)
X-Received: by 2002:adf:ee07:: with SMTP id y7mr3532394wrn.229.1601838016984;
        Sun, 04 Oct 2020 12:00:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838016; cv=none;
        d=google.com; s=arc-20160816;
        b=HtJmcLKIKPfUX6RO51bsZ/aad4VcmZBnkb1Z7i+ALsQJYPrEjJeVxAbZJ9rDptVJlC
         yX7NZhAntiHVUqkZVEFQo3wwda6uKsPFu8g1SL1B8N4x9FRxohsHZdA/Uu57DOn/xTpL
         SpYRoaDvEKHLiy/07URcgz6GEyG/epUcrdJsP+mtgB7YfTcYNRJnL4Ao3gHTwVsVCDsB
         GMS9fyM914XrrBIKIomfHvMxbfJfr10+JtZegqPhXuUQC5vMDyuFx7uwB4wzxO0Rce6r
         umUURVYRczTEyl6Ssuy9EeTvfBiucEG4Hc4uBeceRrqbAWJD/U6JZpR9ChIJB2Y1I8ff
         Xk0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=VlpfhakSZfKY/UccAtvLLUzmVf5ARpBI3fzw6+QSCZQ=;
        b=HCKn7emEu10v7OOjF6sX1TWHC2KWvDC02+m5hblxP0vobOzYcpDbD8lLTbpCpN/ArN
         X7/vIe2Qpdk6vBFbvzmJChSWLmnhMqGoGWnybe/GwLzwHuBnJ7/QB58iMURQ3Dk94VY9
         H+Wu13Sa8k/sB5nB/ap9EdfY08Z7DVKiZnEtYpJ2q79on/93Zi7yPmaESELgSqogqXm0
         ymN/YXsU5JRUlKYukN5D4f2l15mim2jOuC+WfBEmKTi1P4IbCqQWIG/ii2fXsqK7Tt4m
         x/XMeVkxFFurGUuoOMLSplFTEjxmHPW/aYluJrTPgvk3LGwrj4G9wllFWgh4WifYgYXN
         5Rmg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id 11si36364wmg.0.2020.10.04.12.00.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 094J0GtX025197
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:16 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060q017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:16 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 40/45] arm64: smmu: Catch VMID exhaustion
Date: Sun,  4 Oct 2020 21:00:01 +0200
Message-Id: <bf62abf1407d8f2d8bcbde24a3bb50bbd5dcb88d.1601838005.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601838005.git.jan.kiszka@siemens.com>
References: <cover.1601838005.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bf62abf1407d8f2d8bcbde24a3bb50bbd5dcb88d.1601838005.git.jan.kiszka%40siemens.com.
