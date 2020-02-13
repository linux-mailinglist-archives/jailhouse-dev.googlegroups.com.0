Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBJV6SXZAKGQE25TVMCQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x53c.google.com (mail-pg1-x53c.google.com [IPv6:2607:f8b0:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DFA15C076
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Feb 2020 15:37:28 +0100 (CET)
Received: by mail-pg1-x53c.google.com with SMTP id 71sf3046336pgg.23
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Feb 2020 06:37:28 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581604647; cv=pass;
        d=google.com; s=arc-20160816;
        b=gfnvloKoVXewelPRHaiMOlsVq4T3Tib363qpUYekkAzPvryoFb/iIUAG89XjS3O3DZ
         03lqpYA42cIi0Co50chHMW1PHBszlm/Ll9w60DlFmYrstTkGGV+XFBJXPMHuqZMmsKIj
         jswr6PFvgWEoXZhZIw+UAgLyusXxHbzLqOJ38RB9/5/OJGaExeMrLIlAo+Qi+PZ6d2/J
         KU5ibQtWvsEdh3B9V/X5WZNKanThairdV8X7BdD7HzhQoB5YQIDmuVlyqeFy2leWID80
         6+JZqjWDaYyylpRL/w/CSVgfGhxZJDyyLrlRKAZGpgL697bTkqkaIStY4WawzTwOvn35
         StXg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=Klwexfj8qCiTvIWlZ67oGIUg5WIbYmtGUTHe8aCvGH0=;
        b=rAPPpNDUHySTWTmHOq0ii8vYC+V/9Dm9YCHB+gpws9/UYbgoyGAp6XtN2fXzhMGm2h
         n0zN33Xeajnc/eI4pVvCNwtkkNLYvtDP7bSM/jE6SXu1dqv97ZHHGDwoXC2y8qCDIx9C
         oCEjlWyrFbai/wuJHiSiPOuaWE5L6g1o71csxgFmcHQA0ndKoVYJ3SZ43Yv2iTs9RBbV
         5sC5oO13YT3Tt2YLnOb4JqaY/XEcvln+HEnPPYe/3f9BMSu/MKdgrguru/I5K4bnq5T6
         o78lkLIIkq8i7VdEVDGMtIV5YmDbC2w9WaWFOLsmurIufaxyuHjl37ksJyEicu+XCMEs
         n7QQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=0F0QBsPb;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Klwexfj8qCiTvIWlZ67oGIUg5WIbYmtGUTHe8aCvGH0=;
        b=k2tBGzasjOWbizajIGqQYasbKIhPwkHQIvlWH+6Iu9iFr5HSNPsDL0TtJhlJk+MMwI
         1EdVshbJ+Pc7NCqtc/QycF0vPVca8jgF8jPBURhEQ2H7+lCiY/997Suq2lswOkpkFrrL
         NJjYvVKw2Lhs5N+6ozq813HuyZykdMtxj1osReO9zBFZIr6gwSpF8YtVEPEgmZnrP+6y
         wWgDir0UW5oekAyiEm4W0rbJwWtz+6u31/nLUrzVPEiytg+l9S3GJrO0IIrmEe7JD0j+
         0lREQAwaRkV8Z7VAOEI7vxzhdR6Mzy2MmHhETrSeiWZJKwHHvYBthlHFgZ+FiyKBA1Io
         Oc/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Klwexfj8qCiTvIWlZ67oGIUg5WIbYmtGUTHe8aCvGH0=;
        b=ekHG2HQzn8JO8oe8nNrmMuwfTZ41EJelrbDUfuNkR+23q1YrPGjiq0r94Gf4FcGIIk
         g+KmHJwbMSzAB2WAs/8WOS0w1wLpsKKW57/6APFUnfKTeKOXVFmnLtNwvRJslysdAxR8
         sgKICZ4mbjgTU+35JJOxTVa5GK6u9d32Wx0PhPjPr2ccQHfYAROnnQ2QwVVb7BDW1sWx
         kuH8HbOeDtOUrieqTdFZML+cOKiT4GH4hiiDjHq2cqIa3zIPvqHHq/eTxUtmxOyb+spB
         DUW9xuNkY+j61r91RfXnYDXs6bgcv/o3qQgtaipdV3Z103p+vUpuCf536q+RjUY3mx60
         JTpA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVETyEgG4SQHax7aCAYdAB/6lRTfLG8GxsmFN2Jh1epTR7o4VMF
	4yWYhChUom3+/DmatqnOmK8=
X-Google-Smtp-Source: APXvYqzqZ67b05Vq7eWTjlrUaEAGzmH6D8KsQogCw7TvHx7WLKZocIZUS12DAN+YnXqJIpvwpOJ3fg==
X-Received: by 2002:aa7:9f90:: with SMTP id z16mr17851502pfr.161.1581604647232;
        Thu, 13 Feb 2020 06:37:27 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:b789:: with SMTP id e9ls9314946pls.4.gmail; Thu, 13
 Feb 2020 06:37:26 -0800 (PST)
X-Received: by 2002:a17:90a:ac0e:: with SMTP id o14mr5750565pjq.11.1581604646317;
        Thu, 13 Feb 2020 06:37:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581604646; cv=none;
        d=google.com; s=arc-20160816;
        b=PXtfWRMVuTLI94xFAnNbBIt8c+3XDrifvVO7HU+Sm9/fE6ppoeSiGatUyQhHHFbKml
         zl49KHJkJVeMLbOS2kAdrEg4mDd0ItGhcEgFcXCM34Tqxeq1oxOCd+1AfQBIypt7fhYz
         Ln1AczZplFg6gHITOsfYo1mqYynSTPosEMr62amGFmD1i9XXrlfhVdtkLF4OswCXOt0Q
         tR3nbxlA/XYS9bZRuxOmhUTP6trjTLP3qD7dPgcnPwEJmFue23ZiKs5v0/SnE2ISnYDz
         4WdgKWEu8GB7JBEdKiHMT5G9gBAjW7SyOi2UtKO8I7jkaiWY/voiIbGGfQg2ao8QgLkw
         DTHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=2P9wuYM/P4DGPqwd6/6XNzlFFGvrtOg/Y0kTQB3sGOs=;
        b=tXC88l54vpEd7GPJ9MqG/VdEPq+1M3uUP/bQeyn0dp0c1tblRFlPT47U2BJ7r0fQb+
         NAnh/iP+vPvJeSUXpdbirSwJpAFWufRHiB9staHAK8Vv0g92euvGOQgJa9rWQBmVqugm
         oUDx4SyeIEF5Xj7sndb3iaUwzWyS4augMxYRbnoAywfeCrAI8Z6oIm9ni58xHprZ7Dlj
         5m81T7k4G9zrpVg0Q3M9dA8McNGdE5LX5nczMoQJ+W6EJ9Lb/Dq5dm7qUFNf9Fa0HZgC
         ZxVGHWIkfrSvzN854OZEB+aDHj7CzDqfGq2IDAVayNgH/88tlvEefkeg9HZhHUKBYT3j
         babQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=0F0QBsPb;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-18.smtp.github.com (out-18.smtp.github.com. [192.30.252.201])
        by gmr-mx.google.com with ESMTPS id d12si664485pjv.0.2020.02.13.06.37.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Feb 2020 06:37:26 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) client-ip=192.30.252.201;
Received: from github-lowworker-6349a71.ac4-iad.github.net (github-lowworker-6349a71.ac4-iad.github.net [10.52.18.20])
	by smtp.github.com (Postfix) with ESMTP id 787626E08A6
	for <jailhouse-dev@googlegroups.com>; Thu, 13 Feb 2020 06:37:25 -0800 (PST)
Date: Thu, 13 Feb 2020 06:37:25 -0800
From: Vijai Kumar K <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/eb101d-5dbdcb@github.com>
Subject: [siemens/jailhouse] 870022: configs/arm64: Add support for
 pine64-plus board
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=0F0QBsPb;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.201 as
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
  Commit: 8700228123cb881477c571a125bb4b79560d9166
      https://github.com/siemens/jailhouse/commit/8700228123cb881477c571a125bb4b79560d9166
  Author: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
  Date:   2020-02-13 (Thu, 13 Feb 2020)

  Changed paths:
    A configs/arm64/pine64-plus.c

  Log Message:
  -----------
  configs/arm64: Add support for pine64-plus board

Add config for Pine64+ board.
https://www.pine64.org/devices/single-board-computers/pine-a64/

Allwinner A64(Quad core A53) + 2GB RAM

Signed-off-by: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 783f206e0b49f121a043429a8e0dff73baa5f8b3
      https://github.com/siemens/jailhouse/commit/783f206e0b49f121a043429a8e0dff73baa5f8b3
  Author: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
  Date:   2020-02-13 (Thu, 13 Feb 2020)

  Changed paths:
    A configs/arm64/pine64-plus-inmate-demo.c

  Log Message:
  -----------
  configs/arm64: Add inmate demo for pine64-plus board

GIC demo and ivshmem-demo are validated.

Signed-off-by: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 5dbdcbc720c94f79913b1c1b966f87d314d333b5
      https://github.com/siemens/jailhouse/commit/5dbdcbc720c94f79913b1c1b966f87d314d333b5
  Author: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
  Date:   2020-02-13 (Thu, 13 Feb 2020)

  Changed paths:
    A configs/arm64/dts/inmate-pine64-plus.dts
    A configs/arm64/pine64-plus-linux-demo.c

  Log Message:
  -----------
  configs/arm64: Add Linux demo for pine64-plus

Add Linux demo with 2 CPUs and 128M RAM for Pine64+.

Signed-off-by: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/eb101d0d853c...5dbdcbc720c9

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/eb101d-5dbdcb%40github.com.
