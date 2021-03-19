Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBVFI2GBAMGQEKHWH22Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id DF01F3416B7
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Mar 2021 08:35:48 +0100 (CET)
Received: by mail-ed1-x537.google.com with SMTP id p6sf22309683edq.21
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Mar 2021 00:35:48 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616139348; cv=pass;
        d=google.com; s=arc-20160816;
        b=tpnz2pvNcDn+Uwv58aHLLYMz5xPiRKw8XED17h7S1uRXDbcYePuo1o67V3UoenPl3e
         P4WlgCEFtZ8W5PhqOMUgYxakYqpcqglIaaBylqmEsJh2qTE7khxOYsrVSqMac3ZLB0no
         ozqpFhb0h4T3nsyHenzuvDzI1uLMVmZLUkGneiYtgv1eFlvmzlE2Bl1bpSBedTTCLCXD
         sfDeJWTK29iNV6nzUlR0gs8Y/BDw+Omkq/zzavqhV35JrZV57raWPE3ta1Z6hJwovbsf
         /deBzIjzfi4SHckq8NXCEZ2D2gr98hkeNTZPQ6toaL1JAlRp27+EF5nr+jab7hPjSNkd
         TH1Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=dyLEWHUddLOFk9j9DykdH+MD0zVmsn41GgwsN0JhD0U=;
        b=WDuqNVm8A+mJ6BGmc1GyJgkwr09/DQDKZsKz9CkGNxaarsxlo3OtjfE/dIu/O67sHN
         E6vUnbJKE4uCUta5+voA1If9ympdtLG192EaS6J2CF38nglCaNrLndEOEDliOsu7VDGT
         ZnunHXPLvZjChvy73k+pWJOOjSJ+mquKytdkCoyRjLaKBKMP80p9201qXznzKhspd9IA
         2FswzvMsXIDKoiF39ItM2YnKdOpOP0NcODWLe/DZAkY/vbef/n9nix7vAXeAUVA7wduo
         BBBsOZoJvHv6qNJONy+0Rg5QQ6SE7w3WINbVXb009G8ELKppaO873pMpdHd52yxG2sAZ
         CxlQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dyLEWHUddLOFk9j9DykdH+MD0zVmsn41GgwsN0JhD0U=;
        b=LSKgE77SrJdLmJg7lEutZFAqYVuM59UeAIR/vU1tpw8JVlL5hG+VsYj9syw6gnvBKy
         W8SMlS7bAP/4sA/H8YeQ68VWrfBkPQWW7kF58h9ye2C710wr+cRQyC7wj8U8jKNuzJC+
         r2/ILOEgsECrCUhg8SNhD03c3DqWojDHWM6Kh+1szVIPlb1ICURE4yNlN95SbGbHM6bx
         vM8wDWHcwK9n+SEQGMjqA1y5sXG/+IGZYpCLFmTGlkFzZBJ7NiL+a3l5nt4kS36+QDfb
         EAkvLWctIXdJeW6tM4EfggZZKdxZ+gcrzmgZy6lm+1fsR39bCloQkjP/rk+ybDLfLo22
         hAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dyLEWHUddLOFk9j9DykdH+MD0zVmsn41GgwsN0JhD0U=;
        b=jY54CVpJvbTgxO3N49QrAdUG118TJfBtERMGLZrAVVKVDZiakzr2xOG/X89K1H+7tk
         OPtpL9MwxuA8gJ/AM+uMB1zQDaWKC++m/GIrF6nAafLyFu6x8jJfkp3UP2LcaNIi4W1D
         pUQRD1oFs8HlhlSuxl7VhruwFoP8SFot9ZoQU7m8CfPWPo3qJeAdyB0UN3qJKtGtdZrQ
         NdTuKZdZM7fGmOYaoTTNui6KWqvfJUudv+/eUzmv6O+NLO5joZe7NyTaB15w3LJ7Zbr8
         sQODzREYdoPZgdBf2qUAHgnCOABuaOfiikPOAon7gLEbVhu/HQ4KcqjZQ7dqAF7ixC/c
         T4IQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530TJ/Sgi3ArbEZNRh8J8zEdNCM3E80R79myWSsY/K/1ObcXJkh2
	mSOHFF5OThEqFt7pIZi4QPY=
