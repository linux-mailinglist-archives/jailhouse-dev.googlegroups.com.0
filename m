Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBCNZR2EQMGQEJWMEKQQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E46A3F4B50
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Aug 2021 15:03:06 +0200 (CEST)
Received: by mail-lj1-x240.google.com with SMTP id y6-20020a05651c154600b001c30dac7e87sf1567919ljp.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Aug 2021 06:03:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629723785; cv=pass;
        d=google.com; s=arc-20160816;
        b=sbaSfJ6/euVBuZzo7K+6HmmU+PDwhDu0niVhdlv9bOxe0bLGmNTDB6JAYBf81wXUQY
         i1Y6EvOBvyqVfHxJEPsiThHf9dR941paVzs1ow8+w5QHTclaNyV1wPSGFfUZ5EfjB8SD
         WVRywU588+bVT+gCImR+Ccyk02NUPa3810MvPbxNNYuHCVbS+MSKeZWaf9CvXHotEZjW
         0alGwEVa7yMettaAdiErS8O122ycsc0+8KdDxWLKqpntQ7y9FBuV1W3HQt/jcNcoHfm2
         vZkE8EQEPraMOJeMaN/LLYoB3LQj8nrU1FYVsvQNTYrHGLwbZ+Z9tBGqQ2HkeAR5eQuk
         JUxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=FY1tAn1RvdXyOI/Tqc7lNsM5bYtF8YS0G24+0GiKBXw=;
        b=lheCpaRYWQ98eWc7GSFGh+h/yTVOyQLesl4JSNT3iyAzCHV/H98D17QnyRYaaJ/k3Y
         tO3eSlf74F+6paT54wJqe2RgBL67Xu8ZMlwG4lRRW9yCQggmOHqOc5cPP9b79XQWlh0/
         7p47nr48CCyVKgJ4rAUguG0fZnfHF/5yGoC0UkfwNsPcn7/GZN0lffIposQxodzS00NO
         3t8aDmyr3GBIao6J1VQrHMCQ/OEHnUe7eG5IluCR5LKnXpStEmxWx3ZmXQjjdEvh0zCx
         hFVr0rvrIBa3yaK7MOxwLsJZkBHSaODSi8hMv6KUD0TwNknZrfozMSbCd1AC79krdoef
         KIlQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FY1tAn1RvdXyOI/Tqc7lNsM5bYtF8YS0G24+0GiKBXw=;
        b=AXCkUVbozlp4ZqH6/n9HD4rEpV4tNO87msMXcP3H/Fq/eJcu7hJYY0rn+p7IYj1Dxt
         10Gl5RrYv9+J6nS4M1uDReN9ke7U+ld/NnSq/+tEzP0PjQLR+HKZHhW1T9p5lNINPgA/
         GsDcqXZoVvVa6MyhRmCjcwKdHiqcJaazUG+Mb0sQWIVmhlQkvjJ7gWSdXtLNZ1a61dNn
         p9eyRC417mSDAx3RXL8/vKk2MhIlDaAFt6Mpd8e0TX2MEufaHAZwImNriDbxe7u0QQW9
         1ZDrrnGsexiqpRMbw9LPm4OyRaA3tlyMtt17Z+X/8JfZpfmF5eUxeKxj0/I4IXGJG/2X
         c25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=FY1tAn1RvdXyOI/Tqc7lNsM5bYtF8YS0G24+0GiKBXw=;
        b=EHrku72zq+se2yXCvVtmOsf1V2ZZolUK0ejWrB2hIUI0KsWyaHTteLTpmrXd9Wi0XE
         DG/ruV4YhehZMPjrQM/Jj/LohqxH8A7elJpu5hMTTsAsS+QYJiI0fViQ3BU3nIRf2n8h
         hA6DtzrLXf7RuGDprNZJm6U9kLLrNDj2Fabl614NKy5t18bct40Cpjj7aP9vzsxc+ZNW
         FTLrN8eL7Jw1U4ba3WaO2zfFm/CpP2sLA1/RTKRpLn0voe5nBn+B7sgitHBQNxeG9uMk
         LX18x93pDdySfkshyOzgJzo5Wdt+ybaZPonSh2aZONOJ1mo+e/KIObViLlBjsqJhin1P
         dgdA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531VLyvSSoY8Ga4ugSq+HohQsGZdLyQZFXy2GZfGn3tgLeT5F1YY
	eRrTrnzEb9nZfupYmpM0Hc0=
X-Google-Smtp-Source: ABdhPJyqzw8BcM5ZuZgkKvompRtuVbp/5AJVjIpRFmkEazLHQyPUYF0Bms2SEPKRYjuVf3NCQr6Rww==
X-Received: by 2002:a05:6512:68e:: with SMTP id t14mr25943915lfe.429.1629723785477;
        Mon, 23 Aug 2021 06:03:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:ea5:: with SMTP id bi37ls173444lfb.3.gmail; Mon, 23
 Aug 2021 06:03:04 -0700 (PDT)
