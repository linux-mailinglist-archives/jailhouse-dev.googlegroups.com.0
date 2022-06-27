Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBNPB42KQMGQELDM5QZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id A32CD55BA09
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:29:25 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id t13-20020adfe10d000000b0021bae3def1esf1188480wrz.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:29:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656336565; cv=pass;
        d=google.com; s=arc-20160816;
        b=LpA1kb4IAr8GYdEBgSCjhSdhNc1MOGpxyMpuV9/9F4N4ochVhIQzvbuuGuj44cKDyr
         57zMQV0ns9HY4GICrfODh4BP+MEsP+6ouajABPrWLe5Fn+58UW9ilnV6yXPJuFfJZuAe
         40WgNnQpPveYmPURT6FvZ6Pvi2Qb/gL1MKtXIH6ZKridOMvT+xUQy4IJT2ctKlJ8JHn+
         kRpTYKDFyoVLFYAxFWpmWVuieUx1iMhdyhdghfPwnyN6CkBrZYYs2tSPIbE04MU7C0fu
         vGQbXskCgRNn4nOXVdYOgomEq2ngEaxK1+qZEn/JMEflpcB95592vIeYpadYIeoK979s
         34Jg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=taJChC7ykmAZH3u/JQVkjpZ+FWQLNV0my0xIA+V0zIA=;
        b=o7YKDIL0Oqf1QD8LaNYeph8Y2YpJ3lmSQD3qrTux9cGP7r7soNckA0vA88Jl1ukH22
         Yasxh1k6VxJTMF5KeW9AZ9fO/+6HRSu0n4Eyst+Ev01LUlk20K6lMX6XeeuhBXqS0duz
         NOe3zS9/lZhTlNF9Y6n0pP4HczxVCtaa/Uiq8bpeKzv6DeYDu43GUPmbGRtzRIFyDiwO
         CIhXIex+2re+z3vmRqpGipuBHzPIwNPtQNvDc0rAdbMW28w4UY+6USKrVYDh/MIP8+ud
         iWn56cUkUTSzZvIllLMnpaiWSPtKRz/W/t7qlvr/MXDdVfnl9L2TTtK+kmNQa1e9Gohc
         XsbA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=V34JgUfX;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=taJChC7ykmAZH3u/JQVkjpZ+FWQLNV0my0xIA+V0zIA=;
        b=pfkEKJ0nVTvWq1m6ntgtQ817DqNStdkTSQ2hq272CL1kEUa5IL+kuTlX+ZsLLMSkCl
         ZUny0ZbFcGbzcRE9VlBCIzNuBAxah3JXOk3730QKho0A/xBVd8rXCeEZEFV2vQez39jO
         QAYMbFJURGQpIAnPTj9QCk+IpjC/P15H9mvwUaIp7fdol/rG5rNmXZI6qTz3N7YHWBI9
         gdYhjYnGaB0ccfM4ODMemBSClyw4TM/tdh5GELriTYfVd7f2eKVQI3ZMuoffRiQtvTDB
         NWExgdv8OVLBoslowoLXT2ALvyfdMpy2z8S88+KSrwQEwoyl3Wdl6E9q6NbkvWryYE6k
         EqtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=taJChC7ykmAZH3u/JQVkjpZ+FWQLNV0my0xIA+V0zIA=;
        b=l+y817Yr3nbwldVvvjsT58A14/PCSOy76R8fXHj+BgOqpLhf5YWLuOngEumJt6y/B7
         ggZcZpux6EYy4mDhx/MVYU5ioZovLPPmzD5EnjudSiI5bhzNHHCpmyhRAKHjzuyXNvCt
         rNf56Xfx8WwzT9FyWcuFBhSWaxP4677gvyNm9qmvcIS5oFWN62/oj+BebmPRw2aaiKzJ
         Mhwtra7Md5eFnWPh8+0ICILTEJcRzY5YBlLbVHUVZQqSDbJbeGj2YtoAflTaEutH6fgY
         K0fOrsUS9UsYSXTFWYJCsw6NpcJIIhkQbfTt/Pqwsc1GKqutXFHS3qTrUKBUJHgH34yl
         iMZQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora8/tu0X3IG2582EKkZEeYlNMoKX605Lza7U2Ua/StEvKfAo8u1v
	RCQUXJbyUSwCIHJXtABg5Jo=
