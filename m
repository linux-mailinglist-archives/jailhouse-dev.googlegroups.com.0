Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBW6TZTYQKGQELHYIWUA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2C614E2EC
	for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Jan 2020 20:09:15 +0100 (CET)
Received: by mail-wm1-x339.google.com with SMTP id y125sf2816918wmg.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Jan 2020 11:09:15 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580411355; cv=pass;
        d=google.com; s=arc-20160816;
        b=LT5/B0kXaLd8VQsqjdnwDGg4O2bh3fy8wIyTHAFSX9+/VtieIynkeU+WZEye9V7Rax
         Lvj4Z5P1zzzEMll+7kzrED8LENbM+3FZ6goM6IFd/BpY3bz/usfiZdKlsCdv2kCB8P3K
         QeY/NRk92Y8M2GdEAhnCcWC7MqGBLMtnJkTNaKoGdaAcF+w/q2Szae9fO8brpZijXSVc
         sDelWYy+L+GBmbLzsHBdbR8kjS+6xLB66SZpQ2jsno4+qD7oyB2Yy66dt4pvIWAfnPt+
         YduERG6emA1UTq2bXFYShtXi2NZYx+bwjUxZuo8xF8gMz5l9Ju1IIDC28FciIX1Zk1Y8
         jwfw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=gLCWnfvMW+g0yjkDh1anbTyzkGdaSzZlMdJteKsHRhE=;
        b=n/kxICXWCqwKSKuEFrWm1OkGfRdG/sI/n9XQG6E3JvewUVH6jyEDTRDbXMSzElQzZw
         sxHg5sQ0gn6dS/lX4G+KmyeHeBd8KEZ+FjWOaqeJP4hlQ6QBPqt8DelCX+rf4md5GbO7
         YrWyZ3WFDiPM7Hn0zeLsSESKamAHhZHxlUH6mogIPj07NfedkgXOc4MklSI1mmQ1b+nc
         GS5tpJ1kC7GJkv/8LIlI7OGd5trmfR7mPuI6mQRhJcIHoO/RwNi1iJ0+6gpFT7xIHz+p
         vgRDxvnCfh0Q4ocd8D+Srg8+nkpoQPC3tA4ngXdi4sjVvir4cXK7t206w32tAh8N+pKU
         CaMQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=gLCWnfvMW+g0yjkDh1anbTyzkGdaSzZlMdJteKsHRhE=;
        b=KTOJ4Uo7IDS/7MPkpl9gdVEZfZ3hl106C6moGCRx9UqetHBgbqJYdSA1rM1zheCmDN
         3mh7aNDACHlkWDDwJDf+jQ+J18MmBA99hqEDmVkLMYnkfj4jz+jfMFAKFNlieA7tAGO3
         kLw3HUxDc6e+2CdZtJxEXTmslpjUiMPb4f9O2sl/3KBsCNfvYrHRZEGTVlD6/X4nGoSt
         yGq/sqwpOQ9MjMRtnyQdJ39AhtVMTuka+ZVsaLMSKJ0dQAPkZaKLd2FYJ7IOa+vlDN8v
         UeIhF3X1rn+LOI7V1yCXXsmRW1VwlmaVhw9lJUGe32RShrHM6ubaUrm1vKb7+UXAOto8
         rGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=gLCWnfvMW+g0yjkDh1anbTyzkGdaSzZlMdJteKsHRhE=;
        b=tRebY9VdUuy+yH3GJw7YdV0hXnMlL9T9LyGpSUluBM+PzIojhalhHO8a6883z99V9j
         pTM9ejjkaVOY9p9a5tTFUmQGBZfPlbVhgnsqUePs44iS+M2LO57HoG8xUnx2yvWpwRRk
         Mo5jlxh8CmMhaA+eOkoFoVgQBXM08WD0qy+VvRCiEDsMcKRlYHzmqQGgWO3XStz8WKVa
         i/YGn8pJ3SPxB502U6faNVE6Kj/saT3phOjOdnV+HNr/8NhJ4md78Evd+41kpDlyEFnk
         2oa8NK2gxKHr1OLR9HtSDbjkj5sfzoGnmQU/FR7owDbnQ8fB0wIKobPW8aMzncWyEVuZ
         VGKw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWSMM25ojU50Q3IxKGxZLOyqg8TqLeTYJKeDkdu0IQlMMpdACWp
	KB27ovzlNDG7Ps8O8UBUrJQ=
