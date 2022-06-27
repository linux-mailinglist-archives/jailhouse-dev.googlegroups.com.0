Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBLXB42KQMGQEWOHLNFY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 6430C55B9E8
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:29:19 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id o28-20020a05600c511c00b003a04f97f27asf59117wms.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:29:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656336559; cv=pass;
        d=google.com; s=arc-20160816;
        b=kDSG3I9lW7Lffl8scp3GLlfb/A7rZitzidBcUzazD+JCcf4KxF3AkYWl8Vw4SPd4iA
         6ZrOnyv/oJqaMRuItJ2YkbYRk6gYhJbq0+kPawNL3FiZFpQDeANDI1OLCyNfzM4+9N+q
         FKQ41Jv/Oq/ebfNWZJx4WF4l1ZWRptFwNfCG3KfCrlQwhUqsbtUtrmgMazHGQTb/1hEP
         dZGuw++cOqFO20GRX6PNH/YUTv9WZItlT/aHShev8DWFD+6TdH7B257CoY9wMrzGdNWO
         0AyFR95jmsKKsgA2Uml8pC9n9TKudACkHpNWqwLVncKRgGH23ePaNnEA0B/WUXjGGUj0
         MQQg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=36dA2kLZfkWRlhBBn5AL6Vs4VfpOc8bhU/8VCE2qNXA=;
        b=jEdqxnGF3YbSjfx//MGHa8XwF25ErWzobC/5BS28FXL9qNPwTFPDFtrx3MPz5KFIAw
         pM+DTas/B7rWQXo6IJdnsim+5gq3ZXET+UaEUXJ7EcFqKvHU98XJ3ZdIeKwquOJSRLk/
         ZAi0UKY9Fo7fGIIul8p/aSH8QvS0wVeabi2YuCayU4jQDroaDTEZLmo2Q7FSHGbFgQw2
         aqXb/NA3kO0rmK6dwbGbGkb3kG0f32Sf6DgY339SeHdKd2Amv2lfRE1X2cGOyVq+EygZ
         TZSbouvwNGmRpejJF08FY0IYhP34FhAG848N4ZSL5T7DpOiS/lHzHKKdmX7ar+ZiDJ04
         qq0Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b="cB+6eR/J";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=36dA2kLZfkWRlhBBn5AL6Vs4VfpOc8bhU/8VCE2qNXA=;
        b=Wq/4wN5lja0xLXFK0s1xUJcLYXVU99X0bPi/HOVUmGn0LJOSPi0wgKRrUKE1Z/FIW6
         oP0PTN71ZAP95y3C1Uo3onprjTBFTrgriHQ783KYK9PxA+ea/XQT041Dj4ovu0vDXRns
         0RkANlJOuFMApFF20TshuYFneV5809QzKvLkt27DBLpJxoQxBYv3ckSL/NphcOujD7Y+
         VYngdUqsTD3AM6NFmHOd3wgOL5biQQ5IvV3rhPKy37FVzV4KcgFHZ1IXoRR2B89a8IS0
         hULrkfeXgxlbAR+5hinF2eUJGb4+0s8U1++G64o8NQARI9XAJ2Zm07SZJfDmaGWgRzxX
         oF1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=36dA2kLZfkWRlhBBn5AL6Vs4VfpOc8bhU/8VCE2qNXA=;
        b=0LEr55ZNL8x+a0EA2aYzTW4eWOXETGdR+l5ng1EpLQvzS6q/jdLBQ+Zctj0YjO9Wwz
         hgAR/md2J4M7K71pOVbPwapj0l0eo+9oKWtavx7CwFFtyOaqnp7gQ5m7uPCSMlhexU32
         0PN4QagDKxfIcKnFcA+cRiag2eqNwmn6qtel/BbJujEvqxAqKpJ5vk6lPqN5SrVxHL3F
         Tk+7DYOqDoquTK5ikGWBIzdqQEK97oKCiHoajDVByEZmu73JEsRED9ZJZbH25RIjpdBQ
         QMZxRamF/U/ijdDVgzC+ZU3ePaw6bBMHJu8w9AzFUWUEoC49VtK4Aun8RniA+hfr2d75
         AoLQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora9Bv2OHUQHYbLde0FQ4O8xNSJuYUTwTn0rj6ShBj+59whnaQv/U
	wun6cRXQR7rq+/G2LouF1/4=
X-Google-Smtp-Source: AGRyM1vNVNvLHBCbVh9RIpLgEn4jVaTTS/v98f+w9U7zUFHoU5arBar1G/NdyWNdVQP5odh1DdJ+tQ==
X-Received: by 2002:a05:600c:4ec9:b0:39c:69c7:715d with SMTP id g9-20020a05600c4ec900b0039c69c7715dmr20361867wmq.154.1656336559060;
        Mon, 27 Jun 2022 06:29:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:5848:0:b0:219:b7ea:18e1 with SMTP id i8-20020a5d5848000000b00219b7ea18e1ls26793140wrf.2.gmail;
 Mon, 27 Jun 2022 06:29:17 -0700 (PDT)
