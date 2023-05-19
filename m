Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBVN5T6RQMGQEDJ6ZW6Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB8B70A0D7
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:54 +0200 (CEST)
Received: by mail-wm1-x340.google.com with SMTP id 5b1f17b1804b1-3f422dc5ee5sf21095455e9.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528854; cv=pass;
        d=google.com; s=arc-20160816;
        b=yIZcXoVoP6CBugLKdbQzxrzVDMMFGpSdhPnpU9WvRyrR+q0tTQlCms85rFFuJU61As
         pjBhSUXu7l0oQV6e9gcn6KR0K13QmMjm2u1o713JWEDdmA7LrjfIxMoZ4gRbXBcQ+4JV
         VZr4b936qQ2Qjt7vEhN/0OECdMB80SMLvIpaBmw6z4RhtRdlrtDGaz8lwelvbEOs4LN3
         vTidhlwus7gJwgMoSKEuybijthl9V8TI3nkcwTvGJWgK3HNQIM1LQv5R1Nep+I0BmnqK
         reu6yiv1QqmRZy76eVURQlmIWb3iiEgGRJux63cEa4AtcNy5INcoYAYqixEYrv4xQ83d
         SdCg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=r96b9SMOa7tqYz6QVCIehOYZPmP7GaCPd98/+/goLA8=;
        b=IGRc3bfws93HFa6P+6UryL1azE+hLClsxwugU1RjjxGGnw06Z2VivuZI6r2J5o9ZNt
         7ts4/kTBNiDSce3Ti6xVPYn/tXtMwAMNJshKS1+igKNre7DCKEeFh8jxkojpRMDxohTi
         cS0wO71vcyVhayF3ZSUlaFPFJuFeZt/UGT+ge5venMGHqy0hh/PsTVJN9c565SFCb6Hd
         XZn7rMVm0M9Tgbic4nBL9cHBvl5DCTle83uPpWUPfCLuaVulAVKVAei2tCtapCbAWr9G
         75Nn9FGDpMV94iu1uLL93f9NY03kVun3sifu4txJOO5HuVJqf25F4ejiwjLgQIpBkxmx
         rnqA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528854; x=1687120854;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r96b9SMOa7tqYz6QVCIehOYZPmP7GaCPd98/+/goLA8=;
        b=mk9QmhvF/rm43lB9clEVA5/809corC7aekA9E7sKuTHW1dTi9L6QzPBYpjXAbiZWvq
         +mnDooTld1DmKcmGViHfnd4/AXyGZgMms+YOlsbQCYY2DpUuvOiz5pR0XdLDZd/Q+32n
         sczNabtIfsin6wYZCR92VIEC2SsrErUlAUKBbX71GRqPfeyeb66oR96A9XEk8gR3KTeP
         /puMWkXQuQMGIHdoSREO7ouX1WJSV/6pI15GkUbEFXkyb85FNsLdXqyfiLeX9zYe5Ol0
         UUuAYcoKHzuFwhVgsOrPv2UCLCeKrEhOp92eg5jIq/GXHAoyKJrg8jws2mSs4zVKTG0C
         MK3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528854; x=1687120854;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r96b9SMOa7tqYz6QVCIehOYZPmP7GaCPd98/+/goLA8=;
        b=BwB3EJIcoCbUy4ba6QrHk1aDUos/mtZKuXh3MFwnl43+y7EAazOpA4Zfut4gYvhars
         N6DbHd3gug/YcaUxV8c3iZnX9dFknk2TvSDJQRnDJuBW00hPQNQy8YFvMPFJqanmVdE4
         W2Az4p8z7Rio48igupY/vx3l0IgfvmmfG1qaw0GA1RSWmoetOOQFqIUSgQ5vdaEayMGU
         UFsurJXzx4bKeMSYEC5mFgGeouHkVVwX/N9WP0x0ZBQkW4G58u0mTBNScTb8VfUeZF0o
         FMvhkBVzF0h3HdEUME7sfYppixKFnJNIM0mF8xbY2X0DfztxtoiV7VQpshBy0onVleUl
         0KVw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDxla4iVUzKxvuzAcJCdgfPGTigiEiGWCD2/v/LR02u05dFmc9Hp
	p84/HBAjPuUIdOCOfHbp00s=
