Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBLNRVHZAKGQERZ7VHNY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd37.google.com (mail-io1-xd37.google.com [IPv6:2607:f8b0:4864:20::d37])
	by mail.lfdr.de (Postfix) with ESMTPS id C78BA160E2A
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Feb 2020 10:11:10 +0100 (CET)
Received: by mail-io1-xd37.google.com with SMTP id z21sf11377035iob.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Feb 2020 01:11:10 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581930669; cv=pass;
        d=google.com; s=arc-20160816;
        b=CE7TLnjtRT37bfKdPs0LWLQzAriPUDX2xWoS3viNtC9aeE9mh5Vw0ynZd7j6VPdTmy
         MQHbP0UQDdFx80Yr7tO9319B/itw/fZmIxGaD7f14X60ei7YTeER0LiDm/JIxw4pLDzY
         MWclhouZd7BbxZ30EvSpe5o5+IZsac1NXR5rQw4B3NOHMLBrM210PTTiYdvoudcINtbu
         7G1G1RL205Nhp3S/fI7VFxr+b8mza/6JYgJVCmoN+LIujsyj+c+imjCVlVPm2yGZZq+Y
         PU/CkvZhQbPYWI51LoMwJU3uKLKh6hpiMoVOpFdziD3/gRLIQGrRqOI+O5AwtP3ofOqC
         f1PA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=jnoAEMbGo9HfqH9JTyBx6OLzK9gwYOIyj9regEB37iY=;
        b=sEDcxk1JWHdIq1XfjZ1UXnnsnF3A1iTYK/sCgHHIn9vzRk/fe4A0EyWFSwz5zfDGKC
         uH13RqeiYA3LdDjCGYBjS4dIlHLwHk779ebOwOdu+1RAXeEytqSjiMF0pXbMpYe8i1vu
         qNbIhChDCVartZuo1NUa0LhRc3kY8+9LthLOKn2oymqEKjxj8k9n+tzoEoDMOPCOldEx
         fj2J2k5MkxQ66aEb+bKzIC9941XHp8N1A/FR6ZXyHIJ77bixZCDnajmm68WYI/ScmeNo
         wmaSf3PyRdU5tyH3B7K3YiWMsUeSdZSgJf1bQsAapiA//vTygRvfdL82TKpp2UoEzLuT
         E7GA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=prpXKSBm;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.211 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jnoAEMbGo9HfqH9JTyBx6OLzK9gwYOIyj9regEB37iY=;
        b=tNISgKvxbtP+wto8YnzfodE4CbP8z41hvwn7D43tEM3/ALNwjJwFcm+6q3QGDhQfif
         W0dO1MecomptM1dWknmnXv2CQkt2syLIsimogyPopf5q3wFtvGZctmYzOPIZZPynOVyu
         j+/eEIvpvkUn9ImS1FrLup7GXVL98/lhBU+2HWpumAIdY8nPbb/rZZSYXmA2OVdUkh0U
         OGHcSToUOFYPmjMZ0cgnVX/1xDAldQvBiXduBGma/cZwwiUc9VHH4/m/s5z99U5JHMOU
         k0itssk9tR7BL0W72cX4IwXlNGoAOUvrrYRR1pbHqIGzybGODg2YYtYIbboCBnmBxrtu
         dX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=jnoAEMbGo9HfqH9JTyBx6OLzK9gwYOIyj9regEB37iY=;
        b=E/FWWKsLVpP3PSlT5iX3tw3Og6HHLiUhvua4WVgA6zREkwzV+GfFtutconD4UVhKz/
         2dDmQKmEWhM+onc9UmPL9WtxKWc9GMCyi1AoxCFLz9c/j/snzRWZsVk8ktK8kzpJNrU3
         gkz9OIOJok9miHoJ5m4nVDc7LknN2GjZ6OQvPk2rw/0ReAoc/9+ROZB6SRl82J37z0m9
         rT2G1CnsLfzMeoW4zIgqJ0lALmd0JF1bYswv/VwswL6LhvMjHsB4XqmzgK1mPxcuAzgT
         qeb9WJw1khRdvz19tycn0EPa0ra/A3bFBKUvmqBdofxCchrAJ0+R8W0/KD9KNwhj1Nm0
         uTAQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXmcUd6LlC/HS6Yl//wQOBge/5k5BwA3XyqalmGb5mFKmbWDZ9B
	iLw/NQb/kKxqrIhBE8ju+To=
