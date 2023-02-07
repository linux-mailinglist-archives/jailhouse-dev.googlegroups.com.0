Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBYUGRGPQMGQEWKW3CTA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id E94C168D67C
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:10 +0100 (CET)
Received: by mail-wm1-x33e.google.com with SMTP id o42-20020a05600c512a00b003dc5341afbasf8069615wms.7
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:10 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772770; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ka0r5mSNV6jeFdbkgieyhxa7hem6fHboA2BR53/mm5EeT7OQVe7ad6nfYQGSP/YSd5
         JwyCGiplN3WhdCZjHy9uMrq+rd2XK7f1ckMXbkiu3fV5fCyCHm5BpX6LekTnBBUZ2ijx
         tqgsgGPWShvk7zRfHi4VC2Wc+quL1ngCu6aEWvmK35G5oxkGmmIz4eDq07X/MyaBD2Rs
         WYVRearrOIDOlA8iNLEq8OItQ9JkEUksBiIM/dQ8oQ9++Jz3aTD5tQHeY9eiS34QJ7NP
         rpDGcEneSj4x/2b/syQX/FgDn7bFw+KupudIdsP1NGl13qj2f6nQgWy8V8HNvwoLUhSm
         qePA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=+nccthECva4r8dUoQGyor0AOza+QI3C6eOJyBPfwypg=;
        b=uO1TXcxiAYYxaQ2EydmwEIpI12nWxU7IM+YSghIIRY8rZdvycTySOwCvRAhCzBtkzt
         3OzByYJ5sQGbPCg2bFFJpY3LAb2Pn4RGAJsHC4+75NCRu3Au0/j4z8QaNICtwZHO6jHr
         8VqNiM/8+RFofL5RjbLQC5K0T8gBnk6+B52goP+1cmmnU3pumlEu/dbA3/k/55DibWg2
         gv+rxwj86Iw+A60WdeH3IOrk77m7M/yau0cJR5z1CGnPhKP5lS41rHi0t/Gt1hcl1Zgm
         cFVhbR5qbcB9oYvljwOWmT+55rHs3rkwmI1p2pKaO4w4MM8H1uYlzyqQHYbuXE6lqHP1
         Wh2A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+nccthECva4r8dUoQGyor0AOza+QI3C6eOJyBPfwypg=;
        b=AuFoUmkz3TpWP7pAX0V8kw2MLDLU75wPCm7C17Bsnp9EX6WQ4mjVrN58m1VZeXg88S
         Bm2MSolhnRjkk23vPBCJ5ZKzRX+ifYitGpmLuMvL1pwQvOAC+bgQ0h3WLSEe1Ige9nAT
         0wzF7BA4VmQ4fJeMJD7vyy4tkegFuLlhjZHe2at0z3fdc6FF45QjgFtd0x0+780Xe34D
         E13ZoEvJTXixJMRoVlKV9OPoaxpMJwH0coM+2Yom0fCT9GShcPxauVWrulhRAfBl+Pmf
         nPg7gN4SDam06ZS9qZfn7DBkQmSTEkfSCrilKw4XexIo3Jh1llqHFW7DooEeVDKoo+rK
         bhBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+nccthECva4r8dUoQGyor0AOza+QI3C6eOJyBPfwypg=;
        b=yqzY5ExKZ/i+nlCYnddP/jdALz7Md9lxHErZTVufYSIgla1Oj5E5m6AKT1UXawJLve
         gLektaG7NFj2ZzJSHSH+8b4ThpOyHQolH3UHay1bNiz5oJTimN8pCE/CdNO5yppTO/fg
         fZsVQn97YCeub/fVEedc/F68JR7jfz9OSMO49tO6rFkF+C+pCwUq5GfG9Ai0bAHPjYVx
         gZ6zk3fpWmPAb568zCU/svUU7VSVgIBj10FqM0VX6/gi1m6GAIVDjqJf3lvc49wcl9bq
         EkQF9Bk8ejtjHz2YjUHiOz86NrX/6bP44QoXoqUEPKjrYhbTGMbO04wJwCVJWh3nIo9K
         rNHQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKXXvD92c0Os4UupqVK1rzTBWQlMV4qjh7fmNRJidjqY34rM3n0N
	wz/KVss1l3ph87VqPir23JM=
X-Google-Smtp-Source: AK7set/3f2UELjRf34gnayjyonQn4NHYUT/NyZxSdn5o3Fyop4JczmuoCGpnkdGbGRCPIw8JC+h6Ig==
X-Received: by 2002:a05:600c:1e8f:b0:3db:2fcb:8c22 with SMTP id be15-20020a05600c1e8f00b003db2fcb8c22mr1266210wmb.100.1675772770657;
        Tue, 07 Feb 2023 04:26:10 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:5b19:0:b0:2bf:ae0c:669b with SMTP id bx25-20020a5d5b19000000b002bfae0c669bls21047218wrb.2.-pod-prod-gmail;
 Tue, 07 Feb 2023 04:26:09 -0800 (PST)
