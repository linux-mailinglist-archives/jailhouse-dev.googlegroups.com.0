Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBTXQ2XTAKGQENDMHWXI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 3122919DDA
	for <lists+jailhouse-dev@lfdr.de>; Fri, 10 May 2019 15:10:39 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id e10sf4698908wrd.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 10 May 2019 06:10:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557493838; cv=pass;
        d=google.com; s=arc-20160816;
        b=phM6ba5sgkXHab+ekxg6hyNYF7lfU7Seh4JLNDAxzdAxbSXuQSDGcUIRCTrzPXDFfT
         4F6CkRnAYqYx0tXzxILPdWtHLN1FA31Ctl5O+KCJAUVGs1HECAX37CWlWgHYPlw/+FgD
         n6y4V+9FYNPkwJbDCqxWGSm51z5NX5RP4DOpi8exkQZedI5zj+0jLtrgFbWsOCkR+Hf2
         PlCBa1mGvo69DfXiMcc+Asb1LBfm4qk3HiWkhnVRAZAnxcWFyGpemjWP7//RiuTxLM38
         S+2o4GoyFu4W+hmeG5/FqwBI4UdEAr3ZS5Mjp3lK8LGOKC8itVGeDudXKh16KYwfsHRy
         S3GA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=Rb99tM5gjQkrACnYmofWaFl6St6bsUlKJ+gVKchDB0s=;
        b=0qr/CTJr5CU6zNv+ExubHidxHvzpBJS6oKsds0mmJe98uv6JkGDMooF+pZoKLpeXG4
         RXTUzRV7glM2SdjiiWXkIpF9acE6hL1Cz2IoXGJVIQdiOPhXbqgOuwj2FdedD1DWliZZ
         AuHrNdTyvVqV8sXAHW8RtFoK8s4BxHEX0S+cKrjfp3z4G3MjL1oBY6FachhTga5kPilq
         P1ZfLEgV/3zsaDHRvr99V/NRtygaFmRswyl3qZP71b8XzPUYKQcrzRxt4dfd1Z4wNf/R
         ngfWSN+SeTjl4WTJEKKM/8lTaREskK4A5522RlfE2GFh6SRaym8lIDQRt/5EQc2grCfv
         uZfg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Rb99tM5gjQkrACnYmofWaFl6St6bsUlKJ+gVKchDB0s=;
        b=e3kCglH0UYRCpUiYeivX8yz9+v++nCNHyx1z67z7jWU/u12QUl6D+4Ku2a/4aL+KWT
         LEWcRask1UCrTukmCcYdlokszhau5APD/kyTToqkUT5uObbz6mxkCTyfv0tGgdlxPHk1
         WJnSLdCdFFSc8b7zbhdIWEsRAYe/MTcOqGpLtYCmqncQvesEwoYA5a+9qdjMCvzQkdtR
         qXBzNsrR0tbpfJ+b68+/QRfTgejX3qKzaX1SoWnw7aU5UlsdyteJzrq7LK/TObXsFHNV
         CEU9sHxmZMWFAXpZc56E5ff6FQq/BiSYTeJ31Tp3JTKw+D/jw1iV5UquLXSafv9/UQiR
         9V8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Rb99tM5gjQkrACnYmofWaFl6St6bsUlKJ+gVKchDB0s=;
        b=sV/yJkCZgqisWvQHZKncxc8+rACQiRdl4JqlsVJJBUjxY/+LauVZNsGYcVMvIqOPZu
         w5drQbFaUTUqSaAYRN6e+gdLBGYb37ECx+JcmrMjUspgs42jtiIo8IM5AB3HfzALmLLq
         Ut2ounwJbbqJdRDLTlc7pikjmrXvqlbYBbFjqfmSRoJtKUT4uzIZlEZIOp04pK+b0Ypq
         nLV9zeGrP1KQgZ3Bjm5oRVcUlagw1VdxzyjCZD89Dz85SnJtmK/KQANUNKPtbkEYmGjV
         tZ5Cb5R0A9QSDrNn0eOCR8V852h7jKgmYPda3bJ7u9TTdAsg5A2gtabk0lOqU2YUZa/A
         uibA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU8L7cioXDF0vj/1B8FnGsXkiuQez7R7eAhdCo/h+cu0h9YH1dZ
	uo+vwO3Xp/34Siz/L6ne0eM=
X-Google-Smtp-Source: APXvYqypx2HTkc1/dbTsR+Z1f7bcUAoCY3vt5b0k/p4QBUyfs1bN3Q7v84Gsr6Xd8P+gZoRJmSC+uQ==
X-Received: by 2002:a1c:6c04:: with SMTP id h4mr7088932wmc.135.1557493838854;
        Fri, 10 May 2019 06:10:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:8b:: with SMTP id m11ls1387984wrx.4.gmail; Fri, 10
 May 2019 06:10:38 -0700 (PDT)