X-Google-Smtp-Source: APXvYqwRbIX3ImF4yZvMpnMZPplH0KGio6E6b1dUHGNQnKc0C8jo+Tbc0oN/BiV4k7ZsOGlQdXIzqQ==
X-Received: by 2002:a92:af46:: with SMTP id n67mr13619104ili.195.1581930669529;
        Mon, 17 Feb 2020 01:11:09 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:9057:: with SMTP id v23ls1784048ioq.5.gmail; Mon, 17 Feb
 2020 01:11:08 -0800 (PST)
X-Received: by 2002:a6b:cd0e:: with SMTP id d14mr11047846iog.272.1581930668691;
        Mon, 17 Feb 2020 01:11:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581930668; cv=none;
        d=google.com; s=arc-20160816;
        b=lUM8W9/0xuzPn4ZG8uJoLLX9q/9RJXxSfhBhsWDRNf4vF8aITQ4NRkwPVq5dGyJgIh
         WZYu68iLAyuG9V7bwDYZOUwA9RLI902MkvYM9b8JFDvk9waoaG+ytp+01NBF/nJ75zOx
         g/qITKFo3yIzG2cVVaVhoHgCkS+k0z9U5exgH9JvLetXpUQvsmNiGCnsbRV4on7J4ePg
         MjiTa/OYMklN8b7q87CU0OCcSNnW6+x8fMMCDx/5igwv2DjwWmZD3y1vy4/09gXNtWUp
         T9u1ZREA17uqDWIS5y8XcjZdKAkP52cHh9MqlnU8iPtOmlTbW6n/NYMuDEsI83DLa1m4
         Tf9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=XT7VhWyEeWAozd6fvn6Go0paW0ahbzEuuBNISkNBmQs=;
        b=bFtUoDnzlu3KQmNHTquGc6PlDPMrITyCKwUMcID4MhcB5JdBaiyHkOV9q7bx1fnALW
         X3puxdUZ9xD44WV4SwDQaOH8rOrWfFL2XTFnt72Dg4mL5eaKZtkDAg8aQwYB0dCDYfqX
         afKKHkgR0vNJZzujFDte9vEsQhGvklN/SN/1322IpYSZABpw9FOfDHwxRYK70PsKpI9P
         yKp092pF/6YJKMKz9rOBBgE+RcA9fl9Ud/Cd4YsNC9Ig3drwSIKpniEjC3kMSz9wxWCq
         FMwNQH130zW6ig5Lu/0oovB57RZNAjRNLcIKFf0xi3HHZ0bp+MzXt/mGhWMaISYIdgkm
         hWxg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=prpXKSBm;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.211 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-28.smtp.github.com (out-28.smtp.github.com. [192.30.252.211])
        by gmr-mx.google.com with ESMTPS id k9si806044ili.4.2020.02.17.01.11.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Feb 2020 01:11:08 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.211 as permitted sender) client-ip=192.30.252.211;
Received: from github-lowworker-ca5950c.va3-iad.github.net (github-lowworker-ca5950c.va3-iad.github.net [10.48.17.57])
	by smtp.github.com (Postfix) with ESMTP id 3A61F8C1160
	for <jailhouse-dev@googlegroups.com>; Mon, 17 Feb 2020 01:11:08 -0800 (PST)
Date: Mon, 17 Feb 2020 01:11:08 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/a519da-ca7123@github.com>
Subject: [siemens/jailhouse] 25787d: core: Reorder CR and LF on debug console
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=prpXKSBm;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.211 as
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

  Branch: refs/heads/coverity_scan
  Home:   https://github.com/siemens/jailhouse
  Commit: 25787d78f88b97819c8769e296d4e1edeca68647
      https://github.com/siemens/jailhouse/commit/25787d78f88b97819c8769e296d4e1edeca68647
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-15 (Sat, 15 Feb 2020)

  Changed paths:
    M hypervisor/uart.c

  Log Message:
  -----------
  core: Reorder CR and LF on debug console

Unix tools like awk expect Unix ordering and that is different from what
we generate so far. Issue the CR first, and then the LF.

Reported-by: Michael Hinton <michael.g.hinton@gmail.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 096ee03151b45c8ff0ead2da1cd605be74fbceb8
      https://github.com/siemens/jailhouse/commit/096ee03151b45c8ff0ead2da1cd605be74fbceb8
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-15 (Sat, 15 Feb 2020)

  Changed paths:
    M inmates/lib/printk.c

  Log Message:
  -----------
  inmate: Reorder CR and LF on debug console

