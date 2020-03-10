Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBNHCTTZQKGQETQFRZ4Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-xc37.google.com (mail-yw1-xc37.google.com [IPv6:2607:f8b0:4864:20::c37])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AB117F06B
	for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Mar 2020 07:18:30 +0100 (CET)
Received: by mail-yw1-xc37.google.com with SMTP id i81sf19235117ywa.19
        for <lists+jailhouse-dev@lfdr.de>; Mon, 09 Mar 2020 23:18:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1583821109; cv=pass;
        d=google.com; s=arc-20160816;
        b=GexuLsBCNkjqO6knWZAr7LIjNmDRYW1FIubbEPj/2Cvmp8FC0utO3GpgWwuVWJQzN+
         nH8HKYpy82n5OmjSVT//YyLIGF1aR+Cmn0cjmU5kRd0GC7SXP3IaxGkgxgjUw8J+cSa9
         lbEBpqHQ/QnIFNnWJbAnn5w9QgBdKJTp9BuhkO7BttsBZl/aBJ/WhmFwq8ntSu4CUT4R
         kjuoM18qmC6PPB34BUKNp0Rex+R5jv1lgKVZSEGy24UT0pppWZfmCUcjtRBZn694+XTs
         sbX+JLC4eEiB4M+CoIsSk5ZvWInv97l7nz/fTomklFkG6A0XV/57j02kh6HKM9ecjoTL
         G7Dw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=QgHWE9tSNHVFclJFhwYu5v+lR3hD5NO4cdivqD+5VPY=;
        b=q5bq7xHBAPrq/kM0EBSWB9N2RyFb8sw7uewtJLcODsrUOmmD9ATyrxEzw3RVi2cnQO
         XwzwA6rCTcIXsyvqf3mcoXzqm7SF3rwU1lpg8tz5+5HohS5Iz8vkK6yl4E0qZTPQsfLd
         xbmTB+V3ihvBWmSkTfYumSAnzeu1n9jpNE9hB3tziFHZZ/5/aL/5eg8V5S9JUvkO2QPO
         r63OidM88RoyZArZuUcHKpGjNVFQg3fxtYA/2XT5i9gLvUjrTGIm5Ozmhm/bjs1xIl/z
         rOVTRExtzpEijyBXI974+I4uq2Shfxv6RLikwNl5+l+Ie+qKqr693a0P6zvr93vU6evB
         2WJg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=yoZPwbdM;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.200 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QgHWE9tSNHVFclJFhwYu5v+lR3hD5NO4cdivqD+5VPY=;
        b=pKUbEnTxWmrKJqfyUGqAHKtPYbYUOUUpCzQNsftwJcjb0ki973945zpCq61Btqh0sg
         B2NQXuMZBjqoRkLCGl3OqqtAogo7Em7iFRixW4js0qRGLate2fsIT8LrdR9wdNQcFULR
         5VQC56uZdFaLdi8b3QRonVJbemHqMLoomWb1ctDrpS54HLKXVzbZDkwDNTh1+8ht9zAE
         YL4WGgHOGOrV7cgeLlPHExEhG4UK5zTFq3bZl+F02bA1ut8b1Lpb36x/7mcW6kXx6WaU
         81pnWf9s5HTGclm4o5HwCVvwWzSWG5hHJfvY/xogl/LDSkogMejREx4Yq8ZASfKja6j+
         su3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=QgHWE9tSNHVFclJFhwYu5v+lR3hD5NO4cdivqD+5VPY=;
        b=ezfbr3YH/a5iZ+UXbhvi8/uPE7joIcPBhPzYXwTXJj9wahIfkfq8ZuSLc40wVyuIP6
         bPo7eqDK7TX0djORGElT0q36OnRCJfLuYFV6Elmv1msffjcvwleJnuej3Xp5gEn0oBf7
         1Xn5IAAZOcQyu4yXpaUOUjJHnQWyPWuqYrG16DdEScMhGs+anH/6g1BOJA8TjIkLfmVc
         FPXUivhCyB2pXo/N7nUyYcLV/7CscN4G/nQjfdcXc86OygrBMJPRkGYro1Y0RumbHa3w
         2iQmrVk1uLZYa/Z+Hh7XBMys7QyUTrUmWRV9yWe2qFH+P22iFtiCjn+86+49DLhipMTs
         sCYw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ1m5vaww3aeWxWp2F/Fg8d9LkkRhWD3rerrKum+7tM2q0dFpot0
	9SABpEwxBk6cnQYpOOoW3dg=