X-Received: by 2002:adf:db8a:: with SMTP id u10mr8028055wri.82.1557493838219;
        Fri, 10 May 2019 06:10:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557493838; cv=none;
        d=google.com; s=arc-20160816;
        b=lSHSR8obYe1N2w6JdTSRIaPJUgg3QhRqiq25+7Q7Pu6k97oqLvGY7LM5W443inzgDt
         KsC9kuKQ2j5BQtrafNsBXtTkXFri+TZNkOgpzq3Sm5Cj5HgbQNt/5CnW6lvXXagv4hyJ
         /ojymCkRWrPcIcuEPjNSeeKamg89g3yTppE9PRVGeSb7WbOYhLWUNt5vubCji+ry0C1f
         5dD8vIEt6win0f4CbqCx/O7YYctwC16jiG25SKX5kPsZO3xWu2EdIAGKRT9bkCXITQe2
         SFdLvYOi5wl+AhwLRjK+F50H5n4JXxPexdbK2sntUu4gFSYTdHancmq9LWnR6AYZSUrn
         UhKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=VBrTxOdriSHn7IURspOFL3iwGDVT3dULQC9GbgIu7t0=;
        b=x3Exm6wJXE3QrIZNeuogrGjz8atgO0j+vPAZ0SMirTWhugyUkLOWF5Goo67yv7JSZT
         Vg/bxb+XFrfuDc/P2T5M5Hv+noMUB90o2gBy7wko9UYJuqoU7xFyogkQkUiv4XGVUk4w
         MvEdmVYXKDatP/q7sHHJrcXsty4avisFoe/uooa++m/SWubjJv5XB0A+1W0qM4UUA+G5
         WIobsrCQKxWWOtsxFohym518+dmWjJ2xjf+L4KlJnz5FNr42LYw976LEzboXrvOtiUXj
         DvwWjc7bJ3a0JlHBTgrUaPEA2tM9kjH2Q8FqKw3LRMgl7njZIZPSrJGL4VzyIRSjiJGz
         TgLw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id t1si1050135wmh.0.2019.05.10.06.10.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 May 2019 06:10:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 450rDY50P5zyBH;
	Fri, 10 May 2019 15:10:37 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH] x86: amd: fix comment in MSR bitmap
Date: Fri, 10 May 2019 15:10:37 +0200
Message-Id: <20190510131037.18590-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.5.10.130317, AntiVirus-Engine: 5.60.1, AntiVirus-Data: 2019.5.10.5601001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1700_1799 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_NO_WWW 0, __URI_NS '
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

Writes to MSR 0x803 are intercepted, and not reads (as the comment
stated).

The correctness of the rest of the list was checked with a short helper
tool.

There's also a read-intercepted area that can be zipped.

No functional change.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/x86/svm.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/hypervisor/arch/x86/svm.c b/hypervisor/arch/x86/svm.c
index 9c3e971b..60d236be 100644
--- a/hypervisor/arch/x86/svm.c
+++ b/hypervisor/arch/x86/svm.c
@@ -64,16 +64,11 @@ static u8 __attribute__((aligned(PAGE_SIZE))) msrpm[][0x2000/4] = {
 		[  0x2fc/4 ...  0x2ff/4 ] = 0x80, /* 0x2ff (w) */
 		[  0x300/4 ...  0x7ff/4 ] = 0,
 		/* x2APIC MSRs - emulated if not present */
-		[  0x800/4 ...  0x803/4 ] = 0x90, /* 0x802 (r), 0x803 (r) */
+		[  0x800/4 ...  0x803/4 ] = 0x90, /* 0x802 (r), 0x803 (w) */
 		[  0x804/4 ...  0x807/4 ] = 0,
 		[  0x808/4 ...  0x80b/4 ] = 0x93, /* 0x808 (rw), 0x80a (r), 0x80b (w) */
 		[  0x80c/4 ...  0x80f/4 ] = 0xc8, /* 0x80d (w), 0x80f (rw) */
-		[  0x810/4 ...  0x813/4 ] = 0x55, /* 0x810 - 0x813 (r) */
-		[  0x814/4 ...  0x817/4 ] = 0x55, /* 0x814 - 0x817 (r) */
-		[  0x818/4 ...  0x81b/4 ] = 0x55, /* 0x818 - 0x81b (r) */
-		[  0x81c/4 ...  0x81f/4 ] = 0x55, /* 0x81c - 0x81f (r) */
-		[  0x820/4 ...  0x823/4 ] = 0x55, /* 0x820 - 0x823 (r) */
-		[  0x824/4 ...  0x827/4 ] = 0x55, /* 0x823 - 0x827 (r) */
+		[  0x810/4 ...  0x827/4 ] = 0x55, /* 0x810 - 0x827 (r) */
 		[  0x828/4 ...  0x82b/4 ] = 0x03, /* 0x828 (rw) */
 		[  0x82c/4 ...  0x82f/4 ] = 0xc0, /* 0x82f (rw) */
 		[  0x830/4 ...  0x833/4 ] = 0xf3, /* 0x830 (rw), 0x832 (rw), 0x833 (rw) */
-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190510131037.18590-1-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
