Return-Path: <jailhouse-dev+bncBDUOFW62WYFBB3EGRGPQMGQE4HZBHYQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9C868D69D
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:20 +0100 (CET)
Received: by mail-wm1-x33d.google.com with SMTP id s11-20020a05600c384b00b003dffc7343c3sf2884385wmr.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:20 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772780; cv=pass;
        d=google.com; s=arc-20160816;
        b=hoAxkGfEFtx/w3yRZkRsKOhwO3iTIV6JyICc4o2V8WMwwhvwSU8o9ffWAcfzA7SCxO
         B5F1tKrTR7D/7oCCwXxis0qjyZS0EKeZ2PR8st1Ylt8Nc9hCQPeqzL05C3S7A2jNZrlo
         4vBDX3rJrXrwFbjAxpSxWBYUNsqInQQAkAqGH49YNgZJotafu94RNTxd2Ga4Sw+8kux1
         bPw2UrIjT6MIX3cVSuBC1K82P73WQlONSx8yfWsZUml8G//NP44UfGkne7Ozz86Aymq2
         /I31I2bDxOrCzzbdSUIpcAYXGLC8txwk7JhboYqx23Z2UET5JBJzR0wsG1JFmbu03LYW
         ku1w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=qUVB5ytLKBMizyCnpSpvDMoQXYw2bg1OnuYZTU+Z5rI=;
        b=bjV6aRcMRPHvWIkMFw7oZThhVHfKhfHocoU4Zmw/C+nIg992r+aKjxyA/42AGpQ9vM
         oztquIN0H0Y/QHqPGlWurDK5T0YKx2I8TE+vQ9WimB3sVfj0oOow2idsC6KyAVHPfhmd
         YSzH/jcR4ERNAJ5FSNIf+sTkZpIFd3ayuQ3r5es3B+jvMgCz2zBdRQkJKsUVILfepxjD
         j59jgcjEYdTPTiUY+93WEIx8nTz8y4Xdklf2eMyV9QYsOn468QAKpVlKSUUPOASRgW22
         hRyl6vWGMJYTYC/Ergx+5/9laDyUALItEJNoPN7WX3hPlvG43De4eeAGGbTJWH5krAhF
         BzWQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qUVB5ytLKBMizyCnpSpvDMoQXYw2bg1OnuYZTU+Z5rI=;
        b=nQBqvzJrnMJZBsS21bz7G07PdsR5vMPAZsi367Zz83lYO9ErAdqDGYf8s/mKQ1K76o
         96NHHtQzTfRz0sBeq1S84+0kEmrIbAhjlf3rIW95luIlgUQ5+liktc6xDfjJOjvJEx6k
         2NVyOzvqF5eLZ9xeSo6UpDz434noGQTiTbD2anfAtGgWxbopWBz3sEccH8eKzAQwoC2C
         eyX7cvbdry0qehBIH04Xj4sMNAvbolNPrLZDtpKj6RvM0HFgNOHK9VnfQNxqT/xxu8js
         Jpx9PtH0l9s9zWoC/tbEdFeaS/Pa+7X0CosBp7GvLaO+G16vGn5Ud83W6dgRd2n700Xj
         w4cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qUVB5ytLKBMizyCnpSpvDMoQXYw2bg1OnuYZTU+Z5rI=;
        b=TAQBZXAebqfOl+tO22PAJ39BA4zMhskDrUQ7v5lQiqCvbB9KwUMiye+cL9HEP9RaqH
         0CkY+3oKviwff1VdvmfQvod47FWTPabiWpoSyvOKt0LcDrZU1NSnA+Bk0Kxm+vArHiAD
         6UV+uoyBMs8kD3faBb/NkcuiYYzjttmw1SDdT+hebKsy+a4w0DE/+bxARb+hsIG7Yhcn
         retOLXjFHT5gCNuSdnrRVBeuQFb1JkbCMQXD10Q4F5WoW3QNM1V8RA9s2t/uoHq0WG+f
         ww/lVsP2z3D3xdSO9LS+i8Oj1cHGFaOYSuxcrdH6Dk0rC484rfRmrP63L0cwIxuZr01u
         BiAw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKWrA44GFLFcHcPhylr14z2jtWXNKhYcg4DJ1BNPi2QwcOUI6nxK
	ZsnoN+Dl/uykzauz7+978sg=
