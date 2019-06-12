Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBJ7QQPUAKGQEC2MV76A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 0262A426E9
	for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jun 2019 15:03:36 +0200 (CEST)
Received: by mail-lf1-x13d.google.com with SMTP id j27sf2652408lfh.4
        for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jun 2019 06:03:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560344615; cv=pass;
        d=google.com; s=arc-20160816;
        b=QtIapuUFAY7KzM/xD5hqgbweVs1F8eico9hEuNoGd59mL/0y2kpwzvDYohRZ6A2tGZ
         2dq3VNumeObB7rheC/lQs60Vlh+7dAoS1OLeMq7+W89t+s79xM9djkYK6pEzbHY7liLw
         QZFBRMvWzszqWZzUdV5uNpvE7mTDajUwNW+23TkC6NuCe363U4Q/IgqfALww3qXC36iL
         oK1/wtiKRJxlH7WkTrHGigL94kpgYQPwcU6LE5kLgvqp/nfA3PYoUxPPcyvzLf+jpDIn
         DpPXZCrN2mBwBvZG5V8yoN5mFBFN66LKU4MuK26A7//VlyDuChzNPlMyxEKsMaziSV2D
         Yvow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=m9eUG9v9zG29B44sYW9f1IDNEZTfnD5iM1dzdfKreks=;
        b=I6f4IqfEmBnw0bsnmf/2zNIreOPmDqas62F78IUoiEvO1/R+BAxvOqpgChJe5R7b5q
         UoT9hbCQgFru2DDUSD6sFByEwg/Tcp10Er3XsNKHpliaKQdD484dtzgYMOYot4R/kxA4
         OuiONLBHlbJAOhXNiIQzuuSzQkLN0tUAUlSgvPTQQeWJJ7l09hEhJollN39GHwkGjQ5l
         Py4pFsSLOwsBOM/Xtm9UM2HsAs+4iqN6FFsGBSMvkqj3Zy7BrwZmLAKh9S473LW9Ae9e
         vWUPMX4XqzDoJuYWziuS1NPU6SO5Vx9GvT5BkXTjmOXOrXmdeNyFaIHz5slPaZnag6nd
         sP4g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=m9eUG9v9zG29B44sYW9f1IDNEZTfnD5iM1dzdfKreks=;
        b=s3CW3WNwGMLg5HtQZoRKPcOxz+AJtgpwp2cGUGBGDIEr4V2j5GRlQ5Z7Mpc2/rfZNb
         ybsFxH4WLZ4COYVPp/CrrqYihmyngJyODsmJk7h1y8RV51/L7/65Y2udiBHAlgvFGuuC
         0lf8IMmuLMxCd489QPSOAgCgvSYruAENkL0G1CO+EPcGNsJ//ZJBd004h/lqdu1ui7bF
         eTrOGWDrePjrciIjpLCrbJVBynfgqVNn/LW7vt+GI3JxRwrvgjXqdIQ0gEFxZcVK9JBe
         tbQhlkQ754Y7C1gt6782Xx9MUZXYRZ8MsRi8Rf4xCRWL+hREhTHoDq9xDy4vlFoaNJle
         +zNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=m9eUG9v9zG29B44sYW9f1IDNEZTfnD5iM1dzdfKreks=;
        b=aelhjwdG1BrFhu1xK87uWEEWeZ6Fdp9a2CQKbNoxj3J5Pay48P5ka5Ovn8G2yJm7JR
         AhtxKZTkcub+M3qhLGDVFATpf1QxFJ/nYmcuK35nHYk1odGH0JdTw3qOxUopbWz8/4vF
         l3VQ92OxRntVzk6mo+M/I0nedGoFNfYVMDoIV0sNedUOfadgbYlPZ1yV+ZESdbMXMBAY
         8nW1y99zjGSknvcowOUOir0fzpHAc7EA/VXC+aQOsBbkqqtlOA2cII7IyYUGo2JQSfAm
         XZbjOMqt7mIRC0MtI8wh7PPUCZBJf7LspaE6haevks9QsrLowgFo+84bF85ZIst6T8MH
         T7Aw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV6k6WMDUplwv09ZDqFftivEmY+88n7BDFRJCz/ETwAWxbEgvbB
	NI1euCGLqMXT7nywzWFzsmg=
X-Google-Smtp-Source: APXvYqwJkoPt4+DqtuAEqwp/+j5aK1jKeJvlClWBUUA3kwxERpDbj6Vl12z+muS20Logu23+/wvDCw==
X-Received: by 2002:a2e:760f:: with SMTP id r15mr28352942ljc.18.1560344615472;
        Wed, 12 Jun 2019 06:03:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9781:: with SMTP id y1ls237198lji.6.gmail; Wed, 12 Jun
 2019 06:03:34 -0700 (PDT)
