Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBYN5T6RQMGQE6QIMZKY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C8970A0F1
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:41:07 +0200 (CEST)
Received: by mail-lf1-x13f.google.com with SMTP id 2adb3069b0e04-4edd54a0eaesf2468483e87.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:41:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528867; cv=pass;
        d=google.com; s=arc-20160816;
        b=XTCbi6B4LLN/N06S2ghZQlYu43qYCs/L7PsfQpCDdqja+CodrA7g9nDkaocifmmiDM
         BU0r77aNFLRUgJRbFLqsjBphgk4U9rIhZ92Y91vxGqMR8ox1AcMRgJQ9WzRvSEwLJtkV
         mmx/KqupDfNxIPwpfXBKGRwCmS6Km3gj2Izlt7jEYsoUHnHK783TPYuW/xqVXg0KfVP0
         gfr0qDeOATNWDrx5pOn7YNHaFzTC7EqBn+s5pmTTgNM2xh++J4aN6ZmR5KJnrAfeALW3
         L6kuOl+0Xm1Q2B/LYzxRif2M3DKTGVYLHWB88bPQH4wStwrsRiTzJzxsQyV45+OG7j3d
         C6Ng==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=qe1kA8Ns+aYQj0r7N3y7BJQ4sJ53PH4hBnJF3INFRDw=;
        b=eBrhyc7wSltwDBPUxWIV1pw+VBDMgJHYRSSywT6ixRKq2yTG5rJEOLi7TB9nrqyC8B
         TpLjSt7wARAOn0Q6J8AF9EJbjr/+ACUTDZeotvvvRYeYqncI9yqy5ux0+BNCBDstWzvg
         6j1mGf7CCX4N5L5w3c0rarH0eXH9qO0GbANQr5NO+ewM0C9YRNg/x3ZcZs8xTFobfHbV
         rK+f81HOFLFoOdySgz4d+tdyTEgiTFlvU/RIOEt8QMH8iyzAyjxGLxesaCyEsjDSrreO
         cEkMVYm+peVC6n+73bziyrTE2IOlRWefTBPpbxTmtjcKCjTgGsfTJDJFfDelkQggGeYX
         L2aw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528867; x=1687120867;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qe1kA8Ns+aYQj0r7N3y7BJQ4sJ53PH4hBnJF3INFRDw=;
        b=A/uNE6a5JtBA/YooE6pde5lJL5COW88DzuyhI49CXcSOMVj+ld3JpRJbAwb83LXnCH
         7YC6XQR0CNA6ro4Gi8HKLawAbExpy3lec1d11CtOrsxzlpFRghKDUznRGT3SvKQgYhKm
         LRy0NqFAWgOwBJZVqPCHHXxW7bRIJgD9F+gYDmPnPeKU0FqZWgREHs4ldRkitLyITaGE
         DIMCMQTfluxrNMYjdTPQhMM7QVGczrHJ4ZA3eg03wGQG3thho70lC7mF1znLZXA9HJ69
         vq4rbWHHZSsuzZAfnIWiQ+sq97tsxBjfEUtZ7k/gZ4NeWfCBzCZYIj2Kb0lymV8JkTf0
         sA/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528867; x=1687120867;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qe1kA8Ns+aYQj0r7N3y7BJQ4sJ53PH4hBnJF3INFRDw=;
        b=WARX96Lp5NN+ZsTb+huFrFcSsPjggl4qU2rYwzz+0ch7uoyCKBez1bikO9KIqSiDu1
         VHXLMo3yRkq1UHOG4Q0eiiHjC9wpIFjPbxYIE3I8Ut6TUIRShivGws2ZaXh+7qShCkDx
         edL5bi1bZKUlRNf2bMc0rCQT2+nTckjJWdE/YqCXWaLqZPnaoX5BCuKsRHLXA6W0sGuD
         +24vEnNBCVMuab12o4jEfV3iUDteuEGvJnc2T/nXLuHkeQ21ymVMPqRen80x76xI2Lzc
         NLQj6UU2L0KzYZSKjjPJrXlVzJ0VWhS7N2vw8Fb7FhVGrAEY0ipOp41Pcg4E3rz0GoJE
         Q2cQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDyBN57EgY0EunPsrJ3rhcYULrwR8mbGNHkMu+iRbsoRrYVDu42t
	4UQBQFs+XwLsPSC53dQQK/0=
