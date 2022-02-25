Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBZOP4OIAMGQEI6J7VTQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id DE35A4C4773
	for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Feb 2022 15:29:58 +0100 (CET)
Received: by mail-lj1-x240.google.com with SMTP id x8-20020a2ea7c8000000b00246215e0fc3sf2443647ljp.8
        for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Feb 2022 06:29:58 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1645799398; cv=pass;
        d=google.com; s=arc-20160816;
        b=GqonDHLu6XYszj8rMpLevqfyqwRUNw0+1pqrgi5N/uhrS7MbNFgdfg7QoaWZfDkjLQ
         DdVpCVmI1URUZL3B2Nr4viPu2ERCBw2NT5I3+kPCO2VMR70mw27/PTj5LPA4DgiWqZRn
         NeSFLt5oBcPxMe+xA03RdR9BV0dKGnhhxh9rrFgmIaNf2vz3BhFklDbKtK9jYlME56BJ
         APYNpBlxgF3/Prrwk5xKwqI1pbacQJ/fwhYlcei6Z5Lqo9wAXc6I/xdW2N9J0y6OV8lS
         LxPzLmVCB0rY9V98VkPOrZ7d8BXiLXp5SXAmNaJ0S+HA8RdIM9Iftf40VCNKWcx5iAXz
         hAJQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=40DonEJpsv8CjARnpBT3ANdUg6DMRbrBNVzVV9SSoms=;
        b=ZT5PSjXa/DgpJn1rEuCYKs7J2Jk6e24tgPjDbwnlvqtjUwMYQI/KSUeGuDFqOVQlPJ
         fkCWdoBkOYDu+yTtH0pFPbDcSguC6FeWEK9B2iEImNPTwpxpCyPBMs3PvVjtfyx3mROq
         sk5ubO0nPnLQivbI2MF3PBmJjCKYpZAR03jwjKcXqyIsvepfi7ZcKZDMqFuJbjkvruUZ
         qz08wLETjOl+f6Q++HYGTNmrnWTTksEKwCrcRDYmlJjyscrVcA8HhdjBKNGFNFVdXzDz
         U1XSBaLd8tMdfE7zkfsxDyrTy6f7jyBAqQOBj5X21Lo+oOmg+DCfh9GAsUrACSdBJ7s8
         eipw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=t2WzSIY3;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=40DonEJpsv8CjARnpBT3ANdUg6DMRbrBNVzVV9SSoms=;
        b=BkD2kMyiWEK7bzuZOqy2esGIAglpXGnpcbDg7b7McxKkJNt4DhjU7p8rMZAVo9hGwx
         AEFbvCoSoGFODDDY6DYT+/XOh/Ze8aK0BNtbNHTTZJCcuzQj8tB07ZS28jTqM73APro9
         WFwtk3ECzckpCyfZ1IA2SjJhpFMDafOHmzLmtJXKuKKjxh0GKxS400/CnkiSLAk1XrHD
         bwmjTm99cm5Ege47yi+K4YgOZJGBzkHHun1DsCZNzfRVh0pthwq7VCTmD5wb+u78JMvf
         8YTZil+tXknom2/aCs2LYj3xDrscyUPyJPcM/GNvEaG4mQ7F62vsfyz3Wsj7PVIpBARm
         u35g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=40DonEJpsv8CjARnpBT3ANdUg6DMRbrBNVzVV9SSoms=;
        b=ubzmPECadRh21wA9llVtBdj4Odf2ma6dFPOCmUj/RYmgL+gE6hBmfac1FXLI3VfkpA
         HeWDHI0RUE2OG1+HwS+lEhJLqzcwm7mrcUDyRWFAwjbZ1x2fmKDZRqX32SIlQ6rYoR0s
         BnbK/CSiYgCSnSXG1MGepbligjktB1FznY0BUxhxcGebSjBSnTG7+umdHtZZ1dgiHxQG
         QycXv+RPaSaYhZ9oyExbPU7vRvo7Vbg9h8Qwi45UcqjHZwPqwwZ0nOKRJOnyu5OKn4zX
         7NAF5lYlHDsx2wVX1Whv/15xX0AmIDTfaKw7IJ5l5AeZdWsnXV6QEp4Bk4YcVDSNjKZM
         cE7A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530WxFhbRoLDnpTRW3xinBK5IK3zgvdaVg+yeJ0qVIJYY7f9n+Yg
	rWEjXjBrFtHbo+goL8t7yPw=
