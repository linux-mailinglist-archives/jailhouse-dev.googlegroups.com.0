Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBZ4GRGPQMGQEUNNDQ5Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 3352D68D68E
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:16 +0100 (CET)
Received: by mail-wm1-x33e.google.com with SMTP id l38-20020a05600c1d2600b003ddff4b9a40sf8067217wms.9
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:16 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772776; cv=pass;
        d=google.com; s=arc-20160816;
        b=te7Qa+xpUZjEJNtQXHntQZ9Vs5D4+BeVwPscyEkRqKvzQJouX8YX5zJPaVwOZLHZjm
         auEo/yHapfKxzkUpn2dbJ8fCcGh0fbEdseFhz6tCIVcUChX7tENwLFa6Wt+bNSSursCc
         wR55Aqz8s53SOvCmDrKx0jQAuHR8V+JasKhS+pgxD7tzKESlIkh7d583mVDJs480UWux
         MEQECUK6pfuuOSU6AuJIeEGsNTliLe0cPhkbNQlYWoVh5oIezPb0YG4JWTMTIVLXCN0E
         DPC/d7QseyS7Fwv7WAnTUsLNf+xDKa72x76krSo8r4GxBYslcQaq26F5uhViuYRF8jr0
         j27w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=g8b31BImqvtYy8TU2iRUw7+5j5L1X2UM/ZOH6vrgpbA=;
        b=uGtcFyKtqfvXCvRzQFIWft3dpQXOrdF8LUTf+6mpgPbkea6huoZ5auAyhAJgMTi1B2
         DXgnH6yGQg9MBAp7EBoYNW9fKkbRfdeSAHwrVxxdhe8fJOovH2Lp3IIQrICLbeKJ5HFI
         Lqd4rCsM41QQRCVDYIg5bPWYD4V1z8omBncBRfPTtNCAXVPmL5vz8LC/iEsrYgAqfU9v
         7ZTi1ARZUFolI5MnmNdFjEKeaj5GFXK9xxk+nZvbcjfN3MxyeuURU9pMEpnaZ4EUQcPh
         h+Krz7cm1ndcbvp42PERl0bV2TmnkIvJOPWocO1DPGeitK9NNLmprDlCdwf3DhO79t4M
         sJEQ==
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
        bh=g8b31BImqvtYy8TU2iRUw7+5j5L1X2UM/ZOH6vrgpbA=;
        b=B5VWiyT9Q5bHx2xWQoGLh2tXcXiYxQ7GaK9xj02urjJeM36bm03nkwKazS3xJ6Hh6B
         SwMvPVt8QSpnW36AUcklWB8kjRPWP75K+dCtKANsgL9xtu2wkr2Q4F1SE6ApV/KZRtI6
         Y6zpISCirwBASwf6b4qcoDPEtkjTPtZmcOpXh/arCzFoHv2gkqwpKYU93t6hy0khNaH1
         Sp1v9U0E9mCVKl66T5Cac951SMahmod3J9Cah7MibtpOungfv84W0lMgvI+7ooAUdQnT
         q0jlP72xfCteBdob0UjmcQGmeXSdijTpJ42MAvx/HvRMKrEV+mR9HTTHT5vnICHMHhqg
         951g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g8b31BImqvtYy8TU2iRUw7+5j5L1X2UM/ZOH6vrgpbA=;
        b=ECOg4iBT8Akg7s133Vn2mfIHKhQLEHR8nD2dPXuU6KaAWOwho3U0V1oQd8lnmSGu0m
         flzU/kc9cxBWMWwc9L/dyHy1nyWVk077djBc5VMWyKFSzDhnRKheousPeHkqQQyHgLS8
         bG08T6Eou9r8ZairnkO/scsFksFL33Efcum2Sz2NJWkubLfmUJV5BaqVTofzKDa+EayO
         LKbvhuA0kAQ+jjOxIwouaHLrjnU/RF3O3FA0pKTGdb7oyYLg1oVMx+7xVKPc/Iom6Jtm
         H4ZXMsxZtvociTH9CwZ8vcbzg/yKWzArvM+k6OQg8nSF9MUPWzx6cPn++VYorqqBdJSh
         J+OQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKXDANU05GV7SrbmcXmLiTP8fyBWlJXLFIySWshRRpyXzzW/+UFc
	m7ki5IZWIiStcnZAFBPypuU=
