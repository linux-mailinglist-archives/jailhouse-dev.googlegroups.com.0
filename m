Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBE553H3AKGQEYRPHYZY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa3c.google.com (mail-vk1-xa3c.google.com [IPv6:2607:f8b0:4864:20::a3c])
	by mail.lfdr.de (Postfix) with ESMTPS id 2697D1EBDB9
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jun 2020 16:13:41 +0200 (CEST)
Received: by mail-vk1-xa3c.google.com with SMTP id d14sf1406732vko.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jun 2020 07:13:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591107220; cv=pass;
        d=google.com; s=arc-20160816;
        b=Sxd/hlxI0M4/noUWDm9vNipXp/TuXwmRercsCvfJTWs5B5HkQAxgaC1TUoYddG0gRl
         78/fITFw1rK4n7OFosiNyascLXK82HzsSauifbMy1MVXdk0pk67GnBtOWXj/EmVQEykv
         RI2gm2Qs7QcvSp9MxFYI+s9TpWkvlLksIziXzKPI8SmX0kq5fWEU9hKuCWSfb+37VbID
         dDb+NBT4WUm5DfofcsuiRA/t7wsIehP432lZXTfvpkyJH5BsJdNb3mFBLOjvT4zHf/d5
         EHuqC78J7WuhQqg7xrcs4LZrqfoBQfkzTSEeCo3muP19r5oreI1cxic00mVdUcc60zN1
         UJjw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=SLz6W9Y27hncvtNFBmXbWgaXAP6H6LHTBZxGuWoz1Os=;
        b=hoRrgtmGlbOD0Xf/bjPgCpzpxHns+vsW8q5LTPu/iEhX5/dUYle3oR3+nIM4TmtLNi
         UAMAfBuSMvtaJGVEZ4V+BMAm2KGRHjs+cOZtTEiPE7ONripGh0P/UUKujNiZhEQDTyVE
         /V+opWmfH9HIcIjaqP48SuexrUHqdQ4DI0+tvfvSW2wtJ1TlcjzaHbhHK4zx+rKjyAZ9
         9w8oXC/yymaTSdEA6EPcAG72upgLFxilo24VaY8sbU2JsrMPhUdr5uy+keeWpKHNPvRT
         QOk9ObJjpXvVFDIdojm9EE7MzYlvzjgqM44zNGAh1cO/aOjPu7OtkC2p9q8cr8yTSFLY
         +EuA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=kFC1dicM;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SLz6W9Y27hncvtNFBmXbWgaXAP6H6LHTBZxGuWoz1Os=;
        b=WgoIlXocrqNXPG8fOlXKLczxJczegek3WEhB0jEF7bwll1KIIUU88LNgA9As/45PwP
         8UZXlYTmP8RrXq9iKByMcJfEDGGP+7Lu2wsGnjDdC6Wbyre1DHnRA5/3x4LFPmonlkWj
         yhBfXubl9bukz9bLBYW1qZpC+u1LfSCEBNZky4L+jXOxXV0N6uz79CWjqCiE7IYuINK9
         h3wEv9uabNgeLFw7y2yTqJOeDVIYkhefOHloWg2wEOh9siJVeJdlv8pOWsyx2rwtFjlF
         KPMg8yU0r+qJYQ2e0lp91DHTLW8HJekpZqIcfR5SNtoAFFWM9nmBxMUY6VvOjkWagf14
         CaSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=SLz6W9Y27hncvtNFBmXbWgaXAP6H6LHTBZxGuWoz1Os=;
        b=lRqhAcKR2Px7LmBDW8o2bRggtkiYGcAtmQsZveuDdbT9nIu++x/7RwXVKZY2hNrgBQ
         JUqpGjoYrHxPEvhxvyA/VbYEUWJ3ADgJEkM2MWuF+hbqsdqq6BvcG5LYmo0fNcox9kXm
         wmV+c07XlQuTymivEigT89YyHuVa0XEZIYjjJSqhqQo2O0ELYuqoKF5+Tmen7KpxrjdL
         lQXlArbZ4dxMpnC2tN/D6+teeU/4Oq2z3zMIhUNCxeARzMFMU3k1SpcBRJDJicAtLJDu
         H850ZNUJ4d2CGo3sA1gDbvPxQa/IATG3HutTpRp5VTbr4ElQaNrmBbeRuaYJxEDOa3wm
         stgg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533CtvnE0mvTdm/sLmTqPhujNmP0MaIgM0vRo/s9F/eFKi0Gb6tE
	7k2vtf9U8YNqdx32cRYbjro=