X-Google-Smtp-Source: ACHHUZ41Qo9aFF7NC+3g/NQz3oKr4yGb7te/KAo1aKdn1YTo+5aNBAaWJ4miB0urc5Bl7GMDTK9B+w==
X-Received: by 2002:ac2:5d2e:0:b0:4f2:78ae:4e69 with SMTP id i14-20020ac25d2e000000b004f278ae4e69mr823711lfb.9.1684528866465;
        Fri, 19 May 2023 13:41:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:54b:b0:2af:5db:ad4d with SMTP id
 q11-20020a05651c054b00b002af05dbad4dls368409ljp.1.-pod-prod-00-eu; Fri, 19
 May 2023 13:41:04 -0700 (PDT)
X-Received: by 2002:a2e:9c06:0:b0:2a9:ec7e:8f58 with SMTP id s6-20020a2e9c06000000b002a9ec7e8f58mr1011141lji.7.1684528864600;
        Fri, 19 May 2023 13:41:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528864; cv=none;
        d=google.com; s=arc-20160816;
        b=iDGZTfaQ3EtdyYT3lv4cvTNDUO2hbjXdmeOYm+BhY4KGhb08Sj+4b8P5y2b3DT4NUW
         bDYuK9g9+QwK0vl3DLcKMVTqL+lUMRNbfCVZNOTQJ9siytkY8lGY+D9s6Q8bron5pG0R
         NR8mDyJR1HEjaiQmYDkDfkDcnRYhE19e4K35yI+ZnkpneGAvrVboWm2dRnTw19UnuIqn
         EVGWrz0WHXdHIWXx39PjKXk98nC8Oz5AEukViV7+d/EPtv7wyi57wnAxuikMH1DQ7/pV
         smNHS2/gDtl06yAEptNqu8RTKTuIPYa9OcLmBz+BVmXsCw4ULYqwYtx2YUF4j5UiF16R
         ExJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=NoMGNStfcXQbapPuX6AHmN2ZQ1kmkjA2s6nnwR6Ctq8=;
        b=l9FOmE+YsaELpFUIN22dOGLd5ckJ3CrH8+dZ5VZj8Cc66BOGRgm7CxsP+t55PpQqxO
         OzsIQg1x2JiBPE0cdrGupAKwW8YtKxuV534Tk1vdLVJiPNBKwW111EbtzA+hxbaLT6gI
         qlx5CkdT/SfhJ4jzxO1eKTVGZb/Xoc0V3kHbMXKbYM/tQrFBMY9eZYlkWH0iDKY+HPCz
         5ZBZu9AOODtyGWZ5L95T2MB0yw6UAVnziphOc7IwO83kH9vb1cYjq7EgffofXaEow40j
         nyMEo0UNrfxszaDWEbnujBxLQtbypjzovEpcPNSAiJy/RzpyUdyEdV26JVICxKMnBqlG
         3PVA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id bx12-20020a05651c198c00b002a8ba7c9a04si313871ljb.7.2023.05.19.13.41.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:41:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdq093gzyMr;
	Fri, 19 May 2023 22:41:03 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 63/73] core: riscv: implement APLIC support
Date: Fri, 19 May 2023 22:40:23 +0200
Message-Id: <20230519204033.643200-64-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_10000_PLUS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __COURIER_PHRASE 0, __CTE 0, __FILESHARE_PHRASE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __PASSWORD_IN_BODY 0, __PHISH_SPEAR_SUBJ_TEAM 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_25 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0,
 __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

This adds APLIC support for wired IRQs. For wired IRQs, the situation is
basically the same as with the APLIC: We have to fully moderate access,
due to the memory layout.

Major differences to the PLIC:
  - An IRQ can only be routed to a single HART (PLIC supported HART
    target masks)
  - IRQs are only claimed and NOT acknowledged
  - Global IRQ disabling is not supported (via DOMAINCFG). But we don't
    really need it.

So let's do the same as with the PLIC and softemulate it.

The situation will get better, once we add support for MSIs: The with
IMSIC-support, the APLIC can present all wired IRQs as MSIs, and also
supports 'virtual MSIs' that can for example be used to model IPIs.

With the IMSIC, situation will get better for us.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
[since v2: inline single-caller functions, add shadow registers for
enabled, target and sourcecfg]
---
 hypervisor/arch/riscv/Kbuild    |   4 +-
 hypervisor/arch/riscv/aplic.c   | 485 ++++++++++++++++++++++++++++++++
 hypervisor/arch/riscv/irqchip.c |   6 +-
 3 files changed, 492 insertions(+), 3 deletions(-)
 create mode 100644 hypervisor/arch/riscv/aplic.c

