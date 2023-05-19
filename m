Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBVF5T6RQMGQE6QTVA3Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 186F570A0CE
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:53 +0200 (CEST)
Received: by mail-lf1-x139.google.com with SMTP id 2adb3069b0e04-4edbdd8268bsf2392032e87.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528852; cv=pass;
        d=google.com; s=arc-20160816;
        b=b6Y5NLBwdOuCqI8i3LS5RN/E6EDqEBn1Cx0yFFmG3+3TPRsFuqvtmZrdWYZZ+HSk1F
         aEogUN3+TJ6ZWNhIzhP8RTTMk5XeKXDOk9KHB/ZCr38Nc7d88l3KxJJVGOEV7moSEpuK
         y9SVFaLVlhKWHem5quoQmnM5Qw/gyfR8USB39IOEBaaVcv2cMDpy4xjTwunoYTt93LbJ
         3hI3eO6+zne5W7SF4HFQa56XbFFXj5bUko1u0hxLLWJfP5QR5B4iVPWJBPHffObQx/51
         TdhOKuf+cblB9uTGmhpMkh5ag4qpiMFNxzDkDOPfDLwQhct6mqc3HcNRAzrPImaDXtYV
         dnTQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=NEU//Iif8+qBmuCYc4HAcwu8IUlJmnKY/KtRR/l9YXk=;
        b=bJ6hc1kRSHTrAhjm2Y1T/EnMfuRWk5WdaM+lDCNG6S+Gf5tsJhOTIzNBxk6t8/7dvI
         xI/VPk9O94WNO7uOpKZB938QXxNlxf3SfH8RAlrPDsiahbhmH3PwCNk+2Pcqn7XDe/B0
         mOf5nd0dtqNlAUExepsRpP1idJLyHPuqqvVPktcbCjQxRyPJzZaobkHOQRElCGC5drWz
         K7fiXyy7dIrfauNKVsooeCAD8W/sawbRafdvAElVLpaY5/RVKJIzNuenhYpIT4yLAC9B
         5uFombABAkPDbseVcsIeQUJTaDvK+aXLzG/SapFYVrwgMDlYsl9xHHr9Ey+e76kyOREf
         Mzzw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528852; x=1687120852;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NEU//Iif8+qBmuCYc4HAcwu8IUlJmnKY/KtRR/l9YXk=;
        b=nONI/9QV/9UgOEtqJhYaFI3zJYHSX26Z0/ueF66siPBUZfPtVLFZ0JZ7hkrNeUtpxT
         iML3eEWPFYp03E+EJre7KxB6GOLEWr/GcdOiBwN5XvkY3OaKCjnyATNMXrOY02YWwaYM
         Zhw08f6Ft/huL/NfVuTCKZYF9tQoYVXWkMOaHcWVppLMqyl4VOgXFkf6kPDTcxiWdEIX
         5zYRS1a4DnQrSKwg21eBIzLN04m9jrJ1WF1bh2DEUIPepnyu6eX1/m1mHNCQln7SpAMB
         tX0SS1r8h3yzN8VeYw7qWT8tn4IekVnAvAOp8kv/KN27n+OfuumcxbjKVU9U7t/o4O7P
         HLww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528852; x=1687120852;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NEU//Iif8+qBmuCYc4HAcwu8IUlJmnKY/KtRR/l9YXk=;
        b=QGe8paLmUCbhshWRSpsI+AzdlPFExBTakfHuThvslX0DABgMTNCTFjYrpxMH1P62Yd
         rOLcELMZY8iykdxTTpCoHvONNVgSm9K8nrZv0JwzSAXXDwLrS4cxG339UuvjGCUXmGVx
         23cBaRero66ViZXSfjp15eYV70vMvsPoJ8io/YikLRq7QswtUWBDd61HSvZUvqNLciD4
         MVpJBAQVcyHBSo3wP6UH0QxErtGuRKvQv3awNOPHZd4JwHboUidLz7XrFCUyOTuBpVm8
         /BL4w4M27H9YlKcWb4MYw0ytkxKhVDMKDkwYxX05KuNqbDFvvLe/0oCveM13+htkPmXG
         Jrqw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDzbP1tHwPk0lRdlGatI21FN0ozyscRVYRgJgA6oaUBeW77rgrnc
	oZyGK6facZNKov4mBWpdSy4=
X-Google-Smtp-Source: ACHHUZ7GrUd4ZjuN3FC5UVc/l9meFOwuFoXrI3V6NRv7Ufa5y3eKxQSrtyk8kAjOEl5xV2c43gSpXQ==
X-Received: by 2002:a2e:9b8e:0:b0:295:a82e:ec06 with SMTP id z14-20020a2e9b8e000000b00295a82eec06mr724173lji.3.1684528852655;
        Fri, 19 May 2023 13:40:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b888:0:b0:2ad:8fb9:f1b4 with SMTP id r8-20020a2eb888000000b002ad8fb9f1b4ls717800ljp.0.-pod-prod-07-eu;
 Fri, 19 May 2023 13:40:50 -0700 (PDT)
