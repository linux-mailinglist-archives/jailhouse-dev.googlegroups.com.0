Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBAW242KQMGQEIDHAOKQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEBD55B9B1
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:13:39 +0200 (CEST)
Received: by mail-wr1-x43e.google.com with SMTP id z11-20020a056000110b00b0021b9c009d09sf1189167wrw.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:13:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656335618; cv=pass;
        d=google.com; s=arc-20160816;
        b=G2OLzy2+KSeURsDxVTCXN5ShJX7bzCwZQlGi637ees8NBehj3Rwm94fYV4w6r2aPug
         OuhCsSMNVLxzDAZQGFgfDFvA+igfVUE0LUprJHvH6xVFTgXo4deI2rMhLh7AJycipLoW
         xc/6CCSdZfpQPDaqhBVjCxH3xsbfelJYXzdFgl8rTvmxSv1dpRFUiYJjcXCJR0kOu4YM
         qDUWxxmx6iIXHTRXHbObyKBZt+Js852rgcsGcNjkqeLuy6oYXrQXiKejUFL5V4k+/ncL
         049/zd+QayGnkpZMotDc/tUgMeDmLw8dMg0GG8HO4un6eD9eYdsO2SKVZQhXketMYs4z
         EeKw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=OpC9wcS5CqzKHT1rWQo/ExJ0MYzZsSZKscfuHXW6wx8=;
        b=BiOnDG7xbIOVTXWwXuwPq3Hy9Vjbofv/YSMMl+wQTQ3h71iHg7ohzz6F27VFcO+31+
         Ulo1fCYIM7+bT574AJzOHsjqGguxKB68i0KnjAeJ0B5SXx7tuYv8XY9qzrrarckEFmfR
         n94Bdf0/2s+4wfWTatzyFU1F5DrsV28uP8t4Q2OArAd0rkdLycicuPY8TVIepkSXrGhs
         O3GbLrjT3nZSeyMJHj0zOv/voN3HhyApEBAVQ2ab0GrdN7BVwgsE7zS5QLV26ZMgGo/m
         x0Vt45SX+6Hwhne/rHsLFMsolGh8kfmb23Haa4v8xIprquqCZ4tJrZnmIFQzLf3lOAQO
         i/nQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b="jaP8wss/";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OpC9wcS5CqzKHT1rWQo/ExJ0MYzZsSZKscfuHXW6wx8=;
        b=gcrUZ6Fk0hVSk0cRlN4BUQVtk2CbIMOnGmH4HgV6aS6Xd74/UCfdJLcPJyZ7c6sGP6
         cUiyOn26+hTYdzgaowXMuby4YRXfc2qrQA7TtgrGKDUyEA54Fl4ZAu6OOrhd7OD8uP1a
         H+N0WVe67sb5IaKYnbJXOClGzBOlrqcDJHogZHDlzMHZBTtTGvnif5KbJkNP/QjT8CZN
         2GNwqRFD+x7a1z7lQhzI/L6/Umh+K9v2CLI5CSog2ZOQwm3tsuAjACj0ZFYpnVwmXLyf
         RcrxGRITYN5SNnC7ilvfi8Can/I+/dw0DDFbiTdKGlk1yRt25aOno8yMJ8AKtp5X3esy
         zjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OpC9wcS5CqzKHT1rWQo/ExJ0MYzZsSZKscfuHXW6wx8=;
        b=lcXpZnh3RqNPWnoufsSkVbqCZWC0YGj6n5M7ee7sxvxFpWHhEdkoEZXK8Xgazue4yt
         Zl9eHDAwK/j2H89LgqPi1OaTuL3wyTU3AVX3jakcvcFV67xlXKIntCCT3tGWrsyQB+GX
         +GwBvMrh8oPqV/5C1wfsaiIte0/attSe1o+UGEtgGtptWGWZGjc1VwJWajFeduz9FnMO
         DUsfRWTocdVgwZBg+hFCWw/L/hy5f2L9CxEcKr8ddl+kvey9fA2Pi+qN6E8Acy70iAgH
         R1LehanC4BM/Hr4v/Bu93LrvyNm14HCAP0oXE+jg0fZFYYILSTLIAoenIzmKcO9E4iBG
         EY9w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora+DSh5JqnsmHsUewTzlfpKMuKEC9X76FbUayl1r0Qek64gcjsUV
	HWmEBkp7SVk6Uk4a1jtZN1Y=
