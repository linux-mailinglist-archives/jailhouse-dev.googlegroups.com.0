Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBY55T6RQMGQEWRUJANQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63d.google.com (mail-ej1-x63d.google.com [IPv6:2a00:1450:4864:20::63d])
	by mail.lfdr.de (Postfix) with ESMTPS id A602370A0F3
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:41:08 +0200 (CEST)
Received: by mail-ej1-x63d.google.com with SMTP id a640c23a62f3a-94a34e35f57sf396414866b.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:41:08 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528868; cv=pass;
        d=google.com; s=arc-20160816;
        b=X4KIuKhfJvaZpBx8pJQKk9A/3OdIOnW2FES1RTP91zUyQSVDZRmosJdRza6lY5TPOq
         7GxypFSyJC0F+V+aWP9GfT1Iy34wOqvSuvSmG45UOgIjqRHeRlv+jxEuxeCl8n43MRU5
         z2KAYyLsIHDCXWFOYS29YJjR53C6iijVhtQRYbTZ6a5TGlCTIXibjxOVk7hxeIpr3juM
         JUjc5qWDc5H6ix/x6QSOaBTIetmJUFMFAfFlWkd2k12gwAsD4HQzkE3Es2/X8fFve2PW
         jmrje6/BPGJgsQG8w4/YQiPgEgcmwdroyYF65FCfBGSkwAvOElfwyZsYDa64MXvA49uv
         09Hw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=v1fQSk/RLbZFkJkYGHhcGAHyHGBY0Hm//YIqjtLeCHA=;
        b=Ky+LfFHvUpJkaUCffjUN60yMLWlHliLun3VQWO3zmodlyV5Pr9nSrjLpvki4IeIWd7
         5yHTJs37S0pxt1PPYVaEgJH5DculJ893NsywPnKzATRAINBo4YXDVFdokavihp2aOzo6
         2KYdMStjrwO495WV/Vl3FoGk4rKB22Ged7I4Y2kNGds8Uz2D6Q3TdF/pv9gbWyyVZI/5
         dEhpr7VhuJtmIWts8yWDo2jsXrK1scjBxKDig2Xt/PV/Wt3hkMDvohITtliz84mGq52T
         CvSRWhqEn3fdGtCEhDLPrLqWNvkpZpvJ3KXB5QPIUV0645NncuPuie23fNrWpo1PCxJH
         0b/w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528868; x=1687120868;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v1fQSk/RLbZFkJkYGHhcGAHyHGBY0Hm//YIqjtLeCHA=;
        b=n2vqqqXHRhLItoLPewXJHpLaNnu7gPYXdmip7OBMvWz2K8+MlOElYnwpc2pDUT4diu
         Lb81Nm3anGXaA+FkLPk8osnz0RYvg0mniv1YfQePDS+934nlql+svRaqJz2EjDb1Zu/D
         wtb2SfHonN/EkR6qwU/gR+I9QMO/xKb9MFBEe1KUR4dMlyShYXA2qgaTvPPJ6RVVnJ3h
         VytdXi8L23NS/ZL/jFDYHl9T7V3IhJ+3o5r+wq49Aj/qEXhc9mYi0jkNZ9XB1KWiUQ9y
         X/WkUGX5NMsHdaJ+OdDtk2VVkjgDMhfs/DENKiIVzI14u86IXrEglLRwd92bIqFK3iAq
         z9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528868; x=1687120868;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v1fQSk/RLbZFkJkYGHhcGAHyHGBY0Hm//YIqjtLeCHA=;
        b=BqLbL2yz9bxBay1Oys5rrczWlpvGpgm8QCGHWOYtpQqYenI5YRxQH4l7ijQ+q9AlBk
         yy0NrKQjBWeyfiQtLT0N7ADj3GQmxFISfvY8HJSHiZwFzb71e3urwh3pepYqtoi6MOL4
         ZnMCpi+16wNBTgbTMhk2C3aKuaBtuj2A/qOhSE4Q6O1izD2G3e3CrZmJFRjsSlYiF7Nz
         szNx7mPtNHaCW0+L5lEhf6fkD1NfxGavDGSFrJlFhUU68d0gK0OM5eEHbVQFcldEF18C
         ubowB/+Fx6yNmcVLhsHTqsFWNgrdp+aTnU2TWjiqTjgB42brFq+paAzTeZubrVpPfYoj
         tICQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDyu/e2xjIGymwv8jnjlHERKBkjtYYQ41W5uuFGxcrUneO4u6gqj
	NM1qz1+fua3wIqIfY+5Y1FQ=
