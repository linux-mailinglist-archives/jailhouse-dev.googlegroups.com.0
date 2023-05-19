Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBZV5T6RQMGQEX6XSQJI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id 631B970A0F7
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:41:11 +0200 (CEST)
Received: by mail-wr1-x43e.google.com with SMTP id ffacd0b85a97d-3078df8ae31sf2476226f8f.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:41:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528871; cv=pass;
        d=google.com; s=arc-20160816;
        b=NJg7+SM+reucfzVcnHYlX5MRViDrkFbHZnWON1fJL3tWFofVG/3Bk0woVypHU3cxnl
         ur44oumlDfkqugX0anHRPFMkIGYfVhR8x8VekkLbsXZOI+Dh4LggPpZjbMRRZRAPwKI2
         A9dWCC/Y2a6VFymAwUoKC7ek3Mio0iw49ozPaFSx2gazI/rt8CV3O811zo0Y+APtIXaq
         Traw/RJ/KScArOBvB5mtFpYVIJR7Tsae5Pdv4dhBZy7Ys/WbXHUY4U60z0WlU5eGXXEC
         KaV+cMr/Iod57QzFpfKlu3AfA8bYG9cBhzQTQdtrX/UCAjtLDfQX7+aYAbAOCJMO23RP
         gxWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=4ogYvaoJ8Oi2jzu+/izAQ9kmCgJh41eysXb9JpWjeqc=;
        b=f676tSfa1Ix6qQ1dWbaiP6jowkWUMicBgBKDXnjKUi48MAmbjU6cFElP13PSWfeiiP
         UH9E/MaU7aMUtzuyJz7bOtuDW1ZSCLtlIEN4tsxXMCPl9hCoFe9Jf89BuNoMB5U4YYi4
         RFhTlM0wOswIDjiaE7Ko/17O28Ecp1BYoR6E4hqgfrGsUPNHjkQfJ6jdm8pNd460i22q
         S/rwrooESU0raIBkDRVmW4cQpdGXtQtCDuElfeAiw3z8FEskFwE0lLNwxICuq0qMcWnV
         UcfVa2+NgLxJsDLC3eyadKbs+BOp1ny0/apdBmV0z+T9w1r6pwUgmNT48ceTZmPDgZKt
         1UGA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528871; x=1687120871;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ogYvaoJ8Oi2jzu+/izAQ9kmCgJh41eysXb9JpWjeqc=;
        b=Kiko8s9kl2sI1Xox49odlBqSms3bTgM/Av9mQQvC0Eq/ScFR+DUIJ0IpM++/yOyg7j
         m5f61iosBrpfS1UVJCQfVLKu4lqlryeVmZ+mJjG5fCzhOzoN7riC+nH4XfXAxwaopqDK
         slPYwrju54Y0wqLVaYeIrfFW30G3D80RPVW4bh6rQuYmfALWFuYtlxbe05jiq1RAEpcL
         P5pyaOtQSPbtcbxw0KVoEWZ5kAVkKEsU9ym9rK9Ccs3HMSSoPR0o59t/1KjGEUc2be9k
         12hOITEi0RIJTb+uk8Jfi5vFDOCPM4MLrS5mNCuEV3e3Xbt1UnXMSrB9nXeAcrEQTSN1
         +Oag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528871; x=1687120871;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ogYvaoJ8Oi2jzu+/izAQ9kmCgJh41eysXb9JpWjeqc=;
        b=GEiWEBE6dV6D+wBql2Acqojw0iC0zGNRB0J29YmfwhLrzjoK+SYkRMVpiYTKZmHez4
         wTkCNXky+tzaBjAOikCWqaKW85azW1wEaQrZNQOpPbaQUA6HUPmm/ZRGEhu1NmxIvIgP
         o6Xozcu0xAwcfyGWQ73RHHTaSs3AdluNtpz/MDDYUyAxO6v2beOBxcjTv69T7HQzL0AV
         Ry8mBS73zvZlD7Cp1EfeGnYIxfy2+y/A2peuiW2GQOu5wawnQJbRgUvt76pIey36FBCW
         +xz8rtGYgHnJ+EFc8aqxKmwNd7EV+bTo31aBNntBx0no5iTk8JvICGWygaWaXXJfbJjm
         NqyQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDxEZXP8a2M5+KMzOLCCEEgjLDvc/xJZAgfp02syYt9aAHv/ya0q
	1mlncZOWCS/232JxSsNW4ew=
