Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBY4GRGPQMGQEFHUAICA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBAC68D682
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:12 +0100 (CET)
Received: by mail-lj1-x23a.google.com with SMTP id k25-20020a2e2419000000b00291830c756esf3497818ljk.19
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:12 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772772; cv=pass;
        d=google.com; s=arc-20160816;
        b=Tpj3HUZWy6dbO3LpLNcUyg5StS+pe++Odm0w79gd9QveHjrKB6OjBNL4crbt5ZuzEw
         u1IKTIH60p7byRcfPHbU5fSe2FwHUs89CHq3CKEsNxtRuTqpLtGz55vrNQVKzZdNlpf0
         OI6eIubW+wSuOVYheO1ZDiorfVijoQjs4DvQVyZQFGW/i9v+hPeDlK1HYHXNnlQ5qr7B
         YFNDmV3T7Yhu8a5t0+apEBqn6KPveo6k0uCETQmG7ZoNDnSATKivIGd5ZUqtJHHf3ucp
         SMavUQm8iWLtJDB4l5qYyGaxgJPuN3w6oMq/68qvWmllLx3t3yEjem4u0LVCZ9Ep+Ezs
         YE7w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=SO7YsjncO8JMyouzU2/DOE62n1sv+0zZiY+vFZC7WFk=;
        b=NpjUoqcO9YRVkuk+6qoc8pbJZvGUYbtKyiM8fXw8hePg5r/vVZWvF6W2knsbv248fQ
         jYiCfapdIRFFWo2JK9yjFwI6mL5VALztV973tNrrpgDBp6zhdkxVIKiw9UbdWtDclfS5
         jzVMljATlwgIK7VzYqHEGSqkU9MeVlD1/ML5I8ieYhxgOBinB3a5TKNw1KXMONOQQtie
         ICTyyLO7617e/GvK4wM0kThNrxFxUw/uYlHNPHfuDkgs4AlIgSZUSWlWSb+8vcsWgvOr
         mxhcbu1ypqpaD7q0VLnVjHOpG5t2s+EoCi3tPva7933xxb/oXC1dp02+m5j1V3fGsMwS
         AHQQ==
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
        bh=SO7YsjncO8JMyouzU2/DOE62n1sv+0zZiY+vFZC7WFk=;
        b=JuRrkXOUcg6okpHWstk/tdWnq5WQGpbrg+EYOA2ro2oQe7bA1O3gciAujyQUC7ofMy
         t0Y3dLxOrbY3RsEgyy28ZGXK2GLOUdiMgg9MZ6Tw5EWrz/omcGpM91gTy165oqX2vnCS
         dF+RsLxA6U30aS5ADLVATkjAcyDQEMeHaIplGuh6h91nOe1cPGKPQaXkUZCb+ETcYP5l
         kN9aEwKjWi+8lNjup6p0WjZ+L7ttRSFe4qifHfX76Odo0LOv8k1J+rfLm7tSC415p/vL
         P8Yf/vd7NwwbRMcCr4zi3cHQv/O07x/BzP4YNwEUe7tuUeM9XBJBDJ7VMusnPJVg2INt
         ftpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SO7YsjncO8JMyouzU2/DOE62n1sv+0zZiY+vFZC7WFk=;
        b=1yY3PmGyI/gzBlBlCcNF+rUDPBuX8TNRkGVLIIVKq/1djc0KzfS8Yp4IjWoW7QNV86
         h5tZrk7CxMANfjlyJ7ZKflBd1rZsk/R/4ji+UIFoqsXrvxzsCxE0RWX+XLP4roOQK/ko
         1WH1aKqFeXpCBh9QUFfj5wgshEL+AHvR1PYOCWC9PAa0mModwf9/9IJyM5o7BMYI8mLs
         1iliZjJxTVCQqX+ZGvrUHzJdpJ+s98BWbyj7qOSNlVFFizVsI9yNvufthsG51id/Cd0y
         ueCLsgACIgi5AMZ5FDKNZ74rPumLOu4zqR/QM1iToYbCM8B796kzUR3GGgyZggnsyRIZ
         C3vw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKX9D9E9jJmEi3qEod3o9O4xioOI0HhQ5eidIE6QGtlj9aEjwlOz
	TvojUG35OcyW9+xHLuBvD+k=
X-Google-Smtp-Source: AK7set9rnB9+SI94qggtxC+SAT8b/H9fvnwZEGE/BEkOOQtaVmVoOQTGA4krg0KBY1xvcEIaiS9ZXA==
X-Received: by 2002:a19:5508:0:b0:4cb:1d3e:685b with SMTP id n8-20020a195508000000b004cb1d3e685bmr465512lfe.126.1675772772096;
        Tue, 07 Feb 2023 04:26:12 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9048:0:b0:28b:86c7:a456 with SMTP id n8-20020a2e9048000000b0028b86c7a456ls2087256ljg.11.-pod-prod-gmail;
 Tue, 07 Feb 2023 04:26:10 -0800 (PST)
X-Received: by 2002:a2e:b010:0:b0:291:378e:318e with SMTP id y16-20020a2eb010000000b00291378e318emr3380264ljk.20.1675772770228;
        Tue, 07 Feb 2023 04:26:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772770; cv=none;
        d=google.com; s=arc-20160816;
        b=taNG6SumISn91uGxFhU4BfDT6bMwfu9rLU++hwsTWOWoV0PzapHuhxBCxJJAzfsX5J
         sm2gGrUP/demRAxllrIq858Kb6bFwhpS7rkrWea0z9wDUHIKfejwDagECMwaqFqqOWNg
         BfxrQ3KZ0xYf7Jf5Gxr0QcKeq5hLz5oh9MxmSXwEhFqXGMid0Q2tRGtkxJxrA05db8QB
         RodbVQUMg5FozSAfNcndr2uzUe0xhrWOaBK1e7b/kioi8lcgQuzD2mE1KR8cQnPHS28/
         mmgwvAgK/l47INxRyw+r+73YQjxEm4e8OjlLpodobljrDnVVBcJ/sjAivHgj0FeCgZmN
         g5AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=y4ErfGO0FaPUDs06n0e4NbMmePUQvkJFElporZB0dDU=;
        b=u2G5fkwFqi7/NHBOKrCZOCexnmdVPXmUgOftayIURH4IK/aTxSWro9Z8Ngmsni1p7o
         kEoX1t/+vuDHXO8gvEAdWdKEAJe2v9lHQstw0XCnIJUgEuYUkWImJ7OeBZBj5xT/UBDg
         R5dMH4hNuKBi7rx7p9PvVr0+U4ZpzksprddJOAP17mXIyZ4YohHbD/WLD4iZg5awd+SR
         FoOaStZ7ZvlCmHcD7ILn+RM6QfjZZxLvmj/BPwUHvwmWvlpVsvixII4UB+nOjy7e9IXS
         HPgmsT10tlBU7W9vBEdVPdXXDI9hlyrWrIA0dJ7RxlaotkTgR4DYGHcUsHcB9vfVeAOl
         YMww==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id h10-20020a05651c158a00b0028ffa3d673asi229464ljq.3.2023.02.07.04.26.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:10 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RP3X94z1081;
	Tue,  7 Feb 2023 13:26:09 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v2 18/47] core: riscv: add asm-defines.c
Date: Tue,  7 Feb 2023 13:25:14 +0100
Message-Id: <20230207122543.1128638-19-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_2000_2999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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
2.39.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230207122543.1128638-19-ralf.ramsauer%40oth-regensburg.de.
