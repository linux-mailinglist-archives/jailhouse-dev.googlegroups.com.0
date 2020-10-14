Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBY7NTL6AKGQE37VLDEQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB2228DB74
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:23 +0200 (CEST)
Received: by mail-lj1-x240.google.com with SMTP id z8sf1046167lji.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664163; cv=pass;
        d=google.com; s=arc-20160816;
        b=oMSITVUuoTSh8vgFdWpcBpkNrxfe90mWIH88JYORqS6VdL9fXGdGECqhFewVZwlack
         ZYknEJ73Lf1Cqw4ZRAzd/DIQ5AbyqEy5F5weE/ukE+e1L8F+YL30Qgv1s+jOJvaybiC1
         yqA2zMrM0uwl/b+Vvxt0Qk1unVG4gSCbpMdk1cP6JgN5wi8UvGdqtbUvPmX2+kN9QIJG
         8TQazO7Mq0LAfvTE9b2I2RE/TPEqO9euDKc7BhoBvAU2bBKPrrzGP0OuqPrdQKk5FLCw
         tynyMFrUUdoDJAcf8f4wM+H7uL7JaseGYga0Ak51EsJ+UbPqpF5c/6mDL7EfuVVh97Y8
         +NZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=Bl7icajTCIJHCgxX2Ds1Jv2wxfAoOG0mj8cA8LBgous=;
        b=bYM6MBB1wlmDmX+M+PV2rhNo8WRnFTF3YEk/R7oWbxWnQQEZ3wqjaA6aUX50+m3i5w
         slbW2lzvOmOM3o59hD4I1r3xBYFrRNGy+yT6L9yokeFuxr+gt3AreAJWgIySpoOH04JA
         cGm/ytyHKX45YK5qgIugGsXS4d7YR5KB5jyaC1Eq0pRZb2aimcavi3DeH7/bLV09JpSG
         jsTLMEHx5rcQLXGUgPCfj5WpmV9/tmlqgI/Q2qLafwl4QxSOoUUHAnu4qhb1+8zY3uUF
         aQi4u0V4JIxN3NBU2sycL/RJdmDPUc4NC3CxVHPdc2wdhLQMsK06u5xYrHogAXiJZ6Ep
         wqZg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Bl7icajTCIJHCgxX2Ds1Jv2wxfAoOG0mj8cA8LBgous=;
        b=QWleuelPY7SzMLA8tLGtVyca0FRI77dzHHIpY7pY4ZrUdVJejfiE6QAdPJb6m/Fazd
         mVcwg368ja5mtdOghQ9j6zJ63Pv7spXDa87FEwv4cLbVFG0WdghLxH3jUUn3ibqg+Jn+
         P6W+/ZOq7nNhNe33ReMK6O4FzOyi/Uqq2SiIYI9wiHLxQrl8F/gwVEx7igdOTKA5Wk0u
         DKviYcQYagDYPpK61fFk0tSWNmXu+IBRtyvu1pktWmS3IyU8rhXOH7sng9V+uQtSMN/O
         5qc79LT8Yvopcd6K6/d3SRVd7UIZKOjfrSPFRpEoLWCGy3zt+snS6Qn7DTejp0hZLNht
         0fwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Bl7icajTCIJHCgxX2Ds1Jv2wxfAoOG0mj8cA8LBgous=;
        b=eFU3VUAXpZKdvWW2Bp/rmwSnKppGelnKqlFOF60xWmewLx4FJkOQI8bic0PRLH41Aw
         1s6bIetHVwFR9mmvzqv/uG+4x7TqSnNNf30pxox1P6LrQPjbGaKXwvfQfLRXUstuAnn3
         9LEDA0u6nIenN8oqChbMJPeq4IFYYtb0E0tpQcBQPILN0EXC/oeD1R33S1MKWzZyv8Qr
         unQjnOFJLJLvII1dd/b8DTA1ajgJ5h1NVV4A219R5bpU8l8KYX/74svlJesHhTVlDsIJ
         eX/avyjR2pGDDzbXPYdtgAle3J0I5axxjrDl72k1ENFlxGYod0pCvrSxrRO573VdJhpI
         6Cvw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532ncbK/3aKLBd3sLU08yPdddghnykmdmByVqdTAGMRVVahQn2kd
	IU8ec7wRY8uHBJKh85CPtoM=
