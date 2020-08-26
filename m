Return-Path: <jailhouse-dev+bncBDXIN2X4YYJBBHOYTP5AKGQE3KFU3IA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc3e.google.com (mail-oo1-xc3e.google.com [IPv6:2607:f8b0:4864:20::c3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 02691253A93
	for <lists+jailhouse-dev@lfdr.de>; Thu, 27 Aug 2020 01:11:27 +0200 (CEST)
Received: by mail-oo1-xc3e.google.com with SMTP id j9sf1870926oom.9
        for <lists+jailhouse-dev@lfdr.de>; Wed, 26 Aug 2020 16:11:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598483485; cv=pass;
        d=google.com; s=arc-20160816;
        b=L1PkeWqPaFnnX48SP3vVs8gXQmJHrC1T3D6Ys8oqSMA2ghXdmWHWX2hr06nfGj10xq
         OLhda9fWK1xeck0Xw4RCaiglq23RMPs1N+fHfuO446aSaAbipv1uYwGxaSwpCfS3nbo8
         ZuDDUtmF+N39+NJyEAmMZMdzPWiPyqol1iZFJsgVeARuthRZdithwQKdWcBXZg5zGgi6
         0G2NmYljw1NvvjYOhOAcRrZ1WnF5R3c1a/iN+Ouw4DV3sJGPzKqMGyVyzzDktap0Bocd
         wRZEZ9TR6Idu6Dmep0A9krT65mHPS9mKybanFqpnryI9vYYvVYK5ZgXijvWQUAyN3CIo
         72ug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=f03g/AX/nhPHa9LkMlfBjJwfwlrHRoFtGM6qdgHjA3s=;
        b=GcvsaxJvsg2pS2kqpvU6GeGpIFtI+yQI03TP498rf3JFFAkqkLXFtItNMn+V2w4AJb
         fXkxij3JViY+XmctCvnCizIIrIR78j48iKMW9jmSMw6gJ/fn4IebkVt6+bFtZbw9Ox9Z
         zoLekhHbKbNZIssEdjyHzK7j8ecjVuB5AcEmo4WymInv5+8Iiv9yKogdokdrqlJEAO1k
         KIKXX9XIknvAAqvYrwF1LcseC52DrsGRXZ7iAuUrrBgrrgeehsZop135EWp/WPhtoufr
         zh0W3weHpAX7zfUcMhmZwhj+74vFXMQArp4AMzADuJMzr16nj+grlLrZZryky/IVS8U0
         JhTQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of daniel.sangorrin@toshiba.co.jp designates 210.130.202.157 as permitted sender) smtp.mailfrom=daniel.sangorrin@toshiba.co.jp;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toshiba.co.jp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=f03g/AX/nhPHa9LkMlfBjJwfwlrHRoFtGM6qdgHjA3s=;
        b=GZxWDqNsCW2PWMKywkawvt7t0sV8pXiO6z7JaXGLEFu8esFoHwNlFp8RyWUfSG3cVI
         cekvCSsSJp99kt8+vc4/Eea2YQODj5k3M42GrjgLWo3+DUBND2FjXJ8OuxtOqLdHY1Qt
         a36adfZADfBg1ehS4H7d/+EMtQ3jgC0z2fe9HGV0hmknmd96tHx6nvIx/dAPyaM246o1
         S/9CXT4blf1W5I57qEoyyCP26SPz2iC/hH7LszWfaOqcOM9cN5BOiKAd0sEF9n9hMMS7
         E3lZx3jkPCgMtdL9W3bdswFoIHogsAxX44oyu8XauZ3oG/MCWAR0muOae9DK7dlWj0ZF
         K6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=f03g/AX/nhPHa9LkMlfBjJwfwlrHRoFtGM6qdgHjA3s=;
        b=LbbxQFBqvP3rbMt7fkoJPKT0+9C8/0lZNdHeBA9Uo3Qr1/Uuixkyl/trZVxSZpzDKn
         tNnYeZEUEmEgpHxFEiuUsd1OwxR9U5lVJBpHX38ZuBOGCEVuoGNJiivlyUADsDye2+dm
         PFbjeqnMyPbuW6JGS9waabTk4iBswTb6YEMMz4lViVAY4kxve3+9mj0E7wVCxBb/o2F6
         prtCuBgo5ktweUL29xSqi87rzpNzfdw4zUPWwyXvDrqb83izXUCWeZp34tjqsbKPyI34
         bIjVr4zyvqGzwi7dR6jZ4Rpxi1mONr/8XEw2PUwO9J+SR9UdORVnoe5iq2Sv7Wrc1oFT
         SA6w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530LfMT1l6z63colfAoBMXyFPdKlfeydjRyzS1Vxc5sdIxs0VhA1
	rf8u3udEunfadwJhcE9CjVA=
X-Google-Smtp-Source: ABdhPJxZmrSdEj4hOeqU9gwg6E3xq3Xx9Jkn0uS2im1acDtZJ6PkTHjaGMKIJ8jDlNHEG9KEy/v/ew==
X-Received: by 2002:a05:6830:1287:: with SMTP id z7mr10820273otp.271.1598483485597;
        Wed, 26 Aug 2020 16:11:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:6a13:: with SMTP id g19ls111357otn.6.gmail; Wed, 26 Aug
 2020 16:11:25 -0700 (PDT)
X-Received: by 2002:a9d:7f89:: with SMTP id t9mr11940587otp.278.1598483484969;
        Wed, 26 Aug 2020 16:11:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598483484; cv=none;
        d=google.com; s=arc-20160816;
        b=oB+tIyYSjRWmtQN2uXmhgY9EYwv3FwEb4PI0m/04cFToicB2GTHXana24qLltNYhCf
         9z2Q0Da9PNys4NgPqIINFQrxXDNuAw/2xk9aPsVhej52b5lwNoOgw6Ll3J5qaSmQMYqJ
         Y3ILzY4Wn0q0pL/ImYKK/Hd1oOE+J0fbA4LEgitdOgNEebgMuAjXVE/eiiE0+ZAkqZR/
         hscm3libfDHLJ32IQ9SGC2FV8qf/WEqzh2lS3+rhn+5w3Xb72I/PzanJHOWvLk/QNT70
         j9jMcDh0OXzrtnVzbFJzWlVDvLVdT4erSHj+VczVjx6rq/zwUkBul+XGonvI0uQuz41V
         x31Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=dvHo1AVbtp1k79/TmU07MMpoqorKjKo78Ds/656aqJU=;
        b=FVyggmYeiP6SfBBRL9q1ssAjSoGLcVUP4GRuGNdXhDn+DtQwQu9y0887A43r0kI1cm
         C49leUWbipL16uY6b0kdapTRWZ66KNJtXKziLOh4iUkAocbkINypRl4c/+UQ32uvChAV
         CxrDPgHTW8AbGZvB1d1YbttY/A/ycxx4MLpVLuFUu2509aUnMJZeIv47ExljhcmkC9pT
         d9l3r88j0vfOea3FOZrne8uqyMv8kmXyMw1a3PWuWxLEPP73CTG85KufZtwLqoFtVuUT
         98jdZQHK9DE/Xw3SbZV4GFKs848NcNA1OH8n7cboMl8vvRLXPEsO4Mlrnc0nKaHbg+gy
         xF3A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of daniel.sangorrin@toshiba.co.jp designates 210.130.202.157 as permitted sender) smtp.mailfrom=daniel.sangorrin@toshiba.co.jp;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toshiba.co.jp
