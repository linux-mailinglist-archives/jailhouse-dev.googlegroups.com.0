Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBR6D7PTQKGQEJBDHWHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4853BFB2
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 01:03:36 +0200 (CEST)
Received: by mail-wr1-x438.google.com with SMTP id h9sf3848381wrv.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Jun 2019 16:03:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560207816; cv=pass;
        d=google.com; s=arc-20160816;
        b=OifVCCba+l1oAMrYjhdsVmrFpLUv7lIXSd8thZS3A086te4SeZA1txvH4GcWWBet3U
         ECgiaTR0dAKnXkwkLTjcbH8Pneqb8p2modGmPyRt/P9t7xcGQ9Jbkl6arzi4tE0PGJbv
         YQUJyztJ/yla0hyusq06NPV9XI6ldvQEjgQ73bA3S5gV004MuzdnZVQQQkJdyEj0d+xS
         4tD2ytoe84Hja7hDbdRc18Td6aK5HXT6n7Zbh8+Sp/ZzBSqVaOMVyBbCJFf68velOrUx
         5daagE2nRWjWEb07XAgS/HuqPHNcs0H053rjjoNEZ1M5CPmc/sGX2Cp6jm86OWy/KZ1W
         EEDA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=egr69qhI/hM84VuiQEIMI3a1RRThD+nFeFBYUyoAC2M=;
        b=RLIiFfq9QnPgVe4LAeB3lcsTqCVATQZzQGEwjFxH6YhIYzYOgd/zxhHvDJ+98EHbR2
         wFfl6794e2wIGeuzuagF7cDQ0dEUxoC6I7ESGhw7JOfquVubjJx9qHLbB2O8w+7ddyUc
         xoGQsJxgYMNqJ/J85ns3cw/v1g8Uue1QNj+yvN0T6IifyC+QkqpTDryNJHvtyqCTVqge
         Sugljl+uMxX7oMZZp/6pjl6dRzUuf/s9R9MqEqPEr4WazmPdCJzvDIJiBmwhClHZyVMR
         WSHECWWURudssGINydIS+EHpOiFd2MbubZ+/kUf7fgIjZXa3qMC5D4nKe7BcMxUNYQHG
         9n+g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=egr69qhI/hM84VuiQEIMI3a1RRThD+nFeFBYUyoAC2M=;
        b=rGt9EsghEYjFEp7kfUoeCZzIs23F+Ie9VUKs6O4A6fuiNQIhthTn/HBE4VJHQyhKg4
         d6KUAzj+5odGXvyQE8wU3NqPSQxaewXdHEt8J5ol4e+jlDD9AW0CPsJhzmNsUPRsYktp
         dDe5VrSBnPIpxLwm0z3gnDtcgiZ/XPGLqNh0OGV7ZckOWQH7gbuB7pFAIMZnbErDTn7y
         3Yvr80f5ao6Fy9CJYWL3dIK4bygbJVpm8mdBwxcvixtjLP2yiP5S9D3rITkVYsryuIZn
         KR+UhAVq0WxlpU2Tkub2MIx+HkOETnil98yANJZRIJWjqGAZjfBMHoQddR8aRLpoJrcg
         noAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=egr69qhI/hM84VuiQEIMI3a1RRThD+nFeFBYUyoAC2M=;
        b=CdvmGESa6OZ4ai5dahDiGuLYFnw+e+fXamsOj80oB6cD7pelJ3YMxR3nwRm7DgsJZN
         dqtD39UF6zPHke07rE3U3VatgGVoIrbi8kX11KYH0KFO+8/H+It9qZ30Q+x9K8NGi0AI
         ozsXqgNOGRtUqAs0xeKRYgbNyhNDuWs9jyTsFE/sIFUpfw1szB07QilPDGkv5WbR9Ek0
         NndjW5EO71boRghHFiOycXG0p3e95GsUDpI0yEIQIPdaeu9Sx6kW5bUHEQrvqTGHmo2F
         qX1VKbYUNHxZx8QkraOTU2FBjJMfyhaB27MM1DLtKNBPHnI7PqfStcariSP3sx+VkkL+
         +vHQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU+Emeb7/UvltOjGihDPYn7Qc8Jtofpq9u4gz/BqakIqPpnbwgO
	jZAMEQraFU62EDVsT3VoHdY=
