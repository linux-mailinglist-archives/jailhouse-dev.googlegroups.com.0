Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBVN5T6RQMGQEDJ6ZW6Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F5A70A0D4
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:54 +0200 (CEST)
Received: by mail-lj1-x23a.google.com with SMTP id 38308e7fff4ca-2af1eda690asf9937671fa.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528854; cv=pass;
        d=google.com; s=arc-20160816;
        b=AtghdUQfqS/u+Z4+JugB38G/5SsKKxpy5BtO+vDIfU9QFjGD33aswyji7Q6WCUGjKO
         +mS2vPzhEZRppXVnAMk7Qlun04kwnQI7wvtIvcwcHz41IWv5iknBll7bo437kGRNEKlk
         lMu0jNOCCM/UF+/pdhLF8xLz17u54bYdYROXegPJ/efdcuyjRxcXReb4dvgjQPaHz7VD
         4Q22iAJ4moAkGKoa2B9roumQrEz3lFP8WuldKEZvXU6lrBPNaM3+hAGD3aSyEzED+nRN
         rv4WBAjMw6xrND+aYi3irn7E53rsHyz638w/6By003CTA5ccdTR2LAep00cOsizoS0NM
         fAwA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=kBesCvUBy8QDabRnVoA8MZZ6hTQWf8U6+7sxZreL32E=;
        b=VxQhNxwj8LK5VmFBXDvq0LCsJjJjsDnp21aIsyI3Snm7wH5LsHw5tWnAlufHuMHE/g
         ZkpjWOwaidntpIuJJ7hommecBSDF958uqPkZ5EytohHQYYB7KGOf3JaoIJWZKXMiCC3l
         1roG88WARMl7TUzBcQ6PcXKp0m0J1HR7RXJvDSwFKTtOkUsA6tO9UhAxGbTyLYJqkE10
         Km6W3DJ7A3CSn3yHppoLJ8Cj5Gx15Wai4+77NYVjqpICKbrqOo08p2fBgx/6W3TTXeOm
         qokF31VmDqfNi1rcuMlf1lP3XD+FmLROUJ7Wma8jjh3B0JuI57mcV3fkmsm57s7fdwL2
         kJQw==
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
        bh=kBesCvUBy8QDabRnVoA8MZZ6hTQWf8U6+7sxZreL32E=;
        b=n6kOICHy9nLpYjX1I59rljXJ1NAcChD8aB8Ev8uDOJINA6zfKbvhBhM7p7FBefGFTi
         clCcHUE2sg2BFWGVNCgO3f6nB7zgOO6fX5uMWDaIPif1G0zaQ2/VOsTgdehW39AaghyD
         cKxNxVROoCJX6o5H5/0ExYU5RWaaUJOxG8BN+RoQfsNhHAsTVcdyOMxYYS850UdAVMth
         0JeUD+TRAIcqpkeL/reX34Y53EqTeGyWamsla7i9D8+4ED7mFHBni5wSAo3167EVd9ll
         MLtint6VnBxY+8Xl0N+tSsfQUP3uXC7tWEgYjoI+dQ+mO0M2z+lblE+LqVQfMpgu4pIH
         X81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528854; x=1687120854;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kBesCvUBy8QDabRnVoA8MZZ6hTQWf8U6+7sxZreL32E=;
        b=G+nnJa7yACW5GzRlvP8/ZDQ4AImksfwHhrrDHcaD2R/jH0t1NzeQw+5qsuQvIfqABr
         Z9m9mFBejvYZRu9F6Fjcc1je7+gYY/iMunnhraU/VG2RWJRhDFuponZ8nzAaS3Jx8jzn
         6oM004wVcgBtrCUGSSVXuX+4G6fc9Nlii/Hc0jpwMc+Lrw6mG5lvwdUMKhHblC2NlFzf
         k7zg2T4yOto7tlW+1unG/EM0vV7ogY7eGg008pIHlrFMXbZT624tGVb/LYVFwQc2o9Jr
         fPwXbFP4N7GKjWiOcVb20PaneQ0JMUv6fO9AN4HpX6jSNKizsy5MRsMRnk9R9Wihma4m
         lrAw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDwcPrBsXLfNHy+WGCwIlvGn3mtmPnXkUrk7Q1Od1n5XKNMEDOed
	zGbA12H1h97wQ7SffMpxNj4=
X-Google-Smtp-Source: ACHHUZ5E9GxLTXvavWQRVWVbJGkXahn0KJYmBP3qVsknbatJ6DjugdfQaKm6J5Twbti/NSvCesbt7A==
X-Received: by 2002:a2e:9213:0:b0:2ad:90c0:e71a with SMTP id k19-20020a2e9213000000b002ad90c0e71amr741026ljg.7.1684528853735;
        Fri, 19 May 2023 13:40:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:a99a:0:b0:2ad:be8a:6f15 with SMTP id x26-20020a2ea99a000000b002adbe8a6f15ls368031ljq.0.-pod-prod-00-eu;
 Fri, 19 May 2023 13:40:51 -0700 (PDT)
