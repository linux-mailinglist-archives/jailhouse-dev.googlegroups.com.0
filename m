Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBHVW6PUAKGQE4VLLSJQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F3C5E96C
	for <lists+jailhouse-dev@lfdr.de>; Wed,  3 Jul 2019 18:43:11 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id e14sf745817ljj.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Jul 2019 09:43:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562172191; cv=pass;
        d=google.com; s=arc-20160816;
        b=CWmquRHPpMNf22479lSdtIeNpNy3jMlEE2Dh3N4XF3/nYAOtmDclo6xNCN29epXZhp
         kvasEcjh7EGGJtMjIyeq/roo8R8XpA4UGmDDpTr3Tpld+ckhc8dAaMbKtf+Qj5Sz3kOD
         6jK1jOkp8zB3Kn5OCcraRl7VVNaDmgSvqmB1Nk+tL4zxL1XzbphE4R61K6pOVCBdfSqI
         zLNBKryp7uhWImGtBmwHbE/czooOVKxkqtbEI2MQnsbDd4qoBbQM5OM4aTroKioptoEi
         7ffyuCSa8RIkz/f1xg3AkAmAkkm1NcmFXisTJnbc75rOg+mYMO+kWC7bVyAjGeEud79H
         DA7g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:cc:to:from
         :subject:sender:dkim-signature;
        bh=jCPVWIDRspVGp5xSYNfy9kahMmClrzSjhhixykgMWS4=;
        b=liYxicR/Vswnx4TokdRa/5/Z4eYosvkRTowv4H+Kh1q2CLrVxNLMAIv9c9ybErJVqq
         1IEE9Dx6u5U5F0NjMm9mTsvqQE46B8EQF3WxQPHLcRuBBIxHsvMQkc6mtblcwVokwm1R
         X5Fko4D7MWrlaRz2bImTaqXdb6KwOl3lFnWJhSbmOGMjfRCSCtHeSx0WMNbkxkcrB3ZR
         mdtKA11ztw9taEq9kiFAjMedlZfCXcaR0nU4Avd5TxyJH6UHaRfoxgqaGF0tyNFCKINX
         uI42RbL5IwSn4k/9ncdVsy/OHgdWATDpqPQKiQt0H2cGSknNkwv/3+rX0PswSdiOM+bj
         8QTA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=jCPVWIDRspVGp5xSYNfy9kahMmClrzSjhhixykgMWS4=;
        b=UVnxvaUlxjMqUBHv2e0sYGoAKy0pzgTyr9T0hy1eB/YkGHMfG8x+e1ShAG97wm/OH0
         PrPi+VnqO/mmZvDeF2TnGLTLhj+XsQqRgOG9TwVhk9cNCBM0Vd96Xq4kLBJZSTTuDcuC
         MWD3NwHewL/PdFVCYFEU/RqpDCF249I/aMTDDnxGi2NRmt778Z3wnsVMbsrvKvFFY4Yv
         irG+i/o5lfBxLYrgQS90CK361f5woDmI5qvT1+qIDVZ4EKzvwNAeU9BuF6xO3UmwElhK
         fQarpQ/QyiyJdaWLas8u4j6/Vs59x5Y/H1LjGQk2rU7NbCwL7LlJanlKncsYeKMKdERV
         draQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:cc:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=jCPVWIDRspVGp5xSYNfy9kahMmClrzSjhhixykgMWS4=;
        b=hBIlfmmb3yGODwGRCnroB96sftNeMxY+Ntp+04Tj7uwnZXY6RN3vt3O2bsH7XTLDGi
         82sTt2c0t+O9ZW9g6EYuxOwrLrGZI6RnYOPWtia/NQ18HpjGT5ezfFGVEDb/ninQqmdG
         vrb8+9q4P6pP+GiQxyOqEJeYeKp0z/EM/zq+aU1ZEqyxziUhWoTfjsd3V83OKCDkZUC9
         yS22V+ZYczjX3oA9ki5/ueBNPfxOY3vvCk6JudRMGZUuwoZVhMeae3irXHEJkeuFAnR3
         UsQRmBExEqe0CPyKpZA+KnDTAAG4lbUy+V37sa6bSMCERw+1ZLlKGfRXEfpWbRNnvrn+
         7mog==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVLcqDIq2ACmjHcE7/B8hoVVS3pZnywpzsLQmi9P3/KQUVbY55C
	qj2y2c908kKh1W6LN7HkfAM=