X-Google-Smtp-Source: ACHHUZ65MJ9m1ecu2g9ttCxpJRmYeboR/XSWdkxf+2o3xB5s82AWvUuuULGUNKfyyNTfLe03ZPBzJA==
X-Received: by 2002:a05:6000:cd:b0:2f7:49cf:2b75 with SMTP id q13-20020a05600000cd00b002f749cf2b75mr582081wrx.7.1684528870880;
        Fri, 19 May 2023 13:41:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:1da1:b0:3f4:f1c0:4e20 with SMTP id
 p33-20020a05600c1da100b003f4f1c04e20ls1510326wms.0.-pod-prod-06-eu; Fri, 19
 May 2023 13:41:09 -0700 (PDT)
X-Received: by 2002:a7b:cb97:0:b0:3f4:253b:92b3 with SMTP id m23-20020a7bcb97000000b003f4253b92b3mr2147735wmi.18.1684528869319;
        Fri, 19 May 2023 13:41:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528869; cv=none;
        d=google.com; s=arc-20160816;
        b=HShbtFeFulryNYmQpXeKgtcR/VxhsK0Qlqp+Ki3kBeY/c4ckrtVKa6/PLgaquB3VEA
         5ISDyUqxCvVIrNiqeoF9yfh0vQ0JdyFgAtBQgU1l2jrBs7zdyAkZj5w9VuCOZnMgvz2U
         X0I+Gc8SuWRVUxQqZxBnkhmVZW5qeHOCc0wVVK3T6AAdi/c0Vdq4yBOsu+bap5kln9Vd
         cHK1wVZgTIg/dBVq7vMp3K2fmQ0bUQWC82gjf7IYSD6Dql/I92x0nG3W/7Ta2LjZw/3t
         4karHDoHIpyvKzQ7eSAjQ2y0PV6kjjKMcOS71wupYOtDmVw3rO2bqQ9gwxi4bHibdPXz
         H7vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=qw8zDGY8oOZDNikbf+yZumre25nv1PiBI9P3Mf3N8Ww=;
        b=XZc2xuWOnbwCXSM5yD+5cCC7NywH7GCA/Dk5qZk2rP91Y/nnzGg4Trs51c7Z7jE3al
         C4z8gYF5wCNWl/N2Z++AIt3xmf70FsDO+12zwR80DTdIoKUS1eLnQTi8czdSmK/Ft3Jx
         KWV+3eNH4MdxzxDMwJytm1JX8UT+V6fDuQKi/0KBtyRHEJ80iVqxzZmYTjogYyUM4uhb
         DACPSewk5WiLyDMsI1500FcTN17/J5U5AOp0RHu7lMXRqVgg08iV4qJf3KWjg2F8O33q
         6v3+FqkA6z8wzuciclOxBlDnRUISXz4Ai/Cu+vl8cTJJOG2Lq7auMla5zL0MqQmrcjms
         ewFQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id co6-20020a0560000a0600b003062765f97esi377422wrb.6.2023.05.19.13.41.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:41:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdw2HR8zyNt;
	Fri, 19 May 2023 22:41:08 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 69/73] core: riscv: aplic: Add IMSIC support
Date: Fri, 19 May 2023 22:40:29 +0200
Message-Id: <20230519204033.643200-70-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_10000_PLUS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __BUSINESS_SIGNATURE 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __COURIER_PHRASE 0, __CTE 0, __FRAUD_NEGATE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __PASSWORD_IN_BODY 0, __PHISH_SPEAR_SUBJ_TEAM 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_25 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0,
 __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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

With IMSIC, we achieve zero-traps for interrupts, if we don't have
level-triggered legacy IRQs. Latter one require some special handling
through the APLIC.

With this patch, we also have support for IVSHMEM interrupts: In case of
an IMSIC, we simply inject the pending irq on the target. Only one trap
is required: for sending the IRQ.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/aplic.c               | 202 ++++++++++++++++++--
 hypervisor/arch/riscv/include/asm/cell.h    |   1 +
 hypervisor/arch/riscv/include/asm/irqchip.h |   1 +
 hypervisor/arch/riscv/irqchip.c             |   2 +
 hypervisor/arch/riscv/plic.c                |   5 +
 hypervisor/arch/riscv/setup.c               |   8 +-
 6 files changed, 197 insertions(+), 22 deletions(-)

