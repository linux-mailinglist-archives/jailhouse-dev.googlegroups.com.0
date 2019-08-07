Return-Path: <jailhouse-dev+bncBCB7D7MXMMIK5CFK5ICRUBCH5GHXK@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x63b.google.com (mail-pl1-x63b.google.com [IPv6:2607:f8b0:4864:20::63b])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0D084678
	for <lists+jailhouse-dev@lfdr.de>; Wed,  7 Aug 2019 09:56:31 +0200 (CEST)
Received: by mail-pl1-x63b.google.com with SMTP id 71sf50477495pld.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 07 Aug 2019 00:56:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1565164590; cv=pass;
        d=google.com; s=arc-20160816;
        b=0cJ5rFLtBmflnqGegc1IwT/9b9bnlZr1DR+bT7wLYZ10R1MEx6sMnOUUwBzqZjjydn
         S7du+jc89BUd4xCNoPbKvhlNDqrXWGuFObrF2oEYj+K0joeBqYYYbdi0K8DLpZq9XHGw
         lggKKnS7W8/ZqAsKSwp0WJH3W/Yi2kBIuqXwrTVQjcL2ZSB52xPCU4DXjKCki2kLDVrM
         pR6vSJJ5oiT7q32fNMx9ZcEjG+P74Y1kSROeqR+LWRQ8YNoA4CGTxmCnq4t1MmfT3Q4/
         ZMa5ia6vn3Gr3nwoE05agr2t9XU3tG37YqSZhpoHeimYbini/F9aQ1Mv1keRpZvUzpIW
         BOCA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=S6pRLCMKUia381ndHyqhecE+fQ0pdBHWtuKeRyYvuOI=;
        b=0JuZ9twL1oDQ7r9XPep3SG/nShvboPR4QX1bQJjGPEnxsjLxOarZVqXVya3ibqPSxH
         eurmdEEgm5JX5gtqjFGx0lZsK2WVP1r5EUUW0zJpQUzPlnvwEOTaw9J9UXtcf/Gg0SX6
         HIxoT2Vws60pvqntkQuUzy+T8j8Cb4tUCmX5DB+9lkulRfHpQmwY6HtRdpDkudrpwkfO
         1FqFDRN+HFt8f2kAau9SL5N3SNuqTb00oT1BbS4OJo1cmufWLA1IWF1pwxPepSb37YyD
         QoUf3bEXO5h6rLmtIy/1EAWjESvUQoy1R/+7ILr1inYn21869Y7xphDJDAiYukrhmPLv
         eXmw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=gI6pNfaf;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=S6pRLCMKUia381ndHyqhecE+fQ0pdBHWtuKeRyYvuOI=;
        b=QKfr1ms7FZ3iINo6m1oz6L/Ke7Pff2dsh9vb/MT9uTi7zgORufbjxkpmqLSNSKpXDO
         NH42T6bHtTmWqQQP0l8nQBy9bgH0KzSXvV+MkQAFWkGoXKgTnLG2YLQIL+ONYRw3ScqC
         2jMv7IQOp13t8VOELnBsJw5Qk0x+O3ce5wcEBuXeQVanfBoFrybUpmVmVIVpyCfjUUOD
         A8nQqSg20zwvEXSAyjHPMaBNsGIyBhRV++VQX+TZstVoyV75Ne36qTYUZKMZDOQpdVcG
         eH4TDrXDnpo1Bf8e5NHGGatsFm+QShjRUPoFl6fDLAxvGIzVptgA4bxdslUSRzP3Ee9O
         EEGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=S6pRLCMKUia381ndHyqhecE+fQ0pdBHWtuKeRyYvuOI=;
        b=jOEZvjaXK1QUdEVa7OEtn1QNlLWQHduOSJHARbZC76+Qt0StkMOKuRcsrSrWOE0k2R
         XdS38ECwnDPXijbFXhJQxZcdffCJ8K3iLZoSRSTWhNyBmeBklUomtAhFcgjDDqEw77Gh
         Sb9DdU76JgeYEbBTwEKcLzbzLA7HtEFLtgn1kwXczO3Szs1mUJUqugKZe6czbPonYzS+
         H9a/OJf1bRJazEEMFwMRZGQrLGhSkicjxoVNpn3yCluB532t+ulYCPxjzj5MCuRLWAJt
         v6YwBsxH5gAakkukOkQcVLTD6ixqDpdh7YMZLEss9KBJ8hYVXzfAFR03SLlU+ctqyjCN
         PlxQ==
