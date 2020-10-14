Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBX7NTL6AKGQEG7YJ2EQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 6587928DB65
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:20 +0200 (CEST)
Received: by mail-lj1-x23d.google.com with SMTP id h14sf1042751ljj.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664160; cv=pass;
        d=google.com; s=arc-20160816;
        b=F/rxfM/EI/lUrxK9uk3ZlNXST5lFqDH6EauiAdqJ9Q2PgGRsgB4luuczwukj6PfZFz
         7eRJ/kizYgv6drz+cKa+id6saJ0GGA5acl4bWtkm8DRLgKWV9/Z7XN2n+VbqTUkXfwz4
         jnLSJTvPWKYQoj3YUEWyXlOVvILwoa2Qrb6JorYFwZEmMRUsBw4+f8KYdJrcucQnXzCU
         OhW811eODFl/Ugnz8Hh4w5EonObcbg3aRQYZZz5zsysf8+o8odPWN+Ui3V6TC40UcesZ
         FWa/WSxAPqX/PchAe2F+k+NPcb2TJqSA5ZdZBETbXpF2ZInFYSRWaJZG4i4jIhYmqUDF
         lpJA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=4HOOME1DgJ+qLFYB2luUyCNJarYAJsFtsL7y3ZTRzV8=;
        b=sZR0/FCfw13nccbbmwmzR0eoCvqLhGcfxYv+u0b45vFPTM2DomeRJ2LsMb2PQqpRCF
         kVC3Hz94wgDOsGFhrlRyyBMHXNnH9qYSFVwOcsY9JkdKx0pge9IJqaMkmH6G/GhTUa9a
         WnD/p71xKrU0Nr2D0+Eh7QpD+hia9EhmuZ9k/VgDgTEkKghYkasR4WRevFAAudCnzu8Q
         7cSYSDVDoYFXOGu8jAt++BNSJuMbxgVqRDG5gGa58RLkrkDfpTDKWVTCLQSTOHgatVJB
         RWUAhw3GsIEVuvzs2UznaRBpw8eBn+1m+6Mn1HW9NxbbTpzsOiBwkeHNPgu7OOdGwbJB
         sKyQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4HOOME1DgJ+qLFYB2luUyCNJarYAJsFtsL7y3ZTRzV8=;
        b=FXci30MvIuDOqBzmJ24Hq8pL2xcbhLhjcDaM+ksqrxeiKwXGQAP/FStwX1UtlsCiQ6
         pki1X812kgFqM5idzOsOI7adnDzXTOi/7yMxiWJtBSyGjFCgysn6QNlc29ELDGEEX9HQ
         +ocg2l7zKTbyGwwht3i1Fl6zAGzT00KspcBu7zIaXTpiIjEzuXfoEmYqPW6EKu6r7lFB
         jVqALSMqKwUBO05wJUhsvE/Hf/BqhNEiPfZEkmTV+qgMz48P1a2OCnM2KHRqoTN0eSkM
         enUkGqkfjdDTKuIivCVcBKELjuveyhMz9Wwi/mn5XiELvYd4ZSAcors9jRW+OxYpYKd+
         sXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4HOOME1DgJ+qLFYB2luUyCNJarYAJsFtsL7y3ZTRzV8=;
        b=IRyVx60Se2dFyAXLLPcpW5nzVtFjGumVjuvmUcszBYR56B4cweFd2tcwUy5hA/IPxN
         SmN/XQH6YVVZXJE04JlUQ6JG6mUQ9iWzBDy+qguIXluyZTqDK/85XSFa3RaWlbMHDJsR
         tJEqioh8Qqd232v7l5TJ64jNpeaR0Ps9OkzC7BneKkrps1KCcjiVlsRlgWLMCFgrm8jT
         qI8wHnpnsJoiIGIYhrYmQSsvdvZYcJyifoOPVxUKlfSrQ8WIPEufcQX6LOnMSLz8PsjC
         dWzTAgdy/ye7wp0/B66J3DmNvWpiZKLP3UXDy3bkK3Xqfqc3fw841r9mQGC1PLolfw9A
         U3FA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531cxiiJ8Gh3Cu8Y98xrvhmc6Loy7UHv3XsWCmsjHezswL8ygV7J
	bnf+FHZknDG1rVExCnu4PlA=
X-Google-Smtp-Source: ABdhPJzUkP9l4HqSCaCLi86Qdt3G1iD7oi5vzTTbxQkL3zK7K+pOy8cNbUatelKmpqohx8/BW4kmIQ==
X-Received: by 2002:a2e:a162:: with SMTP id u2mr883205ljl.283.1602664159972;
        Wed, 14 Oct 2020 01:29:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:554:: with SMTP id 81ls1311491lff.1.gmail; Wed, 14 Oct
 2020 01:29:18 -0700 (PDT)
