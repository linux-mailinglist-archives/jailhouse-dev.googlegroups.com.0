Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBLXG575QKGQEAEYTGRI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id E35DE2844DE
	for <lists+jailhouse-dev@lfdr.de>; Tue,  6 Oct 2020 06:31:42 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id d23sf2425266ljg.21
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Oct 2020 21:31:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601958702; cv=pass;
        d=google.com; s=arc-20160816;
        b=v+CgpWZ934BMXnEXx9ESxMxyDgLvu5D6OuX2Tc4IKP5e0TANLUB9YJU40SxR4qExvz
         dL9GfgegKO3h/xUWeJMnFKu5ffrdf+e0r9NE4E6WJAMvoBTwnObdrknMjcE4wjQ0LR9q
         cP1fQYbjzkhNEq85pFo+GDKs8YYZmlbV63S5I0n2yyEJIo/m6X/4jYDNh4NRbhgvu8rh
         aziwmBALWSNqppMs4JsY/BT/TCB66QW2jEAF80PWhV0nKtVJIuFgDPoL89pChl5A/y+C
         ax76hmm1WCUFlrA7fisXhpTxXFKbKNSYwEcCM2sfaNqF3WXtQ7c6qb+ENde1F0utZi10
         xEFA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=zfgVDQxRQvqlT1FUqjnqFHYOzS0jXChNKx8TiPe1Xxc=;
        b=azUCPQ6H7ziM1bCC9hY4K4jnmpRR/cralSRanBzXLA9TNRBjjUtazcHywsVvqo0gE5
         4wEapgmunbSXz7m8Iua4vAjLd4OrlxS9XETCFrjmZinPpolU7jq8Lp8JqWYR5+j+Q+3H
         sF8s3wGY0ZzTK0swOnQ9UUnXFRa3Nru10fONqhTaVl4qvp1DWOCkOH0M50FMN+qOiUoP
         /WGr8GAgC4V8Hb7ySRzJr1+wmqcKRknGveQJ0AulbSriAXJcniwNNov1ZnFNlX1CEGBB
         LbJIK3ccalr/7ON4GDvLuixvM3jt6+/kXCeOCvTLSEosJAqO5bPOVR6FoA63FwGv3K9O
         4pkw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zfgVDQxRQvqlT1FUqjnqFHYOzS0jXChNKx8TiPe1Xxc=;
        b=pwaAso2IsDwrBIXJ/pADGeqF4YFveM5S2qsYh4y+Ui88ciHh7oHt12pP0OamrH0x+w
         Viek+WGn/iIb7J0y6cJx1J/iWt14muC2r1w0gPsvJmCFnOtTETAWh9nNE6AVdmR+Rusw
         gQjB0zzzFACxuy6+3rpUqUBEOfDCZJUKcz7zlqbrBRr/V4IeJMG1Szfm2aQd7EN4nCK5
         0RTNRBLXXzwS7F7czv5x2W0zD4qd4e2/hsgRwlDg6aJWjkxU2oV13wAcTmVtBiOgHnAW
         i715bjljMeD/Xljn6SxaydZIxqBdmDuQSfJXWiVQfh3Z42dHFg59M3Fg5fOd/HNL7fcA
         0hgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zfgVDQxRQvqlT1FUqjnqFHYOzS0jXChNKx8TiPe1Xxc=;
        b=OjW7jBTGt0tHehlOO+MQJfaScAHhzrLfips20iAHC/uadSGzc0+fqh7sYBM2lQoghP
         J92VMTeMhsIVxB31IXd94rYZ/DG9PUgVja9AXWiF+hkHDeST6SS9MwYBNWeZ4JqalHRN
         jab85x64OEuXmpToJTJeg8CzNov8J/FrauXcYJBciJy+9h8BB7lfQPSCRap5Jda5kb2d
         7l3p3TIzPtU1tvABhvajisckwA/zj/y4Krdw1SiFm6TQYLUHVbeqdB5lRm3+dRv/TMOv
         OKBTrs+t4DEYmJioZqZZJh28EwlDf8D8Q9fzs8S/DP58smZ43uLIWAkEUnWM3reYfpay
         u+JQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532Q/8V7f7wWLG8uuswVz5kC7ZaBXe2p9d2oJ5iTm5IK+XREn7lt
	9QtYd+ogUhVRkafS6Bd/v3o=