X-Google-Smtp-Source: AK7set+R1K42NK1+HvygMUl5qhu7B9q7CLqYmK7EfWU+Rmvm2gNO/x4kPMwrGFjan4YE3Ke+/pEoSQ==
X-Received: by 2002:a7b:c411:0:b0:3d0:a089:4d6b with SMTP id k17-20020a7bc411000000b003d0a0894d6bmr234355wmi.78.1675772780515;
        Tue, 07 Feb 2023 04:26:20 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:5b19:0:b0:2bf:ae0c:669b with SMTP id bx25-20020a5d5b19000000b002bfae0c669bls21047784wrb.2.-pod-prod-gmail;
 Tue, 07 Feb 2023 04:26:19 -0800 (PST)
X-Received: by 2002:a5d:4601:0:b0:2bf:ee65:b0b0 with SMTP id t1-20020a5d4601000000b002bfee65b0b0mr2434371wrq.41.1675772778936;
        Tue, 07 Feb 2023 04:26:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772778; cv=none;
        d=google.com; s=arc-20160816;
        b=OVGpzl9GR7noEWM3BI9xYLHtwBpIiVe7xyx3Cm5l1f6p1nlDw0xx9HHBFx3mAbI1Nx
         FeMqxgzjPDmtbKxuLMV9J/83h+rTG50AO9maHo8INDoA5gPmI3CiCI9rXKm9nb0pSusg
         E9IR/j+vjPY/KKzYZDDpyQ02RdWs/Oa0HaahCz7WtvqMJQRzzh7sqrOq5B2zmVjGb/gU
         ANXjubvXm5csjWM4LrBXnuVfFxPuZ3WTUbzZGM4Q/EBRHYAf7LcDwNVYIh8UJKFV1YCv
         GOSRWdyYTb1XAgQu6dz/jCH+yTP8IcaQsGxhvfXDk/6yf496meb7beMhPYqTJK0uhVTy
         Br9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=OXj7YcQiXtfLeQw1pJqNT0KpU/wM1pEf4o9fTtV/Gx8=;
        b=IN/15HJ77OEdsr6z2e66ko4TK/RBUrl1Qx4BwrY7V9ntLM2r27M6K2losmkRdim6aa
         oAxX5sdoCDc9YKigZ8arOGfE5USuIiiB0K0cZ8GLuKOZTFqsjHkjRISEeuiEPqUCO7Lg
         LIimv/geQUgxJtD4yybY/bqX7upNbuSONSQqBbevOAxv0a+XWWWlzdskbqKsGzZw3C+O
         iDxO9gVLRgIdaAm8nsXVren1qObQvNOxvEc7iWDGCBa5MmSjN0lBL6/n6oVS8mCJPzJb
         kQe8wytd6SPjNnF5weLbvZHyrRSu/RYMH3tMQBee0kxAv48yQb4xGuaK6bLR9UWaNLvP
         uVcA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id v14-20020a056000144e00b0024222ed1370si543719wrx.3.2023.02.07.04.26.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:18 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RZ3606z1075;
	Tue,  7 Feb 2023 13:26:18 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v2 46/47] core: riscv: aplic: introduce vIRQ support
Date: Tue,  7 Feb 2023 13:25:42 +0100
Message-Id: <20230207122543.1128638-47-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __BUSINESS_SIGNATURE 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __COURIER_PHRASE 0, __CTE 0, __FRAUD_NEGATE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __PHISH_SPEAR_SUBJ_TEAM 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0,
 __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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
 hypervisor/arch/riscv/aplic.c              | 140 ++++++++++++++++++++-
 hypervisor/arch/riscv/include/asm/cell.h   |  12 ++
 hypervisor/arch/riscv/include/asm/percpu.h |   1 +
 3 files changed, 151 insertions(+), 2 deletions(-)

diff --git a/hypervisor/arch/riscv/aplic.c b/hypervisor/arch/riscv/aplic.c
index 94111885..6bb3d95c 100644
--- a/hypervisor/arch/riscv/aplic.c
+++ b/hypervisor/arch/riscv/aplic.c
@@ -227,15 +227,39 @@ passthru:
 	return MMIO_HANDLED;
 }
 
