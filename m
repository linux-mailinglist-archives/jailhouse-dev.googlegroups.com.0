Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBVN5T6RQMGQEDJ6ZW6Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE3F70A0D6
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:54 +0200 (CEST)
Received: by mail-wm1-x340.google.com with SMTP id 5b1f17b1804b1-3f4245ffbb4sf20985255e9.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528854; cv=pass;
        d=google.com; s=arc-20160816;
        b=JWmlpopP0Txd43UjAbVlk8lR9zKnP0WnhTKx8tbI+pPryLQDsgwPqrXigqiD9UDAwT
         F5AiPPhO6Nu6FX4BWEWwuRLxYaKi2xnYM0kH4Cbav36BvozpQDixFGl9tGZtgboyfRYq
         87N6Xifc3R6ounOomYSwafoTgP53GBqLJQnN0BLqeG8YEWICcOIFex7Hc9mkulw4iquw
         qHwH1IJCZpASVpevMEf1mPFmv9/vtN87UDtQ0gSbCZnftFFZt0uq09HMEKntFsFjsLb6
         /O96iDBAD63V1F3LG8H0SI59xFB2UXciOGVPNqcWFzSJhTSUHaLcdxlaaDiGfC9DBxay
         hCdA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=+vDHcHZJu8X3hhkLukgfhRb135KOod+C5HNI4BUwXvY=;
        b=gliKUIAC7G7yC4GEDmUeRpYl9yJ8BDpP2vfdSWry5LP3XqaKz4CK14dQjLDsXvnESk
         F7e765Oq3S7MKIJgOQq+5Nffx75X0TO44OS3oQ+McrDT5zRhDeq8wxFnAzoaPBNXNLni
         V3o/iqQWOMaSu8SvyHlWlcn/ITd1/s4G2fy7lGO7zdGVg43/MgMNj1aPpci0r9wI1EHx
         Nl+LyZxxl63mnHQeaNgVOOPK9YWRHllG+wws/KuHljFXAscWnEdsfdx1wqJ8yJY6exXI
         0Ga9Udk6ijo3jZHs3wuTkKbGI/hzsDO0flk1Kxil4SEsSgKbWDVerRvaaq+mAw/mNHlM
         NfMQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528854; x=1687120854;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+vDHcHZJu8X3hhkLukgfhRb135KOod+C5HNI4BUwXvY=;
        b=je8kHGH7eTnJC0Jg7DInrGDsu9y4ILEAj5FBIU3i1ohXtyeoSZYzI1epcnhcVd/D3h
         bPrj/0+XresOoQJCQJG/gPBzHZa/h3G4j69lgot03QgbEAahAPtOO+J6+OfsNI5Bjmxn
         EoeUXI6sH9LVTWncZs8oi3VASPVQTeMT7oS2jqk+fnYBGXFLDKRyaqYf0wIaVVrA/r2d
         tTIL29kszk2D0wMFIiXyg7sB6JTcSW7WWDkKUowzKxbVm9TlKtp02TBk+9HBrn5QNOjB
         3wtWf5M864mpEX4fwXWdtaLmTaC/4RCod0eF7N0+kA05dD4nBDap0RjC/NwCmaQ+IzmI
         cOgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528854; x=1687120854;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+vDHcHZJu8X3hhkLukgfhRb135KOod+C5HNI4BUwXvY=;
        b=Vo7nwLtAR2yLzqiEDQs39Ce/4S2N6uV8U/0sULasjKNFw0gD7Vvrk0VnBAd4kvHzMe
         2PAcSLd2g1OGdZK8W7av6OW0LI/f52ydVn+ya89wdhbI3nUvh6sM3VprAmtMMyoPWtGB
         GH/7ohCF8B03I5oe+lktoLVYu0dvdmi3g4iY1mDwUPQ3BFf2fEnRfa2FhROVK5XU7aa5
         CnVIta+SDB0Q3nt6CgcySsalE0bnDCRQZLsRT5ZnGMR1JSHleiY+4ti9wo2rsJxF+awc
         89cJ3MlexW7NrPnCQdyWcsPQv3Aof66TrscUAO0PQxdkurSe0J45SR2SoRxzCwqemtUZ
         O01Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDynRTx34YvdPY+xVvuBqzMOEdI0FI6tCZTUa2Tewvtm1Hp0tUNb
	WVPmQ1F1vv0QShp4VjqOs1Y=
X-Google-Smtp-Source: ACHHUZ5Vq+T/FTDiUliIAGtbD1KBO8wCa3M8+G0Icm/c6udJfFwt/AWpHwMCZXp9qYW3a5Dv2sp1cA==
X-Received: by 2002:a7b:c85a:0:b0:3f5:3de:19c2 with SMTP id c26-20020a7bc85a000000b003f503de19c2mr506302wml.8.1684528854118;
        Fri, 19 May 2023 13:40:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:45d1:b0:3f1:7ad0:c34d with SMTP id
 s17-20020a05600c45d100b003f17ad0c34dls687949wmo.0.-pod-prod-00-eu; Fri, 19
 May 2023 13:40:52 -0700 (PDT)
