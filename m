Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQVX5D5QKGQEAV2MSHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x638.google.com (mail-ej1-x638.google.com [IPv6:2a00:1450:4864:20::638])
	by mail.lfdr.de (Postfix) with ESMTPS id 1682B282CD5
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:19 +0200 (CEST)
Received: by mail-ej1-x638.google.com with SMTP id e13sf2394427ejk.1
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838018; cv=pass;
        d=google.com; s=arc-20160816;
        b=N3nNuSqIWtIiYWQi1L6ceROBXMIZRrpzoJyfx0rvqxsByGPywpNcSSV3/NYDESPzMp
         v8Ax8zIitNhLuQqrWBpMzQO3b/W4GpvHMUXUB610zxgkCrEz46DuTXm0sYeHdRpFXUA0
         j0ujU3S1g0XM3DBmcYe7yo/REcBs/Ugb8cdHBagHpGxSw+vzNm5wMPttmLVGa7ox9RQc
         D1aQfi8+Vw4tv3JtuHLV5j1TSCdXjLKN8wNg/Y69BvQEQlB8RG+yfBakmD0gNx95+Mj4
         J8vC9hAfonFdyoDnuVeft+TfzlEqj2cClUsxqLtzMzCI6HkRamQM2y1WvT9DrADD38qU
         op7Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=4yUSkl6rB6x2yBbpfqkDItzVcg45BIeZOkC9pGvdjPA=;
        b=j1sRF8Ne0+xtsp87kH45AYBzdRGgOvNfFYtn3io4O7plvYRxcVgnsEX30ZoxJoy6py
         4ZXt0p3JIshXtkQLqBeszubGGvI2Xd9lN7iyY7ZdHM04XsP2ALSm6VxGNnP7OGLEJkSV
         bSCW7l50Bzx+rsW99MGrvRTSIWBnErDWPtjdehUU4CpiJ21RLMC5eik3soVaLQZGep4M
         QL6ndekJaWxBgcM2Kli5VG7jJeFNF3f4wN1DPBGFCB9m6HgrEmM69zVp0WmQyQFjK4Fr
         Dk690Rkv6sg0OkOk6wZtkedhhA2wur4KmtUB82hQkoF/tuMoFZpC3psKv/aApsaZXmQj
         OmzA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4yUSkl6rB6x2yBbpfqkDItzVcg45BIeZOkC9pGvdjPA=;
        b=n3GJpqjM+MitjCWbOTMTQO4buXX2QwFa9oPiOINCyMux/TR+A6aVQcn+atDDzxEiEr
         Bw0xPLvSAdM4kM/kJO7X3ZaTErb59OTniXRiU0S1beRNnzTgbzGlGq8MW4j97rQ/RG1a
         n9qGJgARTFNv69jRVx85MyBXs6BhLSLdUq9nrw8mr7MxBdIets2pY8NfF41AVVy9UhS9
         xjkJLQ1eN0kGY2rJ3kSGXDGRJOXdPip81TkbPc9D+SmETs/Qce9sAv9mLFf8ktgYZch9
         ECrpr2YYnCg2XrCAsWZ/RNZD53CRtQxiVtEtD6aGniTqO8fJmVwVP8/pnU7a34Dm8PNd
         QoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4yUSkl6rB6x2yBbpfqkDItzVcg45BIeZOkC9pGvdjPA=;
        b=IgGIUwslD8UtOfHmA0uPDAE0Atc84zs5khwV7maINTxDY+K8dPp9b8lfVOpDMFvQ2Q
         6pQpxRt5bGDK8uGjsZlwqojXNq+njX86g2ISVL2iVRP81yb724M4lbu6yOtjZL2cJdvv
         vbXvfmKSbfO4WA9KGBo1YdOSYwntzv6I7XjYRoXOSW2svM00eFJxICZ2vyE/3C5RVk2+
         L5Rd6K0HEY6ImLd8pESFrXJ9fiwlavK6cNzveeqGZkkKc8/kOLNNbNMmvFJrn9DoQ+NC
         C6zUdGHaDzBAk9JLCU7nTm9ch4X8F7k0EBDdXLJlnmmSOY4xTbTKt5Gn3Z957fGHwHbq
         lffA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532TLfuAWJhvSAKgpbBrzvwr1VP7ArEgKxXzWHVNZgKgkzU9uuyg
	2W+dGNgVN+evrZ9+qv+fFhQ=
X-Google-Smtp-Source: ABdhPJxuWcwYVjKruQnnvaXS9LUCKJ9twH/DuI6mU3sJYMe4qrM+E/JlhHkIwSF/5gVeIkZdq8SR1Q==
X-Received: by 2002:a17:906:5812:: with SMTP id m18mr12400153ejq.204.1601838018814;
        Sun, 04 Oct 2020 12:00:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:160e:: with SMTP id f14ls2094028edv.2.gmail; Sun,
 04 Oct 2020 12:00:17 -0700 (PDT)
X-Received: by 2002:a50:b063:: with SMTP id i90mr13801869edd.187.1601838017785;
        Sun, 04 Oct 2020 12:00:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838017; cv=none;
        d=google.com; s=arc-20160816;
        b=rLVe4+AHNTUNJO2YEts6Y29f7T5C0YWT99LHb1h1IXSVHrGW8Ou+yzgruPcT+7pV6L
         5mCG1v48J0lDRPo1PK4T+uQGJq3DIRnc33IsMtAY+xUEqUSyqZDhjt8E5tBimUwU6GJO
         /v8w7/IjpIHfvXxBNDuPb2QI6OfdxiwE5E6720TGajwnCl2Vj3i9Co48IIL6RvNZWfp1
         7jfqtCjdxfvmd56Z6SLPUiTzT+x1K8nqFBmcukbUO8Q4I8r+W8hfYCZZlMktt3jYB6jG
         G/49FWRXqRj1A7R6FZK039oXd74nATRt08+0DzZA5hsjH7EeGhzwYfq0mdM17r5hA+jC
         AWiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=ImwcZ7HzuLuYGTWCzZMBfgox1B5o3TptbbW5t9EX/lc=;
        b=KkvRudUngRM+CRryx5kSEZ2jt2F7fUL2boB7RqnozY8qdPcjwKTLkoHX5u+/SZQDli
         Syo2ZQ/1HdQBRFULvoGoPZhAM6kCU9jntH5Ys06XvxMeN4SSYMigwqRC0lH2s2Q0v2h8
         XAAdkFseuD2SmO+f3m2FZSfGmfyy2HwjjPOWK3QqAFKhjhGSs3g8AfDwTMdsPkqJ324X
         Z6zA1cl+kF6d5YAFmT59rcXLy3ZGurxXa3cE5NEm22zF8ZV7Q0Rz80XH2oS2cHScCvTP
         ZmC3nl2AtPHtB24NKdtNA2pNVbx1lK+4N5mqbRiUuVS86Q4ToM8ntb2bozOzk0F6Agnn
         iYJg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id v18si106575edx.4.2020.10.04.12.00.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 094J0HUJ004541
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:17 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060u017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:17 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 44/45] arm64: smmu: Clean up arm_smmu_tlb_sync_global further
Date: Sun,  4 Oct 2020 21:00:05 +0200
Message-Id: <a910f9b26572cd64462b16a6345288062a5fd844.1601838005.git.jan.kiszka@siemens.com>
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a910f9b26572cd64462b16a6345288062a5fd844.1601838005.git.jan.kiszka%40siemens.com.