diff --git a/hypervisor/arch/riscv/Kbuild b/hypervisor/arch/riscv/Kbuild
index 0e7d3719..e8f0eb9f 100644
--- a/hypervisor/arch/riscv/Kbuild
+++ b/hypervisor/arch/riscv/Kbuild
@@ -14,5 +14,5 @@
 
 always-y := lib.a
 
-lib-y := entry.o exception.o setup.o dbg-write.o control.o ivshmem.o irqchip.o
-lib-y += paging.o pci.o plic.o traps.o lib.o
+lib-y := aplic.o entry.o exception.o setup.o dbg-write.o control.o ivshmem.o
+lib-y += irqchip.o paging.o pci.o plic.o traps.o lib.o
diff --git a/hypervisor/arch/riscv/aplic.c b/hypervisor/arch/riscv/aplic.c
new file mode 100644
index 00000000..8a181a1e
--- /dev/null
+++ b/hypervisor/arch/riscv/aplic.c
@@ -0,0 +1,485 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) OTH Regensburg, 2022-2023
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
+#include <asm/irqchip.h>
+
+#define REGISTER(X) REG_RANGE((X), (X) + IRQCHIP_REG_SZ)
+
+#define DOMAINCFG		0x0
+#define  DOMAINCFG_DM		2
+#define  DOMAINCFG_BE		0
+#define  DOMAINCFG_IE		8
+#define  DOMAINCFG_DEFAULT	((1 << 31) | (1 << DOMAINCFG_IE))
+
+#define SOURCECFG_BASE 		0x4
+#define  SOURCECFG_D		10
+#define SOURCECFG_END 		0x1000
+
+#define TARGET_BASE		0x3004
+#define TARGET_HART_SHIFT	18
+
+#define SETIE_BASE		0x1e00
+#define SETIENUM		0x1edc
+
+#define CLRIE_START		0x1f00
+#define CLRIE_END		(0x1f7c + IRQCHIP_REG_SZ)
+#define CLRIENUM		0x1fdc
+
+/* Per-Hart Interrupt Delivery Control (IDC) */
+#define IDC_BASE		0x4000
+#define IDC_SIZE		0x20
+#define  IDC_CLAIMI		0x1c
+
+/*
+ * When destroying cells, legacy IRQs need to be assigned back to the root
+ * cell. Therefore, we need to keep track of their previous state: The target,
+ * source configuration and enable state.
+ */
+static struct {
+	u32 sourcecfg[MAX_IRQS];
+	u32 target[MAX_IRQS];
+	u32 enabled[MAX_IRQS / (sizeof(u32) * 8)];
+} shadow;
+
+static inline u32 aplic_read(u32 reg)
+{
+	return mmio_read32(irqchip.base + reg);
+}
+
+static inline void aplic_write(u32 reg, u32 value)
+{
+	mmio_write32(irqchip.base + reg, value);
+}
+
+static inline u32 aplic_read_setie(unsigned short no)
+{
+	return aplic_read(SETIE_BASE + no * IRQCHIP_REG_SZ);
+}
+
+static inline bool aplic_irq_is_enabled(unsigned int irq)
+{
+	u32 en = aplic_read_setie(irq / IRQCHIP_BITS_PER_REG);
+
+	return !!(en & IRQ_MASK(irq));
+}
+
+static inline u32 aplic_read_target(unsigned int irq)
+{
+	return aplic_read(TARGET_BASE + (irq - 1) * IRQCHIP_REG_SZ);
+}
+
+static inline void aplic_write_target(unsigned int irq, u32 val)
+{
+	aplic_write(TARGET_BASE + (irq - 1) * IRQCHIP_REG_SZ, val);
+}
+
+static inline u32 aplic_read_sourcecfg(unsigned int irq)
+{
+	return aplic_read(SOURCECFG_BASE + (irq - 1) * IRQCHIP_REG_SZ);
+}
+
+static inline void aplic_write_sourcecfg(unsigned int irq, u32 val)
+{
+	aplic_write(SOURCECFG_BASE + (irq - 1) * IRQCHIP_REG_SZ, val);
+}
+
+static inline void aplic_write_clrienum(unsigned int irq)
+{
+	aplic_write(CLRIENUM, irq);
+}
+
+static void aplic_adjust_irq_target(struct cell *cell, unsigned int irq)
+{
+	u32 target, hart_index;
+	unsigned int cpu;
+
+	if (cell == &root_cell) {
+		aplic_write_sourcecfg(irq, shadow.sourcecfg[irq]);
+		aplic_write_target(irq, shadow.target[irq]);
+		if (irq_bitmap_test(shadow.enabled, irq))
+			aplic_write(SETIENUM, irq);
+		else
+			aplic_write(CLRIENUM, irq);
+		return;
+	}
+
+	target = aplic_read_target(irq);
+	hart_index =  target >> TARGET_HART_SHIFT;
+	for_each_cpu(cpu, &cell->cpu_set)
+		if (public_per_cpu(cpu)->phys_id == hart_index)
+			return;
+
+	/*
+	 * Disable the IRQ. As IRQs must globally stay enabled in DOMAINCFG, we
+	 * need to selecively disable it here to prevent spurious IRQs in the
+	 * new cell.
+	 */
+	aplic_write_sourcecfg(irq, 0);
+
+	/* We have to adjust the IRQ. Locate it on the first CPU of the cell */
+	hart_index = public_per_cpu(first_cpu(&cell->cpu_set))->phys_id;
+	target = (hart_index << TARGET_HART_SHIFT) | (target & 0xff);
+
+	aplic_write_target(irq, target);
+}
+
+static inline u32 aplic_read_idc(unsigned long hart, unsigned long reg)
+{
+	return aplic_read(IDC_BASE + IDC_SIZE * hart + reg);
+}
+
+static inline u32 aplic_read_claimi(unsigned long hart)
+{
+	return aplic_read_idc(hart, IDC_CLAIMI);
+}
+
+static int aplic_claim_irq(void)
+{
+	unsigned short source;
+	unsigned int hart;
+	u32 claimi;
+
+	hart = phys_processor_id();
+
+	claimi = aplic_read_claimi(hart);
+
+	source = (claimi >> 16) & 0x7ff;
+	if (source == 0) /* spurious IRQ, should not happen */
+		return -EINVAL;
+
+	if (source > irqchip_max_irq())
+		return -EINVAL;
+
+	irqchip.pending[hart] = claimi;
+
+	return 0;
+}
+
+static inline void aplic_passthru(const struct mmio_access *access)
+{
+	aplic_write(access->address, access->value);
+}
+
+static inline unsigned int idc_to_hart(unsigned int idc)
+{
+	/*
+	 * For the moment, assume that we only have one APLIC and #IDC = #HART
+	 */
+	return idc;
+}
+
+static inline enum mmio_result
+aplic_handle_claimi(struct mmio_access *access, unsigned int idc)
+{
+	unsigned long hart = idc_to_hart(idc);
+
+	if (access->is_write)
+		return MMIO_ERROR;
+
+	access->value = irqchip.pending[hart];
+
+	irqchip.pending[hart] = aplic_read(access->address);
+
+	guest_clear_ext();
+	ext_enable();
+
+	return MMIO_HANDLED;
+}
+
+static inline enum mmio_result aplic_handle_idc(struct mmio_access *access)
+{
+	unsigned long hart;
+	unsigned int cpu, idc, reg;
+
+	idc = (access->address - IDC_BASE) / IDC_SIZE;
+	reg = access->address % IDC_SIZE;
+
+	/*
+	 * It is clear that a hart is allowed to access its own IDC.
+	 * But we also need to allow accesses to IDCs of neighboured
+	 * harts within the cell.
+	 *
+	 * In (probably) 99% of all cases, the current active CPU will access
+	 * its own context. So do this simple check first, and check other
+	 * contexts of the cell (for loop) later. This results in a bit more
+	 * complex code, but results in better performance.
+	 */
+	hart = phys_processor_id();
+	if (idc_to_hart(idc) == hart)
+		goto allowed;
+
+	/*
+	 * If we land here, then a HART accesses the IDC register of a
+	 * neighboured HART. In this case, we forbid the access if a HART tries
+	 * to cross-claim the interrupt. The reason is simple: If we would
+	 * allow cross-core claiming of IRQs, then we would need to grab a lock
+	 * inside aplic_handle_claimi() to prevent race conditions, which is
+	 * too costful. I never saw any cross-HART irq claims.
+	 */
+	 if (reg == IDC_CLAIMI)
+		return trace_error(MMIO_ERROR);
+
+	for_each_cpu_except(cpu, &this_cell()->cpu_set, this_cpu_id())
+		if (idc_to_hart(public_per_cpu(cpu)->phys_id) == idc)
+			goto passthru;
+
+	return trace_error(MMIO_ERROR);
+
+allowed:
+	if (reg == IDC_CLAIMI)
+		return aplic_handle_claimi(access, hart);
+
+passthru:
+	aplic_passthru(access);
+
+	return MMIO_HANDLED;
+}
+
+static inline enum mmio_result aplic_handle_ienum(struct mmio_access *access)
+{
+	/* Spec: A read always returns zero */
+	if (!access->is_write) {
+		access->value = 0;
+		return MMIO_HANDLED;
+	}
+
+	if (!irqchip_irq_in_cell(this_cell(), access->value))
+		return MMIO_ERROR;
+
+	if (access->address == SETIENUM)
+		irq_bitmap_set(shadow.enabled, access->value);
+	else
+		irq_bitmap_clear(shadow.enabled, access->value);
+
+	aplic_passthru(access);
+
+	return MMIO_HANDLED;
+}
+
+static inline enum mmio_result
+aplic_handle_sourcecfg(struct mmio_access *access)
+{
+	unsigned int irq;
+
+	/* Check if the source IRQ belongs to the cell */
+	irq = (access->address - SOURCECFG_BASE) / IRQCHIP_REG_SZ + 1;
+
+	/* If not, simply ignore the access. */
+	if (!irqchip_irq_in_cell(this_cell(), irq)) {
+		if (!access->is_write)
+			access->value = 0;
+		return MMIO_HANDLED;
+	}
+
+	/* If read, then pass through */
+	if (!access->is_write) {
+		access->value = aplic_read(access->address);
+		return MMIO_HANDLED;
+	}
+
+	/* Don't support delegations at the moment */
+	if (access->value & (1 << 10)) /* Delegation */
+		return MMIO_ERROR;
+
+	if (this_cell() == &root_cell)
+		shadow.sourcecfg[irq] = access->value;
+
+	/* If no delegations, simply pass through */
+	aplic_passthru(access);
+
+	return MMIO_HANDLED;
+}
+
+static bool hart_in_cell(struct cell *cell, unsigned long hart)
+{
+	unsigned int cpu;
+
+	for_each_cpu(cpu, &cell->cpu_set)
+		if (public_per_cpu(cpu)->phys_id == hart)
+			return true;
+
+	return false;
+}
+
+/* Assumption: We're in direct delivery mode */
+static inline enum mmio_result aplic_handle_target(struct mmio_access *access)
+{
+	struct cell *cell = this_cell();
+	unsigned int irq;
+	u32 target;
+
+	/* Check if the source IRQ belongs to the cell */
+	irq = (access->address - TARGET_BASE) / IRQCHIP_REG_SZ + 1;
+
+	/* If not, simply ignore the access. */
+	if (!irqchip_irq_in_cell(cell, irq)) {
+		if (!access->is_write)
+			access->value = 0;
+		return MMIO_HANDLED;
+	}
+
+	/* If read, then pass through */
+	if (!access->is_write) {
+		access->value = aplic_read(access->address);
+		return MMIO_HANDLED;
+	}
+
+	/* Here we are in the write case */
+	target = access->value >> TARGET_HART_SHIFT;
+
+	/*
+	 * Linux initialises all targets with default priorities, even if the
+	 * IRQ doesn't belong to it. Just return success.
+	 */
+	if (hart_in_cell(cell, target))
+		aplic_passthru(access);
+
+	return MMIO_HANDLED;
+}
+
+static inline enum mmio_result aplic_handle_clrie(struct mmio_access *access)
+{
+	unsigned int idx;
+	u32 allowed;
+
+	idx = (access->address - CLRIE_START) / IRQCHIP_REG_SZ;
+
+	/* Only allow clearing of IRQs that are in the cell */
+	allowed = this_cell()->arch.irq_bitmap[idx] & access->value;
+
+	if (this_cell() == &root_cell)
+		shadow.enabled[idx] &= ~allowed;
+
+	aplic_write(access->address, allowed);
+
+	return MMIO_HANDLED;
+}
+
+static inline enum mmio_result
+aplic_handle_domaincfg(struct mmio_access *access)
+{
+	/*
+	 * Domaincfg is handled as follows: We can not allow guests to globally
+	 * disable IRQs (i.e., modify the IE bit of the APLIC) as this would
+	 * affect other cells. The easy strategy for the moment is, to simple
+	 * ignore disabling of the IE bit. This avoids complex softemulation,
+	 * and works for most situations, as IRQs that are assigned to a cell
+	 * are disabled up on cell creation.
+	 *
+	 * So if Domaincfg is read, deliver that IE is enabled, and that's it.
+	 * Ignore any modification of the IE bit, and don't allow to touch
+	 * other bits, such as DM and BE.
+	 */
+	 if (!access->is_write) {
+		access->value = DOMAINCFG_DEFAULT;
+		return MMIO_HANDLED;
+	}
+
+	if (access->value & ((1 << DOMAINCFG_DM) | (1 << DOMAINCFG_BE)))
+		return MMIO_ERROR;
+
+	return MMIO_HANDLED;
+}
+
+static enum mmio_result aplic_handler(void *arg, struct mmio_access *access)
+{
+	enum mmio_result res = MMIO_ERROR;
+
+	switch (access->address) {
+	case REGISTER(DOMAINCFG):
+		res = aplic_handle_domaincfg(access);
+		break;
+
+	case REGISTER(SETIENUM):
+	case REGISTER(CLRIENUM):
+		res = aplic_handle_ienum(access);
+		break;
+
+	case REG_RANGE(CLRIE_START, CLRIE_END):
+		res = aplic_handle_clrie(access);
+		break;
+
+	case REG_RANGE(SOURCECFG_BASE, SOURCECFG_END):
+		res = aplic_handle_sourcecfg(access);
+		break;
+
+	case REG_RANGE(TARGET_BASE, IDC_BASE):
+		res = aplic_handle_target(access);
+		break;
+
+	case REG_RANGE(IDC_BASE, IDC_BASE + IDC_SIZE * MAX_CPUS):
+		res = aplic_handle_idc(access);
+		break;
+
+	default:
+		printk("Unknown APLIC access: 0x%lx - 0x%lx - %s\n",
+		       access->address, access->value,
+		       access->is_write ? "Write" : "Read");
+		break;
+	}
+
+	return res;
+}
+
+static int aplic_init(void)
+{
+	unsigned short irq;
+	u32 sourcecfg;
+	bool enabled;
+
+	/* Disallow MSI & Delegations for the moment */
+	if (aplic_read(DOMAINCFG) & (1 << DOMAINCFG_DM)) {
+		printk("MSI Delivery mode not supported!\n");
+		return -ENOSYS;
+	}
+
+	/*
+	 * If we check during early initialisation if all enabled IRQs belong
+	 * to the root cell, then we don't need to check if an IRQ belongs to a
+	 * cell on arrival.
+	 */
+	for (irq = 1; irq < MAX_IRQS; irq++) {
+		sourcecfg = aplic_read_sourcecfg(irq);
+		if (sourcecfg & (1 << SOURCECFG_D)) {
+			printk("IRQ delegation not supported: %d\n", irq);
+			return -ENOSYS;
+		}
+
+		enabled = aplic_irq_is_enabled(irq);
+		if (irqchip_irq_in_cell(&root_cell, irq)) {
+			shadow.sourcecfg[irq] = sourcecfg;
+			shadow.target[irq] = aplic_read_target(irq);
+			if (enabled)
+				irq_bitmap_set(shadow.enabled, irq);
+		} else if (enabled) {
+			printk("Error: IRQ %u active in root cell\n",
+			       irq);
+			return trace_error(-EINVAL);
+		}
+	}
+
+	return 0;
+}
+
+const struct irqchip irqchip_aplic = {
+	.init = aplic_init,
+	.claim_irq = aplic_claim_irq,
+	.adjust_irq_target = aplic_adjust_irq_target,
+	.mmio_handler = aplic_handler,
+};
diff --git a/hypervisor/arch/riscv/irqchip.c b/hypervisor/arch/riscv/irqchip.c
index 4d8ade0b..693c37bf 100644
--- a/hypervisor/arch/riscv/irqchip.c
+++ b/hypervisor/arch/riscv/irqchip.c
@@ -23,7 +23,7 @@
 #define IRQ_BITMAP_PINS \
 	(sizeof(((struct cell *)0)->arch.irq_bitmap) * 8)
 
-extern const struct irqchip irqchip_plic;
+extern const struct irqchip irqchip_aplic, irqchip_plic;
 
 struct irqchip irqchip;
 
@@ -138,6 +138,10 @@ static int irqchip_init(void)
 			irqchip = irqchip_plic;
 			break;
 
+		case JAILHOUSE_RISCV_APLIC:
+			irqchip = irqchip_aplic;
+			break;
+
 		default:
 			return trace_error(-ENOSYS);
 	}
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-64-ralf.ramsauer%40oth-regensburg.de.
