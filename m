Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBPFX5D5QKGQE3TUQHYY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63e.google.com (mail-ej1-x63e.google.com [IPv6:2a00:1450:4864:20::63e])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FAA282CB7
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:12 +0200 (CEST)
Received: by mail-ej1-x63e.google.com with SMTP id s20sf2373809ejx.19
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838012; cv=pass;
        d=google.com; s=arc-20160816;
        b=ncQggcjlZlah/tap6jdlEEBUHrD/YFfJ91NA0pK+GUKxJCg/3en7Ej9XBIabQLyYXo
         t+J55dTqzjBM6DQJ+3eWjjxBoEvtj8WAvVYzDbL/KN/oWiseXc1MYrclXIaGO+/fySaE
         Qvq0LIQZqz9kBCrcCfILTtijSu8veigsR43emrYGnPaloCQS5E3EFQUoyKj2B5p/q1UU
         TPeD3q6BVQ4qxOR8ET8b94FLIXfN5h3eKTT3716hxMzVa4Qtraccti4LZNbepyzRxIvO
         PF2F5kTV/CoER58NsFGvLSw3FaSnAuvd9e3+MjhmzvIqDhTrba4EQMM0HlZX1Wu2VJFE
         mx0w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=zp5+ESAEKhjfIcLsLoqVmVAQpDC5kHeX6sOAI0fpEVA=;
        b=kaG/jpL3uqdgIf+nQxY+gXWilxLaifAPSr0Is3qH4KNnNDbjv0izS1PPImedyZHcU4
         bY8K2vVd6c00toFV6xoT6+IoYHwprL9rB82XAc1B5QegtK93ImzBi9gb/lndHIGhKhxd
         tY8EmP2KcOusnM7q2UpCXQpQ2hU+3Y15uBn99hzvXb4qPveJoPbNk8Dq/e9aVNoyvm1l
         fC90MlMPjzjFtb+6ab1kfOLAIW91YqRCfbJQOiNPrh6TzNCVtbigSUXPsNUjd1+8hgtE
         9Pr0u/Vqgs9jR5hjXWJNtpT9Sx9sVFFoq0BU+cUkMpxDNTAtt9hf+3707s2vhnp4iQ3b
         pOeA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zp5+ESAEKhjfIcLsLoqVmVAQpDC5kHeX6sOAI0fpEVA=;
        b=HmwzbOCPellB1ZaRA4bB48Xw/36di3Zw4lAjE2RPn33SIx6kajZ6HNytjIABATGJyO
         5CSsuqO5Anla6ZKGqk8XuOd/lRN48CL7WT92M8qg22DX3Sofp2ZVDfNzCnoxIUBraETk
         RrGhfrk030bc7LU5wECquDgkYsiw7A3d5sKI1QhVsTqT1nmJYG1tupKlksluC9LrQuKv
         83/cTv6swTIHm1yIFzX0pF704xu90jUmiZUGgSdcbxiJAnyexvxy1Gj0g4fiwwfXkEKV
         ooq1gIeMHAA5CfQMo3wFJ5jHitIGoLB7ACYNI212mozK39TuxUBxshAHN0DTnUcUGj0q
         9fog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zp5+ESAEKhjfIcLsLoqVmVAQpDC5kHeX6sOAI0fpEVA=;
        b=C+aoka5OUqNppv7wx43z+WZsFj/zuzVFnO2h1dbTpOkfZp8B+8doqd09vS02ysP7ev
         cmaXgogb6LoRnNxtG0cr4hRLun3eHosS0s1TyV2OIJkRftbuUlsvbtYcvbn65WxiJUaj
         0sr1WpwoAniNg2vOx+nGplHDn5D3rRW7dfekf8LdRPyy7MBvsktiUWlZaxaPfkNbnYuA
         ILMQKcPIoRY1VPoPIg1Ps4g0XbU1O1SDCQ7fAiyYsGVA0F1oiyx4sd33vww3jARSdtft
         d+BiSlsyUG9XSnOgpPeuBXsLSVxKSveDmfscHjMppOdpECzL25MbFqTV3AuaP8823WnW
         PO8g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531FwuWudLNYUOUp5lhF+K7V6ZQr98nKUC+L1lHsNLE5jdDhUKtj
	HjKi68lDRhSdNmeBRczJVyY=
X-Google-Smtp-Source: ABdhPJwYT5BTo85ovJbzbaYKvxo5gLlCwYALK6A9+mFC8Zb6WbxAmBldYQaH+1esqDO6NcXCdr+EHQ==
X-Received: by 2002:a17:906:dd2:: with SMTP id p18mr12304502eji.211.1601838012304;
        Sun, 04 Oct 2020 12:00:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:71da:: with SMTP id i26ls3133964ejk.6.gmail; Sun, 04
 Oct 2020 12:00:11 -0700 (PDT)
X-Received: by 2002:a17:906:1485:: with SMTP id x5mr12280885ejc.163.1601838011132;
        Sun, 04 Oct 2020 12:00:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838011; cv=none;
        d=google.com; s=arc-20160816;
        b=DEsNMA2xEOm65ymm//ljZTMiD6HMZITT6CoVr6ZZPwD97S2zhrDovE6POgYcwEC7Ez
         jI4ooxrfkKUhPymx7qsoVjw2EmLy6sGtMBjNFJxmH+ul/+WVu9NvWmEkDtj9EjFkvy0r
         ZJcl31jras4NhnqGGpqBGvMpe/tdBDhA9kQe2FQaeBvccV95mTbWYZfR6mVtdjNAwlhs
         njYtF0FaR98OL9mjkR623UEcV/IUAlf5wPHxOezXFcbhgHytRRrzMPy24oqkpLrIdBcV
         n6fA0nCv/e9YDXtpXdkTEA6tJyVdxcWPKCmjWgPM2z/nPuBC1xZE0uiGCC6xDfauEgJF
         xigA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=/P78PFPHPpaTs8XGZ6fTyZsN/8ZI54mEuH66vV5wsbE=;
        b=sjvPnjNzmqc7Cs8VbdIjImA+0zjh/71bxBAcvXiJi5a/WOKFpNRm2C0Cyd7W2ZTV6q
         7nvrzePqLrbl2WFhBHVoA9EMSLC95puzH+ohwiRBSt8A4xlmcvRvEYV6A8FONzT7RuMF
         CzZWQoB2lDiTMrLeM/mRIzD5wUgvOshOlQ3k2hQtxTPW+jsrRQwbY7/tewLBUO46ieAK
         dTylOFA9rlb2UwEdMBGFGl1hvv0g9oBoFncWdmWPNFRO9o0Kr/1l+H0GMVZIpRwrDo3N
         8yvOjsWdU2J4szF0BjT1mUQCrQE6+BdIn9+YkG3IuN60oEC3jouN9hOD9LUd0+mpCMj9
         /iWg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id a16si322007ejk.1.2020.10.04.12.00.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 094J0A1I004299
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:10 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060P017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:10 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 13/45] arm64: smmu: Tune output
Date: Sun,  4 Oct 2020 20:59:34 +0200
Message-Id: <05038bf42660279774b93e05401732af771f19a1.1601838005.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601838005.git.jan.kiszka@siemens.com>
References: <cover.1601838005.git.jan.kiszka@siemens.com>
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/05038bf42660279774b93e05401732af771f19a1.1601838005.git.jan.kiszka%40siemens.com.
