Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBVF5T6RQMGQE6QTVA3Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 7093970A0D0
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:53 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id 2adb3069b0e04-4f01644f62esf2105641e87.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528853; cv=pass;
        d=google.com; s=arc-20160816;
        b=ftZ71T+x0km6qS3LI0fFbYmecl0eXeDwz4e8H+0+CQT8SwHI5EHE6GuFHmsMbHr9uy
         f5yZOmD1pThLnF/CZZ0ESoiYyfdghTnpxYEe9cZM2B/rfUeg4kFZtp8JlFvtw2/T7ue1
         cikwJJEZWbjm0R4wPbp5t1YrB2iT0tQds3X72xQrmmCd1E38M5e+yCHsjkmetWbzyd3M
         JGBIHbobBh3xUh3g2HQiZR9xJ92LgFjX0IU31AchsIHlzutcRmwVFgX+OClwSKUEmIbQ
         +uhLaxvccTqAXa9zXDMnxeYUadkS6s+uyNMbKQME0NLILaWxaUORZ+b8ZzNM4JUc07kJ
         sM6w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=fJwoSvusMpjc8jt8rwNUeUVvGrX0vF8Esq0oP8exuYg=;
        b=Pq9MsTwU3FEGVohhIq+yFY7DxmYBO6/ImdZAUOWDCDE2HXcEhtj9WkW8+TMNMoYOdv
         K4f2xwt2LpXQ77EWPkPq41AVNuQ70t7EciSppueN2lq+uzyl9S+Iy7BdphHMLSFw0h3H
         G4FfHeWBHs6ZZhTV/HBChnYURyaYKqYVlWTwIUveQngS4MqMPEG/QpNnaKkBYUiiN/eG
         2Cf+KQSXTESFyw+bZ5GcnEF1ALUDcaH4ijGOghPinImbohJmEzFb8NNbtRs9osiWmvId
         JieQOLHG6RIbYq/SzXDG+o9SuVUG19JtqS/8XYOOP/WPmK11tbzhpVcv2rMCowxx4xqI
         Znvg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528853; x=1687120853;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fJwoSvusMpjc8jt8rwNUeUVvGrX0vF8Esq0oP8exuYg=;
        b=WlqqxnZ/9jRko9qz5EmwAtkjNNX/Q/gML4dW23r34W636RN95RxJy6qr5K+W5O1RIM
         MY0fDiqLOwmkPHRdjfWJPMVdyz1mb+tu9KzmE7DkUn2oGbCwVv+cw/iVkyogsO3VN8LU
         qSnHjE6bezwA3Kav6q/I2KDM9n72l5MNB7KxYsMpubO5mDBx7StgzTCsG68nYCon/dLp
         raxIkdNEe7++aCI/1oNfEjO2U/BgGGuNXKN1Vj1h35KboYEtZEtKKyfaZfeHUUo13k0v
         duQzh8m4hTBgrdLAY95yHsYVWyuk7KGJS9MCxF714VcTnyBTrymuvbiuwSr/YeEEydfj
         vfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528853; x=1687120853;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJwoSvusMpjc8jt8rwNUeUVvGrX0vF8Esq0oP8exuYg=;
        b=fUq9MjTdwcTVM2gf8VKbZDsEZR+gmbArvHpMBA7gntkj5uY9RYv5ItF3593+Iuq3HB
         Cg2jY5KIZ1ENVh1//ASqkiVKC5HpfQuhBsHZyDvqE1t85U7XM1PSS9UU/9oVCLLKmk2C
         HdNJtxKzzOvGKX7L7ykzXvMHlQWxgdJgEpdij97WukBHKkD7nJy0U5vq9tbKDjToFwlz
         WlvwMiYbLv7nYZQfMFP/EuDfyuw9tDp50wd0WSGzPu3F6fXgpUeNmrEtoDAv1HKAm14Z
         SUQz6Z4zLi2Vkrc7R3ONMeN4/1SoFG5U4ZM+/6C7JxXujoUu9BTJ6NJ+6C15gRSaVvpN
         EgXg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDyYCHL7q41/T1PIt2kj/WgQWLBDcWXk0hSna7Ko0/ACwFgCCQMD
	Qf6IYVcxgN0YDfv7jPDBp+c=
