Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWPNTL6AKGQEOBOKETQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AD128DB4C
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:14 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id f4sf1042418ljn.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664154; cv=pass;
        d=google.com; s=arc-20160816;
        b=qC5D+59KqWPULEQCRQtYUNejRkYRMv0qO5dtYvMxCOVu/GrxSr0VJnwWYhsSLQzw2z
         zksS6L7UA66qkV69Q+xp6SMQsSjwm10OCFtcvsQrKBJkq9WmJRUlBp6LcQABqpVjqps2
         M1Vs0CcGCIMYwQmVrO1TnhU0ymNHGdmu+issuMQDsYfoTkqIEBR3BMbGyDAd9Vkt7sWV
         rso2w4m7LFeqeqcVIgE9fJTYV5XamBr9+x3U8Q2aZQQM53tTo3wrqwv3eJIWyEQJH+Nu
         +eFgQOcWRDt1AsWWehAN6SffFUOa2gS3YnIghLZX5h4b3qGZQuehrgZru7LyCr4TIWNN
         ZGgw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=KikKfpZ4sbqWo0eD2JRpK/hXNSCn0rs/pA5hqyqs+8Q=;
        b=A6zAqoNevZZfb2NeVE0Sbr8eVaJ246rf0o/P2+XlNoXFSXu5SpROOX0wDGjpOGnHhL
         nzYKXQvtla915YKKUhu7YvakKPnk4/K6YZKwtFJejczvCQZvac/xrW8JeSVBvpJCuDK3
         ZtrMVPpr/sf7cTlCDfF7RgUoydetb25EBpfXXyF8cjG0eF8jbM6QEz3tgfB+oWkTzAQ0
         b2HWQGUX7YRaoA6KF6RKw+fW4ibyu6RGtQQaa6NLAUguaEnxrhlfwONBkAeu61omdCxh
         0s2+yvz8hl0/pgH9UPvd0FWZX0gU3f6oxOH/rbdHcUM5csI16i0zokIPyY2FkTPx+j1R
         U3GQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KikKfpZ4sbqWo0eD2JRpK/hXNSCn0rs/pA5hqyqs+8Q=;
        b=pgj2tyoKEnP2YGK8cdoL5ko2QmzJ2R47VESg38k6XSSouU5fNjbAdzGABTkTvaRwAf
         oqfsN8p6DKtgVe8UObVqx6fere/qFDZrs0AUJmF36EMi+OxF0ZHEixVxiqkZSzpYV1dV
         iktg5NMN1V4+d7PCdRX5uukBzODZ08dSqZp7gJ10cHnpN6d0UdVlaNv77DBw6jnxgENZ
         QzBHts9vzYV60uHR/LFqwZUqM2+JEjXUxpBtSzfSzXuQ/A+rRPhbcwUVKK2Rg9j5VCvW
         1ni1bQZ3jo9BasyNLpni3w/RpsZeTPDLtr/XFGinf2VzJ5mMhzqsyCgJjEYeHTM9GcmH
         uvrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KikKfpZ4sbqWo0eD2JRpK/hXNSCn0rs/pA5hqyqs+8Q=;
        b=BUh4hL2u/nLyPzVDRWZ0b/zgpPmaqJG9vCbDxmhnge1vwRofgo0Ax/odj+MyaeGwlC
         GUxsz7Z8LRwECTKTaHgSsJKTEj3x3tRcNU1ADPxpSsRw/yxT98nnoipQjVgRdEWLpAvh
         QjwMeEgDAfh3vbVkdJcI06GG/RQKzowu9PcYtCdkiN+WR03/lPjffVTTfmit7FG5gYNo
         fQb6R5EMfI+Fhr/6ObH6vQnRIFqp3RfbR2jZbmNbS2KnYtlzD8hlMGO2/JCMwlajg5to
         6CflF8PlA6XWrIRDfyFOG/XosFxslKFuJRtXMjiR4IEHilbr6HFZtN5fDDJXDQAwD93x
         czLQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533O4W7SfM8BMctRkCcSGLwb0GT0l7cnk3chHztIjsD6gz211LOJ
	Ttf6V8VSJN4WtIj0hzHM43E=
X-Google-Smtp-Source: ABdhPJz3PsrDxVg+shi45oFS4FZxJpCQ70WrrL9Y+7aCRS2qC0Wu/Wg9HYdy1zRao42uPYvrQNcS2A==
X-Received: by 2002:a2e:8706:: with SMTP id m6mr1411112lji.129.1602664153908;
        Wed, 14 Oct 2020 01:29:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9bc1:: with SMTP id w1ls335064ljj.4.gmail; Wed, 14 Oct
 2020 01:29:12 -0700 (PDT)