X-Received: by 2002:a05:600c:b97:b0:3f4:1848:4dff with SMTP id fl23-20020a05600c0b9700b003f418484dffmr2332888wmb.7.1684528852430;
        Fri, 19 May 2023 13:40:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528852; cv=none;
        d=google.com; s=arc-20160816;
        b=x4El1uni9FIZxppjc3xlY9ZHtRXr7xtK7Ux7nFKnimPfRCRPS8wEmpKUMnroy4lXj8
         Kr9sOpPjSx4wWF82Gr70fQj1NgBag5YB1We8ysh91l1L4ad6nycP7KTl6qWTLuVS/4tB
         WZpoiAfv6rTRWY2AEmUceDynze+5/SA5I5gZvL9F8yZm5bDg1BwE82UJwm9u6sBh4ZlM
         YzUG6HnWhYF36Inn9TdJlATryvz01588pgBMQj08bpEVbCpzRIFmruq93wqndOtG6b1r
         1y5KreGTHJvO5lR/tEe3W9lEdHMk5R40AZK/usA+K4wR0MNcFQ97tMfiFXjZUC16zedt
         FDCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=dRC8RvzY721QAtE+SGYqj0EcGa7JOckUgpX13YFQnZY=;
        b=Ocn1Lx+EDYj/8/cKV52IffM4Ee1p0/Wwa1Ncz9sI6rlSLdm3ap4MyfcG3RaR/8CM2D
         5YKZG+6XbE8xcSpdxlHASqwPO9/9x3wSFYN3DnCnGFQsJdqbuYlUxrSkqsEN/Oy7UPlB
         RcEnr/u3UEyIAnGbRfYB6BhBQ1+yeHM+MLC6NY+uiTQOjib51MocaTYU3oyJmaMDLR0U
         u3r6hKRlzpm4uZ68navY+NmiNF2B+bIuog51e9XE5RymZjkRArhDKtM+YDfZhZ8Fqa3u
         d9YNWXYUIqLJQjP0Uo0/FUhYigBo7HyDbJ8PqrkFoT27qGAguvEw6iPRpY+/de8pWHIa
         e5iw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id w10-20020a05600c474a00b003f1951366f0si530460wmo.3.2023.05.19.13.40.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdc0SDtzxpn;
	Fri, 19 May 2023 22:40:52 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 37/73] core: riscv: add asm-defines.c
Date: Fri, 19 May 2023 22:39:57 +0200
Message-Id: <20230519204033.643200-38-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_2000_2999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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

Export offsets that we will later need in assembly.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/asm-defines.c        | 27 ++++++++++++++++++++++
 hypervisor/include/jailhouse/gen-defines.h |  8 ++++++-
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/hypervisor/arch/riscv/asm-defines.c b/hypervisor/arch/riscv/asm-defines.c
index 17c2f256..0143d5c9 100644
--- a/hypervisor/arch/riscv/asm-defines.c
+++ b/hypervisor/arch/riscv/asm-defines.c
@@ -11,9 +11,36 @@
  */
 
 #include <jailhouse/gen-defines.h>
+#include <jailhouse/percpu.h>
 
 void common(void);
 
 void common(void)
 {
+	OFFSETU(REG_SP, registers, sp);
+	OFFSETU(REG_RA, registers, ra);
+	OFFSETU(REG_T0, registers, t0);
+	OFFSETU(REG_TP, registers, tp);
+	OFFSETU(REG_GP, registers, gp);
+	OFFSETU(REG_S0, registers, s0);
+	OFFSETU(REG_S1, registers, s1);
+	OFFSETU(REG_S2, registers, s2);
+	OFFSETU(REG_S3, registers, s3);
+	OFFSETU(REG_S4, registers, s4);
+	OFFSETU(REG_S5, registers, s5);
+	OFFSETU(REG_S6, registers, s6);
+	OFFSETU(REG_S7, registers, s7);
+	OFFSETU(REG_S8, registers, s8);
+	OFFSETU(REG_S9, registers, s9);
+	OFFSETU(REG_S10, registers, s10);
+	OFFSETU(REG_S11, registers, s11);
+
+	OFFSET(HEADER_MAX_CPUS, jailhouse_header, max_cpus);
+	OFFSET(HEADER_PERCPU_SIZE, jailhouse_header, percpu_size);
+
+	OFFSET(CFG_PHYS_START, jailhouse_system, hypervisor_memory.phys_start);
+
+	OFFSET(PCPU_GUEST_REGS, per_cpu, guest_regs);
+
+	DEFINE(REGISTERS_SIZE, sizeof(union registers));
 }
diff --git a/hypervisor/include/jailhouse/gen-defines.h b/hypervisor/include/jailhouse/gen-defines.h
index d42fe255..7b348761 100644
--- a/hypervisor/include/jailhouse/gen-defines.h
+++ b/hypervisor/include/jailhouse/gen-defines.h
@@ -22,8 +22,14 @@
 
 #define BLANK() asm volatile("\n=>" : : )
 
+#define OFF(type, sym, str, mem) \
+	DEFINE(sym, __builtin_offsetof(type str, mem))
+
 #define OFFSET(sym, str, mem) \
-	DEFINE(sym, __builtin_offsetof(struct str, mem))
+	OFF(struct, sym, str, mem)
+
+#define OFFSETU(sym, str, mem) \
+	OFF(union , sym, str, mem)
 
 #define COMMENT(x) \
 	asm volatile("\n=>#" x)
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-38-ralf.ramsauer%40oth-regensburg.de.