X-Google-Smtp-Source: ACHHUZ7XhDwzj7/Hk1h92CNJftGbBnYrCOg5h6ONGQWpEpoS9dPO9zscHRowxvUcjtxw2dCirdfuPw==
X-Received: by 2002:a2e:7811:0:b0:2a8:928d:2e2e with SMTP id t17-20020a2e7811000000b002a8928d2e2emr779198ljc.5.1684528852954;
        Fri, 19 May 2023 13:40:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:a99e:0:b0:2ae:d52f:f70e with SMTP id x30-20020a2ea99e000000b002aed52ff70els792389ljq.0.-pod-prod-03-eu;
 Fri, 19 May 2023 13:40:51 -0700 (PDT)
X-Received: by 2002:a05:6512:11e7:b0:4f3:a554:a7fd with SMTP id p7-20020a05651211e700b004f3a554a7fdmr1006878lfs.40.1684528851128;
        Fri, 19 May 2023 13:40:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528851; cv=none;
        d=google.com; s=arc-20160816;
        b=Fgnap7ZlxXuFNIfqa5XvCLweWY6/TYxZ6kTfHHfUO9yH4feFxsHDA2FeNThtkwSTYH
         rqem5qAhW0z6zYDSLA6ALm526yjKUj3uoJY3ZfpKajBtMsxrsN9ZexRd+jCkVKMDERdb
         Sgml1yfuCojAFXeJWNwq9sXYYIcTeRdH3cYK+H8hPH63LmeAIg3voBka/5/rq2oFeTUM
         r8k75qhWaCrZcl926A2fKwRO+/q0KlfXQUEYbnqVd3lScDpSEzWjvV46I1kqEvwRxVv0
         8xjafE650H3P3yJBC1mqtPaP68FGLUEVkvqSTzFztd1zyOcsuh3SPuOuewYyDkwTideT
         psaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=N9PTNTyWVox4gvodxDqiaPih64wnoQVQjyeuZvCeTFo=;
        b=BYjXBCM8zwdY5iWzjo8g2rsBkNt7FKNaxXHX7OLDSmTyTT+++Bg3VgMXjRnWkJWh2Y
         WnOvYRjSgN7tfeF4kdvGOTuTpMimPVT7GGnKor6olTSHpDpTT48S5NhrspQNTouQ9atn
         nLBloedxnsi4DRikXvFihNrLuFqf9E2K1ALCxbobYvAc+q1Ytse0/Ql2gns/hrlXj6iD
         e20IN8WAE3tmUhdd/ZuXuGjf287FSPf5Ce2yqjuBuwPVHu+yhaXHhkn84kqTHSYPbw/d
         KCnzu8h08VLnvOsHFzXjwtC37YJhulEdn3d8kHtKe01ar/LNMGatBFhadwHbncarRHAn
         w2Rw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id v20-20020ac258f4000000b004f3b045aa3asi13975lfo.3.2023.05.19.13.40.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdZ2kVwzxrD;
	Fri, 19 May 2023 22:40:50 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 30/73] core: riscv: introduce asm/sbi.h
Date: Fri, 19 May 2023 22:39:50 +0200
Message-Id: <20230519204033.643200-31-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_3000_3999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_FUR_HEADER 0, REFERENCES 0, SENDER_NO_AUTH 0, SINGLE_URI_IN_BODY 0, SUSP_DH_NEG 0, URI_WITH_PATH_ONLY 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CP_URI_IN_BODY 0, __CTE 0, __FILESHARE_PHRASE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __HTTPS_URI 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SINGLE_URI_TEXT 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_HAS_HYPHEN_USC 0, __URI_IN_BODY 0,
 __URI_MAILTO 0, __URI_NOT_IMG 0, __URI_NO_WWW 0, __URI_NS , __URI_WITH_PATH 0'
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
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-31-ralf.ramsauer%40oth-regensburg.de.