X-Google-Smtp-Source: AGRyM1trEWAGdSncSIYfm4wSijuIOiQPP+AQNlQ3h1JBFjfmkm83TVIkAsu3BIwN78lk2krQhZQckQ==
X-Received: by 2002:a05:600c:198f:b0:39c:8417:5daf with SMTP id t15-20020a05600c198f00b0039c84175dafmr20840876wmq.110.1656335618736;
        Mon, 27 Jun 2022 06:13:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:34c6:b0:3a0:4f27:977f with SMTP id
 d6-20020a05600c34c600b003a04f27977fls208922wmq.2.gmail; Mon, 27 Jun 2022
 06:13:37 -0700 (PDT)
X-Received: by 2002:a05:600c:1ca0:b0:39c:4dbd:e9ed with SMTP id k32-20020a05600c1ca000b0039c4dbde9edmr15337396wms.40.1656335617218;
        Mon, 27 Jun 2022 06:13:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656335617; cv=none;
        d=google.com; s=arc-20160816;
        b=BHbbJDLcNenshBIKjUzWac2kHHSUUWzcs1aGdgJcqzjryimtipVlgbbt2svZR2imxB
         Jzszg5DMeskJTCEmP4nylejsfLquIWLnGFsLDP8WtnsIBTMpSY2MWlvRyGULuz052di7
         YaHCF2BKcOod6HvulN72UcLzwF9wS3v4SISLgLkyr6YJLmdiZ3pWU5GznOJx/dQH6DO1
         TBPZSHtC8EGQ2A55ERMFMiHKFKlCe4abmRHofJbQqUYdfTS+5LovbIRRajlXSWdK4ReQ
         zx2dOyo1CqyuUP8r7TjMhTDkMKpTaReQjPFegJFwh+BACA+b/jPvx86TfRcNwAil/WtA
         CC0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=0dZiYQ64zFFtX64bP9E+52aECi2FzPb6hVXuDFWZ94A=;
        b=AHdEpanttc51jCA01D4Ed8f9gxAFNhUi3FnTxOKQ4M6eJ/k9xLFa9oC0YKNetgWNUv
         Hj8OD4KjgJ65069LS9eaapO1CxWZVdNzAWX2SK959YqeQK9T9gixiSCdxd40OwKXrrKX
         fvvLPrAE4rhLS/EC3Ds8m1PIPVMQS1FPqlqCtWmQ+ncpYS12d/Xtuq3nk8iKlIu7/0JE
         v6fm2h96IeEM6H0+T4AClNFa9wL1P9um2vrIhmgMsdtqEoSB1wuxbrrhuXp0SNh0QMtc
         1qpucdqdD8hEelOr/UyirKDymfdvxW8WeXzSfYxOMr41y+5XSINPBlQP1KB2DBP2MxXM
         vuNg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b="jaP8wss/";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id f17-20020a5d58f1000000b002102a7531cesi341073wrd.2.2022.06.27.06.13.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:13:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4LWp806bNCzxwx;
	Mon, 27 Jun 2022 15:13:36 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:13:36 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 06/20] arm64: Update unit link order comment and save a line
Date: Mon, 27 Jun 2022 15:13:15 +0200
Message-ID: <20220627131329.3659-7-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627131329.3659-1-ralf.ramsauer@oth-regensburg.de>
References: <20220627131329.3659-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b="jaP8wss/";
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/Kbuild | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hypervisor/arch/arm64/Kbuild b/hypervisor/arch/arm64/Kbuild
index 59102226..fd56a4da 100644
--- a/hypervisor/arch/arm64/Kbuild
+++ b/hypervisor/arch/arm64/Kbuild
@@ -17,9 +17,8 @@ include $(src)/../arm-common/Kbuild
 always-y := lib.a
 
 # units initialization order as defined by linking order:
-# irqchip (common-objs-y), smmu-v3, ti-pvu, <generic units>
+# irqchip (common-objs-y), smmu-v3, ti-pvu, smmu, <generic units>
 
 lib-y := $(common-objs-y)
 lib-y += entry.o setup.o control.o mmio.o paging.o caches.o traps.o
-lib-y += iommu.o smmu-v3.o ti-pvu.o
-lib-y += smmu.o
+lib-y += iommu.o smmu-v3.o ti-pvu.o smmu.o
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627131329.3659-7-ralf.ramsauer%40oth-regensburg.de.
