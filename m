Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBWV5T6RQMGQENKOBQFQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x637.google.com (mail-ej1-x637.google.com [IPv6:2a00:1450:4864:20::637])
	by mail.lfdr.de (Postfix) with ESMTPS id 982FB70A0E5
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:59 +0200 (CEST)
Received: by mail-ej1-x637.google.com with SMTP id a640c23a62f3a-9532170e883sf273722566b.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528859; cv=pass;
        d=google.com; s=arc-20160816;
        b=lPrFoj707oHaZ7IfzbyM87bXCPltaGafBOwgnxgfBa4boik04YbhFTbS1cn3c0XEIB
         Y0MFNNNR49+rH2+k5+E8U2lEcZKrKh2GoxkXgCpzo+N2TWXMNTs7zRxOqtg92q1WVkF/
         G8TOyF9U45ECiqewnh7tKXtqrzWVgdH5qgrZbCyKDInBo6icfsf3luPSWAAjdmb1lp40
         bMWUbbI+KdrVK3Qg0MHnaH9E/V/1hnrJPcejAqKGuVKMx3ZqPN3Tw3rh3U4TSAMvYCKn
         AN25CKjmT4Dh4hyExrCkj5x9dpbJICFKpucpjLnV41maEmLDH47xIs7JxQ/th0ut4pmG
         Y3fg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=oeUI9WSEFSKWaYRMjgx6DM50zD3tfW7CMAKQ8KPDNkU=;
        b=ZnBpT1nvI0A/Mp/5n72W502Cz8G62W0rYf/KBJpffWJAK/7wTYHc6F2EyJDhDFmIrn
         wgwA5JC+m7/XIxg+P+gvqx8H55giP8UxTy7sQns2a4j07mTax4fsfa7dp5qnOcmtXmvm
         xCsme9l6RcbnjuftgrRdweoofD3LbFPfauOYXVP8xNUD0qZoim/jfXdutpKM+vHII4bF
         Qol3g6iTLEiV4yvv3zbtuBgPymp7W5L1PaH2EvtbQDuZtR1Y8ltgJHCUuCmaeUAvWw3q
         il2jHu3FgXJChGcLneKMP9IQL4gYV/GL7sBh5M+757sVcMjgw6MhEs87u7LEcaEU0BiU
         cHJQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528859; x=1687120859;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oeUI9WSEFSKWaYRMjgx6DM50zD3tfW7CMAKQ8KPDNkU=;
        b=bUJTeTLWK+z5YKhX6EXsN5oMNoVhmhnF2J1CoxSBUz4ifixfH603E+pEbKftvtRP9z
         aDxXTX2iJWHODlfcHA8UAYdk0y4VuFzNChUMEoVTeESzpq3TY+ibyP0sEEbFjkM9KRfk
         yrqcby0RJCIozjoF1Tt5GOvwdJvBptQZkDUePupm0uQBQT2xeerhXxevVZ4bCWHVk2Bz
         IEmUe/zbXk46L8Nhhmzs3eTdZOySoMw2tnNorIXIdv8msUZ8zAmn5YGBJhQQlnF14NnZ
         05FRzMOciaug0yDRYueCXqE5q3nU+2cFAHtGJrzaKCmkB4B1Cq3EauW+Yqu4B/jqUiWN
         QNwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528859; x=1687120859;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oeUI9WSEFSKWaYRMjgx6DM50zD3tfW7CMAKQ8KPDNkU=;
        b=Q/yZgqeLa/aDveknxlmJePoiBrcNtEMxgcQWZedYgT6GJMs6CcO0U63zaUQOG4qYtq
         wjFHXT5nCshcd+yOGsBSuqdjFDSxZgQG6OYl3zhER8e6PxnpxA/btk4sXGhPA3gNVQrD
         iA8VYyialooWOBl5b3icBtwNQs9vVOcqAJJRdD89jd9ACI72lbhyNXY5hi7qV711lqky
         /Cb9cdH1oUk/DP59Ty8pW1uVPVEdZ/DhaUkaTrhqiAfiNFk9vlxP3VWQLrsGS8uoGtH5
         IT2qGXljsmlmYJRupv5kE/osgTiDeSlUdFm3prvaT4u6frQEaA5zt946apiA9kl1rw4g
         1pHw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDymK2gaj2+bKMI1MgAz0dQl47fLMcyhBbT+eM532DKwXGFgxRMf
	CQ44dB58Psq9s0TRtw5RVMUGEA==
