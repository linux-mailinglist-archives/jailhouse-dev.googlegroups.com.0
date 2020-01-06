Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBD4AZXYAKGQE3X6A5KA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x739.google.com (mail-qk1-x739.google.com [IPv6:2607:f8b0:4864:20::739])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F3113135D
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 15:11:29 +0100 (CET)
Received: by mail-qk1-x739.google.com with SMTP id c202sf197893qkg.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 06:11:29 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578319888; cv=pass;
        d=google.com; s=arc-20160816;
        b=TRYFyh05lKZon7e0YcOaxv9LXhfid8jKL/D6J5PTCK3fSfDGoSRDhEcKkp3DsxcPsz
         WoGJc/IpqBUsM8i2NdKL0ow2mzHpVO/uqaH9ttLJEtFPcLkULBj+b9DhyqQlzqqIvCCg
         49dqR4XcT6kHPwhfZLTP+mkpsyV8aY/s503wM1FBh6Kp33aEBB2VHYF95x6zwh5Dsf1W
         Yy0hgYF+F8J/EXo8sQfhU55Vo+ClpC4+inw2mHrWzdPHiCt6oKDeCTSM4lbs2O3Ls0Cq
         UXO510z/NORtYPJYQMrDzsKc70rWvWTfBzzo2w0vdpVaz3DkepBiJUlHEmJ6yPjV94N1
         3zLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=liQYc7i/vmZRBxTaXNg3ipAW5GGyPYob7nlX945lGGs=;
        b=ZI7GozM6L6gfzRY3jhiExRA4Z7s2iXaqdH+8rR24Qau1CEoGljofG+60I1+6xLj7Bf
         68oGIewwDBuZ0Tro5uRop2dUfzsIKZuVpXO+SSgBqwc0YO0BedAwWKkuvfC5b7ucew5i
         O0dXKsFrbIO1sx6dkUAm2fjsmeaEBuPHVmOVKg+xgVemoCm7seCaaXgUt6cSCradrfCR
         2VEyZCp+OVgnxyPkM+u62f1St/5WxaFsS0gRjYo4dztcweimel9dh+7/D3zhrRfgFcId
         cBAMsP6YN4ScuA55I0Nxc60bTbq6xcsA6knHwpEYVNEWxmfdO1ZNZRjq/ktFWqi+7p9X
         EhHg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=NJUvfJks;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.193 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=liQYc7i/vmZRBxTaXNg3ipAW5GGyPYob7nlX945lGGs=;
        b=efYJ5ATT6sZEloW31snhHP7gSjFVBApBPhDx7+8CMvWDwqogIi6gDc5kOB6t0S1FX0
         pHG42Nwh6Z0vU9iERnsYLBU7lra6HnfMvrcbl0KiasoAW57BVtSvIUoB/ZlSQo2MAbjb
         /7n0ebhC5i56lC5euba/2mqzxjW6FjStYnXkstuklk0fzJ/TdHkPrDPpZUN3SNzUYqX3
         uwWYZEsI5gntSqo/EgSG4xypNKUB+MuC1VJ9LxHDyEG7s3Gryw3WjApRWz1xbRFzx750
         s/OewU8adjQit8roHLThI+8GMPkuaUTnSBACKldu5YDSb6cnX5LQMSBktwqed//GNxo1
         wMow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=liQYc7i/vmZRBxTaXNg3ipAW5GGyPYob7nlX945lGGs=;
        b=Ci7LekXTEDGSouZbB8eRzKPiORsYPGVHeXT+JCSUwMvxLyemI0l4goJuIj+OO3UEtE
         Pu8lwq0um3nT4c2opY3lj/qkQfE+hYDi1WA+GUv7RYjsXnq4KHnSkmM6a8ccH56QnElP
         jMxr2e+pmdMGJio7P5E4Fv7X/GjDAZCa1Sskgq7ETM0QVUYF0UYxbldpV/aGFZSsUg+A
         XSYXef+MwO5EyZ7zIH3Pk+Ylgf3RqFd8g6RtMoLu5O6r+fenaNd7lSrc64GN4Lv3ixTg
         IfIW2/HHR8qT8jhew9asgIjMBenyjYkdphv8hZ929pAMIQ6TsBGWJuDRp72zYQuFFTQ4
         wWpw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXpPLgfg9jT8Rid1dHwCK+ZEFJkbhnkSRiqvUVgBeogpHtZDohv
	8cXzGX6NzlSEEB7sr1XXLiw=