X-Google-Smtp-Source: APXvYqzFxuycWJQeM1kWsFw8ypSMZYfHXI0MdRAvYEjV+VJptr8KsLKwpHKM7i6rM22l5kg1Yyw40A==
X-Received: by 2002:a05:6000:11d0:: with SMTP id i16mr7418759wrx.188.1580411355381;
        Thu, 30 Jan 2020 11:09:15 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c0d9:: with SMTP id s25ls3062635wmh.0.gmail; Thu, 30 Jan
 2020 11:09:14 -0800 (PST)
X-Received: by 2002:a05:600c:2109:: with SMTP id u9mr7360854wml.183.1580411354635;
        Thu, 30 Jan 2020 11:09:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580411354; cv=none;
        d=google.com; s=arc-20160816;
        b=0B6jsT1z5nxOo1YvqgGLSknNBt8hpAtDi06RoOtZP0+SmLhyHU1S/ACfRZ6Spo3gsY
         3CQ0tukmKc0lh1+ByuCTzKfoi3eGl7xJMM9d4VaBrsGhGbvrjFk3IlSJVIg2NmTq+iq0
         AQIl6azxna6+UOQeFy4wxZoHqzv4md1v4PKo9gRx2Sq1UZSqa29LfiJGd7ntwKI0Nc8W
         MkN83KCU/kBkBrsslXxIdym/9iG2lnsR1+7ON9wEnET4EQP4LQeFPGywT3veqZETo5Mv
         RdYyrD05Dk/l0yvOSxM+c8f0TAfL2Z5tPm429TFPS35Hj4XIT2hemledDfJxv8LW5ptD
         ghwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from;
        bh=Uwcye3g6Wuuu7EesfbzuDXpIJG+N8CsVoVX7uF8WUnw=;
        b=hRzj89tye8fIda6r0Us8/fQ0mX7zNxYBy5X6Jt5BWF+DHUp8Kfqvpn13Mqd4x5/Urb
         NXiRymrpUjV9J2YTEC5aquR3RVjVGFOvkr0sjvxljCshnHYW977QB4JkVeMOQd+ftTip
         HL+McatvmT9oYsUECBlargePIiRWD313vPU62MHpKNAMNJRke4v/OI6xT1AQy2u1vF2i
         ODxTPf4XeWN72kzRNAonb19NEg/ZdNw/oA2fZlj7E/Y31oJawQpQ48GEWu0Y7GjLLjez
         dC6snjFQvbfpcYv0mFwv3+FnR05FCI1cYjIxh1DTEIu2LDzOZULPLtaajvQuIzc9QXhZ
         KTcg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id y185si293653wmg.0.2020.01.30.11.09.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Jan 2020 11:09:14 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 00UJ9EBc008656
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 30 Jan 2020 20:09:14 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 00UJ9E0l011008
	for <jailhouse-dev@googlegroups.com>; Thu, 30 Jan 2020 20:09:14 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] configs: arm64: Fix comments in qemu-arm64
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <bdf12e37-38e7-51ff-c767-0d79d6e86da7@siemens.com>
Date: Thu, 30 Jan 2020 20:09:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

From: Jan Kiszka <jan.kiszka@siemens.com>

The device tree remark was copy&pasted, we use mem= for QEMU.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/arm64/qemu-arm64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/arm64/qemu-arm64.c b/configs/arm64/qemu-arm64.c
index 14d54d3f..b2c2278c 100644
--- a/configs/arm64/qemu-arm64.c
+++ b/configs/arm64/qemu-arm64.c
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Configuration for QEMU arm64 virtual target
+ * Configuration for QEMU arm64 virtual target, 1G RAM, 16 cores
  *
  * Copyright (c) Siemens AG, 2017
  *
@@ -11,7 +11,7 @@
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
  *
- * Reservation via device tree: 0x800000000..0x83fffffff
+ * NOTE: Add "mem=768M" to the kernel command line.
  */
 
 #include <jailhouse/types.h>
-- 
2.16.4


-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bdf12e37-38e7-51ff-c767-0d79d6e86da7%40siemens.com.
