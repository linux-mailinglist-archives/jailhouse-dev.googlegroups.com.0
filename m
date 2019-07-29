Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBYOC7PUQKGQE4CAJBQI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43c.google.com (mail-pf1-x43c.google.com [IPv6:2607:f8b0:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F23878B4C
	for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jul 2019 14:06:58 +0200 (CEST)
Received: by mail-pf1-x43c.google.com with SMTP id 6sf38361479pfz.10
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jul 2019 05:06:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564402017; cv=pass;
        d=google.com; s=arc-20160816;
        b=Np5RjXx34dD1NqJA471d6JXHyT5Vv5j5nQ4ekreVGJunrHVzGsSiMhPqwMtPZffMoX
         y/4P7GRllcyAoBM82uL+htrAFRGUA0h+kWMdg2RROuWpQwaK3bhrAvJTTuk9tp8ZboHZ
         ZvG8YT9/t4c9KqeJRKjTgpn3oZhdHZO7be3ksYSOv85GHT2Mr2WxyedTsg0aILtgrtDe
         4lVJKOSIaq0Uii0lvY2LdJE88zXVAelxOssTOli6oY5yI0aP88wJAewPKxXvOOkPGrhU
         TQMFJYjWOanDKLIiZRa836VTHCtM/OJ4C/AqmF5vUwcgvm/aZO5FF6tQxtt+TqoKT49j
         m71g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=6JT/T/+79sEodYG8SuwzTGYWERbhBB2JMwRjMhzlHhY=;
        b=viUToXcfV8LNGMIJ3ezc4QImBGzABBZhPQwUU8J/NXJrThETkL9pvYyvP5M7y9iOy2
         FnMrjuNl1UxqmGfp+0FrHz9b18rK8U7/TK+BNSpe+hUsuIQKhGnstJ+XFXbqFGY4/NLf
         cPu2YYrpezVtlHKYrcP6o6P+CVT9BtsrqotjAq3W42ZBDJSZsY5DUja74ZXkKIDA9Tiy
         d0xVOGhsdYS43SuiKTk8wlFIt6vCcU2C7o8FhlloRnCLm4BaZXsz/OkFOfb7yMIgiu/U
         RyA0bAgEVhek5sp6IpIsziYcLN4/ALuF7HvjLM5okAIvKrKpLDExjV5xs7tdA6GJ8Ec/
         l33w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Xg96AyYp;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.194 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6JT/T/+79sEodYG8SuwzTGYWERbhBB2JMwRjMhzlHhY=;
        b=rii6CAxDZV3k8SKjn+wcxV1wD//DH4ZfQX25X5ishPIshecyAmlc/b53u8MVLtXiFV
         hjDd4MxDOiF9OydXv6PDs1Uvow2L9+Z9c9SJDpepIohF5AZKlusXY8uQ9N/gRfD1xRy6
         7NnJVjHI2xSLPmbcYhrcc8d0keA1urFpOFhO8ZsoGETMZv005Ak3mpEwgXp7n5JygmP/
         9C2AbJAIGcW1JfqNGJ4jqPn3kUp9pNsmhC0gHu08ysyiRtQOyWYtZ7R5nSlPMoOHXnmK
         nJ6oCPiO20fljEYqL3W7LjZgrYegVUQwcOmxPZEatelFCmRKoiJGsUtDzm/yPnTz4+t7
         3dAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=6JT/T/+79sEodYG8SuwzTGYWERbhBB2JMwRjMhzlHhY=;
        b=XfY4OQd/ct5qy8hB6jypDxvY++q1TqryKH3gxXKzPZUItqtjS3oxlCSpP5hD1Spsq0
         9+HhO4L4Wuzc/1DCS3UQ05bEcRzFs3ejQ1Y7TRRhT4/S2nGVaOpY2mt5kgeRz9pTDpkt
         l9Mp3zJQ/AkOr1B+ob0iVJti4fqvEdjEJCZoyIvjp7C033y6YDt3hPeaI9kB5sjnHbVT
         0k/6hn5JYRM197zm75pXhr5ieS0fi+hB3O6irG8gJ9PR6OYUVwxeSSXv2kOxcLMddOqs
         p8jb3S+HXnSdMbTOJeKW29VUXsWCRFoc5LriFo1QUbXZBMQg3KI+VtWaiw0STd8hf8uL
         GRkQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVdQXOf/D6MiM8yYobgie7LCi/Z1+9hq0R2Unt/y2bhAfIt0avJ
	y8cyyyi+AFOu4Wov1bnUgIQ=
X-Google-Smtp-Source: APXvYqy5rcgY5nzqGgAzMjiq8081QzhouCRK5Qxxu5IYjaHGN6UYcVpTgWqifq77g/tZQ14N6Zw65Q==
X-Received: by 2002:a17:902:bb81:: with SMTP id m1mr25980688pls.125.1564402017175;
        Mon, 29 Jul 2019 05:06:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:3aa7:: with SMTP id b36ls21170378pjc.5.gmail; Mon,
 29 Jul 2019 05:06:56 -0700 (PDT)
X-Received: by 2002:a17:902:29a7:: with SMTP id h36mr112411181plb.158.1564402016755;
        Mon, 29 Jul 2019 05:06:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564402016; cv=none;
        d=google.com; s=arc-20160816;
        b=rGp0EDt+hpmyf9DQxPXWanEFOPivHBrdObedlcpKpterIgkTuKVtt+RJVSXBwNKiH9
         Y81EE+/Uq4KxhGvY1rQ9S4m3t5GpUjg3YEmdyw97OfMeuFg6KkrTXUwqrED1cRmwvT5U
         0OFbwWzHpE+7o+DF3WgOeV1VcehYid1EETH1UuPbtQaCxSqIBb+/ATcP7f7VbgCpXzdI
         N3U42q6juM3Z22Vslh1uGiIt3BtkFLebbuc1lcDHrZVGuI1lqY8AwbSw5qdTUAAlZwqN
         jBlq1cbm4onckrwTZ+9J4NgBPoV10pq7JLaxVxqnshOiA86dnfmqIAwBalmHrM6zpNiK
         V/6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=EnTywc+JHfsPE9bAUKtxYdIYP5rLEiNiaPSRdHW/zsE=;
        b=OuNv74HYPFw03rKFGEZS8jc0TKQPT7Xt5Gwg5cylrrNK8i5+rU6hD5c+91WknLjF8U
         lG/HIsjGfRma7fGOCsqAyH8kROtY+EDDLQOkdZseoCHcBCN9x/vhdfynXBJgM5QIYQzY
         Tdgc04/yhwAqCjJsmmtm8cWSw44uim4l+5e8Nxjisvm3/fYdKikWBlknE3mKtf4Ps3U8
         1lbfB4JCcImTDccsc8zuekrhz8PU/6qApbTxc8zbRd8EIiMx1/56C5fdJOv28H1+/E8T
         8PRiBP2Q5acefAC3h/FaRDJAtHCfWeXT1BTv5OYSmLqDkRpwCHiMmv9ThUWxVRzmhzG1
         CGyA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Xg96AyYp;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.194 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-3.smtp.github.com (out-3.smtp.github.com. [192.30.252.194])
        by gmr-mx.google.com with ESMTPS id j6si2882363pjt.0.2019.07.29.05.06.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 05:06:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.194 as permitted sender) client-ip=192.30.252.194;
Date: Mon, 29 Jul 2019 05:06:55 -0700
From: Ralf Ramsauer <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/ce661a-dee9b4@github.com>
Subject: [siemens/jailhouse] 6adfa0: tools: jailhouse-cell-linux: Simplify
 calculation ...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=Xg96AyYp;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.194 as
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
  Commit: 6adfa0af9d1772a9bfa5d2d3a54bb5263a3596e0
      https://github.com/siemens/jailhouse/commit/6adfa0af9d1772a9bfa5d2d3a54bb5263a3596e0
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-07-29 (Mon, 29 Jul 2019)

  Changed paths:
    M tools/jailhouse-cell-linux

  Log Message:
  -----------
  tools: jailhouse-cell-linux: Simplify calculation of setup_data

The magic constant "25" makes things hard to read. We can abandon this
constant if we let python's struct do the whole calculation.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ded106d6e583775fb8f9fc704bdfa3181351ac95
      https://github.com/siemens/jailhouse/commit/ded106d6e583775fb8f9fc704bdfa3181351ac95
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-07-29 (Mon, 29 Jul 2019)

  Changed paths:
    M tools/jailhouse-cell-linux

  Log Message:
  -----------
  tools: jailhouse-cell-linux: Add support for pio_regions

We will need to parse pio_regions in the future.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 5c45b67ebc7dbdeb959a750d52f226fca48d37ae
      https://github.com/siemens/jailhouse/commit/5c45b67ebc7dbdeb959a750d52f226fca48d37ae
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-07-29 (Mon, 29 Jul 2019)

  Changed paths:
    M inmates/tools/x86/linux-loader.c
    M tools/jailhouse-cell-linux

  Log Message:
  -----------
  inmates: x86: linux-loader: Enrich setup_data with flags

Reserve 32 bits in the setup_data for additional flags. Soon,
jailhouse-cell-linux will use them to indicate the availability of
platform UARTs.

We extended the features of the setup_data, but didn't change the
semantics of any other field. So increase the number of the
compatibility version.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: dee9b4544936cd5c18759c06967f0d52fe147b16
      https://github.com/siemens/jailhouse/commit/dee9b4544936cd5c18759c06967f0d52fe147b16
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-07-29 (Mon, 29 Jul 2019)

  Changed paths:
    M tools/jailhouse-cell-linux

  Log Message:
  -----------
  tools: jailhouse-cell-linux: fill the flags

We now have some space for additional flags. We use them to tell Linux
which platform UARTs are available. Linux can use these information to
setup only UARTs that are passed through.

Note that the PIO_RANGEs for UARTs have to be one consecutive
PIO_REGION, e.g. PIO_REGION(0x3f8, 8). Split regions, such as
{ PIO_REGION(0x3f8,4), PIO_REGION(0x3fc, 4) } won't be detected.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/ce661a1b2ea6...dee9b4544936

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/ce661a-dee9b4%40github.com.
