Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBM7B42KQMGQE2J3YK4I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1AD55BA0F
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:29:34 +0200 (CEST)
Received: by mail-ed1-x540.google.com with SMTP id y18-20020a056402441200b0043564cdf765sf7203563eda.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:29:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656336574; cv=pass;
        d=google.com; s=arc-20160816;
        b=alhpRTCuPpeFmJ0VlGHv+ovqgUm471Fn4Mqp5oEY5wzgM1goDSu7cjclLKaSZnTYNd
         poqj1dF6fdwDdTk9Lh0azo+CbuOSOvoX8zOMl7VwCRMwqeV1Sl9TRYLojMRLfhz7pImJ
         GMWckGSJ/eElBoghGC4fdTNjMnPTczrEGD3UjgJZrEWIuhTSw31xMNM2VB1oQT6MIfvr
         ExDMXX7FWs5iHj7Kfc5HeIm49wjOkPFFgD6p/24SRXp0JVlEv36VHcoFY0hiS08TbBr8
         mpXGA23oiMzjodoJm4zrKoTuwJKA8DzKEv2D99YiP3lbWbvp7dsrhgZTX2ezBQL6FRwM
         5C7A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=3iz+Qfh/ynR77FBswKfQhK8AvTmTXnsQa0ytvfc9lGw=;
        b=XnwyX6CP+kUKSmzPEsU2WZdODcDc7GIegcGzosr+kkHRbWJUpT4vcjC37pISp3fqUH
         SCh2+kMrt2T5/BACHrpdtdbRXlX/UzXwwa7nP5Tkld5qAKzERFX6iPQLpCaUKF2pvCOV
         IIiiTi00+1FPJuss0FmdsAcFMGURcQpdtcNMcIYjNKW86RULUiOQ3xAZrvJegGcW7mVW
         LP244C7AjxrDWastf+tS2RC0NiClHe03+zBQbWoFvQXwcU1LURHFb9TprRSbCttj9Yqo
         zlXJcsmwW3kYuSMbW2inf8bmw3ILr9qK57koIflxTuZ+BEOJ/+196aPeN1yiOVcP4xcq
         b0dw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=kXJlRupM;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3iz+Qfh/ynR77FBswKfQhK8AvTmTXnsQa0ytvfc9lGw=;
        b=oSHxthdESH3WABvKWV3fQz3mii+EdfiyzJ+s11hjU0Efm2ZczgSHHeJTIXAUycHzon
         Q9cZ+iuJHqkyZpnCgEOwQk/olVXTwmkz74ZyC6Y74GnpodXV1MFnNOhdNbd4n9Dl/IQZ
         asHfh+rUX+WstLe4RlY8uAMbGLzrECUWZr4kvCs6hMbenoIldRxXiyC90G6BlrMszyr8
         PYthkfoj4SEwwEsT6qAkK5uTAIrEbVugnVOIvSavMt0X9wZXt2J67qOkKP3ciNEr+jZ4
         /odEHbqmy84O00Qz0njBb1CjCM1lJvizoujjyLnwyWeeyYGAb6h0e12GlFNLg4HthO+M
         hBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3iz+Qfh/ynR77FBswKfQhK8AvTmTXnsQa0ytvfc9lGw=;
        b=JXMrdeMauODgIcmUT0BFElpAeVNLMD98CwNB5dwXEwn9uEBDSQTYMvJ2hhqN8chncC
         ljcmhLQNXvwzQSwhygTqyxfp0dv07Sx+AfAjni3hiZjmKAPqiOS/7fZVixs1F6XkzTky
         YVNdae9gtBNY81ydMXIXpOpyPv6TIWX/YdxdQaU1ImFtvovPCeCe2B/f07YBJFdFpRKE
         0E0NeKz+UTw2dxBkTPvlaLbrcV1pe9eJhjAMgAPJP7/NkWveIhTP82y4qiwYAgu4jaGo
         DNV2yX6K8QCcyeodl9gHIta4vMxErRni7gd8NiUMQS+03XO+iR2s7xztayT2uLeeM/d5
         vgVw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora8A8fXdltxFyEMfGBN1PKfktQ4CeY468+oXdr/2V9Xifp5O1PhS
	3kGZ0zfooCjaad8/56sScL0=
