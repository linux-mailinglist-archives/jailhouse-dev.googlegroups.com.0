Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBXUGRGPQMGQE2M5PPFA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id D684D68D675
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:07 +0100 (CET)
Received: by mail-lj1-x239.google.com with SMTP id r17-20020a2eb891000000b00290658792cesf3494429ljp.4
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:07 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772767; cv=pass;
        d=google.com; s=arc-20160816;
        b=WnbjbndWbpj5FGMgSkuwNksA2QIyu3FRPAofszQ18dC1DhbLJK6XAzWwyZ3pRtMhEu
         ciGbCNwHumSX8lP9jc5qvCwaTQ0hQT9D4dVMztCNCihVZFMz52Yh2hJRh1O/Zg0Ktz21
         ssgpF75I9vui0oAmvhurew98n25caHfbQMFfUV3r3E+9xpzTTkZ5gz0uSsel3oTHM/xn
         2d2ooSn/Cbm3eR7W80Y2szev5O1DURO9l4FBqL1pjo5xRQKMz7D55mpzYVq3RIV7NWjQ
         RiZbRE36TCx520ABPQnAnRkunIMRhFCcCVbiTTDncXWNmyAVzcvuIyu+m1ze79TGD4tD
         B+CA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:sender:dkim-signature;
        bh=i4wERY92AFyexkX5EQb40E1s1f9VEGsu/Kt0FikxEMs=;
        b=YVg5e3TWO8KyFLnRdsXqnZsGZUnT4rzsD5gULYBAC4pH2TvdZ4L/i4xb3+GZV1KqEV
         cScvkXfVMRKqim8iSAW+sohW17lTYLqXHgENb143uyEluVjh2Oim2Ajs/oYqBGBPDhbB
         81U5/FlrVyVsJnRB3eFo0Rqzo/zzAi+GP8iuo4RDerFoSNEuVMPg3anLPkF+5rTcESAo
         oxrSX4rXxCFMaGcxhC56Ys+oj2wF/lawo7R782gLc9HYPiV3K8NPP+bN91QHXBPJyc4S
         yn6jssKcxwHRObuFeMN2Zf0U0wvVOQ43U7Tfg1+nYbxNuCTcX6URCNf9SOPSkiDiOlH0
         BMZQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i4wERY92AFyexkX5EQb40E1s1f9VEGsu/Kt0FikxEMs=;
        b=MYiJpuVbr+tBe7tobEaP1gWM4K27JObH6c/l+FX15YgttMMJHej8HnAwAH3TOB76bg
         vUpLATf1mnP1F93Z7uCkuDxpuYgWmXo4GR6l7aEy36EdKxmdgtapqfvU3MuLQOWMPEFM
         3kIYWgD4Vkm9WYakxA1q0JuJax9CWGdfTrB9/gWZP6941cR2OYXX35eL2auor1/6s/Ru
         Z6hnXacGnZCh63S15uezgUyWMoyuZ5UV8oB0qURv2krAzBO9d95ODPdgQnPBP37Jbqbm
         cl6fHFBNHpt+iFXvppOq9AmXAhx4tvJo7PvIKGnBce4yxh0fI2+rwX6TNlQsRvlFuELB
         4bLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i4wERY92AFyexkX5EQb40E1s1f9VEGsu/Kt0FikxEMs=;
        b=bdVbBp/u9yzLqcCx7Mrgoc8djlE/EDjbyjTePiRkjMzcIPwQkl2Zwsu9d//d9IXV8/
         O77WNX3yw354oLb3IPmOd8/xPwqRf6tLMshcBnirbLr2HFTdYo6oDC3vCGYPA5+MWV/P
         Zo6g5iKvgregMtHd6nbFJ6H6fCJ3RMG/fe057dJzV/yx1QPHTbaLg6tkFG1eQjNNPpBv
         0gvsI+zmKCsMT3/AyLxiVVF7v16aOZ0IBIVENiaueD3nARC/dGqsnFEIRO2MQtr3UjFR
         ZHeKWAmcY41kI3oxsDRlirqI9k+iNrqR9LDTaTo4GtVmjekcde1QU/BjQR/fLEWScaoF
         dB/w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKVZGd5WwbtBKz0WTSgIps3djJ02OG98o0yhLiy3AjHu394t7CDz
	9fWZU1rPKcb0uoRvvix+b1S5HQ==
