Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBRG6W35QKGQEYWELCXY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 901AD278332
	for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 10:50:12 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id a10sf789104wrw.22
        for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 01:50:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601023812; cv=pass;
        d=google.com; s=arc-20160816;
        b=a/K3fECOQpiHPCuGHkFH/qsV477HlYoZArYzSE5wh0JWXXTe+nh2TDZENWvoNiMZix
         lE7okpzIT4gjVgJoaEiWr7hl4kOtGNwPjz1unyIPr+YRcOJMfonYsinC/8+g8l602/bZ
         5P4RW8ShyL4/3lzIsLFMchxB9sMR1rbH65BD//LnQfc3O3549UACw5WjS/5FGBvdKmH8
         2RfDT5kGfEJFJ4qDh+77x0zFu9WZ2eDth2/mfOXQb1Kr1936cuPfmT3YZzx39HyLxbcl
         CfOvt3z2kb9gYULFtmbkDCbh241GoqzIZPJ/7Mq1yHR9sveDahV9744S8ah/vLEAldRw
         FvpQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=a2ZGKQFeLmqeP4BA99nJqzfUBxabeHJmyzHS+zgwfD4=;
        b=L1tGkQrs/LUkCYntU0G92bKDmTolZGhXZBAbgXfnoALWo+c9uzTcmyJ/B9ZqSRzTWD
         QeE0fzXCzBGGttDtFN/Zz1ld/lTP3EMN+GociJKSon3bEfkizrwp0/Eif4FIh7N/XeX8
         aqknbDILdWc8fG/I1YwKLgx2J/qYtg87g/ZEOLgF1sTYit0jt9eTBPU5i7lKYRp1qk2P
         VAHRXSSHn6Xz2bVjtiOwn/oqu/U90taD7vwfXyDBB9X/ArUziWMzRuZyCr2zPtE+mrUR
         wnLXKBnBVtOUtyjEiZ1qccw0pf0Y9iCriAMz6lDOi5om+7LCHaYu2RCgT63ucbxNaeXt
         th0A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=a2ZGKQFeLmqeP4BA99nJqzfUBxabeHJmyzHS+zgwfD4=;
        b=MNWm/4KeEHqk1U6JKzSppjKkqFUHl5cMFiYA+f6oHWtv34CLWKGELfeRar8/i3kOF8
         cHNpDHea+UKP/rXwlGSYmQghQy96dl//Di8UAz35tSYhiBpPpQe+x+7Z8FFHbGGhKA5o
         9YqHhldfZMuPB4NhuLOqiwVqlTwUeXzPUolydsDY5cOQQPlgI3jEuyYm5YgrXdXsKoYl
         PAxmUzgD0jdftYGVFMhOkkMl55f5IaAQh1h04qyQh8voj7S85yE40jeYHLi9+mc1gS8Z
         h+iXmBoRShG0uPWrfA1WjrDg3RDxUL9hifPC8JTuwcE9h2ifeCcomaDfgkUgQYRnZjM/
         RDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=a2ZGKQFeLmqeP4BA99nJqzfUBxabeHJmyzHS+zgwfD4=;
        b=ZAw1YAcI8J0kZHFuPbsG1PMudC4zC+IVG29dnjnLfHgbGylWFwDYSiO6HO0yalTTp8
         W7RuPzia0xIO1hBfj0Dfo9JoroEo3g3j/nuIUJ4oPQ8OdF00f8uon+L/WzkSpCuwwIYZ
         0hWqRkTpf9QmPlDo1FvMoAuMQ2EPekJCEbR+w4FE/4ebMKh10yN1lV0dpAxZLlR+QoyW
         nkLHVaQqLlT56AnXdaXl5iW6yXaC/QDmmdEcrmUGN1krFjFfpqFXKNTwzvomRJzrvWVS
         EPzSEzId2viMfc89t8sz9BDzROlCmLN9LbB/RGQZ08j2zdVhb8Lu5j/B+IH02OhlnVTn
         XaWw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533YPDl5v8DTcSVeouR9sDFDmKG2OYHqAji9W8EZcHbL13UER54I
	XATHmNdIBEv3xiJ8ccSXuRo=
X-Google-Smtp-Source: ABdhPJyGPWbt95XCUsYD3JyXnVLXw4MzeIOSUJINwzqXrLGpflyXP0xc5TvFgWvY8TNf5/Ey8qKEDg==
X-Received: by 2002:adf:f80a:: with SMTP id s10mr3446325wrp.351.1601023812355;
        Fri, 25 Sep 2020 01:50:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:2e58:: with SMTP id u85ls834395wmu.2.gmail; Fri, 25 Sep
 2020 01:50:11 -0700 (PDT)