X-Google-Smtp-Source: AGRyM1vM9TMTtKk9JuwOjAGeH947c+I/aC4r0cZX9Px0i4sbloYIACe625lIakXHSKWu/ERLLBLhkQ==
X-Received: by 2002:a2e:a482:0:b0:25b:b7f5:5f88 with SMTP id h2-20020a2ea482000000b0025bb7f55f88mr4539860lji.193.1656336564048;
        Mon, 27 Jun 2022 06:29:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9948:0:b0:25b:c0c2:7dec with SMTP id r8-20020a2e9948000000b0025bc0c27decls419749ljj.11.gmail;
 Mon, 27 Jun 2022 06:29:22 -0700 (PDT)
X-Received: by 2002:a2e:3a11:0:b0:25a:7fe6:4ffc with SMTP id h17-20020a2e3a11000000b0025a7fe64ffcmr6448760lja.186.1656336562371;
        Mon, 27 Jun 2022 06:29:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656336562; cv=none;
        d=google.com; s=arc-20160816;
        b=Or7C1Tgpv3IKTUdEmRqgpR7Gs0lhja8RBlZmHjxf37DsCx9saGIYHh3UoK+CMesJna
         raEF4RsXXRf5z62ImjIMCOqQh749jXbDRZZI6M4orbI7mp8X9M0abeXdMVfLEvr0Dbbi
         XU/LbDxZNUVJJzpQqi31VrxxuBsKKMlhwwJGdUogo7QDH8qIXVtv24MMI9s7DF0C0dHz
         r9d60lYQae78QcxI3TexJr9zHy58W3aQNd5u/6oQy0UmlemqSCAqm4RO5gZRDS9WpwNA
         IWnPu82ouHju8TCbW6pQEN8Yte62nd6v0XP3FtSGO8u9rxFwhYbqbiESq/gCQiebV2Za
         lSqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=bactVjo+oTkGtM1y8j8HHbvCe8XPOFTBQqrzqvSwcIw=;
        b=Tu7pjEqPFzp8byLT+YmowoywAPae1zNlrx/ntq4ZROheO+kEWqrcdhYZoq5CzncluY
         Ajy7WAMlCI+NJzWknI4wgHPr1a/7+jnEhiBXyEtUIXH+3hHsFqrnsCa91C2ml6+NfX3z
         fDsZWVgq6BE5yORQGCMg1rXuuLuY5ypTobewoOZ57MNPp1uMSe72YyXWgE36kY0xbwqC
         qMlEH+Np7dpTnwHvfe3PFpbRwijXd+Zc+jusqXwQVM1Ly4YLxIUf3EPY39KhBepJy7rB
         cA5/23rNOAERRL2qas9rcKI5h5F+oTz18kKPjcEbmjFd/nuTbqzilMkR7UYfl2TuOyK7
         56yw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=kXJlRupM;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id t28-20020a05651c205c00b00258ed232ee9si365952ljo.8.2022.06.27.06.29.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:29:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4LWpV95pzbzy0c;
	Mon, 27 Jun 2022 15:29:21 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:29:21 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 28/42] riscv: Add plic implementation
Date: Mon, 27 Jun 2022 15:28:51 +0200
Message-ID: <20220627132905.4338-29-ralf.ramsauer@oth-regensburg.de>
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
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=kXJlRupM;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

The design of the PLIC is poor: We basically need to trap & moderate
each access.

The strategy is as follows:

On IRQ arrival in S-Mode, we directly acknowledge the IRQ, save it in a
shadow register, and reinject it to the VS-Mode guest. Now disable IRQs
for S-Mode, until the guest has claimed and acknowledged the IRQ.

After the guest acknowledged the IRQ, reenable IRQs in S-Mode again.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/Kbuild             |   2 +-
 hypervisor/arch/riscv/include/asm/plic.h |   3 +
 hypervisor/arch/riscv/plic.c             | 576 +++++++++++++++++++++++
 3 files changed, 580 insertions(+), 1 deletion(-)
 create mode 100644 hypervisor/arch/riscv/plic.c

