Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBUV5T6RQMGQEZ5ZUFOY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id EB15170A0C8
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:51 +0200 (CEST)
Received: by mail-wm1-x33c.google.com with SMTP id 5b1f17b1804b1-3f4fa463282sf24088085e9.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528851; cv=pass;
        d=google.com; s=arc-20160816;
        b=UdxCV3y890Uvy1/zDKIoYsMOQGEL0Y25Mfq29x0CF5KAqsHOJCnltWz8vkbfX0TQTD
         euDRI5XxeJ//PUJ9kZdlGsDdIxCgUOBs5Qafm5HQVj2/UrmmeYKcE9q1JMS8b3RvfycX
         rdxBnVy40JnyxXurwq6QDpp8ovVMneqjZITa+cu6IfNUf9L+eoC/1TLlKyjhEvLXQUoP
         t9geX5jdppWW550eUkCcZ99tzV6dMkmUKXqfupetfzTzCNUSnBm2jayMTEpI38n+VlG4
         9YXfEiSbCzwI/W2HrGUnmiXsXm84Tm+ejFujnnZwYa3G2zmmfF9IxM1OxElNA7GFQR16
         Y7mA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:sender:dkim-signature;
        bh=ACphGT4cYocTCjL9ouw14VbF8kMzdDaPov9CvJk7ui4=;
        b=GMRKZJeduiHd7rlrFi7YU3ecqN4t0TfY0La3ra2lWSol2vGocAUWYPUiq2MW8AmhU7
         TPglVoLIxQAtoqyf1Z0fLdtVWDEb7ZGOP1Ey8nYQ7gtw/xBWNxvA0/J8PysJCzMikqym
         t8hcUodpLUqSbq7pSe/iCBalXAL33yDSdpjqR2X5IuiVq+nlbpMFByCMUKPsau/ViFXa
         3OV5DkD5h3i/EMmp8tKAea7D5r+33x+4dKgDHk03fikEJf9OHi6Nk7B3N1We5kPpIQFF
         pHmQknDj5+NwCr46YVf1Gypf5QaGQyTcv/RTGmHolNnAl+bUAhnFMBlL2lF9/SQHgF5d
         eBEw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528851; x=1687120851;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ACphGT4cYocTCjL9ouw14VbF8kMzdDaPov9CvJk7ui4=;
        b=YAqIXbEuA4yrFdZR+319tK3B70evJgq8nJLjuO5/XcKTmNSx3NyAi7z+pS9xDbolgH
         UEHs/rBX5cWN1lauu/px3Qhkq+dSpB2rip26QOv8moH7eh3dGQnXbPTTeLz4v90/HEwN
         odttmHzJZebOOzuKw58wYVxPrT5slIuNeFYYUrMsiMZF+Dv+zwW9H0JxFYL0wlTfrGWq
         kvu2staZx85H7VVZxOnl+8zLMG+Srd0WSpAEiehol0iZuv9yTUze9AuQnWUVY5vsZTh8
         cL+OGkRca0yjUjKGSzwKhu9MxcoWc0IyRaAfInXT/zlFwOje2nkz0PX1hAqmoJH/F0CW
         iUwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528851; x=1687120851;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-beenthere:x-gm-message-state
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ACphGT4cYocTCjL9ouw14VbF8kMzdDaPov9CvJk7ui4=;
        b=KhvP/vln18rxT5RcMqu8XD6vPj/WZoD4UbHYNrgvYuS6ZmKg+K+pZywj4qyWgg7Z+u
         M4TtI9IfDks9U03FJg1QxvlHA6k6YVhsySvXAB+g8Mqgsm9/5AooY0RK9f0JXkK+cgve
         V2iaeS8ZHyV2rBwqL93i4TuYiwS/I7TGKBHA63iJsTCuI8aTlEHzvOCtOH3RKqKV18H/
         FLU4Zgi8EXfbjayfiN7HOMrm7Ym1NmQG9Sx3x31DNkTansTRa73hsanstcGMGLWFIzBc
         YvYs5wTrGRGHaVVtf/OP4BJMtbwlS9oiI7BAEmD9bStQMOxCW9TkJFCBpZkipVC4JILk
         jJGQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDxQF07H3hwALYU2hTqzs7DkE1pIlDoa4ZM7m70bxNwCZxY2M0jW
	zc89/C93fVI0FwrpdjGmx1k=
