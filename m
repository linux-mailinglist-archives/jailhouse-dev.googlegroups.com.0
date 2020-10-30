Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBAVY576AKGQEAQGAJRQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6092A0162
	for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Oct 2020 10:25:23 +0100 (CET)
Received: by mail-lj1-x239.google.com with SMTP id v25sf2423181ljh.4
        for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Oct 2020 02:25:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1604049923; cv=pass;
        d=google.com; s=arc-20160816;
        b=HlGmLEesrWuP1FyiAP92UOXXOOtx5fENPFNGdYKbjgPG3MAbJWqf0DT+tx6ehV6pW8
         aqKPbcY/QLdbZkmeDMYx2xOWgcXp/J8eUN4ts8b79wA2zcrqlFSw9ONq4g5gpcxqBjEl
         zn34iK8ID1DyIA4TLDshmp4KmR/qtR9Om27BT3FrSABhtugOmcQojd3j2hfS7i4y0RBV
         iRpzK55V0ZDRcpxERs6dGBeJPLZZYiGrktLuktXAbm0yHSGt0O3FDW2EmdUhgznHdUww
         CIjmTEHA6NgOLVzeTOVpJdJm4RiXCyI6K86RIMJufd/gkgXm4mgnCeoKvlvUCzuBE0Tm
         sVOA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:cc:to:subject:from:sender:dkim-signature;
        bh=GtRMR29u0klQ/YW/QvWSgERLpbfMy9xPiLd9ObEt8JA=;
        b=WMFTZd0/qBiSc+UfqSmFnKt6w8wTmHAuwQkQAWfaDA6SsnjJlB+eM6IFgiTF+U8lvv
         8Rv37nPqB06aI9A7ltvFANymI6hb8OdWZt/AYGhDtV3zqcOEJnCM7rRRoNn/9/QyDGoC
         b+Il2XFyS3Y2Iot26JLAoos+JFSe0Zok7RsGxKf0B70ehwrQaORhvtXV06+8BJ+1soPx
         T4nsxB2Tk/smQPKtd/XCou9O+MARxl3n0qtkiTRe/P3EKO4GFfPST/qzsWQHqQAJrJnl
         7OhbsmHYjywnFfU3v5tuOvryLhDpXa0OYcLGGcjdceeVSj01QG0QLz3F6VHTK73X30He
         6C3A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=GtRMR29u0klQ/YW/QvWSgERLpbfMy9xPiLd9ObEt8JA=;
        b=F4QRh2u/0PmpLfujD8CI3CQvyyXjgT48ZF7zQr6qYV4NZZmeO6yxZaBJL3y+5ZKtjE
         ETR1HAyfCaR0+Yzh4QMbsd4HMmI19kt2wrVIwkg3MmgJ/QWRMMGEyYEpWO0qYAUXojG8
         9tki9vLdSSamV6RIz+VI6Q9kRAG/Vh/J7I7Ec+5diKt+spFVp7VQPykHXTIM12ZUXnJi
         G/VZ4+8g7mAqzkGF2W94Wjcin8OzjpexzGNk+2KcAeoTNtvlWfmBNwu/PF2kY2K1bZmt
         I3Kv7atbceofr/v/8eOfSroLL/duJMbZe5CVUu7gDWO25NHXCy62Z3K2trF2zQidA+71
         i/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:cc:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GtRMR29u0klQ/YW/QvWSgERLpbfMy9xPiLd9ObEt8JA=;
        b=eBaiBNpUMIxlp9YwAi133VVie7OFHjsNR6KnU7jgJntumWhDkehAs0JuzF8jMMfVxX
         VxG+bXAMxcAFqs3ufhcQkSY6ratF46Q5SLHZfxy3inyJIc1RtiSNLfHfb3+a51IWRIkB
         Lbq/EjIUpp8fNI3toSKkEZuoiY66ho+d/mU+AdsXC2v4C4fjP9goUrx+ANgiUQC6r71B
         tCqVyS3YjzGBY7aew9PoW+iLRpKyPqraE8697W/PQDmfO4jsztW5YGlfSPepTf9G8a/U
         N/9h2zdiYWc/Qh43Um7X0y+4yd6TEamojwjiMZDFWZe4+kjz/bUnLuN+nj0G9iRLzYCA
         QyIA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5308/eaq4iReqW/ghqDayttmtiw1YqU5isieviOwZOvOHeA8b0Lo
	LmVFks5dByoCjn/aBFkVO+4=
