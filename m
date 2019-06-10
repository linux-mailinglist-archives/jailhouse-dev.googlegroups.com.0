Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBRWD7PTQKGQER5I7NIQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AF13BFAC
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 01:03:34 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id t141sf98144wmt.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Jun 2019 16:03:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560207814; cv=pass;
        d=google.com; s=arc-20160816;
        b=kfShT4aa1i35anZ92P/2Vxuciw+Q5iquBrewS2v0kyg1H0fSURA9mdC1AiWZO7sPiH
         gQ0M2mYK/M1Oi4uRFevOMaAfGcFv4qjn3Fvl8f5fgHDrWOAGKCd5yp23AWlZxutec9VX
         cFsPnnDo8rwePak38grrcWON83CLjAcSJ5Dnu3xf+aYjnatGdVmgnwHFTpacUbq215yD
         mJ7bcrdULV78dynVJT8/zyD3an5c2E34LsenG8Awcr4rUmYr2WJE0CtLUHA1DWfwfLbJ
         4ZWguNJrSNitRKUe2cqBy7e9c4cskfGtL/RuglFUYVXqb51Ug+x3YxU5ejQ90aMqj+7D
         Dg0Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=i5XR6HTjdc5A5iRf0M4Knj6YzehDIncjQ4+9Wbog4Bg=;
        b=qvuf9ereQvPXtC27rtwEZFkO5xi3dz5TjKJ7XQ9fAPUKIo1WC47TChfXWMWFYv+EhN
         ibu18cKm3e1PcrVhK8+4ZEb1DwzZ8jnNQfilsNElEeboKYoMQALCc7GwAiTjvoylNCaU
         liW7hHrEJhJB70Mh9g4sy5XTT63aUn08t5OG9PVGrzml7g4PFo6nu4glV3SvekR4MkCs
         19l8NWRFzhmC9TFORUJ5umSU1oqCv5n8OydhiR5OBTehZF+1LhyfOIzQRLjgpAWkGlnS
         ZrQPfE/mVd5osMf6tdaLmc7pZfsfGWHcKQSVDCJr3L3ynbWHii5Wlya70fi6s4h01yfw
         upZw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=i5XR6HTjdc5A5iRf0M4Knj6YzehDIncjQ4+9Wbog4Bg=;
        b=bwlvC8IYG8dL6Te5CZnVy7H6p+MBNUR4LLTiquo3TI7usTU7b6bORnMHuvOx4EaT1F
         IrVZssbZCjq8bicBNmx0lpdfuVEopy4Qyl5bPjuKwb5F7iMq8jQGqXiyiiEGyBocIVTw
         55fo/OS3joXySgcVVftEPSxHPhGU13G6Cybdc7VXNWGCtmmumenWuDVA8Xta6s+dzvUx
         jbtejQu5XX/+SQF1tIcv2pLsiR4fQYvjzGsUiPapJHBrabp/6UHhTUh0p3gb/M+OknPg
         sK+XQUY2FWdH+/D+bpC7ZkyvKi3Q0FgiKWDM5dEyzPpaTvNj91luvhkWl99z53oBxAca
         ahuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=i5XR6HTjdc5A5iRf0M4Knj6YzehDIncjQ4+9Wbog4Bg=;
        b=dUz8hXcySPGsjT0RqWWOSc0U4o134tCk+Fzd/nSXWk+AHI503H0oezmaZ/CAXXDl7x
         t5FBiiE5m7DXA7MHanksSAMCmEivRcQmepgdzPlkREYOT3qFoFCruiEZ91cxmDpYjzv0
         yEo2/QQY72wzQ+ECY4dlKcIgG/ye2deehVtrgy9n9LaZrL+Qu3C38Nk2mYPQSiz5B1c6
         ybv/phP+PyybneaCj18DZQqtTjwrCyhkfgx7RtEBCg3WviF0nWFNcAtGSiAIWh6otiAu
         9lLfU8aNq2YpFmxP2MfapnmdPHfobqCIicR3bjeS6zU6wwQdmT8YuTv6Wso97X+ip3CL
         pscQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUvLlzoApd9KLDQ1eGSq3hy1LctQq1U+4K+02seV/YxTPfMxN2n
	NQQTeUlzcfBLS30oJmeLXiI=
X-Google-Smtp-Source: APXvYqzQsWUyzOEHi/reQosi6Hr68Nw4uaOHcjZ2c554pFI2uqiBPx/l2th+DkK73VZ1w7JGL4t8Hw==
X-Received: by 2002:adf:fb0b:: with SMTP id c11mr6520528wrr.56.1560207814632;
        Mon, 10 Jun 2019 16:03:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:9d45:: with SMTP id g66ls266346wme.1.gmail; Mon, 10 Jun
 2019 16:03:34 -0700 (PDT)
