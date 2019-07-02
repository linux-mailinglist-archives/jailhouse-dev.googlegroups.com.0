Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBPPV5TUAKGQEMPPHOHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83f.google.com (mail-qt1-x83f.google.com [IPv6:2607:f8b0:4864:20::83f])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E785CE15
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jul 2019 13:06:38 +0200 (CEST)
Received: by mail-qt1-x83f.google.com with SMTP id q26sf16038053qtr.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jul 2019 04:06:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562065597; cv=pass;
        d=google.com; s=arc-20160816;
        b=TwYD05qAkvQPFLb2TvM+KozcPmdRambDQgxUnz4mHiSPK++CrOFOOSfNJJ6cH/tJQT
         jSdU91TgqoOYfJz+kQvrTbClovVje4ZFik7M8UBklpZRK09vsWNXi/2xWkP4x3hd1rEL
         Xft6NS4HQSiY7qUpnShqLW4Lp/0/6pypFtF6GyIcwi0tNSOUE+9uZzNnPSC0Zyh5XMRu
         RADJL1ck35Ml09NFDTN1ruNiFae6ZVwVODp2YiesIFTeTJQ7zP7GPWxwUTTjujRHEhZ8
         azf7/pcRau/q7jIUE+k06dv23v9vWk82jegY36Ni01rfc4hNkVrEOUz7IxKafWO5803B
         NwEA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=yXaeRZDD3hY6Am9gcR9nsRlc39fBXlADB4sJgHa3yaY=;
        b=FP5PlUSRO+sXWs/sRaWIz52O5iDJS69LEExwNl8M3x61lOtCUygeHLe3VGOyve2epZ
         D7MQacyfxtDJn2IKO1PGeSof1hEspSL9WxF2WDUi+bUzlp7Y2ts4Oy46pJgN/1bzT1Ka
         vI0aTciJCngJtGxpLjNBaS73RoRpUWMqFPHpcVGCHf5aZpcteMvAwdVW1m4r4lv6t+KD
         mya5JH/NE/V4zI2ebygOsPXmzDlVB5rAj2vJuBXYse7RDXRAEzB/057Y80vCc/cVyv7w
         /i5avHpIsuYNluuGeqGEwLRH4Xk8yjZfxmK7vS0zxXbchGD05RhOVuKApJktMpvfEjWP
         eo0w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="Q9P0/s50";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.192 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yXaeRZDD3hY6Am9gcR9nsRlc39fBXlADB4sJgHa3yaY=;
        b=md3GGa1+uA5MHgLWSfyyeGvT7Q9YXyAbSlIDZCZeqB+JxUhHcS8DX8GKlfdr/C+3W9
         1kZekqf5Pgu+EoSiJLaALOeYf9sko3DtGnBG4n+kpMJZ4q2b2+hWPEwxFbbGJiD85JoR
         QryiXT7vClZiFrrhP8MpHFqTdVpvt2eypy0FsptWkXCorys3Jkocti4ftC63KdH4++AJ
         ImCEugf1I33eSmfwbANCZC4RtBZCbFIBkzMgBedUL3EmytUqdcp8zMG8kPxdMWoekLIx
         iNCoNbiXMmauC2q9wl9n0wg3yGQwyjaCVKO6ht50pW8c6tinEy552/abXFbJFFzv4oRd
         Unjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=yXaeRZDD3hY6Am9gcR9nsRlc39fBXlADB4sJgHa3yaY=;
        b=TeaAH8LaFQvHSZ88WCHaOfj8EB+toCoX02QRxM9mT047tcKSyimqGdIrcZwQZqbRmd
         zL5bu4J3LxphNkvJddW7LpkUcFr7Q88bKX8eXWHbcwWRH1opUemPe7spg/C4Kdlhj7YE
         7Sx8kDX6Bt/QJLg+hPl91CfwApz3wu8lxdziZAFCJR8DhxrkWHaWYV3AEGJvrVEZ2yvR
         iEH/9GTUcpGwBNoalCelqHjmOYp5CdBu2ZXwj8N4neHb61S5qNobrvV2kb3Nc9pXORfT
         ESa+qJPCMkvFQBjaIuFxdI8cBIXQGgJ5V+ECuPduDi72e5+tL14hbJmoUfMDUlCe0BQ0
         5rcg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXe2zoYwSIjxtbx6T2FERj2itF9TzDHN5hGmqgpPpku7EAj3cU4
	tgsmElR9UKY9T5LpsLztPKg=