X-Google-Smtp-Source: AGRyM1s7ejUJBx1MYMoE/FJprrCD1z8a4qL75VmA/g/2UBeoSgeywDgh05Fcp/dYTvIvtktZf/MHfg==
X-Received: by 2002:a05:6000:10c5:b0:21b:9aed:47e3 with SMTP id b5-20020a05600010c500b0021b9aed47e3mr12968655wrx.570.1656336565502;
        Mon, 27 Jun 2022 06:29:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:1887:b0:218:5c3b:1a23 with SMTP id
 a7-20020a056000188700b002185c3b1a23ls5783737wri.0.gmail; Mon, 27 Jun 2022
 06:29:24 -0700 (PDT)
X-Received: by 2002:adf:d1ec:0:b0:210:2c68:a06d with SMTP id g12-20020adfd1ec000000b002102c68a06dmr12815535wrd.37.1656336564146;
        Mon, 27 Jun 2022 06:29:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656336564; cv=none;
        d=google.com; s=arc-20160816;
        b=N8hZiHlxw45qWjNPwZ/S+zO/pHuv+PjY5KabyuFfR+GBpNTvyt8YXFznc1ZPLTAoTK
         zDY7zRPOi6oZsOI41ZnMek6+qd0BLxPWCAA9d6Z11wdjKtfTBPkhh+zQ4pxVOxBqrlL8
         ljRUBTUmVTZALoaZLxPsbgwQoIy+RQZJGEBOnQ3DJ2zls+MhVnfjFfK3qW/mJzBfWQCz
         S/qHTwHQiharlPJztJwdBXPsovsrZbvCyYIvzTpdVFyq78qkCvwo2arkw6tCxsfLHZDE
         LPpG5sDajAoKiWtZyIEMpAGgKs2H3GaKnEc7dbMgkP9JcBgMh7W9f10fz/oEWZsbXvOS
         WSFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/5dlSOppwQylC79zN5wcV4hJH3Kq8DKWmzlgCU3nbew=;
        b=T57Dr1Y3vDC8GgiHqHdpYGk8TnKLv1Bsl4dElJ+ZR0/S2yRdw/ezhlhC+YTcNmqpgg
         h6bF2+ohKcIL0ftRof3FLG9pDUkWvX0B717OzMH0mMEfh5jVU8ESKeTrhKoRpDsLi3wH
         D58R0pquuUcDFN/IsS6VNA8M8AcIsZZstmlsMBl8cwolbk5gk8Y295VP20+/5UgrXmbF
         eeCMbJM9eookaxy5sWMmrAlZG3drbUEGwXzAW8kR/yDOXvwQRJZE1pHM2VA/UsGZkWDi
         cbwtbB93w9eYcTbWYqnVuGunjY9rSnRfhK7o3y96yO5QlgLkCs0C9QryI6wyLUwR1XKD
         i6rA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=V34JgUfX;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id c2-20020a05600c0a4200b0039c6559434bsi496199wmq.1.2022.06.27.06.29.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:29:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4LWpVC6JGMzy0y;
	Mon, 27 Jun 2022 15:29:23 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:29:23 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 40/42] core: riscv: plic: introduce vIRQ support
Date: Mon, 27 Jun 2022 15:29:03 +0200
Message-ID: <20220627132905.4338-41-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
References: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=V34JgUfX;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

For demonstration purposes only.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/include/asm/cell.h    |   1 +
 hypervisor/arch/riscv/include/asm/ivshmem.h |   1 +
 hypervisor/arch/riscv/include/asm/percpu.h  |   4 +-
 hypervisor/arch/riscv/include/asm/plic.h    |   7 +
 hypervisor/arch/riscv/ivshmem.c             |  36 ++++-
 hypervisor/arch/riscv/plic.c                | 138 +++++++++++++++++++-
 hypervisor/arch/riscv/traps.c               |   1 +
 7 files changed, 181 insertions(+), 7 deletions(-)

diff --git a/hypervisor/arch/riscv/include/asm/cell.h b/hypervisor/arch/riscv/include/asm/cell.h
index 58412414..fcfdaa32 100644
--- a/hypervisor/arch/riscv/include/asm/cell.h
+++ b/hypervisor/arch/riscv/include/asm/cell.h
@@ -23,6 +23,7 @@ struct arch_cell {
 	struct paging_structures mm;
 
 	u32 irq_bitmap[PLIC_MAX_IRQS / (sizeof(u32) * 8)];
+	u32 virq_present_bitmap[PLIC_MAX_IRQS / (sizeof(u32) * 8)];
 };
 
 #endif /* !_JAILHOUSE_ASM_CELL_H */
