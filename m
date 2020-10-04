Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQFX5D5QKGQETQUV4XY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C4D282CCD
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:17 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id u18sf286189ljj.14
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838017; cv=pass;
        d=google.com; s=arc-20160816;
        b=w3cuxnF+gQb1u/gQzgzYaJU9ERUnujbrBHolk1GMhLRX2JKP7xlXtGef647rdd6xAM
         z5y6Q2p5fatnoRPZf9gVMoG6pnAz14VOqlaWizK8L6N8Xpfz6L3kLMtYV9pYamVI3Diw
         MqnyP2EOu6Bw3OTc6hr64lk6U+nXLWyvzNfMxUDCJMEBA+Kt7GbfVReHWF9n5UO8Za94
         EL6X61yCM1pIIcr5nLmAlhHmDX+FhC0k/5/EyD0pIWYELBBKEXkdKMgnzbAWooSz4AVt
         6zsZR+5E6EgR/kxoxDVqkv7ThB0rJ4RFHyjmfW5M/gQYO5+hqLbr+qR+ndO3OVhpTRgi
         K/Bg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=PbcvOz6U9ZCPRp9G3DmoMD+zkg3f7AW4DGSTCWSkVgE=;
        b=GimO9qWOChqU6Htdtd4b5aYJzGR9lVaN9/0eI2UaxhOij+YsVGC1hMe9v1NqaY80xs
         WCAtcGfAmQJSpH7gVhx7v64AejLxNdLPxDo+19BwURim1EO6IZobHW2YbluyxGyoAgch
         R5rrP1hUY4cOXkCaY+wmPhBBE+e3eNHdJJFDYPBd6B5c7oPjnqFNirqUTYzGWlMb8od+
         7ERbmIgQmHD941EBxoDZFbpn1Ki8+mzCZjEpdIhcjo/hnA65ir4vAsce3eBA8PHj2wW9
         EOw2tiCrHytHh0J9q1TPjHcaCNHM3aKEqVyFQyg6OD6/2/b126zcPDYiKbflHOeqm0p7
         0+1g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PbcvOz6U9ZCPRp9G3DmoMD+zkg3f7AW4DGSTCWSkVgE=;
        b=iddxx4G/ZfQKSHBTXJ79RgIrNR5aKC3GK3nDBt+aVILGC6SlD7ixZY4CTPRsBrFjZ7
         2UmkQ6YFYGySkeVd7miAb0ndkKe7yHXF2xRVecSjx+PN3ewu4mV6xPe3KmpDRVtgiafH
         kPxK0bEaVuUFo1ONfAYIcnHvX2GOxagH1eFDS3gu0WvyAX6v2m+tEWSARhg4tGBZXErx
         lgxVvdVpfaUF5iNvACry1VLWx96CqE/fXjHpMkqp45PtHUhVBQYotPHJ8LfwZ5Pn5bja
         HnxpmYG6fK8RpE0FOp4QEixuh7haOTE3T/NymiIxcmZvxnokVIdQFgXNraZ4p7buxkLQ
         Lu5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PbcvOz6U9ZCPRp9G3DmoMD+zkg3f7AW4DGSTCWSkVgE=;
        b=QsonI733B+vpjcDx4DqZZF2GqfGb3J3YlpMKxraScuA+kW4tZAyvzgtaMcnvYRCNsA
         iDd53JDlYk+VMDP9eD3HtSaU/hWVdmW4baJ9wKO/XElxsPmxcesFvWZznIawVulnGWNW
         lkjMiAGmS9c31Z6aQJZqgLQx7BiQIyQfeke4pdbY+b34hlpCNAMPOAl42Md7fZYg2JWl
         UI32fc6JkfYWSmp9aLEB9m7f0WmOO6o8u3lHH3bXhFBfSJMyR2Tj3hWTBv9YusyIzuvG
         6K57PsPTERe/WRiq4A4hzAZvuZG9ys8OYZT9GxELYtveahASvxjZSs3uRvKPDO9tuDno
         wUpQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533mT1KAcphaIcQbJeKf2Ew4XafwQa3wEB9YkCVGCq5wBgjssG8F
	ohXiN4prQH7WEQm8HvATxYs=
X-Google-Smtp-Source: ABdhPJx6FUqLXaJ70DJtv0Gq5oALJvU/CBt9KB2OfJsWVAbc2zKVTFm1POI2eLvREDs/SebF7gxVQA==
X-Received: by 2002:a19:420a:: with SMTP id p10mr4721530lfa.513.1601838016871;
        Sun, 04 Oct 2020 12:00:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b0e9:: with SMTP id h9ls750646ljl.5.gmail; Sun, 04 Oct
 2020 12:00:15 -0700 (PDT)
