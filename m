Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBZUGRGPQMGQEOQXEN6A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED2568D68B
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:15 +0100 (CET)
Received: by mail-wm1-x339.google.com with SMTP id n7-20020a05600c3b8700b003dc55dcb298sf8070069wms.8
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:15 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772775; cv=pass;
        d=google.com; s=arc-20160816;
        b=RId29F2+eyFp1Erqr8boAjNZ7y8dZogHXilFYgZNK8W+EfTYmjBvvMPxIzkSQDMczo
         cRs6JRpWmwtXafzEUm1W+aLrQaKbLVvw8x9AXTVKZ0kCCI1BryyhBXPiaZ+YlG4eDD7w
         RmWKnQhgMZRfzNFbAT03ZB5FKt2zwy0echcIYP8YuZiOIxMvq5kKC82I2FHTGoCXWgXh
         RSunXLLdMawCmeLXAGgRuT83Ha2chDtN7wn4bv+EmUrp3ZihFVChHy7Qiow9W84IT5Ec
         OoYRK5GH4HAMG7i4eXxUdwchA25KsiMHr90oaXuTHUfGaSKf0LVPwqaQR6xEBoBsin3D
         DYdg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=DNhOTF6Dtnh0V81sn7g1KeMs5LSZXfTBWBroolqBmCg=;
        b=fCe5ZalXMGYTdFnwc2wwmNXKRZq3Dd7bNJv8N+oowEcMQYNGx1xodwfTrOqs4ZkGjQ
         C+il6Dz0FCXekLl4g365AH2B5wcnaFHuNpfZqUZ889Q2Zk+DgCQGrfCX3GdEoZgJpjsy
         LmzHAp7bmEAI6ckrkKpB7IyLmqWRSUh7Eh2yY+Yx9dUljBdsCjlb5TvGL7GAeROu0vOl
         DWDKhsHDdWWlXPskvO1eCyyyvsdozf8EGsqLswmGWQSnXgMTYjfjzp2hciu/DsPeuOLz
         ek37a66o4/LYGjAuCZzKgd75aIUOivdOfyEQasK1s7SXXP7Z1Gt4JkQhzpgV/diD1Q4P
         +w4Q==
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
        bh=DNhOTF6Dtnh0V81sn7g1KeMs5LSZXfTBWBroolqBmCg=;
        b=CP1iswHxfsNrr2ft4jFODbWOtCpuKXruTueoI+i/nlyhLV6HxwzIEQCfHX8lGr2kjX
         LVY4dDZc7ZWDdMqybhfRmYHdixUTjhLmWFr0NyfC3LffUyHzK8x2W8ZNRRTckccKcSeL
         0kQsSTB2GD4ftMbKjY+ZVzZc/ToMVoDcB7dIxLDe0mPRFJADdIoakjZDPfmI0X3cMWoZ
         u1i2mOrsCoCZS66TAoCMjvY1UBP5JuC4T4DPtZQbkBSY0Djjnxs9sS/hf8IFt3VKEOCm
         tuTLYacp/nk3MoIlAI8GA45ctrXchTbW9dGGSyG0uNnOGrkyE39VKB8p2IcleLtxf4d1
         TmCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DNhOTF6Dtnh0V81sn7g1KeMs5LSZXfTBWBroolqBmCg=;
        b=bBb+Nf15Goqgn+2woClJtJJlrb/dZUygUtosMKWztlkwME3o1PnsT68tquTstLHLJM
         GAbN92Jq3gr8lwU5GNDs21XOCMr/PblHnGGUFWKyr7ozc7zHFJhZBadolUd3GQN48bCy
         ZJrzBN/10rdRSetE4GNswdI2lKDIaia5XV+mUwHxwOuAojoWnnrf+cCWmC+bTY/kt4Dd
         cTYYAfh+rk2Q6DCOZuWiT1UN30NLSnkWp/66GP9bjyK9MjwCB6enMKw3V1RTqE6zNwa9
         RJN+EeF1FeF0DWlsxLnLjgP6a1TGCSzq4XauwfzkdwVuOrkxD4nCLRLDiN2rHqcMBYdi
         MmtA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKX/ewEP4j/CtE6dt7ebwGsj21N62d0ZcNKyx5DBZles0i2qvRT1
	+xSBRu2wlSfTUCqxA92HkBQ=
X-Google-Smtp-Source: AK7set8m6IMJJyXZ0Dl4Ma6BIP5VsI3OeBzUajSLs6HDxWtlcJc/pTG1KwcjGFJWjaGOBpjSOuPQMg==
X-Received: by 2002:a05:600c:21ca:b0:3df:d86d:7968 with SMTP id x10-20020a05600c21ca00b003dfd86d7968mr1216105wmj.117.1675772774997;
        Tue, 07 Feb 2023 04:26:14 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:35cc:b0:3cf:9be3:73dd with SMTP id
 r12-20020a05600c35cc00b003cf9be373ddls10050559wmq.3.-pod-canary-gmail; Tue,
 07 Feb 2023 04:26:13 -0800 (PST)