X-Google-Smtp-Source: APXvYqxRyHoI8bscXyskitRQCYkFurBl1gDqpofaMZNLeaqfCI+joAbeHSO9qQ9T567kf5d0jWrkMw==
X-Received: by 2002:ae9:e519:: with SMTP id w25mr81584273qkf.260.1578319887999;
        Mon, 06 Jan 2020 06:11:27 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:1a68:: with SMTP id q37ls6472599qtk.6.gmail; Mon, 06 Jan
 2020 06:11:27 -0800 (PST)
X-Received: by 2002:ac8:2fae:: with SMTP id l43mr76966417qta.118.1578319887438;
        Mon, 06 Jan 2020 06:11:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578319887; cv=none;
        d=google.com; s=arc-20160816;
        b=UN7GFVe8kCY/uhTxLuujTJviO9JRtbCQ4hNyYXYCL4tBySvHuOgNqWBqyRMLbEFSeM
         pEIG9EYMtNc47mOiYJokNhOjj7GbRglyphDUiZef6LqHlUBPuC+KaL3cVs6KOSWjstmi
         tbtzKOdXu0wxuNhy21aKb2Q2qxwDW5sfFwgXEAautT1UI4mt1W6rgx5+UqLSx6FNJEHq
         H4MIeJccjBmF9lhtuCQOo0zMBTTX6yyLyNyMGyuy8GD2SGNnJNaranCqiGJg6ezymCUB
         tGo16mLkt7ZKw6H88kUClohHBwy1kQZC0bwF/ZjEXCGmb0YGHKI3oCg8Tba3PiYKcUos
         8cJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=ck1RXGFx1JU8fiAIvTRFZwLMpPcsxvXr43yqTLp0sNM=;
        b=JNd2DywBotWmBqVYJ8XG0WL9RRhucqfvgeJurVWTGT61NxFVvX/G1tO3fV8q/0x+or
         JSQwMv7d1gFfa/qr2PcNYRA+jCCRjqj6neIrWS9dclRG/x+VDya3cG3UxoPvjwBEVFBH
         F9J3e+TJcw3i6xWYdtysj6D/7xZkHVeNZg8e6TSUDyeF8IisIBqhyL1K9YLijFjgUwmz
         rwoiNpBX35zs67thsMU2t15SZnHJ/AcxdfT5lj6DJyvdEipVQstuYj4cUO1jMKct7Ie/
         XG9nG5JosddsXH8DjKwIuh7w4zuIAn7CoUxRa3eacNLoeli1ST7kjTirCxJPWzhLtMpk
         DDyA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=NJUvfJks;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.193 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-2.smtp.github.com (out-2.smtp.github.com. [192.30.252.193])
        by gmr-mx.google.com with ESMTPS id z17si2271086qkg.3.2020.01.06.06.11.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 06:11:27 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.193 as permitted sender) client-ip=192.30.252.193;
Received: from github-lowworker-cd7bc13.ac4-iad.github.net (github-lowworker-cd7bc13.ac4-iad.github.net [10.52.25.102])
	by smtp.github.com (Postfix) with ESMTP id 4342A1C0A02
	for <jailhouse-dev@googlegroups.com>; Mon,  6 Jan 2020 06:11:27 -0800 (PST)
Date: Mon, 06 Jan 2020 06:11:27 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/c316cc-6a8ab1@github.com>
Subject: [siemens/jailhouse] 6a8ab1: Documentation: Describe ivshmem demos
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=NJUvfJks;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.193 as
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
  Commit: 6a8ab13d6f2ba9f47173bdd19bd966ef4c1aea9f
      https://github.com/siemens/jailhouse/commit/6a8ab13d6f2ba9f47173bdd19bd966ef4c1aea9f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-06 (Mon, 06 Jan 2020)

  Changed paths:
    M Documentation/inter-cell-communication.md

  Log Message:
  -----------
  Documentation: Describe ivshmem demos

Handles all currently available demo cases: ivshmem-net, ivshmem-demo
and virtio over ivshmem.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/c316cc-6a8ab1%40github.com.