X-Received: by 2002:a19:68a:: with SMTP id 132mr956702lfg.429.1602664158700;
        Wed, 14 Oct 2020 01:29:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664158; cv=none;
        d=google.com; s=arc-20160816;
        b=HNeMfu0z8cSWQhBxNcHfxk5BfRRaVeKW9r07WWO9SF3v7smXMkdLqEN3zWJzoW0+OK
         CyrXOuZlmHy9MRKRY9AyiR8pXyZ1HTyKktgFvUjF6RyAcS3HHOoSw3t66e9laBatyqGo
         Hg98CXrqvIOf3l600CE0kDwD9G5sjg0JwBX+CuzU81vWMGPHo/oTxhdHhxcngx9GRnXR
         FQXjUwXQf4/AFRz/gz/y7R9BEH+VJPZDJzxPqbx4pC/ipv9yHLBceBeCK+qwTVHJdc0B
         W1Ahtb4NLYfubBN0Fn2lXp0g3K6ke8ndApe3UYGFWaakk0xML1HfSB+uJrFTzDJf2jK9
         kvTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=egRpVl+fg6FwsKbKWFEVvdvBFTf9XuXGSHYMBzyQI/g=;
        b=fK/bxiMO36Va8m+z0nLbgreoE/LlsnVVNU1UQvs0CnGH2hiJM90OZuMiB8ATWurf79
         /dwNBnbzJmm7l2hDvw10AdGN87q8FQPwdo0zXv/OQvMfbBCANmkYpzPiaaHQC9OW0UB6
         XPsAht89tHPu1ObgLAg4g73ENrrkRFeoXQ3BDxFO85K+ld0dBTEaIbrr+JqUyeL6vEVm
         3USZSsHosAEQLmMHn1xE++eyG6J2jR6Aerp54LnU9nRFm7Ouho2+XtXV/kFUhwIqZCR2
         cUQBJ82i1QMkQirAGOol3zrzHmr2F2OEsrCUlZPOevadwIwcHs+Ns02lsF6z3Dtfehfl
         Uivg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id b4si50652lfp.13.2020.10.14.01.29.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 09E8THe9000336
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:18 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAJG002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:17 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 30/46] arm64: smmu: Drop dead arm_smmu_test_smr_masks
Date: Wed, 14 Oct 2020 10:28:54 +0200
Message-Id: <ff6f3054245751d8b28e19377fc30df659f79d6c.1602664150.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602664149.git.jan.kiszka@siemens.com>
References: <cover.1602664149.git.jan.kiszka@siemens.com>
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

Nothing was done with the results.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 5becec19..95d45148 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -179,9 +179,7 @@ struct arm_smmu_device {
 	u32				num_s2_context_banks;
 	struct arm_smmu_cb		*cbs;
 	u32				num_mapping_groups;
-	u16				streamid_mask;
 	u16				arm_sid_mask;
-	u16				smr_mask_mask;
 	struct arm_smmu_smr		*smrs;
 	struct arm_smmu_cfg		*cfgs;
 	unsigned long			ipa_size;
@@ -406,7 +404,6 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 		return trace_error(-EIO);
 
 	size = 1 << ((id >> ID0_NUMSIDB_SHIFT) & ID0_NUMSIDB_MASK);
-	smmu->streamid_mask = size - 1;
 
 	if (id & ID0_SMS) {
 		size = (id >> ID0_NUMSMRG_SHIFT) & ID0_NUMSMRG_MASK;
@@ -471,30 +468,6 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 	return 0;
 }
 
-static void arm_smmu_test_smr_masks(struct arm_smmu_device *smmu)
-{
-	void *gr0_base = ARM_SMMU_GR0(smmu);
-	u32 smr;
-
-	if (!smmu->smrs)
-		return;
-
-	/*
-	 * SMR.ID bits may not be preserved if the corresponding MASK
-	 * bits are set, so check each one separately. We can reject
-	 * masters later if they try to claim IDs outside these masks.
-	 */
-	smr = smmu->streamid_mask << SMR_ID_SHIFT;
-	mmio_write32(gr0_base + ARM_SMMU_GR0_SMR(0), smr);
-	smr = mmio_read32(gr0_base + ARM_SMMU_GR0_SMR(0));
-	smmu->streamid_mask = smr >> SMR_ID_SHIFT;
-
-	smr = smmu->streamid_mask << SMR_MASK_SHIFT;
-	mmio_write32(gr0_base + ARM_SMMU_GR0_SMR(0), smr);
-	smr = mmio_read32(gr0_base + ARM_SMMU_GR0_SMR(0));
-	smmu->smr_mask_mask = smr >> SMR_MASK_SHIFT;
-}
-
 static int arm_smmu_find_sme(u16 id, struct arm_smmu_device *smmu)
 {
 	struct arm_smmu_smr *smrs = smmu->smrs;
@@ -677,8 +650,6 @@ static int arm_smmu_init(void)
 		if (err)
 			goto error;
 
-		arm_smmu_test_smr_masks(smmu);
-
 		num_smmu_devices++;
 	}
 
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ff6f3054245751d8b28e19377fc30df659f79d6c.1602664150.git.jan.kiszka%40siemens.com.
