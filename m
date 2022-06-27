Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBMHB42KQMGQEW7KDKDI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id C727255B9F5
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:29:21 +0200 (CEST)
Received: by mail-lf1-x139.google.com with SMTP id q22-20020a0565123a9600b0047f6b8e1babsf4740899lfu.21
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:29:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656336561; cv=pass;
        d=google.com; s=arc-20160816;
        b=VWtEA6i8ncghJDMEyQUfw6amU8ZZ6BH0J7iwnF6YAzAOC7wxeRrgIVjdVCpnI3G7gx
         TWOMCRetpvWUnviM2ZfhTtIj/Qre5+eBaTcPJ96RA9cQfAnykFL7YkFMZuyCo7Gm6f/G
         ZQj58b2LOdkXNjjMp8uTQ1aiVph7rcxaUH+l8rhsP2NRJFPebG/axZR1gmzobnehQX7J
         aYzDrYpZf04i2o9WfDk3MvkSsUZoGeXVztcC+oy6KZJnxW4eC0x+onltCty5RMefM268
         V58R3J4dOwq9mFiVOBVsF7jSEdNfrV7LSZ0LTz4sv/bxEFlQIM2bBGfZU/pcER7H1T09
         AvDA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=jopk+b4v++WgSIjHPRdKLBY9ANThlfZSsQIo1KIh9T8=;
        b=Gwl0MadzbFdx2MceMVBE92QhaqQPI+HBGsycp1CnoLq8ua7g3HLcVjquEuDvgH2gKq
         VEUbIGitV02LicK7AFeS+OHDxhL2I4meBm9mfHHFAVqFXTqXqprQ5sa3ZTmVhEuxKXcY
         P4pWOEkEyfsmLoiEzPOYBSkZI3S5afr1ChgIVHj7Lhp3OqQwCKIiTXxjRug+WUQTNqaD
         UFia53ifNndqqpaGlc+XAVVZs+yLnIARWuYvBpuxVFQvE+BXAyYur0qO+7deuF1PE+2U
         hQyOfUuow5y30avziAIrSnWenW/OMony5FA0fTeDbL/ndvGoeCzPsjO0g3JAqajcl8fx
         F1Fg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=WbXUeqQR;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jopk+b4v++WgSIjHPRdKLBY9ANThlfZSsQIo1KIh9T8=;
        b=FLmyAV44yZEcHOB45jHjMDwfg+hBy0fM7jK6N4y2WYZk1htCRy592RIaCM84MaSQ3+
         h1oCfVL+fy5uuw819Mi919RVsbJSScaG8MZFdjpAO55MK7lf6UqmMMcmp6CxIEGscmBL
         lLJp8dQE4oAqW7n2p4yajg2DgNZ/Zd7tp2xov+9eDPlyoBTjdHv6Nfd6kdOrLkum7BI5
         oKbApRHYV6PSZH50eKwbQDbATTf68xGyBzhmY8uFWhclAxbNoADs2Q3ab2e1EQ836qGO
         yZTgGtXgFKEU18L8o0Ew+z9hCwmI8KdPgY1gTkh5uV5+dt18+09BZtu16AKldLmlxbWP
         WyDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jopk+b4v++WgSIjHPRdKLBY9ANThlfZSsQIo1KIh9T8=;
        b=cPYAQiUGc571pyrrJYg1GT4E3iw+HJbe2pp8YmuWY8U32ei3aoYHYCRKEx7vQ8deFl
         qql8b5+7vMXNs8l8zwsqPko2rnIyBtv2xWBZdSdcaCy0cDHod4inQDTMl7VovTIp2Rjz
         VGjZoI1eRJ4x2qSDhiU5No3Owpq+kEGK3lhl+HRUpkomvTwlljiF5G8ufM0HIfCGNkf8
         /eYkSh5Gzcqb/T6rIYey6KjAFEnoaVWeyqV9U2vyA3/05qk24TatB8D0NFFsCYAiHsTJ
         ApHhYxOlZgwZUqV+1AnXflG1FpwVlhOFYCAemZOL20rPGJW6f1bVRFOlPwGMhxoAIX0C
         jMIg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora9Kc2WXt5U8ltOvw+K8S2zh6UHl95yCUh1XmXr7NI0NM3Ahj786
	YRWCT47DYTmf4cVwj33Xq4o=