X-Google-Smtp-Source: ABdhPJwR7Lg7ECg6RsA2SBqZpCcPOYJfsrVaDH2tnrAkkm4n0QjR962qng/Y277vlwV+Kv3qM6mk8A==
X-Received: by 2002:a05:6512:33ba:b0:445:7cdd:3a4d with SMTP id i26-20020a05651233ba00b004457cdd3a4dmr2352527lfg.315.1645799398487;
        Fri, 25 Feb 2022 06:29:58 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:2153:b0:443:9651:a9f4 with SMTP id
 s19-20020a056512215300b004439651a9f4ls2587557lfr.3.gmail; Fri, 25 Feb 2022
 06:29:56 -0800 (PST)
X-Received: by 2002:a19:a414:0:b0:443:13e0:45dd with SMTP id q20-20020a19a414000000b0044313e045ddmr4937319lfc.560.1645799396578;
        Fri, 25 Feb 2022 06:29:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645799396; cv=none;
        d=google.com; s=arc-20160816;
        b=TmMMHF5ZzdoIieIJfB/S4I+eSq33xwQuXZNuq55LfI9KaTrNfYONUf8BgHBOPAtVMJ
         P2TLtBuu4o6W5WzkGVflI9M3DFGdARmX0PyVAEppTz/3jJfvX38P1SxXJa5CvimUeNH5
         KnmnhH3Rqr4VmC1bQhvWnYfOr7Dm6egR6ejC/TtnLysGylLyPmcXGTQifvDjDPWrfMwo
         IwGOmHNLvYT5OzeB6LBjZ5aJbszIfXCVcOyiEmyGlxGgpKThIvAwCOHGDhpTPd/ZaKPm
         o2V5+d/dPvkBat6+1Y8RtfrrLSbJC/Bv3WzHkflPILYyeSGf7wmSDDMdAnCsbqVLqyX8
         igfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=rWnmbgPN6rhvptuSzjg6mxHa3a/O3MUI5qwTot/TGq8=;
        b=0uaWb9NaijqRwqbkzuJTlytNX4lHMGImKakKMntoViXJYWuYNKSjxXNtRKWoDH0RMs
         2Ltk1pJ4Vg+Hrfphza8GbX7u/SCDkIfL1DXKUsPgXfWCFDZX3ZBCZwImF721pMWDaBhQ
         uuGJi8h8X9qidv12/5vKWjGpSZEy9qtBa6WdxMj8U/3o9TLZKzvdYsZ5dpPLCPDDSFHl
         VQiUT5/rOWH5M7l4/ueiifoJcHnufqS1cooYVzCVppj97dJyGUPUIeLl3kc/A5QzLc9B
         RWST6wTgJ5g8eIe47DwroH6PdDUKrx5ApVqpY9wRYRqwEX+NeeZPiEMGEZf0XBrktGUO
         I4Kw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=t2WzSIY3;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id d22-20020a056512369600b0044394c79718si121666lfs.11.2022.02.25.06.29.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Feb 2022 06:29:56 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4K4scM3GPjzy2y;
	Fri, 25 Feb 2022 15:29:55 +0100 (CET)
Received: from localhost.localdomain (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Fri, 25 Feb 2022 15:29:55 +0100
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Stefan Huber
	<stefan.huber@oth-regensburg.de>
Subject: [PATCH] README: arm64: disable ITS in qemu cmdline
Date: Fri, 25 Feb 2022 15:29:29 +0100
Message-ID: <20220225142929.385616-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=t2WzSIY3;
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

GICv3s in recent QEMU versions have ITS (Interrupt Translation Service)
enabled by default, which Linux will make use of. We will crash when
trying to re-assigning a CPU back to the root cell, as the root
cell's Linux will try to access ITS regions when powering up a CPU.

As we don't support ITS in Jailhouse, disable ITS for the moment.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Reported-by: Stefan Huber <stefan.huber@oth-regensburg.de>
---
 README.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README.md b/README.md
index f1b0cbe3..b5937300 100644
--- a/README.md
+++ b/README.md
@@ -365,7 +365,7 @@ Similarly like x86, Jailhouse can be tried out in a completely emulated ARM64
 Start the QEMU machine like this:
 
     qemu-system-aarch64 -cpu cortex-a57 -smp 16 -m 1G \
-        -machine virt,gic-version=3,virtualization=on -nographic \
+        -machine virt,gic-version=3,virtualization=on,its=off -nographic \
         -netdev user,id=net -device virtio-net-device,netdev=net \
         -drive file=LinuxInstallation.img,format=raw|qcow2|...,id=disk,if=none \
         -device virtio-blk-device,drive=disk \
-- 
2.35.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220225142929.385616-1-ralf.ramsauer%40oth-regensburg.de.