X-Google-Smtp-Source: ACHHUZ536gvBqB5IoVZU8xjhsdwHxO4MJY1v5xAB2AiGQDyCTDVTHBBkY2/+PxwcdYjDszuMqLjGmA==
X-Received: by 2002:a17:906:8a61:b0:930:af80:5ba6 with SMTP id hy1-20020a1709068a6100b00930af805ba6mr1100988ejc.1.1684528867992;
        Fri, 19 May 2023 13:41:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:d74e:0:b0:512:2392:3720 with SMTP id a14-20020aa7d74e000000b0051223923720ls306091eds.0.-pod-prod-02-eu;
 Fri, 19 May 2023 13:41:06 -0700 (PDT)
X-Received: by 2002:a05:6402:6c1:b0:50b:d34c:4710 with SMTP id n1-20020a05640206c100b0050bd34c4710mr2745631edy.5.1684528866081;
        Fri, 19 May 2023 13:41:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528866; cv=none;
        d=google.com; s=arc-20160816;
        b=iQG5GJXcPBt15sT6UH4egMsaZB16gd2rGLvNX5qMsSzUALyzFzJq0GwG8Wb/GG0FEh
         i4MlRK4bC45eUER3ko/rDPXBv9x9DajjwYiMWw+9HyFGzZWH1l2BBYHGz12/8xo953Ik
         VkvUoxbVXIFuDVB8posO2RD7JrcVGy3/WJMcK6n4lbCXLDvVsqSGg6IS2hDuaL2ExZmp
         HUN5jZqukEE8pNKeyfbIMxbL2eaItLs5UDLl6ognaIdou3GjB5SIRQKqA0R9ZQBxteVl
         HLMFdLHoALYJ2myc46Zd4jYixHNOnKXbGiJu2UdT6vYv+6D/ml+UXxsjCDtTryamSep1
         i1eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=MERHdLZSsKhyA5xezqbPhRoiFFWKUiVNCPLwRmDZHs8=;
        b=KcgXSacl/CXfhW6HTqnXWujlJaNN106ydG276Y5DWADbYbMRmjScNr3Z5Y3SUGljP/
         VUktZ5FFjCZg5IAEit8Xly5tMiXAvVrC9PlKo0G0WiBOruqpXF8stxAlzI8DeEhyupd0
         F8K8vf5HIzuVm/WaNwjhwW2g5WK5aUYKbpXUFImLs6ObMAQc8W+DDDKg9zkaJ7rwDoyb
         1nx4FgUkNA3Nc3bKwx5Ppdz+HkOfk1lN1saLJ9ndQjxMWmI5KQpaafI70vjtU1/f068g
         PeHJVmx0tTWynLjXHkFDQRWM83wIo0PSc4ktOfeeoN8xrJGo022mIiCwTVFwsxz137j9
         qbCQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id d31-20020a056402401f00b00506bc68cafasi19379eda.4.2023.05.19.13.41.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:41:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJds1FQZzxqS;
	Fri, 19 May 2023 22:41:05 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 65/73] core: riscv: aplic: introduce vIRQ support
Date: Fri, 19 May 2023 22:40:25 +0200
Message-Id: <20230519204033.643200-66-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __BUSINESS_SIGNATURE 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __COURIER_PHRASE 0, __CTE 0, __FRAUD_NEGATE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __PHISH_SPEAR_SUBJ_TEAM 0, __REFERENCES 0, __SANE_MSGID 0, __SHIPPING_PHRASE 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/aplic.c              | 147 ++++++++++++++++++++-
 hypervisor/arch/riscv/include/asm/cell.h   |  12 ++
 hypervisor/arch/riscv/include/asm/percpu.h |   1 +
 3 files changed, 159 insertions(+), 1 deletion(-)