X-Received: by 2002:a05:6512:951:: with SMTP id u17mr24701430lft.392.1629723783992;
        Mon, 23 Aug 2021 06:03:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629723783; cv=none;
        d=google.com; s=arc-20160816;
        b=rNGcK2uwcfJhKTSGlCTzUDFwZi4UL+Yv9ae4Pgpin/k2zCgvamwN+Ig97t4TPjsxJt
         WiMIvw8wdqTKQqJbYSQpK8IDIkcJqFn45mDNkYqXQUSxzORm7V5EgJiyPs4WbRcMAqLc
         w6EV0borQDIAhvIc+EGogIs0ha5wetgvwofWDLayt43UuzV8s2j/jAhKVLCGxP/qqGx5
         Am7U3JKOrls7boY8WJZZmFP/AZYWeCFnO8k98++WoTmJDsOxb/Y0IGJY1aCNlG2bH3jp
         kcMoMR26iUc6Gfg5TJ5KZJY9YedcekLQ1+49EDYjvQJe4HpZ300YQEoGzclRfZixnYCa
         2o2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=sB4MTUa7mG9VSOk23e5OKvIbMXaA6GYf0SmR017dURY=;
        b=kQp+M47fTPROzLSPvSnI4kReRor4Pnw36urnFbvWPxDs5lYR629NvNywJ3i8qBa9/H
         O/nODVBbtKwXu5JBX1yAOZkyKkIoIt8K/Hqr96VOtdwrc/yS85T+pGN+F4ixCGYrqLAO
         MF0sgazbBJ6PgBwOZ31GQHT9yGJG/mwQ+n9zvtN7M2mn/jA1bLIBXMau1I/NbPpL0Es4
         2YRtVvmG/BZEtVqegT5BSkwyEl/7rOPq74o8DK3E/5M76ZaUB/T9MsNK1IveW2YPiUTH
         l3OD9vYW8fFPBfUh5KhOqryvu8B6IqbVA8MkgRzEBJWw3rLHVBArKIo1S4sXlnjE0hjk
         T8uQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id y15si170248lfa.13.2021.08.23.06.03.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Aug 2021 06:03:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from sd6.buero (unknown [IPv6:2001:638:a01:8061:5c51:6883:5436:5db])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4GtXTy0B8Jzxtx;
	Mon, 23 Aug 2021 15:03:02 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH] inmates: gic-demo: map led_reg
Date: Mon, 23 Aug 2021 15:02:58 +0200
Message-Id: <20210823130258.215378-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2021.8.23.125416, AntiVirus-Engine: 5.84.0, AntiVirus-Data: 2021.8.22.5840001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1500_1599 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, SENDER_NO_AUTH 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_TO_X2 0, __NO_HTML_TAG_RAW 0, __SANE_MSGID 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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

When I introduced MMU support for inmates, I forgot to map the memory
for LEDs. Fix that by simply mapping it.

While at it, move the initalisation of led_reg to the top of the routine
where it should actually be - it should be initialised before the timer
is armed.

The mapper will take care that the address will be huge page aligned,
and the size will be aligned to HUGE_PAGE_SIZE, so there's no need to
align anything on caller site.

Fixes: bca43a784716 ("inmates: arm-common: add MMU support")
Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
Only compile-time tested! I currently have no device where i could test
it.

Ralf

 inmates/demos/arm/gic-demo.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/inmates/demos/arm/gic-demo.c b/inmates/demos/arm/gic-demo.c
index 58feea3f..b0102615 100644
--- a/inmates/demos/arm/gic-demo.c
+++ b/inmates/demos/arm/gic-demo.c
@@ -56,6 +56,12 @@ static void handle_IRQ(unsigned int irqn)
 
 void inmate_main(void)
 {
+	led_reg = (void *)(unsigned long)cmdline_parse_int("led-reg", 0);
+	if (led_reg) {
+		map_range(led_reg, 4, MAP_UNCACHED);
+		led_pin = cmdline_parse_int("led-pin", 0);
+	}
+
 	printk("Initializing the GIC...\n");
 	irq_init(handle_IRQ);
 	irq_enable(TIMER_IRQ);
@@ -65,8 +71,5 @@ void inmate_main(void)
 	expected_ticks = timer_get_ticks() + ticks_per_beat;
 	timer_start(ticks_per_beat);
 
-	led_reg = (void *)(unsigned long)cmdline_parse_int("led-reg", 0);
-	led_pin = cmdline_parse_int("led-pin", 0);
-
 	halt();
 }
-- 
2.33.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210823130258.215378-1-ralf.ramsauer%40oth-regensburg.de.
