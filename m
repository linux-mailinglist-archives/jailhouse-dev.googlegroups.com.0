Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBUV5T6RQMGQEZ5ZUFOY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF5170A0CA
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:52 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id 2adb3069b0e04-4f19bffbc23sf2395676e87.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528851; cv=pass;
        d=google.com; s=arc-20160816;
        b=CJv+nYw6CT9w4gStqSC3m3NF1oRdK8PZnHxH4+nwfG6pKpxKNlo5DE4DgM5BRJBwVh
         iIIldyOxOQFDh1c9henFhLowEr0YKd3k/exrFn7jHtfjPArzpGNn7TiOArTKYJJ16nXx
         0f2klFchpOYx2Sr3jIvkuoiGYEPGk24ZANd/muzGogOibugF0tKibqg/b/MnatKi30HD
         5v6HiN/mq2UeTF4P8IR9wutXV8MKvCqbbgxNaC6hzrHXhW2WJxrSHv4ktonPV8+PVdh6
         bLP2Xq83/owsLsD5IVv6Vp8GjvB/0ebpet63NJhHr+Uh3hsKwpoSan+IkVNQal7CCL40
         DFTA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=SncY89fNfRq2YDRwxSc2CFau4wgL9i1uzhmQ5Gs2RQc=;
        b=VOpt5oo6a/5etncG+PXPrJSynIerioQC7IDSXnHGdKc6R1DAu0X+L7+v6EZdZViJYo
         5KbGA2MH3P/y/zfw/FDRmuG95mI96Ypd8YAlGu6Ll9IjnbRKHhEKpD+7JeJm7So9MNGe
         hvHwpdw2U3HJcwSgrdryiUUAf4JnfIqSi4HPHdKhPTG/7oHNM6Nuy0lunfxOyk8wzdEU
         qhlmuygLaaCi0yOAvX7SdfuOa6j7hnWaj6A0Ys6p8/eVZZz6XyY9JtSFwGcHr2P6tzl/
         /HUJ4PY7iNtdimzGQtAKQJPZ0fEUX5vkiQEw4IBCrrLHgErYqqxJ9ZA6kflzjiKiGt2Y
         x3Iw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528851; x=1687120851;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SncY89fNfRq2YDRwxSc2CFau4wgL9i1uzhmQ5Gs2RQc=;
        b=G6sMrDisQQUKNKswTP6QbbRfT3Fxlxv0KpVReNJJgsRUhz3XDPjeOYuZdD7GBatNqb
         uaq0+liamNoznICtFaLNRIq/QgylaCqxivf0T0wO/VdXMNSRTc4Rx/Ww+y1rRnba0//G
         +APvXdGuhbWYVq+0EqEpQUD3AGbm8tuINyilFLn8biZv1LVQzASIkh//gLKS/SXqbSuP
         2kwgAHpI4V3E2/mRa8jDtjZUzwZpRbUYfLdiAHeiwChkXc6e3JiukBRtfTrVtS18Bbnd
         b170amWhrYzW4eIIsqcVid+rYcu+bJex8pV3aFtRporF0UPY4zVXbUaTvxJl/ZW52e1h
         MLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528851; x=1687120851;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SncY89fNfRq2YDRwxSc2CFau4wgL9i1uzhmQ5Gs2RQc=;
        b=WA8qj9Gs6H1KzCu+TMbSaRSDQuqthtqofTRM/7sZ1D3U67vfOZTkjs2+ypDct/knpn
         NmlxKQK1Kq6/n+9a9CnFTDJd1aRBhfojDD1MmlA6MLLfEVEjJEPfR6QvLvwIcwy62ARk
         TcBg1rUH/2SPl3QTYBIdeJMWgvOok6m6XwzFSKIOrEC3EdASNuOI6j1DTATlQYvCje4V
         PmWudZqioYdTscaQHkR2LganxEovIzE8MXM4EnQgIq2S3713+4QNMkJza6zk067/EpUo
         44MeNHRMln2Q5d/l5BP7dR9Uv4zwv+jRe6tJVulj0O0ryueKpJkvP3bLGSsL2nEGGwbp
         jkug==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDzWd9cuE3RHarP0Vv+lpC935qBppHA3UDtOHUjw1Jm/RwJUdKYw
	PDo3glwoTcy2TeUBFBoLcQo=
X-Google-Smtp-Source: ACHHUZ6Y6FYgExUHHlLAgmBVmqW5iejaa/S1D4yJCNYoB7jfkrPIlm3vm8zU2XD2jRk2VuTATXjD0Q==
X-Received: by 2002:a05:6512:481:b0:4f3:b6b8:dad5 with SMTP id v1-20020a056512048100b004f3b6b8dad5mr11309lfq.5.1684528851452;
        Fri, 19 May 2023 13:40:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:7715:0:b0:4f2:5056:2be with SMTP id s21-20020a197715000000b004f2505602bels341080lfc.0.-pod-prod-04-eu;
 Fri, 19 May 2023 13:40:49 -0700 (PDT)
