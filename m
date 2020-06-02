Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBJHJ3D3AKGQET5PKR3Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa38.google.com (mail-vk1-xa38.google.com [IPv6:2607:f8b0:4864:20::a38])
	by mail.lfdr.de (Postfix) with ESMTPS id 735DB1EBA35
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jun 2020 13:14:45 +0200 (CEST)
Received: by mail-vk1-xa38.google.com with SMTP id d14sf1212956vko.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jun 2020 04:14:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591096484; cv=pass;
        d=google.com; s=arc-20160816;
        b=Rzq7rzl0gYAHpdQaZs4uFMcFoYCb6xBmjhJM1rGsn15DYhDuf/n+0VkjktQtl1n0md
         hnOpiXlyDUSqQVHyxHWTJl2NLI78PYkLHBtItorVCQ9e6hnDAJ9rQFdd6ecCpOjj4+ju
         4R51Uz/1X85I8LKOVvyIZacjqnFB8oiXlo5ChYCURoNaLgrc5eBuKr37uhoKOIg2Bby6
         kJ42343kWfoRCR0+9lXwiB1uCzMco8oUmQaA2IZnPk1fav3JzGScajE+HXcn5oizRwy0
         D6dzAvy2/tvMl+DOG1xWgxM71EKTUCSupiEFXOHPUdabINTY5HhbIeAlWS6N88MBczqw
         IUNA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=uf1bFAzbJuVqR1H+TOG7l1WrC+jKfExle4Rq0lcK1aA=;
        b=iU/7bUY726PRzJaSWPeEeYN0xHIaECTjTSayhCRfWNjAC0p8yz3EGL9tlNh9nME6Y9
         SyOYrQ9ASGHrFKqa7kE9+SVPTPOdJ3heOpwFLO+M9xWGyw4nLd4/vK0nJ+4yEQn6xd86
         W0gBAMmMwDSaz+1ODwfNkTOwkQHvK13HMsujOIq9HfvoK26eiGOxlU88lauq/fulKP/3
         qqJd/5Ow2p+ziNeTwI07P6XcovN4SiJjrceMpq0yqnn/3daFIsVAdPfRarhE3OtScEge
         BW0qx/s0BxaHG3qQipQ4UYqEhUtPaIoO0milJ81q/x3+qRHyTelAiLxeiReDJ7IFvwWS
         KJkA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=eKP5Os1b;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.198 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=uf1bFAzbJuVqR1H+TOG7l1WrC+jKfExle4Rq0lcK1aA=;
        b=UC1GUp7JeIx6E/39OmG+qys2r9VQEzRP8zeX0rgtfSq3wVX1VC+FmtoJVFuCg0G/5U
         LVfk2iCi5G1eeHWDArH6Sj2kiV+HPrw6+A8yxrDM9Plx0ewSy1DIm6WCG4Fo6y5WQUHR
         eaTTiHG4HPZswmSczTOLA+mR0ETjXZ0pxdQBbteQFmgSGprjbe63BwRL5cfnfUfVQE36
         WOJlHU0iv90TAAPq4UFVPZNfIAQsqGXN2uBv7Tm/kxqXEx77+VjJEKNgqUHDvb1rkiL/
         d5ghLLjMdp/1aInQxUXm5KL/K5Z42W/ONq66nAeUK02pyq/j/cmF+/oJSV5gv4j2UdlO
         BAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=uf1bFAzbJuVqR1H+TOG7l1WrC+jKfExle4Rq0lcK1aA=;
        b=H5EXfULmPz2rVzfn9KUmGuJg6OfalBeZvJASSClRd590wNgTqgR6rNJa/eP249TKCK
         88FBAgy5BPiQYCmrM009BdayCmTJXtIDq7EPGh7VWioh5sgGDF04A17/JQUL3ex4N9bq
         LVHHG855QnfYFoEx959XTguCSf6S3e83jMgZVXQ2BIjDjo7R65/0aLIa8bCu0BuN3RUH
         /30Nl1UOXUGS4SS3z1yhxhakxm3REsg5DbObLbZH5xwGBQxyssQ33jHsSeUs8RuStjIN
         WG64M3kSuvPyyAfXtUVWeidITk0y4FN9o1nd/N2UuvOk0qkdiZOvhoTe8sXfJHs3Dq82
         ua4w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532e8Jhv5pkwD7McZK4hj1z6lI8p/zXphpTVzti5ccpyLP1AhAyS
	f0q/IRbUvwleHf0U1QKHSUU=
X-Google-Smtp-Source: ABdhPJxodoRr3/O2OlLJUi6ZS7wxpGg3nP4Wiw1qOVN3w3v4si5M/G/JiAhQNhxhZEeXUXv2AByqAw==
X-Received: by 2002:a1f:24ce:: with SMTP id k197mr17116879vkk.13.1591096484436;
        Tue, 02 Jun 2020 04:14:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ab0:c01:: with SMTP id a1ls297764uak.0.gmail; Tue, 02 Jun
 2020 04:14:43 -0700 (PDT)