X-Received: by 2002:a1c:7918:: with SMTP id l24mr2013585wme.46.1601023811284;
        Fri, 25 Sep 2020 01:50:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601023811; cv=none;
        d=google.com; s=arc-20160816;
        b=Ov7pxI6I9EwkDZAovKi1s32D+5j6dbTk4018TnR3sB4+KhJHb/gpEwHMVNE9qUAVHg
         f7sV5ME7tiXWu8xIr/HFhpKwbLBktcM0r286BWHgSggXDCWItPupTl0ie7zyD/lGhz4k
         tCelm6LCJT1nS9l8vRDhMm2hmqsFsBiC3DOYoaHMO2x1zcyXk+dBVkpY9rr0E8b6VERl
         Yh/NaFB/iMOMZVSDJLElQIxLHd/dmJl/WBasMZRNwof0JmQLE3K0VXew7x/ZW1fNgl81
         2fUHFaIEwUORsQfRtblTBiaC0BaG8G0hwI+yRD5mED/thUIFG8TrhzaQb8Ng5GoGd644
         rdIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=vQOQJKGJj0huFn0ADorFb5+T0gb4QlLOpdG5DaFaOwg=;
        b=HKJb6UsxrJgl3fOiFB/7d1gCXZUH8SNmMc1tVh8mNMX9YYEj1IoOPDPTY2Y8zBLMcL
         LqYrjMNysGBV9/yx7ioFaIhNnerdGsQ6Qn6Zh6dEwijiVRmDjQVQGsQKeBpDTSSJxZC1
         S+p2TdngZDlpOfamnZ/h45DVYCLzGZomWjtXJnR8k0yEeyR9Zb4RwDbjLIRmaWk5XLPo
         o66vrBjEHMv0heWcpfZIQKKgGxS5vwbgCVOPMRXm5jOp7robrffgbAfjO3QVRLv2J+l3
         mqcRfJvegOP6Z6zCrJbUedEKipyRNHOwTjAcWT804XAfEaJ1zA2uOdfNdRv3rRrcEwGK
         /zLQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id c144si39291wme.2.2020.09.25.01.50.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 01:50:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 08P8oAXE006035
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Sep 2020 10:50:10 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.133.254])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 08P8o7IP027224;
	Fri, 25 Sep 2020 10:50:10 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Alice Guo <alice.guo@nxp.com>, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 8/8] arm64: smmu: Improve output during setup
Date: Fri, 25 Sep 2020 10:50:07 +0200
Message-Id: <2fb93be68166b2159fdc5572630e52fd6f5e2907.1601023807.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601023807.git.jan.kiszka@siemens.com>
References: <cover.1601023807.git.jan.kiszka@siemens.com>
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

Makes the output more compact, fixes one missing line break and adds a
correlation with the physical unit.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 4c4bb279..69374b28 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -582,9 +582,6 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 	unsigned long size;
 	int i;
 
-	printk("probing hardware configuration...\n");
-	printk("ARM MMU500 with:\n");
-
 	/* ID0 */
 	id = mmio_read32(gr0_base + ARM_SMMU_GR0_ID0);
 
@@ -602,9 +599,9 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 	 */
 	cttw_reg = !!(id & ID0_CTTW);
 	if (cttw_fw || cttw_reg)
-		printk("\t%scoherent translation table walks\n", cttw_fw ? "" : "non-");
+		printk(" %scoherent translation table walks\n", cttw_fw ? "" : "non-");
 	if (cttw_fw != cttw_reg)
-		printk("\t(IDR0.CTTW is overridden by FW configuration)\n");
+		printk(" (IDR0.CTTW is overridden by FW configuration)\n");
 
 	/* Max number of entries we have for stream matching/indexing */
 	if (id & ID0_EXIDS) {
@@ -630,7 +627,7 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 			return -ENOMEM;
 		memset(smmu->smrs, 0, PAGES(size * sizeof(*smmu->smrs)));
 
-		printk("\tstream matching with %lu SMR groups", size);
+		printk(" stream matching with %lu SMR groups\n", size);
 	}
 
 	smmu->s2crs = page_alloc(&mem_pool, PAGES(size * (sizeof(*smmu->s2crs)
@@ -671,7 +668,7 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 		return -ENODEV;
 	}
 
-	printk("\t%u context banks (%u Stage 2 only)\n",
+	printk(" %u context banks (%u stage 2 only)\n",
 	       smmu->num_context_banks, smmu->num_s2_context_banks);
 
 	smmu->cbs = page_alloc(&mem_pool, PAGES(smmu->num_context_banks
@@ -722,9 +719,9 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 		pgsize_bitmap = smmu->pgsize_bitmap;
 	else
 		pgsize_bitmap |= smmu->pgsize_bitmap;
-	printk("\tsupported page sizes: 0x%08lx\n", smmu->pgsize_bitmap);
-	printk("\tstage-2: %lu-bit IPA -> %lu-bit PA\n",
-	       smmu->ipa_size, smmu->pa_size);
+	printk(" supported page sizes: 0x%08lx\n"
+	       " stage-2: %lu-bit IPA -> %lu-bit PA\n",
+	       smmu->pgsize_bitmap, smmu->ipa_size, smmu->pa_size);
 
 	return 0;
 }
@@ -952,6 +949,8 @@ static int arm_smmu_init(void)
 			if (!smmu_device[i].base)
 				return -ENOMEM;
 
+			printk("ARM MMU500 at 0x%llx with:\n", iommu->base);
+
 			smmu_device[i].cb_base = smmu_device[i].base +
 						 iommu->size / 2;
 
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2fb93be68166b2159fdc5572630e52fd6f5e2907.1601023807.git.jan.kiszka%40siemens.com.
