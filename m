Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBINI2XWQKGQELQAR3IY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83d.google.com (mail-qt1-x83d.google.com [IPv6:2607:f8b0:4864:20::83d])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B5DE619C
	for <lists+jailhouse-dev@lfdr.de>; Sun, 27 Oct 2019 09:24:02 +0100 (CET)
Received: by mail-qt1-x83d.google.com with SMTP id j18sf7545557qtp.23
        for <lists+jailhouse-dev@lfdr.de>; Sun, 27 Oct 2019 01:24:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1572164641; cv=pass;
        d=google.com; s=arc-20160816;
        b=a2SB3KaSIDq+EJyTEY7DQ/L63f4h410zbKlchR9H4tq9EL2EbWIhvLjmRPnFUXdpxl
         Dm54ByDk4QqeAUnOytHr/aIo8uL37h3DygKLegi4phuz2k9zfr16uQ2h2HTPclX8ADEv
         BUdWRe6frVhALhlC3WtPSjbde83I67/GRuMUUKvBbYQdV6CezQDJs/rt/gj0N1lZjOA1
         +MpFadxXwLB0ffQHtZGG3T8p3L4qMblDQP9Ucsv8C7/FBZXOK7qhvBgT/tQeIhvvMw5a
         O3uoblSRyho9YQ9Zxx1ao2Hnj1a5xMs92rTxDrJOrg1dz1GXCdyLw4482d83CSD6MpbW
         MzIg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=2EVZ7+zH4sfJTj7yOvRCORglqL5j8qIwQ6NSDJ2JhNI=;
        b=MVOky3CC1bwH24c9fN4FXiaoVgXnsvwP24kbefHeMUCi65InM6+9jkg9Z98Av/dS0k
         QuskQZZ9okI6VIXvjkGrBdeYWXDf0R253Wth+d+Pk2QedUS8183OmH85f+De3mqXapXq
         EBw3KltT/SiADwEsF1SrqJ6CTyH0P8y8yfLsda+c4kNQuuOUFM3izfWvKkdbxiPaJUI6
         IfkwOOYT+JHUyHC/cHrBJVbg/PecWV+Wm4loCOYdt/FqVa68EvIn7Yhyh3MOqJccjVfb
         rXJ2jvRw6+cL9rMgl6sI0z3Y3D9/8BOI/m4weKXzluVnqOLn4BrylYTvryWbLc8rArbl
         uowg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="J/4XN4yn";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2EVZ7+zH4sfJTj7yOvRCORglqL5j8qIwQ6NSDJ2JhNI=;
        b=UIvA+UZ81G8Y77FaZzn+vvExjoC9pI84Kdr/fodz2ozmpxiM585EcDIesovr8XaZrW
         1AI8IdAkn1aYc9GcmqmOgrCJadE00WF1Q4xOCKXMN2QF+vngYgWHmRdLeVuleeJfVkMd
         rqcZpMAuFZgO8zOsdp01wSw5D2siX48mgylBukLT1ae6AAjJibvsIg73aOOH6lvB3cRN
         8oz2KWI4+Zs/rAGKq6LQWPuVt0AYpi0EMtmd0Yd8u0BAQqrkFW8iviP/xETPKlVn9bcJ
         5e4d4b6fGryIDSkrNGE+szfMjyLpIsK13Lt/ehFt51GqhtfT41Vc60h9qTwdYyns6/x3
         /a/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=2EVZ7+zH4sfJTj7yOvRCORglqL5j8qIwQ6NSDJ2JhNI=;
        b=FO4y4M08FCuGGj0v/0p8+1auwCf2qDrsoNQnMIu5a2az44bO/g1n0a01kuTgPXoVdK
         avoX1SUzk8Pr2jRyrCR3kUTiZ8ybdBpJ2yc606LgBktvN4UhkBrEgK4TLZjA/NwX6kap
         LO4Z7iftYaZ7EiadcREppqV7OOisGQfMHovPyxOfnp6x6XE7kYlDCC0zYPVJEnkbC+KS
         FC2jgaHG1No2ZHGmpsdUtdOfstPEhm8q6TJg4R3nWrMTyWnoBf+D+Rmx1RaiMGguiZFl
         lcrCr8aPR4xrKQMphhEESacd9ExeQ8NeaMlyTxXb3ePHJYiYDSgjghhyw/wXfb/15kN7
         Sh1A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVfGNSEVYlhoZXqKlt+2ZkBrbJKLEMeP0IgojMrBnXrbaa018Pb
	7Irif5qGm7qenDGcdjmtlIk=