X-Google-Smtp-Source: ACHHUZ7qter/Kc4gsJuuP5pOWsrAnAzFsgg3nB5TNqV4gpH6Mqoxpoe+YS0Qo0QlaGoBdFGIBRP/WA==
X-Received: by 2002:a17:906:8a61:b0:966:6437:6ecb with SMTP id hy1-20020a1709068a6100b0096664376ecbmr1126392ejc.6.1684528858901;
        Fri, 19 May 2023 13:40:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:c98c:0:b0:50b:c8bf:7aa6 with SMTP id c12-20020aa7c98c000000b0050bc8bf7aa6ls1349894edt.0.-pod-prod-08-eu;
 Fri, 19 May 2023 13:40:57 -0700 (PDT)
X-Received: by 2002:aa7:c2d9:0:b0:506:a663:5c1b with SMTP id m25-20020aa7c2d9000000b00506a6635c1bmr2690470edp.18.1684528857069;
        Fri, 19 May 2023 13:40:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528857; cv=none;
        d=google.com; s=arc-20160816;
        b=E00pXZ2S0u2umCfXSU76UxR5DAAaoienTs0K19yMGRcXEe26rOqzFMj4MG8jZ/4m/F
         DHHDQlDyRgj/H9Kc29ACRKyZj2NeJJNHAtqRee7dyar2jkHHmxWkyascQlm65ZhQkc41
         V2se46WT2M9W3HeilOQQf9gig5ILis1XqqM5I/+hPkaf0Z1+UjofGuFrNEZcAsxCQyVL
         iuVS78mk4LllTNhJsUH/Egw1rfcnGyjNmxIO7oOJvAQK5k3U2zp+c1Tz9COE5nVPRTph
         E21O02kXqmD3Tna2OY7TwtImi5g+QfonK+ZPb4bOXebu48RlNJnc2LOrOnt4c1kr5EPI
         WxIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=PXTrZwOdx4noTPIld7NItpkVGvei6C1PPHXNyn6oK5A=;
        b=aVvPvnEcPNNyYe13tWFY8/LPRLFHsNTF2ef/QONHlsqkSHj4gBQvAApZ5DgRR8/J9i
         y7SDM4qr3CqH6Ty27rFH2tZW/mkF6iDHdoCfKLOfAShSoGOXmmRJsDjtZQSqeVL8dmkP
         k4zz3UJVuOieKAe2HbcfNpm9t7OmRPeiqjy5S5t34lexRaT3yKkXuskLHIuy1VRf4ORH
         J54XyPkYL2jayY/a/U50Vlwj3gFVbE0ggwErdQJEhZw2vLRMpM4RUL1OAQRQZVTfzzvE
         YK9GbEhz8jWxyi0SDyytneAzgwXPnRiOSHghSj9T+UVi+IrL07B15ZZexBPZcSxuYKcS
         Ms3g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id g26-20020aa7c85a000000b00510cd4eed58si20941edt.2.2023.05.19.13.40.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdh3HCNzxvc;
	Fri, 19 May 2023 22:40:56 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 51/73] core: riscv: implement trap handlers
Date: Fri, 19 May 2023 22:40:11 +0200
Message-Id: <20230519204033.643200-52-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_10000_PLUS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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
[since RFC v1: Add more fine granular SBI accounting, simplify usage of hlvx]
[since RFC v2: inline single-caller functions, improve rfence handler]
---
 hypervisor/arch/riscv/traps.c | 793 +++++++++++++++++++++++++++++++++-
 1 file changed, 788 insertions(+), 5 deletions(-)

diff --git a/hypervisor/arch/riscv/traps.c b/hypervisor/arch/riscv/traps.c
index f61dfc1a..b3bbe413 100644
--- a/hypervisor/arch/riscv/traps.c
+++ b/hypervisor/arch/riscv/traps.c
@@ -10,19 +10,802 @@
  * the COPYING file in the top-level directory.
  */
 
+#include <jailhouse/control.h>
+#include <jailhouse/printk.h>
+#include <jailhouse/entry.h>
+#include <jailhouse/percpu.h>
+#include <jailhouse/processor.h>
+#include <jailhouse/utils.h>
+#include <asm/control.h>
+#include <asm/irqchip.h>
 #include <asm/processor.h>
+#include <asm/sbi.h>
+#include <asm/setup.h>
 
 void arch_handle_trap(union registers *regs);
 void arch_handle_fault(union registers *regs);
 