X-Received: by 2002:ac2:5197:0:b0:4ef:ebbb:2cf5 with SMTP id u23-20020ac25197000000b004efebbb2cf5mr1358223lfi.17.1684528851832;
        Fri, 19 May 2023 13:40:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528851; cv=none;
        d=google.com; s=arc-20160816;
        b=GQJejxyV77xO8GTMShUnzh/pjGeO3LX+/zmS/Q7W24jhMBxRqJXHU/MVOnEmd0vupX
         m6/86J5+yp6uS7Uy4bi4ED2NKDVCisupARPIRVIXbS0lI5tdeRcKfEaHkzsNX+z3ARhB
         5FaMIRTpi+kYxJRsxS7EbSlpsqBCJVI7SSKXwrSucQbt/lcredLsL4tKIKSQHqmWdiee
         t0MrRYg6kl4OfsqvwuUd2nh/gT8WmNUrLXU55fGyQxTpzmo/gmWDC/cbd+dnX2KlZ9Zy
         4HD3urbXCpKkMgPu+wptNqm5G6vbX878s6BXlN+bMsA24yigjYKXBtbQuraD5e56Dot0
         m2ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=IePe45b4i9fcgTYyPhjppO882H0M4ihEyvyX0XRMb+8=;
        b=xNH8m+kfACqbrCCNeU8os/31pP6hX8JlaHKAdxoUAftUpXA0wfLONA03CGa6NFtY9J
         OXiIJzoQB0QfV5ffVMyOdZ4iJCrg1YknvKHImGsUy/yK8Cg8QS6s0sAS6LFExYACNJB+
         YknPvOpz8f5ghj3aPDCLUV9xovVjEAtgw1QkeeeOM0XTGJKE3Ym15RHSIFoQt+vxmwqn
         OOuOx1+RZEy1FfvPxccJoL55XM08C/4yumZ+b97fJzIEG5XN9s6h3rjOhN0dsm+mekHe
         WhNAo4sEuze8R0HWRDtytwLFvoqlrNnYkrjDzgw3n3XcYfG2r6qo3mAw7jcxxeuIoEtK
         HjtQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id h18-20020a056512055200b004ec6206f60esi10903lfl.9.2023.05.19.13.40.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdb0s37zxr0;
	Fri, 19 May 2023 22:40:51 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 33/73] core: riscv: introduce cell-specific fields
Date: Fri, 19 May 2023 22:39:53 +0200
Message-Id: <20230519204033.643200-34-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1900_1999 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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

Add RISC-V cell-specific fields.

Unlike ARM, for example, the PLIC doesn't support hardware injection of
external IRQs. So we need to do it in software, sigh...

Prepare the fields that are needed for software injection. The
irq_bitmap, just like on ARM, denotes physical IRQs that the cell is
allowed to manage.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/include/asm/cell.h  | 11 +++++++----
 hypervisor/arch/riscv/include/asm/types.h |  1 +
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/hypervisor/arch/riscv/include/asm/cell.h b/hypervisor/arch/riscv/include/asm/cell.h
index 63ba43ce..9da228d4 100644
--- a/hypervisor/arch/riscv/include/asm/cell.h
+++ b/hypervisor/arch/riscv/include/asm/cell.h
@@ -2,9 +2,11 @@
  * Jailhouse, a Linux-based partitioning hypervisor
  *
  * Copyright (c) Siemens AG, 2020
+ * Copyright (c) OTH Regensburg, 2022
  *
  * Authors:
- *  Jan Kiszka <jan.kiszka@siemens.com>
+ *  Konrad Schwarz <konrad.schwarz@siemens.com>
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
@@ -13,12 +15,13 @@
 #ifndef _JAILHOUSE_ASM_CELL_H
 #define _JAILHOUSE_ASM_CELL_H
 
+#include <jailhouse/paging.h>
 #include <jailhouse/types.h>
 
-// this shouldn't be here
-#include <jailhouse/cell-config.h>
-
 struct arch_cell {
+	struct paging_structures mm;
+
+	u32 irq_bitmap[MAX_IRQS / (sizeof(u32) * 8)];
 };
 
 #endif /* !_JAILHOUSE_ASM_CELL_H */
diff --git a/hypervisor/arch/riscv/include/asm/types.h b/hypervisor/arch/riscv/include/asm/types.h
index 120859e0..adf58120 100644
--- a/hypervisor/arch/riscv/include/asm/types.h
+++ b/hypervisor/arch/riscv/include/asm/types.h
@@ -11,4 +11,5 @@
  */
 
 #define MAX_CPUS	__riscv_xlen
+#define MAX_IRQS	1024
 #define BITS_PER_LONG	64
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-34-ralf.ramsauer%40oth-regensburg.de.