X-Google-Smtp-Source: APXvYqxfLMZTHjWpoZA+ulo5sJGS1LPKs5cLagDCQeoyT0oglGUBvzhrc5VsyrqOPP3j7kwlQR4UsQ==
X-Received: by 2002:a37:9e4b:: with SMTP id h72mr25173871qke.297.1562065597515;
        Tue, 02 Jul 2019 04:06:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:4c97:: with SMTP id z145ls4534019qka.2.gmail; Tue, 02
 Jul 2019 04:06:37 -0700 (PDT)
X-Received: by 2002:a37:6ac3:: with SMTP id f186mr24287972qkc.281.1562065597217;
        Tue, 02 Jul 2019 04:06:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562065597; cv=none;
        d=google.com; s=arc-20160816;
        b=bbOTl4PHuJ7I2gK5PaI/jzaig4sh1ES/pA/M11Bc93JJ8J9m8lwIHDIm06tYqvNAbB
         vadEdQtN9hhqDOTekC/SCDLT5ZdD3dtHQgXgLF1axN4pe+UYxS3TZ68nwy4z5Vi6aqv9
         wdPDhRYSPZ57Z8TSMBlZaoivVZXME0u/mGGEiuozeLSpjGIitr9/PULmYKiCph7iGir7
         oGzeWtB9sVBco86+u0FKyXpWYzvNKG7G5G9fRofE7LxBSOT3uB/eYSMeFXVFS6rS09ku
         cyRCcV6+kR4/+M2IsBm5hxi3dsaSR0ve5AJbLTLjHXCe1O7LABG2RvSo1DQVNTPjbnjs
         LbyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=f/XJuVS7XLYXfrhGj+sqsNdWrn3FXzgXDmqh0jLYa/Q=;
        b=o5I1a6VxYhZA2Foh0E6e3DbOqwyo7eCTabWwCkNJpfpU8fmovPUHj0zRlbrE9I0HM0
         o7FJQYVWMB6MXVlCmsn9po/iVXj11q9MHLxyflWpzLuAy/omiN/6dxKqgLvWSjUIxb+n
         /DEzp1Ep+9de0v/Ro/2d52kRADpu+x7Y0GGup5kg5x+6/nidmFJvJM92i+ModxI7NRNW
         6OvEitToazvc2+MoiFEleXlBUZaFaaoWcCMsaOEjDpm0Jd128E3but97MZsR05klRVGI
         FDNvFcv8A6gmKpdnA7fCEqbuRgPQmaDvIJzRnyYjOyL+h8/CBZrCEH0vFH3BjcTNAdDz
         8dWQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="Q9P0/s50";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.192 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-1.smtp.github.com (out-1.smtp.github.com. [192.30.252.192])
        by gmr-mx.google.com with ESMTPS id 34si689647qtz.2.2019.07.02.04.06.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 04:06:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.192 as permitted sender) client-ip=192.30.252.192;
Date: Tue, 02 Jul 2019 04:06:36 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/0ecdd0-877a53@github.com>
Subject: [siemens/jailhouse] 877a53: core: Fix aligned_start calculation in
 page_alloc_...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b="Q9P0/s50";
       spf=pass (google.com: domain of noreply@github.com designates
 192.30.252.192 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
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

  Branch: refs/heads/next
  Home:   https://github.com/siemens/jailhouse
  Commit: 877a533caeffb11d656bb22c88a3727fc64dc1a4
      https://github.com/siemens/jailhouse/commit/877a533caeffb11d656bb22c88a3727fc64dc1a4
  Author: Pratyush Yadav <p-yadav1@ti.com>
  Date:   2019-07-01 (Mon, 01 Jul 2019)

  Changed paths:
    M hypervisor/paging.c

  Log Message:
  -----------
  core: Fix aligned_start calculation in page_alloc_internal()

Right now, page_alloc_aligned() can fail to give aligned pages when more
than one page is being allocated. This is because the aligned_start
calculation is flawed.

Taking an example from a test case, let's say 8 pages need to be
allocated. This means an alignment of 15 bits. The mask here is 0x7. If
the page pool's base address is 0xffffc021f000, this gives us
aligned_start = 0x7. This start is clearly not aligned at a 15 bits
boundary (3 bits after shifting by PAGE_SHIFT). It is exactly the
opposite. It will never be aligned except when the page pool start also
happens to be aligned at that boundary.

In the above example, the address of the pointer returned was
0xffffc026e000 which is clearly not 15-bit aligned.

This change fixes this problem. Add align_mask to pool_start, and then
zero out the bottom mask bits. Adding align_mask ensures that
aligned_start is always greater than pool_start.

Signed-off-by: Pratyush Yadav <p-yadav1@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/0ecdd0-877a53%40github.com.
For more options, visit https://groups.google.com/d/optout.
