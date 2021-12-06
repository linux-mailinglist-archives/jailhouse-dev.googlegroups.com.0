Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBBOYW6GQMGQEYXD4EAY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C54469473
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Dec 2021 11:55:01 +0100 (CET)
Received: by mail-lj1-x23d.google.com with SMTP id a7-20020a05651c210700b00219132ab503sf3275963ljq.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Dec 2021 02:55:01 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1638788101; cv=pass;
        d=google.com; s=arc-20160816;
        b=Maj+oTAyZMj+PE3cWA7bk3NsoumD1HTF7o6H7NHXQzvbCiEhDETgJnvhu5eRBZ5JxG
         CBY0A9SjjMAupZPZgyhawK9CYkXKYyRKqoq68nAPxcj8WJVCQgvCyxrm+Pxl1d030YKK
         r4Dc7v2d3ct7eFCdBWNBBiMijXVhCBSxrfj5Na0llwNxkRkLoCDs5sKt3tuX6aWEEAT8
         GNFAOzd4FQq0lN5howDU/2f2Q12wZlK+CrKHnnj9VjeN2Sql+SpWwYdUT3pnf7nevYVC
         U8O1eApIOucojhPweiz0M9gEX+MW5/64WC4JCGDsuIuHnrGKfLyF00BZazuzsS7J9x/Q
         zRkQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=eReQXubtGHrpw/ixtAqiDU+ObMWrRR8cNmwgrZTxPn4=;
        b=Ab7EAkTLrbGkGGQaKzCi6DuBYPOh/CCR/R9mbPg0N4L6eEXbqrdY/UBTWLXBgpYpqD
         jw/jKU5WFmByQicrgLko5YJvK+8Q8YmH04PPZ7vns18wu9tr1FsUExhUozzTmBffcA8m
         IvdKSdqvUSVyjf6Ln93aOGUuG5BRLCfG2iBFZTrMI+9SZ10Bn8LItqAt6EkilZzwAGxO
         mRP7YMQOrGjvlKI+wpNkzYGqSH+QDIsUuSj3O4aBuifNLT35+CKSA9/hdjgDKbqB28PG
         2ETp3XuOtxZXlPaybto+BqxyrSqXHTfm9TX4EFX5eIeaChsGekunWNNt1SFuzCldG19z
         A5Mg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=svUHR08E;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=eReQXubtGHrpw/ixtAqiDU+ObMWrRR8cNmwgrZTxPn4=;
        b=HLiHfLVBknrlQ24F5qEfCqibqS9nxBzJwBQqfBdb6gznhbMHxf97QV4LLzsTmImmAB
         fvhwiUz5bPsRV9nFud3MjBDvg+1yblxbR1cxG+c9qKnLwMdop/yY42N5VCR9fTStqTcu
         oW0QknGIfkYhoM/XaLGbY+XkB0/NfyPx1qsKcHLHXhdFnzDnhtgTrBOeTd8o+NfEDa1E
         GOhNfc0clzPC4jf0Le16QR3BINudkhLFlmOdWdUFSY1ACRFJS+9y+9ukoMrb8UrIAgAY
         kKw5PafYFOeyicU3QrIEwxkepS4+2rVjODebHP/iQAAPgufeXbIqTdKDanSCDiBMVgzZ
         FxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=eReQXubtGHrpw/ixtAqiDU+ObMWrRR8cNmwgrZTxPn4=;
        b=KAO8BLtIRohqqGRWR7dvzWpPvRdyXPUGT/wj9konVb8/9ZgPLebBJcxx/s5wWULJDZ
         XQ4uhs/r1JhEtoA7jp+wHzEs/Rm7FhAOspcmwmgwRKk8P1uPgJtIS+aZ0obJaYaXWERU
         iHTnctbJ8eqQVc91uWQyoYv/sfgO2Q6NN4GHDbZd3wzbLUOL5FudkD0X8PfpqobDQDm2
         N02SzyzfHV4KnUQL+BhU5+uPMYLO+90ZCYHek9so3zGN3zOPd0yNL5aVq0ZICX6Rx8os
         1aNS2QIP+sYmAHFiv1qIMIZSQmQ/cW5Lcmn7J1P6UNH1E98uAzSK6r0kEP65M/3S3voI
         ldBQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53180OHtjo7Ny5/qFC2DL4gSj4SP4bVStVSUZZS08MxWorSRHiOX
	MQUXypqTv3CI3Dyjyf9mjxQ=
