Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBAW242KQMGQEIDHAOKQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 5914C55B9B5
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:13:39 +0200 (CEST)
Received: by mail-lf1-x139.google.com with SMTP id b2-20020a0565120b8200b00477a4532448sf4709463lfv.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:13:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656335618; cv=pass;
        d=google.com; s=arc-20160816;
        b=aFbUsjVbR3AQYu07CPFvtQtwN8jVaL2s0H0UkQDKKsv772HcquSwJRiYgzmAFNvuIn
         kTrZ49sMCMbaW1AoDNE6o8xQlAfcxvyZ8be93piPQQZVPy12JHBGsnJrJP9WnGBgK8hj
         rz8doa4X+tyq0ds8/Tw3unqZqtZaVfpjrridOnr6t8uFpMG5yEHQ1r0GnC0tXfIPTE0+
         DYDuEzPYVQxE/0yJapd18qjPoFN2nOoaD0nsh22H/M1/mx7mItq8UMBkIci0a+pnyRIa
         yhLm5XkGHHZ/gWBIFp33cUDdVU1z17EJjaT5zuqXoOoAylv6AkUKPbIRLDGATqwCjOlC
         /u5g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=s0bgIsDRehP7fPH2oYgDvmvgicvMxCwIv7d5qB6FXLM=;
        b=f2KSV361Fc+/FmF8W10mdn00VB1j8s8SeSwjuF2Hoyw+krX2njZnlo71LoE+abpQ51
         ybHS43nL77qFECZpbejgKhRYbFIP6tm7pu2E5j1aDVVdarxiFK3K84S1KtqabYQfhPoh
         MrgrmK6KWYGBbstuasYDWk/9f8qCHv95rlB17sFTg5RkloH28IjTOA5cgt8i2Kj9y5lF
         0BB8rn1vBsOhJ5zRYRYxaYhN/Mcy6tNlJsdO5sBDH7nwUrTPzxq2UwMyFqpllHRv8857
         XJeBkEtt+dEzc6PSrS82jhPHGXcHji6jRJ+rsU/EYFddOYi/ixi6ZRqs87u15KXPIH+J
         m2VQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=uTjSrN08;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=s0bgIsDRehP7fPH2oYgDvmvgicvMxCwIv7d5qB6FXLM=;
        b=fu7+g25p8U+85SZ5ryJGdL9Y4rTd3zKNULnkWhz+Xvw2c4TwyKWoATEtkRHjiXYroK
         eS4p7pE9Hhrw+IxaAWujUXDll9mdVvyyKucPrZeWUuGu3kekUaHk/vJgQhKYEFB2Z68J
         vmkryXSWQ+F8ayeWIsxQoW246BsxiPyFZx1n0JfCvNtXR7ab1ElJzxnWCX1yNiUlMvrd
         kfzRr7IAk3u76s2wACmfFu7EqucyXhc4wlS+37r5c0PXCimR7c/NqRCPJJ2B9MSccKAn
         zy3i9Lh8iq9OHZLzktQtUK8uxGMl9AD+FlVf9Qfgp4cRMaJtBBnugO2HSGElpKaWCaom
         KVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=s0bgIsDRehP7fPH2oYgDvmvgicvMxCwIv7d5qB6FXLM=;
        b=oe3c1dc56MTsCEVYiqber/UN/OdXsVm7R2k6qfAInvHkQSf9JDx4eabwgp0sKjXiu1
         i1ua4zupdq9mfPs3Dq3YlBiyZw+EDnABkLdac9OrIvhzJco3MR5Ejxn2Mf7k7gXphOIM
         SsImFWl/Mwb/FA+Pg9L1WwI3IL2imbInDsfSjwkjqLeIYbh1z9JLyYVHLFdVJgPTk/go
         bCbFieGWD38IzOdCSFJw21tbvjQaUlK5d7zWDRKbte69B7pfW3JukNuP1ljF6IQeRoqT
         pnmCr/VIJy0N2BXHL2jDwKxLb3DVdg0cNnAlssVvVlEzvXZZI7BkQmU6M1/w6a6oHS1G
         Hjvg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora9wzXocE4PiXhfd4B1fdbf6U2oIV44Yc7T90sSr77QCxhVeYI4T
	9dgh70Z9GPoNHPPft+fmNoc=