diff --git a/hypervisor/arch/riscv/aplic.c b/hypervisor/arch/riscv/aplic.c
index 1e6df407..240d6904 100644
--- a/hypervisor/arch/riscv/aplic.c
+++ b/hypervisor/arch/riscv/aplic.c
@@ -33,6 +33,13 @@
 
 #define TARGET_BASE		0x3004
 #define TARGET_HART_SHIFT	18
+#define TARGET_GUEST_SHIFT	12
+#define TARGET_GUEST_MSK	BIT_MASK(17, 12)
+#define TARGET_PRIO_MSK		BIT_MASK(7, 0)
+#define TARGET_EIID_MSK		BIT_MASK(10, 0)
+
+#define IN_CLRIP_START		0x1d00
+#define IN_CLRIP_END		(0x1d7c + IRQCHIP_REG_SZ)
 
 #define SETIE_BASE		0x1e00
 #define SETIENUM		0x1edc
@@ -41,11 +48,15 @@
 #define CLRIE_END		(0x1f7c + IRQCHIP_REG_SZ)
 #define CLRIENUM		0x1fdc
 
+#define SETIPNUM_LE		0x2000
+
 /* Per-Hart Interrupt Delivery Control (IDC) */
 #define IDC_BASE		0x4000
 #define IDC_SIZE		0x20
 #define  IDC_CLAIMI		0x1c
 
+static void *imsic;
+
 /*
  * When destroying cells, legacy IRQs need to be assigned back to the root
  * cell. Therefore, we need to keep track of their previous state: The target,
@@ -134,7 +145,13 @@ static void aplic_adjust_irq_target(struct cell *cell, unsigned int irq)
 
 	/* We have to adjust the IRQ. Locate it on the first CPU of the cell */
 	hart_index = public_per_cpu(first_cpu(&cell->cpu_set))->phys_id;
-	target = (hart_index << TARGET_HART_SHIFT) | (target & 0xff);
+
+	target = (hart_index << TARGET_HART_SHIFT);
+	if (imsic)
+		target |= (cell->arch.vs_file << TARGET_GUEST_SHIFT) |
+			  (target & TARGET_EIID_MSK);
+	else
+		target |= (target & TARGET_PRIO_MSK); /* preserve priority */
 
 	aplic_write_target(irq, target);
 }
@@ -155,6 +172,9 @@ static int aplic_claim_irq(void)
 	unsigned int hart;
 	u32 claimi;
 
+	if (imsic)
+		return -EINVAL;
+
 	hart = phys_processor_id();
 
 	claimi = aplic_read_claimi(hart);
@@ -207,6 +227,9 @@ static inline enum mmio_result aplic_handle_idc(struct mmio_access *access)
 	unsigned long hart;
 	unsigned int cpu, idc, reg;
 
+	if (imsic)
+		return MMIO_ERROR;
+
 	idc = (access->address - IDC_BASE) / IDC_SIZE;
 	reg = access->address % IDC_SIZE;
 
@@ -356,29 +379,38 @@ aplic_handle_virq_target(struct mmio_access *access, unsigned int irq)
 	virq_target = &cell->arch.aplic_virq.target[irq];
 
 	if (!access->is_write) {
-		access->value = public_per_cpu(*virq_target)->phys_id
-			<< TARGET_HART_SHIFT;
+		access->value = public_per_cpu(*virq_target)->phys_id <<
+				TARGET_HART_SHIFT;
+		if (imsic)
+			access->value |= cell->arch.aplic_virq.eiid[irq];
 		return MMIO_HANDLED;
 	}
 
 	target = access->value >> TARGET_HART_SHIFT;
+
 	for_each_cpu(cpu, &cell->cpu_set) {
 		hart = public_per_cpu(cpu)->phys_id;
-		if (hart == target) {
-			*virq_target = cpu;
-			return MMIO_HANDLED;
-		}
+		if (hart == target)
+			goto write_allowed;
 	}
 
 	return MMIO_ERROR;
+
+write_allowed:
+	*virq_target = cpu;
+	if (imsic) {
+		cell->arch.aplic_virq.eiid[irq] =
+			access->value & TARGET_EIID_MSK;
+	}
+
+	return MMIO_HANDLED;
 }
 
