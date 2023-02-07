Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBX4GRGPQMGQE5HHY4SQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B28E68D678
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:08 +0100 (CET)
Received: by mail-wm1-x340.google.com with SMTP id h9-20020a05600c350900b003e000facbb1sf3268799wmq.9
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:08 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772768; cv=pass;
        d=google.com; s=arc-20160816;
        b=qUGR9qsCgDgZlnrR3brfh6vbM7LI5ToI0LJffrFHhSX+7CLZZofpoTdCZLg3SXWS0J
         vJz1Zwbro6mVSBgZAeRipFSmok+O7UaYJ9/KxWCEUp7LdoN6ufsdoiqIUC8nal8QXTlb
         aQDkrHNqZMkO+8eIGgF3Qs5TQWlP0t+5/ptJ4DBPs4FCCTRpUN6uwwQ4qOXbYYImiwPu
         bzLGIChz72hi43Npg/AeS6TKaBoY5B8svXShW1drZyTiD6rnte7NS7P4HoOfebCMypmh
         HY50eera0vm5fcI2WND0Vue3mKWGowYdr+urxUhud/C+7gcO/9mUnxrxrgey2wjWVgYr
         egVQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=zZoxWVJ/z4dyrqA7tyzQ9FaFgU3O4csh2Qu9B6wRKoA=;
        b=XXNR0TKnQzXeKoT+YNulld9vsISL4plNpjjSpUfo/pr24pAQNPrl86eyNGNQtCN0gB
         JmRvsciTiGWKMUWd7SzspmVY65NfGI4yjOYKP7NZ1m2lTKCIWAmEzwgqQaG0rlo1/4UG
         Dl/kD55YOi/PBTAIBtg3Ef8nt6APr9E0G5FqUYhNq2BcaCwwYuv/sAoPHI5eBD73wqIo
         Z7Qn3kACasbQV9IhtEq91Zf84rDNhg8w9/w4Z/xNGAtKOqa47tA+UZ9EYiyBrPAENkw9
         rPF7dGdKNqwR2FOx3r/PnWBf4pH8H6EYN76bPbvCEYctc/WCNQAi4aYjhLy6jZTzBp6y
         b1aA==
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
        bh=zZoxWVJ/z4dyrqA7tyzQ9FaFgU3O4csh2Qu9B6wRKoA=;
        b=ZGho/b63fZvVnGE6KCWUioNxPS0uqa5S2bLfmlL7dCpAWOrool1xtwChxmPgGAvy29
         gPUHOOM3Z8FKQW2ZccRFgqMAtBzvbS2aKOeIENwD6dfqhjrb1Ir9uTABk8Ru2DCkCiqR
         uVgYvtmbOMhVa4biNTCtpg8+q2xkZecpj1b4W2At8jBCIhHXGAkbTA4m6dNsJlH+Q+YB
         rszQSN+pIDRYnYTE+Xrd4m9OhH5VYHhsG+Q2oSmVpHYXezZUNcYu+eNRudhfkwWNeYJH
         4b056vLp6BiiCvCu1ntzTIZLiw1PuM6JfkMiRuTAD5x30u6ZQZU0peACJYCT7h9zW4YP
         nzyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zZoxWVJ/z4dyrqA7tyzQ9FaFgU3O4csh2Qu9B6wRKoA=;
        b=ALgjqW5EIgcctgeXXYGUW8swvpYrwf9IjTVq+5WGPkS94aubYwAJbQIIY4PVTAz9uk
         cKYtzsD5+z3GD4FGJHxnGSm38NIX1HfQU4tBxwMrGXgXZ8I1oftEquQRMFXTBnWoPHUP
         W1UALBJYAnAGYvj/h95j7q0TdrLgvORV0RGKuXSRUXRFBIrV/Hua2L5a/wVRoRQeXbQP
         gK/a8y7US3QBzCOeGg1LB7BKW+w1d1C9jYGLy4cUe1ZB65I0jRzXQUH7n2+Cv3AIFRDY
         YpSdX9mybgkRmoQSywFl+J8RsABNdrmO4I+3fDhxysK7ctr8fJkOu3GSWcU7s1ysti7e
         hXSg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKXvsaPuLXrNx3nVSz+TcT3sL5gW/Y8K7mMXzwSm2KI+dt/bOwUw
	FIB6sUpg7IDlKZMcmigc9xs=