X-Received: by 2002:a2e:995a:: with SMTP id r26mr3371792ljj.107.1560344614939;
        Wed, 12 Jun 2019 06:03:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560344614; cv=none;
        d=google.com; s=arc-20160816;
        b=LA4/6YKuJ9Aau70qfB0+jFfY9HlGen/v0cdhu9G8Cp7NPIBypG4VrSt/HZR+AFeGB1
         iWCv4d7pnfeibWVdlEaXYS3oKbYSGc8GsKFwsF5HRVKof8fGyzveyGajIZxTTXP3o6PQ
         2xD5NDAxDk1Ku9iBQdW+O0rwW2XlFF6XOKZ6I128GzxjZT0tx3gfflnsohBf9W60y2XL
         sYnTAS65TDbxXP5vfiJ74PTgKQihCbAw9MxNLj/TXHwllvLKb3N7h7O59JT4JwBXamVQ
         BWGqdeEbblijpxXZjbjcaFLxd+vN7R0hwyBbkL37VAdVmh1L6JW+bNEKib24W/NLmluK
         +5TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=7StjHK/eNsnyRCldhofb30EltmhaC6oQDDxW/i4HFg0=;
        b=DvyZltJi5X1tIgYpDp85IG5VgTRZ7N6lEqdUYHjUxi/rk1U/TiyzSoKSKPSqXg8p8i
         zDNw4E4ySoTLOjm+I43eUXc8R7jdOPtXCRoe46stAfBUzsmA+9S9bWuGOC1aaq8Y90Ig
         EvgxuiP1WcftyNv35oXZV7/YPQskCxfmRQC1Yc8emDWTgx3Cnnoegdz8Q+jMvS7lF+OD
         0Viv1OyD2nPdpSz8ps365CzgyZJQLeKsD9/6ZEP7nDFdY+6CV+nyKjyqiX8m3Z5SCmU7
         NBFC6jckYaKPyBZa1+Cbe1RvXF4UHJ+eErSMuf31+3/0Fw7Kt0gA6Ab+5oHkkLTHqJ9i
         F+/w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id c15si782238lfi.5.2019.06.12.06.03.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 06:03:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45P6WB1w3DzyB8;
	Wed, 12 Jun 2019 15:03:34 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH 3/5] inmates: x86: timing: adjust type of apic_timer_set
Date: Wed, 12 Jun 2019 15:03:30 +0200
Message-Id: <20190612130332.6175-4-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190612130332.6175-1-ralf.ramsauer@oth-regensburg.de>
References: <20190612130332.6175-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.12.125716, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.6.12.5630001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1500_1599 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

ulong restricts us to ~4.3sec on 32 bit x86 systems. We do a cast to
ullong in any case, so simply pass a wider type.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 inmates/lib/x86/include/inmate.h | 2 +-
 inmates/lib/x86/timing.c         | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/inmates/lib/x86/include/inmate.h b/inmates/lib/x86/include/inmate.h
index 7664570d..f8208b7d 100644
--- a/inmates/lib/x86/include/inmate.h
+++ b/inmates/lib/x86/include/inmate.h
@@ -249,7 +249,7 @@ unsigned long tsc_init(void);
 void delay_us(unsigned long microsecs);
 
 unsigned long apic_timer_init(unsigned int vector);
-void apic_timer_set(unsigned long timeout_ns);
+void apic_timer_set(unsigned long long timeout_ns);
 
 u32 pci_read_config(u16 bdf, unsigned int addr, unsigned int size);
 void pci_write_config(u16 bdf, unsigned int addr, u32 value,
diff --git a/inmates/lib/x86/timing.c b/inmates/lib/x86/timing.c
index 1b28ae48..2d485e4b 100644
--- a/inmates/lib/x86/timing.c
+++ b/inmates/lib/x86/timing.c
@@ -139,10 +139,10 @@ unsigned long apic_timer_init(unsigned int vector)
 	return apic_freq;
 }
 
-void apic_timer_set(unsigned long timeout_ns)
+void apic_timer_set(unsigned long long timeout_ns)
 {
-	unsigned long long ticks =
-		(unsigned long long)timeout_ns * apic_tick_freq / NS_PER_SEC;
+	unsigned long long ticks = timeout_ns * apic_tick_freq / NS_PER_SEC;
+
 	if (tsc_deadline)
 		write_msr(IA32_TSC_DEADLINE, rdtsc() + ticks);
 	else
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190612130332.6175-4-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