X-Google-Smtp-Source: APXvYqyjQgoYrOfLx7A3XiIM1ZNJA4dKJamL8nQafRsj3+uDi39F+UUGEz2Qvf9RRqjjdiMgAwJ9yQ==
X-Received: by 2002:a2e:854d:: with SMTP id u13mr22425464ljj.236.1562172190912;
        Wed, 03 Jul 2019 09:43:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:553:: with SMTP id 80ls389365ljf.4.gmail; Wed, 03 Jul
 2019 09:43:10 -0700 (PDT)
X-Received: by 2002:a2e:2c04:: with SMTP id s4mr21745491ljs.61.1562172190033;
        Wed, 03 Jul 2019 09:43:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562172190; cv=none;
        d=google.com; s=arc-20160816;
        b=Nopnyi/uVLo0ylnBEMZDaqh6QJWu3NbX/EPgSuG2UTjT4vAHU4AgYa8m04Etmdo9KE
         vb2dS/nvuTKoZog2A1nn9qCh+LeS4qXvHDlZh+MmcLLXcosxLdxjfkI3nu5P9oM4KAyJ
         w+wN0Qkm4TK2Uep+b/G2gdQ3mO5TS+QECsQicdo/xJqU1bEYVjG6/rc+rYdmKEfuOMmB
         K+RTgxPGLHR0TNQ6/xFo3qRlpk2X8IYNyrS9TFFkKCc5sqMkfNKOObEftwdzSUtbzFox
         SliLtN0suSzALS1Kjseafsd+I6rRJTKG6D/OXT3uBA0q9vvdWjB/iQFmiH1DQ4tXDsgr
         rZfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject;
        bh=RBhpuwgoy5zuLR6QxgimFUqyHyJ7yegwYA/CTizGp8o=;
        b=WLELmrtaKZT/vf5d2vyql97UUjAoJnbscipQXaUbE/7GeH8dORGhAnzrp8k5xrbZBX
         CB0E5HrGPxOCRWASc2Wsapuz3Eqy8aL8LbYy/WrmzI0rWDZqB8IRzmVsRfF7PLBT5rgq
         QCPfNiAimLdHbsj8pPEamAnjES+UESFUclmx6F1+9hivd2BKPW04ICxQog0dIELaC/P/
         VXn4mKI4+ChyT49XxLF28tQMwUsKfFCcGZ/ziNc/SetRt6WyKywB0KOSwv9IFq9wvuNB
         IWQIIzLBF69/fUTvDIWPmYEcZlXqxP8q/LNeuvGR8v6iUJ8ZS2kgQJUGK6HaDdsamDfH
         6IdA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id q11si194525ljg.2.2019.07.03.09.43.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 09:43:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x63Gh9bf011703
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 3 Jul 2019 18:43:09 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x63Gh96L030131;
	Wed, 3 Jul 2019 18:43:09 +0200
Subject: [PATCH v2] configs: orangepi0: Keep hypervisor away from "secure"
 memory
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
References: <7c18ad4c-3e4d-30aa-b19e-76cc67bb0cd5@web.de>
Message-ID: <69ac2d7f-2b2f-22a5-9189-f28a9dc8dede@siemens.com>
Date: Wed, 3 Jul 2019 18:43:08 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <7c18ad4c-3e4d-30aa-b19e-76cc67bb0cd5@web.de>
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

U-Boot places its PSCI EL3 code somewhere in the top 1 MB, and Jailhouse
so far overwrote this during enabling - because it was not secured. This
slipped through widely unnoticed as long as no one tried physical
CPU offline/online after Jailhouse ran. But since we implemented Spectre
mitigation, we started to query the firmware - and crashed. Avoid this
by keeping some safe gap to the firmware, reducing the hypervisor memory
by 1M, just like on the Jetson TK1.

Fixes: MiniDebConf 2019 live demo
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---

Changes in v2:
 - it turned out that the previous 320K wasn't enough - align with TK1

 configs/arm/orangepi0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/arm/orangepi0.c b/configs/arm/orangepi0.c
index e45c8d62..5b52f60a 100644
--- a/configs/arm/orangepi0.c
+++ b/configs/arm/orangepi0.c
@@ -28,7 +28,7 @@ struct {
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
 			.phys_start = 0x4f800000,
-			.size = 0x800000,
+			.size = 0x800000 - 0x100000, /* -1MB (PSCI) */
 		},
 		.debug_console = {
 			.address = 0x01c28000,
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/69ac2d7f-2b2f-22a5-9189-f28a9dc8dede%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
