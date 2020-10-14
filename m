Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBW7NTL6AKGQEC54ASDA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63a.google.com (mail-ej1-x63a.google.com [IPv6:2a00:1450:4864:20::63a])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B9A28DB55
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:16 +0200 (CEST)
Received: by mail-ej1-x63a.google.com with SMTP id c20sf872558ejs.12
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664156; cv=pass;
        d=google.com; s=arc-20160816;
        b=urz8MexDvt8TYznf873GN5V5bKLAlCayQNVBhvzjEy5oLRorAoxhEnNxNqhyrk1WTJ
         oNqwfmwTlY7VpQf5MNfy7RnTkPUogbes9cDh1vAD6XrplUV1SjeN50rf/K4bDWlvCyqJ
         bgkkCzoGq0Uty6GXqI/1J/2wYnJXApgt7ZFIIPCKkkxGRZIkCezfqA+q3ap2//vcqOvI
         Wrf3RIP5QVptTwkAEuzRWRKKsOWSwIpoDpFbMHcnk54y0nCyNoK343303Bhldsxk1GmI
         zdWjSeOqSxcwCgRoI30gN53hFvALGmbEmApZyB9NCtS1mS2WASjTciY+R42yO2e+6OVZ
         dcEA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=FqQfx+70gFcJ2n6GQF+XcsGyFqAelcKybHJz65P/Blk=;
        b=rKkdsmlYdiTZRH/nQ4u1JilzntnLq1w8pIZzSCVAtFdE6tblEWwD2clvdEWGQ27JAi
         uQbbGCgVoGm0aUdageHyzL2q7eiy6dh/4MBC8tzz3mt6VUnwcXU/X48UqLtbdjanNPbL
         H2DWKCYkVameEbhqY/u/FP21mUkrHhhwdi3aI39qO4Hy5DnS+ZtUseGFP/RbhERo5xZA
         mO9RiI9ShcRlcFCadk4CudN6nvUnbT5M/AEwbDPBF5BP92oGmZlpj+1LC31vm0rwjno3
         fFB3JXMzveHX2o+yoCoUAHMgiAOOB2mo/jKcWRQg/40yN3AhyfizEw78gIzqQQxf5vb/
         64KQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FqQfx+70gFcJ2n6GQF+XcsGyFqAelcKybHJz65P/Blk=;
        b=FhpYrMWHoBmkRtN1cesx3AOTGZW63wvMo3CFwWvk/W4oYuVIcXz99yUHE023wDG9d8
         BUfEdVMdFLW8KhMNJW/2N8axX3rVpdTmUUnJqM1xCW/otYRc9DVVvtwyeDbOYAU2NKsy
         Uo6Ce1yhP7K3+eK8eLNk9hY7Rfgx6Vnsa9Jq5kXb2xGi7pwWd4DkcRl3Qdx/+2d966I0
         vhXb3BYKHCbxpLAd3Q2pOZxfhZqF7hXMj2SjdGJz4b0/OtR/d0B7AOcA+diTqc7HwGPn
         OVQUNRCAxjKSjCk3O02IDAzExaPHME5Rzj8HyVg5pTd3+gF3xiCUA9C9YIoeYQ6TCkSQ
         suHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FqQfx+70gFcJ2n6GQF+XcsGyFqAelcKybHJz65P/Blk=;
        b=sDASOIwhRri5PE7gFntn+r9Aq9CHGOV/oNcHQlT3LeK2Rfnkt0+SsGbccIoJMHxAJU
         mr+Y0f//0ceroQMTDzyN26O+UYPHXptTjhglXxLNFzjijM/53UvTvpN4J/EdcjSZdzXI
         1jkCAZ7+E1WcwCq43kXrQsSaGiMJLMhKNpTc882WAJVqDon0xqG8p/tvYpCH8NERhQ1v
         3L/At0Db4trzz9xMIwsWsan1EPPxiG0FxemBSeXD+6v5lY08PUgsrBhF/5K+n8hnvCkO
         hMrDw0vwFE32qryhaF1uLj7o/gSEhp97IaHGU6818MNWmu99x+hettzaIgDmM4zERwZF
         IWmg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533WHEfyxDS2hkvY5LlcadlcUWwp0ZNOV7dfg64/iAYogsnC7Y/C
	UKhmmVJQZmX/QNDEh0wn3mg=
X-Google-Smtp-Source: ABdhPJx2TrmwQ98ReJR9ugjbwJFlQRkgj96vRTQ0LdIBfj9+LKgkdOluIpj/XbDpvfe66rkvtfPRbA==
X-Received: by 2002:a17:906:649a:: with SMTP id e26mr4187105ejm.415.1602664155863;
        Wed, 14 Oct 2020 01:29:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:cc8b:: with SMTP id p11ls2609019edt.3.gmail; Wed, 14 Oct
 2020 01:29:14 -0700 (PDT)
