Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBENITLTQKGQEKOKT7BQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id E12FB27CFA
	for <lists+jailhouse-dev@lfdr.de>; Thu, 23 May 2019 14:37:37 +0200 (CEST)
Received: by mail-lf1-x137.google.com with SMTP id e11sf910296lfn.19
        for <lists+jailhouse-dev@lfdr.de>; Thu, 23 May 2019 05:37:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1558615057; cv=pass;
        d=google.com; s=arc-20160816;
        b=SU5vWCEJ9Y6HrdYbs6Mc+qvJQ6wsXXfcKQSwxvcoPVRt3VWPh0L1kmmN+zWYNOcIQy
         9OqsW6TsTpy3SqKKWE8d2ND6bLr38FIY6Iochjtku7IA1f5HQ85SQNML4eluEarwblDY
         EgGnFMefd0Unf5d4nMAKJ4FcjylRgzq986ccqOqpGrZrgnZOyIsD5Ca45/iXZmOgTlab
         OQrsgH51EJadL0p7Ph039/8L2/Ha9NrovUpW2RrXO97ZjL1a4YphzpYMZKiPp/SP/VR4
         a+cc5KLmVf7obtfjNiGQvNJ3fVUWhK/M99EO66s0JQ2QlOoWI6wEyp1SGsc+WZSpwZvL
         x+6Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:cc:references:to:from
         :subject:sender:dkim-signature;
        bh=0wDzKlGGmxl6Yd6edL8R4o0p0tFDgdlvvkyx/b0r0YQ=;
        b=vEsK+K+m4B0sPn6xD7D2fE4NQF6dzWHcx+dWEtDeTlbCYW7zyhYO4iRzo/irg1fgFZ
         H5Zsr9HgahJxTEkCZcxY7b3s9xo1kAWLT96M9Q7RV8jwIezuRNb0oA5aylUaMDPO29e5
         n7kWfzWVYFBiQHBV7zAUEeJ4BUp1Q2qsF1ZhKDro+z1RzbjgBuwWMR1tnq4mRFXpU94y
         Xtjzcy7hS2g+RbhPQekE5gjRRMieaHhrMfSl8e4q7R/TTzuGhnXwV3/20WeD4XlRq17Z
         APppccDws4q7mL+fENWBB71LDmdPil21dzDWVG9v4uqNiIzz4g+FeNKS3eaR5cPmgSlZ
         HC7A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:cc:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=0wDzKlGGmxl6Yd6edL8R4o0p0tFDgdlvvkyx/b0r0YQ=;
        b=NGXSWGsdW4ccLoTyH+BLd5QKpyMIRrnIRFeajpBXq3zsp1U7GA31pvxWshhryWCCHe
         hPcxoAkuQ3HtLXLEIooBcOU5AtDXAD2zGh7t0afO4JZJA5Xz0ceU/UAFxt1WvXo/p7AP
         WAQ78njeIN6S7fvIXE2ifcb108HCP9wMoI1yGb1O4U+R5V1fuzqgTdvMv/BrRrBVKuLd
         HVkiWQWziWayuetAaZtnZ45aXTdsCs8/RQRlCESSbRIevYPn9v8snXgcv9xvyy1WYy41
         A6velZ9+cJPaIv15/zj1jY/Rmm7v1FaIY6oDh8Wuk2EzpYOoPSymKhz5PzZikNf1qBWD
         Qwlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:cc:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=0wDzKlGGmxl6Yd6edL8R4o0p0tFDgdlvvkyx/b0r0YQ=;
        b=OvTJt5eFZYu/BLDwjotTiYo37Fvs8THtEPUAZkc0Nt3HHN+oy1asTYXgwVvt3Txi52
         YwuYFEqvFMYz98aGEmMOxwIRiLv4AX9iahTear24jlH5kF9UO7qnHpGCqaPMu7B+aslU
         leZHa6z4e2ZHtf5UMrXN5toDPcNeZviMyzSjYjpRfizLSOPZTqCMTMUvB4ToDqyFp/mD
         iNuRAQhm/7vWuhvcIuYkq69RyfAclbKz6Of57BH86aVGYeneHETGjKuMP9k0T2a4UKnn
         tmbsejhjIBTikuka97yWZN1SWTW1xmO9CshHcySsN4/ECCW1lMWETKUX0Qfn4+KMzmAT
         FO4g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX/tOK5tq4f+DqbTzCtPnpQ2Zl+8vvTrRoWhU6id02ySlCf9yie
	p4jhV6/i32x32djFYSP+pIw=