X-Google-Smtp-Source: ABdhPJxe1QaUiZ6o3u0FNFc6PlEDtpWhPC3KfVKGg3HewFNXeLTvQVDeXRw4usgs8mKUhOYNOf/uPw==
X-Received: by 2002:ab0:1e8a:: with SMTP id o10mr9848969uak.107.1591107219822;
        Tue, 02 Jun 2020 07:13:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1f:a04a:: with SMTP id j71ls753534vke.3.gmail; Tue, 02 Jun
 2020 07:13:39 -0700 (PDT)
X-Received: by 2002:a1f:9350:: with SMTP id v77mr7139704vkd.93.1591107219277;
        Tue, 02 Jun 2020 07:13:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591107219; cv=none;
        d=google.com; s=arc-20160816;
        b=v+U1soV1RcyjN+igHSNL2Oy/N6jAxBCTzYdJOhomXz6u2lZuk9cwki2ncfuP4Ee6Ip
         W9BUJg5Lv94sW5RZF92rBXvulrKjL29mLj36daoaKUv0S/JUXhzZzENndeEjJ4ynM4B5
         y7YRftYIm1/kCc1Ta5pu7ENQ7BRete+jCFIxdqboLIXQYOM+8CC5bEyheobqOONf4Lqf
         PhcOPvuYwLFoDkFvid0TTyDvOIEd2U0O3Ff3sbOWxedvbARZAIz+8bdRmCvoyU1RbfUV
         S7Y0tcnJRPCkQg+TI44vey/z1KjgH6x8iQ2fyXDES+KzaOI2CZGyVyHIwQ7BPZQzEqI6
         mDLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=RaYJr4XM6bfZSvuARxP3QPx9gU0GiCW+OvX0GhtHqKA=;
        b=Hfk+9PkbbrDkGa0ckY1XmMAalTcjqvXQl/l5z/8e2rX+rgejjirx2iBsjjrNgyy7t8
         nRl60Ri7NSRzDPp+RSGhB4VXjo+XhdL4bnHufERU1ZcgjomwDfLw+gGwkhSPkbaHcFvq
         p1c7Tdd8dyMZPn9FvlG1hxcFMDapL5oLd/cm96qa3spGnGvtsJ0Fb2TH7nWGxRpldnR5
         6yheKluc5BijZ14dCWrk41JkPyx+5XzW1uCn0j4JoXJrN+I3vUkHtG/Qcj+SBbhPBRvx
         PogY886jDvZ0tKh+AWbhKdFV0cW/1k2l9FvZl8Mo7PxZsiJGRw5kdVHJ7seMuzgSdEPV
         NIrg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=kFC1dicM;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-23.smtp.github.com (out-23.smtp.github.com. [192.30.252.206])
        by gmr-mx.google.com with ESMTPS id q20si159439uas.1.2020.06.02.07.13.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jun 2020 07:13:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) client-ip=192.30.252.206;
Received: from github-lowworker-275fa97.va3-iad.github.net (github-lowworker-275fa97.va3-iad.github.net [10.48.17.64])
	by smtp.github.com (Postfix) with ESMTP id EAD7D661145
	for <jailhouse-dev@googlegroups.com>; Tue,  2 Jun 2020 07:13:38 -0700 (PDT)
Date: Tue, 02 Jun 2020 07:13:38 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/763398-015623@github.com>
Subject: [siemens/jailhouse] 68401c: pyjailhouse: config_parser: Add
 SystemConfig
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=kFC1dicM;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.206 as
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
  Commit: 68401c86c58700c207069a9c423c2a0ed5bb7126
      https://github.com/siemens/jailhouse/commit/68401c86c58700c207069a9c423c2a0ed5bb7126
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-02 (Tue, 02 Jun 2020)

  Changed paths:
    M pyjailhouse/config_parser.py

  Log Message:
  -----------
  pyjailhouse: config_parser: Add SystemConfig

