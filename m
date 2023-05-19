Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBV55T6RQMGQEMJFQESQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id AF40870A0DD
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:56 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id ffacd0b85a97d-3062dedf7d9sf2464755f8f.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528856; cv=pass;
        d=google.com; s=arc-20160816;
        b=hRRHnPFUCb2wiYziBNB/poabn8BWormp82y/nWoKb84wTvB1WFiYpdQKhLumS0I2q7
         7HbJmj+3SJSqgkoaoaiIsFFNJ58WEadHZ0dGeSge7eGftBqCuPZO1dttTIw9ssIfV+XR
         F7Usrs4qKvKBPD60rjLrviCDOE+h6z0/QDLA+HrfLL5H/uA/27WYK0xDnRtAY+hWNu9S
         wOUxN1gvNU+UnoB6PcD171EdjH8U+KYU8A1GBYVW06NIzxf8o6ff46rQDRXrSZXJ6ixJ
         R43GiOLbp6gxPNyQ6BU4QIMlQ0c/G/KfWqZGgeKdN+vCw3u3D6GFK2uPtfBwsfpz7hoH
         7BTg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=g51QwsI3iInlay4qOGTCPcjhfC0EpEflxWP8WCQj0HI=;
        b=bFh9hHXsg/fIubRF/tYEinTE3Ky2TAWkz8hQn5MvSfz3CfWyqd+A8uE5jqaEznRSOy
         Ieu+DUPDx2AoPOc36455Yx3XvX2OpyFRwK4OO+TJCPRrnyW3N/5glkDCK7kLKhdhpann
         y0lbaRkg4mC7MZ+af7lfs1Cxp4VqhyJ9LC5QdorP3WJxLPazdngO45EZD5IC+cdTwLYn
         Tuw2v+WGdQRzeqvnQkoMpdTP5rP1vyO4bzNZtFt2Z4Gu+u9DxCXCXIluaTrBzazigLiH
         hG+qnbWwSOL4vRAAQgYJDQybxKOtPGqaJnr6lBCCnRQ8cZEnuTrq3Hui1gNBrNaT7Bht
         448Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528856; x=1687120856;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g51QwsI3iInlay4qOGTCPcjhfC0EpEflxWP8WCQj0HI=;
        b=plDIIMrUvgdY+tyPq9lQSbP5kKNi9mVQM2gp2b2iklJ2by2UzRs8r/p9LAexw2/OOt
         I3xmzkE54Sz8yprQRrqfLYyF22LkGJd1AsYP8lh10vlqWAKg6dK/+Y7u02+YLyq4xsPm
         jW5Kacm/aHLsLnBvJeoZLwpIgMSMQxwqJ93uVizhdNmJfTVq1sE7cSVOewBDv/1ldRwi
         JRbdQJJKcAM4JWlRTSx1CR41hk7y5W1UhmqQ7XL+9A/t8aG2t5lPMQgGu2PyZXXvOWvv
         BzqwGmD76AUsFQzva6pnEqv2jUwYjg4Tut35oWVQtAu0CDf3kVRR5Z4+/f4z/eTLEzee
         Ipyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528856; x=1687120856;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g51QwsI3iInlay4qOGTCPcjhfC0EpEflxWP8WCQj0HI=;
        b=CEEihNv/rmEq8kmDhRb/4j5bEY8W+HvKrydZhhe2sn9SN6q7gc92LEJTuq8KW4ap+X
         v9dt7sl3XcwBGd2W7mgZkxaTAwI+ejkTpG3G8MCmbbmns0NYqRw6+ibBrFyBXqLxpRH3
         gx0Kzvli4smGs5222CCQx2IwRDk4EOFGBuxArfSVmET8dy4l+ISJKvs9IXZEuxxGujtk
         bFjcVciAFFRezoTbLD9VJGwIB/GGcFpb2LKohz3KxcDn3Ut75V5bRa5gZtbsyoVply11
         gZuDZdhxaqEMshndnIQA9JQ5zHyk3KioRMNoCOsq6LJqeHLj2aQI571raYxJp9WLwNAf
         NhyA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDztaJK0onE45B7nVahVm9NQDprfR8Q245wGcsggVv86U9/c/Hzc
	Fowkk6dwAbBSSsnoYzZAUcg=