Received: from mo-csw.securemx.jp (mo-csw1115.securemx.jp. [210.130.202.157])
        by gmr-mx.google.com with ESMTPS id b6si20397ooq.2.2020.08.26.16.11.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Aug 2020 16:11:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of daniel.sangorrin@toshiba.co.jp designates 210.130.202.157 as permitted sender) client-ip=210.130.202.157;
Received: by mo-csw.securemx.jp (mx-mo-csw1115) id 07QNBLsQ010149; Thu, 27 Aug 2020 08:11:21 +0900
X-Iguazu-Qid: 2wGqu78fjKFZDjQy5x
X-Iguazu-QSIG: v=2; s=0; t=1598483481; q=2wGqu78fjKFZDjQy5x; m=8veb8z/BdRDxFLHc7drtg1BGcGjjciJO3pfV58Mt0RE=
Received: from imx12.toshiba.co.jp (imx12.toshiba.co.jp [61.202.160.132])
	by relay.securemx.jp (mx-mr1110) id 07QNBKLg028192;
	Thu, 27 Aug 2020 08:11:21 +0900
Received: from enc02.toshiba.co.jp ([61.202.160.51])
	by imx12.toshiba.co.jp  with ESMTP id 07QNBKlL004464;
	Thu, 27 Aug 2020 08:11:20 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
	by enc02.toshiba.co.jp  with ESMTP id 07QNBKno001559;
	Thu, 27 Aug 2020 08:11:20 +0900
From: Daniel Sangorrin <daniel.sangorrin@toshiba.co.jp>
To: jan.kiszka@siemens.com
Cc: jailhouse-dev@googlegroups.com
Subject: [PATCH] Documentation: fix display resolution number
Date: Thu, 27 Aug 2020 08:11:19 +0900
X-TSB-HOP: ON
Message-Id: <20200826231119.1445942-1-daniel.sangorrin@toshiba.co.jp>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Original-Sender: daniel.sangorrin@toshiba.co.jp
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of daniel.sangorrin@toshiba.co.jp designates
 210.130.202.157 as permitted sender) smtp.mailfrom=daniel.sangorrin@toshiba.co.jp;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=toshiba.co.jp
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

I was wondering why the configuration size didn't match
the multiplication and then I realised there was an
errata.

Signed-off-by: Daniel Sangorrin <daniel.sangorrin@toshiba.co.jp>
---
 Documentation/debug-output.md | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/debug-output.md b/Documentation/debug-output.md
index 5bdc412c..c86270eb 100644
--- a/Documentation/debug-output.md
+++ b/Documentation/debug-output.md
@@ -41,7 +41,7 @@ Possible register distances (MMIO only, PIO is implicitly 1-byte), to be or'ed:
 
 Possible framebuffer formats (EFIFB only);
 
-    - JAILHOUSE_CON_FB_1024x768    /* 1024x786 pixel, 32 bit each */
+    - JAILHOUSE_CON_FB_1024x768    /* 1024x768 pixel, 32 bit each */
     - JAILHOUSE_CON_FB_1920x1080   /* 1920x1080 pixel, 32 bit each */
 
 ### .address and .size
@@ -92,7 +92,7 @@ Example configuration for EFI framebuffer debug out on x86:
 
     .debug_console = {
         .address = 0x80000000, /* framebuffer base address */
-        .size = 0x300000, /* 1024x786x4 */
+        .size = 0x300000, /* 1024x768x4 */
         .type = JAILHOUSE_CON_TYPE_EFIFB,  /* choose the EFIFB driver */
         .flags = JAILHOUSE_CON_MMIO | \    /* access is MMIO */
                  JAILHOUSE_CON_FB_1024x768 /* format */
-- 
2.25.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200826231119.1445942-1-daniel.sangorrin%40toshiba.co.jp.