X-Google-Smtp-Source: ABdhPJwnr57fZMlRG8Dv+YKpxpN9IOrHtuHG3ruC511KbgIn3ry1aW/B32MXPa46jLsg4SvILKppgw==
X-Received: by 2002:ac2:5f0b:: with SMTP id 11mr455025lfq.149.1604049923388;
        Fri, 30 Oct 2020 02:25:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:546b:: with SMTP id e11ls314151lfn.0.gmail; Fri, 30 Oct
 2020 02:25:22 -0700 (PDT)
X-Received: by 2002:ac2:505b:: with SMTP id a27mr534001lfm.264.1604049921929;
        Fri, 30 Oct 2020 02:25:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1604049921; cv=none;
        d=google.com; s=arc-20160816;
        b=EiN8L1qj8ffeG23KteAbcBp/qAgsFashR1rCX1kYoMNkSVJs5hp2p7M0bhzLE8Zspy
         2oznh6QCakZXDa8seV7ReieiEXjiifyNSdisd+fltAK920ZuPIqwt0ksUkOa+URGkdjH
         Qmjdgv9YmxX7U0FhiIuUEvWv22QrogaULKiPRKKXci0hN9DIxxWYSKhqpur1hNmubPR1
         UIq+iUzCNZOqVSC1Jg+S5EIXz4VVtFSL5dUWDPPMNx/7eOEu5rvfFiHfFF12T0Kn4IV5
         WwCrmAuLkSE6vsT/XGWEeQNvSC7MH5RUPi/tdpohl5oDIoZujuKSI1zy7U1noeMU7TGG
         G1vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:cc:to:subject:from;
        bh=lFNkrvlnVi5+d3+FG/vSP+rvs4JY61+Xaolmc6trCZ0=;
        b=E88uunZLw/YPIbG69yRHYEN+hvUL9/aOZGPCGELx7VJyi+00cxWwQb1vLV7B/X7lgt
         NILEfPny6oP3L2jaNiMQBgmkmvx1aRybgbjMLVcs1xyeiPMDiNkS/BXGkkvEjf4LRAE+
         Y4pucNf2qcqHye7ZR67ePNmzt5I5q1PFqt8Kq/fg1BuZdaqWiJrT42TAKaB7oL026NsW
         AJfb1L68GLePiokVO8nuQU9gvMvRQhYQv1glEtGVyUj1HSLfKTuoHGWJZzHFXZJ6PwoZ
         AJpw4wanI3W0gXu2bY29O7rYF5nyTo/Pe8K04EJ9qf+CWtoEmlOhuXRjNtLJJxadTNJc
         XI2A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id x20si167514lfq.12.2020.10.30.02.25.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2020 02:25:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 09U9PI5N029004
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 Oct 2020 10:25:19 +0100
Received: from [167.87.42.1] ([167.87.42.1])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09U9PH2k015403;
	Fri, 30 Oct 2020 10:25:17 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] arm64: smmu: Enable only on config commit
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Peng Fan <peng.fan@nxp.com>, Alice Guo <alice.guo@nxp.com>,
        Andrea Bastoni <andrea.bastoni@tum.de>,
        Renato Mancuso <rmancuso@bu.edu>
Message-ID: <ac6d8f7d-371d-88ed-bcbc-509926fc5770@siemens.com>
Date: Fri, 30 Oct 2020 10:25:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

There are no tables ready during arm_smmu_init(). Therefore, we need to
hold back writing sCR0 until config commit.

This fixes DMA errors during startup.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---