diff --git a/hypervisor/arch/riscv/include/asm/ivshmem.h b/hypervisor/arch/riscv/include/asm/ivshmem.h
index 03251590..8b193947 100644
--- a/hypervisor/arch/riscv/include/asm/ivshmem.h
+++ b/hypervisor/arch/riscv/include/asm/ivshmem.h
@@ -11,4 +11,5 @@
  */
 
 struct arch_ivshmem_irq_cache {
+	u16 id[IVSHMEM_MSIX_VECTORS];
 };
diff --git a/hypervisor/arch/riscv/include/asm/percpu.h b/hypervisor/arch/riscv/include/asm/percpu.h
index 4eda15b6..bcafff51 100644
--- a/hypervisor/arch/riscv/include/asm/percpu.h
+++ b/hypervisor/arch/riscv/include/asm/percpu.h
@@ -43,6 +43,8 @@ enum sbi_hart_state {
 	} hsm;								\
 	bool wait_for_power_on; 					\
 	bool reset;							\
-	bool park;
+	bool park;							\
+        u32 virq_enabled_bitmap[PLIC_MAX_IRQS / (sizeof(u32) * 8)];	\
+        u32 virq_pending_bitmap[PLIC_MAX_IRQS / (sizeof(u32) * 8)];
 
 #define ARCH_PERCPU_FIELDS
diff --git a/hypervisor/arch/riscv/include/asm/plic.h b/hypervisor/arch/riscv/include/asm/plic.h
index c5414e9e..016e9b99 100644
--- a/hypervisor/arch/riscv/include/asm/plic.h
+++ b/hypervisor/arch/riscv/include/asm/plic.h
@@ -18,4 +18,11 @@
 extern int plic_set_pending(void);
 bool irqchip_irq_in_cell(struct cell *cell, unsigned int irq);
 
+void plic_register_virq(unsigned int irq);
+void plic_unregister_virq(unsigned int irq);
+
+void plic_send_virq(struct cell *cell, unsigned int irq);
+
+void plic_process_pending_virqs(void);
+
 #endif /* _PLIC_H */
diff --git a/hypervisor/arch/riscv/ivshmem.c b/hypervisor/arch/riscv/ivshmem.c
index e5dd7973..3c645123 100644
--- a/hypervisor/arch/riscv/ivshmem.c
+++ b/hypervisor/arch/riscv/ivshmem.c
@@ -1,21 +1,35 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2020
+ * Copyright (c) Siemens AG, 2016-2019
+ * Copyright (c) OTH Regensburg, 2022
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
  */
 
-#include <jailhouse/entry.h>
 #include <jailhouse/ivshmem.h>
