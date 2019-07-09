Return-Path: <jailhouse-dev+bncBCCMB6PY3AEBBK5WSLUQKGQEU37DMAQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23f.google.com (mail-oi1-x23f.google.com [IPv6:2607:f8b0:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 9333B6373F
	for <lists+jailhouse-dev@lfdr.de>; Tue,  9 Jul 2019 15:48:28 +0200 (CEST)
Received: by mail-oi1-x23f.google.com with SMTP id a198sf7620341oii.15
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Jul 2019 06:48:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562680107; cv=pass;
        d=google.com; s=arc-20160816;
        b=s6ddjMZWsm16f4yU9x7IvwR/sRrmRcHTjFicMgdEWcX7Y9CbtOR/vhlVSj+fbTfU4l
         4DP3CIDc6rDav/kOhv8eXPSVy8okVq1gdIKJ7fMBvM4rCzu4qkbnYD0m0Y5QYoRDjnXx
         Mip/Cn/nIF8ZgPbzUEIZg8GUIGowMjVlb85xotG5tbkwA1+630aTj0MPrUAJhTls4sVa
         aqPjX3NFAis+ZiJs6/zHACGHU8b6UluMqNyPI7p3JUoor/RD9OMe63CkE18VhlRrv+yb
         Oe8xj1DT4NqCN7YB06FvqhRRLVVqb9vqef9p05fVh7xM1c1QvRrBddg8ZMFAC280pJMM
         a3UQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=WT9p1LN5y2Rbxw+1JMe/Q5vcW7/+mG+35+THu4C0JwM=;
        b=wqAW31a4uy9SjQ5yHqv1nshiSefnFCYhTDydEsjDcTWtzkrtO2wIL0uIMXDuwUSOQQ
         c1aZwNHT1tvFesMptg/BQ4ygjWjJHH5m0KHDX/gn9fJ51SmsAs+pN/vaeauUPcNWVy+z
         uDQIHlkszhzvs5hYOCgy3jeixwDyG5zIR6LhHpTE96C2GDF1pLuCikub6etpQjMN1lXi
         u5rQGGBbI1YQBoCli7rU+2ubf8MJh+8ltKukkKZ4lqLBI6WXsrdaB6knn9Edz7K8drSg
         nb0qIGOa5jdfa08Wh3LG2Sxf1BrkjE45Ayk9mwo3422SE09iPJ2yKit2bFgVSy1EFRhQ
         5FKA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=C2euQzj5;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=WT9p1LN5y2Rbxw+1JMe/Q5vcW7/+mG+35+THu4C0JwM=;
        b=ruHkQOcD72BM7Eoj4111dvUqH6SwmqlCx23ZX9UWshkdeKUCMPVmiFNCMOVsdjKo/H
         aLskY4ihM01okhvkKsflVkfHzOBL9NVCrJTUvfHcY+EYJY9s/oawykflns73uCTFZIoq
         nvEPntgHFuqaDKbFsJ3RV5B2Ubya5bX3N/cu3CNN21W8jCthwQhAyAllTYxXGbOF+XFa
         j1F5c7+y37/Kr67N5lmUceVpYDNABJnHq94hVTL+3phe7niBy3B7w+HjJN619BVDA+/f
         g9w11tkM/eIKh+JYe79S6PCA3Mc15romZrShnL/jp69OQ3kUzFgyuIk6BquTRzS8MbTG
         tZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WT9p1LN5y2Rbxw+1JMe/Q5vcW7/+mG+35+THu4C0JwM=;
        b=LRZZin7+U+qkW9/kq0hwC004iKCYnvuB8LEeb5aO/6/PnHvMkC97J+z1cjwA/EAIkc
         Lbmte9bUCOpwwodp6HuKXZ+lMkymrZ02ijN1OndnjJ4/7q6SEIE4u4Gbg/vcFq4mnCS5
         QTQbjcOtmtCyLEqQtOpNNs8CDxStWyEI+NpU2Q39Q3nFEvhp+VvzySYn2ytM6Vy0z4xO
         jUzUqrULxkDfbNa//B31WAcRrs3e8DNOGchzoT203x3kY+zKArW8Sl3rOXfeKQM3wlZ/
         CAB1ihYS2jL27hVpvMWZYRlNkRq1m4fh750CtgSBccq/gMXSQ9hDskVE+xe12IEofKcz
         36Uw==
X-Gm-Message-State: APjAAAWcjKzQnf04MQQQ3nXg2LPzC6MoqSuczdhUXM9P1UnB+m2jHTHS
	sqmSpo8079rs73ltcK3mFq0=
X-Google-Smtp-Source: APXvYqw12C1DZsvdQLfllkzPjhdVOmWwoFhFap4w6WCeDNMKZpzD8ZM+ARq2RyLjVZLWIBUYWoMHRg==
X-Received: by 2002:a9d:6c46:: with SMTP id g6mr17518657otq.104.1562680107361;
        Tue, 09 Jul 2019 06:48:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:c78e:: with SMTP id x136ls2516520oif.5.gmail; Tue, 09
 Jul 2019 06:48:27 -0700 (PDT)
X-Received: by 2002:aca:4309:: with SMTP id q9mr74153oia.74.1562680106981;
        Tue, 09 Jul 2019 06:48:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562680106; cv=none;
        d=google.com; s=arc-20160816;
        b=RBZzqZiOSzHTl/5cMklPXlfEXwN7hb8ltFviRARwKDWQcs6KTVKyHt+86AX30Ve9DE
         Q6xTpSteDXvx4NOXk9b1k26p7oC/PNdq0pEE2bEe9/bdJmt7N6GOtUPulsUDxcDAe8JE
         WyRqWiTT5vcKY7itUEJjmkJC+IicUSI5YHVUlsQvgwwUvwEx+xjn2ka9Q8DkpBs6O7n8
         DfVB5mgy3hOpQT1AaI2fs2/HFF4mOthh/1mvKguv4IXwmOlBl3FEDtoDlmCTr5nv5WzK
         YrESEqAnBosOE5Cd+XeITMdLonLgUEB9f+YU8qKbOMFYxsisPXpb56+DES0sN5zyghKM
         TEaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BvpCMnQTUsv7i8JhPGlGDwxK5N+NOl1xEM7rNUH54KQ=;
        b=ay6GmyxptnSAyH5VkRl3C/RCrPL5Wtw1cWigy3Pay6QYQSwdp7Ce8VJXVaL7Xh6n7G
         sq/40aTXlHwBWUFbeTloA5CGfZFuGEdjgTru7/ch3dT7oE3mUO5NnFcrkd/Lej+yKtz9
         R4QBbvX4yQUUbg+55YhZ2cBFV6q7X86RVe5HloK9XlkWi3R093D+qlDYXxOZNXianCtL
         CVRioUAprR9Y5Wu1dDO4unCT/dsYdit957/izRBMtCGl4zTZM4ORoDMpIgYgjcrAEYWG
         CP526PCxHoo4br9yc5Nx+9UprBvCpghRTh/1nSODuGhi62kmpVqjNgQubYkwHI8aD3kz
         NkNg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=C2euQzj5;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id p6si1518992otk.5.2019.07.09.06.48.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jul 2019 06:48:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x69DmQAW106164;
	Tue, 9 Jul 2019 08:48:26 -0500
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x69DmQTM100443
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 9 Jul 2019 08:48:26 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 9 Jul
 2019 08:48:26 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 9 Jul 2019 08:48:26 -0500
Received: from pratyush-laptop.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x69Dm9P5107982;
	Tue, 9 Jul 2019 08:48:24 -0500
From: "'Pratyush Yadav' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@siemens.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        William
 Mills <wmills@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
        Pratyush Yadav
	<p-yadav1@ti.com>
Subject: [PATCH v3 6/6] arm64: iommu: smmu-v3: Add support for stage 1 translations
Date: Tue, 9 Jul 2019 19:18:36 +0530
Message-ID: <20190709134836.10485-7-p-yadav1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190709134836.10485-1-p-yadav1@ti.com>
References: <20190709134836.10485-1-p-yadav1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: p-yadav1@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=C2euQzj5;       spf=pass
 (google.com: domain of p-yadav1@ti.com designates 198.47.23.248 as permitted
 sender) smtp.mailfrom=p-yadav1@ti.com;       dmarc=pass (p=QUARANTINE sp=NONE
 dis=NONE) header.from=ti.com
X-Original-From: Pratyush Yadav <p-yadav1@ti.com>
Reply-To: Pratyush Yadav <p-yadav1@ti.com>
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

An emulated SMMU is presented to inmates by trapping access to the MMIO
registers to enable stage 1 translations.  Accesses to the SMMU memory
mapped registers are trapped and then routed to the emulated SMMU. This
is not emulation in the sense that we fully emulate the device top to
bottom. The emulation is used to provide an interface to the SMMU that
the hypervisor can control to make sure the inmates are not doing
anything they should not. The actual translations are done by hardware.

Emulation is needed because both stage 1 and stage 2 parameters are
configured in a single data structure, the stream table entry. For this
reason, the inmates can't be allowed to directly control the stream
table entries, and by extension, the stream table and command queue.

Work left to do:
- Route event notifications to the correct cell and identify which event
  needs to go to which cell.
- Add support for IRQ and MSI routing.
- Add support for PRI queues and ATS.
- Identify which cell caused a command queue error and notify it.
- Support sub-streams.

A lot of the work left is optional features that the SMMU provides like
substreams, ATS, PRI. There is little reason to add them unless there is
a use case for them.

Signed-off-by: Pratyush Yadav <p-yadav1@ti.com>
---
v3:
- Change CONFIG_SMMUV3 to CONFIG_SMMUV3_STAGE1
- As suggested by Jean, update dword 1-3 and then update dword 0 in
  arm_smmu_write_strtab_ent()

v2:
- Split the driver into two parts.
- Wrap every stage 1 related thing in a compile switch.
- Fix leaking arch.smmu_states by freeing it in cell_exit().
- Copy the root cell's stream table entries in
  arm_smmuv3_iommu_config_commit() instead of cell_init() because the
  cell's memory is not mapped when cell_init() is called for the root.

 hypervisor/arch/arm-common/include/asm/cell.h |   4 +
 .../arch/arm-common/include/asm/iommu.h       |   4 +
 hypervisor/arch/arm-common/iommu.c            |   8 +
 hypervisor/arch/arm64/smmu-v3.c               | 915 ++++++++++++++++++
 4 files changed, 931 insertions(+)

diff --git a/hypervisor/arch/arm-common/include/asm/cell.h b/hypervisor/arch/arm-common/include/asm/cell.h
index 5b1e4207..4eae91d8 100644
--- a/hypervisor/arch/arm-common/include/asm/cell.h
+++ b/hypervisor/arch/arm-common/include/asm/cell.h
@@ -19,6 +19,10 @@ struct arch_cell {
 	struct paging_structures mm;
 
 	u32 irq_bitmap[1024/32];
+
+#ifdef CONFIG_SMMUV3_STAGE1
+	struct arm_smmu_state *smmu_states;
+#endif
 };
 
 #endif /* !_JAILHOUSE_ASM_CELL_H */
diff --git a/hypervisor/arch/arm-common/include/asm/iommu.h b/hypervisor/arch/arm-common/include/asm/iommu.h
index f86120ec..3f94c1d4 100644
--- a/hypervisor/arch/arm-common/include/asm/iommu.h
+++ b/hypervisor/arch/arm-common/include/asm/iommu.h
@@ -23,6 +23,10 @@
 	     (counter) < (config)->num_stream_ids;			       \
 	     (sid) = (jailhouse_cell_stream_ids(config)[++(counter)]))
 
+#ifdef CONFIG_SMMUV3_STAGE1
+int arm_smmuv3_iommu_config_commit(struct cell *cell);
+#endif
+
 int iommu_map_memory_region(struct cell *cell,
 			    const struct jailhouse_memory *mem);
 int iommu_unmap_memory_region(struct cell *cell,
diff --git a/hypervisor/arch/arm-common/iommu.c b/hypervisor/arch/arm-common/iommu.c
index 5bc9e6a9..7399b455 100644
--- a/hypervisor/arch/arm-common/iommu.c
+++ b/hypervisor/arch/arm-common/iommu.c
@@ -28,5 +28,13 @@ int iommu_unmap_memory_region(struct cell *cell,
 
 int iommu_config_commit(struct cell *cell)
 {
+#ifdef CONFIG_SMMUV3_STAGE1
+	int ret;
+
+	ret = arm_smmuv3_iommu_config_commit(cell);
+	if (ret)
+		return ret;
+#endif /* CONFIG_SMMUV3_STAGE1 */
+
 	return 0;
 }
diff --git a/hypervisor/arch/arm64/smmu-v3.c b/hypervisor/arch/arm64/smmu-v3.c
index cde384e7..00caf837 100644
--- a/hypervisor/arch/arm64/smmu-v3.c
+++ b/hypervisor/arch/arm64/smmu-v3.c
@@ -365,6 +365,30 @@ struct arm_smmu_strtab_cfg {
 	u32				strtab_base_cfg;
 };
 
+#ifdef CONFIG_SMMUV3_STAGE1
+struct arm_smmu_state {
+	struct arm_smmu_device 		*smmu;
+	u32 				idr[6];
+	u32 				cr[3];
+	u32 				cr0ack;
+	u32				strtab_base_cfg;
+	u64				strtab_base;
+	u64				cmdq_base;
+	u32				cmdq_prod;
+	u32				cmdq_cons;
+	u64				evtq_base;
+	u32				evtq_prod;
+	u32				evtq_cons;
+	u32				gerror;
+	u32				gerrorn;
+	u32				irq_ctrl;
+	u32				irq_ctrlack;
+	u64				gerror_irq_cfg0;
+	u64				evtq_irq_cfg0;
+	/* Not all registers included. Add more as needed. */
+};
+#endif /* CONFIG_SMMUV3_STAGE1 */
+
 /* An SMMUv3 instance */
 struct arm_smmu_device {
 	void				*base;
@@ -375,6 +399,10 @@ struct arm_smmu_device {
 	struct arm_smmu_strtab_cfg	strtab_cfg;
 } smmu[JAILHOUSE_MAX_IOMMU_UNITS];
 
+#ifdef CONFIG_SMMUV3_STAGE1
+static struct arm_smmu_state state_dump[JAILHOUSE_MAX_IOMMU_UNITS];
+#endif
+
 /* Low-level queue manipulation functions */
 static bool queue_full(struct arm_smmu_queue *q)
 {
@@ -594,6 +622,9 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_device *smmu, u32 sid,
 {
 	struct paging_structures *pg_structs = &this_cell()->arch.mm;
 	u64 val, vttbr;
+#ifdef CONFIG_SMMUV3_STAGE1
+	u64 mask;
+#endif
 
 	val = 0;
 
@@ -612,6 +643,24 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_device *smmu, u32 sid,
 		return;
 	}
 
+#ifdef CONFIG_SMMUV3_STAGE1
+	dst[0] = 0;
+	dsb(ishst);
+	arm_smmu_sync_ste_for_sid(smmu, sid);
+
+	if (guest_ste != NULL) {
+		if (FIELD_GET(STRTAB_STE_0_S1CDMAX, guest_ste[0]) != 0) {
+			printk("WARN: SMMU sub-streams not supported\n");
+		}
+
+		val = guest_ste[0];
+
+		mask = STRTAB_STE_1_S1COR | STRTAB_STE_1_S1DSS |
+		       STRTAB_STE_1_S1CSH | STRTAB_STE_1_S1CIR;
+		dst[1] = guest_ste[1] & mask;
+	}
+#endif /* CONFIG_SMMUV3_STAGE1 */
+
 	if (!(smmu->features & IDR0_VMID16) && vmid > ARM_SMMU_VMID8_MAX_VMID) {
 		printk("ERROR: 16 bit VMID not supported");
 		return;
@@ -1096,12 +1145,784 @@ static void arm_smmu_uninit_ste(struct arm_smmu_device *smmu, u32 sid, u32 vmid)
 		arm_smmu_uninit_l2_strtab(smmu, sid);
 }
 
+#ifdef CONFIG_SMMUV3_STAGE1
+static void arm_smmu_dump_state(struct arm_smmu_state *state,
+				struct arm_smmu_device *smmu)
+{
+	state->smmu = smmu;
+
+	state->idr[0] = mmio_read32(smmu->base + ARM_SMMU_IDR0);
+	state->idr[1] = mmio_read32(smmu->base + ARM_SMMU_IDR1);
+	state->idr[2] = mmio_read32(smmu->base + ARM_SMMU_IDR2);
+	state->idr[3] = mmio_read32(smmu->base + ARM_SMMU_IDR3);
+	state->idr[4] = mmio_read32(smmu->base + ARM_SMMU_IDR4);
+	state->idr[5] = mmio_read32(smmu->base + ARM_SMMU_IDR5);
+
+	state->cr[0] = mmio_read32(smmu->base + ARM_SMMU_CR0);
+	state->cr[1] = mmio_read32(smmu->base + ARM_SMMU_CR1);
+	state->cr[2] = mmio_read32(smmu->base + ARM_SMMU_CR2);
+	state->cr0ack = mmio_read32(smmu->base + ARM_SMMU_CR0ACK);
+
+	state->strtab_base = mmio_read64(smmu->base + ARM_SMMU_STRTAB_BASE);
+	state->strtab_base_cfg = mmio_read32(smmu->base +
+					     ARM_SMMU_STRTAB_BASE_CFG);
+	state->cmdq_base = mmio_read64(smmu->base + ARM_SMMU_CMDQ_BASE);
+	state->cmdq_prod = mmio_read32(smmu->base + ARM_SMMU_CMDQ_PROD);
+	state->cmdq_cons = mmio_read32(smmu->base + ARM_SMMU_CMDQ_CONS);
+
+	state->evtq_base = mmio_read64(smmu->base + ARM_SMMU_EVTQ_BASE);
+	state->evtq_prod = mmio_read32(smmu->base + ARM_SMMU_EVTQ_PROD);
+	state->evtq_cons = mmio_read32(smmu->base + ARM_SMMU_EVTQ_CONS);
+}
+
+static bool arm_smmu_cell_can_access_sid(struct cell *cell, u32 sid)
+{
+	int i;
+	u32 config_sid;
+
+	for_each_stream_id(config_sid, cell->config, i) {
+		if (config_sid == sid) {
+			return true;
+		}
+	}
+
+	return false;
+}
+
+static int arm_smmu_state_init(struct arm_smmu_state *state,
+			       struct arm_smmu_device *smmu)
+{
+	u32 reg;
+
+	state->smmu = smmu;
+
+	reg = mmio_read32(smmu->base + ARM_SMMU_IDR0);
+	/* Tell guests stage 2 is not supported. */
+	reg = FIELD_CLEAR(IDR0_S2P, reg);
+	/* ATOS, VATOS, PRI, ATS, HTTU, MSI not supported yet. */
+	reg = FIELD_CLEAR(IDR0_ATOS, reg);
+	reg = FIELD_CLEAR(IDR0_VATOS, reg);
+	reg = FIELD_CLEAR(IDR0_PRI, reg);
+	reg = FIELD_CLEAR(IDR0_NS1ATS, reg);
+	reg = FIELD_CLEAR(IDR0_ATS, reg);
+	reg = FIELD_CLEAR(IDR0_HTTU, reg);
+	reg = FIELD_CLEAR(IDR0_MSI, reg);
+
+	state->idr[0] = reg;
+
+	reg = mmio_read32(smmu->base + ARM_SMMU_IDR1);
+	/* Substreams not supported for now. */
+	reg = FIELD_CLEAR(IDR1_SSIDSIZE, reg);
+
+	state->idr[1] = reg;
+
+	state->idr[2] = mmio_read32(smmu->base + ARM_SMMU_IDR2);
+	state->idr[3] = mmio_read32(smmu->base + ARM_SMMU_IDR3);
+	state->idr[4] = mmio_read32(smmu->base + ARM_SMMU_IDR4);
+	state->idr[5] = mmio_read32(smmu->base + ARM_SMMU_IDR5);
+
+	/* Reset the control registers. */
+	state->cr[0] = 0;
+	state->cr[1] = 0;
+	state->cr[2] = 0;
+
+	state->gerror = 0;
+	state->gerrorn = 0;
+
+	state->cmdq_base = 0;
+	state->cmdq_prod = 0;
+	state->cmdq_cons = 0;
+
+	state->evtq_base = 0;
+	state->evtq_prod = 0;
+	state->evtq_cons = 0;
+
+	state->irq_ctrl = 0;
+	state->irq_ctrlack = 0;
+	state->evtq_irq_cfg0 = 0;
+	state->gerror_irq_cfg0 = 0;
+
+	return 0;
+}
+
+static int arm_smmu_get_step_from_guest(struct arm_smmu_state *state, u32 sid,
+					u64 *dest)
+{
+	void *step_page;
+	u64 *step, base_cfg, strtab_base, ste_addr;
+	u32 log2size;
+
+	base_cfg = state->strtab_base_cfg;
+
+	/*
+	 * Directly ANDing with the mask instead of using FIELD_GET() is
+	 * intentional. The address has to be aligned by 64 bytes, so the
+	 * bottom 6 bits are always 0, and so skipped when writing them to the
+	 * register. By ANDing with the mask, we make the bottom 6 bits 0. This
+	 * is the same for l2ptr calculation below.
+	 *
+	 * Using FIELD_GET(STRTAB_BASE_ADDR_MASK, state->strtab_base) << 6
+	 * would have the same result.
+	 */
+	strtab_base = state->strtab_base & STRTAB_BASE_ADDR_MASK;
+
+	log2size = FIELD_GET(STRTAB_BASE_CFG_LOG2SIZE, base_cfg);
+
+	/* Check if 2 level walk should be used or 1 level. */
+	if (FIELD_GET(STRTAB_BASE_CFG_FMT, base_cfg) == STRTAB_BASE_CFG_FMT_2LVL) {
+		u64 l2ptr, num_l2_ents;
+		u32 split, idx, span;
+
+		split = FIELD_GET(STRTAB_BASE_CFG_SPLIT, base_cfg);
+
+		idx = (sid >> split) * STRTAB_L1_DESC_SIZE;
+		ste_addr = strtab_base + idx;
+
+		step_page = paging_get_guest_pages(NULL, (ste_addr & PAGE_MASK),
+						   2, PAGE_DEFAULT_FLAGS);
+		if (step_page == NULL) {
+			printk("%s: Failed to allocate memory for level 1 "
+			       "steam table walk\n", __func__);
+			return -ENOMEM;
+		}
+
+		step = step_page + PAGE_OFFSET(ste_addr);
+
+		/* Get the second level table base. */
+		l2ptr = step[0] & STRTAB_L1_DESC_L2PTR_MASK;
+
+		span = FIELD_GET(STRTAB_L1_DESC_SPAN, step[0]);
+		num_l2_ents = 1 << (span - 1);
+
+		idx = (sid & ((1 << split) - 1)) * STRTAB_STE_SIZE;
+		ste_addr = l2ptr + idx;
+
+		if (span == 0) {
+			return -ENOENT;
+		}
+
+		if (span > split + 1 ||
+		    ste_addr > (l2ptr + num_l2_ents * STRTAB_STE_SIZE)) {
+			return -EINVAL;
+		}
+
+		step_page = paging_get_guest_pages(NULL, (ste_addr & PAGE_MASK),
+						   2, PAGE_DEFAULT_FLAGS);
+		if (step_page == NULL) {
+			printk("%s: Failed to allocate memory for level 2 "
+			       "steam table walk\n", __func__);
+			return -ENOMEM;
+		}
+
+		step = step_page + PAGE_OFFSET(ste_addr);
+	} else {
+		u32 num_stes, idx;
+
+		num_stes = 1 << log2size;
+
+		if (sid >= num_stes) {
+			return -EINVAL;
+		}
+
+		idx = sid * STRTAB_STE_SIZE;
+		ste_addr = strtab_base + idx;
+
+		step_page = paging_get_guest_pages(NULL, (ste_addr & PAGE_MASK),
+						   2, PAGE_DEFAULT_FLAGS);
+		if (step_page == NULL) {
+			printk("%s: Failed to allocate memory for linear "
+			       "steam table walk\n", __func__);
+			return -ENOMEM;
+		}
+
+		step = step_page + PAGE_OFFSET(ste_addr);
+	}
+
+	/*
+	 * Pages mapped via paging_get_guest_pages() are temporary, and valid
+	 * only until the next call to it. That's why it is better to copy to
+	 * a buffer rather than returning the pointer directly.
+	 */
+	memcpy(dest, step, STRTAB_STE_SIZE);
+
+	return 0;
+}
+
+static int arm_smmu_cfgi_ste(struct arm_smmu_state *state, u32 sid)
+{
+	struct cell *cell;
+	u64 guest_ste[STRTAB_STE_DWORDS], *step;
+	int ret;
+
+	cell = this_cell();
+
+	/* Whoops, this cell is not allowed to touch this sid. */
+	if (!arm_smmu_cell_can_access_sid(cell, sid)) {
+		printk("ERROR: Cell %u trying to access stream ID %u. "
+		       "Access denied.\n", cell->config->id, sid);
+		return -EPERM;
+	}
+
+	ret = arm_smmu_get_step_from_guest(state, sid, guest_ste);
+	if (ret) {
+		return ret;
+	}
+
+	/*
+	 * Get the hardware STE and update it with values from the guest.
+	 */
+	step = arm_smmu_get_step_for_sid(state->smmu, sid);
+
+	arm_smmu_write_strtab_ent(state->smmu, sid, guest_ste, step, false,
+				  cell->config->id);
+
+	return 0;
+}
+
+/*
+ * ToDo: Use the command queue error registers here.
+ */
+static int arm_smmu_consume_cmd(struct arm_smmu_state *state)
+{
+	struct cell *cell;
+	void *cmdq_base_page;
+	struct arm_smmu_cmdq_ent ent;
+	u64 cmd[CMDQ_ENT_DWORDS], *cmdq_base, cmdq_base_addr;
+	u32 sid, ssid, cons, shift, idx;
+	u8 op;
+	int ret, i;
+
+	cell = this_cell();
+	shift = FIELD_GET(Q_BASE_LOG2SIZE, state->cmdq_base);
+
+	if (Q_EMPTY(state->cmdq_prod, state->cmdq_cons, shift)) {
+		printk("WARN: %s() called but command queue is empty\n",
+		       __func__);
+		return 0;
+	}
+
+	cmdq_base_addr = state->cmdq_base & Q_BASE_ADDR_MASK;
+
+	/*
+	 * Map 2 pages in case the base address is not aligned at a page
+	 * boundary. The queue size is capped at 4k so it can't span more than
+	 * 2 pages.
+	 */
+	cmdq_base_page = paging_get_guest_pages(NULL, cmdq_base_addr, 2,
+					    PAGE_DEFAULT_FLAGS);
+	if (cmdq_base_page == NULL) {
+		printk("ERROR: Failed to allocate memory for reading the SMMU "
+		       "command\n");
+		return -ENOMEM;
+	}
+	/*
+	 * Offset the base page by the offset of q_base from the page boundary.
+	 * This is to handle the case when the queue base is not page-aligned.
+	 * For page-aligned base values, the address remains the same.
+	 */
+	cmdq_base = cmdq_base_page + PAGE_OFFSET(cmdq_base_addr);
+
+	idx = Q_IDX(state->cmdq_cons, shift) * CMDQ_ENT_DWORDS;
+	cmd[0] = cmdq_base[idx];
+	cmd[1] = cmdq_base[idx + 1];
+
+	op = cmd[0] & CMDQ_0_OP;
+
+	ent.opcode = op;
+
+	switch (op) {
+	case CMDQ_OP_CFGI_STE:
+		sid = FIELD_GET(CMDQ_CFGI_0_SID, cmd[0]);
+
+		ret = arm_smmu_cfgi_ste(state, sid);
+		if (ret) {
+			return ret;
+		}
+		break;
+	case CMDQ_OP_CFGI_ALL:
+		/*
+		 * This might flood the command queue with too many invalidation
+		 * commands, but we can't directly issue CFGI_ALL because it
+		 * will affect other cell's STEs.
+		 *
+		 * Let's work on the assumption that the number of stream IDs
+		 * allocated to a cell is a fairly small number.
+		 */
+		for_each_stream_id(sid, cell->config, i) {
+			ret = arm_smmu_cfgi_ste(state, sid);
+			/*
+			 * -ENOENT means the STE was not installed by the guest
+			 * even though we give it access in the config file.
+			 * Just skip it.
+			 */
+			if (ret && ret != -ENOENT) {
+				return ret;
+			}
+		}
+		break;
+	case CMDQ_OP_CMD_SYNC:
+		ent.sync.msiaddr = cmd[1] & CMDQ_SYNC_1_MSIADDR_MASK;
+		ent.sync.msidata = FIELD_GET(CMDQ_SYNC_0_MSIDATA, cmd[0]);
+		arm_smmu_cmdq_issue_cmd(state->smmu, &ent);
+		break;
+	case CMDQ_OP_PREFETCH_ADDR:
+		ent.prefetch.addr = cmd[1] & CMDQ_PREFETCH_1_ADDR_MASK;
+		ent.prefetch.size = FIELD_GET(CMDQ_PREFETCH_1_SIZE, cmd[1]);
+		/* Fallthrough */
+	case CMDQ_OP_PREFETCH_CFG:
+		sid = FIELD_GET(CMDQ_PREFETCH_0_SID, cmd[0]);
+		ssid = FIELD_GET(CMDQ_PREFETCH_0_SSID, cmd[0]);
+
+		if (ssid != 0) {
+			printk("WARN: Substreams not supported\n");
+		}
+
+		if (!arm_smmu_cell_can_access_sid(cell, sid)) {
+			printk("ERROR: Cell %u trying to access stream ID %u. "
+			       "Access denied.\n", cell->config->id, sid);
+			return -EPERM;
+		}
+
+		ent.prefetch.sid = sid;
+		arm_smmu_cmdq_issue_cmd(state->smmu, &ent);
+		break;
+	case CMDQ_OP_TLBI_NH_VA:
+		ent.tlbi.addr = cmd[1] & CMDQ_TLBI_1_VA_MASK;
+		ent.tlbi.leaf = FIELD_GET(CMDQ_TLBI_1_LEAF, cmd[1]);
+		/* Fallthrough */
+	case CMDQ_OP_TLBI_NH_ASID:
+		ent.tlbi.asid = FIELD_GET(CMDQ_TLBI_0_ASID, cmd[0]);
+		/* Fallthrough */
+	case CMDQ_OP_TLBI_S12_VMALL:
+		ent.tlbi.vmid = cell->config->id;
+		arm_smmu_cmdq_issue_cmd(state->smmu, &ent);
+		break;
+	case CMDQ_OP_TLBI_NSNH_ALL:
+		/* Only invalidate TLB entries for this cell. */
+		ent.opcode = CMDQ_OP_TLBI_S12_VMALL;
+		ent.tlbi.vmid = cell->config->id;
+		arm_smmu_cmdq_issue_cmd(state->smmu, &ent);
+		break;
+	case CMDQ_OP_TLBI_EL2_ALL:
+		/* Don't let guest cells touch EL2 entries. */
+		break;
+	default:
+		printk("Command 0x%x not implemented yet\n", op);
+		return -EINVAL;
+	}
+
+	cons = state->cmdq_cons;
+	cons = (Q_WRP(cons, shift) | Q_IDX(cons, shift)) + 1;
+
+	state->cmdq_cons = Q_OVF(state->cmdq_cons) | Q_WRP(cons, shift) |
+			   Q_IDX(cons, shift);
+
+	dsb(ishst);
+	return 0;
+}
+
+static enum mmio_result arm_smmu_state_write64(struct arm_smmu_state *state,
+					       struct mmio_access *mmio)
+{
+	u64 offset;
+
+	offset = mmio->address;
+
+	switch (offset) {
+	case ARM_SMMU_CMDQ_BASE:
+		if (state->idr[1] & IDR1_QUEUES_PRESET) {
+			/* Read only. */
+			return MMIO_ERROR;
+		}
+		state->cmdq_base = mmio->value;
+		break;
+	case ARM_SMMU_EVTQ_BASE:
+		if (state->idr[1] & IDR1_QUEUES_PRESET) {
+			/* Read only. */
+			return MMIO_ERROR;
+		}
+		state->evtq_base = mmio->value;
+		break;
+	case ARM_SMMU_STRTAB_BASE:
+		if (state->idr[1] & IDR1_TABLES_PRESET) {
+			/* This register is read-only in preset mode. */
+			return MMIO_ERROR;
+		}
+		state->strtab_base = mmio->value;
+		break;
+	case ARM_SMMU_GERROR_IRQ_CFG0:
+		state->gerror_irq_cfg0 = mmio->value;
+		break;
+	case ARM_SMMU_EVTQ_IRQ_CFG0:
+		state->gerror_irq_cfg0 = mmio->value;
+		break;
+	default:
+		/* Not a writeable register. */
+		printk("ERROR: Writing in a non-writeable SMMU register at "
+		       "offset 0x%llx\n", offset);
+		return MMIO_ERROR;
+	}
+
+	return MMIO_HANDLED;
+}
+
+static enum mmio_result arm_smmu_state_write32(struct arm_smmu_state *state,
+					       struct mmio_access *mmio)
+{
+	u64 offset, value;
+	u32 shift;
+	int ret;
+
+	offset = mmio->address;
+
+	ret = 0;
+
+	switch (offset) {
+	case ARM_SMMU_CR0:
+		state->cr[0] = mmio->value;
+		state->cr0ack = mmio->value;
+		break;
+	case ARM_SMMU_CR1:
+		state->cr[1] = mmio->value;
+		break;
+	case ARM_SMMU_CR2:
+		state->cr[2] = mmio->value;
+		break;
+	case ARM_SMMU_CMDQ_BASE:	/* 64b */
+		if (state->idr[1] & IDR1_QUEUES_PRESET) {
+			/* Read only. */
+			return MMIO_ERROR;
+		}
+
+		value = LOWER_32_BITS(state->cmdq_base);
+		value |= mmio->value << 32;
+		state->cmdq_base = value;
+		break;
+	case ARM_SMMU_CMDQ_BASE + 4:
+		if (state->idr[1] & IDR1_QUEUES_PRESET) {
+			/* Read only. */
+			return MMIO_ERROR;
+		}
+
+		value = UPPER_32_BITS(state->cmdq_base) << 32;
+		value |= mmio->value;
+		state->cmdq_base = value;
+		break;
+	case ARM_SMMU_CMDQ_PROD:
+		/* The guest is responsible for checking if queue is full. */
+		state->cmdq_prod = mmio->value;
+
+		if (!FIELD_GET(CR0_CMDQEN, state->cr[0])) {
+			break;
+		}
+
+		if (FIELD_GET(GERROR_CMDQ_ERR, state->gerror)) {
+			break;
+		}
+
+		shift = FIELD_GET(Q_BASE_LOG2SIZE, state->cmdq_base);
+
+		while (!ret && !Q_EMPTY(state->cmdq_prod, state->cmdq_cons,
+		       shift)) {
+			ret = arm_smmu_consume_cmd(state);
+		}
+
+		break;
+	case ARM_SMMU_CMDQ_CONS:
+		state->cmdq_cons = mmio->value;
+		break;
+	case ARM_SMMU_EVTQ_BASE:	/* 64b */
+		if (state->idr[1] & IDR1_QUEUES_PRESET) {
+			/* Read only. */
+			return MMIO_ERROR;
+		}
+
+		value = LOWER_32_BITS(state->evtq_base);
+		value |= mmio->value << 32;
+		state->evtq_base = value;
+		break;
+	case ARM_SMMU_EVTQ_BASE + 4:
+		if (state->idr[1] & IDR1_QUEUES_PRESET) {
+			/* Read only. */
+			return MMIO_ERROR;
+		}
+
+		value = UPPER_32_BITS(state->evtq_base) << 32;
+		value |= mmio->value;
+		state->evtq_base = value;
+		break;
+	case ARM_SMMU_EVTQ_PROD:
+		state->evtq_prod = mmio->value;
+		break;
+	case ARM_SMMU_EVTQ_CONS:
+		state->evtq_cons = mmio->value;
+		break;
+	case ARM_SMMU_STRTAB_BASE:	/* 64b */
+		if (state->idr[1] & IDR1_TABLES_PRESET) {
+			/* This register is read-only in preset mode. */
+			return MMIO_ERROR;
+		}
+
+		value = LOWER_32_BITS(state->strtab_base);
+		value |= mmio->value << 32;
+		state->strtab_base = value;
+		break;
+	case ARM_SMMU_STRTAB_BASE + 4:
+		if (state->idr[1] & IDR1_TABLES_PRESET) {
+			/* This register is read-only in preset mode. */
+			return MMIO_ERROR;
+		}
+
+		value = UPPER_32_BITS(state->strtab_base) << 32;
+		value |= mmio->value;
+		state->strtab_base = value;
+		break;
+	case ARM_SMMU_STRTAB_BASE_CFG:
+		if (state->idr[1] & IDR1_TABLES_PRESET) {
+			return MMIO_ERROR;
+		}
+
+		/*
+		 * The split can only be 6, 8, 10 (4kB/16kB/64Bk leaf tables).
+		 * All other values are reserved and are treated as 6.
+		 */
+		if (!(FIELD_GET(STRTAB_BASE_CFG_SPLIT, mmio->value) == 6 ||
+		    FIELD_GET(STRTAB_BASE_CFG_SPLIT, mmio->value) == 8 ||
+		    FIELD_GET(STRTAB_BASE_CFG_SPLIT, mmio->value) == 10)) {
+			mmio->value = FIELD_CLEAR(ARM_SMMU_STRTAB_BASE_CFG,
+						  mmio->value);
+			mmio->value |= FIELD_PREP(STRTAB_BASE_CFG_SPLIT, 6);
+		}
+
+		state->strtab_base_cfg = mmio->value;
+		break;
+	case ARM_SMMU_GERRORN:
+		/*
+		 * The SMMU driver will toggle fields in this register to
+		 * acknowldge errors. Update GERROR too so software knows it
+		 * can continue.
+		 */
+		state->gerrorn = state->gerror = mmio->value;
+		break;
+	case ARM_SMMU_IRQ_CTRL:
+		/*
+		 * XXX: IRQs are not supported yet. For now, just let the
+		 * write go through without any effect. The guest expects to
+		 * see an acknowldgement in ARM_SMMU_IRQ_CTRLACK.
+		 */
+		state->irq_ctrl = mmio->value;
+		state->irq_ctrlack = mmio->value;
+		break;
+	default:
+		/* Not a writeable register. */
+		printk("ERROR: Writing in a non-writeable SMMU register at "
+		       "offset 0x%llx\n", offset);
+		return MMIO_ERROR;
+	}
+
+	if (ret) {
+		return MMIO_ERROR;
+	}
+
+	return MMIO_HANDLED;
+}
+
+static enum mmio_result arm_smmu_state_read64(struct arm_smmu_state *state,
+					      struct mmio_access *mmio)
+{
+	u64 offset, value;
+
+	offset = mmio->address;
+
+	switch(offset) {
+	case ARM_SMMU_CMDQ_BASE:
+		value = state->cmdq_base;
+		break;
+	case ARM_SMMU_STRTAB_BASE:
+		value = state->strtab_base;
+		break;
+	case ARM_SMMU_EVTQ_BASE:
+		value = state->evtq_base;
+		break;
+	default:
+		printk("ERROR: Register at offset 0x%llx not implemented yet\n",
+		       offset);
+		return MMIO_ERROR;
+	}
+
+	mmio->value = value;
+	return MMIO_HANDLED;
+}
+
+static enum mmio_result arm_smmu_state_read32(struct arm_smmu_state *state,
+					      struct mmio_access *mmio)
+{
+	u64 offset;
+	u32 value;
+
+	offset = mmio->address;
+
+	switch (offset) {
+	case ARM_SMMU_CR0:
+		value = state->cr[0];
+		break;
+	case ARM_SMMU_CR1:
+		value = state->cr[1];
+		break;
+	case ARM_SMMU_CR2:
+		value = state->cr[2];
+		break;
+	case ARM_SMMU_CR0ACK:
+		value = state->cr0ack;
+		break;
+	case ARM_SMMU_IDR0:
+		value = state->idr[0];
+		break;
+	case ARM_SMMU_IDR1:
+		value = state->idr[1];
+		break;
+	case ARM_SMMU_IDR2:
+		value = state->idr[2];
+		break;
+	case ARM_SMMU_IDR3:
+		value = state->idr[3];
+		break;
+	case ARM_SMMU_IDR4:
+		value = state->idr[4];
+		break;
+	case ARM_SMMU_IDR5:
+		value = state->idr[5];
+		break;
+	case ARM_SMMU_CMDQ_BASE:	/* 64b */
+		value = UPPER_32_BITS(state->cmdq_base);
+		break;
+	case ARM_SMMU_CMDQ_BASE + 4:
+		value = LOWER_32_BITS(state->cmdq_base);
+		break;
+	case ARM_SMMU_CMDQ_PROD:
+		value = state->cmdq_prod;
+		break;
+	case ARM_SMMU_CMDQ_CONS:
+		value = state->cmdq_cons;
+		break;
+	case ARM_SMMU_EVTQ_BASE:	/* 64b */
+		value = UPPER_32_BITS(state->evtq_base);
+		break;
+	case ARM_SMMU_EVTQ_BASE + 4:
+		value = LOWER_32_BITS(state->evtq_base);
+		break;
+	case ARM_SMMU_EVTQ_PROD:
+		value = state->evtq_prod;
+		break;
+	case ARM_SMMU_EVTQ_CONS:
+		value = state->evtq_cons;
+		break;
+	case ARM_SMMU_STRTAB_BASE:	/* 64b */
+		value = UPPER_32_BITS(state->strtab_base);
+		break;
+	case ARM_SMMU_STRTAB_BASE + 4:
+		value = LOWER_32_BITS(state->strtab_base);
+		break;
+	case ARM_SMMU_STRTAB_BASE_CFG:
+		value = state->strtab_base_cfg;
+		break;
+	case ARM_SMMU_GERROR:
+		value = state->gerror;
+		break;
+	case ARM_SMMU_GERRORN:
+		value = state->gerrorn;
+		break;
+	case ARM_SMMU_IRQ_CTRL:
+		value = state->irq_ctrl;
+		break;
+	case ARM_SMMU_IRQ_CTRLACK:
+		value = state->irq_ctrlack;
+		break;
+	default:
+		/*
+		 * The SMMU spec says all undefined register accesses should be
+		 * RAZ/WI. Keep it like this for now so we know when
+		 * un-implemented registers are being used, rather than having
+		 * silent failures all over. Same for handling writes.
+		 */
+		printk("ERROR: Register at offset 0x%llx not implemented yet\n",
+		       offset);
+		return MMIO_ERROR;
+	}
+
+	mmio->value = value;
+
+	return MMIO_HANDLED;
+}
+
+static enum mmio_result arm_smmu_mmio_handler(void *arg,
+					      struct mmio_access *mmio)
+{
+	struct arm_smmu_state *state;
+	enum mmio_result ret;
+
+	state = arg;
+
+	if (mmio->is_write) {
+		if (mmio->size == 4)
+			ret = arm_smmu_state_write32(state, mmio);
+		else if (mmio->size == 8)
+			ret = arm_smmu_state_write64(state, mmio);
+		else
+			return MMIO_HANDLED;	/* Write-invalidate (WI) */
+	} else {
+		if (mmio->size == 4)
+			ret = arm_smmu_state_read32(state, mmio);
+		else if (mmio->size == 8)
+			ret = arm_smmu_state_read64(state, mmio);
+		else {
+			mmio->value = 0;
+			return MMIO_HANDLED;	/* Read As Zero (RAZ) */
+		}
+	}
+
+	return ret;
+}
+
+/*
+ * Before loading Jailhouse, the root cell might have set up stream table
+ * entries. Jailhouse replaces the stream table with its own, so install those
+ * entries in the hypervisor's stream table.
+ */
+static void arm_smmu_init_root_strtab(struct arm_smmu_state *state)
+{
+	u64 guest_ste[STRTAB_STE_DWORDS];
+	u32 sid;
+	int i, ret;
+
+	for_each_stream_id(sid, root_cell.config, i) {
+		ret = arm_smmu_get_step_from_guest(state, sid, guest_ste);
+		if (ret) {
+			continue;
+		}
+
+		if (guest_ste[0] & STRTAB_STE_0_V) {
+			ret = arm_smmu_cfgi_ste(state, sid);
+			if (ret) {
+				continue;
+			}
+		}
+	}
+}
+
+#endif /* CONFIG_SMMUV3_STAGE1 */
+
 static int arm_smmuv3_cell_init(struct cell *cell)
 {
 	struct jailhouse_iommu *iommu;
 	struct arm_smmu_cmdq_ent cmd;
 	int ret, i, j, sid;
 
+#ifdef CONFIG_SMMUV3_STAGE1
+	struct arm_smmu_state *state;
+	cell->arch.smmu_states = NULL;
+#endif
+
 	for (i = 0; i < JAILHOUSE_MAX_IOMMU_UNITS; i++) {
 		iommu = &system_config->platform_info.arm.iommu_units[i];
 		if (iommu->type != JAILHOUSE_IOMMU_SMMUV3)
@@ -1115,6 +1936,29 @@ static int arm_smmuv3_cell_init(struct cell *cell)
 				return ret;
 			}
 		}
+
+#ifdef CONFIG_SMMUV3_STAGE1
+		/* Only initialize if stage 1 translations are supported. */
+		if (smmu[i].features & IDR0_S1P) {
+			if (cell->arch.smmu_states == NULL) {
+				cell->arch.smmu_states = page_alloc(&mem_pool,
+					PAGES(sizeof(*cell->arch.smmu_states) *
+					JAILHOUSE_MAX_IOMMU_UNITS));
+				if (cell->arch.smmu_states == NULL) {
+					printk("ERROR: Unable to allocate "
+					       "per-cell SMMU data\n");
+					return -ENOMEM;
+				}
+			}
+
+			state = &cell->arch.smmu_states[i];
+			arm_smmu_state_init(state, &smmu[i]);
+
+			/* Register the SMMU as an MMIO region. */
+			mmio_region_register(cell, iommu->base, iommu->size,
+					     arm_smmu_mmio_handler, state);
+		}
+#endif /* CONFIG_SMMUV3_STAGE1 */
 	}
 
 	cmd.opcode	= CMDQ_OP_TLBI_S12_VMALL;
@@ -1141,6 +1985,12 @@ static void arm_smmuv3_cell_exit(struct cell *cell)
 		}
 	}
 
+#ifdef CONFIG_SMMUV3_STAGE1
+	page_free(&mem_pool, cell->arch.smmu_states,
+		  PAGES(sizeof(*cell->arch.smmu_states) *
+		  JAILHOUSE_MAX_IOMMU_UNITS));
+#endif
+
 	cmd.opcode	= CMDQ_OP_TLBI_S12_VMALL;
 	cmd.tlbi.vmid	= cell->config->id;
 	arm_smmu_cmdq_issue_cmd(smmu, &cmd);
@@ -1169,6 +2019,16 @@ static int arm_smmuv3_init(void)
 		if (ret)
 			return ret;
 
+#ifdef CONFIG_SMMUV3_STAGE1
+		/*
+		 * The root cell's OS has already initialised the SMMU
+		 * so the emulated SMMU state won't be correct for the root
+		 * cell. Dump the current SMMU registers and then we will copy
+		 * it over later.
+		 */
+		arm_smmu_dump_state(&state_dump[i], &smmu[i]);
+#endif /* CONFIG_SMMUV3_STAGE1 */
+
 		/* Reset the device */
 		ret = arm_smmu_device_reset(&smmu[i]);
 		if (ret)
@@ -1178,6 +2038,61 @@ static int arm_smmuv3_init(void)
 	return arm_smmuv3_cell_init(&root_cell);
 }
 
+#ifdef CONFIG_SMMUV3_STAGE1
+int arm_smmuv3_iommu_config_commit(struct cell *cell)
+{
+	struct jailhouse_iommu *iommu;
+	struct arm_smmu_state *state;
+	int i;
+
+	if (cell != &root_cell)
+		return 0;
+
+	/*
+	 * The SMMU does not support stage 1 translations. So nothing to do
+	 * here.
+	 */
+	if (&cell->arch.smmu_states == NULL)
+		return 0;
+
+	for (i = 0; i < JAILHOUSE_MAX_IOMMU_UNITS; i++) {
+		iommu = &system_config->platform_info.arm.iommu_units[i];
+		if (iommu->type != JAILHOUSE_IOMMU_SMMUV3)
+			continue;
+
+		state = &cell->arch.smmu_states[i];
+
+		/*
+		 * The root cell's OS has already initialised the
+		 * SMMU so in that case copy the state from the SMMU
+		 * dump.
+		 */
+		memcpy(state, &state_dump[i], sizeof(*state));
+		arm_smmu_init_root_strtab(state);
+	}
+
+	return 0;
+}
+#endif /* CONFIG_SMMUV3_STAGE1 */
+
+#ifdef CONFIG_SMMUV3_STAGE1
+static unsigned int arm_smmuv3_mmio_count_regions(struct cell *cell)
+{
+	int i;
+	unsigned int count;
+
+	count = 0;
+
+	for (i = 0; i < JAILHOUSE_MAX_IOMMU_UNITS; i++) {
+		if (smmu[i].features & IDR0_S1P)
+			count++;
+	}
+
+	return count;
+}
+#else
 DEFINE_UNIT_MMIO_COUNT_REGIONS_STUB(arm_smmuv3);
+#endif /* CONFIG_SMMUV3_STAGE1 */
+
 DEFINE_UNIT_SHUTDOWN_STUB(arm_smmuv3);
 DEFINE_UNIT(arm_smmuv3, "ARM SMMU v3");
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190709134836.10485-7-p-yadav1%40ti.com.
For more options, visit https://groups.google.com/d/optout.