X-Google-Smtp-Source: AGRyM1stt9G3/c94cdYzI1biaohbg8uLZFrE3mZUDJ7hrXDb3o/IK2XDEFw0b937WKK7Frpx5fZ4cg==
X-Received: by 2002:ac2:4291:0:b0:47f:93f8:5194 with SMTP id m17-20020ac24291000000b0047f93f85194mr8742302lfh.479.1656336561337;
        Mon, 27 Jun 2022 06:29:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3f16:b0:449:f5bf:6f6a with SMTP id
 y22-20020a0565123f1600b00449f5bf6f6als214176lfa.2.gmail; Mon, 27 Jun 2022
 06:29:19 -0700 (PDT)
X-Received: by 2002:a05:6512:2241:b0:479:6426:15af with SMTP id i1-20020a056512224100b00479642615afmr8386194lfu.631.1656336559521;
        Mon, 27 Jun 2022 06:29:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656336559; cv=none;
        d=google.com; s=arc-20160816;
        b=Q+IYKDfN4pjwAm31te618AlbK+DZxfdG+elqjYAKTA/jVYoRR5unMMzJp3OGZgIExY
         WpfoifFhAyTzJDmpYr+8dHlzmlMEK/InC+7un2XNZypIJ4476JzG1irSoMlr92CrFmsT
         jCQocP9YAOBgnkc8m61QVJmfDwiFYRBkcTiD86JenSKEC2FXVdyMaYc1+xg7dhDAcqV2
         YohdBva8DZfsLdjTIdgAt8fE01SOBmHn0txIzXxYS1o6XQTXNdWSjWbVhM35vli5aW0n
         1+B5sW/7vIXydKcehFjUWN484HMyVlS4hWQzQv6sNAPDLmH5ZAhZyo9OjfeTxaldkfOB
         T6SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=yYxWbgmTxVdmUx+8gDvYX+UYsyhO3MUOLrwQb6seG94=;
        b=DfmSuhAylysmHiHDANRf4dMLeQZw/LQCFnoWzBPvwGP/mJvX+uOh/MBzgQdcjGbqmC
         qLZ/c+HsjlIdiFxIFESe7MgMebAOrmdCyaZKoFXEj1qmwxUjwF83ley8qmpber3cJl5b
         yzH7Q78g13QZPuoUP504GmprlV/W6Ruw+IZgSbARKeuZpzq/a+ieqlO8VZ6eRtSaJOOi
         Ax+PNV+M4T2tIII2tg5V526qTdLX7euRn8w8ppfWwYZ/y3BYb3XWQGAAE8pDHWSGYiQN
         wlCVW6+4cSGZF8Hf5z1J1oKaePlJ76wcLOvtphIVY5gvWkbtLaEAeVQKn180jvTPY5lj
         d1Mw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=WbXUeqQR;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id z14-20020a05651c11ce00b0025a7388680bsi278078ljo.6.2022.06.27.06.29.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:29:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4LWpV66J7kzxwx;
	Mon, 27 Jun 2022 15:29:18 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:29:18 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 13/42] core: riscv: add dbg-write helper
Date: Mon, 27 Jun 2022 15:28:36 +0200
Message-ID: <20220627132905.4338-14-ralf.ramsauer@oth-regensburg.de>
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
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=WbXUeqQR;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

For the moment, only support the fast&easy output path that is always
available: SBI. No UARTs needed for the hypervisor, SBI suffices atm.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/dbg-write.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/hypervisor/arch/riscv/dbg-write.c b/hypervisor/arch/riscv/dbg-write.c
index 6bd75887..187d4517 100644
--- a/hypervisor/arch/riscv/dbg-write.c
+++ b/hypervisor/arch/riscv/dbg-write.c
@@ -4,14 +4,24 @@
  * Copyright (c) Siemens AG, 2020
  *
  * Authors:
- *  Jan Kiszka <jan.kiszka@siemens.com>
+ *  Konrad Schwarz <konrad.schwarz@siemens.com>
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
  */
 
 #include <jailhouse/printk.h>
+#include <asm/sbi.h>
 
-void arch_dbg_write_init(void)
+static void riscv_dbg_write_sbi(const char *msg)
 {
+	char ch;
+
+	while ((ch = *msg++))
+		sbi_console_putchar_legacy0_1(ch);
+}
+
+void arch_dbg_write_init (void)
+{
+        arch_dbg_write = riscv_dbg_write_sbi;
 }
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627132905.4338-14-ralf.ramsauer%40oth-regensburg.de.