+#include <jailhouse/cell.h>
+#include <asm/processor.h>
 
 void arch_ivshmem_trigger_interrupt(struct ivshmem_endpoint *ive,
 				    unsigned int vector)
 {
+	unsigned int irq_id = ive->irq_cache.id[vector];
+
+	if (irq_id) {
+		/*
+		 * Ensure that all data written by the sending guest is visible
+		 * to the target before triggering the interrupt.
+		 */
+		memory_barrier();
+
+		plic_send_virq(ive->device->cell, irq_id);
+	}
 }
 
 int arch_ivshmem_update_msix(struct ivshmem_endpoint *ive, unsigned int vector,
@@ -26,4 +40,22 @@ int arch_ivshmem_update_msix(struct ivshmem_endpoint *ive, unsigned int vector,
 
 void arch_ivshmem_update_intx(struct ivshmem_endpoint *ive, bool enabled)
 {
+	u8 pin = ive->cspace[PCI_CFG_INT/4] >> 8;
+	struct pci_device *device = ive->device;
+	unsigned int virq;
+
+	/*
+	 * Lock used as barrier, ensuring all interrupts triggered after return
+	 * use the new setting.
+	 */
+	virq = device->cell->config->vpci_irq_base + pin - 1;
+	spin_lock(&ive->irq_lock);
+	if (enabled) {
+		ive->irq_cache.id[0] = virq;
+		plic_register_virq(virq);
+	} else {
+		ive->irq_cache.id[0] = 0;
+		plic_unregister_virq(virq);
+	}
+	spin_unlock(&ive->irq_lock);
 }
diff --git a/hypervisor/arch/riscv/plic.c b/hypervisor/arch/riscv/plic.c
index 84f95c0b..1b9e0c3e 100644
--- a/hypervisor/arch/riscv/plic.c
+++ b/hypervisor/arch/riscv/plic.c
@@ -193,6 +193,11 @@ inline bool irqchip_irq_in_cell(struct cell *cell, unsigned int irq)
 	return irq_bitmap_test(cell->arch.irq_bitmap, irq);
 }
 
+static inline bool irqchip_virq_in_cell(struct cell *cell, unsigned int irq)
+{
+	return irq_bitmap_test(cell->arch.virq_present_bitmap, irq);
+}
+
 int plic_set_pending(void)
 {
 	int my_context;
@@ -239,9 +244,38 @@ static inline void plic_passthru(const struct mmio_access *access)
 	plic_write(access->address, access->value);
 }
 
+static bool plic_inject_pending_virqs(void)
+{
+	struct public_per_cpu *pcpu = this_cpu_public();
+	u32 idx, irq = 0;
+
+	for (idx = 0; idx < ARRAY_SIZE(pcpu->virq_pending_bitmap); idx++) {
+		irq = pcpu->virq_pending_bitmap[idx];
+		if (!irq)
+			continue;
+
+		/*
+		 * FIXME: For the moment, simply inject the first pending IRQ.
+		 * Later, we need to prioritise those IRQs. Haha. Per call of
+		 * this routine, we can only inject ONE single IRQ. That's not
+		 * an issue, as the guest will trap again after acknowledging
+		 * the last irq. So there will be no misses of pending IRQs.
+		 */
+
+		irq = ffsl(irq) + idx * 32;
+
+		pending[pcpu->phys_id] = irq;
+		irq_bitmap_clear(pcpu->virq_pending_bitmap, irq);
+		return true;
+	}
+
+	return false;
+}
+
 static inline enum mmio_result
 plic_handle_context_claim(struct mmio_access *access, unsigned long hart)
 {
+	/* clear pending bit */
 	if (!access->is_write) {
 		access->value = pending[hart];
 		return MMIO_HANDLED;
@@ -254,7 +288,9 @@ plic_handle_context_claim(struct mmio_access *access, unsigned long hart)
 		return MMIO_ERROR;
 	}
 
-	plic_write(access->address, access->value);
+	/* TODO: vIRQ could have been disabled before acknowledgement */
+	if (!irq_bitmap_test(this_cell()->arch.virq_present_bitmap, access->value))
+		plic_write(access->address, access->value);
 
 	/* Check if there's another physical IRQ pending */
 	/* TODO: This is where we would need to prioritise vIRQs */
@@ -262,6 +298,11 @@ plic_handle_context_claim(struct mmio_access *access, unsigned long hart)
 	if (pending[hart])
 		return MMIO_HANDLED;
 
+	/* TODO: vIRQ has the lowest prio at the moment */
+	plic_inject_pending_virqs();
+	if (pending[hart])
+		return MMIO_HANDLED;
+
 	guest_clear_ext();
 	ext_enable();
 
@@ -322,6 +363,12 @@ static enum mmio_result plic_handle_prio(struct mmio_access *access)
 
 	irq = access->address / REG_SZ;
 
+	if (irqchip_virq_in_cell(this_cell(), irq)) {
+		// TODO: Allow priorities
+		printk("PLIC: virq priorities not supported!\n");
+		return MMIO_HANDLED;
+	}
+
 	if (!irqchip_irq_in_cell(this_cell(), irq))
 		return MMIO_ERROR;
 
@@ -338,8 +385,8 @@ static enum mmio_result plic_handle_prio(struct mmio_access *access)
 
 static enum mmio_result plic_handle_enable(struct mmio_access *access)
 {
+	u32 *virq_enabled, irq_allowed_bitmap, virq_allowed_bitmap;
 	struct public_per_cpu *pc;
-	u32 irq_allowed_bitmap;
 	unsigned int idx, cpu;
 	short int ctx;
 
@@ -389,20 +436,28 @@ allowed:
 	 */
 	idx = ((access->address - PLIC_ENABLE_BASE) % PLIC_ENABLE_OFF)
 		* 8 / PLIC_BITS_PER_REG;
+	// TODO: Should this be locked? virq_allowed_bitmap could be changed
+	// during execution
+	virq_enabled = &pc->virq_enabled_bitmap[idx];
 
 	if (!access->is_write) {
-		access->value = plic_read(access->address);
+		access->value = plic_read(access->address) | *virq_enabled;
 		return MMIO_HANDLED;
 	}
 
 	/* write case */
 	irq_allowed_bitmap = this_cell()->arch.irq_bitmap[idx];
+	virq_allowed_bitmap = this_cell()->arch.virq_present_bitmap[idx];
 
-	if (access->value & ~irq_allowed_bitmap) {
+	if (access->value & ~(irq_allowed_bitmap | virq_allowed_bitmap)) {
 		printk("FATAL: Cell enabled non-assigned IRQ\n");
 		return MMIO_ERROR;
 	}
 
+	*virq_enabled = access->value & virq_allowed_bitmap;
+
+	/* Only forward physical IRQs to the PLIC */
+	access->value &= irq_allowed_bitmap;
 	plic_passthru(access);
 
 	return MMIO_HANDLED;
@@ -443,6 +498,14 @@ static int plic_cell_init(struct cell *cell)
 	mmio_region_register(cell, plic_phys(), plic_size(), plic_handler,
 			     cell);
 
+	/* 
+	 * TODO: Do we need that, or can we assume that this arrives already
+	 * zeroed?
+	 */
+	memset(cell->arch.irq_bitmap, 0, sizeof(cell->arch.irq_bitmap));
+	memset(cell->arch.virq_present_bitmap, 0,
+	       sizeof(cell->arch.virq_present_bitmap));
+
 	for_each_irqchip(chip, cell->config, n) {
 		/* Only support one single PLIC at the moment */
 		if (chip->address !=
@@ -573,4 +636,71 @@ static void plic_config_commit(struct cell *cell)
 	}
 }
 
+void plic_process_pending_virqs(void)
+{
+	/*
+	 * We can only inject IRQs if there's no other IRQ waiting. No problem:
+	 * If other IRQs are currently being handled, the cell must somewhen
+	 * acknowledge the interrupt. On acknowledgement, this routine is
+	 * called again, so we won't miss the IRQ.
+	 */
+	if (guest_ext_pending())
+		return;
+
+	if (!plic_inject_pending_virqs())
+		return;
+
+	ext_disable();
+	guest_inject_ext();
+}
+
+void plic_send_virq(struct cell *cell, unsigned int irq)
+{
+	struct public_per_cpu *pcpu;
+	unsigned int cpu;
+
+	//printk("PLIC: sending vIRQ %u from %s to %s\n", irq, this_cell()->config->name, cell->config->name);
+
+	if (!irq_bitmap_test(cell->arch.virq_present_bitmap, irq)) {
+		printk("vIRQ not present in destination\n");
+		return;
+	}
+
+	// Do we need to lock this section? A vIRQ could be disabled during injection
+	for_each_cpu(cpu, &cell->cpu_set) {
+		pcpu = public_per_cpu(cpu);	
+		if (irq_bitmap_test(pcpu->virq_enabled_bitmap, irq)) {
+			irq_bitmap_set(pcpu->virq_pending_bitmap, irq);
+			memory_barrier();
+			arch_send_event(pcpu);
+			break;
+		}
+	}
+}
+
+void plic_register_virq(unsigned int irq)
+{
+	struct cell *cell = this_cell();
+
+	if (irqchip_irq_in_cell(cell, irq)) {
+		printk("FATAL: plic: Unable to register vIRQ %u\n", irq);
+		panic_stop();
+	}
+
+	irq_bitmap_set(cell->arch.virq_present_bitmap, irq);
+}
+
+void plic_unregister_virq(unsigned int irq)
+{
+	struct cell *cell = this_cell();
+	unsigned int cpu;
+
+	if (!irq_bitmap_test(cell->arch.virq_present_bitmap, irq))
+		return;
+
+	irq_bitmap_clear(cell->arch.virq_present_bitmap, irq);
+	for_each_cpu(cpu, &cell->cpu_set)
+		irq_bitmap_clear(public_per_cpu(cpu)->virq_enabled_bitmap, irq);
+}
+
 DEFINE_UNIT (plic, "RISC-V PLIC");
diff --git a/hypervisor/arch/riscv/traps.c b/hypervisor/arch/riscv/traps.c
index 8f59a675..6b768c9b 100644
--- a/hypervisor/arch/riscv/traps.c
+++ b/hypervisor/arch/riscv/traps.c
@@ -154,6 +154,7 @@ static int handle_ipi(void)
 	 * IPI is acknowledged here, as from now on, further IPIs might already
 	 * be sent by remote CPUs.
 	 */
+	plic_process_pending_virqs();
 	spin_unlock(&pcpu->control_lock);
 
 	if (check_events)
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627132905.4338-41-ralf.ramsauer%40oth-regensburg.de.