X-Received: by 2002:a1c:630a:: with SMTP id x10mr11136082wmb.113.1560207814040;
        Mon, 10 Jun 2019 16:03:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560207814; cv=none;
        d=google.com; s=arc-20160816;
        b=SAC2huzNCZddn1TPOa6hremyKUpWV78gBznzERNXz+eljPztBBt0hluQQa3RHQIdIy
         NbB268YrY38+tW0roFKtGj97+SMfLlPFBIHFHXl4nvOJHXztespqXx1qOJ3A6KZ/s6zg
         /eknifq/Fxiufq9Op9/Or2UV21CGTuh3U+8jywCSfIxAtLDuvssY6LS/AQwBVUTil5Aa
         FXGe/7Pex6L9e+U2dLKAcNHSwqXda6wV59BSOSVFwI+M6HEAYhmsiZeNkSZfWmmytMGf
         rukNOyFZA/x9QNsp3lHiR+ryWLbJOc2FrSJYYSs35Ux/HzwWETchB+FKq4rYhZqYlBnE
         kAPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=/r1kl7nB1nxRkpePPjLZ6NXy465OxHL0f6CanxCzJvM=;
        b=iBcLDWYCldM3cwatE5Vj9hf7OYRBzk8YfICMt264p9nvApxmDAkspB/OIlIPNYtEBs
         4vhrTMbh/Q+xshyLNjzI/zTzRGWSUjHEwKGbR8TAXcm5wy8MfsFKzQ1KIU+n1qNP+rWB
         z5L9XI50tA3ccuUmcsw/CMR2lfD3/GH7h/dteh1EA3UPuTalFGhPS35pu5PaQDDvEuY2
         UgXCyqo9fb4yiUL8hv+ksmMaPzXGY4Bh4bOAehiSDbQbvV+5NvY7cZ4ea2ttl+2nGlab
         0Sf3mbn0OluZwfKtAtRhFDQz6OlXeUdtbzahV4btQtSRsNnzoBWnSjLzVO3B/mTAAAQr
         TMWg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id v11si65078wmc.0.2019.06.10.16.03.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 16:03:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45N7wP4RGxzy9v;
	Tue, 11 Jun 2019 01:03:33 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 01/10] inmates: x86: use correct types for pm_timer_read
Date: Tue, 11 Jun 2019 01:03:21 +0200
Message-Id: <20190610230330.21419-2-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190610230330.21419-1-ralf.ramsauer@oth-regensburg.de>
References: <20190610230330.21419-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.10.225717, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.6.10.5630002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1700_1799 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

If we should ever compile timing.c for 32 bit inmates, then unsigned long is
the wrong type. A 32 bit type (aka unsigned long on 32 bit) is too small to
hold the result.

This ensures that we won't hit a bug when enabling on 32 bit. Once we will
enable timing.c on 32 bit, we will have to implement 64 bit division
intrinsics.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 inmates/lib/x86/include/inmate.h | 2 +-
 inmates/lib/x86/timing.c         | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/inmates/lib/x86/include/inmate.h b/inmates/lib/x86/include/inmate.h
index 7664570d..e4f75206 100644
--- a/inmates/lib/x86/include/inmate.h
+++ b/inmates/lib/x86/include/inmate.h
@@ -241,7 +241,7 @@ void ioapic_pin_set_vector(unsigned int pin,
 			   enum ioapic_trigger_mode trigger_mode,
 			   unsigned int vector);
 
-unsigned long pm_timer_read(void);
+unsigned long long pm_timer_read(void);
 
 unsigned long tsc_read_ns(void);
 unsigned long tsc_init(void);
diff --git a/inmates/lib/x86/timing.c b/inmates/lib/x86/timing.c
index de41fc35..d179da0f 100644
--- a/inmates/lib/x86/timing.c
+++ b/inmates/lib/x86/timing.c
@@ -92,13 +92,13 @@ unsigned long tsc_init(void)
 	return tsc_freq;
 }
 
-unsigned long pm_timer_read(void)
+unsigned long long pm_timer_read(void)
 {
 	unsigned int cpu = cpu_id();
-	unsigned long tmr;
+	unsigned long long tmr;
 
-	tmr = ((inl(comm_region->pm_timer_address) & 0x00ffffff) * NS_PER_SEC)
-		/ PM_TIMER_HZ;
+	tmr = ((unsigned long long)(inl(comm_region->pm_timer_address)
+		& 0x00ffffff) * NS_PER_SEC) / PM_TIMER_HZ;
 	if (tmr < pm_timer_last[cpu])
 		pm_timer_overflows[cpu] += PM_TIMER_OVERFLOW;
 	pm_timer_last[cpu] = tmr;
-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190610230330.21419-2-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