X-Google-Smtp-Source: ABdhPJzHPCqTQobqDF8fX8p8t5RP6m0jUnpgTJdN2KgFeILy9+nR+er7qRinTbu6WkYCEXGEEjxByQ==
X-Received: by 2002:aa7:d687:: with SMTP id d7mr7875593edr.118.1616139348647;
        Fri, 19 Mar 2021 00:35:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:50cd:: with SMTP id h13ls4299488edb.3.gmail; Fri,
 19 Mar 2021 00:35:47 -0700 (PDT)
X-Received: by 2002:a05:6402:438f:: with SMTP id o15mr8059550edc.123.1616139347654;
        Fri, 19 Mar 2021 00:35:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616139347; cv=none;
        d=google.com; s=arc-20160816;
        b=KyWfuZ3CRTCI91FI+ABDJh5UgGVGgVnJA5vQJfskgyeV4DStz3GoeNE5DR17xwSHT4
         gfv+wyRR7KtgcS+qziwRvV+sbU5Jjn8swrCQml1fBj3MnZS6DWMBtSr/Xr04jLZJ4iVL
         aBepk7228/IEAOlD++Ni/9dDih4YXmJlErK2tPZUbbMjG/IN+jGqeYiQbso5A+bjOF1u
         BmNhrOR4YXsm2RfkNH8y4qXrVlJCyNJLscIOWI9qNkMlEHqZSomZ8DkBdWeJud8XGR4Y
         ywMNpocsONWIX6adt6fs4Rt9Rfnw1sio3XEObp5L/aJ2XcfS8XvheFUopZCiHswPHH5r
         v6Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=UpYGCqmt9KgZBmXA9SVZh9lYTKHzwXtWRXEDHF+r4jE=;
        b=kdJmBjwfNfWffrZq5PZOYbywHIyimBLPNrT6xHB0VXQ/3aKJSAWFakV2XvaphJVtLz
         tI7OB69HvNQCZ5Qk4bQ0ljOZt9GwGSgNDarqhEfz+hWGyMxnD3DwJAvu2eKIyx1T8enJ
         rVYyDH1fEiBUePaTTBeXsXnxpc98nkvvYOrg4DTISSvM9bCmEzJQRctrwXEgjbLAMZby
         kE725GXKMZdO/n7w6CJr0jDGzxQ1nD38T/5c0MtYFgfEmC1wrKVs6vA38UVF8jbxjuqb
         P0JHHa0gjS3Zp3TphS/KBBXkg/JO8HMUdo338JKXJq0gtotg/eFn9eyThnqDFxh4rvD7
         c7CQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id sd27si129779ejb.1.2021.03.19.00.35.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Mar 2021 00:35:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 12J7ZlND019621
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Mar 2021 08:35:47 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.41.130])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12J7UjC4004384;
	Fri, 19 Mar 2021 08:30:47 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Alice Guo <alice.guo@nxp.com>
Subject: [PATCH 06/11] arm-common: Pass through GIC CPU interface in SDEI mode
Date: Fri, 19 Mar 2021 08:30:40 +0100
Message-Id: <4d41e47391385220c796aba6728382a5a37485f0.1616139045.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1616139045.git.jan.kiszka@siemens.com>
References: <cover.1616139045.git.jan.kiszka@siemens.com>
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

When SDEI is used for management interrupts, we can give the gicc
completely to the cell. This requires to skip gic-v2 and gic-v3 per-cpu
initializations and to map the physical gicc-v2 into the cell or to not
enable ICH_HCR_EN in case of gic-v3. Furthermore, injected interrupts
now have to be sent as physical SGI to the target, rather than being
queued for the virtual interface.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm-common/gic-v2.c  | 16 +++++++++++-----
 hypervisor/arch/arm-common/gic-v3.c  |  6 +++++-
 hypervisor/arch/arm-common/irqchip.c |  5 +++++
 3 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/hypervisor/arch/arm-common/gic-v2.c b/hypervisor/arch/arm-common/gic-v2.c
index 6a86ca8c..31371de9 100644
--- a/hypervisor/arch/arm-common/gic-v2.c
+++ b/hypervisor/arch/arm-common/gic-v2.c
@@ -15,6 +15,7 @@
 #include <asm/gic.h>
 #include <asm/gic_v2.h>
 #include <asm/irqchip.h>