X-Received: by 2002:a2e:b209:0:b0:2ab:e50:315a with SMTP id l9-20020a2eb209000000b002ab0e50315amr1146238ljm.51.1684528850846;
        Fri, 19 May 2023 13:40:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528850; cv=none;
        d=google.com; s=arc-20160816;
        b=yYDzaGbsD6R8qPJlbjvpGNYtdeIpcA080mVTmr1wHDoQfZ6m0ZA2HpjH1LybE2VHr7
         dN1PqNCb4bTezBk2Q7LI8H4itS13O95/JPKTLLJtgTBR6SWSnp6DmVM5dcQr2IvfuD0I
         KMLtJThkwDsFR1lzKEcQpEUJ6qtDzaBjuQkJoVRSkfdZrpcJi79v7v66cqOrfFhTgFdc
         zfwPFaYSUgjnONzB1TEkVgXcaAv1/vsLvPEWo0APrvndWEgLr7L42jeQSB2tbk56ug8B
         YpUWEfIUIUlg0EMjfFp88g9WuH5ogLqSrdPohmqfO8J7CR3s2SzXlj4xLfI3u/kbTfju
         ss7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=wtAPesCeLmiNvD8O6ULksikBWXy/xCdga6Z0hAwP3BQ=;
        b=z+KjwOTCBgocSOJfT2jeU4QeoBBMteoIOhAVdq08kkfH8AKNR1iuWz8lY4ylEBlnZC
         Ia4Ym1mVHxq94Itadk3fV341niLBvFXP6PmuWh2I4J6FESEEUIIXBzgWa7FM80irEqiV
         9aYZgKeJ0NeOYVO6fK5oBLYF7gglp911c2Lhfv7RdqJOtEhhD68d8eMWbL5hkTe+8Uzs
         ZyUOBtlfJdYs7iW3afZkpCG1v4nPXXPknZdUjHazYvf64mVXvwYLpABqIAV5BsfIfbYj
         M6QsmOkTaBn59kA65BNUuW6cWb+Gh1+8J7v6X7UVbVZss9XVZuoDFLxHntapSeDddt8X
         lmYg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id c5-20020a2ea785000000b002aa399f4d60si315264ljf.6.2023.05.19.13.40.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdZ0xZ2zxtC;
	Fri, 19 May 2023 22:40:50 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 29/73] core: riscv: introduce global sbi_ecall.h
Date: Fri, 19 May 2023 22:39:49 +0200
Message-Id: <20230519204033.643200-30-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIIII, Probability=9%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, LINES_OF_YELLING_3 0.05, BODY_SIZE_3000_3999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_FUR_HEADER 0, REFERENCES 0, SENDER_NO_AUTH 0, SINGLE_URI_IN_BODY 0, SUSP_DH_NEG 0, URI_WITH_PATH_ONLY 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CP_URI_IN_BODY 0, __CTE 0, __FILESHARE_PHRASE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __HTTPS_URI 0, __IN_REP_TO 0, __LINES_OF_YELLING 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SINGLE_URI_TEXT 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0,
 __URI_HAS_HYPHEN_USC 0, __URI_IN_BODY 0, __URI_MAILTO 0, __URI_NOT_IMG 0, __URI_NO_WWW 0, __URI_NS , __URI_WITH_PATH 0'
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

This routines will later also be shared with inmates, so implement it
globally.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 include/arch/riscv/asm/sbi_ecall.h | 96 ++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 include/arch/riscv/asm/sbi_ecall.h

diff --git a/include/arch/riscv/asm/sbi_ecall.h b/include/arch/riscv/asm/sbi_ecall.h
new file mode 100644
index 00000000..cc0ce2dc
--- /dev/null
+++ b/include/arch/riscv/asm/sbi_ecall.h
@@ -0,0 +1,96 @@
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
+/* see https://github.com/riscv/riscv-sbi-doc/blob/master/riscv-sbi.adoc */
+
+#ifndef _SBI_ECALL_H
+#define _SBI_ECALL_H
+
+#define SBI_SUCCESS		0
+#define SBI_ERR_FAILED		-1
+#define SBI_ERR_NOT_SUPPORTED	-2
+#define SBI_ERR_INVALID_PARAM	-3
+#define SBI_ERR_DENIED		-4
+#define SBI_ERR_INVALID_ADDRESS	-5
+#define SBI_ERR_ALREADY_AVAILABLE	-6
+
+#define SBI_EXT_TIME		0x54494D45
+#define SBI_EXT_TIME_SET_TIMER	0x0
+
+#ifndef __ASSEMBLY__
+
+struct sbiret {
+	long error;
+	long value;
+};
+
+static inline struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
+				      unsigned long arg1, unsigned long arg2,
+				      unsigned long arg3, unsigned long arg4,
+				      unsigned long arg5)
+{
+	struct sbiret ret;
+
+	register unsigned long a0 asm ("a0") = arg0;
+	register unsigned long a1 asm ("a1") = arg1;
+	register unsigned long a2 asm ("a2") = arg2;
+	register unsigned long a3 asm ("a3") = arg3;
+	register unsigned long a4 asm ("a4") = arg4;
+	register unsigned long a5 asm ("a5") = arg5;
+	register unsigned long a6 asm ("a6") = fid;
+	register unsigned long a7 asm ("a7") = ext;
+	asm volatile ("ecall"
+		      : "+r" (a0), "+r" (a1)
+		      : "r" (a2), "r" (a3), "r" (a4),
+		        "r" (a5), "r" (a6), "r" (a7)
+		      : "memory");
+	ret.error = a0;
+	ret.value = a1;
+
+	return ret;
+}
+
+static inline struct sbiret sbi_set_timer(unsigned long stime_value)
+{
+	return sbi_ecall(SBI_EXT_TIME, SBI_EXT_TIME_SET_TIMER, stime_value,
+			 0, 0, 0, 0, 0);
+}
+
+#endif /* !__ASSEMBLY__ */
+
+#endif /* _SBI_ECALL_H */
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-30-ralf.ramsauer%40oth-regensburg.de.