-/* Assumption: We're in direct delivery mode */
 static inline enum mmio_result aplic_handle_target(struct mmio_access *access)
 {
 	struct cell *cell = this_cell();
 	unsigned int irq;
-	u32 target;
+	u32 target, value;
 
 	/* Check if the source IRQ belongs to the cell */
 	irq = (access->address - TARGET_BASE) / IRQCHIP_REG_SZ + 1;
@@ -393,9 +425,12 @@ static inline enum mmio_result aplic_handle_target(struct mmio_access *access)
 		return MMIO_HANDLED;
 	}
 
-	/* If read, then pass through */
+	/* If read, then pass through, but take care on the guest index */
 	if (!access->is_write) {
 		access->value = aplic_read(access->address);
+		if (imsic)
+			access->value &= ~TARGET_GUEST_MSK;
+
 		return MMIO_HANDLED;
 	}
 
@@ -406,8 +441,19 @@ static inline enum mmio_result aplic_handle_target(struct mmio_access *access)
 	 * Linux initialises all targets with default priorities, even if the
 	 * IRQ doesn't belong to it. Just return success.
 	 */
-	if (hart_in_cell(cell, target))
-		aplic_passthru(access);
+	if (!hart_in_cell(cell, target))
+		return MMIO_HANDLED;
+
+	value = access->value;
+	if (imsic) {
+		value &= ~TARGET_GUEST_MSK;
+		value |= cell->arch.vs_file << TARGET_GUEST_SHIFT;
+	}
+	aplic_write(access->address, value);
+
+	/* Store the shadow, if we're on the root cell */
+	if (cell == &root_cell)
+		shadow.target[irq] = value;
 
 	return MMIO_HANDLED;
 }
@@ -433,6 +479,8 @@ static inline enum mmio_result aplic_handle_clrie(struct mmio_access *access)
 static inline enum mmio_result
 aplic_handle_domaincfg(struct mmio_access *access)
 {
+	u32 restricted_mask;
+
 	/*
 	 * Domaincfg is handled as follows: We can not allow guests to globally
 	 * disable IRQs (i.e., modify the IE bit of the APLIC) as this would
@@ -447,15 +495,62 @@ aplic_handle_domaincfg(struct mmio_access *access)
 	 */
 	 if (!access->is_write) {
 		access->value = DOMAINCFG_DEFAULT;
+		if (imsic)
+			access->value |= (1 << DOMAINCFG_DM);
 		return MMIO_HANDLED;
 	}
 
-	if (access->value & ((1 << DOMAINCFG_DM) | (1 << DOMAINCFG_BE)))
+	restricted_mask = (1 << DOMAINCFG_BE);
+	if (!imsic)
+		restricted_mask |= (1 << DOMAINCFG_DM);
+
+	if (access->value & restricted_mask)
+		return MMIO_ERROR;
+
+	return MMIO_HANDLED;
+}
+
+static inline enum mmio_result aplic_in_clrip(struct mmio_access *access)
+{
+	unsigned int no;
+	no = (access->address - IN_CLRIP_START) / IRQCHIP_REG_SZ;
+	u32 bitmap;
+
+	/* Not implemented as never seen */
+	if (!imsic)
+		return MMIO_ERROR;
+
+	/* Not implemented as never seen */
+	if (access->is_write)
 		return MMIO_ERROR;
 
+	/* Read case */
+	bitmap = this_cell()->arch.irq_bitmap[no];
+	access->value = aplic_read(access->address);
+	access->value = access->value & bitmap;
+
 	return MMIO_HANDLED;
 }
 
