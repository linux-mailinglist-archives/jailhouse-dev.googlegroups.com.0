Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBJ7QQPUAKGQEC2MV76A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AA2426EB
	for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jun 2019 15:03:36 +0200 (CEST)
Received: by mail-wr1-x43e.google.com with SMTP id e6sf7317447wrv.20
        for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jun 2019 06:03:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560344616; cv=pass;
        d=google.com; s=arc-20160816;
        b=tj/oYQCM2sc1yznGLp56Z2U2OZRDnX8DoauQ+IVOuxLnCuwuStlk9qZye+WFB8u73/
         Re+dDZ1fSHa9SuJTvFUbOJqHox5yE5NELsqB9IFK6QEdCHZRO2/EkRl9buGp5XrvlYBa
         sm6v4Nv0YdwIL1WSw7qEJyDVhr0XhRhIMBGuh/9Qgn3p8RsxBi1OJIen+G86CNloHLSu
         Y0oILoOmUMn7iVjhZl3VTZpVhUydpZLRVFYSyQSOC8/O8nPKxBUp2uXWnXYoLgdL4Dkn
         xuZmW3kNvz7dHCD/ZDyVm5keJ0dg7DuDNwcBvZsGtuffbXeXvz545EO9qS97LtVPd/M3
         Puhg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=0LwBtO5bZLTj2Nwk78MvHbJxiXTNqA/UyMeWvsQzuFY=;
        b=dSwOtEDi9Z7c73r8bzvALyP2qG4Dgax9gYPeWl9Muzaf654solZEK0pTV8dpeGgSbP
         96RWnVvdCa112167PZboq9j3s7/d5iNaIt/Nw6CyyFoOsIlHrXGyJDW9ARe4wfVy6Fh8
         2B/4wnrrbFkJ5YLT+G/gO4Z45UTOWTu/eVluRU0VkLk8cxHQxfZZ+ifMrOWGgJps5ZyZ
         gLDQtoIwCCEvJzCQgE3tvWqpaB5PCqCd0/IY0zXJlBOggorZ4k0ESVLSB2ctHLAy1vU4
         6gsYB26iNza8aLkM2o6wMbbwY91iDIz8qeDb1vw7yIL+nATeTvyx1bQsbSLwc/5ihQZS
         nXMg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0LwBtO5bZLTj2Nwk78MvHbJxiXTNqA/UyMeWvsQzuFY=;
        b=G1Ez7T1bp61lWm34fyXWmUIESnuxQlqNdGmKh0Oyfq/6bkmkAx8K04GtVevUecXOD3
         fLrM5uGMk+T75iGAiVKPOVkcNkGoEunick53a/rTS3UqZRqdBBK+CkukgJ28tKgWHXo3
         xxb8dFgrA2OMZEkqp3KOlzP6HNf4quPjXkpU+uZxk6buoxe9kqcRlIDdvO8C6c90CE2b
         UVYYyviAMHG1Mu4QCG1bNgpfCnESFbCSt/0z0Mdq5p0mOJmzFvLVaQqQLt/RIogSILWQ
         XOdiW7YtE0z49lA1KJxo+bmUbKJM0SA5C8BrOlpmfCgpoQ+g26dL5O09uTHvXbp7wMJb
         0Bgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0LwBtO5bZLTj2Nwk78MvHbJxiXTNqA/UyMeWvsQzuFY=;
        b=QTvhXJVeHNQ0XVQNMF0bXJ7PZCpuE/Es+I/URkMC1RwUTjUdhjrV/ZT7zgF5daJeiz
         aUSXdagYopv/GBIuvCPFMjuryxMgJ9+4DyhgkA7F57LfofVPejQft49OERmtyViJr5qc
         boEsF3QEIGj9mu14+87t/tLAjKVuInAFOVYBLWKQYUAp3QirXG00K847rFcKzrnhxoTZ
         rl3GRq+D3MPsPeUlBWF5PJZx7BplXXND8yHKFCklqJExMjiDWkkcQJ/CUzftCH41h4TG
         Tq0mtduV0yTQTinpEasrvpmG9YUbD+c+evw2hQ+v7yr7toI6QDD6zpAh2NXfuaeD/3I5
         AikA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU3w/nuUOz1CV1MnsxYzPzUaN+nx7BePtxBfnncCLQC8V3rPaIt
	p3r+2FK3HgLi6JQz52nvtWE=