X-Google-Smtp-Source: AK7set9jqNa2XzzfDoIvJdrBGI+DTuEgW4pZIpFjVGKsE2Bh0sMtnxrPavuPAIcgvukvelt50qkMXw==
X-Received: by 2002:a19:5212:0:b0:4d5:77b2:1773 with SMTP id m18-20020a195212000000b004d577b21773mr471035lfb.82.1675772767056;
        Tue, 07 Feb 2023 04:26:07 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:bc0a:0:b0:290:6183:37b4 with SMTP id b10-20020a2ebc0a000000b00290618337b4ls2099513ljf.0.-pod-prod-gmail;
 Tue, 07 Feb 2023 04:26:05 -0800 (PST)
X-Received: by 2002:a05:651c:1a0d:b0:293:1487:71ab with SMTP id by13-20020a05651c1a0d00b00293148771abmr1359766ljb.44.1675772764976;
        Tue, 07 Feb 2023 04:26:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772764; cv=none;
        d=google.com; s=arc-20160816;
        b=jwE7atdZ2eRhOkmclF3Co5RK4UJYOFcR0GtXw5Icw05iXr5oMa1iti7zWP8whkT5VE
         pY9Avw2pqGIM0nFMQgm4hQyr4IhYyAlRr8b+TdvEtyv10rm9PaW8+kiIeSk5a0ZFM7nY
         gtNT3T044rUpILmOT+Rv2a3j5twro74k+76JRjgykyxF2uGkVwuyn3iqsWDx4uVpFlf6
         wvBIAEOGpkdPfzupZUsqpmBBoGnaSQofikItt5ssqp15B7WZwwtFXzugl1ppD4ho1GZS
         VPEXLQbWhRJNPW7a9f46w3ZgUKvKKxtPzsgXHyXvucftQvEswqJNweymqYGi9cS/vEUs
         di9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=opUVnYLrPYTSa2l5Q90MfUOWEK8q2P0ZAOi8p7SrFLo=;
        b=k9mwyg9Se3eWsO1n0E3C6cBJISvjB+j6nsKywZ0Sm6K82xCXalzniN33Y31Y2fUn+T
         6sKeEZ3v0bDvwW/zVMoY1N5vQRGzizR27Awg4Sb2qgFJLvB0EJV3ZouGeCsRfxv8rR8o
         ekjGDq3qUZMn/n/JLW38TLsLmnnng1kD9r+sEw/VcrRavxWArSJPfl4IrsdbDtpDzouH
         lcWwYVvKXMj6dxujI8viyFkJIy2om+uIzZyEFuYMyuJvWwcM9LRzs8IvFvfUXKCGun5b
         HjHKMNkBg2gsbf6iCr/L+Z6ImV4w372lKGD5YBfWq6LNKm/nR9COiBLS8Qzh17zMwEhB
         sSqA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id y13-20020a05651c154d00b00292f86f4312si457419ljp.0.2023.02.07.04.26.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:04 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RH3jpLzxvr;
	Tue,  7 Feb 2023 13:26:03 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v2 05/47] core: riscv: Add CSR definitions
Date: Tue,  7 Feb 2023 13:25:01 +0100
Message-Id: <20230207122543.1128638-6-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, CTE_8BIT 0, CT_TEXT_PLAIN_UTF8_CAPS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CT 0, __CTE 0, __CT_TEXT_PLAIN 0, __FILESHARE_PHRASE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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
2.39.1

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20230207122543.1128638-6-ralf.ramsauer%40oth-regensburg.de.
