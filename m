Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBPNX5D5QKGQE3GZJ3PA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E65D282CBF
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:14 +0200 (CEST)
Received: by mail-wr1-x43d.google.com with SMTP id l17sf3105896wrw.11
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838014; cv=pass;
        d=google.com; s=arc-20160816;
        b=LAFbctfknLnHl6eW93BsgHhmw65PlictDhe89pU5HFBa8f+2Md1lCRD8HzUhuBCTXX
         rqdcimGRx8NGXVE2zZLxzXIiAgkGhI7PLdtpIObdl4IYWgZiszUFitJSpxPVfbzlOVwf
         pZjJxagaDo9E3mk6wgF9fhcqQJaoE7GxyXV517nK+jZuDifrZSrK2HY/TZpiDkf+GE2X
         QishJ+OuvowIqkEG/nVRoXqHYKjPmXSz8RUVJIWSZE65j9ymjk8O2k1b8GabLYMddutG
         4cZyASsccmlyEd51k39Ka69HJYWc+exQ+w7TURGGYJj86Ul5mVm4nbeUmVEsgN6TytWl
         l7cg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=S8UpnAji38306m1DaomoaQIKV7kOX7dfZytowr7gGX4=;
        b=JYUzIS0B2Wc0YZMozatPulcop/qIvtq1/0YK8QtAUBjBzDVivms0GRzqriLCeyxPWU
         n5+1n7fT7U4VQAeanU3EizDE1gDJBBT2H2U3R+m16QODXlARmcU7zMU12HXXUzTuiuhh
         tIczlvEuUWeNBJvEavxrEbdM+s+krnIs+mPHg7R0qi1end4zkuXxj9HogzMbbwooLeWl
         620C8M2Lspc9kMO76zP7w+9yXRT40xp3nKMlfJ3j2c+5T7aaBvZamBLlUTzZrVKAY03q
         GFLnkuiFhx0+rOjOOmLvOflI4AG6T16ZjsiLhlp6GzEuhSbgZK6cyt4NruiuuLbMH4x3
         v/ug==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=S8UpnAji38306m1DaomoaQIKV7kOX7dfZytowr7gGX4=;
        b=MNU3SKbcQQEXGzWYIQaBKjEk6iRa5t7KsvBvuXUerafHB2zyU4wF5ViUsnT3D1RxRT
         EE41v7c18W4zkDTvZ+ARVPOfdmhc/kqiYAzngU1W03BOl1/nORvJduVIB7i16RyH8lBy
         A+9TagmmAZc2XokvwD4K+0ZEfPGhv3kWVYEDSAjqbeibONIZUjEUK26sFB6IcuHKuLkS
         XD8HGmmuvc17fY8DQOzOod4vARtrA4U0NRT7iHdr69WGrVhaKsBpItxj2Bj+5Pw/9om4
         kWxaiLdqo0V6rIkNcpTDrbreWOtqm0NOiG7JCM3mmcelHPJ1BtnGsP7l2FtO3BWPX269
         6yXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=S8UpnAji38306m1DaomoaQIKV7kOX7dfZytowr7gGX4=;
        b=SbkOn4zl8ZDsX6FvJw858DK4zBVSCRhjfBQ8TiOSGq8saAqKwnGCiIimXoYRaSvDTs
         +xnEK8AT0wDANss83Tz/N6Q/h26HaZ4CbTEYFVMN9f6J8vlHRWLjfXhfb2aH6wcqNSsK
         W77kJffaawlaJ++Ow6HX+2mPcugiHceYHqTtHNTgflPEqhhsjAP9O5QKBinnS2tuF5qg
         FeoqKuc7PkuBJJQwIIEbejEWq1QM/pbF9jPdq2C2Yqdptmz79bCE8Y5HYhRS6kOe7SVf
         VP3wctLe5GWSL/uJO0yHergWpOD47aPCe383dcx6cUIQRqtZcYUbheDM91gPAF/8jopM
         bSKg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5302sSdPanIUjRaJSuiVNhRYJ4RYQLLiXTztFQ4HD6KOq0/iWD+4
	daLc8UL3p2XjUWawGqqa2k8=
X-Google-Smtp-Source: ABdhPJzBzeQPE3yC/bVaQs+rhpfGFJC1Oh9Yt6KOxuMoud6mFZLj0/wpjwnXSVkpX6qhKkoeWsXKLQ==
X-Received: by 2002:adf:ec87:: with SMTP id z7mr8172471wrn.57.1601838014165;
        Sun, 04 Oct 2020 12:00:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:e3c3:: with SMTP id k3ls5160554wrm.1.gmail; Sun, 04 Oct
 2020 12:00:13 -0700 (PDT)
X-Received: by 2002:adf:9043:: with SMTP id h61mr14018068wrh.237.1601838013174;
        Sun, 04 Oct 2020 12:00:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838013; cv=none;
        d=google.com; s=arc-20160816;
        b=hJWcJRgY4mSwiCrOHNXiWSkGTiWwfYdZQpGXkhgg84bC/kn7Sk7+H/K1O+nFjxvN4d
         VN/B13Z0D96u/H+2wLxHbIyW+2ZNcmqJt/j9Gz/FBynXicxWUmIFPr3xfJYC35GGXVSG
         W9/wayBvxyuQs1C13WYbVgKl0z5Iy7qP652mZAIzE86Ec3litMHVnZmW35KZG4j9bULE
         Kmt7iMbCx23wC1X2ZGlf+uy1x1tI3xj+M7yn/tNBpRYRtW/Y2QJSESadyktEDAGSm2EG
         twyg1V1K8jVDaB5M5iBaGIk7EkbcXAK+DxfEKtoubk+RUoK5O9VXs5aMHq8Lgsch5b81
         1vcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=I07SvzqB0wQsB8J5v43BAkF7ajZpKPOX+Nxip7QGklY=;
        b=OL78JmTAIvMXYYzaivD6g9vF+xxYOxK3w9iCHPhP0suJ6LRawsG9B6YkZL8PAiO+so
         XMTv/O+X93KWBqm0HW1MHFTChIrGLe6pkg4MHgIuYeZZxq7lCAa55hXI5qHFdAFAARJn
         6FiysagrqH2UBWdMSbIuzE6/7eBtSr0CrlREaKKBF6QKSPWCvYI37xUluMEFZ/RmOWae
         yJiYwvdqF+vYm/+zd++PVSMjloDDF8i57/pLs5ic93nXLtgeIKAVf6h2Y2/Q0TOPBQ0v
         cLP8IPirrWbTztenV2+wYgK4kDB6FuFM/7hlYg+t5r/8km9aLs/yl/bQfd6PtNrBtuco
         KLHA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id z62si207545wmb.0.2020.10.04.12.00.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 094J0CRu002633
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:12 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060Z017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:12 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 23/45] arm64: smmu: Demand aarch64-4K paging, drop probing of unused formats
Date: Sun,  4 Oct 2020 20:59:44 +0200
Message-Id: <d77d299100407a39a90ddf20af6f2a2220ff1860.1601838005.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601838005.git.jan.kiszka@siemens.com>
References: <cover.1601838005.git.jan.kiszka@siemens.com>
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d77d299100407a39a90ddf20af6f2a2220ff1860.1601838005.git.jan.kiszka%40siemens.com.