Add parsing of system configurations. This is so far only processing
essential fields needed to validate the structure, extract the
hypervisor memory and access the root cell data.

The root cell is parsed via CellConfig. As the embedded cell contains no
signature and revision, CellConfig needs to be made aware of this mode.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 7b384de640f64a259086b900d4693b63558cde75
      https://github.com/siemens/jailhouse/commit/7b384de640f64a259086b900d4693b63558cde75
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-02 (Tue, 02 Jun 2020)

  Changed paths:
    M pyjailhouse/config_parser.py

  Log Message:
  -----------
  pyjailhouse: config_parser: Convert memory region flags into ExtendedEnum

This will allow printing them by name. JAILHOUSE_MEM also inherited from
int so that arithmetic operations continue to work. Ordering matters so
that string conversion is provided by ExtendedEnum, and we will only
fall back to int for integer representation.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 76b4537408f5864961d422e02fd0c52f94d3be91
      https://github.com/siemens/jailhouse/commit/76b4537408f5864961d422e02fd0c52f94d3be91
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-02 (Tue, 02 Jun 2020)

  Changed paths:
    M pyjailhouse/config_parser.py

  Log Message:
  -----------
  pyjailhouse: config_parser: Add pretty-printing of MemRegion

Will be used by config checker.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 818fd975706850a640ef20bee12a5d386ec63c29
      https://github.com/siemens/jailhouse/commit/818fd975706850a640ef20bee12a5d386ec63c29
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-02 (Tue, 02 Jun 2020)

  Changed paths:
    M pyjailhouse/config_parser.py

  Log Message:
  -----------
  pyjailhouse: config_parser: Add MemRegion overlap helpers

Add helpers that check if two regions overlap in the physical or virtual
address space. Will be used by config checker.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 79df6c32d6fbdc649b3a781128ebcbd3ff6b3d79
      https://github.com/siemens/jailhouse/commit/79df6c32d6fbdc649b3a781128ebcbd3ff6b3d79
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


  Commit: 4f16acaa71dcee9087610921e7dab69fc9dc7ef6
      https://github.com/siemens/jailhouse/commit/4f16acaa71dcee9087610921e7dab69fc9dc7ef6
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-02 (Tue, 02 Jun 2020)

  Changed paths:
    M tools/jailhouse-config-check

  Log Message:
  -----------
  tools: jailhouse-config-check: Add overlap check for hypervisor memory

This checks if any region in configuration set physically overlaps with
the memory reserved for the hypervisor.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ee7a9ef7b4ec087a36d8b1ca21d8495728bfc6c6
      https://github.com/siemens/jailhouse/commit/ee7a9ef7b4ec087a36d8b1ca21d8495728bfc6c6
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


  Commit: 95392673a20aed22dd7323b4c098022a729828e3
      https://github.com/siemens/jailhouse/commit/95392673a20aed22dd7323b4c098022a729828e3
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


  Commit: 0a2212a06dff9de94548c99979fe83b5de7cff38
      https://github.com/siemens/jailhouse/commit/0a2212a06dff9de94548c99979fe83b5de7cff38
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-02 (Tue, 02 Jun 2020)

  Changed paths:
    M configs/arm64/hikey.c

  Log Message:
  -----------
  configs: arm64: Fix hikey memory region overlap

Reported by config checker: RAM and ivshmem were overlapping.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 0156237196f6ce4f3fe808ffa0f5e1ef86cba2a6
      https://github.com/siemens/jailhouse/commit/0156237196f6ce4f3fe808ffa0f5e1ef86cba2a6
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-02 (Tue, 02 Jun 2020)

  Changed paths:
    M configs/arm64/imx8mn-linux-demo.c

  Log Message:
  -----------
  configs: arm64: Shrink imx8mn memory regions to required size

The last one was unused.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/763398711bb8...0156237196f6

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/763398-015623%40github.com.
