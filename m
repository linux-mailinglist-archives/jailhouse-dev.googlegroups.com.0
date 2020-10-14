Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXXNTL6AKGQEXVI3ILA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD2F28DB64
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:19 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id f7sf293428lfj.9
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664159; cv=pass;
        d=google.com; s=arc-20160816;
        b=IxF9CJw+2GavZHTF+n0QUCtjoI8VK0rNiGndgNQMBKmynqw6FIu6A+JD8O/jY5gJiH
         u5XxyhInjCDkoTvlFatDtLHIBtPOXA2NBEFoOuPMz7JTzYuPyN3mdgamBvkCRkO4I5Cm
         AIcgb4NXj3dFJo4xS6W+rKp8fbxq46hbVkwDH3DTX/ciMby0Oj30AcA9b0HTqtPcfQWy
         A+y6Y+a/HEob60za4R7JrN20G4x39iEesYAGr+AwR2qvPakx9/bCTKrbFb5Ty8+GtG0y
         IztCfDRTzuP1AiS9C8triI7iNnJriyVfkaYL66zpCUNv64oDOTN9uVBy8B1pNj52eaMF
         eFzA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=IQDiVls28XK8Rvh3NSSfvtoW0KMGmucsF1Bm4/rlgxM=;
        b=xIFd+8yel0dt8YhZAX+nsWzOQw5IP3RV4uT7L3fwE3sqRHP8CEmHG9nX0cDcxdVhI5
         FpBOLE2BV4DMsMHoPrgnX6LW4hFP6ZfB6vEWjZ93X5lm890a3JTPyGgBvVZVUnDhuZIc
         fwFfUmprM6lbJllcncP3g+kPD73X0ZmtDe2DfrSaazyEWSPPPLJzTwfQJlNl4B184kTE
         UGdPadh/JwOAfj5BIQXrC0pz8OlqftEyJ8nMNdOiucaxYvFnXkpoLx3/Q9J6qSUEVadd
         wMwtmhT+NQtzdkDv94E4kOdxgVI+ZOkS5iXxYUAt4KLQ1XgKtepdkouSJi5PwxrVMjNj
         JUUQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IQDiVls28XK8Rvh3NSSfvtoW0KMGmucsF1Bm4/rlgxM=;
        b=ara/FvEfhoWrr3s0Llw1fp0rUur5KpTJgtj25nVWZ1vgkKnQN33TlHKuLlJ3PLCJai
         t+b2MJ/3+m8/rjVv+ecT4KGQJibX8GSnEo1F5aO5Wh8f8/HJ4k0NCsUDWeOr7nnKXacs
         yuKJRzglgpdhBcjo3i5K7oVWgPKUWZTdJMUqekakvAWXIAsn4G//86QE+AT+KuSiW3Xt
         c4MdI7VzOhJ7k/pM4GOixA/DyEaakZ0WP/Dr0Ld9Fm/JvX7uDM2RtbdxWnel9u5EU9G9
         yxFGxq9weDow4xsCoF5dkjm7xQISuJCeacFCz7+gDgOZk022g/j1ak3NxCABnFF1YzNh
         ncqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IQDiVls28XK8Rvh3NSSfvtoW0KMGmucsF1Bm4/rlgxM=;
        b=n7OY9HixERHYIQ3GE078MHA9LLfHJ/F/Yf4rMvtFBlMa67zHq8B7z4atsy2amXM0nh
         fd8yku5bz92dBbIbPekBkrNTiOiEbcQyKa8dvP55e9sJmtDiuDQ+CddaNALH+mJNIoDn
         WwkRrk3A2+T52VgXu9l1uw1sGempAp1PFAV1ZAw1GoDKT7ieuj2zjoZnR0zk5LEe8YQu
         M6qIhq5VpymHneywK2ZIK8bGOCfgCK6AT0IUECihe8K7NqgwVlcjP8JyTlwGKDBTteE8
         NceJ+chYl8AYL8CGMDkgsyvMsFaZyghJK+c9U7lOSUuLluVTvw3yCDmPg5QNB/hsuWY9
         1r3Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530uNTWlTIvIi7uOzVqFxNn63BRegbrrI+0zOLeGu5IR2XNKuiyH
	3j2JfuMJCpgR46KJr+4VBQk=
X-Google-Smtp-Source: ABdhPJyMqGovaDDam6Q5lJMtQrsSNX2/uWrcGae9+vcNgRhGYtE0VIGVyVO86SeMNmYMf1aXBb/zdw==
X-Received: by 2002:a19:9150:: with SMTP id y16mr1116807lfj.190.1602664159301;
        Wed, 14 Oct 2020 01:29:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:84c1:: with SMTP id g184ls1310990lfd.3.gmail; Wed, 14
 Oct 2020 01:29:18 -0700 (PDT)