X-Received: by 2002:ac2:5925:0:b0:4f3:7a01:f0d6 with SMTP id v5-20020ac25925000000b004f37a01f0d6mr1008850lfi.67.1684528849625;
        Fri, 19 May 2023 13:40:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528849; cv=none;
        d=google.com; s=arc-20160816;
        b=kfZ457j5SQ678ejAdUEaFxtb/ekE3kz0SNLTKvIijlfifA+u1hznt9MFXuiY0DV1iL
         GW7MyOM9uQ7abklXnxJiw1JH6Dw6g+TgelC6db8e48X2W/CFLuy6TLzIcCrEk3d1qZWG
         dmdtRLrF1f/Sh5NIY9GwjQjeAuAHKFhWvQPSAzpfrbekmqmAcBeCZt4oFUC8qUo+DdPA
         J8zNOBSuUctThF93TM8ObdkX/r+tlXpCSj/ikuok4x9fn3Uu665lvfKgcDlE1ywgFDsh
         nugqdk/SfK7EmaCSGyd31EGLJPD7e8SzBBU3iVwo5rG0S+3QKAoFuuikoo+1TIjgUgNB
         0z/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=I3Uu56f/PhaXi8TfHqxshXW40tb1PqSTsc0DaInVHdg=;
        b=a+sMgS4gBx9ISta/Jl0wNK43THO4zYr5uCCgDEG3E6Qzrevwh/t4AGVvQISFIDWmtQ
         bdsn7HpQRgE2rWcl8mRDXVERjpMog4pEE8rw4PKvZPzuWA7O5KlQPcvtT4/6ec6Rg9tH
         ZjXu9A3jVXTKCIbi6XTyQNpjTniGaammLltWsPDXWRh22p7Mgqsi63qzvnE/iFR5k6fU
         oXmEUAJNCSj9cZegDrAyLmTnjL43V1EmFu2hyszYFNYM2eJ8YeTMbsONasr4KzhU34y1
         Dros1KxW1TilOLoyYxxEhO/wHYlswymZXzcgcpu8H7LezCj+lux1X3rcSfYZWsVtbvqV
         omOA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id h16-20020a056512221000b004f3b2f0559asi11400lfu.5.2023.05.19.13.40.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdX6TMbzxtl;
	Fri, 19 May 2023 22:40:48 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 24/73] core: riscv: define MMIO accessors
Date: Fri, 19 May 2023 22:39:44 +0200
Message-Id: <20230519204033.643200-25-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_3000_3999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_BIG_COIN 0, __FRAUD_MONEY_BIG_COIN_DIG 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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

GCC may emit 4x 1 Byte reads in case of our regular mmio_read32
accessor, when used in combination with -Os. Yes, I've seen it.

Define safe handlers to overcome this issue.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/include/asm/mmio.h | 67 ++++++++++++++++++++++++
 hypervisor/include/jailhouse/mmio.h      |  4 ++
 2 files changed, 71 insertions(+)

diff --git a/hypervisor/arch/riscv/include/asm/mmio.h b/hypervisor/arch/riscv/include/asm/mmio.h
index e69de29b..e19d0cec 100644
--- a/hypervisor/arch/riscv/include/asm/mmio.h
+++ b/hypervisor/arch/riscv/include/asm/mmio.h
@@ -0,0 +1,67 @@
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
+ */
+
+/*
+ * We need those definitions, as I saw the compiler emitting 4x 1B loads in
+ * case of mmio_read32.
+ */
+
+#define DEFINE_MMIO_READ
+#define DEFINE_MMIO_WRITE
+
+static inline void mmio_write8(volatile void *addr, u8 val)
+{
+	asm volatile("sb %0, 0(%1)" : : "r" (val), "r" (addr));
+}
+
+static inline void mmio_write16(volatile void *addr, u16 val)
+{
+	asm volatile("sh %0, 0(%1)" : : "r" (val), "r" (addr));
+}
+
+static inline void mmio_write32(volatile void *addr, u32 val)
+{
+	asm volatile("sw %0, 0(%1)" : : "r" (val), "r" (addr));
+}
+
+static inline void mmio_write64(volatile void *addr, u64 val)
+{
+	asm volatile("sd %0, 0(%1)" : : "r" (val), "r" (addr));
+}
+
+static inline u8 mmio_read8(const volatile void *addr)
+{
+	u8 val;
+	asm volatile("lb %0, 0(%1)" : "=r" (val) : "r" (addr));
+	return val;
+}
+
+static inline u16 mmio_read16(const volatile void *addr)
+{
+	u16 val;
+	asm volatile("lh %0, 0(%1)" : "=r" (val) : "r" (addr));
+	return val;
+}
+
+static inline u32 mmio_read32(const volatile void *addr)
+{
+	u32 val;
+	asm volatile("lw %0, 0(%1)" : "=r" (val) : "r" (addr));
+	return val;
+}
+
+static inline u64 mmio_read64(const volatile void *addr)
+{
+	u64 val;
+	asm volatile("ld %0, 0(%1)" : "=r" (val) : "r" (addr));
+	return val;
+}
diff --git a/hypervisor/include/jailhouse/mmio.h b/hypervisor/include/jailhouse/mmio.h
index aa85a089..f5ace9e9 100644
--- a/hypervisor/include/jailhouse/mmio.h
+++ b/hypervisor/include/jailhouse/mmio.h
@@ -32,6 +32,7 @@ struct cell;
  * Define MMIO read accessor.
  * @param size		Access size.
  */
+#ifndef DEFINE_MMIO_READ
 #define DEFINE_MMIO_READ(size)						\
 static inline u##size mmio_read##size(void *address)			\
 {									\
@@ -49,12 +50,14 @@ DEFINE_MMIO_READ(8)
 DEFINE_MMIO_READ(16)
 DEFINE_MMIO_READ(32)
 DEFINE_MMIO_READ(64)
+#endif
 /** @} */
 
 /**
  * Define MMIO write accessor.
  * @param size		Access size.
  */
+#ifndef DEFINE_MMIO_WRITE
 #define DEFINE_MMIO_WRITE(size)						\
 static inline void mmio_write##size(void *address, u##size value)	\
 {									\
@@ -71,6 +74,7 @@ DEFINE_MMIO_WRITE(8)
 DEFINE_MMIO_WRITE(16)
 DEFINE_MMIO_WRITE(32)
 DEFINE_MMIO_WRITE(64)
+#endif
 /** @} */
 
 /**
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-25-ralf.ramsauer%40oth-regensburg.de.