X-Google-Smtp-Source: ACHHUZ6FOXy1uJXMi327D1AozJBxK5r92L8Q50xJz03G/PopmowSpUHvUvEAvi+52d7QIqi0Nkwj9Q==
X-Received: by 2002:a5d:4fc9:0:b0:309:485d:7678 with SMTP id h9-20020a5d4fc9000000b00309485d7678mr579306wrw.13.1684528856417;
        Fri, 19 May 2023 13:40:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:3b0a:b0:3f1:6946:24dd with SMTP id
 m10-20020a05600c3b0a00b003f1694624ddls1877445wms.0.-pod-prod-09-eu; Fri, 19
 May 2023 13:40:54 -0700 (PDT)
X-Received: by 2002:a7b:c3c5:0:b0:3f4:ef34:fbc2 with SMTP id t5-20020a7bc3c5000000b003f4ef34fbc2mr2300280wmj.24.1684528854808;
        Fri, 19 May 2023 13:40:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528854; cv=none;
        d=google.com; s=arc-20160816;
        b=uqzNPoCc/H4FLa32Q9ttB2d3WRShrKP0PjazH7bmSsvdTkGC4qoWGtz+j3dn5FSJCr
         Q+ansZxZCkgefmqqdieb3ChmXGhvudb+/otwMuVbLSzbBGkYSEPGBBIuZWAG6IwoCD41
         ITZ8Ux5fTLOvLAE15XoKkGHUKncboxuHGtlq2QA0c8gOU+gPhDC+g4GyjlTmqhaLxS+a
         ZfOIuQQGor/aEGY9cNW0bj+GwTPOPAvZKJEPPL1+b8C5e6twudMU0sHEdviiinvVhpJj
         aXr0CaUSJ2c83xr6mxpiDD03ucwnW5VY7MDMMkRGGF1mrWBEHGQO/konSJo/leAAfj5z
         qAsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=gioyH+7DjVdHF9lG9hZCEP+L1/3iOQSLqGUDsmZtHmk=;
        b=bcv4JPyNLkxVo3+VPuF+YtCITYc+sqKxy2L5l2FLCAZ6BxCSv/naptJl0seA5LNCOp
         m83lXW6hGoyidOOoqFbuSwkIzooXxJi/lLqVzFdvKiSRlomFygnU94/h3u1Qn7CeQ35r
         4FfPGiTPe5963f5EmEAwv9CNBGmES9PgihJZ+XkETmktlav5D/xXhO5WpuXREj/d5OVe
         weTXfrVO2boB70OPycJybJ9uyZ0qVdTR8nPglp+oecg1ju5WCZIMLG+RlIZ81VpPhFsP
         ab2bHyI1+jVMXy1FbANaRJZX6QX42SVn7+S3S8gaGm0sqiqEgWOwEnm3EWhE515Bmphg
         Kq4g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id he3-20020a05600c540300b003f42c1b8171si18599wmb.0.2023.05.19.13.40.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdf2nWSzxr2;
	Fri, 19 May 2023 22:40:54 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 45/73] core: riscv: introduce irqchip.h
Date: Fri, 19 May 2023 22:40:05 +0200
Message-Id: <20230519204033.643200-46-ralf.ramsauer@oth-regensburg.de>
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

Which will contained shared definitions that are used by both, PLIC and
APLIC. The irqchip abstraction layer provides abstraction for both irq
controller variants.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/include/asm/irqchip.h | 87 +++++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 hypervisor/arch/riscv/include/asm/irqchip.h

diff --git a/hypervisor/arch/riscv/include/asm/irqchip.h b/hypervisor/arch/riscv/include/asm/irqchip.h
new file mode 100644
index 00000000..5183f5de
--- /dev/null
+++ b/hypervisor/arch/riscv/include/asm/irqchip.h
@@ -0,0 +1,87 @@
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
+static inline short irqchip_max_irq(void)
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
+static inline bool irq_bitmap_test(u32 *bitmap, unsigned short irq)
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
+int irqchip_set_pending(void);
+
+#endif /* __ASSEMBLY__ */
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-46-ralf.ramsauer%40oth-regensburg.de.