X-Google-Smtp-Source: APXvYqz/noD65oAsSZyDf0JJ71e17slJJm1u/kVs7g++0GcG81B5xrMSGV2daWOfUgTj/3rcFQU+Cg==
X-Received: by 2002:adf:f00d:: with SMTP id j13mr12927150wro.178.1560207815997;
        Mon, 10 Jun 2019 16:03:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:185:: with SMTP id 127ls263159wmb.2.gmail; Mon, 10 Jun
 2019 16:03:35 -0700 (PDT)
X-Received: by 2002:a1c:4b1a:: with SMTP id y26mr11349901wma.105.1560207815543;
        Mon, 10 Jun 2019 16:03:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560207815; cv=none;
        d=google.com; s=arc-20160816;
        b=dkt9PVbfNsFsL6iw6/ARnwok8EUxX6NFo8meGGjLXmMUQ+9KQNPhxCv5idgGxwE4pr
         OwlCBev6khduNYaMh8uc6rHkKxXkAAhJaD3Pomb74hcJSCvQRZCtZk6jtAMf/uwlRt+P
         GIID/JHeZvwgqSaZFcqg+9b/ChoTfbVSVlX8k1kW1r6hFzEpmsxcNNTe7avGmx4xQlYK
         HJq1sGfZa2sUQLdh2bXQwa+Copw40997s/7EZDKdxDhHyMVLQmxQ1vMNjaHFfoIAdYjs
         HASOHAzA8zRSEmNPonqdCGSryF/4l8lnLiO1EENOM8BaHEoHa2Lwtu/fKgwDEkl2bLm7
         NbwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=mywZ+ny8002WlFx88dyLo1bpZuhy0mQvvwwqP4gFI70=;
        b=RxyXrriHCuQW3IfpOgE2JKz77ZW+xUpzZv8gfPXqiAJLn7ctMk9BUly42d3dth+NdH
         kmupL6Mg40RiiN5kf+sdj5TTIzK564hUGRnmSUQSWmM2QUJ0vfmDD6nDlYjiY8MkOQbI
         coY+zd+zv7Oer6wrffrmR33v5ygH6Qqre69qFbSHzKtszBt+QvQIQq/ERLOrJYVjqKV8
         DjWh77vwky3Cg0EIZ3nbRf55/fuRFjyuE+dpqohJUM8Lo41ceuvoZxVPVbu3+Hq5ZvUq
         rnk4mNado/FdsPftWrYu0F5tCDSJePDjVk91RABcqQSI3UU0ykRLTHt1wSDvYAovFsnh
         eJUg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id h13si706383wrt.4.2019.06.10.16.03.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 16:03:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45N7wR16rdzy96;
	Tue, 11 Jun 2019 01:03:35 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 07/10] inmates: x86: Add accessors for different system registers
Date: Tue, 11 Jun 2019 01:03:27 +0200
Message-Id: <20190610230330.21419-8-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190610230330.21419-1-ralf.ramsauer@oth-regensburg.de>
References: <20190610230330.21419-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.10.225717, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.6.10.5630002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_3000_3999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_NO_WWW 0, __URI_NS '
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

Add R/W accessors for CR3, CR4, XCR0 and implement CPUID.

Partly copied over from the hypervisor and added cpuid_edax helper,
which combines edx:eax to a 64 bit uint.

And use these acessors where it's already possible.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 inmates/lib/x86/include/asm/regs.h | 79 ++++++++++++++++++++++++++++++
 inmates/lib/x86/mem.c              |  3 +-
 2 files changed, 81 insertions(+), 1 deletion(-)