X-Google-Smtp-Source: AK7set/wZFex2w4qJJItA422RFHAkYL5g0JKuZMAPHqWzGXyA5W/cKalnw8NDZtwl8hxqviti8P+7Q==
X-Received: by 2002:adf:d090:0:b0:2bf:bf7a:57bf with SMTP id y16-20020adfd090000000b002bfbf7a57bfmr110876wrh.285.1675772775949;
        Tue, 07 Feb 2023 04:26:15 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:5b19:0:b0:2bf:ae0c:669b with SMTP id bx25-20020a5d5b19000000b002bfae0c669bls21047566wrb.2.-pod-prod-gmail;
 Tue, 07 Feb 2023 04:26:14 -0800 (PST)
X-Received: by 2002:a5d:4a4e:0:b0:2c3:dbb0:7260 with SMTP id v14-20020a5d4a4e000000b002c3dbb07260mr2894576wrs.71.1675772774436;
        Tue, 07 Feb 2023 04:26:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772774; cv=none;
        d=google.com; s=arc-20160816;
        b=niFsxtmNNo/0N2+ViMVh/2jOaAx9znOA5Dwv85NlCyeElYiooesegM/UcWb5HTAVBk
         UxJUD7tmE6gG/fr3h7dPNi5cK5Db8gS+W+VcYf+LjBnH6vwLCjeuFFHwgfUutRpk5GoJ
         s+iA+IgbUux8PTw2QFxPJ3+Ae283IXpge6UKe+IVP9GYlVnivYqXS+YnB/L0IZ19XU/l
         D34zc+HMI9/KdGVfsW04cLlbzEmVbdJd6k7XrC3JgWd6qWLkFHW1zENqz2YJb8PjVXEr
         u3npdpu6ZZOMXmEjtvzgQ5Xs3ETKM/WmBdEJ+ZbJokYSs3WxLJIxj67+IL6ma2jNcW6O
         n5jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=g3gKEOHHj9nD0sV4OAOj6SX/p6/GA5MK3/bceibRkRE=;
        b=lItvbQZJI0Hq9KBVpt3NHToIzERp9FpQL6Mza2PWe050njf75iHbvgU3KdSePo6bkq
         q97YMT5HqGjDm3kim0ruKFy4qNLzE6W38trOMZS3E38BVVnMxTfmJqReiD9zuOUqrM4T
         C9NLhM6KvHx9dv5MpK9m5hGRvXeQw4yagZ3gZRIpw/KMVtB42KQ9/Gcff3Xsx4Ow097T
         5842dA9zgw/yrlc34bIKS6RMCRFFpKU/4n2duG7UQO5DkUJQQvKuuSAOaYC92vvzcxyB
         7bQVbKIBudJRSqQcfV/RE1A3iB+K4ccnKoLV3dXFy9jHJ8dn2nr1rsGFzjKzPlzpkhRh
         8RlQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id n15-20020a05600c500f00b003d9c774d43fsi109830wmr.2.2023.02.07.04.26.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:14 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RT5vzRz1081;
	Tue,  7 Feb 2023 13:26:13 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v2 32/47] core: riscv: implement trap handlers
Date: Tue,  7 Feb 2023 13:25:28 +0100
Message-Id: <20230207122543.1128638-33-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_10000_PLUS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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
[RFC v2: Add more fine granular SBI accounting, simplify usage of hlvx]
---
 hypervisor/arch/riscv/traps.c | 774 +++++++++++++++++++++++++++++++++-
 1 file changed, 769 insertions(+), 5 deletions(-)