X-Gm-Message-State: APjAAAUnYYQ/7L6B1hs6uPsJOPmEDP+BNN9xzkjCwsi7j/SulmnRwtu6
	J7gUEh1HcuXghUCXDdwRbOU=
X-Google-Smtp-Source: APXvYqwNTE81cQGt+dguMtZaXTUAvC04IOsWkCpdxdrZVVby64ChuOnFtrjKcAFKIxjXTm2qmTbwHw==
X-Received: by 2002:a62:cdc3:: with SMTP id o186mr8117826pfg.168.1565164590384;
        Wed, 07 Aug 2019 00:56:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:34e:: with SMTP id 75ls18119099pgd.11.gmail; Wed, 07 Aug
 2019 00:56:29 -0700 (PDT)
X-Received: by 2002:aa7:92cb:: with SMTP id k11mr8158303pfa.126.1565164589791;
        Wed, 07 Aug 2019 00:56:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565164589; cv=none;
        d=google.com; s=arc-20160816;
        b=oAfZZhyIu5s7yNXt/HkJuEpzQBDqk2aGRVTsyDjqb9Sz3QIQoHrrtfojh4rsp0SADU
         D6hvn8dun58xqF9MSGkkSYzKdF2TLY9jxHcBJf4RA7ma9Ap+V6btng8wsBHpZexEMBon
         hR3O1/AaBYMxFVpLAvkB33MeWrHtshlYIUim3VeIQzajhDQtWzDPy+2aSSyCqUHS7DX/
         7r8eDfbq9b/ZXkCmiUD8QSp2kr66lZyc4tzUrsCsHwhKo/+Fp3grthHSXk8WlhkySEcF
         MUYs/AL/NuL3rEi8DqPblU6g1fBTG+jkWFaTFbQlFFa0ceuGemY6dbv2yF60iAyfAkyT
         IjTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=7b9HMoH88r05MoR7WiD4CAkTz/pnHmA+nqRlo7j8iMI=;
        b=HcZdVhJntcWx7QHnC5TAXx0zxebSURmiIQ5IHMcBcIpp0HRXe/DMgM3Of+PRuzSCOJ
         b9JcTsMQD1KIKU+8HxYwKm9EbjOsk7Y0hE0JCugpZEmf/vDCgGKJTTM4xz+McMI0jE2z
         R04rIMG8LxtkLvenoIMDgvtCidJKzKZcVRwhwR1u/UmHrjETtIXpBZK7i6mtFgh/DKrp
         P2uzBch+3S1P4568ujQ8U50z2t/1AG5UpysblgahoaM5RyxXHLf3DQ+oOcXcC6N2J+bh
         LSgoePAB8MxZ2sE1ySoJLICBr3FqvcjBJNTVlWyRE/drqG81yMHiozEjPmIagKhTfVd+
         6Rvw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=gI6pNfaf;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id ck6si3030737plb.4.2019.08.07.00.56.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Aug 2019 00:56:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x777uT8w076608;
	Wed, 7 Aug 2019 02:56:29 -0500
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x777uSgd087173
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Aug 2019 02:56:28 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 02:56:28 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 7 Aug 2019 02:56:28 -0500
Received: from uda0131933.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x777uBmY128703;
	Wed, 7 Aug 2019 02:56:26 -0500
From: "'Lokesh Vutla' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: Jan Kiszka <jan.kiszka@siemens.com>,
        Jailhouse
	<jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Tero Kristo
	<t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        Nikhil Devshatwar
	<nikhil.nd@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v5 6/6] arm64: iommu: smmu-v3: Add support for stage 1 translations
Date: Wed, 7 Aug 2019 13:25:30 +0530
Message-ID: <20190807075530.30444-7-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190807075530.30444-1-lokeshvutla@ti.com>
References: <20190801112648.6569-1-lokeshvutla@ti.com>
 <20190807075530.30444-1-lokeshvutla@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: lokeshvutla@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=gI6pNfaf;       spf=pass
 (google.com: domain of lokeshvutla@ti.com designates 198.47.19.141 as
 permitted sender) smtp.mailfrom=lokeshvutla@ti.com;       dmarc=pass
 (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Lokesh Vutla <lokeshvutla@ti.com>
Reply-To: Lokesh Vutla <lokeshvutla@ti.com>
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

From: Pratyush Yadav <p-yadav1@ti.com>

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
Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 hypervisor/arch/arm-common/include/asm/cell.h |   4 +
 .../arch/arm-common/include/asm/iommu.h       |   4 +
 hypervisor/arch/arm-common/iommu.c            |   3 +
 hypervisor/arch/arm64/smmu-v3.c               | 871 ++++++++++++++++++
 4 files changed, 882 insertions(+)

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
index 9f3e8790..98f99ea6 100644
--- a/hypervisor/arch/arm-common/include/asm/iommu.h
+++ b/hypervisor/arch/arm-common/include/asm/iommu.h
@@ -23,6 +23,10 @@
 	     (counter) < (config)->num_stream_ids;			       \
 	     (sid) = (jailhouse_cell_stream_ids(config)[++(counter)]))
 