X-Google-Smtp-Source: AK7set+xlBjsW4RvjhJRTHuwEbRIlWxuvy+BdYBQO4UlIs6r7/Sbc8KkQPpmgzVZ7llniYEYohh74g==
X-Received: by 2002:adf:fd48:0:b0:2c3:e5f5:9fac with SMTP id h8-20020adffd48000000b002c3e5f59facmr125990wrs.494.1675772768216;
        Tue, 07 Feb 2023 04:26:08 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:1c96:b0:3d9:bb72:6814 with SMTP id
 k22-20020a05600c1c9600b003d9bb726814ls8160447wms.3.-pod-control-gmail; Tue,
 07 Feb 2023 04:26:06 -0800 (PST)
X-Received: by 2002:a05:600c:707:b0:3dc:572f:edb7 with SMTP id i7-20020a05600c070700b003dc572fedb7mr1796619wmn.1.1675772766589;
        Tue, 07 Feb 2023 04:26:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772766; cv=none;
        d=google.com; s=arc-20160816;
        b=vpezGKFE4iX7uAZ9zZys1sIfTfzY83OGtxMzrMypdDto5gJG3VNxGso+JcLV3bEOlF
         P7yGdkywS3/0wapnmklb4QRw3Bd7El5Zc9nV9p2aUGtCOgtg+q07yFG+QPaPZuqrfeZ8
         7cO73k1tp7FmHkvskBR4SUSy0FsvLYxShvGEwmbs2WDm4B5RrI9yyE+33GMEq4I0Z/qz
         SzSRuRHbBuLTmizVweiSic3q6+jWoR26wrAjjWCqPiIbacSB4KMelL2ZcWJa1JLzUPi7
         t+B0U2ZWtQ4daeS/ZDqfd7U3ZNjbsKfOzQSRWvutBHBRe6y3Wip/PMUVoyyqxWBGJckX
         O/GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=KdA8RfSDogOIeO3BKQRkqIIDXNRRvbnk2nEuzg+WDTM=;
        b=ubGpOls2NDD/1vYX8VE2IIrmPmYQgED5fksCI1REEndUVdT6OeVQatk0mt/EVMVDs8
         2qupYwqM+yC2NhQSVti32ncQGRyZqfNpXAw4zYk9WB3/+wCyXmDtM/TB5Zlx3r5AJRXF
         +asZsM7hFQCmN4F+vToimcnl1qeZ1yRuK1fpbSvKAdpj4xclftbn3l2aGr9kk7M/jlvR
         55R4LGtkajR1Gy9ofNS2sbvL/lFghFufb/2paujLvw34jOsBISZyk45baWmMfvukqB2a
         nrqmVxmN0XKv8imhV7N9Sh0jJybu0yHPyO/IxIALl5cfILFlm0Uc7rAWGwSU1XK6j/y+
         R/5A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id l18-20020a05600c1d1200b003dd1c15e7ffsi588420wms.2.2023.02.07.04.26.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:06 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RL12mkzy6b;
	Tue,  7 Feb 2023 13:26:06 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v2 10/47] core: riscv: introduce asm/sbi.h
Date: Tue,  7 Feb 2023 13:25:06 +0100
Message-Id: <20230207122543.1128638-11-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_3000_3999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_FUR_HEADER 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SINGLE_URI_IN_BODY 0, SUSP_DH_NEG 0, URI_WITH_PATH_ONLY 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CP_URI_IN_BODY 0, __CTE 0, __FILESHARE_PHRASE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __HTTPS_URI 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SINGLE_URI_TEXT 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0,
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

Add helpers for straight-forward human-readable SBI calls.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/include/asm/sbi.h | 86 +++++++++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 hypervisor/arch/riscv/include/asm/sbi.h

