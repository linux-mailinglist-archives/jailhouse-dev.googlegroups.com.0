Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBX4GRGPQMGQE5HHY4SQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x639.google.com (mail-ej1-x639.google.com [IPv6:2a00:1450:4864:20::639])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDB868D677
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:08 +0100 (CET)
Received: by mail-ej1-x639.google.com with SMTP id nd38-20020a17090762a600b00871ff52c6b5sf10850633ejc.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:08 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772768; cv=pass;
        d=google.com; s=arc-20160816;
        b=LXOXogULeanXNVWEtsIN3KgouG2/l6Q/Ngh6IfpvyQ5ewOamiy+Br78xsH6v+EkdF7
         1lXqJq6gf/eIbWZwluLaLA/kClJ6ZAaHZPqpAbtvUMGwdf5eM4fRIkEFMv/MMwbDVJG2
         O0jYCx/Vs0wQGwNfphU/8Rj2GM0nMUZtnzcMNmbOAEJ0zr1C23bJA5D9RkKHnX6ch1Zf
         tVrkX4D6luLGdKah68LdBz4Jx9CE4ISPgZI9UnbThLUnwIdMjkdFW33hLL9QY8m47ynM
         I80lnwooatzQzS6l8XJ5tblplztvKAyHsQZhSaVmvojW3ivuQIZHA1r0NxWKR1aQoSog
         MvBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=/ucRvKGrjyF2JXyKx/s6OPQ+Ia6fbuVAvwu+lETarDQ=;
        b=eYzlHvTHZzo1kQUQBnPkTlgD1XpkrSOp4TjzC3RaRVl4hvN9eEkkKBk5q6/V7U1W+Q
         YgqjAcB811ndegeQdSWeVa/9GLEO0tFNrf6naP8Iq0oJX5Af4yZUxnh5f8YLWmr7ZO6H
         USx7QCVd4LsuobTje6UPH2kWdKcZ+gjo596f9msJpinexR5FLxggA9GkppPlBIBus8Eq
         oE1Wxl/rriRPGHOL4SnLmN+pQQ+eVOdJHTZ0L+9W7oz30xHajY6rvuAg/nP0Bx6frhbQ
         7r0bM+8PbPsTPyp+T12JE16312h2gJ39JM5SIdwomX2dZtOcp83NikIEckoVx0lEwdKb
         SDjg==
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
        bh=/ucRvKGrjyF2JXyKx/s6OPQ+Ia6fbuVAvwu+lETarDQ=;
        b=MBeeTV9RdF2Q2fh+4s4mlw3Xy2dMt+ZjYLk8adleYH+KdgwG2lUqZMmSnXNYwDplo+
         JQSfMk5pyKYwm5UTazhl96eQLX2hBljlbju4Kqdu4UtKTYKl5a1gZQbalAQ49B8nozFZ
         Man+4nsPSBjlqaeKjx8QOdlvGCqF3vAWtijkeoW6AQMTYLrZ26+SuGrvs6yQgLWVTsuz
         o3QVnlkI6+nxeY0QtjxKvsVFf5AzKJ4bcw41roZ64RQXdJZlG8GGYuwR+JwnwaDX+gV1
         He2aVrn+iyVW7QhOv3SyHChi8fd5D5ogjHlPsyCYhpJaT066O7rInhS4jTYK2qMbcl7y
         TIfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ucRvKGrjyF2JXyKx/s6OPQ+Ia6fbuVAvwu+lETarDQ=;
        b=ltz+oc2ROwEppOiDp6dGZhSEKPxP549sDVjC2ExC37DuhA5j3RQLCaqI45MbqBWvcI
         Dc1LrycRnZfAZDW36J5G0v84T23TJdxO9A71vc8EahljkZFpjeX5QGsHQ7mUVXCj5sP5
         szIfFVgPrI3hfdlW8OnTNVCcDxGhxJsZ7FAHQYMP2p6tl0qFxNVqcMNxg6QKacgt/EyY
         J8QvBKmumhbcQoruDNQ7aQ9f1WxvHHLUMG1QhR7dx5GM+z6svV50hkg2x+Thq58H6CrB
         9jPR4pnr158h9VjqyIw2nTBAmj0aZ5dvC4yptLzl49cIEc5B2S0waMPFhWjIay6W4W/+
         WViA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKWZ7HN8DQ32z2oRyh5t6ygZChr7CdPv/bUW/wg6lapzU6WR3m4z
	JgDMKnyXqiV6T2jmWclmv4o=
