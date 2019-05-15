Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBZOH57TAKGQE4GTU64I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6D51EB96
	for <lists+jailhouse-dev@lfdr.de>; Wed, 15 May 2019 12:03:18 +0200 (CEST)
Received: by mail-ed1-x53b.google.com with SMTP id c26sf3062235eda.15
        for <lists+jailhouse-dev@lfdr.de>; Wed, 15 May 2019 03:03:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557914597; cv=pass;
        d=google.com; s=arc-20160816;
        b=yjOjvU2exht5MvRyQ8dCOgMKgLlK0aj0gWTUjcXSiR6VcMIqGUojkzn7Pw4SRaH02U
         D43jVq0W4t+WPoX1+ZvuLLu4wHcErqzyswVDYykGHKQJu8HGdBEt4J+vpb80nC6ETu/L
         SdlbwkAdVqA13Xg20vYEGz1wrRbRoHxhIeS2GtNkxd5tqjKU8J4niL9jX+LFCqBBoAoW
         oU1DrwDArD4m3k4zs43r2i8oHPwgv/E8z9N481Vfs9lY4vFahi+Tlpa2fmjkI/JiWWlt
         aKPXAYxZe3Ab+YPyQ/0R8pvARia7RG2hX5qa8kINutwO/HA9TeK1GF7n8NRDxYbhMb3J
         n6Sw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=noGOPbjYhGVJfYflfnPoZD59VFPSKAGvhJBoq7SV37U=;
        b=sOLSugECqiMIAyQN1ntr6dbuaY2S3BPypfLT9hSS09uzvtnDSo/EWUPXaGGPuUkiGW
         wSykpWSq2n0H+Xlst6RX7A1EyVfJQtEdMC8PpYRsboXxANHJK4PiSwufmGooP3TUYYAF
         +0bSzD0BmpToIgbMgwBI6Gxmh/Jy/UVtnahFB0poQhl2epu7khNpe90PgyRfgHakAyb/
         jXPWWC8ix4g3cB+Y7O1OZ6xVds9TIP2m4xWY+qk2xMVEnW+fLjwLHalHJQk/gAWXCCiC
         IyohONLDtRKCpj35VyRNqpQ6kgPSPCw0om9DtGWOsuL2p36RX0l6IGAJCyrG29KT9ytB
         pq9Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=cdR3SPwa;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=noGOPbjYhGVJfYflfnPoZD59VFPSKAGvhJBoq7SV37U=;
        b=RTRkOpluwx+Qs8qREhspmqPvcUPo72d/PwjsQgKtp/fBTH/QTQQ0Tx8gLtM3X/caDl
         PCWyySbu01/ijixYl21lp38RSR6RntrgnBuJ/rrzX+S+nnSv8KjxqBDFrXIPwhxD+xWF
         3pS3PByA1uFxpsxmafrYBhmYnu03YFy8+wWDgtZPDtc3sWeiEcRcYxfmgdja9AOfBdwS
         wieLxEmwuTzXAZJbTS7YdBaayouc12trRFEn4NyyATSmkhjh3WJcbWHvcfzq4ivGvYJk
         9fCIN5deMl10O1eVXBfeYBtK506MMLTZjWrwKEcVN+GNa+xtECZnsqkd/4uaTm4qnDu8
         ytjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=noGOPbjYhGVJfYflfnPoZD59VFPSKAGvhJBoq7SV37U=;
        b=b3IpDdNmkav+PPDuBjR52AhKtn7WMq/RGtul5gS0nrgHuidbW7VG/9LDF63qsmopta
         det/NqQ0OQl/cmdyiPi6nJWK162Me7DNE1ASTCP6NVQJjH9IDx4c6cDVRPECu/trLgdY
         95QGzq/cdYq6zjJLrxOFH8BXfhSo+eTCRur0k8HDVtn48o53KJmTQxKalRgE0aOPxqTo
         zE1OYMa16FNOJpc/SBYTYlqJaKoSXDO616ICbDVeTstdx8sf8wn3M6euotPcDmi2jcwh
         zSyQe2OoYPUr80f4c5NFlgwFEtCuC4AlKjtyWX6/LuDBXMuqmFSBocmbaCeI93xjTrkv
         2+Ew==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV58YHKe0BboNFGvb20DEp0029/2WLxrX/BnbNQknxcx8jQMZ3m
	DwRY//Q3IHHa1uwt7BrA5KM=