X-Google-Smtp-Source: ABdhPJzMCFMH0npY5dpErrNaZQ2lGEuLJov9YdiRp03RxotaQ3dSJ7srlZzMHzCjPmYdj4Dp3qMZJw==
X-Received: by 2002:a2e:b60e:: with SMTP id r14mr1424892ljn.77.1602664163353;
        Wed, 14 Oct 2020 01:29:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:554:: with SMTP id 81ls1311582lff.1.gmail; Wed, 14 Oct
 2020 01:29:22 -0700 (PDT)
X-Received: by 2002:a19:650a:: with SMTP id z10mr1108580lfb.9.1602664162204;
        Wed, 14 Oct 2020 01:29:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664162; cv=none;
        d=google.com; s=arc-20160816;
        b=fb+CrJ8SFjrlTXFGK3BKto7EL99u6UyxTKcRRDdAzyrih6D/vCJq3Zok7PO6+CFlHb
         gJ6JDQV+Tar9sXgTK2Wimsjby2N/gs0Digm6tXbkjDW/MX2JLmJkqqTjG41qM50vNTLi
         ZU1YTyfCAPU3HY/HKJhg/4JIXp+D+WmoHuFPNTGdpEeCD0K8CwrU8sBaNNLHHqZqNVo/
         QBNcGZjIKrAeBy+o8ekg9YOrfD1g4lASKTTERWbwPjtZ958UIwPwenHtce3kB1+f9+5B
         Fr5VW8HZbCPWR2fAopXj4Ge8miQVZk/IYtvkkU0TVXnrtE1dBvOmxPELfnuMILakPecZ
         Z8iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=ImwcZ7HzuLuYGTWCzZMBfgox1B5o3TptbbW5t9EX/lc=;
        b=FbjskzPC8rIwCHnx0kBNzubvxkgqHs95gjq9g5st7Mm8WmHS5lDK4qthpc/TP1ffbw
         elutAUOBinPe8SO6ewRbWxoassEI6H2+rq+zcvV/xjhF/OuFSdrOYqpduoZzSrbzffVn
         6EmSZhKGwEVb7BpqTy2dJI2ykHNTE2uTby5ZQvAf1ougif1anFhN7yks+PvZaqMNNoAl
         bt6Hq9PtFvQManrds+xgCZX4p2x9abZDaK2NJv7ptk9Zdad16eFr30oWvObkzHM0ukXT
         PnbtYGkvs2wPaMKwCKtLa+g3X/ovmEP1OpxYYN24i5t+hCcTSemnrhsaSpPfrOuQJO+c
         g4aA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id w28si76833lfq.3.2020.10.14.01.29.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 09E8TLWo001728
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:21 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAJV002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:21 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 45/46] arm64: smmu: Clean up arm_smmu_tlb_sync_global further
Date: Wed, 14 Oct 2020 10:29:09 +0200
Message-Id: <b521f58bf199d9080c5bfb9049bba2e034df59e5.1602664150.git.jan.kiszka@siemens.com>
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

It still contained fragments of the Linux back-off mechanism which was
removed already. Adjust the loop counters to the new iteration count.
Will wait at least one second now.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 25084b16..347ce223 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -185,14 +185,14 @@ static void arm_smmu_write_s2cr(struct arm_smmu_device *smmu, int idx,
 static int arm_smmu_tlb_sync_global(struct arm_smmu_device *smmu)
 {
 	void *base = ARM_SMMU_GR0(smmu);
-	unsigned int delay, i;
+	unsigned int loop, n;
 
 	mmio_write32(base + ARM_SMMU_GR0_sTLBGSYNC, 0);
-	for (delay = 1; delay < TLB_LOOP_TIMEOUT; delay *= 2) {
+	for (loop = 0; loop < TLB_LOOP_TIMEOUT; loop++) {
 		if (!(mmio_read32(base + ARM_SMMU_GR0_sTLBGSTATUS) &
 		      sTLBGSTATUS_GSACTIVE))
 			return 0;
-		for (i = 0; i < 10 * 1000000; i++)
+		for (n = 0; n < 1000; n++)
 			cpu_relax();
 	}
 	printk("TLB sync timed out -- SMMU may be deadlocked\n");
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b521f58bf199d9080c5bfb9049bba2e034df59e5.1602664150.git.jan.kiszka%40siemens.com.
