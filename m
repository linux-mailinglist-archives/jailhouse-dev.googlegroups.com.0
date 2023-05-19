Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBVF5T6RQMGQE6QTVA3Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id F27EC70A0D3
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:53 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id 5b1f17b1804b1-3f429072212sf15090695e9.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528853; cv=pass;
        d=google.com; s=arc-20160816;
        b=wTJJEBy/r4ry3NNgdI8EsT+vDGRW9s2opy23p7BErxTSn4iVxlzYwUxrBf0w9bK9O/
         xTyllQyDqumH3EgB1R4hfwtIJX4w5psJvd6UKna9LWafw4AxbePJ/n2tp6iq3IAYAkxb
         ns+PqGyFznZP1b7GJKVhi8eiDPdWBovvn85XdkWmbxltMguM6WQMZwxXzSJJvnwnmmjr
         uado7pcW8Q/53Ak7TY+IhtAV/cIV3059mPHaJ91hrXByXu3M2uzQD+PG3G30czo1RW2S
         lbMqOgT0HDQ4eWOInQRFQ7+ijCBaS1ALASxjyTBB1tTmLbraXD6xwuWya1/mKFHb5YpC
         npOA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=WOLggQACchj0RvVvd2UQde9HQfJ9UEtsSD7XwXS3SM0=;
        b=aMl+yKhPn2VEoPKKVIqaBoISiIYHQyPXKlyESUkcejFoPbks8hCOw3EPEeBEdz3fVt
         enuVCFO6vJp6ssZcB9pzRsyRgOiD3XP7nHJrpJzkpXd4GVFjMwWlld2CecUVUCObaF6y
         PNJfXsasMzrDdcjpDSG12g+of2SKiJJ6XhlURN/iW7qkYmhm1vgs4cuVb8rgDXrkYM4a
         uygk8FRJu9OrvN/od5+NqewziAsf8jSzkvD64v+F9pvS62suN6Kd1b/M5BIAlgDKyOv4
         nZDtESv0mNO2EftTwgbEZ+0cfPrMHZvHhYp2xiAhCcM7NpKX375jGp8VpL1r9PEwUMhA
         +fBw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528853; x=1687120853;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WOLggQACchj0RvVvd2UQde9HQfJ9UEtsSD7XwXS3SM0=;
        b=Fj01FWgWxD3XplEZr09um1iWJoTLp9OPFc1sdJkTesnPYzWiQnCHLIwn22OvddvCeE
         2F7G4uTtSuXkl6nuxVXJlubiot3SVuil5+EM/+fO/kS/kUXP6mnO+Lcovjq25qZn5y+w
         fTqwl0eZpPJ/OByPDBxJuPWVej8ihK5HRa+/rG/cxhrJgq+/OudMtTBTABgNJEnPJrMG
         nQtNLM7VOORJDVwzr9eWsUwDF8twGYNcjSpzYsc+wYRZCWU1gy3JzSz5sq8CwfapXYLS
         KLfa3psBXOWhyIo/DyAEOjakTbDK7u/MrAROZ4XFaMVP0stCwgFjcKMHxMKydwtnZW1F
         hCGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528853; x=1687120853;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WOLggQACchj0RvVvd2UQde9HQfJ9UEtsSD7XwXS3SM0=;
        b=IC+CJTP7bgM5dG73DXFAF/7IqIlscxh6CdRg3KCev3k6rzSJFZF3JUkW/U9BxHDCTw
         DRn4HhkJtwA3OKhEK9aJXPCXd63EsVk69JyzdJHe0/ZFSYmnv8yFgwPJpbvkxojEORs9
         8U2tQuiIMFPheLpPTwAuD+uFrqhM8Krr8oK4OBUaBZ2vUHqMKJxWdlF6lTiAAu4IfRje
         n9Qc50MhYqWSyGhI71CHDmmootiU8TI1YUAsdYR2iyxYKSVCV52QHC7nCPSuBatgVtos
         fZeDJCGLBjJgsJJueJ+9fKPOfNcDqqDiwirhtPvguPg/r6ZcLcb1KXiJlsTTdPJCecWr
         8xig==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDwvbitPCtn3dss5p1UcMsa91+s9v/SfkcjfTfHFeUspdxNeH3GF
	CeLl0x7kA5aqa3jjU0T1GwE=
X-Google-Smtp-Source: ACHHUZ4pdJ7Ir4QojsiUJepm2ciUJ5E3rebvcWfVDRZ+ZaAtnQESsDreUgtMTBprZvl6HRmGXPmyAg==
X-Received: by 2002:a1c:4c10:0:b0:3f5:db0f:3120 with SMTP id z16-20020a1c4c10000000b003f5db0f3120mr523949wmf.6.1684528853341;
        Fri, 19 May 2023 13:40:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:ccf:b0:3f1:7ad0:c355 with SMTP id
 fk15-20020a05600c0ccf00b003f17ad0c355ls588929wmb.0.-pod-prod-08-eu; Fri, 19
 May 2023 13:40:51 -0700 (PDT)
X-Received: by 2002:a05:600c:2212:b0:3f0:a08e:811b with SMTP id z18-20020a05600c221200b003f0a08e811bmr2272538wml.13.1684528851723;
        Fri, 19 May 2023 13:40:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528851; cv=none;
        d=google.com; s=arc-20160816;
        b=s8LsBvPUkb+zqtfVWCSCvJ2iCjG0rEDBQC49JDG9PZpAxn4BUwwDPR+s7FikvUo16S
         vKDfw9kIN1Wnnvy9msH9aTo+oVPLDBFDjLdEjBmaLzx9g3FcaPvDLGTFp+RI5LUOi64x
         VckCdUdxzCGYjEzss+xQiOQ8bAOo+mt5HYhrIpi15T2hcRqgCaeKQ4K6HIpxj3yFD8eQ
         5UfzyixZl7GcKzY6GcqY8yfnD/46LP9FpstHcBDxtDQ6upKGDU3zNgI85GHOPVwuBfjH
         v9eKKwN7ZzHPYmjG9Mxd7Gu9BTDR4cAwJT2JzS0wydYxyqDtdmiM905fdNFO6URqhEuK
         sQkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=pw3copLPc5iKjtaP4g7q81+C8Uq7SicOlsQfjkQWnAM=;
        b=k9cl2uuP8May8eimMup96wyys+nipL0nCazxMshTltbT0Djx7eeN7unvYkRQbN7Jo0
         9GFMvhrl+YyW954U4kjS1GD7NTFNLX7PVdKgcQ/Hxx9V0k1t66q56YJJcirppXmbYkf+
         YTEB9+qxJzRoQLaejjRwcyVqjfWx/ppNxzachZQAJWcamWxo3CCuB4FBMdZb11RWqCOu
         ST5lrw6lEokbjDa5OcZQq4+3crCdatRfrtFUHejY2q/+AX38iBZ4x16voNMUz50vDKHg
         c1YY6qqQF543I4S6ExZ6iyk6k8N5bvAnahDH0+A4nEnK/lyS0FIQClROfeMUWTeQdwqa
         MaFQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id p30-20020a05600c1d9e00b003f42314cbc2si296715wms.2.2023.05.19.13.40.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdb2Mrpzxr2;
	Fri, 19 May 2023 22:40:51 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 34/73] core: riscv: add dbg-write helper
Date: Fri, 19 May 2023 22:39:54 +0200
Message-Id: <20230519204033.643200-35-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1800_1899 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-35-ralf.ramsauer%40oth-regensburg.de.