X-Google-Smtp-Source: AK7set8qc39kRDmQpqfTwwicn/Ht+7EiigH7EfEWM5OQO36CCEOlEhQk4qCNWWPOzqeoAMHD6weL1g==
X-Received: by 2002:a50:d75e:0:b0:4a2:3606:83ea with SMTP id i30-20020a50d75e000000b004a2360683eamr717732edj.73.1675772768124;
        Tue, 07 Feb 2023 04:26:08 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:7da9:b0:7c1:2050:cc5f with SMTP id
 oz41-20020a1709077da900b007c12050cc5fls10349996ejc.0.-pod-prod-gmail; Tue, 07
 Feb 2023 04:26:06 -0800 (PST)
X-Received: by 2002:a17:906:db0d:b0:878:61d8:d7c2 with SMTP id xj13-20020a170906db0d00b0087861d8d7c2mr4221237ejb.39.1675772766380;
        Tue, 07 Feb 2023 04:26:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772766; cv=none;
        d=google.com; s=arc-20160816;
        b=qurCSgRgqVWVNxSO5z9ABm63rtuzc6r5AmSHwzFP5Wds3W8lF0SoVZK+LQbcjzTQ5D
         ttYoeDF33Whb0Mibj0b83LLEL6vkhE0z8dI02ArtFVWlOczHVnOzeViqN1X/GGSWbR20
         MrTb9hbJFteWHx0OmvogvJKdEel6g12tvZyNG+Y4zGtnaE0x3q7gET3diI9KDWEBwAdl
         WFpl3lGg7Zxu0c55b0/qdAPOkHhcfN/mAjfK6EHBCnAQUGiO/qgzQI34xXMta5UuJHFy
         afgOsgKgC/NuzvfrdAH2e/BTOHLwI5H5NSl808Xk+mbKi12ULPucRBvpeIslKDC93HVT
         dr+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=AKL8ET9kJgU6jhXmOtCAP4RHHeQXv2Tm/yXCaq9O1cI=;
        b=bMKvIUJToDUdAiPRfBYw5ihmxln/GlVFAQit7TYIvNzP9+YzZYai9EkLrvKjkVUOyE
         WqGQd221TooACQT1pc3f+rWciLPNh6ChEpsxXyjqQk/4+6iZxtv16lUx5QkR2Rh2WSY8
         6Izhd9GLsszZMYLzzj5ubHIML62rnQkuyY6sj7dCY69u/mZbXGjp8SrOf3th+4iJtxbv
         QuKJH21BZZS9fJeMr0vSZDeAte5sS+76vZR84vzInjwYhWfSytIDGvE/+IAWe6FtEQTb
         Xfj+bCFQipUlSeDD9wd+UgPju14SGpbGoS06pB4ci+Ch74YQQOYaviaHJwVcYRg7stX4
         /30Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id sa6-20020a1709076d0600b0087873f29192si853632ejc.2.2023.02.07.04.26.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:06 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RK65xnzyLG;
	Tue,  7 Feb 2023 13:26:05 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v2 09/47] core: riscv: introduce global sbi_ecall.h
Date: Tue,  7 Feb 2023 13:25:05 +0100
Message-Id: <20230207122543.1128638-10-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIIII, Probability=9%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, LINES_OF_YELLING_3 0.05, BODY_SIZE_3000_3999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_FUR_HEADER 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SINGLE_URI_IN_BODY 0, SUSP_DH_NEG 0, URI_WITH_PATH_ONLY 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CP_URI_IN_BODY 0, __CTE 0, __FILESHARE_PHRASE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __HTTPS_URI 0, __IN_REP_TO 0, __LINES_OF_YELLING 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SINGLE_URI_TEXT 0,
 __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_HAS_HYPHEN_USC 0, __URI_IN_BODY 0, __URI_MAILTO 0, __URI_NOT_IMG 0, __URI_NO_WWW 0, __URI_NS , __URI_WITH_PATH 0'
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
2.39.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230207122543.1128638-10-ralf.ramsauer%40oth-regensburg.de.
