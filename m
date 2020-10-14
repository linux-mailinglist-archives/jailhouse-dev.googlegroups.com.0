Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXPNTL6AKGQEIXYUOOY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 6011328DB5D
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:18 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id i1sf957209wrb.18
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664158; cv=pass;
        d=google.com; s=arc-20160816;
        b=avnCyFdDex9X9WPW5FgGHEtiCjzUk4OgUnwBs8hGvP6YNj+EZfeJFQncalgf4LItmh
         hu/TtisUuSCFLdIxWTSH1nact2i2d212g9gTnnem1Z8GgLixc4Peb6lIpOPJjKPMqzB9
         9IkIJaqep+Ia0kQ9qiScDgNOzIvfUjeqczRG7jLMHRJXbXtL24Qy6HC4ZfYCguRGklwG
         i9+Cso57CMz+sXwZ90MGq6TejOeQ8QnzKCkvQrh1B+SxbjBzYEZ/bs6OW5Slh0E7C3HW
         PFEG6n8Ir5PhAY+StVMv4QzfugPQLEl7xsVgl3FtJ1Eiwoyh2ZwbqivvUQnv7m5TI7bQ
         9NxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=YIH0rhkc5qpeQRQ6hHr4/Qi/RsEw2YuGnaK8HWOQm0A=;
        b=an5YhDyjOEiyw631DmmDyEk5NXzM5DfRHYgMFkxs1IUxaq33BcQ2Zn+9o/qiEHjY8N
         4ecg1FWtoch02F6IgrV4GpsIFQ3CSNljFo5Yj7sFpX52u1RdpbRSIxk/Ty3jxtjpCpSx
         CxuDaf1WUvY6MR4vN4oE3nt971fNCM3+q4KfJ5whXrchk0l7gXsBdNskyX61DMzAgIb5
         Gx+nj2Im1eE+uGMzGTKTZGNFY2uXTM81KSIApzC65rrQ/CBp8LdnCanG1x3tsPpA8MUU
         FxbEySZrBu2SGRXutEDwvSkBpdqIce0YTHZ/MfgV/2oV6WgtLfeSJ2eTUyulT7h/BClq
         qHCg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YIH0rhkc5qpeQRQ6hHr4/Qi/RsEw2YuGnaK8HWOQm0A=;
        b=qLN+PcwDg4uWAtXPSE6u1DELy0CP48o/zkRMv0ZCJWBXSShRGXOCpd7i5eD+fZX7ka
         YHr+IMfT4YJCutLyYzdrRw4f+R34rboPmwepaDsjkhixlUZNS09FC0sdRh/N8vTHx9ay
         JzcIEqmbRxHz2QV9zBG+VuJmmtcFJm60zgjBnMaKdNVj9UaUFL7+3roA+SlQ36H43t0Z
         BGEkR5scV86FNj5U66t4vN/SoXwLf5AGiQOVKZFKTHfi5ORNHdmvRugtCMB7QGkC+QDw
         kUkkoB7gL5qhULKo2+hRqPDv7y4OQkjLsyACn/YYELmwezpYwmZg8yptGxqklWPJxaVr
         QFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YIH0rhkc5qpeQRQ6hHr4/Qi/RsEw2YuGnaK8HWOQm0A=;
        b=cfLQanmTT1+zxO9UiKY1xeQs5pnG4ucX5oSorMRDYfyM9+borUVYLwxZlM6WPge4TM
         bp50gfo/GTto6K7eys/Z9Bulqx+2bHnYplpmDqIhwPNf+RPJbT+dMfEVisr+op/g9seq
         shJF8XLbMIqZIrBu1ilcn1e5CD7/6fA9AyPPH+8FA9tteEREeuDJuIQNgb1vWZIwvAEE
         GMApCUGKEqweCUDzCKd6Ai6SBuM3MkGb/QvssWeB25P60DuwvtcHQTZFFZhpDdUsWAl8
         JQkuwuatgfupgeAc3YqyHSfacd19hJrttm4H0e8n99bs1EdLq2UxArNL107LlZ8y2IqC
         WyvQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533Bzze13zsK98525rvf8AhKp5jLLQEIH1E6J9AbIZfBkvxDmrvL
	WDF++Axmk8f36ZGxB5PFthE=