X-Received: by 2002:a5d:59a5:0:b0:218:3ffb:e6ea with SMTP id p5-20020a5d59a5000000b002183ffbe6eamr12752328wrr.715.1656336557685;
        Mon, 27 Jun 2022 06:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656336557; cv=none;
        d=google.com; s=arc-20160816;
        b=0Eabe1fWhGtS4QQUyNxhQz+lZEhvRQNVSRkvzabhuAxNqHKkXNoWPnr5kGK7m5Dggs
         Lh89dDVj33xH+0xpdPxe7R65UZXF/xo8YmKM3GqK82maAO8vTFULDFrn+16lSHRfP7Q2
         +DIQv6aG9yBduigonrUzp3ihEQeoaiuOu44prfJrN9OyasiRLq9+cvHE4uows7nT4rpP
         zsz7dDkhTzjNhQZAHnYgDR8qXQxxITKk83Omwhgj4ApB4n8isKR/oeOJME9yF+1/vxWB
         LLNt/BEtCeWnQ3b3+qZCAemyrUzZ6RM3qB4dBDDWXQuTuOHisWEy1HzQhsb65frhaBqd
         mP2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Pb+R8vJX2LIddM0ogrez56VG62KSOE5jFUKsePmn9qg=;
        b=b5/KHPzqc+huL9SANiiU5rHDR7uF0Bz/ovZqJykMxMdzt+zUBFafID0NwTet4VXf+m
         RMieg15eEeIKvNkyrFLrVtdNsd8v21tbwTYXABM6Gk+In+h/Ig0ovHrikXNVCoSDfsAq
         NkcJJjH2Qhe1/w+6XrrNviQlQ/FMZqKN7NuHkYDnIwcuaKpCKWuu/h6rveDar9Q6u6cD
         kyIxPGPRfyjk9V+Imnz3Fdf+SW/VA20gOo2XlwSRIlEnVu8Pw4Xqh4oSOsuQbEDw8Rrq
         5x2Qo3x6aMXeaJMl0BpLolEBDWSV2gIaSEaGl1oS/L1aIz6Zoq9bR1RBNw+Oi33UO8uv
         xl8A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b="cB+6eR/J";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id a1-20020adfe5c1000000b0021a0a0afe31si375990wrn.3.2022.06.27.06.29.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:29:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4LWpV52xFJzxxZ;
	Mon, 27 Jun 2022 15:29:17 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:29:17 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 04/42] core: riscv: Add CSR definitions
Date: Mon, 27 Jun 2022 15:28:27 +0200
Message-ID: <20220627132905.4338-5-ralf.ramsauer@oth-regensburg.de>
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
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b="cB+6eR/J";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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
---
 hypervisor/arch/riscv/include/asm/csr64.h | 196 ++++++++++++++++++++++
 1 file changed, 196 insertions(+)
 create mode 100644 hypervisor/arch/riscv/include/asm/csr64.h

diff --git a/hypervisor/arch/riscv/include/asm/csr64.h b/hypervisor/arch/riscv/include/asm/csr64.h
new file mode 100644
index 00000000..15f67213
--- /dev/null
+++ b/hypervisor/arch/riscv/include/asm/csr64.h
@@ -0,0 +1,196 @@
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
+/* Definition for CSR register numbers, that are not available for RISC-V
+ * binutils < 2.38
+ */
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
+			     : "=r"(__tmp) :			\
+			     : "memory"				\
+			    );					\
+})
+
+#define csr_read(csr)                                           \
+({                                                              \
+	register unsigned long __v;                             \
+	__asm__ __volatile__ ("csrr %0, " __stringify(csr)      \
+			      : "=r" (__v) :                    \
+			      : "memory");                      \
+	__v;                                                    \
+})
+
+#define csr_write(csr, val)                                     \
+({                                                              \
+	unsigned long __v = (unsigned long)(val);               \
+	__asm__ __volatile__ ("csrw " __stringify(csr) ", %0"   \
+			      : : "rK" (__v)                    \
+			      : "memory");                      \
+})
+
+#define csr_clear(csr, val)                                     \
+({                                                              \
+	unsigned long __v = (unsigned long)(val);               \
+	__asm__ __volatile__ ("csrc " __stringify(csr) ", %0"   \
+			      : : "rK" (__v)                    \
+			      : "memory");                      \
+})
+
+#define csr_set(csr, val)                                       \
+({                                                              \
+	unsigned long __v = (unsigned long)(val);               \
+	__asm__ __volatile__ ("csrs " __stringify(csr) ", %0"   \
+			      : : "rK" (__v)                    \
+			      : "memory");                      \
+})
+
+#define csr_swap(csr, val)						\
+({									\
+	unsigned long __v = (unsigned long)(val);			\
+	__asm__ __volatile__ ("csrrw %0, " __stringify(csr) ", %1"	\
+			      : "=r" (__v) : "rK" (__v)			\
+			      : "memory");				\
+	__v;								\
+})
+
+#endif /* __ASSEMBLY__ */
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627132905.4338-5-ralf.ramsauer%40oth-regensburg.de.