X-Received: by 2002:a5d:4685:0:b0:2c3:e5d5:5d77 with SMTP id u5-20020a5d4685000000b002c3e5d55d77mr2341512wrq.68.1675772768895;
        Tue, 07 Feb 2023 04:26:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772768; cv=none;
        d=google.com; s=arc-20160816;
        b=oLR43CJ4cgjcAesABz8tvjSTA3Va44w4VfF2FIydOQNBey1qXkT4HYxr/9baypGeN+
         GgMY5vY7bZo/rydQ2ir1jPNWTpJU2FRLB46BlLPVWZPbjrQKM2x5DGlhZLWwfsoCGZw3
         4/k6E32QeirVf1oZm7bP/MyQNAhShhrajINhxfoxXT6/9mO0F0S45cYSAgEwd3bUZHZO
         2kPWi8Oy+pqfQhHh60DMKn5jauPe4OCO7rfwahNjTp56lNObAKkLDaTO3f7ZgceQ+eR4
         RViDnC+mrpX0xmnDSt62GA5LeZzVPGwNoqhegncUh1JfVxMgqqnjPEKix47lovQHNXOH
         onbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=7rfkeaYlPXkhugRkNwIggam204iUFs2pVqa1bNEqeOE=;
        b=X2Tgcy87I1Q/dnKlRrALu6BA1gGLPszcqcs6ZhQP9zhRP1vmF6eEVB3ELtHJFYkQjD
         DJ1IpJLAp5rvdCf6ZGogO4kRHbjkL1fI6kwXlF6MzoHKVjU/Ky1KrSlr2PRSGR28u86m
         cu1bv3uwZ+CaXAplMoiF5lHkego23HXeFFmLNjoArYCfq+/+E+aehh7mdIwQVh8RZ/s2
         2yqhgnXNoEe3McddUx+V3IyOpZjbQMzRAPGnVukM64pFzHNxpWWueiOZ5kNpt1NiGkK7
         An3BZAc7Uaydm30eVdBUPLGuJwXDTq6kslaONqHC2RbS4ZGkNrmbtW/iqvei8YIs529p
         XVsA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id u2-20020adfeb42000000b002c08af7815fsi602943wrn.5.2023.02.07.04.26.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:08 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RN3F4xzy6b;
	Tue,  7 Feb 2023 13:26:08 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v2 14/47] core: riscv: add dbg-write helper
Date: Tue,  7 Feb 2023 13:25:10 +0100
Message-Id: <20230207122543.1128638-15-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1800_1899 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0,
 __URI_NO_WWW 0, __URI_NS '
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

For the moment, only support the fast&easy output path that is always
available: SBI. No UARTs needed for the hypervisor, SBI suffices atm.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/dbg-write.c | 18 +++++++++++++++++-
 include/jailhouse/console.h       |  1 +
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/hypervisor/arch/riscv/dbg-write.c b/hypervisor/arch/riscv/dbg-write.c
index 6bd75887..8f85b321 100644
--- a/hypervisor/arch/riscv/dbg-write.c
+++ b/hypervisor/arch/riscv/dbg-write.c
@@ -4,14 +4,30 @@
  * Copyright (c) Siemens AG, 2020
  *
  * Authors:
- *  Jan Kiszka <jan.kiszka@siemens.com>
+ *  Konrad Schwarz <konrad.schwarz@siemens.com>
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
  */
 
+#include <jailhouse/types.h>
+#include <jailhouse/console.h>
+#include <jailhouse/control.h>
 #include <jailhouse/printk.h>
+#include <asm/sbi.h>
+
+static void riscv_dbg_write_sbi(const char *msg)
+{
+	char ch;
+
+	while ((ch = *msg++))
+		sbi_console_putchar_legacy0_1(ch);
+}
 
 void arch_dbg_write_init(void)
 {
+	u32 dbg_type = system_config->debug_console.type;
+
+	if (dbg_type == JAILHOUSE_CON_TYPE_RISCV_SBI)
+		arch_dbg_write = riscv_dbg_write_sbi;
 }
diff --git a/include/jailhouse/console.h b/include/jailhouse/console.h
index e7c934a5..e53df8ff 100644
--- a/include/jailhouse/console.h
+++ b/include/jailhouse/console.h
@@ -51,6 +51,7 @@
 #define JAILHOUSE_CON_TYPE_IMX		0x0008
 #define JAILHOUSE_CON_TYPE_IMX_LPUART	0x0009
 #define JAILHOUSE_CON_TYPE_SCIF		0x000a
+#define JAILHOUSE_CON_TYPE_RISCV_SBI	0x000b
 
 /* Flags: bit 0 is used to select PIO (cleared) or MMIO (set) access */
 #define JAILHOUSE_CON_ACCESS_PIO	0x0000
-- 
2.39.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230207122543.1128638-15-ralf.ramsauer%40oth-regensburg.de.