X-Google-Smtp-Source: ACHHUZ6MEV17MdB6zv79CePTsTFC3nxHXOPVr4I50CnI30qhm3vjIja+tLlR7qBZdDLIfRC+s/Wp3w==
X-Received: by 2002:a05:600c:3655:b0:3f4:253b:92ac with SMTP id y21-20020a05600c365500b003f4253b92acmr536680wmq.0.1684528851333;
        Fri, 19 May 2023 13:40:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:1da0:b0:3f1:7989:fcde with SMTP id
 p32-20020a05600c1da000b003f17989fcdels1477443wms.1.-pod-prod-01-eu; Fri, 19
 May 2023 13:40:49 -0700 (PDT)
X-Received: by 2002:a05:600c:3797:b0:3f4:2819:7777 with SMTP id o23-20020a05600c379700b003f428197777mr2334043wmr.38.1684528849598;
        Fri, 19 May 2023 13:40:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528849; cv=none;
        d=google.com; s=arc-20160816;
        b=l/Zrw9PzkaJIa2GMDAX7qP1RtZwRklPzPLgYwkF7XAmjI2o5P0w3z+cwASb3hKFhge
         3tlCHWGq3vufjpjZv9VtK3H7IRxn7gWdspuZVRvsGZ1Aj+pHEdnGZ2a6NFOsN4pfX8J8
         obH8sIRrDf5SSK5r99Ysfx0cK3maRWN+PkDzty5sFyl5M6ePW0F9qic7H+0IyjVWimcb
         OaDLzfk4xjHmJmrsdRK7BGx57Hxipq+SZt4Yc62N3C99+K0BAC/XdtPvqvKjErkJoe3c
         SIeus2tJ6cbHW/vyDZmM7VT7zjG9ig4h4sekOmCKIkoGFPHnqNaxwmH/SYvNTLwGDG5+
         e/AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=QU3taNyJSvUU/qX8DyKpTIBoDLz10KRHiF1ukkPUbck=;
        b=OCx7jKTS89+zytK11BCnr/QI6+XkefUyYuvbZBW0h6TVwRA5hi3zP7E+urv83D7NEs
         RF5O/ZRM8ItHXPE56rJpVTQQ5lE7r0czRzP400BWKkiedppLlJNxMW9gLOQqiv8QBTGd
         URYhV513NudG7w0zSZJFqDxyqeirCl1AKh8NgFkeWjl/owKusAvDlpbqbGZtM8G3k5Jj
         L1k2+QIPMBHC6DBXNrB/xJ+wYIlu472lsmKRYiwiakT4ayrsp8qZF/U8bypB8WIHncrY
         hCUtC9K6SZotu+AbydgQG0j6Aueqm1S14cnB/gEixnhXzCBn2YIIK7stHJIsfUsp9zSd
         iSOA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id he3-20020a05600c540300b003f42c1b8171si18590wmb.0.2023.05.19.13.40.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdY13SMzxr2;
	Fri, 19 May 2023 22:40:49 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 25/73] core: riscv: Add CSR definitions
Date: Fri, 19 May 2023 22:39:45 +0200
Message-Id: <20230519204033.643200-26-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, CTE_8BIT 0, CT_TEXT_PLAIN_UTF8_CAPS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CT 0, __CTE 0, __CT_TEXT_PLAIN 0, __FILESHARE_PHRASE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_BOUND_CHARSET 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

RISC-V has a bunch of Control and Status Registers (CSRs). Add
definitions and accessors for those registers. We will need them later.

These definitions are copied over from the Linux kernel.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
[since V1: add helpers (VIE_SIE, =E2=80=A6)]
---
 hypervisor/arch/riscv/include/asm/csr64.h | 197 ++++++++++++++++++++++
 1 file changed, 197 insertions(+)
 create mode 100644 hypervisor/arch/riscv/include/asm/csr64.h