X-Google-Smtp-Source: APXvYqz4mTHqXF5D3kD4LzYBBZZx1DohztUJMS2TR/17BOPxaLccicLMo0ljUo8BPsgkoqyuJQi2IA==
X-Received: by 2002:a1c:407:: with SMTP id 7mr23581803wme.113.1560344616016;
        Wed, 12 Jun 2019 06:03:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:9083:: with SMTP id i3ls457376wri.14.gmail; Wed, 12 Jun
 2019 06:03:34 -0700 (PDT)
X-Received: by 2002:adf:d4c1:: with SMTP id w1mr8759538wrk.229.1560344614800;
        Wed, 12 Jun 2019 06:03:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560344614; cv=none;
        d=google.com; s=arc-20160816;
        b=D7hgPBaHhcxCc8DXHMlU6MEqbByi1s/U/2nJSqEAqaJTAFaOqoS6r5cTuyLob4TB2B
         WRNHL914RL9FlVYv7vTqLFBHqWl80OpFsYxrFQ+DQTDazk8sNvU+0maJcnvgYp7T7II/
         cAW4QmvYhsAmRRiCoz70W+5/oalq0mYugDRaNiy6RRuMgj3EShOwY66QG0LDj6MQGgyB
         gti6rx3LmS3oeF3qxfSg7CmQ05f4mKZ8UvXSez8o/xrvLVH4bvhrsl2JkzG6od2v2iOd
         50JeXxadcxM9nlSrq/cZvLcUiBBCrDGjyQnX/iAK0Zfzlfs7AyqUuPo9fVyTGUu2lBBS
         dM9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=ZGzHX6f9okyyMB7/wWd9PFmVsOem0vSzo20Koyu0Q60=;
        b=bj7XYwzNh06jIo9VlNj7PzhbjX0aOqSGmfX3R6YQCRJz7BI1WjGdH0HwMMaW5JYTNh
         QARZIwUdvPVqMYgehHt8Ll7v8ROB2VI0iUGSYKbpdBBGM5PHMk0kVoMqlXwSlS6a2RWC
         qf1PV3WIyZvaeYxWGcIzoKY2gcU1vciz3xRghA7WKhrQyhEGrjrbXcs8Hm+zuxEtIhbj
         HILUk2hWOLWTuRzyyV7GvRSv4eDq0SHRWonWHqZ8JAIlmVSHs6u5GV3bigFn9xz8i7o/
         5vybP4AaBWpsUpctI11Q+69PA6qBuaXiJFGYo+4Jws8QWgY691/f1hkchbcKvB44rq0x
         a8Jg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id j18si709962wrc.1.2019.06.12.06.03.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 06:03:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45P6WB3N1zzyBH;
	Wed, 12 Jun 2019 15:03:34 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH 4/5] inmates: x86: use correct types for pm_timer_read
Date: Wed, 12 Jun 2019 15:03:31 +0200
Message-Id: <20190612130332.6175-5-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190612130332.6175-1-ralf.ramsauer@oth-regensburg.de>
References: <20190612130332.6175-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.12.125716, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.6.12.5630001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_2000_2999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

If we should ever compile timing.c for 32 bit inmates, then unsigned long is
the wrong type. A 32 bit type (aka unsigned long on 32 bit) is too small to
hold the result.

This ensures that we won't hit a bug when enabling on 32 bit. Once we will
enable timing.c on 32 bit, we will have to implement 64 bit division
intrinsics.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 inmates/lib/x86/include/inmate.h |  2 +-
 inmates/lib/x86/timing.c         | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/inmates/lib/x86/include/inmate.h b/inmates/lib/x86/include/inmate.h
index f8208b7d..e57d7271 100644
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
index 2d485e4b..ccdc10e2 100644
--- a/inmates/lib/x86/timing.c
+++ b/inmates/lib/x86/timing.c
@@ -50,7 +50,7 @@
 #define X2APIC_TDCR		0x83e
 
 static unsigned long apic_tick_freq;
-static unsigned long pm_timer_last[SMP_MAX_CPUS];
+static unsigned long long pm_timer_last[SMP_MAX_CPUS];
 static unsigned long pm_timer_overflows[SMP_MAX_CPUS];
 static unsigned long tsc_freq, tsc_overflow;
 static unsigned long tsc_last[SMP_MAX_CPUS];
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
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190612130332.6175-5-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