Unix tools like awk expect Unix ordering and that is different from what
we generate so far. Issue the CR first, and then the LF.

Reported-by: Michael Hinton <michael.g.hinton@gmail.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 5c5f2e20c53315e4604c07290e9a262bbba35dc4
      https://github.com/siemens/jailhouse/commit/5c5f2e20c53315e4604c07290e9a262bbba35dc4
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-17 (Mon, 17 Feb 2020)

  Changed paths:
    M hypervisor/arch/x86/apic.c
    M hypervisor/arch/x86/setup.c
    M hypervisor/arch/x86/vtd.c
    M hypervisor/control.c
    M hypervisor/paging.c
    M hypervisor/printk.c

  Log Message:
  -----------
  core, x86: Remove unneeded bitops.h inclusions

This header already comes with jailhouse/control.h which all require.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 46430c0f31887600ed4f11189dec4e25e1901fdb
      https://github.com/siemens/jailhouse/commit/46430c0f31887600ed4f11189dec4e25e1901fdb
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-17 (Mon, 17 Feb 2020)

  Changed paths:
    M hypervisor/arch/arm/include/asm/bitops.h
    M hypervisor/arch/arm/mmio.c
    M hypervisor/arch/arm64/include/asm/bitops.h
    M hypervisor/arch/arm64/mmio.c

  Log Message:
  -----------
  arm, arm64: Move sign_extend out of bitops.h

This is arch-specific, and it only has callers in mmio.c.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 1c4c15399f736c49be665ca7af343b90cb448108
      https://github.com/siemens/jailhouse/commit/1c4c15399f736c49be665ca7af343b90cb448108
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-17 (Mon, 17 Feb 2020)

  Changed paths:
    M hypervisor/arch/arm/include/asm/bitops.h
    M hypervisor/arch/arm/mmio.c
    M hypervisor/arch/arm64/include/asm/bitops.h
    M hypervisor/arch/arm64/mmio.c
    M hypervisor/arch/x86/include/asm/bitops.h
    A hypervisor/include/jailhouse/bitops.h
    M hypervisor/include/jailhouse/control.h
    M scripts/header_check

  Log Message:
  -----------
  core: Introduce jailhouse/bitops.h

We will share generic bitops this way.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: e2562f696de236219f5fba88f64bbe6fb08c4829
      https://github.com/siemens/jailhouse/commit/e2562f696de236219f5fba88f64bbe6fb08c4829
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-17 (Mon, 17 Feb 2020)

  Changed paths:
    M hypervisor/arch/arm/include/asm/bitops.h
    M hypervisor/arch/arm64/include/asm/bitops.h
    M hypervisor/arch/x86/include/asm/bitops.h
    M hypervisor/include/jailhouse/bitops.h

  Log Message:
  -----------
  core: Make set/clear_bit generic and non-atomic

No caller of these functions exploit their atomicity, and this should
not change. So, simplify the code by using generic non-atomic versions.

On arm and arm64, some macros are folded in the only remaining user,
test_and_set_bit.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 84844ce64639ff86ca42d8ea2a2b7d437f6ef9be
      https://github.com/siemens/jailhouse/commit/84844ce64639ff86ca42d8ea2a2b7d437f6ef9be
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-17 (Mon, 17 Feb 2020)

  Changed paths:
    M hypervisor/arch/arm/include/asm/bitops.h
    M hypervisor/arch/arm64/include/asm/bitops.h
    M hypervisor/arch/x86/include/asm/bitops.h
    M hypervisor/printk.c

  Log Message:
  -----------
  core: Rename test_and_set_bit to mark it atomic

Prepend "atomic" so that it becomes clear that this and only this bitop
works atomically.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ca7123a5c58d6e698c5349f29dfbac9a44e5e459
      https://github.com/siemens/jailhouse/commit/ca7123a5c58d6e698c5349f29dfbac9a44e5e459
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-17 (Mon, 17 Feb 2020)

  Changed paths:
    A hypervisor/arch/arm-common/include/asm/bitops.h
    M hypervisor/arch/arm/include/asm/bitops.h
    M hypervisor/arch/arm64/include/asm/bitops.h

  Log Message:
  -----------
  arm, arm64: Factor out common bitops.h

Most parts are shared, so no point in duplicating them.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/a519daf7568d...ca7123a5c58d

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/a519da-ca7123%40github.com.