X-Google-Smtp-Source: ABdhPJzUPfmKkRyiCj+q/1mVwip008OwSzkkE9kNuQoS/gyjPcZE+o2qbB/U6msyNB/S4Stpxvxt0A==
X-Received: by 2002:a7b:c20d:: with SMTP id x13mr2373447wmi.83.1602664158068;
        Wed, 14 Oct 2020 01:29:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:2506:: with SMTP id l6ls746552wml.3.canary-gmail; Wed,
 14 Oct 2020 01:29:17 -0700 (PDT)
X-Received: by 2002:a1c:9dc4:: with SMTP id g187mr2315946wme.79.1602664156985;
        Wed, 14 Oct 2020 01:29:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664156; cv=none;
        d=google.com; s=arc-20160816;
        b=M8aB+w5x5bjQiYM0o7demjNT2zTEjL7ZctKFm9E4VpRM8h1kfztX9DLya/yaWD3nIS
         w1oDyNxGWW4lfPn/b+d9ZPOnxVe+E5YfZI0wERLr/4Rg2ARneIqILy7WaTegKdCBEP8y
         kwUYt/vzw82z2MauQ3QaQoXt32IKFLQYiIuxLZJvTg2vdes22ftq/gnDn4FLaNXYBa1H
         4PsYp0Mev6/n4KpxsTxBci2jA6tYT3XIe/cuHme/qbbgz9j091Rg1MCA/ypA1nt5rvNC
         BCmJIivKQM3A7275Y1+pgVvsyQhVmmAl4A1HDLe7O4cv481yevUWhDvTEbs08LonPpy9
         Ox0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=I07SvzqB0wQsB8J5v43BAkF7ajZpKPOX+Nxip7QGklY=;
        b=zGhG72Wfm2T9uZ5I7dBEQpZLGTF+pEd/aVXgD3loGe5J/c42dbia/1MsPeuYKX5/RS
         KHfUzlxdb+kbxIqUlsvSrDPA2wmt5NqTA2CifF0JE3tmYrHYFAOoBRPwGe4rrLC8/jH2
         VsbzrwsZW1jpsTz8RvMzdlVTCT69BhfvpvP+QMf9VrPBDhqVG7kFFpA1xsfA4d11iYps
         sn0my5lYa7CYrVny0vUq/1RZ8wen+hGu9VtayksEjOazovI5M/Rqw7M3I/8XeOXLYejc
         Fgxg17+VOdOR9SabI/wjZkluQy7YvJjdT4YKBF03vJey6ziLxIHukjVaj9bq8vmDR89r
         H1jg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id f144si44198wmf.0.2020.10.14.01.29.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 09E8TG2q032748
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:16 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAJA002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:16 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 24/46] arm64: smmu: Demand aarch64-4K paging, drop probing of unused formats
Date: Wed, 14 Oct 2020 10:28:48 +0200
Message-Id: <2e2c89ef94c5ccbc931fe5765e841a13b684deed.1602664150.git.jan.kiszka@siemens.com>
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

We are aarch64-only, and we shared the page table with the MMU.
Jailhouse uses 4K-paging for that, so there is no point in probing for
other format. In fact, we must demand ID2_PTFS_4K, otherwise things
would break.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 100 ++++-------------------------------
 1 file changed, 10 insertions(+), 90 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 1634a53a..66453b67 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -17,25 +17,10 @@
 
 #include <jailhouse/cell-config.h>
 
-#define SZ_4K				0x00001000
-#define SZ_16K				0x00004000
-#define SZ_64K				0x00010000
-#define SZ_1M				0x00100000
-#define SZ_2M				0x00200000
-#define SZ_16M				0x01000000
-#define SZ_32M				0x02000000
-#define SZ_512M				0x20000000
-#define SZ_1G				0x40000000
-
 #define ARM_SMMU_FEAT_COHERENT_WALK	(1 << 0)
 #define ARM_SMMU_FEAT_STREAM_MATCH	(1 << 1)
 /* unused bits 2 and 3 */
 #define ARM_SMMU_FEAT_VMID16		(1 << 6)
-#define ARM_SMMU_FEAT_FMT_AARCH64_4K	(1 << 7)
-#define ARM_SMMU_FEAT_FMT_AARCH64_16K	(1 << 8)
-#define ARM_SMMU_FEAT_FMT_AARCH64_64K	(1 << 9)
-#define ARM_SMMU_FEAT_FMT_AARCH32_L	(1 << 10)
-#define ARM_SMMU_FEAT_FMT_AARCH32_S	(1 << 11)
 #define ARM_SMMU_OPT_SECURE_CFG_ACCESS (1 << 0)
 
 #define ARM_64_LPAE_S2_TCR_RES1		(1 << 31)