X-Google-Smtp-Source: AGRyM1s71VdpJ3LwZGMrBgFFrkmHTSOc3Rl8V9Q+mO4yZu1SkqblHtDmq5/ngooePi7seyzzAv+/DQ==
X-Received: by 2002:a05:6512:4017:b0:47f:6ece:4340 with SMTP id br23-20020a056512401700b0047f6ece4340mr7710451lfb.342.1656335618718;
        Mon, 27 Jun 2022 06:13:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:91cf:0:b0:25a:8a25:7576 with SMTP id u15-20020a2e91cf000000b0025a8a257576ls2194990ljg.0.gmail;
 Mon, 27 Jun 2022 06:13:37 -0700 (PDT)
X-Received: by 2002:a2e:390e:0:b0:25a:9763:d2dd with SMTP id g14-20020a2e390e000000b0025a9763d2ddmr6613115lja.210.1656335616904;
        Mon, 27 Jun 2022 06:13:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656335616; cv=none;
        d=google.com; s=arc-20160816;
        b=Axnik8s0MFU8xYllxSf3lj0W7tV+PMdusj/uH6qWASmIRneRk7Ix1it6DKTPYW7K9i
         zq93YWPoDt18v+uX6neUTGct13+zBOI+Qwrv+7eBR0yINU6gs5JMK8++spRTIux0oL6c
         L/JfjlPcXoKNGJnY4q6MASmuKaKs7L7xAqqCb3VyOUqaoOrT9xtG+Z//r5Nbf36goIri
         QwQYFYr3nb/epCv1M6EPzL5tXDiWn67otWTCsN7Cy8VszP95EksXuSmyVtenAqyzJAnV
         sLGbP+/vFDmcIoFHWHvvcRcd0+UPea2lIWbl4stHKL2+ADK3wcw7cPFyQrKaXb64jXQf
         hrqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=DFSKydU4XgQVHFH+98AwyMCa7/ECMYH+2th4X5T3cFU=;
        b=Uuv0hq0fM9sFaSlHtMIFyOAgm60/O+L6pFAVTd7RrqftX3O0bLO1P+VN2ZUEzno26o
         WKmpG/wtc/OUPW/TwZ88hpR6basVifTXpoFIZ6IKuqAY9QFxpvQS8yd2wayK5OICKz9i
         U0W4FEBwa3aXMz6/qcoJ53YbTN3eF88lmSjfHXiBCJqERHYDS8vW6NMWJmwwqegDZ+tC
         RgPsg8HzMME6DvCt4IN2NEekAl5AKKOkjkMOiAQ1WDo/YCFUSEOokP+1CBoJFDzdBPfr
         xMLNvzmzyivRg4LmJWYa0TM7Vxe+uVPfkcOQnDGW+5Nt2mp2tPm+3NlDkW5UoiSG3GYE
         dCuA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=uTjSrN08;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id o9-20020ac25e29000000b0047f8e0add59si486834lfg.10.2022.06.27.06.13.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:13:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4LWp802TFDzy6w;
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
Subject: [RFC v1 03/20] x86: Do not kick targets of vcpu cache flushes
Date: Mon, 27 Jun 2022 15:13:12 +0200
Message-ID: <20220627131329.3659-4-ralf.ramsauer@oth-regensburg.de>
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
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=uTjSrN08;
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

From: Jan Kiszka <jan.kiszka@siemens.com>

All CPUs != current are supposed to be suspended when this function is
called. They will process the flush request when being resumed. So drop
the superfluous kick.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/x86/control.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/hypervisor/arch/x86/control.c b/hypervisor/arch/x86/control.c
index b46347cc..9a2c6680 100644
--- a/hypervisor/arch/x86/control.c
+++ b/hypervisor/arch/x86/control.c
@@ -72,13 +72,12 @@ void arch_flush_cell_vcpu_caches(struct cell *cell)
 {
 	unsigned int cpu;
 
-	for_each_cpu(cpu, cell->cpu_set)
-		if (cpu == this_cpu_id()) {
+	for_each_cpu(cpu, cell->cpu_set) {
+		if (cpu == this_cpu_id())
 			vcpu_tlb_flush();
-		} else {
+		else
 			public_per_cpu(cpu)->flush_vcpu_caches = true;
-			apic_send_nmi_ipi(public_per_cpu(cpu));
-		}
+	}
 }
 
 void arch_cell_destroy(struct cell *cell)
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627131329.3659-4-ralf.ramsauer%40oth-regensburg.de.