+#ifdef CONFIG_SMMUV3_STAGE1
+void arm_smmuv3_iommu_config_commit(struct cell *cell);
+#endif
+
 unsigned int iommu_count_units(void);
 int iommu_map_memory_region(struct cell *cell,
 			    const struct jailhouse_memory *mem);
diff --git a/hypervisor/arch/arm-common/iommu.c b/hypervisor/arch/arm-common/iommu.c
index f3fe56b8..d6c21f9d 100644
--- a/hypervisor/arch/arm-common/iommu.c
+++ b/hypervisor/arch/arm-common/iommu.c
@@ -38,4 +38,7 @@ int iommu_unmap_memory_region(struct cell *cell,
 
 void iommu_config_commit(struct cell *cell)
 {
+#ifdef CONFIG_SMMUV3_STAGE1
+	arm_smmuv3_iommu_config_commit(cell);
+#endif /* CONFIG_SMMUV3_STAGE1 */
 }
diff --git a/hypervisor/arch/arm64/smmu-v3.c b/hypervisor/arch/arm64/smmu-v3.c
index dd33bda2..d5d1afaf 100644
--- a/hypervisor/arch/arm64/smmu-v3.c
+++ b/hypervisor/arch/arm64/smmu-v3.c
@@ -352,6 +352,30 @@ struct arm_smmu_strtab_cfg {
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
@@ -362,6 +386,10 @@ struct arm_smmu_device {
 	struct arm_smmu_strtab_cfg	strtab_cfg;
 } smmu[JAILHOUSE_MAX_IOMMU_UNITS];
 
+#ifdef CONFIG_SMMUV3_STAGE1
+static struct arm_smmu_state state_dump[JAILHOUSE_MAX_IOMMU_UNITS];
+#endif
+
 /* Low-level queue manipulation functions */
 static bool queue_full(struct arm_smmu_queue *q)
 {
@@ -574,6 +602,9 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_device *smmu, u32 sid,
 {
 	struct paging_structures *pg_structs = &this_cell()->arch.mm;
 	u64 val, vttbr;
+#ifdef CONFIG_SMMUV3_STAGE1
+	u64 mask;
+#endif
 
 	val = 0;
 
@@ -591,6 +622,23 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_device *smmu, u32 sid,
 		return;
 	}
 
+#ifdef CONFIG_SMMUV3_STAGE1
+	dst[0] = 0;
+	dsb(ishst);
+	arm_smmu_sync_ste_for_sid(smmu, sid);
+
+	if (guest_ste != NULL) {
+		if (FIELD_GET(STRTAB_STE_0_S1CDMAX, guest_ste[0]) != 0)
+			printk("WARN: SMMU sub-streams not supported\n");
+
+		val = guest_ste[0];
+
+		mask = STRTAB_STE_1_S1COR | STRTAB_STE_1_S1DSS |
+		       STRTAB_STE_1_S1CSH | STRTAB_STE_1_S1CIR;
+		dst[1] = guest_ste[1] & mask;
+	}
+#endif /* CONFIG_SMMUV3_STAGE1 */
+
 	dst[2] = FIELD_PREP(STRTAB_STE_2_S2VMID, vmid) |
 		 FIELD_PREP(STRTAB_STE_2_VTCR, VTCR_CELL) |
 		 STRTAB_STE_2_S2PTW | STRTAB_STE_2_S2AA64 |
@@ -1038,11 +1086,743 @@ static void arm_smmu_uninit_ste(struct arm_smmu_device *smmu, u32 sid, u32 vmid)
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
+	for_each_stream_id(config_sid, cell->config, i)
+		if (config_sid == sid)
+			return true;
+
+	panic_printk("FATAL: Cell %u trying to access stream ID %u. Access denied.\n",
+		     cell->config->id, sid);
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
+		if (step_page == NULL)
+			return trace_error(-ENOMEM);
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
+		if (span == 0)
+			return -ENOENT;
+
+		if (span > split + 1 ||
+		    ste_addr > (l2ptr + num_l2_ents * STRTAB_STE_SIZE)) {
+			return -EINVAL;
+		}
+
+		step_page = paging_get_guest_pages(NULL, (ste_addr & PAGE_MASK),
+						   2, PAGE_DEFAULT_FLAGS);
+		if (step_page == NULL)
+			return trace_error(-ENOMEM);
+
+		step = step_page + PAGE_OFFSET(ste_addr);
+	} else {
+		u32 num_stes, idx;
+
+		num_stes = 1 << log2size;
+
+		if (sid >= num_stes)
+			return -EINVAL;
+
+		idx = sid * STRTAB_STE_SIZE;
+		ste_addr = strtab_base + idx;
+
+		step_page = paging_get_guest_pages(NULL, (ste_addr & PAGE_MASK),
+						   2, PAGE_DEFAULT_FLAGS);
+		if (step_page == NULL)
+			return trace_error(-ENOMEM);
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
+	if (!arm_smmu_cell_can_access_sid(cell, sid))
+		return trace_error(-EPERM);
+
+	ret = arm_smmu_get_step_from_guest(state, sid, guest_ste);
+	if (ret)
+		return ret;
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
+	u32 sid, cons, shift, idx;
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
+	if (cmdq_base_page == NULL)
+		return trace_error(-ENOMEM);
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
+
+		if (!arm_smmu_cell_can_access_sid(cell, sid))
+			return trace_error(-EPERM);
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
+		if (state->idr[1] & IDR1_QUEUES_PRESET)
+			/* Read only. */
+			return MMIO_ERROR;
+		state->cmdq_base = mmio->value;
+		break;
+	case ARM_SMMU_EVTQ_BASE:
+		if (state->idr[1] & IDR1_QUEUES_PRESET)
+			/* Read only. */
+			return MMIO_ERROR;
+		state->evtq_base = mmio->value;
+		break;
+	case ARM_SMMU_STRTAB_BASE:
+		if (state->idr[1] & IDR1_TABLES_PRESET)
+			/* This register is read-only in preset mode. */
+			return MMIO_ERROR;
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
+		if (ret)
+			continue;
+
+		if (guest_ste[0] & STRTAB_STE_0_V) {
+			ret = arm_smmu_cfgi_ste(state, sid);
+			if (ret)
+				continue;
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
 
 	if (!iommu_count_units())
 		return 0;
@@ -1057,6 +1837,26 @@ static int arm_smmuv3_cell_init(struct cell *cell)
 			if (ret)
 				return ret;
 		}
+
+#ifdef CONFIG_SMMUV3_STAGE1
+		/* Only initialize if stage 1 translations are supported. */
+		if (smmu[i].features & IDR0_S1P) {
+			if (cell->arch.smmu_states == NULL) {
+				cell->arch.smmu_states = page_alloc(&mem_pool,
+					PAGES(sizeof(*cell->arch.smmu_states) *
+					JAILHOUSE_MAX_IOMMU_UNITS));
+				if (cell->arch.smmu_states == NULL)
+					return trace_error(-ENOMEM);
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
@@ -1086,6 +1886,14 @@ static void arm_smmuv3_cell_exit(struct cell *cell)
 		}
 	}
 
+#ifdef CONFIG_SMMUV3_STAGE1
+	mmio_region_unregister(cell, iommu->base);
+
+	page_free(&mem_pool, cell->arch.smmu_states,
+		  PAGES(sizeof(*cell->arch.smmu_states) *
+		  JAILHOUSE_MAX_IOMMU_UNITS));
+#endif
+
 	cmd.opcode	= CMDQ_OP_TLBI_S12_VMALL;
 	cmd.tlbi.vmid	= cell->config->id;
 	arm_smmu_cmdq_issue_cmd(smmu, &cmd);
@@ -1114,6 +1922,16 @@ static int arm_smmuv3_init(void)
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
@@ -1123,6 +1941,59 @@ static int arm_smmuv3_init(void)
 	return arm_smmuv3_cell_init(&root_cell);
 }
 
+#ifdef CONFIG_SMMUV3_STAGE1
+void arm_smmuv3_iommu_config_commit(struct cell *cell)
+{
+	struct jailhouse_iommu *iommu;
+	struct arm_smmu_state *state;
+	int i;
+
+	if (cell != &root_cell)
+		return;
+
+	/*
+	 * The SMMU does not support stage 1 translations. So nothing to do
+	 * here.
+	 */
+	if (&cell->arch.smmu_states == NULL)
+		return;
+
+	iommu = &system_config->platform_info.arm.iommu_units[0];
+	for (i = 0; i < iommu_count_units(); iommu++, i++) {
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
+	return;
+}
+
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
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190807075530.30444-7-lokeshvutla%40ti.com.