diff --git a/inmates/lib/x86/include/asm/regs.h b/inmates/lib/x86/include/asm/regs.h
index a004fdd2..cfea8580 100644
--- a/inmates/lib/x86/include/asm/regs.h
+++ b/inmates/lib/x86/include/asm/regs.h
@@ -48,3 +48,82 @@
 
 #define MSR_MTRR_DEF_TYPE	0x000002ff
 #define MTRR_ENABLE		0x00000800
+
+#ifndef __ASSEMBLY__
+
+#include <string.h>
+
+static unsigned long __force_order;
+
+#define READ_CR(n)						\
+	static inline unsigned long read_cr##n(void)		\
+	{							\
+		unsigned long cr;				\
+		asm volatile("mov %%cr" __stringify(n) ", %0"	\
+			: "=r" (cr), "=m" (__force_order));	\
+								\
+		return cr;					\
+	}
+
+READ_CR(3)
+READ_CR(4)
+
+static inline void write_cr4(unsigned long val)
+{
+	asm volatile("mov %0, %%cr4" : : "r" (val), "m" (__force_order));
+}
+
+static inline u64 read_xcr0(void)
+{
+	register u32 eax, edx;
+
+	asm volatile("xgetbv" : "=a" (eax), "=d" (edx) : "c" (0));
+
+	return ((u64)(edx) << 32) + ((u64)(eax));
+}
+
+static inline void write_xcr0(u64 xcr0)
+{
+	unsigned int eax = xcr0;
+	unsigned int edx = xcr0 >> 32;
+
+	asm volatile("xsetbv" : : "a" (eax), "d" (edx), "c" (0));
+}
+
+static inline void cpuid(unsigned int *eax, unsigned int *ebx,
+                         unsigned int *ecx, unsigned int *edx)
+{
+        /* ecx is often an input as well as an output. */
+        asm volatile("cpuid"
+            : "=a" (*eax), "=b" (*ebx), "=c" (*ecx), "=d" (*edx)
+            : "0" (*eax), "2" (*ecx)
+            : "memory");
+}
+
+static inline u64 cpuid_edax(unsigned int op, unsigned int sub)
+{
+	unsigned int eax, ebx, ecx, edx;
+
+	eax = op;
+	ecx = sub;
+	cpuid(&eax, &ebx, &ecx, &edx);
+	return ((u64)edx << 32) + (u64)eax;
+}
+
+#define CPUID_REG(reg)							  \
+static inline unsigned int cpuid_##reg(unsigned int op, unsigned int sub) \
+{									  \
+	unsigned int eax, ebx, ecx, edx;				  \
+									  \
+	eax = op;							  \
+	ecx = sub;							  \
+	cpuid(&eax, &ebx, &ecx, &edx);					  \
+	return reg;							  \
+}
+
+CPUID_REG(eax)
+CPUID_REG(ebx)
+CPUID_REG(ecx)
+CPUID_REG(edx)
+
+#endif /* __ASSEMBLY__ */
diff --git a/inmates/lib/x86/mem.c b/inmates/lib/x86/mem.c
index c6903897..e391f2b0 100644
--- a/inmates/lib/x86/mem.c
+++ b/inmates/lib/x86/mem.c
@@ -37,6 +37,7 @@
  */
 
 #include <inmate.h>
+#include <asm/regs.h>
 
 #define PG_PRESENT	0x01
 #define PG_RW		0x02
@@ -48,7 +49,7 @@ void map_range(void *start, unsigned long size, enum map_type map_type)
 	unsigned long pt_addr, *pt_entry, *pt;
 	unsigned long vaddr = (unsigned long)start;
 
-	asm volatile("mov %%cr3,%0" : "=r" (pt_addr));
+	pt_addr = read_cr3();
 
 	size += (vaddr & ~HUGE_PAGE_MASK) + HUGE_PAGE_SIZE - 1;
 	size &= HUGE_PAGE_MASK;
-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190610230330.21419-8-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