X-Google-Smtp-Source: APXvYqy+LjCbwd5AENMod4dhI7QeF4mBiPGosa2Aow31esGPETjAYN0OdK0n04+puF7PKibdt3axzA==
X-Received: by 2002:ac2:52a8:: with SMTP id r8mr10683647lfm.20.1558615057440;
        Thu, 23 May 2019 05:37:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:5611:: with SMTP id k17ls554636lfb.15.gmail; Thu, 23 May
 2019 05:37:36 -0700 (PDT)
X-Received: by 2002:a19:c312:: with SMTP id t18mr26089220lff.165.1558615056756;
        Thu, 23 May 2019 05:37:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558615056; cv=none;
        d=google.com; s=arc-20160816;
        b=euMNmrJ+PMSwVlVUtNwgKZMg/pN0T6CXjpdnytCjnGtO5gv3Yo8D54VxA+ovHRFUo/
         PWR60mAXCjvB//1Ndvvg3cuMhVR+Qt1PTTk/Lvr2fiy1kOFJrMN5hVzu58u1zQydtbPC
         MTxc79EHa5cc8YMzLE1GzUd/KP+lOgJMpNrffmeHWQM9T9k5MImz2NddaUW5Y9txOrIr
         d7DGzJeFJt1N6EPxfofJCJkeouywVnB92xUDtDV7rHOZLIQc0KderwEFrEDgnpM/g+br
         PB1r1fW/Pwm/KWOg+p/QekFNdhh+B9xpGmXDyPeDfb++wTuJkzgADbZkWxBpwuGKmMSC
         wEMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:cc:references:to:from:subject;
        bh=MSNEp3eSRop+V81I6fKyh7dCXDIcYoo7ko2XnFTuWO4=;
        b=wswSnj+R3fpP9WlJo2KIFt7EboO5JN8yhFB0gX+SKT7UBX9p8ZcgdH6abL8pZ1sKhD
         koaNeI6RrlEU3l1EfG3WN4AfJzyXs9ahohmCdXdzPSAEFL2wXvBGDSKxavB+zLy2PQla
         KjVLElp3YkFCRKHHiG7s2ZoI42uUrcTOAFA2xZw0Sg56nEKiFIf1k4vC6Qy7W2wwBPfn
         d4ygsiR5ne3jiDzJ8k0DJwCBllKqTfVEMDNRaNc3M7sVfQctnGeeZASaJYnk6wtF+nlC
         uL3SDw6DpNgy3RnzG4nzZTrCZUuKnVz82o3WHHZY92spEOI0WbbtsjE5L7DydhXC5fR5
         JH7Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id a20si2120285ljb.3.2019.05.23.05.37.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 05:37:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x4NCba4p015128
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 May 2019 14:37:36 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x4NCba1V016219;
	Thu, 23 May 2019 14:37:36 +0200
Subject: [PATCH v2 5/5] inmates: x86: Catch and report exceptions
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
References: <cover.1557914551.git.jan.kiszka@web.de>
 <69941a22af559b8e3afc7cf078cf774e4593f79e.1557914551.git.jan.kiszka@web.de>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <ed86a547-55fe-4a9e-1c77-4c6e62b1fc08@siemens.com>
Date: Thu, 23 May 2019 14:37:36 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <69941a22af559b8e3afc7cf078cf774e4593f79e.1557914551.git.jan.kiszka@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Add basic reporting of exceptions that are triggered by an inmate so
that we stop translating all of them into hypervisor-caught triple
faults. Reporting is optional and need to be enabled explicitly by an
inmate via excp_reporting_init().

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---

Changes in v2:
 - reorder state setting and exception dumping

 inmates/lib/x86/Makefile         |   2 +-
 inmates/lib/x86/excp.c           | 169 +++++++++++++++++++++++++++++++++++++++
 inmates/lib/x86/include/inmate.h |   2 +
 3 files changed, 172 insertions(+), 1 deletion(-)
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
index 00000000..88c48389
--- /dev/null
+++ b/inmates/lib/x86/excp.c
@@ -0,0 +1,169 @@
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
+	/*
+	 * Set the state first, in case enter an endless loop while reporting.
+	 */
+	comm_region->cell_state = JAILHOUSE_CELL_FAILED;
+
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ed86a547-55fe-4a9e-1c77-4c6e62b1fc08%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