+#include <asm/smccc.h>
 
 /* The GICv2 interface numbering does not necessarily match the logical map */
 static u8 gicv2_target_cpu_map[8];
@@ -120,6 +121,9 @@ static int gicv2_cpu_init(struct per_cpu *cpu_data)
 	if (gicv2_target_cpu_map[cpu_data->public.cpu_id] == 0)
 		return trace_error(-ENODEV);
 
+	if (sdei_available)
+		return 0;
+
 	/* Ensure all IPIs and the maintenance PPI are enabled. */
 	mmio_write32(gicd_base + GICD_ISENABLER, 0x0000ffff | (1 << mnt_irq));
 
@@ -225,17 +229,19 @@ static void gicv2_eoi_irq(u32 irq_id, bool deactivate)
 static int gicv2_cell_init(struct cell *cell)
 {
 	/*
-	 * Let the guest access the virtual CPU interface instead of the
-	 * physical one.
+	 * Without SDEI management interrrupts, let the guest access the
+	 * virtual CPU interface instead of the physical.
 	 *
 	 * WARN: some SoCs (EXYNOS4) use a modified GIC which doesn't have any
 	 * banked CPU interface, so we should map per-CPU physical addresses
 	 * here.
 	 * As for now, none of them seem to have virtualization extensions.
 	 */
-	return paging_create(&cell->arch.mm,
-			     system_config->platform_info.arm.gicv_base,
-			     GICC_SIZE,
+	u64 gic_source = sdei_available ?
+		system_config->platform_info.arm.gicc_base :
+		system_config->platform_info.arm.gicv_base;
+
+	return paging_create(&cell->arch.mm, gic_source, GICC_SIZE,
 			     system_config->platform_info.arm.gicc_base,
 			     (PTE_FLAG_VALID | PTE_ACCESS_FLAG |
 			      S2_PTE_ACCESS_RW | S2_PTE_FLAG_DEVICE),
diff --git a/hypervisor/arch/arm-common/gic-v3.c b/hypervisor/arch/arm-common/gic-v3.c
index 126f4524..4ebb2357 100644
--- a/hypervisor/arch/arm-common/gic-v3.c
+++ b/hypervisor/arch/arm-common/gic-v3.c
@@ -19,6 +19,7 @@
 #include <asm/gic.h>
 #include <asm/gic_v3.h>
 #include <asm/irqchip.h>
+#include <asm/smccc.h>
 #include <asm/sysregs.h>
 #include <asm/traps.h>
 
@@ -244,6 +245,9 @@ static int gicv3_cpu_init(struct per_cpu *cpu_data)
 	if ((cpu_data->public.mpidr & MPIDR_AFF0_MASK) >= 16)
 		return trace_error(-EIO);
 
+	if (sdei_available)
+		return 0;
+
 	/* Ensure all IPIs and the maintenance PPI are enabled. */
 	gicr = redist_base + GICR_SGI_BASE;
 	mmio_write32(gicr + GICR_ISENABLER, 0x0000ffff | (1 << mnt_irq));
@@ -303,7 +307,7 @@ static int gicv3_cpu_shutdown(struct public_per_cpu *cpu_public)
 {
 	u32 ich_vmcr, icc_ctlr, cell_icc_igrpen1;
 
-	if (!cpu_public->gicr.base)
+	if (sdei_available || !cpu_public->gicr.base)
 		return -ENODEV;
 
 	arm_write_sysreg(ICH_HCR_EL2, 0);
diff --git a/hypervisor/arch/arm-common/irqchip.c b/hypervisor/arch/arm-common/irqchip.c
index da03c96a..a3245846 100644
--- a/hypervisor/arch/arm-common/irqchip.c
+++ b/hypervisor/arch/arm-common/irqchip.c
@@ -228,6 +228,11 @@ void irqchip_set_pending(struct public_per_cpu *cpu_public, u16 irq_id)
 	const u16 sender = this_cpu_id();
 	unsigned int new_tail;
 
+	if (sdei_available) {
+		irqchip_send_sgi(cpu_public->cpu_id, irq_id);
+		return;
+	}
+
 	if (local_injection && irqchip.inject_irq(irq_id, sender) != -EBUSY)
 		return;
 
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4d41e47391385220c796aba6728382a5a37485f0.1616139045.git.jan.kiszka%40siemens.com.
