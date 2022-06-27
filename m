Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBMHB42KQMGQEW7KDKDI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 2403055B9EF
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:29:21 +0200 (CEST)
Received: by mail-lj1-x23e.google.com with SMTP id k6-20020a2e9206000000b0025a8ce1a22esf1007079ljg.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:29:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656336560; cv=pass;
        d=google.com; s=arc-20160816;
        b=FbFXly1T8MiVL6I8ZciOLSXFbGpaCO5AlCXFXt9+IN/gAd88xiyOJp/rLKQaRCbEqe
         ZNqI+4TWXYZ6Er5oOmDt3o60K6yxvyaqm+KZJLP3JGOeIScz+KSDzw0JOlyqlc3UVYzz
         vx6wWBW6J2IHl0Xst9ddxXg7PEboKPJXeULPdkUUjvirKehoTheJY8Npl82rYSdnXu54
         e2BakVWMlus5pbf8Zlz/YW7QU5rwXal2oLQdZV2iEzBXHeECE/zwWYKgVjPhK4yth164
         164jR6xRt0OVhibwHOURVN+/sxkdYhrhep/mP58NKHK983drdcVqg404aBAroDKeTgaj
         Da4w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=ta/a7A8WPgKbXofu3aD8yQEk8vGXcyMZWk3KegEBle8=;
        b=yBLtFdHSngKu8DoOMHM4j2A1Nyf93kwPlAPjK5GYqQB1CDH1soMzaw2vBnqU4/T0xY
         hk2tmOGTDjHTdjCwYeIniIaNeMSSkvRxtIY7Us8ulnkH4PZzohN5sPsrSOGvUyKrUXqO
         h4pcckpJbBI4p895fj0jnlnVV3Mlhqh9ZmXnYKthKe7NrXPChJDxMTas5oYzB+tYmHFs
         h3aJwSKsvC/RnxV3o5xiz7AP7ERsKZ5/5Jdgte7sspNk+f3GNFBMfrYuXDSl8fT72FMm
         eAxywQr7VIuzkDFEVPbnbd87a8sNQv5GCEZgxiLFzoGR4wg0Ny9Ha0APQ8yNLUg39/rl
         deoA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=EfGzIKzZ;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ta/a7A8WPgKbXofu3aD8yQEk8vGXcyMZWk3KegEBle8=;
        b=tycxhKWFLL7eolU5PD75dlgvoq+G8zWsmGEBkpkVX+vHiIUqXaFqx58xWiYHSh9fVx
         hDAoRY3iRVBgo0yn9nLG0M5u08qlMTMaPYXCJA/8s3D47eqbVfh2DsuqCfcyq6235GJf
         didVYiSmho72xSYzuwLlowteZW1lUO/ahmZYkGzMWfHSjBqJMySStXNpDiWOAOMpVwV5
         8dBIuzjTS+dLEvswNkVj3Z/ZJmYTNJPCJp0j+WS4Jdhyc6YTLvkay3nnwLUn+5pafElL
         iyA65S7ymVMs+Xku/XbSi2k+M9x/D88evNU90adhzTHD7RtG+/d2pMtRqYhzkQl5o5b6
         vINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ta/a7A8WPgKbXofu3aD8yQEk8vGXcyMZWk3KegEBle8=;
        b=7mXt1uB1AguCIpW4TolmoDV/mXUArAtKT50ERjt+DKuIY2M1+YcU/1AEB8DMhHNNG5
         IFWcjVfgJNOAVdvhlV36Rkuj5d/Mhiv13P21+/4CVEAvuIg14wNA5EBg88h0ih6rANCw
         G5XJzUtsr91Iljd3jFcxb7IaJnSCYnP/yrPeYb7f2OQn9lDEUS/l3mjlHoIgo7f6BUk7
         c4UFLic//TfJzGFnWFRqZ+qLr05Fec3QUO+zto4mh/A4pkt6iAQ+InqFoY5ZJrcgQrhr
         YEWXgtoilmMx/xAGvH/i/5coSwJkxUk7Dfcd+pI0VQ1nogHsvE5/nAsexT0rEwiSrQyB
         p6Pg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora80eoFmfJQPJWgeTzyJQZ+1Wm009DmhppscApeoPFJmOSVLYFhH
	S0sOAS8FIcgCqE5dQNDlge4=