diff --git a/hypervisor/arch/riscv/include/asm/csr64.h b/hypervisor/arch/ri=
scv/include/asm/csr64.h
new file mode 100644
index 00000000..3c4fa00f
--- /dev/null
+++ b/hypervisor/arch/riscv/include/asm/csr64.h
@@ -0,0 +1,197 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+/*
+ * Copyright (C) 2015 Regents of the University of California
+ */
+
+/* This file primarily bases upon definitions from the Linux Kernel */
+
+#ifdef __ASSEMBLY__
+#define _AC(X,Y)	X
+#define _AT(T,X)	X
+#else
+#define __AC(X,Y)	(X##Y)
+#define _AC(X,Y)	__AC(X,Y)
+#define _AT(T,X)	((T)(X))
+#endif
+
+#define CSR_SATP	0x180
+#define CSR_VSSTATUS	0x200
+#define CSR_VSIE	0x204
+#define CSR_VSTVEC	0x205
+#define CSR_VSSCRATCH	0x240
+#define CSR_VSEPC	0x241
+#define CSR_VSCAUSE	0x242
+#define CSR_VSTVAL	0x243
+#define CSR_VSATP	0x280
+#define CSR_HSTATUS	0x600
+#define CSR_HEDELEG	0x602
+#define CSR_HIDELEG	0x603
+#define CSR_HIE		0x604
+#define CSR_HTIMEDELTA	0x605
+#define CSR_HCOUNTEREN	0x606
+#define CSR_HGEIE	0x607
+#define CSR_HTVAL	0x643
+#define CSR_HIP		0x644
+#define CSR_HVIP	0x645
+#define CSR_HTINST	0x64a
+#define CSR_HGATP	0x680
+
+/* Status register flags */
+#define SR_SIE		_AC(0x00000002, UL) /* Supervisor Interrupt Enable */
+#define SR_MIE		_AC(0x00000008, UL) /* Machine Interrupt Enable */
+#define SR_SPIE		_AC(0x00000020, UL) /* Previous Supervisor IE */
+#define SR_MPIE		_AC(0x00000080, UL) /* Previous Machine IE */
+#define SR_SPP		_AC(0x00000100, UL) /* Previously Supervisor */
+#define SR_MPP          _AC(0x00001800, UL) /* Previously Machine */
+#define SR_SUM		_AC(0x00040000, UL) /* Supervisor User Memory Access */
+
+#define SR_FS		_AC(0x00006000, UL) /* Floating-point Status */
+#define SR_FS_OFF	_AC(0x00000000, UL)
+#define SR_FS_INITIAL	_AC(0x00002000, UL)
+#define SR_FS_CLEAN	_AC(0x00004000, UL)
+#define SR_FS_DIRTY	_AC(0x00006000, UL)
+
+#define SR_XS		_AC(0x00018000, UL) /* Extension Status */
+#define SR_XS_OFF	_AC(0x00000000, UL)
+#define SR_XS_INITIAL	_AC(0x00008000, UL)
+#define SR_XS_CLEAN	_AC(0x00010000, UL)
+#define SR_XS_DIRTY	_AC(0x00018000, UL)
+
+#define SR_VS_DIRTY	_AC(0x00000600, UL)
+
+#define SR_UXL_64	_AC(0x200000000, UL)
+
+#define SR_SD		_AC(0x8000000000000000, UL) /* FS/XS dirty */
+
+/* Exception causes */
+#define EXC_INST_MISALIGNED		0
+#define EXC_INST_ACCESS			1
+#define EXC_INST_ILLEGAL		2
+#define EXC_BREAKPOINT			3
+#define EXC_LOAD_ACCESS_MISALIGNED	4
+#define EXC_LOAD_ACCESS			5
+#define EXC_AMO_ADDRESS_MISALIGNED	6
+#define EXC_STORE_ACCESS		7
+#define EXC_SYSCALL			8
+#define EXC_HYPERVISOR_SYSCALL		9
+#define EXC_SUPERVISOR_SYSCALL		10
+#define EXC_INST_PAGE_FAULT		12
+#define EXC_LOAD_PAGE_FAULT		13
+#define EXC_STORE_PAGE_FAULT		15
+#define EXC_INST_GUEST_PAGE_FAULT	20
+#define EXC_LOAD_GUEST_PAGE_FAULT	21
+#define EXC_VIRTUAL_INST_FAULT		22
+#define EXC_STORE_GUEST_PAGE_FAULT	23
+
+/* Exception cause high bit - is an interrupt if set */
+#define CAUSE_IRQ_FLAG	(_AC(1, UL) << (__riscv_xlen - 1))
+
+/* Interrupt causes (minus the high bit) */
+#define IRQ_S_SOFT		1
+#define IRQ_VS_SOFT		2
+#define IRQ_M_SOFT		3
+#define IRQ_S_TIMER		5
+#define IRQ_VS_TIMER		6
+#define IRQ_M_TIMER		7
+#define IRQ_S_EXT		9
+#define IRQ_VS_EXT		10
+#define IRQ_M_EXT		11
+
+/* VSIP & HVIP relation */
+#define VSIP_TO_HVIP_SHIFT	(IRQ_VS_SOFT - IRQ_S_SOFT)
+
+/* IE/IP (Supervisor/Machine Interrupt Enable/Pending) flags */
+#define IE_SIE		(_AC(0x1, UL) << IRQ_S_SOFT)
+#define IE_TIE		(_AC(0x1, UL) << IRQ_S_TIMER)
+#define IE_EIE		(_AC(0x1, UL) << IRQ_S_EXT)
+
+#define VIE_SIE		(IE_SIE << VSIP_TO_HVIP_SHIFT)
+#define VIE_TIE		(IE_TIE << VSIP_TO_HVIP_SHIFT)
+#define VIE_EIE		(IE_EIE << VSIP_TO_HVIP_SHIFT)
+
+/* SATP flags */
+#define SATP_PPN	_AC(0x00000FFFFFFFFFFF, UL)
+#define SATP_MODE_39	_AC(0x8000000000000000, UL)
+#define SATP_MODE_48	_AC(0x9000000000000000, UL)
+#define SATP_ASID_BITS	16
+#define SATP_ASID_SHIFT	44
+#define SATP_ASID_MASK	_AC(0xFFFF, UL)
+
+/* HSTATUS flags */
+#define HSTATUS_VSXL            _AC(0x300000000, UL)
+#define HSTATUS_VSXL_SHIFT      32
+
+#define HSTATUS_VTSR            _AC(0x00400000, UL)
+#define HSTATUS_VTW             _AC(0x00200000, UL)
+#define HSTATUS_VTVM            _AC(0x00100000, UL)
+#define HSTATUS_VGEIN           _AC(0x0003f000, UL)
+#define HSTATUS_VGEIN_SHIFT     12
+#define HSTATUS_HU              _AC(0x00000200, UL)
+#define HSTATUS_SPVP            _AC(0x00000100, UL)
+#define HSTATUS_SPV             _AC(0x00000080, UL)
+#define HSTATUS_GVA             _AC(0x00000040, UL)
+#define HSTATUS_VSBE            _AC(0x00000020, UL)
+
+#define HGATP_VMID_SHIFT	22
+#define HGATP_VMID_WIDTH	7
+
+#define SCOUNTEREN_TM		0x00000002
+
+#ifndef __ASSEMBLY__
+
+#include <jailhouse/string.h>
+
+#define csr_from_csr(dst, src)					\
+({								\
+	register unsigned long __tmp;				\
+	__asm__ __volatile__("csrr %0, " __stringify(src) "\n"	\
+			     "csrw " __stringify(dst) ", %0\n"	\
+			     : "=3Dr"(__tmp) :			\
+			     : "memory"				\
+			    );					\
+})
+
+#define csr_read(csr)                                           \
+({                                                              \
+	register unsigned long __v;                             \
+	__asm__ __volatile__ ("csrr %0, " __stringify(csr)      \
+			      : "=3Dr" (__v) :                    \
+			      : "memory");                      \
+	__v;                                                    \
+})
+
+#define csr_write(csr, val)                                     \
+({                                                              \
+	unsigned long __v =3D (unsigned long)(val);               \
+	__asm__ __volatile__ ("csrw " __stringify(csr) ", %0"   \
+			      : : "rK" (__v)                    \
+			      : "memory");                      \
+})
+
+#define csr_clear(csr, val)                                     \
+({                                                              \
+	unsigned long __v =3D (unsigned long)(val);               \
+	__asm__ __volatile__ ("csrc " __stringify(csr) ", %0"   \
+			      : : "rK" (__v)                    \
+			      : "memory");                      \
+})
+
+#define csr_set(csr, val)                                       \
+({                                                              \
+	unsigned long __v =3D (unsigned long)(val);               \
+	__asm__ __volatile__ ("csrs " __stringify(csr) ", %0"   \
+			      : : "rK" (__v)                    \
+			      : "memory");                      \
+})
+
+#define csr_swap(csr, val)						\
+({									\
+	unsigned long __v =3D (unsigned long)(val);			\
+	__asm__ __volatile__ ("csrrw %0, " __stringify(csr) ", %1"	\
+			      : "=3Dr" (__v) : "rK" (__v)			\
+			      : "memory");				\
+	__v;								\
+})
+
+#endif /* __ASSEMBLY__ */
--=20
2.40.1

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20230519204033.643200-26-ralf.ramsauer%40oth-regensburg.de.