X-Google-Smtp-Source: ABdhPJylxmMdqfft142Myf5L+3x5uZnVWg7JLo074qFNrbDgzANW8l/NitE/vIqIUPYFgwvX/JxeQQ==
X-Received: by 2002:a2e:b0fc:: with SMTP id h28mr1077201ljl.114.1601958702431;
        Mon, 05 Oct 2020 21:31:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c7c8:: with SMTP id x191ls1276163lff.0.gmail; Mon, 05
 Oct 2020 21:31:41 -0700 (PDT)
X-Received: by 2002:a19:a406:: with SMTP id q6mr885538lfc.556.1601958701031;
        Mon, 05 Oct 2020 21:31:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601958701; cv=none;
        d=google.com; s=arc-20160816;
        b=OVKKMRBr/LcjIDlQfiChIxOEBNIed3qwIR5H/2BQwcKyL9TNUkyigB5AaR4K9QbOVW
         fbFyaaZeNM87sEqPK3llGdOmQPoZipRViYEXcMvlO77Epmn9punuoxPVXzX1p0jsfGaq
         rkNkPdYbqPjPEq9EHru4csQJmtd+nW01UOZ+o23cMLXYt4VDgiZg+sXf6Ksyj0Wv5iLH
         XbU9/RnKLpBKhYgkEEMYC6rgwH747GL9LpFrXz2tA79S2ftW0QZxxQu4RgYLxKPUMoLY
         5nmGNjCTyzrkTel9VM7ywR2bifp6W0c5+HOkv/lb3jm+fwaAWZyAH9J/kf0y76pmRrIP
         cJUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=gCAP9M5eseTeaDAysFclq7GhfFqgc2iAtj7E1TAnhEQ=;
        b=FyK/FWh4H571f4n8294uE4VKa+1BaVSypzEf5OPWSS5geGFmBzk9Emhm+mgcXLiLso
         QuvaanS6fyZXJuxvBDGdUdDasCVzmTlyqFb4jGjKOPE56ByfQCWCwZuZRqzCcV9CVjqE
         eTYQugOoCKVr8OmYoSXNbhId0JdWnOQEhsLqzeAUoKzEVdD9JDoMwoDV8FnZFBNSeSgP
         MDEfxmyFt6JfRnI4OOLIFAhL370Uw+o4AiSRlUIEN0y+OVlcU4Ha5Nrn8OmcMXuC8tw5
         toxZHd7BkxYtoirP+ttUdarZbPwB/jkuviVZhlTvKj1q1x/mCzw/cNP6ZbTQvd06H7nV
         kcFg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id e1si80108ljg.6.2020.10.05.21.31.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2020 21:31:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 0964VewG028485
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 6 Oct 2020 06:31:40 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.160.159])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0964VY7m008537
	for <jailhouse-dev@googlegroups.com>; Tue, 6 Oct 2020 06:31:39 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v2 02/19] u-boot-ultra96: Set fsbl config explicitly
Date: Tue,  6 Oct 2020 06:31:17 +0200
Message-Id: <79528388c36fecb0157a0559171478be05c6513f.1601958694.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601958694.git.jan.kiszka@siemens.com>
References: <cover.1601958694.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Likely, this is the default, but better safe than sorry.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 recipes-bsp/u-boot/files/ultra96.bif.tmpl | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-bsp/u-boot/files/ultra96.bif.tmpl b/recipes-bsp/u-boot/files/ultra96.bif.tmpl
index 8c5355b..e972929 100644
--- a/recipes-bsp/u-boot/files/ultra96.bif.tmpl
+++ b/recipes-bsp/u-boot/files/ultra96.bif.tmpl
@@ -10,6 +10,7 @@
 #
 
 image : {
+	[fsbl_config] a53_x64
 	[pmufw_image] /usr/share/zynqmp-pmufw/executable.elf
 	[bootloader, destination_cpu=a5x-0] ../ultra96-v${ULTRA96_VERSION}-fsbl.elf
 	../ultra96-v${ULTRA96_VERSION}.bit
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/79528388c36fecb0157a0559171478be05c6513f.1601958694.git.jan.kiszka%40siemens.com.