X-Received: by 2002:a2e:958f:: with SMTP id w15mr3468238ljh.449.1601838015646;
        Sun, 04 Oct 2020 12:00:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838015; cv=none;
        d=google.com; s=arc-20160816;
        b=pI1uG8bCWKOciToiJEG2WG3XX+bPwFQizpqD4wZ1QF/2Ho1nG6ylNxUFAIu6LVYJvt
         A14mN3VLkk5O2aHuuSfUVZDqq875wxUmV//GHrNHh4LO+RdhqYY39HWbtDsy3H/ej8u1
         sBZZElQ8Ninv1dkULbKJJCZHnj0KBHWvrDHxDYJ8UHUSaD7I3wuyzFI+ElD/j6gm2Bw4
         FLft2/Pu1BIa4mgxR0wuoCt8B3ORZM+DLOzc3BoeZm9ke9xOKA8Km/64V0TckWfokJrr
         ut36kmZMYbIYTKrCvVS7oYP0VD/MP7ub9xr3ofbT6AKB4v4d7Spt0LCsK7SKUozH2Iyz
         RDgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=0cEgmak76xxqBzIie7Ha7hz4lmbsG6o3v0vHQrnOcwM=;
        b=BrQHqP3rkix6RxmOfTwyKN/8Y9GDAoOAvwz1zqZmTJIOcEv1urr4WozSRpjKRJIi2y
         JC1dY5AB9q72cfjg4gcT5iifIMxPX25QE5Hi6hVUtsRZMcG3Z+WmU5jD3/6AH/k1msol
         pJbm57BNDirxB9bbGdXM+y8GhoSqRkqGfjLEjDNQsPpr5kQ1Yqrm83WHi2+Iah4wwt4N
         inUbm2Mf0QrJMNA3xt+xFx/Ys058FncHm2HXq6apQTmZ0/0DLt/JPhEDv+YizlbFAaTJ
         JJRE75LJYywv3CQQmvIH80fNFev6hfS7/bHEGvXOxUr0O+Gc2IaedFXm+VXrlSLgieHx
         5OKQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id e1si288753ljg.6.2020.10.04.12.00.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 094J0EPx004405
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:14 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060i017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:14 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 32/45] arm64: smmu: Introduce arm_smmu_disable_context_bank
Date: Sun,  4 Oct 2020 20:59:53 +0200
Message-Id: <71b92b25905c132d73eb08d181329f21b6a30be4.1601838005.git.jan.kiszka@siemens.com>
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

This avoid having to carry the information if a context bank is enabled
and makes the code more readable.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index acfe0cd9..0fa48588 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -265,12 +265,6 @@ static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
 
 	cb_base = ARM_SMMU_CB(smmu, idx);
 
-	/* Unassigned context banks only need disabling */
-	if (!cfg) {
-		mmio_write32(cb_base + ARM_SMMU_CB_SCTLR, 0);
-		return;
-	}
-
 	gr1_base = ARM_SMMU_GR1(smmu);
 
 	/* CBA2R */
@@ -298,6 +292,11 @@ static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
 		     SCTLR_CFIE | SCTLR_CFRE | SCTLR_AFE | SCTLR_TRE | SCTLR_M);
 }
 
+static void arm_smmu_disable_context_bank(struct arm_smmu_device *smmu, int idx)
+{
+	mmio_write32(ARM_SMMU_CB(smmu, idx) + ARM_SMMU_CB_SCTLR, 0);
+}
+
 static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 {
 	void *gr0_base = ARM_SMMU_GR0(smmu);
@@ -341,7 +340,7 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 	for (idx = 0; idx < smmu->num_context_banks; ++idx) {
 		void *cb_base = ARM_SMMU_CB(smmu, idx);
 
-		arm_smmu_write_context_bank(smmu, idx);
+		arm_smmu_disable_context_bank(smmu, idx);
 		mmio_write32(cb_base + ARM_SMMU_CB_FSR, FSR_FAULT);
 		/*
 		 * Disable MMU-500's not-particularly-beneficial next-page
@@ -598,8 +597,7 @@ static void arm_smmu_cell_exit(struct cell *cell)
 			arm_smmu_write_s2cr(smmu, idx, S2CR_TYPE_FAULT, 0);
 		}
 
-		smmu->cbs[id].cfg = NULL;
-		arm_smmu_write_context_bank(smmu, id);
+		arm_smmu_disable_context_bank(smmu, id);
 
 		mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_TLBIVMID, id);
 		arm_smmu_tlb_sync_global(smmu);
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/71b92b25905c132d73eb08d181329f21b6a30be4.1601838005.git.jan.kiszka%40siemens.com.