X-Google-Smtp-Source: AGRyM1ucTEp2F6GFUHpHK0/WxJ7PH+5OERO5z6nr41JjlKsLPDypg7ZmG9Y9czQiT+zpK5Xt+sx/aQ==
X-Received: by 2002:a2e:9f42:0:b0:25a:9dc3:fd86 with SMTP id v2-20020a2e9f42000000b0025a9dc3fd86mr7259171ljk.272.1656336560497;
        Mon, 27 Jun 2022 06:29:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3b0c:b0:47f:9907:2b50 with SMTP id
 f12-20020a0565123b0c00b0047f99072b50ls214282lfv.3.gmail; Mon, 27 Jun 2022
 06:29:18 -0700 (PDT)
X-Received: by 2002:a05:6512:3d02:b0:47f:afa3:296f with SMTP id d2-20020a0565123d0200b0047fafa3296fmr8535774lfv.532.1656336558812;
        Mon, 27 Jun 2022 06:29:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656336558; cv=none;
        d=google.com; s=arc-20160816;
        b=KDZWihRX4Yl9m2COXAg5GCGVG0WaUDjeSaum5NH0qSJS0y/pKeqwkC9PPur3ye2BGe
         3Lr1B2FNpkJVrf8m7ZNknzq0iG1OywvUw28ktOb7OLAYYmXqvUyNjYJbJMlB2TAwM1wa
         oOoRlDMK8+ylB3WguKZ4G6XDW1hGoVMOM49VvC8wUWvk2MzPmN6BZPC2X/FmBGwkZsIO
         8neoVlKx4bk6zo2QZyBbfoWban9j868eMru1QKHOvqRiffXhfoK0DZFRbrEqaYTOlE6E
         WT+BRQJi5aaoh15qjA+KwFG6rjVKJN0zkWjxrp2E3cYgfZ65/roULYiG0YqnK7ao2Vuz
         ssgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=pi6d2Nj6XTFEdOKLwTOURxI5TPNQ4kkxquRcxmhLQAA=;
        b=KB41bcA1XAGL9Cu5txgnfBRUm3WbCX2oKry1jbtcBWnqCoBZj+Ttboto0nw5IV3y2j
         yN3W3giejNMzr3GD1osj/IIjBcz7XfLQ0Yz+Q2i1uSjruZn8bUFwDTjBzUg7+QCXfvgp
         oX5/SktDegG1otA7cDxKxM5CTBjOrB6dbXt2Ps9d13Fg5pxEJIU+tm0dW523TkMwJ0Vc
         elVL2PIaw0uq15wIAY71hNzlb6rqZ1/1llsaE7iLoLOxIajNcrbDHflZ5J5DGKs1M4S8
         NLlyrih+sMAr5lXoPMmgD5sCmFrYv9l1j7czf14sHHDtxl8f3jbUj7j4EYDniJ2BivJe
         u+1Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=EfGzIKzZ;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id k10-20020ac24f0a000000b0047ad98bddbasi537970lfr.0.2022.06.27.06.29.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:29:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4LWpV61kVTzxxR;
	Mon, 27 Jun 2022 15:29:18 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:29:17 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 09/42] core: riscv: introduce asm/sbi.h
Date: Mon, 27 Jun 2022 15:28:32 +0200
Message-ID: <20220627132905.4338-10-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
References: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=EfGzIKzZ;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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
 hypervisor/arch/riscv/include/asm/sbi.h | 84 +++++++++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 hypervisor/arch/riscv/include/asm/sbi.h

diff --git a/hypervisor/arch/riscv/include/asm/sbi.h b/hypervisor/arch/riscv/include/asm/sbi.h
new file mode 100644
index 00000000..ee63bbf2
--- /dev/null
+++ b/hypervisor/arch/riscv/include/asm/sbi.h
@@ -0,0 +1,84 @@
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
+#define SBI_EXT_RFENCE		 	0x52464E43
+#define SBI_REMOTE_FENCE_I       	0
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
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627132905.4338-10-ralf.ramsauer%40oth-regensburg.de.