X-Received: by 2002:aa7:c6cd:: with SMTP id b13mr3311682eds.32.1602664154674;
        Wed, 14 Oct 2020 01:29:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664154; cv=none;
        d=google.com; s=arc-20160816;
        b=iByexH/OF1qrs8PHLb/Mcyofe2HN9UJQsnHNLaDSOavPuH97tvaxzsv5cfsMkKUApy
         yc/GOmRwUMSoC/2tbkg68y1Fc4AlLG4u0xKNpmRQSwXh1XKcsaMYZulq9jWRdjrCTBiN
         U+i8P3GVzv7dhr9iCkBukFbIw3eFIepUiGxtTeXqtUh8fmKFk7Q4I17FfEoDIDn7hCIK
         2wEpkU619XoTI480xK5MvM3if6WXPI12J7qLO4swlbASquNrUbjkycECit42RnNU7tNW
         MtOuxWpKLCbqNQg4aj0Jk3e9j5JZ4BEgUDUR9OjPtdUfnkyDtVD0C3TlMcZg0iUHBNTK
         Qq9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=/P78PFPHPpaTs8XGZ6fTyZsN/8ZI54mEuH66vV5wsbE=;
        b=IX1SgZGmpbc/Pk+/vWplX58o8FtHE1QuVta2WKcRrTbBWZO3djHFki2fASmPaS/qSh
         SbS7dtiNfo9ee/+TqKry+692Or6QnMZ3cisUVufwqGoMSlyG30I+KOK+x/u3UE8Ck+AN
         NXpv+jLT/oTomF682DkANklsf0uAMZBrjLLN3PphVL+CWHMd8uDk6O4g+5Sk9r9Nks4Y
         jw36ppI79zcxB4AD+TEn+huBuMiUw5+jf8GysVKq003P0KTEst0jn5ymzSCTTwtKzmF6
         E0tvtQhuN/xNeIPDhek+J7BsAnTxjVuKZm7jiI0KUb3PN4SLYrFkFu7Bq5umCLzV1/tT
         zeSQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id n11si79211edi.1.2020.10.14.01.29.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 09E8TEtr023898
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:14 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAJ0002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:14 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 14/46] arm64: smmu: Tune output
Date: Wed, 14 Oct 2020 10:28:38 +0200
Message-Id: <209a9dafa7c791f9273fdd37b4227183e049226d.1602664150.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602664149.git.jan.kiszka@siemens.com>
References: <cover.1602664149.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

Reporting of the number of configures stream IDs does not provide any
value. Rather report StreamID assignments.

Convert two unlikely error outputs into trace_error.

Furthermore, report "stage-2" consistently.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index f20a44f6..f17fca09 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -610,10 +610,8 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 		smmu->features |= ARM_SMMU_FEAT_STREAM_MATCH;
 
 		size = (id >> ID0_NUMSMRG_SHIFT) & ID0_NUMSMRG_MASK;
-		if (size == 0) {
-			printk("Stream matching is supported, but no SMRs present!\n");
-			return -ENODEV;
-		}
+		if (size == 0)
+			return trace_error(-ENODEV);
 
 		/* Zero-initialised to mark as invalid */
 		smmu->smrs = page_alloc(&mem_pool, PAGES(size * sizeof(*smmu->smrs)));
@@ -656,12 +654,10 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 
 	smmu->num_s2_context_banks = (id >> ID1_NUMS2CB_SHIFT) & ID1_NUMS2CB_MASK;
 	smmu->num_context_banks = (id >> ID1_NUMCB_SHIFT) & ID1_NUMCB_MASK;
-	if (smmu->num_s2_context_banks > smmu->num_context_banks) {
-		printk("Impossible number of S2 context banks!\n");
-		return -ENODEV;
-	}
+	if (smmu->num_s2_context_banks > smmu->num_context_banks)
+		return trace_error(-ENODEV);
 
-	printk(" %u context banks (%u stage 2 only)\n",
+	printk(" %u context banks (%u stage-2 only)\n",
 	       smmu->num_context_banks, smmu->num_s2_context_banks);
 
 	smmu->cbs = page_alloc(&mem_pool, PAGES(smmu->num_context_banks
@@ -830,6 +826,9 @@ static int arm_smmu_cell_init(struct cell *cell)
 				return trace_error(-ret);
 			idx = ret;
 
+			printk("Assigning StreamID 0x%x to cell \"%s\"\n",
+			       sid, cell->config->name);
+
 			s2cr[idx].type = type;
 			s2cr[idx].privcfg = S2CR_PRIVCFG_DEFAULT;
 			s2cr[idx].cbndx = cfg->cbndx;
@@ -843,8 +842,6 @@ static int arm_smmu_cell_init(struct cell *cell)
 			arm_smmu_write_smr(smmu, idx);
 		}
 
-		printk("Found %d masters\n", n);
-
 		mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_TLBIVMID,
 			     cfg->vmid);
 		ret = arm_smmu_tlb_sync_global(smmu);
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/209a9dafa7c791f9273fdd37b4227183e049226d.1602664150.git.jan.kiszka%40siemens.com.