-void arch_handle_trap(union registers *regs)
+static const char *causes[] = {
+	[EXC_INST_MISALIGNED]		= "Instruction Address Misaligned",
+	[EXC_INST_ACCESS]		= "Instruction Address Fault",
+	[EXC_INST_ILLEGAL]		= "Illegal Instruction",
+	[EXC_BREAKPOINT]		= "Breakpoint",
+	[EXC_LOAD_ACCESS_MISALIGNED]	= "Load Accesss Misaligned",
+	[EXC_LOAD_ACCESS]		= "Load Access Fault",
+	[EXC_AMO_ADDRESS_MISALIGNED]	= "AMO Address Misaligned",
+	[EXC_STORE_ACCESS]		= "Store Access Fault",
+	[EXC_SYSCALL]			= "Env Call From U-Mode",
+	[EXC_HYPERVISOR_SYSCALL]	= "Env Call From S-Mode",
+	[EXC_SUPERVISOR_SYSCALL]	= "Env Call From VS-Mode",
+	[11]				= "Env Call From M-Mode",
+	[EXC_INST_PAGE_FAULT]		= "Instruction Pagefault",
+	[EXC_LOAD_PAGE_FAULT]		= "Load Pagefault",
+	[14]				= "Reserved",
+	[EXC_STORE_PAGE_FAULT]		= "Store Pagefault",
+	[16 ... 19]			= "Reserved",
+	[EXC_INST_GUEST_PAGE_FAULT]	= "Inst Guest Pagefault",
+	[EXC_LOAD_GUEST_PAGE_FAULT]	= "Load Guest Pagefault",
+	[EXC_VIRTUAL_INST_FAULT]	= "Virtual Instruction Fault",
+	[EXC_STORE_GUEST_PAGE_FAULT]	= "Store Guest Pagefault",
+};
+
+static inline bool is_irq(u64 cause)
+{
+	return !!(cause & CAUSE_IRQ_FLAG);
+}
+
+static inline unsigned long to_irq(unsigned long cause)
+{
+	return cause & ~CAUSE_IRQ_FLAG;
+}
+
+static void dump_regs(union registers *r)
+{
+	struct public_per_cpu *pc = this_cpu_public();
+	unsigned long scause = csr_read(scause);
+	const char *cause_str = "UNKNOWN";
+
+	/* We might want to later exchange it with panic_printk, but for the
+	 * moment of development, printk is more helpful. */
+	void (*printer)(const char *, ...) = panic_printk;
+
+	if (scause <= 23)
+		cause_str = causes[scause];
+	else if (is_irq(scause))
+		cause_str = "IRQ";
+
+	printer("Fatal: Exception on CPU %u (HART %u). Cause: %lu (%s)\n"
+		"scause: 0x%016lx, stval: 0x%016lx, htval<<2: 0x%016lx\n"
+		" PC: 0x%016llx RA: 0x%016llx  SP: 0x%016llx\n"
+		" GP: 0x%016llx TP: 0x%016llx  T0: 0x%016llx\n"
+		" T1: 0x%016llx T2: 0x%016llx  S0: 0x%016llx\n"
+		" S1: 0x%016llx A0: 0x%016llx  A1: 0x%016llx\n"
+		" A2: 0x%016llx A3: 0x%016llx  A4: 0x%016llx\n"
+		" A5: 0x%016llx A6: 0x%016llx  A7: 0x%016llx\n"
+		" S2: 0x%016llx S3: 0x%016llx  S4: 0x%016llx\n"
+		" S5: 0x%016llx S6: 0x%016llx  S7: 0x%016llx\n"
+		" S8: 0x%016llx S9: 0x%016llx S10: 0x%016llx\n"
+		"S11: 0x%016llx T3: 0x%016llx  T4: 0x%016llx\n"
+		" T5: 0x%016llx T6: 0x%016llx\n",
+		pc->cpu_id, pc->phys_id, to_irq(scause), cause_str,
+		scause, csr_read(stval), csr_read(CSR_HTVAL) << 2,
+		r->pc, r->ra, r->sp,
+		r->gp, r->tp, r->t0,
+		r->t1, r->t2, r->s0,
+		r->s1, r->a0, r->a1,
+		r->a2, r->a3, r->a4,
+		r->a5, r->a6, r->a7,
+		r->s2, r->s3, r->s4,
+		r->s5, r->s6, r->s7,
+		r->s8, r->s9, r->s10,
+		r->s11, r->t3, r->t4,
+		r->t5, r->t6);
+}
+
+static inline int handle_timer(void)
+{
+	this_cpu_public()->stats[JAILHOUSE_CPU_STAT_VMEXITS_TIMER]++;
+	sbi_set_timer(-1);
+
+	/* inject timer to VS */
+	csr_set(CSR_HVIP, VIE_TIE);
+
+	return 0;
+}
+
+static inline void riscv_guest_inject_ipi(void)
+{
+	/* inject IPI to VS */
+	csr_set(CSR_HVIP, VIE_SIE);
+}
+
+static inline int handle_ipi(void)
 {
-	for (;;)
-		cpu_relax();
+	struct public_per_cpu *pcpu = this_cpu_public();
+	bool check_events = false;
+	u32 *stats = pcpu->stats;
+	int err = 0;
+
+	/* Take the control lock */
+	spin_lock(&pcpu->control_lock);
+
+	/*
+	 * Next, we have to check who's the recipient of the IPI. Is it the
+	 * hypervisor, or is it the guest?
+	 */
+	switch (pcpu->ipi_cause) {
+		case IPI_CAUSE_GUEST:
+			stats[JAILHOUSE_CPU_STAT_VMEXITS_IPI]++;
+			riscv_guest_inject_ipi();
+			break;
+
+		case IPI_CAUSE_MGMT:
+			stats[JAILHOUSE_CPU_STAT_VMEXITS_MANAGEMENT]++;
+			check_events = true;
+			break;
+
+		case IPI_CAUSE_NONE:
+		default:
+			printk("Fatal: Invalid IPI cause on CPU %u\n",
+			       this_cpu_id());
+			err = -EINVAL;
+			break;
+	}
+
+	this_cpu_public()->ipi_cause = IPI_CAUSE_NONE;
+	/*
+	 * IPI must be acknowledged. Clear the IPI by clearing sip.SSIP.
+	 * Alternatively, IPI could be cleared via SBI. This is deprecated and
+	 * unperformant.
+	 */
+	csr_clear(sip, (1 << IRQ_S_SOFT));
+
+	/*
+	 * Unlock the control lock. Another CPU may us now send some further
+	 * events, until we enter arch_check_events. It is important that the
+	 * IPI is acknowledged here, as from now on, further IPIs might already
+	 * be sent by remote CPUs.
+	 */
+	spin_unlock(&pcpu->control_lock);
+
+	if (check_events)
+		arch_check_events();
+
+	return err;
+}
+
+static int handle_irq(u64 irq)
+{
+	int err;
+
+	switch (irq) {
+		case IRQ_S_TIMER:
+			err = handle_timer();
+			break;
+
+		case IRQ_S_SOFT:
+			err = handle_ipi();
+			break;
+
+		case IRQ_S_EXT:
+			err = irqchip_set_pending();
+			break;
+
+		default:
+			err = -ENOSYS;
+			break;
+	}
+
+	return err;
+}
+
+static inline int sbi_ext_time(struct sbiret *ret, unsigned int fid, u64 stime)
+{
+	if (fid != SBI_EXT_TIME_SET_TIMER)
+		return -ENOSYS;
+
+	/* Clear pending IRQs */
+	csr_clear(CSR_HVIP, VIE_TIE);
+
+	*ret = sbi_set_timer(stime);
+
+	return 0;
+}
+
+static inline void
+skip_emulated_instruction(union registers *regs, unsigned int b)
+{
+	regs->pc += b;
+	csr_write(sepc, regs->pc);
+}
+
+static bool sbi_permitted_hart(unsigned long hartid)
+{
+	unsigned int cpu;
+
+	for_each_cpu(cpu, &this_cell()->cpu_set)
+		if (public_per_cpu(cpu)->phys_id == hartid)
+			return true;
+	return false;
+}
+
+static void guest_queue_ipi(unsigned int cpu)
+{
+	struct public_per_cpu *pcpu = public_per_cpu(cpu);
+
+retry:
+	spin_lock(&pcpu->control_lock);
+	if (pcpu->ipi_cause == IPI_CAUSE_NONE)
+		pcpu->ipi_cause = IPI_CAUSE_GUEST;
+	else {
+		spin_unlock(&pcpu->control_lock);
+		goto retry;
+	}
+	spin_unlock(&pcpu->control_lock);
+}
+
+static inline int
+handle_sbi_send_ipi(struct sbiret *ret, unsigned long mask, unsigned long base)
+{
+	unsigned long phys, mask_fwd;
+	unsigned int cpu;
+
+	mask_fwd = 0;
+	while (mask) {
+		phys = ffsl(mask);
+		mask &= ~(1UL << phys);
+
+		cpu = cpu_by_phys_processor_id(base + phys);
+		if (cpu == this_cpu_id())
+			riscv_guest_inject_ipi();
+		else if (public_per_cpu(cpu)->cell != this_cell())
+			return -EPERM;
+		else {
+			guest_queue_ipi(cpu);
+			mask_fwd |= (1UL << phys);
+		}
+	}
+
+	/* Only forward the IPI, if in mask is anything left */
+	if (mask_fwd)
+		*ret = sbi_send_ipi(mask_fwd, base);
+	else /* Just a single self-IPI */
+		ret->value = ret->error = 0;
+
+	return 0;
+}
+
+
+static inline int handle_sbi_rfence(struct sbiret *ret, unsigned int fid,
+				    unsigned long mask, unsigned long base,
+				    unsigned long a2, unsigned long a3,
+				    unsigned long a4)
+{
+	unsigned int cpu;
+	unsigned long phys;
+	unsigned long _mask;
+
+	/*
+	 * We have to remove all unreachable CPUs from the mask. I saw Linux
+	 * sending rfences to CPUs outside its domain.
+	 */
+	_mask = 0;
+	for_each_cpu(cpu, &this_cell()->cpu_set) {
+		phys = public_per_cpu(cpu)->phys_id;
+		if (phys < base)
+			continue;
+
+		if (mask & (1UL << (phys - base)))
+			_mask |= 1UL << (phys - base);
+	}
+
+	*ret = sbi_ecall(SBI_EXT_RFENCE, fid, _mask, base, a2, a3, a4, 0);
+	return 0;
+}
+
+static int riscv_unpark(struct sbiret *ret, unsigned long hartid,
+			unsigned long start_addr, unsigned long opaque)
+{
+	struct public_per_cpu *pcpu;
+	unsigned int cpu;
+	int err = 0;
+
+	cpu = cpu_by_phys_processor_id(hartid);
+	pcpu = public_per_cpu(cpu);
+	ret->value = 0;
+
+	spin_lock(&pcpu->control_lock);
+	if (pcpu->hsm.state == STARTED || pcpu->hsm.state == START_PENDING) {
+		ret->error = SBI_ERR_ALREADY_AVAILABLE;
+		goto unlock_out;
+	}
+
+	pcpu->hsm.start_addr = start_addr;
+	pcpu->hsm.opaque = opaque;
+	pcpu->hsm.state = START_PENDING;
+	spin_unlock(&pcpu->control_lock);
+
+	arch_send_event(pcpu);
+
+	ret->error = SBI_SUCCESS;
+
+unlock_out:
+	spin_unlock(&pcpu->control_lock);
+	return err;
+}
+
+static inline unsigned long hsm_state(unsigned long hart)
+{
+	return public_per_cpu(cpu_by_phys_processor_id(hart))->hsm.state;
+}
+
+static inline int
+handle_sbi_hsm(struct sbiret *ret, unsigned int fid, unsigned long a0,
+	       unsigned long a1, unsigned long a2)
+{
+	int err = 0;
+
+	switch (fid) {
+		case SBI_EXT_HSM_HART_STOP:
+			riscv_park_cpu();
+			break;
+
+		case SBI_EXT_HSM_HART_START:
+			ret->value = 0;
+			if (!sbi_permitted_hart(a0) ||
+			    a0 == this_cpu_public()->phys_id) {
+				ret->error = SBI_ERR_INVALID_PARAM;
+				break;
+			}
+
+			err = riscv_unpark(ret, a0, a1, a2);
+			break;
+
+		case SBI_EXT_HSM_HART_STATUS:
+			if (sbi_permitted_hart(a0)) {
+				ret->error = SBI_SUCCESS;
+				ret->value = hsm_state(a0);
+			} else {
+				ret->error = SBI_ERR_INVALID_PARAM;
+				ret->value = 0;
+			}
+			break;
+
+		default:
+			printk("Unknown HSM Fid: %u\n", fid);
+			err = -EINVAL;
+			break;
+	}
+
+	return err;
+}
+
+static struct sbiret sbi_probe_ext(unsigned long ext)
+{
+	struct sbiret ret;
+
+	/* Allow access to all extensions but system reset (SRST) */
+	switch (ext) {
+	case SBI_EXT_TIME:
+	case SBI_EXT_SPI:
+	case SBI_EXT_RFENCE:
+	case SBI_EXT_HSM:
+		ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_PROBE_EXT, ext,
+				0, 0, 0, 0, 0);
+		break;
+
+	case SBI_EXT_SRST:
+	default:
+		ret.error = SBI_ERR_DENIED;
+		ret.value = 0;
+		break;
+	}
+
+	return ret;
+}
+
+static inline int
+sbi_ext_base(struct sbiret *ret, unsigned long fid, unsigned long a0)
+{
+	int err = 0;
+
+	switch (fid) {
+		case SBI_EXT_BASE_GET_SPEC_VERSION:
+		case SBI_EXT_BASE_GET_IMP_ID:
+		case SBI_EXT_BASE_GET_IMP_VERSION:
+		case SBI_EXT_BASE_GET_MVENDORID:
+		case SBI_EXT_BASE_GET_MARCHID:
+		case SBI_EXT_BASE_GET_MIMPID:
+			*ret = sbi_ecall(SBI_EXT_BASE, fid, a0, 0, 0, 0, 0, 0);
+			break;
+
+		case SBI_EXT_BASE_PROBE_EXT:
+			*ret = sbi_probe_ext(a0);
+			break;
+
+		default:
+			err = -ENOSYS;
+			break;
+	}
+
+	return err;
+}
+
+static int handle_ecall(union registers *regs)
+{
+	/*
+	 * Spec: In the name of compatibility, SBI extension IDs (EIDs) and SBI
+	 * function IDs (FIDs) are encoded as signed 32-bit integers. When
+	 * passed in registers these follow the standard above calling
+	 * convention rules.
+	 */
+	u32 *stats = this_cpu_public()->stats;
+	unsigned int eid, fid;
+	struct sbiret ret;
+	int err = -ENOSYS;
+
+	eid = regs->a7;
+	fid = regs->a6;
+	ret.value = 0;
+
+	switch (eid) {
+		/* Treat putchar like a hypercall. Accounts for a hypercall. */
+		case SBI_EXT_0_1_CONSOLE_PUTCHAR:
+			ret.error = hypercall(JAILHOUSE_HC_DEBUG_CONSOLE_PUTC,
+					      regs->a0, 0);
+			err = 0;
+			break;
+
+		case SBI_EXT_0_1_CONSOLE_GETCHAR:
+			stats[JAILHOUSE_CPU_STAT_VMEXITS_SBI_OTHER]++;
+			/*
+			 * I have never seen this one being used in real-world.
+			 * As we would need to think if we allow access (what
+			 * about non-root?), let's simply deny it for the
+			 * moment.
+			 */
+			if (0)
+				ret = sbi_console_getchar_legacy_0_1();
+			else {
+				ret.error = SBI_ERR_DENIED;
+				ret.value = 0;
+			}
+			err = 0;
+			break;
+
+		case SBI_EXT_BASE:
+			stats[JAILHOUSE_CPU_STAT_VMEXITS_SBI_OTHER]++;
+			err = sbi_ext_base(&ret, fid, regs->a0);
+			break;
+
+		case SBI_EXT_TIME: /* since SBI v0.2 */
+			stats[JAILHOUSE_CPU_STAT_VMEXITS_SBI_TIME]++;
+			err = sbi_ext_time(&ret, fid, regs->a0);
+			break;
+
+		case SBI_EXT_SPI:
+			stats[JAILHOUSE_CPU_STAT_VMEXITS_SBI_IPI]++;
+			err = handle_sbi_send_ipi(&ret, regs->a0, regs->a1);
+			break;
+
+		case SBI_EXT_RFENCE:
+			stats[JAILHOUSE_CPU_STAT_VMEXITS_SBI_RFENCE]++;
+			err = handle_sbi_rfence(&ret, fid, regs->a0, regs->a1,
+						regs->a2, regs->a3, regs->a4);
+			break;
+
+		case SBI_EXT_HSM:
+			stats[JAILHOUSE_CPU_STAT_VMEXITS_SBI_OTHER]++;
+			err = handle_sbi_hsm(&ret, fid, regs->a0, regs->a1,
+					     regs->a2);
+			break;
+
+		case JAILHOUSE_EID:
+			ret.error = hypercall(fid, regs->a0, regs->a1);
+			if (fid == JAILHOUSE_HC_DISABLE && !ret.error)
+				riscv_deactivate_vmm(regs, 0, true);
+			err = 0;
+			break;
+
+		default:
+			printk("Unknown SBI call EID: 0x%x FID: 0x%x\n",
+			       eid, fid);
+			return -EINVAL;
+			break;
+	}
+
+	if (err)
+		return err;
+
+	/* If we came from stop, don't propagate error codes */
+	if (eid == SBI_EXT_HSM && fid == SBI_EXT_HSM_HART_STOP)
+		return 0;
+
+	regs->a0 = ret.error;
+	regs->a1 = ret.value;
+	skip_emulated_instruction(regs, 4);
+
+	return 0;
+}
+
+static inline u16 gmem_read16(unsigned long addr)
+{
+	u64 mem;
+
+	/*
+	 * hlvx.hu can potentially fault and throw an exception. But if we end
+	 * up here, we're decoding an instruction that the guest was possible
+	 * to execute. Hence, it must be backed by existing memory, and no
+	 * exception can occur.
+	 */
+	asm volatile(".insn r 0x73, 0x4, 0x32, %0, %1, x3\n" /* hlvx.hu */
+		     : "=r"(mem) : "r"(addr) : "memory");
+
+	return mem;
+}
+
+static inline u64 sext(u32 w)
+{
+	u64 ret;
+	asm volatile("sext.w %0, %0" : "=r"(ret) : "r"(w) :);
+	return ret;
+}
+
+#define COMP_RX_OFF	8
+
+union instruction {
+	struct {
+		u32 type:2;
+		u32 opcode:5;
+		u32 dest:5;
+		u32 width:3;
+		u32 base:5;
+		u32 offset:12;
+	} load __attribute__((packed));
+	struct {
+		u32 type:2;
+		u32 opcode:5;
+		u32 offset40:5;
+		u32 width:3;
+		u32 base:5;
+		u32 src:5;
+		u32 offset115:7;
+	} store __attribute__((packed));
+	struct {
+		u32 type:2;
+		u32 opcode:5;
+		u32 rsvd:25;
+	} generic __attribute__((packed));
+	u32 raw;
+} __attribute__((packed));
+
+union cinstruction {
+	struct {
+		u16 opcode:2;
+		u16 src_dst:3;
+		u16 off1:2;
+		u16 base:3;
+		u16 off2:3;
+		u16 funct3:3;
+	} load_store __attribute__((packed));
+	struct {
+		u16 opcode:2;
+		u16 rsvd:14;
+	} generic __attribute__((packed));
+	u16 raw;
+} __attribute__((packed));
+
+struct riscv_mmio_inst {
+	unsigned char reg;
+	unsigned char width;
+	bool sign_extended;
+};
+
+static int
+riscv_decode_compressed_instruction(struct riscv_mmio_inst *mmio_inst, u16 inst)
+{
+	union cinstruction i;
+	int err = -ENOSYS;
+
+	i.raw = inst;
+	/* SW */
+	if (i.generic.opcode == 0 && i.load_store.funct3 == 6) {
+		mmio_inst->width = 4;
+		mmio_inst->sign_extended = true;
+		mmio_inst->reg = i.load_store.src_dst + COMP_RX_OFF;
+		err = 0;
+	/* LW */
+	} else if (i.generic.opcode == 0 && i.load_store.funct3 == 2) {
+		mmio_inst->width = 4;
+		mmio_inst->sign_extended = true;
+		mmio_inst->reg = i.load_store.src_dst + COMP_RX_OFF;
+		err = 0;
+	}
+
+	return err;
+}
+
+static int riscv_decode_instruction(struct riscv_mmio_inst *mmio_inst, u32 inst,
+				    bool is_compressed)
+{
+	union instruction i;
+	int err = -ENOSYS;
+
+	if (is_compressed)
+		return riscv_decode_compressed_instruction(mmio_inst, inst);
+
+	i.raw = inst;
+	if (i.generic.type != 0x3)
+		return err;
+
+	/* LB, LH, LW */
+	if (i.generic.opcode == 0x0) {
+		if (i.load.width > 2)
+			return err;
+		mmio_inst->width = 1 << i.load.width;
+		mmio_inst->sign_extended = true;
+		mmio_inst->reg = i.load.dest;
+		err = 0;
+	/* SB, SW, SH */
+	} else if (i.generic.opcode == 0x8) {
+		if (i.store.width > 2)
+			return err;
+		mmio_inst->width = 1 << i.store.width;
+		mmio_inst->sign_extended = true;
+		mmio_inst->reg = i.store.src;
+		err = 0;
+	}
+
+	return err;
+}
+
+static int handle_fault(union registers *regs, bool is_write)
+{
+	struct riscv_mmio_inst mmio_inst;
+	struct mmio_access mmio;
+	enum mmio_result result;
+	bool is_compressed;
+	u32 instruction;
+	size_t *reg;
+	int err;
+
+	this_cpu_public()->stats[JAILHOUSE_CPU_STAT_VMEXITS_MMIO]++;
+
+	mmio.is_write = is_write;
+	mmio.address = csr_read(CSR_HTVAL) << 2;
+
+	/*
+	 * Potentially, htval might point to address NULL, while pointing to a
+	 * valid trap value. However, 0 might also indicate that htval is not
+	 * supported by the micro-architecture. Hence, by design, let's say
+	 * that address NULL should (a) not be used or (b) must not cause
+	 * access faults when being used.
+	 *
+	 * Here, we assume that the micro-architecture doesn't support htval,
+	 * if we read back zero on a fault exception.
+	 */
+	if (!mmio.address)
+		return -ENOSYS;
+
+	/* Just ensure that the instruction is 16-bit aligned */
+	if (regs->pc & 0x1)
+		return -EINVAL;
+
+	/* Load remaining lsb two bits from stval */
+	mmio.address |= csr_read(stval) & 0x3;
+
+	/* Load faulting instruction */
+
+	/* check if htinst is available */
+#if 0 /* htinst can hold pseudo-decoded instrs which we don't support yet. */
+	instruction = csr_read(CSR_HTINST);
+#else
+	instruction = 0;
+#endif
+	if (instruction != 0) {
+		is_compressed = (instruction & 0x3) != 0x3;
+	} else { /* if not, load from guest mem */
+		instruction = gmem_read16(regs->pc);
+		if ((instruction & 0x3) == 0x3) {
+			is_compressed = false;
+			instruction |= (u32)gmem_read16(regs->pc + 2) << 16;
+		} else
+			is_compressed = true;
+	}
+
+	err = riscv_decode_instruction(&mmio_inst, instruction, is_compressed);
+	if (err)
+		goto unsup;
+
+	if (mmio.is_write)
+		mmio.value = regs->raw.x[mmio_inst.reg];
+	mmio.size = mmio_inst.width;
+
+	result = mmio_handle_access(&mmio);
+	if (result == MMIO_HANDLED) {
+		if (!mmio.is_write) {
+			reg = &regs->raw.x[mmio_inst.reg];
+			*reg = mmio.value;
+			if (mmio_inst.width < 8) {
+				*reg &= ((1UL << mmio_inst.width * 8) - 1);
+				if (mmio_inst.sign_extended)
+					*reg = sext(*reg);
+			}
+		}
+		skip_emulated_instruction(regs, is_compressed ? 2 : 4);
+		return 0;
+	}
+
+	return -ENOSYS;
+
+unsup:
+	printk("Unsupported instruction: 0x%x\n", instruction);
+	return -ENOSYS;
 }
 
 void arch_handle_fault(union registers *regs)
 {
-	for (;;)
-		cpu_relax();
+	panic_printk("FATAL: Unhandled S-Mode exception.\n");
+	panic_printk("Hypervisor registers:\n");
+	dump_regs(regs);
+	panic_stop();
+}
+
+void arch_handle_trap(union registers *regs)
+{
+	unsigned long cause;
+	int err = -1;
+
+	this_cpu_public()->stats[JAILHOUSE_CPU_STAT_VMEXITS_TOTAL]++;
+
+	regs->pc = csr_read(sepc);
+	cause = csr_read(scause);
+
+	if (is_irq(cause)) {
+		err = handle_irq(cause & ~CAUSE_IRQ_FLAG);
+		goto out;
+	}
+
+	switch (cause) {
+		case EXC_INST_ACCESS:
+		case EXC_LOAD_ACCESS:
+		case EXC_STORE_ACCESS:
+		case EXC_INST_PAGE_FAULT:
+		case EXC_LOAD_PAGE_FAULT:
+		case EXC_STORE_PAGE_FAULT:
+		case EXC_INST_MISALIGNED:
+		case EXC_LOAD_ACCESS_MISALIGNED:
+		case EXC_AMO_ADDRESS_MISALIGNED:
+			printk("\nFaulting Address: %016lx\n", csr_read(stval));
+			err = -ENOSYS;
+			break;
+
+		case EXC_SUPERVISOR_SYSCALL:
+			err = handle_ecall(regs);
+			break;
+
+		case EXC_BREAKPOINT:
+			printk("BP occured @ PC: %016lx\n", regs->pc);
+			err = -1;
+			break;
+
+		case EXC_LOAD_GUEST_PAGE_FAULT:
+			err = handle_fault(regs, false);
+			break;
+
+		case EXC_STORE_GUEST_PAGE_FAULT:
+			err = handle_fault(regs, true);
+			break;
+
+		case EXC_INST_ILLEGAL:
+		default:
+			err = -1;
+			break;
+	}
+
+out:
+	if (err) {
+		dump_regs(regs);
+		panic_park();
+	}
 }
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-52-ralf.ramsauer%40oth-regensburg.de.