+static inline void irqchip_disable_virq(unsigned int cpu, unsigned int virq)
+{
+	irq_bitmap_clear(public_per_cpu(cpu)->virq.enabled_bitmap, virq);
+}
+
+static inline void irqchip_enable_virq(unsigned int cpu, unsigned int virq)
+{
+	irq_bitmap_set(public_per_cpu(cpu)->virq.enabled_bitmap, virq);
+}
+
 static enum mmio_result aplic_handle_ienum(struct mmio_access *access)
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
 
 	aplic_passthru(access);
@@ -250,6 +274,19 @@ static enum mmio_result aplic_handle_sourcecfg(struct mmio_access *access)
 	/* Check if the source IRQ belongs to the cell */
 	source = (access->address - SOURCECFG_BASE) / IRQCHIP_REG_SZ + 1;
 
+	if (irqchip_virq_in_cell(this_cell(), source)) {
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
 	if (!irqchip_irq_in_cell(this_cell(), source)) {
 		if (!access->is_write)
@@ -287,13 +324,36 @@ static bool hart_in_cell(struct cell *cell, unsigned long hart)
 /* Assumption: We're in direct delivery mode */
 static enum mmio_result aplic_handle_target(struct mmio_access *access)
 {
-	unsigned int source;
+	unsigned int cpu, source, *virq_target;
 	struct cell *cell = this_cell();
+	unsigned long hart;
 	u32 target;
 
 	/* Check if the source IRQ belongs to the cell */
 	source = (access->address - TARGET_BASE) / IRQCHIP_REG_SZ + 1;
 
+	if (irqchip_virq_in_cell(cell, source)) {
+		source -= cell->config->vpci_irq_base;
+		virq_target = &cell->arch.aplic_virq.target[source];
+
+		if (!access->is_write) {
+			access->value = public_per_cpu(*virq_target)->phys_id
+				<< TARGET_DM_HART_SHIFT;
+			return MMIO_HANDLED;
+		}
+
+		target = access->value >> TARGET_DM_HART_SHIFT;
+		for_each_cpu(cpu, &cell->cpu_set) {
+			hart = public_per_cpu(cpu)->phys_id;
+			if (hart == target) {
+				*virq_target = cpu;
+				return MMIO_HANDLED;
+			}
+		}
+
+		return MMIO_ERROR;
+	}
+
 	/* If not, simply ignore the access. */
 	if (!irqchip_irq_in_cell(cell, source)) {
 		if (!access->is_write)
@@ -436,9 +496,85 @@ static int aplic_init(void)
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
+	virq_target = &cell->arch.aplic_virq.target[index];
+	if (!cell_owns_cpu(cell, *virq_target))
+		*virq_target = first_cpu(&cell->cpu_set);
+
+	irq_bitmap_set(cell->arch.virq_present_bitmap, irq);
+}
+
+static void aplic_unregister_virq(struct cell *cell, unsigned int irq)
+{
+	unsigned int index, cpu;
+
+	index = irq - cell->config->vpci_irq_base;
+	cell->arch.aplic_virq.enabled &= ~(1 << index);
+
+	for_each_cpu(cpu, &cell->cpu_set)
+		public_per_cpu(cpu)->virq.aplic_pending &= ~(1 << index);
+
+	irq_bitmap_clear(cell->arch.virq_present_bitmap, irq);
+}
+
+static void aplic_send_virq(struct cell *cell, unsigned int irq)
+{
+	unsigned int index;
+	unsigned int target_cpu;
+	struct public_per_cpu *pcpu;
+
+	if (!irqchip_virq_in_cell(cell, irq)) {
+		printk("vIRQ not present in destination\n");
+		return;
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
+}
+
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
index 8bfbef8a..3a378085 100644
--- a/hypervisor/arch/riscv/include/asm/cell.h
+++ b/hypervisor/arch/riscv/include/asm/cell.h
@@ -18,11 +18,23 @@
 #include <jailhouse/paging.h>
 #include <jailhouse/types.h>
 
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
2.39.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230207122543.1128638-47-ralf.ramsauer%40oth-regensburg.de.