@@ -126,11 +111,7 @@
 #define ID2_IAS_MASK			0xf
 #define ID2_OAS_SHIFT			4
 #define ID2_OAS_MASK			0xf
-#define ID2_UBS_SHIFT			8
-#define ID2_UBS_MASK			0xf
 #define ID2_PTFS_4K			(1 << 12)
-#define ID2_PTFS_16K			(1 << 13)
-#define ID2_PTFS_64K			(1 << 14)
 #define ID2_VMID16			(1 << 15)
 
 #define ID7_MAJOR_SHIFT			4
@@ -164,7 +145,6 @@
 #define CBAR_TYPE_S2_TRANS		(0 << CBAR_TYPE_SHIFT)
 
 #define ARM_SMMU_GR1_CBA2R(n)		(0x800 + ((n) << 2))
-#define CBA2R_RW64_32BIT		(0 << 0)
 #define CBA2R_RW64_64BIT		(1 << 0)
 #define CBA2R_VMID_SHIFT		16
 
@@ -172,7 +152,6 @@
 #define ARM_SMMU_CB_SCTLR		0x0
 #define ARM_SMMU_CB_ACTLR		0x4
 #define ARM_SMMU_CB_TTBR0		0x20
-#define ARM_SMMU_CB_TTBR1		0x28
 #define ARM_SMMU_CB_TTBCR		0x30
 #define ARM_SMMU_CB_CONTEXTIDR		0x34
 #define ARM_SMMU_CB_FSR			0x58
@@ -216,20 +195,12 @@ struct arm_smmu_smr {
 	bool				valid;
 };
 