X-Google-Smtp-Source: ACHHUZ4LtZMCD+jAojkzpBzuwZTYhj9YBIx5NRv/jari3douPILnF4l23XnC4C3IAWJHVD1SXcbr3Q==
X-Received: by 2002:a05:600c:217:b0:3f5:17ef:6943 with SMTP id 23-20020a05600c021700b003f517ef6943mr508447wmi.7.1684528854323;
        Fri, 19 May 2023 13:40:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:45d1:b0:3f1:7ad0:c34d with SMTP id
 s17-20020a05600c45d100b003f17ad0c34dls687950wmo.0.-pod-prod-00-eu; Fri, 19
 May 2023 13:40:52 -0700 (PDT)
X-Received: by 2002:a1c:f308:0:b0:3f1:731e:cdb1 with SMTP id q8-20020a1cf308000000b003f1731ecdb1mr2222010wmq.6.1684528852646;
        Fri, 19 May 2023 13:40:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528852; cv=none;
        d=google.com; s=arc-20160816;
        b=UQUeQBwEI1GJ5gRdQEHEUR9lMUuDplqjCLYtiZ1CAN+RS4EUpVuhbyKPANlXDYjD+4
         z0DNVyKg0CmXAn9rf1orPbYuqgmy7NE0Mh4iUkEBa5AAb0GlFjEhYQxOrKgZv609fhu5
         s59Tfyuf5Y/FqLKuZM741/OQ2vdejSfC4nMMe2vUpKzzmiPsctK0DKWslYHqfW24JFZP
         u7evZAqkhQDVzNhXJaZGnh+qHThrnkIEOp8nPw/26NDF02tGQ8sSAwVOFeyJ0X0V9Na7
         yWUqMye88MG0JGVHeI4ACej26CdZlFNsLKdpVmLaJSNxJF1jrU33NhNF8mxP39ulf3NK
         zSwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=c9sJJ04MuraDR2q7JR714VpzjCvK7iphbpu3tXaQKeA=;
        b=KyvZ+bFHfu55UtuO8fqncmC0TTH05m6Daf1Vgw1dZgnXbgVUAOCfXTUDOI1mpN8H0k
         BJDsqrrYX+8srNnSrRR9iCsHKPwgRmBfxn6hS3oofxtl9eKJUcwheIf5S/DMg4j/JO1W
         xicIJsnexvDTqYFXQPrjx7TwvMoF7cZCdU6Ho4GazAgJ842JnUHM3ZvSjJjvzHCma6fY
         M5EOTbJUa1dxlQGPsMGZ3rPj9DOYC92tOTdW52iAY7lE7ZY+1+6gpmwAL6QuSz53HuXo
         MIB3HeUwYBwVqGXjocbtuHm6SFAYwt7Ab7sUOnLY4iqpFr2fQ6wmPFth1nTX/Rv7i4Kw
         jdFg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id ay18-20020a05600c1e1200b003f1728a7917si18184wmb.2.2023.05.19.13.40.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdc21rnzxpl;
	Fri, 19 May 2023 22:40:52 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 38/73] core: riscv: introduce traps.c
Date: Fri, 19 May 2023 22:39:58 +0200
Message-Id: <20230519204033.643200-39-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_2000_2999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FILESHARE_PHRASE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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
 hypervisor/arch/riscv/Kbuild  |  3 ++-
 hypervisor/arch/riscv/traps.c | 28 ++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 hypervisor/arch/riscv/traps.c

diff --git a/hypervisor/arch/riscv/Kbuild b/hypervisor/arch/riscv/Kbuild
index dd114a6c..75252531 100644
--- a/hypervisor/arch/riscv/Kbuild
+++ b/hypervisor/arch/riscv/Kbuild
@@ -14,4 +14,5 @@
 
 always-y := lib.a
 
-lib-y := entry.o setup.o dbg-write.o control.o ivshmem.o paging.o pci.o lib.o
+lib-y := entry.o setup.o dbg-write.o control.o ivshmem.o paging.o pci.o traps.o
+lib-y += lib.o
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
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-39-ralf.ramsauer%40oth-regensburg.de.