+static inline enum mmio_result aplic_setipnum(struct mmio_access *access)
+{
+	/* Not implemented as never seen */
+	if (!imsic)
+		return MMIO_ERROR;
+
+	if (!access->is_write) {
+		access->value = 0;
+		return MMIO_HANDLED;
+	}
+
+	if (irqchip_irq_in_cell(this_cell(), access->value)) {
+		aplic_passthru(access);
+		return MMIO_HANDLED;
+	}
+
+	return MMIO_ERROR;
+}
+
 static enum mmio_result aplic_handler(void *arg, struct mmio_access *access)
 {
 	enum mmio_result res = MMIO_ERROR;
@@ -465,17 +560,25 @@ static enum mmio_result aplic_handler(void *arg, struct mmio_access *access)
 		res = aplic_handle_domaincfg(access);
 		break;
 
+	case REG_RANGE(SOURCECFG_BASE, SOURCECFG_END):
+		res = aplic_handle_sourcecfg(access);
+		break;
+
 	case REGISTER(SETIENUM):
 	case REGISTER(CLRIENUM):
 		res = aplic_handle_ienum(access);
 		break;
 
-	case REG_RANGE(CLRIE_START, CLRIE_END):
-		res = aplic_handle_clrie(access);
+	case REGISTER(SETIPNUM_LE):
+		res = aplic_setipnum(access);
 		break;
 
-	case REG_RANGE(SOURCECFG_BASE, SOURCECFG_END):
-		res = aplic_handle_sourcecfg(access);
+	case REG_RANGE(IN_CLRIP_START, IN_CLRIP_END):
+		res = aplic_in_clrip(access);
+		break;
+
+	case REG_RANGE(CLRIE_START, CLRIE_END):
+		res = aplic_handle_clrie(access);
 		break;
 
 	case REG_RANGE(TARGET_BASE, IDC_BASE):
@@ -496,16 +599,36 @@ static enum mmio_result aplic_handler(void *arg, struct mmio_access *access)
 	return res;
 }
 