-enum arm_smmu_context_fmt {
-	ARM_SMMU_CTX_FMT_NONE,
-	ARM_SMMU_CTX_FMT_AARCH64,
-	ARM_SMMU_CTX_FMT_AARCH32_L,
-	ARM_SMMU_CTX_FMT_AARCH32_S,
-};
-
 struct arm_smmu_cfg {
 	unsigned int			id;
 	u32				cbar;
-	enum arm_smmu_context_fmt	fmt;
 };
 struct arm_smmu_cb {
-	u64				ttbr[2];
+	u64				ttbr;
 	u32				tcr[2];
 	u32				mair[2];
 	struct arm_smmu_cfg		*cfg;
@@ -253,7 +224,6 @@ struct arm_smmu_device {
 	struct arm_smmu_cfg		*cfgs;
 	unsigned long			ipa_size;
 	unsigned long			pa_size;
-	unsigned long			pgsize_bitmap;
 	u32				num_global_irqs;
 	unsigned int			*irqs;
 };
@@ -321,15 +291,7 @@ static int arm_smmu_init_context_bank(struct arm_smmu_device *smmu,
 	     (ARM_LPAE_TCR_RGN_WBWA << ARM_LPAE_TCR_ORGN0_SHIFT);
 
 	reg |= (ARM_LPAE_TCR_SL0_LVL_1 << ARM_LPAE_TCR_SL0_SHIFT);
-
-	switch (PAGE_SIZE) {
-	case SZ_4K:
-		reg |= ARM_LPAE_TCR_TG0_4K;
-		break;
-	case SZ_64K:
-		reg |= ARM_LPAE_TCR_TG0_64K;
-		break;
-	}
+	reg |= ARM_LPAE_TCR_TG0_4K;
 
 	switch (smmu->pa_size) {
 	case 32:
@@ -367,7 +329,7 @@ static int arm_smmu_init_context_bank(struct arm_smmu_device *smmu,
 
 	vttbr |= (u64)cell->config->id << VTTBR_VMID_SHIFT;
 	vttbr |= (u64)(cell_table & TTBR_MASK);
-	cb->ttbr[0] = vttbr;
+	cb->ttbr = vttbr;
 
 	return 0;
 }
@@ -390,10 +352,8 @@ static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
 	gr1_base = ARM_SMMU_GR1(smmu);
 
 	/* CBA2R */
-	if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH64)
-		reg = CBA2R_RW64_64BIT;
-	else
-		reg = CBA2R_RW64_32BIT;
+	reg = CBA2R_RW64_64BIT;
+
 	/* 16-bit VMIDs live in CBA2R */
 	if (smmu->features & ARM_SMMU_FEAT_VMID16)
 		reg |= cfg->id << CBA2R_VMID_SHIFT;
@@ -421,13 +381,7 @@ static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
 	mmio_write32(cb_base + ARM_SMMU_CB_TTBCR, cb->tcr[0]);
 
 	/* TTBRs */
-	if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH32_S) {
-		mmio_write32(cb_base + ARM_SMMU_CB_CONTEXTIDR, cfg->id);
-		mmio_write32(cb_base + ARM_SMMU_CB_TTBR0, cb->ttbr[0]);
-		mmio_write32(cb_base + ARM_SMMU_CB_TTBR1, cb->ttbr[1]);
-	} else {
-		mmio_write64(cb_base + ARM_SMMU_CB_TTBR0, cb->ttbr[0]);
-	}
+	mmio_write64(cb_base + ARM_SMMU_CB_TTBR0, cb->ttbr);
 
 	/* SCTLR */
 	mmio_write32(cb_base + ARM_SMMU_CB_SCTLR,
@@ -580,12 +534,6 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 
 	smmu->num_mapping_groups = size;
 
-	if (!(id & ID0_PTFS_NO_AARCH32)) {
-		smmu->features |= ARM_SMMU_FEAT_FMT_AARCH32_L;
-		if (!(id & ID0_PTFS_NO_AARCH32S))
-			smmu->features |= ARM_SMMU_FEAT_FMT_AARCH32_S;
-	}
-
 	/* ID1 */
 	id = mmio_read32(gr0_base + ARM_SMMU_GR0_ID1);
 	smmu->pgshift = (id & ID1_PAGESIZE) ? 16 : 12;
@@ -623,34 +571,11 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 	if (id & ID2_VMID16)
 		smmu->features |= ARM_SMMU_FEAT_VMID16;
 
-	/*
-	 * What the page table walker can address actually depends on which
-	 * descriptor format is in use, but since a) we don't know that yet,
-	 * and b) it can vary per context bank, this will have to do...
-	 * TODO: DMA?
-	 */
+	if (!(id & ID2_PTFS_4K))
+		return trace_error(-EIO);
 
-	if (id & ID2_PTFS_4K)
-		smmu->features |= ARM_SMMU_FEAT_FMT_AARCH64_4K;
-	if (id & ID2_PTFS_16K)
-		smmu->features |= ARM_SMMU_FEAT_FMT_AARCH64_16K;
-	if (id & ID2_PTFS_64K)
-		smmu->features |= ARM_SMMU_FEAT_FMT_AARCH64_64K;
-
-	/* Now we've corralled the various formats, what'll it do? */
-	if (smmu->features & ARM_SMMU_FEAT_FMT_AARCH32_S)
-		smmu->pgsize_bitmap |= SZ_4K | SZ_64K | SZ_1M | SZ_16M;
-	if (smmu->features &
-	    (ARM_SMMU_FEAT_FMT_AARCH32_L | ARM_SMMU_FEAT_FMT_AARCH64_4K))
-		smmu->pgsize_bitmap |= SZ_4K | SZ_2M | SZ_1G;
-	if (smmu->features & ARM_SMMU_FEAT_FMT_AARCH64_16K)
-		smmu->pgsize_bitmap |= SZ_16K | SZ_32M;
-	if (smmu->features & ARM_SMMU_FEAT_FMT_AARCH64_64K)
-		smmu->pgsize_bitmap |= SZ_64K | SZ_512M;
-
-	printk(" supported page sizes: 0x%08lx\n"
-	       " stage-2: %lu-bit IPA -> %lu-bit PA\n",
-	       smmu->pgsize_bitmap, smmu->ipa_size, smmu->pa_size);
+	printk(" stage-2: %lu-bit IPA -> %lu-bit PA\n",
+	       smmu->ipa_size, smmu->pa_size);
 
 	return 0;
 }
@@ -737,11 +662,6 @@ static int arm_smmu_cell_init(struct cell *cell)
 	for_each_smmu(smmu, dev) {
 		cfg = &smmu->cfgs[cell->config->id];
 
-		if (smmu->features & (ARM_SMMU_FEAT_FMT_AARCH64_64K |
-				      ARM_SMMU_FEAT_FMT_AARCH64_16K |
-				      ARM_SMMU_FEAT_FMT_AARCH64_4K))
-			cfg->fmt = ARM_SMMU_CTX_FMT_AARCH64;
-
 		cfg->cbar = CBAR_TYPE_S2_TRANS;
 
 		/*
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2e2c89ef94c5ccbc931fe5765e841a13b684deed.1602664150.git.jan.kiszka%40siemens.com.