diff --git a/hypervisor/arch/riscv/traps.c b/hypervisor/arch/riscv/traps.c
index f61dfc1a..de29288a 100644
--- a/hypervisor/arch/riscv/traps.c
+++ b/hypervisor/arch/riscv/traps.c
@@ -10,19 +10,783 @@
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
+#include <asm/csr64.h>
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
+	printer("Fatal: Exception on CPU %u (HART %u). Cause: %lu (%s)\n",
+		pc->cpu_id, pc->phys_id, to_irq(scause), cause_str);
+	printer("scause: 0x%016lx, stval: 0x%016lx, htval<<2: 0x%016lx\n",
+		scause, csr_read(stval), csr_read(CSR_HTVAL) << 2);
+	printer(" PC: 0x%016llx RA: 0x%016llx  SP: 0x%016llx\n", r->pc, r->ra, r->sp);
+	printer(" GP: 0x%016llx TP: 0x%016llx  T0: 0x%016llx\n", r->gp, r->tp, r->t0);
+	printer(" T1: 0x%016llx T2: 0x%016llx  S0: 0x%016llx\n", r->t1, r->t2, r->s0);
+	printer(" S1: 0x%016llx A0: 0x%016llx  A1: 0x%016llx\n", r->s1, r->a0, r->a1);
+	printer(" A2: 0x%016llx A3: 0x%016llx  A4: 0x%016llx\n", r->a2, r->a3, r->a4);
+	printer(" A5: 0x%016llx A6: 0x%016llx  A7: 0x%016llx\n", r->a5, r->a6, r->a7);
+	printer(" S2: 0x%016llx S3: 0x%016llx  S4: 0x%016llx\n", r->s2, r->s3, r->s4);
+	printer(" S5: 0x%016llx S6: 0x%016llx  S7: 0x%016llx\n", r->s5, r->s6, r->s7);
+	printer(" S8: 0x%016llx S9: 0x%016llx S10: 0x%016llx\n", r->s8, r->s9, r->s10);
+	printer("S11: 0x%016llx T3: 0x%016llx  T4: 0x%016llx\n", r->s11, r->t3, r->t4);
+	printer(" T5: 0x%016llx T6: 0x%016llx\n", r->t5, r->t6);
+}
+
+static int handle_timer(void)
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
+static int handle_ipi(void)
+{
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
+			printk("Fatal: Invalid IPI cause on CPU %u\n", this_cpu_id());
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
+static int sbi_ext_time(struct sbiret *ret, unsigned int fid, u64 stime)
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
+static inline void skip_emulated_instruction(union registers *regs, unsigned int b)
+{
+	regs->pc += b;
+	csr_write(sepc, regs->pc);
+}
+
+static bool sbi_permitted_target_mask(unsigned long mask, unsigned long base)
+{
+	unsigned int cpu;
+	unsigned long phys;
+
+	for_each_cpu(cpu, &this_cell()->cpu_set) {
+		phys = public_per_cpu(cpu)->phys_id;
+		if (phys < base)
+			continue;
+
+		mask &= ~(1UL << (phys - base));
+		if (!mask)
+			return true;
+	}
+
+	return false;
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
+static int handle_sbi_send_ipi(struct sbiret *ret, unsigned long mask,
+			       unsigned	long base)
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
+	if (!sbi_permitted_target_mask(mask, base))
+			return -EPERM;
+
+	*ret = sbi_ecall(SBI_EXT_RFENCE, fid, mask, base, a2, a3, a4, 0);
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
+static int handle_sbi_hsm(struct sbiret *ret, unsigned int fid, unsigned long a0,
+			  unsigned long a1, unsigned long a2)
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
+				ret->value = public_per_cpu(cpu_by_phys_processor_id(a0))->hsm.state;
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
+static int sbi_ext_base(struct sbiret *ret, unsigned long fid, unsigned long a0)
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
+			err = handle_sbi_rfence(&ret, fid, regs->a0, regs->a1, regs->a2,
+						regs->a3, regs->a4);
+			break;
+
+		case SBI_EXT_HSM:
+			stats[JAILHOUSE_CPU_STAT_VMEXITS_SBI_OTHER]++;
+			err = handle_sbi_hsm(&ret, fid, regs->a0, regs->a1, regs->a2);
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
+			printk("Unknown SBI call EID: 0x%x FID: 0x%x\n", eid, fid);
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
 {
-	for (;;)
-		cpu_relax();
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
+static int riscv_decode_compressed_instruction(struct riscv_mmio_inst *mmio_inst, u16 inst)
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
2.39.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230207122543.1128638-33-ralf.ramsauer%40oth-regensburg.de.