X-Received: by 2002:a2e:99cf:: with SMTP id l15mr1432325ljj.414.1602664152539;
        Wed, 14 Oct 2020 01:29:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664152; cv=none;
        d=google.com; s=arc-20160816;
        b=zNEdi0FH/EvaN+r44xMiGVAUnDZo3EqufV/fahXTZikGs+fCQJPdkec/Wnh1JArAT7
         7zqK9msghfItIL6OONtiyIPUttMtXIVfHioEp1NK/6XvB8//5zg+tCMj6ZFH0vEOo61Z
         YMOimBTn0SC9EmEFoETZGizWiJmPIcLXgBH/bQciXhqbjYovk+/Dtm32lGTsAuli/Fnn
         JkwPb9SXDPj8JpLVQs9+SDd9WwsfmcO1ZOkDC4f778eSeKwM89muYVeIPxtYfeOYMgUg
         lsCN7lUkCp4Tq5Xtwuwy09tQrgz4zcFu1d4FK2JS7RDRccQpggOcWanqDKPYPxvy4k7t
         Hpjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=9i7cmuvckCMICiLd8rLAb+2iqYhyRTtnksNc8CfwFQY=;
        b=nU8mdaVx7ppRdqV74r4na/3UiJc5sxQlI6eTJfBebU7Ao7qkVAc0kp20YjUjW3ejJ1
         wwoZp3JJG5jd31scP1XByFsfovifoPkhsN7DqTNP1b69Yqa90MJWl44lYGC7Zsri9odK
         SyA3zfKH3RX4CJ/NnKH6E7FUupnIQsODFudEVHZUnBn+WY9dh5GN7U3ZRPeZ7GyUmdqc
         IC0vKaQWuRnnwfKoWHbKvi+W3FssNtUCE39Ultl9+Kl3/FyofKPH22m/tPMiAabiOL0H
         hgTbPk/YizEB5rCTFFLldlc5zIKkyO9aRWitKX7D14ShoFv3dcYw8uXeHmnK1GIr1sOC
         eJhw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id x19si71330ljh.2.2020.10.14.01.29.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 09E8TBVG023843
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:11 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAIo002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:11 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 04/46] arm64: Simplify get_cpu_parange
Date: Wed, 14 Oct 2020 10:28:28 +0200
Message-Id: <3fbf6add766308dc29cb2f654f5247b97bc53072.1602664150.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602664149.git.jan.kiszka@siemens.com>
References: <cover.1602664149.git.jan.kiszka@siemens.com>
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

Array lookup is simpler, given this input-output mapping. This also
obsoletes a couple of PARANGE constants.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/include/asm/paging.h |  5 -----
 hypervisor/arch/arm64/paging.c             | 18 +++---------------
 2 files changed, 3 insertions(+), 20 deletions(-)

diff --git a/hypervisor/arch/arm64/include/asm/paging.h b/hypervisor/arch/arm64/include/asm/paging.h
index 67664efa..932dbb50 100644
--- a/hypervisor/arch/arm64/include/asm/paging.h
+++ b/hypervisor/arch/arm64/include/asm/paging.h
@@ -101,11 +101,6 @@
 #define SL0_L0			2
 #define SL0_L1			1
 #define SL0_L2			0
-#define PARANGE_32B		0x0
-#define PARANGE_36B		0x1
-#define PARANGE_40B		0x2
-#define PARANGE_42B		0x3
-#define PARANGE_44B		0x4
 #define PARANGE_48B		0x5
 #define TCR_RGN_NON_CACHEABLE	0x0
 #define TCR_RGN_WB_WA		0x1
diff --git a/hypervisor/arch/arm64/paging.c b/hypervisor/arch/arm64/paging.c
index 3a4eb096..27adcf55 100644
--- a/hypervisor/arch/arm64/paging.c
+++ b/hypervisor/arch/arm64/paging.c
@@ -26,6 +26,7 @@ unsigned int cpu_parange_encoded;
  */
 unsigned int get_cpu_parange(void)
 {
+	static const unsigned int pa_bits[] = { 32, 36, 40, 42, 44, 48 };
 	unsigned int cpu;
 
 	/* Largest supported value (for 4K paging) */
@@ -42,19 +43,6 @@ unsigned int get_cpu_parange(void)
 		    (per_cpu(cpu)->id_aa64mmfr0 & 0xf) < cpu_parange_encoded)
 			cpu_parange_encoded = per_cpu(cpu)->id_aa64mmfr0 & 0xf;
 
-	switch (cpu_parange_encoded) {
-	case PARANGE_32B:
-		return 32;
-	case PARANGE_36B:
-		return 36;
-	case PARANGE_40B:
-		return 40;
-	case PARANGE_42B:
-		return 42;
-	case PARANGE_44B:
-		return 44;
-	case PARANGE_48B:
-	default:
-		return 48;
-	}
+	return cpu_parange_encoded < ARRAY_SIZE(pa_bits) ?
+		pa_bits[cpu_parange_encoded] : 0;
 }
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3fbf6add766308dc29cb2f654f5247b97bc53072.1602664150.git.jan.kiszka%40siemens.com.