X-Google-Smtp-Source: ABdhPJx68X8W7e5wxYmiAs8J4Uqk8qNsY6DDgPTndnH2DfhUxyFgSy9fSt8u2x2b5POggG9mfV5WiA==
X-Received: by 2002:a2e:a726:: with SMTP id s38mr36364444lje.415.1638788101509;
        Mon, 06 Dec 2021 02:55:01 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:201a:: with SMTP id s26ls2496705ljo.5.gmail; Mon,
 06 Dec 2021 02:55:00 -0800 (PST)
X-Received: by 2002:a2e:750b:: with SMTP id q11mr7476360ljc.472.1638788100255;
        Mon, 06 Dec 2021 02:55:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638788100; cv=none;
        d=google.com; s=arc-20160816;
        b=pIVVgRb4fWxdOnYumGD7uRfwCY5HewH2Tuoacz05Gk+ZF1VenH48CHBmi1m9SsBeZ0
         JNjvdRMwSmT8uV18Xvu5G8rRB7n18Woa3NXE3tATAAdEe6dv1GkamgAYp6dt6KDAKog+
         3NreyV19oLRkdXCDfFZaeWY++5IwQQKibCiP8QukPDHx2wgxkvbQQg1QURyFP654Si/P
         qvLO5Sy3SnbI4ZeJqPcSIYo5G4UlaIV+sCPSBhwM1TXdIWj2pAOPXN02pg9ZQVctMduy
         UHROa7I1RfyDSk6AmH3MFMkEnVLvzrXh+QefUSX56l0uJGzBebIM6Va/gwOkPuBDiEsa
         QWFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=lH+IBClfUojnKpgIrBA1Z2gAgzcVupt296miFy5aBGY=;
        b=hwRqyFpdWFCLNo1TgPaEHQ0a10hebO+YOkw16wF0SKKhi8iPmWNR1VKrnbpumxCtgl
         NmKSV85BFVqVR43NN0mE/V62TVhaigmhyhjYMr2D8aRHXzXfHZBaI2uVZneh4dqi4oNU
         c+gTnZjoeBfU3M4HF8noPkbG/hU4GgnlN/0jcuuq4dBCckxZszzEhtUsr/xl0JJH7TmC
         sx7Mjtf5Gk5mzz0UD8t5yN4D0uaFgG/QY/HH/2ukV/6YmMMbpj4ngsGIIIwUUbqxp9rP
         60+ZsQDI1uHqAxyYupzy8bnJh21Gy35WmKtiEZHAJ4jqrKnIL59H+TxPcUWl6Afz4wuU
         hZyA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=svUHR08E;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id b29si692852ljf.6.2021.12.06.02.55.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Dec 2021 02:55:00 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4J70gl2NkNzy8J;
	Mon,  6 Dec 2021 11:54:59 +0100 (CET)
Received: from atlantis.home (194.95.106.138) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 6 Dec
 2021 11:54:59 +0100
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>, Jan Kiszka
	<jan.kiszka@siemens.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, <meep@binary-kitchen.de>
Subject: [PATCH] x86: amd_iommu: Skip non-AMD IOMMU types
Date: Mon, 6 Dec 2021 11:54:49 +0100
Message-ID: <20211206105449.129665-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=svUHR08E;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Running Jailhouse in QEMU with the upstream config is currently broken,
as qemu-vm.c provides a hardcoded description of the Intel IOMMU. As a
consequence, starting Jailhouse in QEMU on a AMD system fails.

Fix it by simply skipping non-AMD IOMMU types and drop a WARNING that
there's some oddity inside the config.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---

Side note: I know we don't do any config sanity checks in the
hypervisor, but in this case it's way easier than providing two
qemu-vm.c-variants for Intel and AMD.

 hypervisor/arch/x86/amd_iommu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hypervisor/arch/x86/amd_iommu.c b/hypervisor/arch/x86/amd_iommu.c
index 40ec4e20..4b563e9e 100644
--- a/hypervisor/arch/x86/amd_iommu.c
+++ b/hypervisor/arch/x86/amd_iommu.c
@@ -782,8 +782,11 @@ static int amd_iommu_init(void)
 
 	iommu = &system_config->platform_info.iommu_units[0];
 	for (n = 0; iommu->base && n < iommu_count_units(); iommu++, n++) {
-		if (iommu->type != JAILHOUSE_IOMMU_AMD)
-			return trace_error(-EINVAL);
+		if (iommu->type != JAILHOUSE_IOMMU_AMD) {
+			printk("WARNING: The config contains a"
+			       "non-AMD IOMMU type\n");
+			continue;
+		}
 
 		entry = &iommu_units[iommu_units_count];
 
-- 
2.34.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20211206105449.129665-1-ralf.ramsauer%40oth-regensburg.de.