X-Google-Smtp-Source: APXvYqxRXm2Cu/AeyhP72E12hxJsGRSIdxa6/Tb3nTwQ/giliTxM/HvMZ0iwAcwEaTssXdKQGP5fSg==
X-Received: by 2002:a17:906:c782:: with SMTP id cw2mr32530361ejb.102.1557914597749;
        Wed, 15 May 2019 03:03:17 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:941a:: with SMTP id p26ls571662eda.16.gmail; Wed, 15 May
 2019 03:03:17 -0700 (PDT)
X-Received: by 2002:a50:ee11:: with SMTP id g17mr26208587eds.242.1557914597278;
        Wed, 15 May 2019 03:03:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557914597; cv=none;
        d=google.com; s=arc-20160816;
        b=IlQQ0dTqQirZ50UqPkLMfDw7rFWDNOAvP/yZPHaije9NKk0yw6qTZjm3fvOwBK/QNm
         p2B5bISvwq1DLYUO6uItiQB9D4PuECuxRN8qLioyQ2XwdISDBVvw9VaJVuXVZZY0kbIu
         Z+DW8tbngLPAPWzuNazMGp7mS6CBfn8jEBiIfnLL/5teouCzco5VVga1r+1G9tv28ibA
         5QGQjIYg0FizMQ3sDRmKkqfSFSN2m60oSEAl+nLIuyYUtiNF3ttQOyRzOKtaXf99e+LH
         lVDpbRDam5N4rthfBGj3n1GN66ERtwItdAkLodQNUEVy12GfbpU1LTHNDPq+xByXa8mo
         1LJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=j/sntRsWCntTsyc6RoWdbgxnruiildvPEPk2zb02AKo=;
        b=mpPaW/0+cOAjNzENn89mqQFWF+ZxXBzNIbiDnvu6RVjLZ8Dv1/3r41sD8R9wBkX57E
         Hf29NCdP/IXCPUtvEUEZ16fWun+7XA93wEvapSNZMdCVDLNOroVPZ9H74T+/API7yxB9
         BzSMT/2C7mFlBzg7OCo2aqFGtWHlv3wgb9/feS+ItgLew6FxQbvG0bG+J8da7pET1pdN
         Br+RIPRM6aFJrY+eTp3y8F9zJV8qAobSUuMMFGAdydMYWKsuIRNQDQQ9iHyUlvApoT4A
         s48PycfjVvqLz8kj8WFbXqJzDinwO8cDp7jalNxa3iL9IePeeSaZppByCpO0QlVjYMz4
         LCUw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=cdR3SPwa;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id w5si181792edw.1.2019.05.15.03.03.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2019 03:03:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([95.157.54.22]) by smtp.web.de
 (mrweb002 [213.165.67.108]) with ESMTPSA (Nemesis) id
 0LilYb-1gq9QP37Eb-00cvlR; Wed, 15 May 2019 12:03:16 +0200
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH 5/5] inmates: x86: Catch and report exceptions
Date: Wed, 15 May 2019 12:02:31 +0200
Message-Id: <69941a22af559b8e3afc7cf078cf774e4593f79e.1557914551.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1557914551.git.jan.kiszka@web.de>
References: <cover.1557914551.git.jan.kiszka@web.de>
In-Reply-To: <cover.1557914551.git.jan.kiszka@web.de>
References: <cover.1557914551.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:uIoa6CiWzJvlSyIKRXNGFMoTEoSXQv0hEmutrFDG2cQWV5nZe6R
 myGVxom6fw6iDg7zw3SxoS1U2JoBbl/CB/3JV0Cb7R3OW1lxO3qJRJhbAeoxD0Tj7F032GM
 Dh5BkCGSjn4VSBXP8WRn7PD4szeAIooNCb6QbnrO+ifYXe7qlL6J+EDX4oUxFwg3nLO6/pq
 xI/MXGGODtx5UynxSa/0w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Kx14w/YGJdM=:4VDJhhtgTfHh3OpWKaFXQd
 we76jpaUjQ1mwACXf/2gSSx63wsUfNCY8d/CXfKhf6QvhyCX1xFSMwvh6gdDQgXqll55hDDzz
 LE7fS/EF5E+DWGAdtE+rsNPBXEwqWioq1M2bXWFndKoan60ohcKvWzYqAJNayZHyNVsqkWgBh
 dgmIy8yc8vWkCthhP9m+LjZ9/Gyes9kqlEE7aOesuEZyRbLy/4kkUfmymNBJj1wPURrp029/d
 Lr9zdd9kHmpvK9l9315/GNgGpj68ay3hKa9lcL7+dSvslIgdKwUrxommrHc4K3weUdoYw5aK6
 mimcPy1criaDRkumJJbS/9nEqM5ftm7Ak/+2cmyVSbAhqXad/7wfzkFNAd2hJcRUvjl/YOASa
 IWvSL2qooyxuuqjBHMFtFSZQo9oK2ZdHWDEa+Yru+t08in4NMndws70Fbinqgwd1Kz/9/Vv79
 4DVFyg8JDIYLWfaqNL9bpXDV7MqfQhx76iat+2kD8XX4t38W2PbjRJv+yE5Ye/75AjmTK0eG5
 GOGplm+TaN8zMLQ94GRo2LbohxL47T3l6uvVZPHwcDqOcfbOCUZLXygSe+W3U3DgwN+NDmkXS
 73bzRy1MP0IDxsYlEmWJznRRNe30h9CGIxR8UhmyqhjIyzuBkkxd3M8EgElJbwhiqKtru26sT
 bPwm6otpCQepYZAMBJQcvkSc8ibzQe6/TWg6VIgw5EaYQiPWn+uoj9KBk0Oo088ziVNcLXGIR
 euIUAqVeLKrgrd2CBJg99Q3SeySIumpsENuKYDthE+AeFN/n7sUgTKeEW35+MocU6n8lcuurT
 810Howi/KyP9Vkz8BpuUXZP4C4U/r/zAn1NGJkW6uFISXtUSUcQyqR9ZL3raI4JqZjpNhH9gz
 kzUXPxayJLLCCHk2qBoMRxNb/jaH4CvLrNXjiMmAnmW93fAv1gEaLBYUD9xkTP
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=cdR3SPwa;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Add basic reporting of exceptions that are triggered by an inmate so
that we stop translating all of them into hypervisor-caught triple
faults. Reporting is optional and need to be enabled explicitly by an
inmate via excp_reporting_init().

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 inmates/lib/x86/Makefile         |   2 +-
 inmates/lib/x86/excp.c           | 165 +++++++++++++++++++++++++++++++++++++++
 inmates/lib/x86/include/inmate.h |   2 +
 3 files changed, 168 insertions(+), 1 deletion(-)
 create mode 100644 inmates/lib/x86/excp.c