X-Received: by 2002:a05:600c:3093:b0:3dd:37a5:dc90 with SMTP id g19-20020a05600c309300b003dd37a5dc90mr2968188wmn.32.1675772773272;
        Tue, 07 Feb 2023 04:26:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772773; cv=none;
        d=google.com; s=arc-20160816;
        b=JDd2v59BYY2C28/6awRVfvUGZL55/xNMa3gJk/uVtbL9iTyk2VvHQvAhYurpYdP4LL
         Mz0llsR3ly5V220iow6Nti3Fdbagmb0EmRpQxC2YSoh4uaY5jiJN0E3W62naUTWvxx/N
         69jEWXhis3ogC2Oyvd5u6Zh8DWJMHErlu+6kq4WLrT6Ep36CuwFM0/Yl3/F23XigzAMb
         ovCeCI8O0BHdyc0BJhVUbgzpRyip4mWejgN1cV0pRBPyJAPdZiT74n+VWcWXmTYVsncU
         VV5okXFGTfiuexoYJpNOpknkgT447HAbj8un3VCSdFTH4aYFqnlxFFXL88U5+moI/vRt
         XKIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=YcfQkoiXNOo49S4vZI9VRgCH42DLl/1LWdUmqXfyu6E=;
        b=PLsJG+gNp+GFT9hR1nwuIHRxZ2Wag1HhwSnXyIuKiZTMd09loGAgX8U9gkQR4Pq8zK
         S7CJyjKL6r7lg7ULNltNyziIjawKunCW6aHYR2Sy9rf1pv4kjwlN9nlIbAjM3b/xc6O1
         m+/+KKerW5wkZy+2HC00vHcqG9cr+12YiHY7FvveXNjjrJrdcxXh0ceelRAAUWfPWatp
         DT5iEp9QFPXvha4EmSsdlm7VXNg7GKzN+c0n7+nsTPsRZev5gRux+UwiTRQnQPwHxycw
         9AQWh7aD/TmqyKgWLoObMDwbqB/4gFIG9atyQCxByj66V8hIDr11cJ0aGagtYUu+djee
         ayUw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id ay7-20020a05600c1e0700b003dfd8e47092si759545wmb.0.2023.02.07.04.26.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:13 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RS5zHtz1075;
	Tue,  7 Feb 2023 13:26:12 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v2 29/47] core: riscv: introduce irqchip.h
Date: Tue,  7 Feb 2023 13:25:25 +0100
Message-Id: <20230207122543.1128638-30-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_3000_3999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FILESHARE_PHRASE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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

Which will contained shared definitions that are used by both, PLIC and
APLIC. The irqchip abstraction layer provides abstraction for both irq
controller variants.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/include/asm/irqchip.h | 107 ++++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100644 hypervisor/arch/riscv/include/asm/irqchip.h

diff --git a/hypervisor/arch/riscv/include/asm/irqchip.h b/hypervisor/arch/riscv/include/asm/irqchip.h
new file mode 100644
index 00000000..24e8fdaf
--- /dev/null
+++ b/hypervisor/arch/riscv/include/asm/irqchip.h
@@ -0,0 +1,107 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) OTH Regensburg, 2022-2023
+ *
+ * Authors:
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+/* Shared definitions for (A)PLIC */
+#define IRQCHIP_REG_SZ		4
+#define IRQCHIP_BITS_PER_REG	(IRQCHIP_REG_SZ * 8)
+
+#define IRQ_BIT(irq)		((irq) % IRQCHIP_BITS_PER_REG)
+#define IRQ_MASK(irq)		(1 << IRQ_BIT(irq))
+
+#ifndef __ASSEMBLY__
+
+#define REG_RANGE(A, B)		(A)...((B) - IRQCHIP_REG_SZ)
+
+#define SYSCONFIG_IRQCHIP	system_config->platform_info.riscv.irqchip
+
+struct irqchip {
+	int (*init)(void);
+	enum mmio_result (*mmio_handler)(void *arg, struct mmio_access *access);
+	int (*claim_irq)(void);
+	void (*adjust_irq_target)(struct cell *cell, unsigned int irq);
+
+	void *base;
+	unsigned long pending[MAX_CPUS];
+};
+
+extern struct irqchip irqchip;
+
+static inline unsigned long irqchip_type(void)
+{
+	return SYSCONFIG_IRQCHIP.type;
+}
+
+static inline unsigned long irqchip_phys(void)
+{
+	return SYSCONFIG_IRQCHIP.base_address;
+}
+
+static inline unsigned long irqchip_size(void)
+{
+	return SYSCONFIG_IRQCHIP.size;
+}
+
+static inline u16 irqchip_max_irq(void)
+{
+	return SYSCONFIG_IRQCHIP.max_irq;
+}
+
+static inline void irq_bitmap_set(u32 *bitmap, unsigned int irq)
+{
+	bitmap[irq / IRQCHIP_BITS_PER_REG] |= IRQ_MASK(irq);
+}
+
+static inline void irq_bitmap_clear(u32 *bitmap, unsigned int irq)
+{
+	bitmap[irq / IRQCHIP_BITS_PER_REG] &= ~IRQ_MASK(irq);
+}
+
+static inline bool irq_bitmap_test(u32 *bitmap, unsigned int irq)
+{
+	u32 val;
+
+	if (irq >= irqchip_max_irq())
+		return false;
+
+	val = bitmap[irq / IRQCHIP_BITS_PER_REG];
+
+	return !!(val & IRQ_MASK(irq));
+}
+
+static inline bool irqchip_irq_in_cell(struct cell *cell, unsigned int irq)
+{
+	return irq_bitmap_test(cell->arch.irq_bitmap, irq);
+}
+
+static inline void guest_inject_ext(void)
+{
+	csr_set(CSR_HVIP, (1 << IRQ_S_EXT) << VSIP_TO_HVIP_SHIFT);
+}
+
+static inline void guest_clear_ext(void)
+{
+	csr_clear(CSR_HVIP, (1 << IRQ_S_EXT) << VSIP_TO_HVIP_SHIFT);
+}
+
+static inline void ext_disable(void)
+{
+	csr_clear(sie, IE_EIE);
+}
+
+static inline void ext_enable(void)
+{
+	csr_set(sie, IE_EIE);
+}
+
+int irqchip_set_pending(void);
+
+#endif /* __ASSEMBLY__ */
-- 
2.39.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230207122543.1128638-30-ralf.ramsauer%40oth-regensburg.de.
