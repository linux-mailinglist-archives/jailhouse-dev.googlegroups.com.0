Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBLXMYTYQKGQEZDDXIEA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3e.google.com (mail-yb1-xb3e.google.com [IPv6:2607:f8b0:4864:20::b3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 246E214C6EC
	for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Jan 2020 08:37:20 +0100 (CET)
Received: by mail-yb1-xb3e.google.com with SMTP id g11sf12129726ybc.10
        for <lists+jailhouse-dev@lfdr.de>; Tue, 28 Jan 2020 23:37:20 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580283439; cv=pass;
        d=google.com; s=arc-20160816;
        b=Uq345sr7T/8B7KrpWGRwyNf7lXUFImTSGW1aodi7ohS9dBx67yaSaQsiecsox91vvr
         T64SyPzm101UQmsVIiMO7OQ2kzkoMsdM2B64vy2UnaipPzD6eo5Wm0PJkMf7+OUJl1lE
         Jv4g+onHd4bj+AQkmYBQ2ottt7vRMKPYzMUEqx29xeky7rS/iuX9rYLoEJ+jDjfnermV
         xqhtzAh7085Ir8TXdrFIc8Col5KvUjgjfTVEcmQpG5dM48bqn1CE6VoWG3ls2O6POjF3
         nvoJmBIHbCM8QYmOw3VCAqgtK8G3V8xf3JZL1b5BoyxUPetw2PVGuvWMm40mBdiZBwcx
         JteA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=AJ23LEx9fC+s49fQxUfB0/M4Wr9Un+B4COVtSJAWYn0=;
        b=OdJv8Z/OYbA+CJouKy89HSL9hZR9SVVkUB14Vjxpo8aBgZ37k4bYINxGR9C1n32H0n
         n9sthUzwhlogY6YG5fJ2WYZxc1yxFx1twnCHg4jhsoAQ6xvzGEBIitMQbfwWYdXlbcoL
         OR9JWVzNOWQJyEplAo0QiTEcu688XfjJNvM1IzPhVY0YHUH1CB4XD8K9Xl/z16MxYwc5
         I+JzWVlSm4Vg6Gy4VzfkRj1H5U5I/QdIZ1peC8bZk92NGCSS/rmyjUoNotY0f8WA+eq2
         NswIilYCqMV9L2EHT2DLFSItHOmaBhsFhhPJXWmXNr1B4/DmotroQn20nlX+7BDB09Hq
         2myw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=LzXEELoG;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=AJ23LEx9fC+s49fQxUfB0/M4Wr9Un+B4COVtSJAWYn0=;
        b=FsGAZZADmCLZl3WPTZb10FREZ6hoi/D3RKvRUjiZ/U0nIZgXnsK8V+7KsX6wmDLSZJ
         hfJUG6IA6Q8bmNeI/6YmKW+siwVL7s6nipdj/Jh6yE5sfWeRcFYOP4WxnmRQ7RDxJ059
         5tGesPoodz1TVwTWsjObFoKOsF51HtYoFU+JUdzSVxr60feZzOa1s5ymXnds0thXsSdf
         rx/B0qPzogxsjUNUs8V9RwcTZXIOSKaJzlhVqFhiF2kInsbcahvJL/TJDodhUiXAUtBZ
         2tfN8WGjGjTImKddSdqywIJ1SbUtUDg+HppGctmkee+7TuIEqy68o1N2pBGnjos3KyYv
         QcZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=AJ23LEx9fC+s49fQxUfB0/M4Wr9Un+B4COVtSJAWYn0=;
        b=KGXjQZzVFMHBDIfbL+4qq7IIDJlkvtTprQBfctV2q4aETbHin+1XB7eyNzb3i2kBH1
         PWkJPiQOKAqfMkdl7aNtslp0u1nSD9WsV4r93JOL2S51mEmzgJRSSGdaHuJZzoVL5PnM
         PyDiJZIXv2pq5m9j8DXCVQLN55L8W3U7HB6vNuI44SckP/bCzQG0UAolWzdQN8dFNSut
         +b2V9HdCPOaRb9v1Hzzk1o1t6ICT10mOhXdGcOJitzzNGzOSaGWY1mJ6y2GuVDOuQtdA
         TnrozJU6gOBoDMjnYQCEXBpICSJCPEQdq1mXPxOra64AhfkJz24ELbjK0X/Cu1cqlFwH
         /QuQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXUbMkge9PdD/PwHIgiriETE/C1M2IKCPBBPxYTHqJmpr64z1Z9
	0fB5tmC/xljAMt0+LflfSHw=
X-Google-Smtp-Source: APXvYqzJ5ZGqvl/YD7B/UHGEs21O6tJc+k/NuKdtlseaq1rBmyfbJ+wIcCJN/ZqnWQuKejMb2ZvhZQ==
X-Received: by 2002:a81:3d8a:: with SMTP id k132mr20332771ywa.111.1580283438848;
        Tue, 28 Jan 2020 23:37:18 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a81:cd7:: with SMTP id 206ls3350394ywm.4.gmail; Tue, 28 Jan
 2020 23:37:18 -0800 (PST)
X-Received: by 2002:a81:368d:: with SMTP id d135mr20332004ywa.2.1580283438282;
        Tue, 28 Jan 2020 23:37:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580283438; cv=none;
        d=google.com; s=arc-20160816;
        b=PbneL+5WqZwE9jDIrVDwb6NGs2g7N9fm0kpgokM689/2c66renkV1JlHZuWcCt4sqb
         yM/ogXgK/KCFSdIkHLiYhWVeV98yKWEwBksMsynIxP1VemcQG25cRdz9+iUprnPvZ5cc
         GENweq7mUaGOz7q1CD/CwbYNt0+gMZOQhkJPCqb96Xuy1RxLYKQVn96NFxNvZKPlyqNe
         ZY1I7OQ/+RH2+kWiZao8EftMa6m3bO/zMiicOD7x16brFWGk/ni4A/ebRG5eMv++1HYU
         tOVgo64t3rH/RjoBy/a2+lxKOv58j/TrWyui7LiY2RsBa1+V+uXjMRT5lRTDr3nrI3f/
         x4qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=agyioCF8SNZEOmQbLVap7d9Ue43Tp5AOMUtLUKsQjZg=;
        b=TRynuQ1GxDRg7v9j4HjiZHnxOlOnIVtQzqPSXXSfOUGWlmx1RNiQcq9XLE3JIJdZUe
         yniuJwUxOq3mBHcWgVTm3cwYb/KM3GlqDkYegIEhEPEq9wsJFoWouvFVesuGisQGAt6j
         NwULpPd+D8L4+lkzfL5RUwqSEj/J/ofBoICyt/z6ijGE8Wk0aelRL36JbKn7cPejCn2D
         sdV43f2vmuq7FbMT7/mec0U8RNAAQNlZHpbkCmqyuvLdZNH0q5+KD7oC3EWGdnifMl+S
         LdH7OG2H/ZSZ8P4kVbtJ9qD39CgMNch9CM40r/oPUsk6/sw4bvHNaB768RSWpAENRLNQ
         qWBg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=LzXEELoG;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-19.smtp.github.com (out-19.smtp.github.com. [192.30.252.202])
        by gmr-mx.google.com with ESMTPS id s131si97404ybc.0.2020.01.28.23.37.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jan 2020 23:37:18 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) client-ip=192.30.252.202;
Received: from github-lowworker-b19c547.va3-iad.github.net (github-lowworker-b19c547.va3-iad.github.net [10.48.17.66])
	by smtp.github.com (Postfix) with ESMTP id 094BD5208AA
	for <jailhouse-dev@googlegroups.com>; Tue, 28 Jan 2020 23:37:18 -0800 (PST)
Date: Tue, 28 Jan 2020 23:37:17 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/8c51dd-3814e3@github.com>
Subject: [siemens/jailhouse] 3814e3: configs: arm64: Remove vmalloc from
 command line hint
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=LzXEELoG;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.202 as
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
  Commit: 3814e3a977987a782db3e9a152dcb707e3c82e33
      https://github.com/siemens/jailhouse/commit/3814e3a977987a782db3e9a152dcb707e3c82e33
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-29 (Wed, 29 Jan 2020)

  Changed paths:
    M configs/arm64/jetson-tx1.c
    M configs/arm64/jetson-tx2.c

  Log Message:
  -----------
  configs: arm64: Remove vmalloc from command line hint

Not needed on arm64 because it starts Jailhouse differently compared to
arm (tk1).

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/8c51dd-3814e3%40github.com.