diff --git a/hypervisor/arch/riscv/include/asm/sbi.h b/hypervisor/arch/riscv/include/asm/sbi.h
new file mode 100644
index 00000000..09501528
--- /dev/null
+++ b/hypervisor/arch/riscv/include/asm/sbi.h
@@ -0,0 +1,86 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2020
+ * Copyright (c) OTH Regensburg, 2022
+ *
+ * Authors:
+ *  Konrad Schwarz <konrad.schwarz@siemens.com>
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+/* see https://github.com/riscv/riscv-sbi-doc/blob/master/riscv-sbi.adoc */
+
+#ifndef _SBI_H
+#define _SBI_H
+
+#include <asm/sbi_ecall.h>
+
+#define RISCV_SBI_HART_STATE_STARTED		0
+#define RISCV_SBI_HART_STATE_STOPPED		1
+#define RISCV_SBI_HART_START_REQUEST_PENDING	2
+#define RISCV_SBI_HART_STOP_REQUEST_PENDING	3
+
+#define SBI_EXT_BASE			0x10
+#define SBI_EXT_BASE_GET_SPEC_VERSION	0
+#define SBI_EXT_BASE_GET_IMP_ID		1
+#define SBI_EXT_BASE_GET_IMP_VERSION	2
+#define SBI_EXT_BASE_PROBE_EXT		3
+#define SBI_EXT_BASE_GET_MVENDORID	4
+#define SBI_EXT_BASE_GET_MARCHID	5
+#define SBI_EXT_BASE_GET_MIMPID		6
+
+#define SBI_EXT_0_1_SET_TIMER		0x0
+#define SBI_EXT_0_1_CONSOLE_PUTCHAR	0x1
+#define SBI_EXT_0_1_CONSOLE_GETCHAR	0x2
+
+#define SBI_EXT_SPI		0x735049
+#define SBI_EXT_IPI_SEND_IPI	0x0
+
+#define SBI_EXT_RFENCE			0x52464E43
+#define SBI_REMOTE_FENCE_I		0
+#define SBI_REMOTE_SFENCE_VMA		1
+#define SBI_REMOTE_SFENCE_VMA_ASID	2
+#define SBI_REMOTE_HFENCE_GVMA_VMID	3
+#define SBI_REMOTE_HFENCE_GVMA		4
+#define SBI_REMOTE_HFENCE_VVMA_ASID	5
+#define SBI_REMOTE_HFENCE_VVMA		6
+
+#define SBI_EXT_HSM			0x48534D
+#define SBI_EXT_HSM_HART_START		0
+#define SBI_EXT_HSM_HART_STOP		1
+#define SBI_EXT_HSM_HART_STATUS		2
+#define SBI_EXT_HSM_HART_SUSPEND	3
+
+#define SBI_EXT_SRST			0x53525354
+
+#ifndef __ASSEMBLY__
+
+static inline struct sbiret sbi_send_ipi(unsigned long hart_mask,
+					 unsigned long hart_mask_base)
+{
+	return sbi_ecall(SBI_EXT_SPI, SBI_EXT_IPI_SEND_IPI,
+			 hart_mask, hart_mask_base, 0, 0, 0, 0);
+}
+
+static inline void sbi_console_putchar_legacy0_1(int ch)
+{
+	sbi_ecall(SBI_EXT_0_1_CONSOLE_PUTCHAR, 0, ch, 0, 0, 0, 0, 0);
+}
+
+static inline struct sbiret sbi_console_getchar_legacy_0_1(void)
+{
+	return sbi_ecall(SBI_EXT_0_1_CONSOLE_GETCHAR, 0, 0, 0, 0, 0, 0, 0);
+}
+
+static inline struct sbiret sbi_hart_stop(void)
+{
+	return sbi_ecall(SBI_EXT_HSM, SBI_EXT_HSM_HART_STOP, 0, 0, 0, 0, 0, 0);
+}
+
+#endif /* !__ASSEMBLY__ */
+
+#endif /* _SBI_H */
-- 
2.39.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230207122543.1128638-11-ralf.ramsauer%40oth-regensburg.de.