X-Received: by 2002:ab0:b0d:: with SMTP id b13mr10659169uak.70.1591096483751;
        Tue, 02 Jun 2020 04:14:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591096483; cv=none;
        d=google.com; s=arc-20160816;
        b=DEtCzVkJx20KEqdR4pwtgM3Or4VQCVqZgBaa0H/DoFq0QIw9U7YGVrtNLjYifn0wAn
         cd4rCue/wfKcgLXi7jeEGjoVyi/tYaiY+el//mCCr2zOc2y8bNVVsGNfPfjLEEaeaJWS
         HkEBWQvBXfLpQ1DF+lETt5d33yicZWrKVNTbdDWxmrCiwRLhMq2Jds65mUQbf/xA2uEx
         JDPX2uM2sMw28kgh5VQI/ShUDKc2CKz2Qbsyg66qhE7w/ExldZbGUcwJq+lYOjx5GOng
         Xuz4Y2gqyT6reSbNB6lemC39quEFozE9b7S23YI2OFhgU5YcIlWGtmu7KQr796u3Fpe3
         8Brw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=X3FZFCLM/cTtpP1CV4bxx3fEgvwY6g/vPc/dc4WoO28=;
        b=Gw0JGfGtjxJQQb7GRWSVzL+62pR/oikcWq41ClMhE6Vl5D+DIriicHjntvPHDvNL63
         Ew5vtYgY8sRxeb0a7z62acOMIZXR1FAm3Zfu/1kCNLHxEeh/c57SVjHqipGzcgqUSqJ7
         VKmONLwJ4jfLTYjuiacZtZ+O6P5cnsYpEF/tozdq5BSsR20jt++EOtEKUfD4X5bRIH5x
         aph8NptgmPvFdR/tDWzNNM6IFwSmVZkMQ3virNVxY85NX/CB9LTiw2O9JKclUg0LLNtK
         N3Y6qywocIxCJpEoOJsMjDPxVb+Yy3rHpLTDQwGM96XMx0vbTuBZHL+GyJ0+J33zEEza
         7ngQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=eKP5Os1b;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.198 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-15.smtp.github.com (out-15.smtp.github.com. [192.30.254.198])
        by gmr-mx.google.com with ESMTPS id i11si274674vkk.2.2020.06.02.04.14.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jun 2020 04:14:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.254.198 as permitted sender) client-ip=192.30.254.198;
Received: from github-lowworker-b19c547.va3-iad.github.net (github-lowworker-b19c547.va3-iad.github.net [10.48.17.66])
	by smtp.github.com (Postfix) with ESMTP id DAF59260477
	for <jailhouse-dev@googlegroups.com>; Tue,  2 Jun 2020 04:14:42 -0700 (PDT)
Date: Tue, 02 Jun 2020 04:14:42 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/d4ab14-763398@github.com>
Subject: [siemens/jailhouse] 647f4b: tools: Add jailhouse configuration
 checker
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=eKP5Os1b;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.254.198 as
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
  Commit: 647f4b9f0f74175466f5cf2a7ffbbefd8d3bc0a8
      https://github.com/siemens/jailhouse/commit/647f4b9f0f74175466f5cf2a7ffbbefd8d3bc0a8
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-02 (Tue, 02 Jun 2020)

  Changed paths:
    M tools/Makefile
    M tools/jailhouse-completion.bash
    A tools/jailhouse-config-check
    M tools/jailhouse.c

  Log Message:
  -----------
  tools: Add jailhouse configuration checker

This lays the ground for offline configuration checking. The checker is
mounted as "jailhouse config check", accepting the binary root cell and,
optionally, any number of non-root cells.

So far, only one check is implemented: Finding overlaps of memory
regions within a cell. But already this reveal a number of pending
issues in our in-tree configs.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 735899bdb3fb7221cd5e991038b35699b76ad90e
      https://github.com/siemens/jailhouse/commit/735899bdb3fb7221cd5e991038b35699b76ad90e
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-02 (Tue, 02 Jun 2020)

  Changed paths:
    M tools/jailhouse-cell-linux
    M tools/jailhouse.c

  Log Message:
  -----------
  tools: Refactor and align help outputs

Make sure the short option name is printed first. Use a few more telling
metavar names. Finally, align the short help printed by the jailhouse
frontend tool with that of the tool helpers.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 99cc98d85f0630c11da35f03a16406f3eb9589fa
      https://github.com/siemens/jailhouse/commit/99cc98d85f0630c11da35f03a16406f3eb9589fa
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-02 (Tue, 02 Jun 2020)

  Changed paths:
    M configs/arm64/ultra96-inmate-demo.c
    M configs/arm64/ultra96-linux-demo.c
    M configs/arm64/ultra96.c

  Log Message:
  -----------
  configs: arm64: Align ultra96 config with qemu-arm64

This both fixes an overlap of the ivshmem region with root cell RAM
region and adds full ivshmem demo support to the three configs.
Reference was the qemu-arm64 config set.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: b26ef16a1089a329f49f8f16612dbac2cc8ddec0
      https://github.com/siemens/jailhouse/commit/b26ef16a1089a329f49f8f16612dbac2cc8ddec0
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-02 (Tue, 02 Jun 2020)

  Changed paths:
    M configs/arm64/hikey.c

  Log Message:
  -----------
  configs: arm64: Fix hikey memory region overlap

Reported by config checker: RAM and ivshmem were overlapping.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 763398711bb8d1c007e51092cbe3e00ed5cdc129
      https://github.com/siemens/jailhouse/commit/763398711bb8d1c007e51092cbe3e00ed5cdc129
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-02 (Tue, 02 Jun 2020)

  Changed paths:
    M configs/arm64/imx8mn-linux-demo.c

  Log Message:
  -----------
  configs: arm64: Shrink imx8mn memory regions to required size

The last one was unused.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/d4ab14554470...763398711bb8

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/d4ab14-763398%40github.com.