X-Google-Smtp-Source: ADFU+vuB8nMslx2rNW1CdyXYPiuI0ZcaiNrh5fp0QF8TeLElFOixwr6+CvB0IRNuwBww7znVI5Ch+g==
X-Received: by 2002:a5b:d03:: with SMTP id y3mr16792934ybp.469.1583821109089;
        Mon, 09 Mar 2020 23:18:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:ab94:: with SMTP id v20ls3385620ybi.0.gmail; Mon, 09 Mar
 2020 23:18:28 -0700 (PDT)
X-Received: by 2002:a25:d887:: with SMTP id p129mr21710038ybg.465.1583821108351;
        Mon, 09 Mar 2020 23:18:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583821108; cv=none;
        d=google.com; s=arc-20160816;
        b=OTbZWZpSUt/6GzQNe/mAbVo0MpG7+Yd/7JottXOrMqMdVZHL6a/3h+4Unku4rp9UDt
         YK6Y0WgZ4TvGw//eXWO/7fAOJYeptZhmvK2E7tsk07beKKkEBvW90dfh5yi5zcr1zEif
         0TuokdcxHnoP4MSn8zkkl+hPeiajawA+jekYiCdpREFwmRiKjuIHdvxbpIIwtmrSIQ6s
         2F46D2WdwfQqqygRpb1cZWOPt5Ddc3nFgSw6tmDmvEJFNblAaut5Z1k96LBTEcAPu0vY
         jVlNZzbAAju3Uob+WJtiPyX8Deb8BMEIGQgSaHKr3OkoweA9CvctaeVBSJDE4x4CJiux
         u1hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=Q7itgfqdXZTsczBNfLCju7rLHps/ZgxstUN1Bk60BX0=;
        b=OGSo4broQQCKMBBHr0/Q8QpLtLn0MChO06pnlZdCAfDEd7KLFOEShP0WW5IeyAP6Vs
         QPt6wKmJLhk6OgMeZGaJa5zelJ/l/8uzf8rCU7LMLT0KdvQBhAGzL11iTm6oyOtwXmxB
         UEIwrcCmr9XGDAC/30uAH/I2Zd+5LupcxUC/KZs/ARnSJdFpjCPnTn22BKxb5H6isA+f
         4ykffo1RP5aSMVcSnCl0iOdFxlkplJ2AwGlA9ZSuuFkSaZTBAGIOyo1V6CpcE/EtwEJb
         dCQIVHEM4tS0ClwU39+M+4p6OjP2Ksp8YIv2Qe4rTOLREKId+fQWlOKjuLGX7CiXvCGV
         6vfg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=yoZPwbdM;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.200 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-17.smtp.github.com (out-17.smtp.github.com. [192.30.252.200])
        by gmr-mx.google.com with ESMTPS id u7si927737ywg.5.2020.03.09.23.18.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Mar 2020 23:18:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.200 as permitted sender) client-ip=192.30.252.200;
Received: from github-lowworker-d1d6e31.ash1-iad.github.net (github-lowworker-d1d6e31.ash1-iad.github.net [10.56.105.50])
	by smtp.github.com (Postfix) with ESMTP id 208DB6E04A0
	for <jailhouse-dev@googlegroups.com>; Mon,  9 Mar 2020 23:18:28 -0700 (PDT)
Date: Mon, 09 Mar 2020 23:18:28 -0700
From: Ralf Ramsauer <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/368ff6-421fcb@github.com>
Subject: [siemens/jailhouse] 421fcb: configs: arm64: espressobin: tune comment
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=yoZPwbdM;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.200 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=github.com
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
  Commit: 421fcb1f99cd1fa59a4494368550b2288cbfcd25
      https://github.com/siemens/jailhouse/commit/421fcb1f99cd1fa59a4494368550b2288cbfcd25
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2020-03-08 (Sun, 08 Mar 2020)

  Changed paths:
    M configs/arm64/espressobin.c

  Log Message:
  -----------
  configs: arm64: espressobin: tune comment

This is probably a c&p artefact from macchiatobin.c: Memory on the espressobin,
1G variant, ranges from 0x0 - 0x40000000, and reservation can be done via
cmdline. Adjust the comment.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/368ff6-421fcb%40github.com.