+static void migrate_irq(unsigned int irq, u32 file)
+{
+	u32 value;
+
+	value = aplic_read_target(irq) & ~TARGET_GUEST_MSK;
+	value |= file << TARGET_GUEST_SHIFT;
+	aplic_write_target(irq, value);
+}
+
 static int aplic_init(void)
 {
-	unsigned short irq;
+	unsigned short irq, vs_file;
 	u32 sourcecfg;
 	bool enabled;
 
-	/* Disallow MSI & Delegations for the moment */
+	vs_file = this_cell()->arch.vs_file;
 	if (aplic_read(DOMAINCFG) & (1 << DOMAINCFG_DM)) {
-		printk("MSI Delivery mode not supported!\n");
-		return -ENOSYS;
+		if (!vs_file) {
+			printk("FATAL: MSI Delivery enabled, "
+			       "but no VS-file specified.\n");
+			return -EINVAL;
+		}
+		imsic = paging_map_device(imsic_base(), imsic_size());
+		if (!imsic)
+			return -ENOMEM;
+
+	} else if (vs_file) {
+		printk("FATAL: VS-file specified, while MSI "
+		       "delivery mode not enabled\n");
+		return -EINVAL;
 	}
 
 	/*
@@ -522,6 +645,9 @@ static int aplic_init(void)
 
 		enabled = aplic_irq_is_enabled(irq);
 		if (irqchip_irq_in_cell(&root_cell, irq)) {
+			if (imsic)
+				migrate_irq(irq, vs_file);
+
 			shadow.sourcecfg[irq] = sourcecfg;
 			shadow.target[irq] = aplic_read_target(irq);
 			if (enabled)
@@ -572,6 +698,15 @@ static void aplic_unregister_virq(struct cell *cell, unsigned int irq)
 	spin_unlock(&cell->arch.virq_lock);
 }
 
+static void
+imsic_inject_irq(unsigned long hart, unsigned int file, unsigned int eiid)
+{
+	void *target;
+
+	target = imsic + hart * imsic_stride_size() + file * 0x1000;
+	mmio_write32(target, eiid);
+}
+
 static void aplic_send_virq(struct cell *cell, unsigned int irq)
 {
 	unsigned int index;
@@ -588,6 +723,12 @@ static void aplic_send_virq(struct cell *cell, unsigned int irq)
 	target_cpu = cell->arch.aplic_virq.target[index];
 	pcpu = public_per_cpu(target_cpu);
 
+	if (imsic) {
+		imsic_inject_irq(target_cpu, cell->arch.vs_file,
+				 cell->arch.aplic_virq.eiid[index]);
+		goto out;
+	}
+
 	pcpu->virq.aplic_pending |= (1 << index);
 
 	memory_barrier();
@@ -604,6 +745,9 @@ static bool aplic_inject_pending_virqs(void)
 	unsigned int *pending;
 	unsigned int virq;
 
+	if (imsic)
+		return false;
+
 	pending = &this_cpu_public()->virq.aplic_pending;
 	if (!*pending)
 		return false;
@@ -617,8 +761,24 @@ static bool aplic_inject_pending_virqs(void)
 	return true;
 }
 
+static void aplic_shutdown(void)
+{
+	unsigned short irq;
+
+	if (!imsic)
+		return;
+
+	/* Migrate VS-Mode IRQs back to S-Mode */
+	for (irq = 1; irq < irqchip_max_irq(); irq++)
+		if (irqchip_irq_in_cell(&root_cell, irq))
+			migrate_irq(irq, 0);
+
+	paging_unmap_device(imsic_base(), imsic, imsic_size());
+}
+
 const struct irqchip irqchip_aplic = {
 	.init = aplic_init,
+	.shutdown = aplic_shutdown,
 	.claim_irq = aplic_claim_irq,
 	.adjust_irq_target = aplic_adjust_irq_target,
 	.mmio_handler = aplic_handler,
diff --git a/hypervisor/arch/riscv/include/asm/cell.h b/hypervisor/arch/riscv/include/asm/cell.h
index 2f1cfbd4..50f8ad10 100644
--- a/hypervisor/arch/riscv/include/asm/cell.h
+++ b/hypervisor/arch/riscv/include/asm/cell.h
@@ -35,6 +35,7 @@ struct arch_cell {
 
 	struct {
 		unsigned int target[APLIC_MAX_VIRQ];
+		unsigned int eiid[APLIC_MAX_VIRQ];
 		unsigned int enabled;
 	} aplic_virq;
 
diff --git a/hypervisor/arch/riscv/include/asm/irqchip.h b/hypervisor/arch/riscv/include/asm/irqchip.h
index 6b135712..00846b92 100644
--- a/hypervisor/arch/riscv/include/asm/irqchip.h
+++ b/hypervisor/arch/riscv/include/asm/irqchip.h
@@ -25,6 +25,7 @@
 
 struct irqchip {
 	int (*init)(void);
+	void (*shutdown)(void);
 	enum mmio_result (*mmio_handler)(void *arg, struct mmio_access *access);
 	int (*claim_irq)(void);
 	void (*adjust_irq_target)(struct cell *cell, unsigned int irq);
diff --git a/hypervisor/arch/riscv/irqchip.c b/hypervisor/arch/riscv/irqchip.c
index 9834dcee..de09177f 100644
--- a/hypervisor/arch/riscv/irqchip.c
+++ b/hypervisor/arch/riscv/irqchip.c
@@ -167,6 +167,8 @@ static void irqchip_shutdown(void)
 	if (!irqchip.base)
 		return;
 
+	irqchip.shutdown();
+
 	paging_unmap_device(irqchip_phys(), irqchip.base, irqchip_size());
 }
 
diff --git a/hypervisor/arch/riscv/plic.c b/hypervisor/arch/riscv/plic.c
index 30abe7d9..84e98436 100644
--- a/hypervisor/arch/riscv/plic.c
+++ b/hypervisor/arch/riscv/plic.c
@@ -477,8 +477,13 @@ out:
 	spin_unlock(&cell->arch.virq_lock);
 }
 
+static void plic_shutdown(void)
+{
+}
+
 const struct irqchip irqchip_plic = {
 	.init = plic_init,
+	.shutdown = plic_shutdown,
 	.claim_irq = plic_claim_irq,
 	.adjust_irq_target = plic_adjust_irq_target,
 	.mmio_handler = plic_handler,
diff --git a/hypervisor/arch/riscv/setup.c b/hypervisor/arch/riscv/setup.c
index 94971dd3..62911055 100644
--- a/hypervisor/arch/riscv/setup.c
+++ b/hypervisor/arch/riscv/setup.c
@@ -192,7 +192,13 @@ void __attribute__ ((noreturn)) arch_cpu_activate_vmm(void)
 	 if (csr_read(CSR_HSTATUS) & HSTATUS_VGEIN) {
 		imsic_migrate_regs(imsic_migrate_to_vs);
 		imsic_migration_done = true;
-	 }
+
+		/*
+		 * In case we have an IMSIC, there must be no external IRQs any
+		 * longer, so disable them for the S-Mode Hypervisor
+		 */
+		ext_disable();
+	}
 
 	tmp = csr_swap(sscratch, regs->sp);
 	asm volatile("mv sp, %0\n"
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-70-ralf.ramsauer%40oth-regensburg.de.