X-Received: by 2002:ac2:5e38:: with SMTP id o24mr1136360lfg.18.1602664158171;
        Wed, 14 Oct 2020 01:29:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664158; cv=none;
        d=google.com; s=arc-20160816;
        b=J2IEN3VaKq1SaxONV0rg1bwXlHP+fIBTzchnYx67laJM3R22zDjuYpywAnBgteWUNo
         qeItmWhv6RpL6diFCmb1dNmsBOkflXwEyR86CbnO0egXJuA2XssnEyTscMePhWcZE/Z/
         PwgBg+XuofJXYc43juDeiOQVW5XG7aARD78SGUhErGLe9X2w/C8syS70WLP3ZU+A8Wf7
         kXIeG+Ob8/sJmtVAj2y9KBEtuMOIn6Ggl29/Ws9bEfd/aKG3PlVSxhJESea6N2himceQ
         I4PD/NZfROYj276EP4c3C6WSm3smGz3PIbOPzqSiA0sJY130CsdVjiFmr5BIii/6bP/e
         dIpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=OyYsJ/8JUlya3Y9Fih6s76JulUuOssK83VQZjh20Kms=;
        b=T+kuMI2cK21Bprd0mIniZaEO16KGedvKMFb2qB6nTthYkBZl39dllZHkKuhV5OXWC+
         sqV/7k9ou0QEUrqUfsI+Ykhhq6adfeNOUJmBPX/J6A66cHOf1tlLj4wwJM7xQiYWNgFP
         eR8Fym1PWjntpcc9U53LLy0xFJIc5zt15gO/s4xu8DB0kPSQW+OmElNdliwCWavPFE4N
         3qk3iY0471jPiI8Q3jqJovv3/5wpTAtFK8GvO3p1dqF1c5BPudOQ4hj+oTt0T0NOFFmc
         FH5Xf5uWcoSucXeoaN/XC5/ElCxxjPKnh0b2+SdO1ifR04wMW61A5HC7uf1DYv5fM4Gd
         NgJw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id i16si48600ljj.3.2020.10.14.01.29.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 09E8THGD001629
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:17 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAJE002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:17 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 28/46] arm64: smmu: Drop 16-bit VMID feature
Date: Wed, 14 Oct 2020 10:28:52 +0200
Message-Id: <cb29f56b3a793a5df1393a35f1cba3245503981f.1602664150.git.jan.kiszka@siemens.com>
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

We are limited by the number of context banks, and those are 128 at
most. That fits into 8 bits.

This obsoletes the features field in arm_smmu_device.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 25 +------------------------
 1 file changed, 1 insertion(+), 24 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 31e7f4da..f71c5a81 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -17,7 +17,6 @@
 
 #include <jailhouse/cell-config.h>
 
-#define ARM_SMMU_FEAT_VMID16		(1 << 6)
 #define ARM_SMMU_OPT_SECURE_CFG_ACCESS (1 << 0)
 
 #define TLB_LOOP_TIMEOUT		1000000
@@ -48,7 +47,6 @@
 #define sCR0_VMIDPNE			(1 << 11)
 #define sCR0_PTM			(1 << 12)
 #define sCR0_FB				(1 << 13)
-#define sCR0_VMID16EN			(1 << 31)
 
 /* Auxiliary Configuration Register */
 #define ARM_SMMU_GR0_sACR		0x10
@@ -88,7 +86,6 @@
 #define ID2_OAS_SHIFT			4
 #define ID2_OAS_MASK			0xf
 #define ID2_PTFS_4K			(1 << 12)
-#define ID2_VMID16			(1 << 15)
 
 #define ID7_MAJOR_SHIFT			4
 #define ID7_MAJOR_MASK			0xf
@@ -122,7 +119,6 @@
 
 #define ARM_SMMU_GR1_CBA2R(n)		(0x800 + ((n) << 2))
 #define CBA2R_RW64_64BIT		(1 << 0)
-#define CBA2R_VMID_SHIFT		16
 
 /* Stage 1 translation context bank address space */
 #define ARM_SMMU_CB_SCTLR		0x0
@@ -189,7 +185,6 @@ struct arm_smmu_device {
 	void	*cb_base;
 	u32	num_masters;
 	unsigned long			pgshift;
-	u32				features;
 	u32				options;
 	u32				num_context_banks;
 	u32				num_s2_context_banks;
@@ -294,23 +289,11 @@ static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
 	/* CBA2R */
 	reg = CBA2R_RW64_64BIT;
 
-	/* 16-bit VMIDs live in CBA2R */
-	if (smmu->features & ARM_SMMU_FEAT_VMID16)
-		reg |= cfg->id << CBA2R_VMID_SHIFT;
-
 	mmio_write32(gr1_base + ARM_SMMU_GR1_CBA2R(idx), reg);
 
 	/* CBAR */
 	reg = cfg->cbar;
-
-	/*
-	 * Use the weakest shareability/memory types, so they are
-	 * overridden by the ttbcr/pte.
-	 */
-	if (!(smmu->features & ARM_SMMU_FEAT_VMID16)) {
-		/* 8-bit VMIDs live in CBAR */
-		reg |= cfg->id << CBAR_VMID_SHIFT;
-	}
+	reg |= cfg->id << CBAR_VMID_SHIFT;
 	mmio_write32(gr1_base + ARM_SMMU_GR1_CBAR(idx), reg);
 
 	/*
@@ -392,9 +375,6 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 	/* Private VMIDS, disable TLB broadcasting, fault unmatched streams */
 	reg |= sCR0_VMIDPNE | sCR0_PTM | sCR0_USFCFG;
 
-	if (smmu->features & ARM_SMMU_FEAT_VMID16)
-		reg |= sCR0_VMID16EN;
-
 	/* Push the button */
 	ret = arm_smmu_tlb_sync_global(smmu);
 	mmio_write32(ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sCR0, reg);
@@ -493,9 +473,6 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 	size = arm_smmu_id_size_to_bits((id >> ID2_OAS_SHIFT) & ID2_OAS_MASK);
 	smmu->pa_size = size;
 
-	if (id & ID2_VMID16)
-		smmu->features |= ARM_SMMU_FEAT_VMID16;
-
 	if (!(id & ID2_PTFS_4K))
 		return trace_error(-EIO);
 
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cb29f56b3a793a5df1393a35f1cba3245503981f.1602664150.git.jan.kiszka%40siemens.com.