diff --git a/hypervisor/arch/riscv/aplic.c b/hypervisor/arch/riscv/aplic.c
index 8a181a1e..1e6df407 100644
--- a/hypervisor/arch/riscv/aplic.c
+++ b/hypervisor/arch/riscv/aplic.c
@@ -253,13 +253,27 @@ passthru:
 
 static inline enum mmio_result aplic_handle_ienum(struct mmio_access *access)
 {
+	struct cell *cell = this_cell();
+	unsigned int target;
+
 	/* Spec: A read always returns zero */
 	if (!access->is_write) {
 		access->value = 0;
 		return MMIO_HANDLED;
 	}
 
-	if (!irqchip_irq_in_cell(this_cell(), access->value))
+	/* Here we are in the write case */
+	if (irqchip_virq_in_cell(cell, access->value)) {
+		target = access->value - cell->config->vpci_irq_base;
+		if (access->address == SETIENUM)
+			cell->arch.aplic_virq.enabled |= (1 << target);
+		else
+			cell->arch.aplic_virq.enabled &= ~(1 << target);
+
+		return MMIO_HANDLED;
+	}
+
+	if (!irqchip_irq_in_cell(cell, access->value))
 		return MMIO_ERROR;
 
 	if (access->address == SETIENUM)
@@ -280,6 +294,19 @@ aplic_handle_sourcecfg(struct mmio_access *access)
 	/* Check if the source IRQ belongs to the cell */
 	irq = (access->address - SOURCECFG_BASE) / IRQCHIP_REG_SZ + 1;
 
+	if (irqchip_virq_in_cell(this_cell(), irq)) {
+		/*
+		 * Actually, we don't need sourcecfg for vIRQs at all. Just
+		 * emulate some 'sane' behaviour.
+		 */
+		if (!access->is_write)
+			access->value = 6;
+		else if (access->value == 6 || !access->value)
+			return MMIO_HANDLED;
+
+		return MMIO_ERROR;
+	}
+
 	/* If not, simply ignore the access. */
 	if (!irqchip_irq_in_cell(this_cell(), irq)) {
 		if (!access->is_write)
@@ -317,6 +344,35 @@ static bool hart_in_cell(struct cell *cell, unsigned long hart)
 	return false;
 }
 
+static inline enum mmio_result
+aplic_handle_virq_target(struct mmio_access *access, unsigned int irq)
+{
+	struct cell *cell = this_cell();
+	unsigned int cpu, *virq_target;
+	unsigned long hart;
+	u32 target;
+
+	irq -= cell->config->vpci_irq_base;
+	virq_target = &cell->arch.aplic_virq.target[irq];
+
+	if (!access->is_write) {
+		access->value = public_per_cpu(*virq_target)->phys_id
+			<< TARGET_HART_SHIFT;
+		return MMIO_HANDLED;
+	}
+
+	target = access->value >> TARGET_HART_SHIFT;
+	for_each_cpu(cpu, &cell->cpu_set) {
+		hart = public_per_cpu(cpu)->phys_id;
+		if (hart == target) {
+			*virq_target = cpu;
+			return MMIO_HANDLED;
+		}
+	}
+
+	return MMIO_ERROR;
+}
+
 /* Assumption: We're in direct delivery mode */
 static inline enum mmio_result aplic_handle_target(struct mmio_access *access)
 {
@@ -327,6 +383,9 @@ static inline enum mmio_result aplic_handle_target(struct mmio_access *access)
 	/* Check if the source IRQ belongs to the cell */
 	irq = (access->address - TARGET_BASE) / IRQCHIP_REG_SZ + 1;
 
+	if (irqchip_virq_in_cell(cell, irq))
+		return aplic_handle_virq_target(access, irq);
+
 	/* If not, simply ignore the access. */
 	if (!irqchip_irq_in_cell(cell, irq)) {
 		if (!access->is_write)
@@ -477,9 +536,95 @@ static int aplic_init(void)
 	return 0;
 }
 
+static void aplic_register_virq(struct cell *cell, unsigned int irq)
+{
+	unsigned int *virq_target;
+	unsigned int index;
+
+	index = irq - cell->config->vpci_irq_base;
+	if (index >= APLIC_MAX_VIRQ) {
+		printk("FATAL: aplic: too much vIRQs\n");
+		panic_stop();
+	}
+
+	spin_lock(&cell->arch.virq_lock);
+	virq_target = &cell->arch.aplic_virq.target[index];
+	if (!cell_owns_cpu(cell, *virq_target))
+		*virq_target = first_cpu(&cell->cpu_set);
+
+	irq_bitmap_set(cell->arch.virq_present_bitmap, irq);
+	spin_unlock(&cell->arch.virq_lock);
+}
+
+static void aplic_unregister_virq(struct cell *cell, unsigned int irq)
+{
+	unsigned int index, cpu;
+
+	index = irq - cell->config->vpci_irq_base;
+
+	spin_lock(&cell->arch.virq_lock);
+	cell->arch.aplic_virq.enabled &= ~(1 << index);
+
+	for_each_cpu(cpu, &cell->cpu_set)
+		public_per_cpu(cpu)->virq.aplic_pending &= ~(1 << index);
+
+	irq_bitmap_clear(cell->arch.virq_present_bitmap, irq);
+	spin_unlock(&cell->arch.virq_lock);
+}
+
+static void aplic_send_virq(struct cell *cell, unsigned int irq)
+{
+	unsigned int index;
+	unsigned int target_cpu;
+	struct public_per_cpu *pcpu;
+
+	spin_lock(&cell->arch.virq_lock);
+	if (!irqchip_virq_in_cell(cell, irq)) {
+		printk("vIRQ not present in destination\n");
+		goto out;
+	}
+
+	index = irq - cell->config->vpci_irq_base;
+	target_cpu = cell->arch.aplic_virq.target[index];
+	pcpu = public_per_cpu(target_cpu);
+
+	pcpu->virq.aplic_pending |= (1 << index);
+
+	memory_barrier();
+	arch_send_event(pcpu);
+
+out:
+	spin_unlock(&cell->arch.virq_lock);
+}
+
+/* We must arrive with virq_lock being held */
+static bool aplic_inject_pending_virqs(void)
+{
+	struct cell *cell = this_cell();
+	unsigned int *pending;
+	unsigned int virq;
+
+	pending = &this_cpu_public()->virq.aplic_pending;
+	if (!*pending)
+		return false;
+
+	virq = ffsl(*pending);
+	*pending &= ~(1 << virq);
+
+	virq += cell->config->vpci_irq_base;
+	irqchip.pending[this_cpu_public()->phys_id] = virq << 16;
+
+	return true;
+}
+
 const struct irqchip irqchip_aplic = {
 	.init = aplic_init,
 	.claim_irq = aplic_claim_irq,
 	.adjust_irq_target = aplic_adjust_irq_target,
 	.mmio_handler = aplic_handler,
+
+	.register_virq = aplic_register_virq,
+	.unregister_virq = aplic_unregister_virq,
+	.send_virq = aplic_send_virq,
+	.inject_pending_virqs = aplic_inject_pending_virqs,
 };
diff --git a/hypervisor/arch/riscv/include/asm/cell.h b/hypervisor/arch/riscv/include/asm/cell.h
index ee3fd892..2d0002f6 100644
--- a/hypervisor/arch/riscv/include/asm/cell.h
+++ b/hypervisor/arch/riscv/include/asm/cell.h
@@ -19,12 +19,24 @@
 #include <jailhouse/types.h>
 #include <asm/spinlock.h>
 
+/* Only for APLIC. Current maximum: 32, as we use unsigned integers */
+#define APLIC_MAX_VIRQ	4
+#if APLIC_MAX_VIRQ >= 32
+#error "MAX_VIRQ can not be greater than 32"
+#endif
+
 struct arch_cell {
 	struct paging_structures mm;
 
+	/* Used by both, PLIC and APLIC */
 	u32 irq_bitmap[MAX_IRQS / (sizeof(u32) * 8)];
 	u32 virq_present_bitmap[MAX_IRQS / (sizeof(u32) * 8)];
 	spinlock_t virq_lock;
+
+	struct {
+		unsigned int target[APLIC_MAX_VIRQ];
+		unsigned int enabled;
+	} aplic_virq;
 };
 
 #endif /* !_JAILHOUSE_ASM_CELL_H */
diff --git a/hypervisor/arch/riscv/include/asm/percpu.h b/hypervisor/arch/riscv/include/asm/percpu.h
index c6dd8cb2..4eb88b57 100644
--- a/hypervisor/arch/riscv/include/asm/percpu.h
+++ b/hypervisor/arch/riscv/include/asm/percpu.h
@@ -46,6 +46,7 @@ enum sbi_hart_state {
 	struct {							\
 		u32 enabled_bitmap[MAX_IRQS / (sizeof(u32) * 8)];	\
 		u32 pending_bitmap[MAX_IRQS / (sizeof(u32) * 8)];	\
+		unsigned int aplic_pending;				\
 	} virq;
 
 #define ARCH_PERCPU_FIELDS
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-66-ralf.ramsauer%40oth-regensburg.de.