X-Google-Smtp-Source: APXvYqwa0c9HR5OtnR9/Ev7QETQQCPkGC2PHSCFVECU1eNFPOY4r4sMl1/yIdRuprcGcHqYDOSNrKA==
X-Received: by 2002:a05:620a:64d:: with SMTP id a13mr9206798qka.481.1572164641405;
        Sun, 27 Oct 2019 01:24:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:4347:: with SMTP id a7ls259711qtn.11.gmail; Sun, 27 Oct
 2019 01:24:01 -0700 (PDT)
X-Received: by 2002:aed:30ac:: with SMTP id 41mr12094411qtf.157.1572164641012;
        Sun, 27 Oct 2019 01:24:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1572164641; cv=none;
        d=google.com; s=arc-20160816;
        b=LABYYwzFehUF/zPgmCi1AphMKTVS5oVLuwgM3aGzMxH1bc2TDt8sXrnrDSqz+/zVBX
         Grvi8hnvwnPpBDuwCVZ7cHlpwGR71ajCPs1SYTJsq+UJQCbMpZJP56Mzvfkt6xeSb0LQ
         znifnahsOb1CkCAz6TgLvlVfraNk9tdgTb6/7hHrMsZ1sjN/UEhImUi0jgBRWjjwU8Om
         uPclqDpDG8BJGyDr1oqsQVjqMKE0tYTtCSSRqQREdfwZP8CQHvgHo1u270yUkdgGJ4yX
         ynXIZBushoDlCI9bUgX4XyMj4n2nMXLw8YkBmW7cqdEyL375EVpnWqA+p6kqIeUbQuWd
         Q9vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=jkFDR091Ar0tNlhnRtiPeZLAl7Bcf3J4I1boivFTDqA=;
        b=uXT3MzOT2lNlkFiT6s3yK13Z9cXe6l3v/6engJd917ShLKe3xz4Z6D/SiIfEAVCOf3
         ZrqVETjapoYQ9Oc24yL1AvYsYsYr46ekpWDDGuli1OqjT++PnP+ZLCArD+g/YHa17GfD
         mw35LIBnRVmqTJHx/R67/HDM10YkpFP8BDp+e0yxiDZdxZCGMHcGNYM9Bgb833v/CB7a
         nEi1jiNx3etXcsKTG4uhU4xegUzJDWtsv0xppVsIyTjH+Ya3dnFl1/wnONhhNZ+oq5Nu
         Nh0lHri5fu+MOzjmW2MVmB0iHOMGZC5c8xLTFgtCj+CjTMA/ilgNYrOPBugIX5YWggSA
         0uNw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="J/4XN4yn";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-23.smtp.github.com (out-23.smtp.github.com. [192.30.252.206])
        by gmr-mx.google.com with ESMTPS id u200si93641qka.2.2019.10.27.01.24.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 27 Oct 2019 01:24:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) client-ip=192.30.252.206;
Received: from github-lowworker-25680bd.va3-iad.github.net (github-lowworker-25680bd.va3-iad.github.net [10.48.17.61])
	by smtp.github.com (Postfix) with ESMTP id C89CC6601B0
	for <jailhouse-dev@googlegroups.com>; Sun, 27 Oct 2019 01:24:00 -0700 (PDT)
Date: Sun, 27 Oct 2019 01:24:00 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/a179d0-d6ea1b@github.com>
Subject: [siemens/jailhouse] d6ea1b: tools: Clear KBUILD_CPPFLAGS
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b="J/4XN4yn";
       spf=pass (google.com: domain of noreply@github.com designates
 192.30.252.206 as permitted sender) smtp.mailfrom=noreply@github.com;
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
  Commit: d6ea1b6078602fd2fcdf7869cf3efffad5d42427
      https://github.com/siemens/jailhouse/commit/d6ea1b6078602fd2fcdf7869cf3efffad5d42427
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-27 (Sun, 27 Oct 2019)

  Changed paths:
    M tools/Makefile

  Log Message:
  -----------
  tools: Clear KBUILD_CPPFLAGS

Required to avoid that any settings of the kernel leak in. This breaks,
e.g., arm64 with ARM's gcc-8.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/a179d0-d6ea1b%40github.com.