diff --git a/inmates/lib/x86/Makefile b/inmates/lib/x86/Makefile
index dc017b90..258eed18 100644
--- a/inmates/lib/x86/Makefile
+++ b/inmates/lib/x86/Makefile
@@ -40,7 +40,7 @@ include $(INMATES_LIB)/Makefile.lib

 always := lib.a lib32.a

-TARGETS := header.o ioapic.o printk.o setup.o smp.o uart.o int.o
+TARGETS := header.o ioapic.o printk.o setup.o smp.o uart.o int.o excp.o
 TARGETS += ../alloc.o ../pci.o ../string.o ../cmdline.o ../setup.o
 TARGETS += ../uart-8250.o ../printk.o
 TARGETS_64_ONLY := mem.o pci.o timing.o
diff --git a/inmates/lib/x86/excp.c b/inmates/lib/x86/excp.c
new file mode 100644
index 00000000..d26300a4
--- /dev/null
+++ b/inmates/lib/x86/excp.c
@@ -0,0 +1,165 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2019
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Alternatively, you can use or redistribute this file under the following
+ * BSD license:
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ *
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
+ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
+ * THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+#include <inmate.h>
+
+struct stack_frame {
+	unsigned long bp, si, dx, bx, ax;
+#ifdef __x86_64__
+	unsigned long r8, r9, r10, r11, r12, r13, r14, r15;
+	unsigned long cx, di;
+#else
+	unsigned long di, cx;
+#endif
+	unsigned long error_code, ip, cs, flags;
+#ifdef __x86_64__
+	unsigned long sp, ss;
+#endif
+};
+
+extern u8 excp_entry[];
+
+void excp_reporting_init(void)
+{
+	unsigned int vector;
+	u64 entry;
+
+	for (vector = 0; vector < 21; vector++) {
+		entry = (unsigned long)excp_entry + vector * 16;
+
+		idt[vector * 2] = (entry & 0xffff) | (INMATE_CS64 << 16) |
+			((0x8e00 | (entry & 0xffff0000)) << 32);
+		idt[vector * 2 + 1] = entry >> 32;
+	}
+}
+
+static void __attribute__((used))
+exception_handler(unsigned int vector, struct stack_frame *frame)
+{
+	printk("--- EXCEPTION %d ---\n", vector);
+	if (vector >= 10 && vector <= 14)
+		printk(" Error code: 0x%08lx\n", frame->error_code);
+	printk(" CS:  0x%04lx IP: %p flags: 0x%08lx\n",
+	       frame->cs, (void *)frame->ip, frame->flags);
+	printk(" SP:  %p BP:  %p\n", frame + 1, (void *)frame->bp);
+	printk(" AX:  %p BX:  %p CX:  %p\n",
+	       (void *)frame->ax, (void *)frame->bx, (void *)frame->bx);
+	printk(" DX:  %p SI:  %p DI:  %p\n",
+	       (void *)frame->dx, (void *)frame->si, (void *)frame->di);
+#ifdef __x86_64__
+	printk(" R8:  %p R9:  %p R10: %p\n",
+	       (void *)frame->r8, (void *)frame->r9, (void *)frame->r10);
+	printk(" R11: %p R12: %p R13: %p\n",
+	       (void *)frame->r11, (void *)frame->r12, (void *)frame->r13);
+	printk(" R14: %p R15: %p\n",
+	       (void *)frame->r14, (void *)frame->r15);
+#endif
+
+	comm_region->cell_state = JAILHOUSE_CELL_FAILED;
+	stop();
+}
+
+asm(
+".macro excp_prologue vector\n\t"
+	"push $0\n\t"
+	"excp_error_prologue vector\n\t"
+".endm\n"
+
+".macro excp_error_prologue vector\n\t"
+#ifdef __x86_64__
+	"push %rdi\n\t"
+	"mov $vector,%rdi\n\t"
+#else
+	"push %ecx\n\t"
+	"mov $vector,%ecx\n\t"
+#endif
+	"jmp excp_common\n"
+	".balign 16\n\t"
+".endm\n\t"
+
+	".global excp_entry\n\t"
+	".balign 16\n"
+"excp_entry:\n"
+"vector=0\n"
+".rept 8\n"
+	"excp_prologue vector\n\t"
+	"vector=vector+1\n\t"
+".endr\n"
+	"excp_error_prologue 8 \n\t"
+	"excp_prologue 9\n\t"
+"vector=10\n"
+".rept 5\n"
+	"excp_error_prologue vector\n\t"
+	"vector=vector+1\n\t"
+".endr\n"
+	"excp_prologue 15\n\t"
+	"excp_prologue 16\n\t"
+	"excp_error_prologue 17\n\t"
+	"excp_prologue 18\n\t"
+	"excp_prologue 19\n\t"
+	"excp_prologue 20\n\t"
+
+"excp_common:\n\t"
+#ifdef __x86_64__
+	"push %rcx\n\t"
+	"push %r15\n\t"
+	"push %r14\n\t"
+	"push %r13\n\t"
+	"push %r12\n\t"
+	"push %r11\n\t"
+	"push %r10\n\t"
+	"push %r9\n\t"
+	"push %r8\n\t"
+	"push %rax\n\t"
+	"push %rbx\n\t"
+	"push %rdx\n\t"
+	"push %rsi\n\t"
+	"push %rbp\n\t"
+	"mov %rsp,%rsi\n\t"
+#else
+	"push %edi\n\t"
+	"push %eax\n\t"
+	"push %ebx\n\t"
+	"push %edx\n\t"
+	"push %esi\n\t"
+	"push %ebp\n\t"
+	"mov %esp,%edx\n\t"
+#endif
+
+	"jmp exception_handler\n\t"
+);
diff --git a/inmates/lib/x86/include/inmate.h b/inmates/lib/x86/include/inmate.h
index 07a6275b..7664570d 100644
--- a/inmates/lib/x86/include/inmate.h
+++ b/inmates/lib/x86/include/inmate.h
@@ -222,6 +222,8 @@ static inline unsigned int cpu_id(void)

 extern unsigned long idt[];

+void excp_reporting_init(void);
+
 typedef void(*int_handler_t)(void);

 void int_init(void);
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/69941a22af559b8e3afc7cf078cf774e4593f79e.1557914551.git.jan.kiszka%40web.de.
For more options, visit https://groups.google.com/d/optout.
