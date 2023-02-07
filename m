Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBY4GRGPQMGQEFHUAICA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A4C68D680
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:12 +0100 (CET)
Received: by mail-ed1-x53b.google.com with SMTP id ev18-20020a056402541200b004a621e993a8sf9928128edb.13
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:12 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772771; cv=pass;
        d=google.com; s=arc-20160816;
        b=LVrX0Me3DxsUpu3gx2tCFp1keRII73Mhx/LwxPZGqIXa9uIoGENUVRcwnNfxbVjUsY
         S0Cq5j5bnPayc7qU+KOoYs+xp4SzEjDYKi5ryOmCF4a58cGIF/HT7LrP2vkI3EocTsqE
         didDS+MOox9f2IsyJSlUnUFfe3btUnCYo3Bv8rETdojxpxQsr749Oyyq22cgQg9Ce5v8
         RWjQ8QXL8Ie1riCHDLt0DCsHpNdrn81V7x7jR7ssh0qTmuJV6UG4t6SyYGHC91wD0DaQ
         OrNKVxelTVSqsNQfebE1UBehjTz08mCC7QRm80iq6V86tFii4c9BM+SOOG5AgFz5zrHY
         UKVA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=ejOVgk7Ta9m1qwqT4GgauExWoxpA6bCPhMiXXIFPXtA=;
        b=DbgAHJk8cg2KwuNuCUD/RGfJiYUZXdAuaUXOn4d6Va5D74P5HvSaiIZVXoAsFaupWg
         /uq4dECSCce+S6fbmTWslRo/H1Z2AMyBOwghOdLnr0u4FDln3PcsnSvRy05y1fI44TYK
         6JqTUpacv+IizdScbOO2SgCAlqOXJjr0IpkL2WyxJnMFP0TONa2MLZP+BohcPYuvSevn
         x643+b/G09A5FL+ZHI85/n7TdMumGm/PB45QpL7ggr731Kk6x5e8ZSCwxzIbSy8QDpgh
         EZZcqlK5OyMRqZ80AZoTVHskRXf0ykF2xVecirScNvhpkMyXH9CXLo7VKGZM0lIa1DZo
         azWg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ejOVgk7Ta9m1qwqT4GgauExWoxpA6bCPhMiXXIFPXtA=;
        b=q5Vy6GTvHHCknHz3ubnCp4LkpLRPsT/PSjIk2c76fyyJ3s50KRoxZkc/0xn5dfha+H
         Ger7EFUWLbKnHzV5RfQ2r3MUlDDtUDM+c52SKbfKLkHq8N4TeeKS2cUaS7ZgmobPcQnf
         kBhb3W5UCSx1cZNejNkIfeMJhEfhFwalBjn8bb6UlKIGMmiLhx7w4gBjTlFNuBp1C5z1
         l7VebzeGh7TgJvUCbZXnrFby5N6qpaIoU8VFiOMAmIIUA+0Uwcz7PV5gDj+I3Qe2hf/x
         ZrMg6qr6COHbAZIzNF9B10Ewn+l3w8veELKKJmmMNMEPv7IE5KWntaSDPZQH/vHVBDcv
         RfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ejOVgk7Ta9m1qwqT4GgauExWoxpA6bCPhMiXXIFPXtA=;
        b=Ywxkg7n0Y7D8il65CEnVvz7Toj0hMnSDYMQIGMelOhu6QvZZSDu9yFpgsdMB4lvnp7
         ZcAN9XLOij/1r2Av24NtmLHo19ThWjzI+hzPQg8mH7bkI8UcAlMxPXa37Jy9OKRmfCCM
         wx3xm2dG7qP+FxNyiZSrBJk9Hh75HstIcE5naXC0PJ1QUainEPUROk9k1xfMy4cdnyDR
         AShEDMVyEFD6BSiaevW8cfrH7cLzfRbPLGHg5Os2ApvPNo6E/M4vyCzHzIfRae3/4tpM
         Uf0tmYG9s2tiLU7rQ+YzPCcu+v7zIuvvrhyCm0bKJmvRFTVtY4t8Lq/95F9/6zsWPWI/
         JZJA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKXiBO9VZ3aQfpe8oC7m5Cj+PydaM8c0HmmF+K0Q8UDfaSxeMFFR
	KxbCKQ7TxaLP+iXZaEWTqaY=
X-Google-Smtp-Source: AK7set9NyRwQ1wXIOHGYwC6C9yrOakGKpAQ0CPwe3amG+nrPPMgvxgVbdkatZGZAVSmKarStOJH2Zg==
X-Received: by 2002:a17:906:1c06:b0:884:2d1:ab91 with SMTP id k6-20020a1709061c0600b0088402d1ab91mr829268ejg.271.1675772771904;
        Tue, 07 Feb 2023 04:26:11 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:a08d:b0:88b:4201:c901 with SMTP id
 hu13-20020a170907a08d00b0088b4201c901ls10340666ejc.3.-pod-prod-gmail; Tue, 07
 Feb 2023 04:26:10 -0800 (PST)