diff --git a/hypervisor/arch/riscv/Kbuild b/hypervisor/arch/riscv/Kbuild
index 7809007c..9fd2456f 100644
--- a/hypervisor/arch/riscv/Kbuild
+++ b/hypervisor/arch/riscv/Kbuild
@@ -15,4 +15,4 @@
 always-y := lib.a
 
 lib-y := entry.o exception.o setup.o dbg-write.o control.o ivshmem.o paging.o
-lib-y += pci.o traps.o lib.o
+lib-y += plic.o pci.o traps.o lib.o
diff --git a/hypervisor/arch/riscv/include/asm/plic.h b/hypervisor/arch/riscv/include/asm/plic.h
index 04cdfa63..c5414e9e 100644
--- a/hypervisor/arch/riscv/include/asm/plic.h
+++ b/hypervisor/arch/riscv/include/asm/plic.h
@@ -15,4 +15,7 @@
 
 #define PLIC_MAX_IRQS	1024
 
+extern int plic_set_pending(void);
+bool irqchip_irq_in_cell(struct cell *cell, unsigned int irq);
+
 #endif /* _PLIC_H */
diff --git a/hypervisor/arch/riscv/plic.c b/hypervisor/arch/riscv/plic.c
new file mode 100644
index 00000000..84f95c0b
--- /dev/null
+++ b/hypervisor/arch/riscv/plic.c
@@ -0,0 +1,576 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) OTH Regensburg, 2022
+ *
+ * Authors:
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/paging.h>
+#include <jailhouse/cell.h>
+#include <jailhouse/string.h>
+#include <jailhouse/unit.h>
+#include <jailhouse/control.h>
+#include <jailhouse/processor.h>
+#include <jailhouse/printk.h>
+#include <asm/csr64.h>
+
+#define PLIC_PRIO_BASE		0x0
+#define PLIC_PENDING_BASE	0x1000
+#define PLIC_ENABLE_BASE	0x2000
+#define PLIC_ENABLE_OFF		0x80
+#define PLIC_ENABLE_END		0x1f2000
+#define PLIC_CTX_BASE		0x200000
+#define PLIC_CTX_PRIO_TH	0x0
+#define PLIC_CTX_CLAIM		0x4
+#define PLIC_CTX_SZ		0x1000
+#define PLIC_CTX_END		0x4000000
+
+#define REG_SZ			4
+#define REG_RANGE(A, B)		(A)...((B) - REG_SZ)
+
+#define PLIC_BITS_PER_REG	(REG_SZ * 8)
+#define IRQ_BIT(irq)		((irq) % PLIC_BITS_PER_REG)
+#define IRQ_MASK(irq)		(1 << IRQ_BIT(irq))
+
+
+/* Could also be used for arm-common/irqchip.c */
+#define IRQCHIP_PINS \
+	(sizeof(((struct jailhouse_irqchip *)0)->pin_bitmap) * 8)
+
+#define IRQ_BITMAP_PINS \
+	(sizeof(((struct cell *)0)->arch.irq_bitmap) * 8)
+
+static void *plic_base;
+static unsigned long pending[MAX_CPUS];
+
+static inline unsigned long plic_phys(void)
+{
+	return system_config->platform_info.riscv.plic.base_address;
+}
+
+static inline s16 hart_to_context(unsigned int hartid)
+{
+	if (hartid > ARRAY_SIZE(
+		system_config->platform_info.riscv.plic.hart_to_context))
+		return -1;
+
+	return system_config->platform_info.riscv.plic.hart_to_context[hartid];
+}
+
+static inline u16 plic_max_irq(void)
+{
+	return system_config->platform_info.riscv.plic.max_irq;
+}
+
+static inline u16 plic_max_priority(void)
+{
+	return system_config->platform_info.riscv.plic.max_priority;
+}
+
+static inline unsigned int plic_size(void)
+{
+	return system_config->platform_info.riscv.plic.size;
+}
+
+static inline void ext_enable(void)
+{
+	csr_set(sie, IE_EIE);
+}
+
+static inline void ext_disable(void)
+{
+	csr_clear(sie, IE_EIE);
+}
+
+static inline void guest_clear_ext(void)
+{
+	csr_clear(CSR_HVIP, (1 << IRQ_S_EXT) << VSIP_TO_HVIP_SHIFT);
+}
+
+static inline void guest_inject_ext(void)
+{
+	csr_set(CSR_HVIP, (1 << IRQ_S_EXT) << VSIP_TO_HVIP_SHIFT);
+}
+
+static inline bool guest_ext_pending(void)
+{
+	return !!(csr_read(CSR_HVIP) &
+			((1 << IRQ_S_EXT) << VSIP_TO_HVIP_SHIFT));
+}
+
+static inline u32 plic_read(u32 reg)
+{
+	return mmio_read32(plic_base + reg);
+}
+
+static inline void plic_write(u32 reg, u32 value)
+{
+	mmio_write32(plic_base + reg, value);
+}
+
+static inline u32 plic_read_context(u32 context, u32 off)
+{
+	return plic_read(PLIC_CTX_BASE + context * PLIC_CTX_SZ + off);
+}
+
+static inline u32 plic_read_claim(u32 context)
+{
+	return plic_read_context(context, PLIC_CTX_CLAIM);
+}
+
+static inline u32 plic_en_reg(s16 context, unsigned int irq)
+{
+	u32 reg;
+
+	reg = PLIC_ENABLE_BASE + (context * PLIC_ENABLE_OFF) +
+	      (irq / PLIC_BITS_PER_REG) * REG_SZ;
+
+	return reg;
+}
+
+static inline u32 plic_read_enabled(s16 context, unsigned int irq)
+{
+	return plic_read(plic_en_reg(context, irq));
+}
+
+static inline void plic_write_enabled(s16 context, unsigned int irq, u32 val)
+{
+	plic_write(plic_en_reg(context, irq), val);
+}
+
+static inline bool plic_irq_is_enabled(s16 context, unsigned int irq)
+{
+	u32 en = plic_read_enabled(context, irq);
+
+	return !!(en & IRQ_MASK(irq));
+}
+
+static inline void plic_enable_irq(s16 context, unsigned int irq)
+{
+	u32 val;
+
+	val = plic_read_enabled(context, irq) | IRQ_MASK(irq);
+	plic_write_enabled(context, irq, val);
+}
+
+static inline void plic_disable_irq(s16 context, unsigned int irq)
+{
+	u32 val;
+
+	val = plic_read_enabled(context, irq) & ~IRQ_MASK(irq);
+	plic_write_enabled(context, irq, val);
+}
+
+static bool irq_bitmap_test(u32 *bitmap, unsigned int irq)
+{
+	u32 val;
+
+	if (irq >= plic_max_irq())
+		return false;
+
+	val = bitmap[irq / PLIC_BITS_PER_REG];
+
+	return !!(val & IRQ_MASK(irq));
+}
+
+static inline void irq_bitmap_set(u32 *bitmap, unsigned int irq)
+{
+	bitmap[irq / PLIC_BITS_PER_REG] |= IRQ_MASK(irq);
+}
+
+static inline void irq_bitmap_clear(u32 *bitmap, unsigned int irq)
+{
+	bitmap[irq / PLIC_BITS_PER_REG] &= ~IRQ_MASK(irq);
+}
+
+inline bool irqchip_irq_in_cell(struct cell *cell, unsigned int irq)
+{
+	return irq_bitmap_test(cell->arch.irq_bitmap, irq);
+}
+
+int plic_set_pending(void)
+{
+	int my_context;
+	u32 irq;
+	unsigned int cpuid;
+
+	this_cpu_public()->stats[JAILHOUSE_CPU_STAT_VMEXITS_VIRQ]++;
+
+	cpuid = phys_processor_id();
+
+	/* Assume that phys_processor_id always returns something < 64 */
+	my_context = hart_to_context(cpuid);
+	if (my_context < 0)
+		return -ENOSYS;
+
+	irq = plic_read_claim(my_context);
+	if (irq == 0) /* spurious IRQ, should not happen */
+		return -EINVAL;
+
+	if (irq > plic_max_irq())
+		return -EINVAL;
+
+	pending[cpuid] = irq;
+	/*
+	 * We can directly inject the IRQ into the guest if the IRQ is not
+	 * pending, because we know that the IRQ is enabled, otherwise we
+	 * wouldn't have received it
+	 */
+	guest_inject_ext();
+
+	/*
+	 * Don't claim complete! This must be done by the guest. We will handle
+	 * that in plic_handler(). In the meanwhile we simply deactivate S-Mode
+	 * External IRQs, and reenable them when the guest claims it. In this
+	 * way, we only need to store one pending IRQ per hart.
+	 */
+	ext_disable();
+
+	return 0;
+}
+
+static inline void plic_passthru(const struct mmio_access *access)
+{
+	plic_write(access->address, access->value);
+}
+
+static inline enum mmio_result
+plic_handle_context_claim(struct mmio_access *access, unsigned long hart)
+{
+	if (!access->is_write) {
+		access->value = pending[hart];
+		return MMIO_HANDLED;
+	}
+
+	/* claim write case */
+	if (access->value != pending[hart]) {
+		printk("FATAL: Guest acknowledged non-pending IRQ %lu\n",
+		       access->value);
+		return MMIO_ERROR;
+	}
+
+	plic_write(access->address, access->value);
+
+	/* Check if there's another physical IRQ pending */
+	/* TODO: This is where we would need to prioritise vIRQs */
+	pending[hart] = plic_read(access->address);
+	if (pending[hart])
+		return MMIO_HANDLED;
+
+	guest_clear_ext();
+	ext_enable();
+
+	return MMIO_HANDLED;
+}
+
+static enum mmio_result plic_handle_context(struct mmio_access *access)
+{
+	unsigned int cpu;
+	unsigned long hart;
+	int ctx;
+	u64 addr;
+
+	addr = access->address - PLIC_CTX_BASE;
+	ctx = addr / PLIC_CTX_SZ;
+
+	/*
+	 * It is clear that a hart is allowed to access its own context.
+	 * But we also need to allow accesses to context to neighboured
+	 * harts within the cell.
+	 *
+	 * In (probably) 99% of all cases, the current active CPU will access
+	 * its own context. So do this simple check first, and check other
+	 * contexts of the cell (for loop) later. This results in a bit more
+	 * complex code, but results in better performance.
+	 */
+	hart = phys_processor_id();
+	if (hart_to_context(hart) == ctx)
+		goto allowed;
+
+	for_each_cpu_except(cpu, &this_cell()->cpu_set, this_cpu_id())
+		if (hart_to_context(public_per_cpu(cpu)->phys_id) == ctx)
+			goto allowed;
+
+	return trace_error(MMIO_ERROR);
+
+allowed:
+	addr -= ctx * PLIC_CTX_SZ;
+	if (addr == PLIC_CTX_CLAIM) {
+		return plic_handle_context_claim(access, hart);
+	} else if (addr == PLIC_CTX_PRIO_TH) {
+		/* We land here if we permit the access */
+		if (access->is_write)
+			plic_passthru(access);
+		else
+			access->value = plic_read(access->address);
+	} else {
+		return MMIO_ERROR;
+	}
+
+	return MMIO_HANDLED;
+}
+
+static enum mmio_result plic_handle_prio(struct mmio_access *access)
+{
+	unsigned int irq;
+	unsigned int prio = access->value;
+
+	irq = access->address / REG_SZ;
+
+	if (!irqchip_irq_in_cell(this_cell(), irq))
+		return MMIO_ERROR;
+
+	/*
+	 * Maybe we can abandon this check. The cell should know the max
+	 * allowed value, so simply allow any value?
+	 */
+	if (prio > plic_max_priority())
+		return MMIO_ERROR;
+
+	plic_passthru(access);
+	return MMIO_HANDLED;
+}
+
+static enum mmio_result plic_handle_enable(struct mmio_access *access)
+{
+	struct public_per_cpu *pc;
+	u32 irq_allowed_bitmap;
+	unsigned int idx, cpu;
+	short int ctx;
+
+	ctx = (access->address - PLIC_ENABLE_BASE) / PLIC_ENABLE_OFF;
+
+	/* Does the context even belong to one of the cell's CPUs? */
+	for_each_cpu(cpu, &this_cell()->cpu_set) {
+		pc = public_per_cpu(cpu);
+		if (hart_to_context(pc->phys_id) == ctx)
+			goto allowed;
+	}
+
+	/*
+	 * FIXME: Why does Linux read non-allowed ctxs? This seems to be an
+	 * actual bug in Linux. When we remove a CPU from Linux, and we later
+	 * change the affinity of the IRQ, then Linux will try to access
+	 * Contexts which it is not in charge of any longer. While Linux
+	 * disables IRQs, it does not adjust smp_affinities when removing CPUs.
+	 *
+	 * For the moment, and as a workaround, simply report any read as 0,
+	 * and forbid writes != 0.
+	 *
+	 * ... Okay, we really have a Linux bug here.
+	 *  (a) Linux doesn't remove the affinity from removed CPUs
+	 *  (b) Linux allows to set affinity to non-present CPUs
+	 *
+	 * Actually, we should always return MMIO_ERROR here.
+	 */
+
+#if 1
+	if (!access->is_write) {
+		access->value = 0;
+	} else if (access->value != 0)
+		return MMIO_ERROR;
+	return MMIO_HANDLED;
+#else
+	return MMIO_ERROR;
+#endif
+
+allowed:
+	/*
+	 * Now we have to check if we have a read or write access. In case of
+	 * reads, simply return the real value of the PLIC.
+	 *
+	 * In case of writes, compare against the irq_bitmap, if we're allowed
+	 * to perform the write.
+	 */
+	idx = ((access->address - PLIC_ENABLE_BASE) % PLIC_ENABLE_OFF)
+		* 8 / PLIC_BITS_PER_REG;
+
+	if (!access->is_write) {
+		access->value = plic_read(access->address);
+		return MMIO_HANDLED;
+	}
+
+	/* write case */
+	irq_allowed_bitmap = this_cell()->arch.irq_bitmap[idx];
+
+	if (access->value & ~irq_allowed_bitmap) {
+		printk("FATAL: Cell enabled non-assigned IRQ\n");
+		return MMIO_ERROR;
+	}
+
+	plic_passthru(access);
+
+	return MMIO_HANDLED;
+}
+
+static enum mmio_result plic_handler(void *arg, struct mmio_access *access)
+{
+	/* only allow 32bit access */
+	if (access->size != REG_SZ)
+		return MMIO_ERROR;
+
+	switch (access->address) {
+	case REG_RANGE(PLIC_PRIO_BASE, PLIC_PENDING_BASE):
+		return plic_handle_prio(access);
+		break;
+
+	case REG_RANGE(PLIC_ENABLE_BASE, PLIC_ENABLE_END):
+		return plic_handle_enable(access);
+		break;
+
+	case REG_RANGE(PLIC_CTX_BASE, PLIC_CTX_END):
+		if (access->address < plic_size())
+			return plic_handle_context(access);
+		break;
+
+	default:
+		break;
+	}
+
+	return MMIO_ERROR;
+}
+
+static int plic_cell_init(struct cell *cell)
+{
+	const struct jailhouse_irqchip *chip;
+	unsigned int n, pos;
+
+	mmio_region_register(cell, plic_phys(), plic_size(), plic_handler,
+			     cell);
+
+	for_each_irqchip(chip, cell->config, n) {
+		/* Only support one single PLIC at the moment */
+		if (chip->address !=
+		    system_config->platform_info.riscv.plic.base_address)
+			return trace_error(-EINVAL);
+
+		if (chip->pin_base % 32 != 0 ||
+		    chip->pin_base + IRQCHIP_PINS > IRQ_BITMAP_PINS)
+			return trace_error(-EINVAL);
+
+		for (pos = 0; pos < ARRAY_SIZE(chip->pin_bitmap); pos++)
+			cell->arch.irq_bitmap[chip->pin_base / 32 + pos] |=
+				chip->pin_bitmap[pos];
+	}
+
+	/* This logic is shared with arm-common */
+	if (cell == &root_cell)
+		return 0;
+
+	for_each_irqchip(chip, cell->config, n) {
+		// TODO: Check if IRQs are disabled before removing them
+		for (pos = 0; pos < ARRAY_SIZE(chip->pin_bitmap); pos++)
+			root_cell.arch.irq_bitmap[chip->pin_base / 32 + pos] &=
+				~chip->pin_bitmap[pos];
+	}
+
+	return 0;
+}
+
+static int plic_init(void)
+{
+	unsigned int cpu, irq;
+	s16 context;
+
+	plic_base = paging_map_device(plic_phys(), plic_size());
+	if (!plic_base)
+		return -ENOMEM;
+
+	plic_cell_init(&root_cell);
+
+	/*
+	 * If we check during early initialisation if all enabled IRQs belong
+	 * to the root cell, then we don't need to check if an IRQ belongs to a
+	 * cell on arrival.
+	 */
+	for_each_cpu(cpu, &root_cell.cpu_set) {
+		context = hart_to_context(cpu);
+		for (irq = 0; irq < plic_max_irq(); irq++) {
+			if (plic_irq_is_enabled(context, irq) &&
+			    !irqchip_irq_in_cell(&root_cell, irq)) {
+				printk("Error: IRQ %u active in root cell\n",
+				       irq);
+				return trace_error(-EINVAL);
+			}
+		}
+	}
+
+	return 0;
+}
+
+static void plic_cell_exit(struct cell *cell)
+{
+	const struct jailhouse_irqchip *chip;
+	unsigned int n, pos;
+
+	mmio_region_unregister(cell, plic_phys());
+
+	/* set all pins of the old cell in the root cell */
+	for_each_irqchip(chip, cell->config, n)
+		for (pos = 0; pos < ARRAY_SIZE(chip->pin_bitmap); pos++)
+			root_cell.arch.irq_bitmap[chip->pin_base / 32 + pos] |=
+				chip->pin_bitmap[pos];
+
+	/* mask out pins again that actually didn't belong to the root cell */
+	for_each_irqchip(chip, root_cell.config, n)
+	        for (pos = 0; pos < ARRAY_SIZE(chip->pin_bitmap); pos++)
+			root_cell.arch.irq_bitmap[chip->pin_base / 32 + pos] &=
+				chip->pin_bitmap[pos];
+}
+
+static void plic_shutdown(void)
+{
+	if (plic_base)
+		paging_unmap_device(plic_phys(), plic_base, plic_size());
+}
+
+static unsigned int plic_mmio_count_regions(struct cell *cell)
+{
+	return 1;
+}
+
+static void plic_config_commit(struct cell *cell)
+{
+	unsigned int irq, n;
+	s16 ctx;
+
+	if (!cell)
+		return;
+
+	if (cell == &root_cell)
+		return;
+
+	for (irq = 0; irq < plic_max_irq(); irq++) {
+		/*
+		 * Three possibilities:
+		 *   1. IRQ belongs to root cell and was removed (cell
+		 *      creation)
+		 *   2. IRQ belonged to non-root cell and was assigned back to
+		 *      non-root cell (cell destruction)
+		 *   3. IRQ belonged to non-root cell and is simply gone
+		 *      (belongs to no one)
+		 *
+		 * IRQ-Bitmaps are already updated accordingly. All we have to
+		 * do is to ensure that the IRQ is disabled. That's all.
+		 */
+		if (!irqchip_irq_in_cell(cell, irq))
+			continue;
+
+		/* Disable the IRQ for each defined PLIC context. */
+		for (n = 0; n < MAX_CPUS; n++) {
+			ctx = hart_to_context(n);
+			if (ctx == -1)
+				// or break? Are there non-contiguous harts?
+				continue;
+
+			plic_disable_irq(ctx, irq);
+		}
+	}
+}
+
+DEFINE_UNIT (plic, "RISC-V PLIC");
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627132905.4338-29-ralf.ramsauer%40oth-regensburg.de.