Replaces "arm64: smmu: Do not enable SMMU if TLB flush fails".

 hypervisor/arch/arm64/include/asm/smmu.h | 12 ++++++++
 hypervisor/arch/arm64/iommu.c            |  2 ++
 hypervisor/arch/arm64/smmu.c             | 35 +++++++++++++++---------
 3 files changed, 36 insertions(+), 13 deletions(-)
 create mode 100644 hypervisor/arch/arm64/include/asm/smmu.h

diff --git a/hypervisor/arch/arm64/include/asm/smmu.h b/hypervisor/arch/arm64/include/asm/smmu.h
new file mode 100644
index 00000000..def7cbde
--- /dev/null
+++ b/hypervisor/arch/arm64/include/asm/smmu.h
@@ -0,0 +1,12 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright Siemens AG, 2020
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/cell.h>
+
+void arm_smmu_config_commit(struct cell *cell);
diff --git a/hypervisor/arch/arm64/iommu.c b/hypervisor/arch/arm64/iommu.c
index 805589b3..ca998789 100644
--- a/hypervisor/arch/arm64/iommu.c
+++ b/hypervisor/arch/arm64/iommu.c
@@ -12,6 +12,7 @@
 
 #include <jailhouse/control.h>
 #include <asm/iommu.h>
+#include <asm/smmu.h>
 #include <asm/ti-pvu.h>
 
 unsigned int iommu_count_units(void)
@@ -38,5 +39,6 @@ int iommu_unmap_memory_region(struct cell *cell,
 
 void iommu_config_commit(struct cell *cell)
 {
+	arm_smmu_config_commit(cell);
 	pvu_iommu_config_commit(cell);
 }
diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 89631d16..911f50d1 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -14,6 +14,7 @@
 #include <jailhouse/printk.h>
 #include <jailhouse/unit.h>
 #include <asm/iommu.h>
+#include <asm/smmu.h>
 
 #include <jailhouse/cell-config.h>
 
@@ -238,7 +239,6 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 	void *gr0_base = ARM_SMMU_GR0(smmu);
 	unsigned int idx;
 	u32 reg;
-	int ret;
 
 	/* Clear global FSR */
 	reg = mmio_read32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_sGFSR);
@@ -287,18 +287,7 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 	/* Invalidate the TLB, just in case */
 	mmio_write32(gr0_base + ARM_SMMU_GR0_TLBIALLH, 0);
 	mmio_write32(gr0_base + ARM_SMMU_GR0_TLBIALLNSNH, 0);
-
-	/* Enable fault reporting */
-	reg = sCR0_GFRE | sCR0_GFIE | sCR0_GCFGFRE | sCR0_GCFGFIE;
-
-	/* Private VMIDS, disable TLB broadcasting, fault unmatched streams */
-	reg |= sCR0_VMIDPNE | sCR0_PTM | sCR0_USFCFG;
-
-	/* Push the button */
-	ret = arm_smmu_tlb_sync_global(smmu);
-	mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_sCR0, reg);
-
-	return ret;
+	return arm_smmu_tlb_sync_global(smmu);
 }
 
 static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
@@ -512,6 +501,26 @@ static void arm_smmu_cell_exit(struct cell *cell)
 	}
 }
 
+void arm_smmu_config_commit(struct cell *cell)
+{
+	struct arm_smmu_device *smmu;
+	unsigned int dev;
+
+	if (cell != &root_cell)
+		return;
+
+	for_each_smmu(smmu, dev) {
+		/*
+		 * Enable fault reporting,
+		 * private VMIDS, disable TLB broadcasting,
+		 * fault unmatched streams
+		 */
+		mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_sCR0,
+			sCR0_GFRE | sCR0_GFIE | sCR0_GCFGFRE | sCR0_GCFGFIE |
+			sCR0_VMIDPNE | sCR0_PTM | sCR0_USFCFG);
+	}
+}
+
 static void arm_smmu_shutdown(void)
 {
 	struct arm_smmu_device *smmu;
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ac6d8f7d-371d-88ed-bcbc-509926fc5770%40siemens.com.