X-Received: by 2002:a17:906:942:b0:888:7ac8:c0f4 with SMTP id j2-20020a170906094200b008887ac8c0f4mr3632539ejd.25.1675772770296;
        Tue, 07 Feb 2023 04:26:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772770; cv=none;
        d=google.com; s=arc-20160816;
        b=Z92a81gIZ7NU4T5bhUPnvwR1YroV8C2uQLXgnaQp9C4sEjPic5c0yLLSu0go3hmy/G
         ywRkpnj1k7SuoKeLCVecclcueISR6gZrN05MTo+pyNW4uAk9Tn7kSuoFK7C2ZXuM6d3p
         9EWYL8wSrmHae1z297At+ZpkWTrSgndA76WeDFg+/k9g+PxpS8z4roxhFmJxFEMG8JC3
         7rrv0tWYrin3f0ypVbTmGo5QUKJUtTxcbZErNYRWxBDnhen1GUKWHpuHkY0IbZ4XUd09
         oJ987grFNwgT+DpsYMdcRdYSFZjGC/bvuQbDbGSBVSQKA8NcDHbu8NzI2TLzfOr8oimT
         2NCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=vzK3SP6GmNRpuBpTmXSjvb4/fQ8fYnhddUcFzG1koiE=;
        b=cPMejWQLFJzb1QqXu5oR72M+SMx8Qi0fyGodTvNh5NQoxMqFhxQfVdnGlHl4oVHFl+
         30rsZ7Cya4CeKkxeZ8ZasFZfL4ppKwU4wqCQvW0knedUrMM+jl2x3d5i0Z4HDxSYdpfL
         MzcnnUj6hhAFh3zSfxITuT/q9qtDuyqM1ZsPTmPQmsfp4eOUFa6QLqkG6r2LAWsb8ify
         FetWfUWZNvuAI8SJQcgPNnFFYGqZ4p2CXseaulgMH6D6t193F0CBk+mJSFEZ9w0LEccI
         GrajEAsMmFUKa33TEoZNI7P4ueEkpDFOJegjuQodM8D6Xf2xvBf8kPfUabOJwSdXOuYF
         XWhw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id sa6-20020a1709076d0600b0087873f29192si853639ejc.2.2023.02.07.04.26.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:10 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RP5FL8zxvr;
	Tue,  7 Feb 2023 13:26:09 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v2 19/47] core: riscv: introduce traps.c
Date: Tue,  7 Feb 2023 13:25:15 +0100
Message-Id: <20230207122543.1128638-20-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_2000_2999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FILESHARE_PHRASE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0,
 __URI_NS '
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

This commit add the stubs for two exception handlers: arch_handle_trap
and arch_handle_fault.

Rationale:

On RISC-V, there's a scratch register (CSR), which is typically user by
the supervisor to store its stack pointer. On traps, the guest/user's SP
is atomically exchanged with the scratch register, to set up the
supervisor's stack.

Now, in case of faults when we're inside Jailhouse, we would have to do
the same trick, but, in case of double faults we're doomed anyway.

So instead of preparing a new scratch register when entering the
Hypervisor, I chose to simply redirect the trap vector and reuse the
stack, while the hypervisor is active.

So if we're trapping the hypervisor, we will later end up in
arch_handle_trap. If we get a fault while we're inside the hypervisor,
we will end up in arch_handle_fault.

These routines will be called from assembly.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/Kbuild  |  2 +-
 hypervisor/arch/riscv/traps.c | 28 ++++++++++++++++++++++++++++
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 hypervisor/arch/riscv/traps.c

diff --git a/hypervisor/arch/riscv/Kbuild b/hypervisor/arch/riscv/Kbuild
index dd114a6c..4213194f 100644
--- a/hypervisor/arch/riscv/Kbuild
+++ b/hypervisor/arch/riscv/Kbuild
@@ -14,4 +14,4 @@
 
 always-y := lib.a
 
-lib-y := entry.o setup.o dbg-write.o control.o ivshmem.o paging.o pci.o lib.o
+lib-y := entry.o setup.o dbg-write.o control.o ivshmem.o paging.o pci.o traps.o lib.o
diff --git a/hypervisor/arch/riscv/traps.c b/hypervisor/arch/riscv/traps.c
new file mode 100644
index 00000000..f61dfc1a
--- /dev/null
+++ b/hypervisor/arch/riscv/traps.c
@@ -0,0 +1,28 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) OTH Regensburg, 2022
+ *
+ * Authors:
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include <asm/processor.h>
+
+void arch_handle_trap(union registers *regs);
+void arch_handle_fault(union registers *regs);
+
+void arch_handle_trap(union registers *regs)
+{
+	for (;;)
+		cpu_relax();
+}
+
+void arch_handle_fault(union registers *regs)
+{
+	for (;;)
+		cpu_relax();
+}
-- 
2.39.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230207122543.1128638-20-ralf.ramsauer%40oth-regensburg.de.
