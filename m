Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBOFQVHZAKGQEXQEJZXY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x739.google.com (mail-qk1-x739.google.com [IPv6:2607:f8b0:4864:20::739])
	by mail.lfdr.de (Postfix) with ESMTPS id B72D2160E0E
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Feb 2020 10:09:13 +0100 (CET)
Received: by mail-qk1-x739.google.com with SMTP id w29sf11482394qkw.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Feb 2020 01:09:13 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581930553; cv=pass;
        d=google.com; s=arc-20160816;
        b=Tv9hpDucxvBEjIMklabk2D7PNAYeHxVE8C4lOx/Z+lA1/SF/lyUVH8Z3F3P8zfpdrM
         FXX1Y+oDOgk3ExH8PzjpEL23Dz+RKS/AIykgUXsDntam77OimqMmT6eWUinu24aZ/87l
         QSgAQPsjD1kWY8IrhBJZ2TUyq8rg5DF3ESl27gkCrnpUEJUrizo/TFsUc1+KBpj17Uvk
         cQLyEWZwhEKxbKWKyoPYWa1tL8mCBqh9WE2b7VmfYdR9bj+BtBvri/FkU+gO394axoLp
         nqeEGDYiXfQOE+FWykxU6XJmceVle/+TJ67sfIRrveuQoJyoF8VUMlKga9jHX4Y7s8lZ
         CsWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=8B9c+8PA6py37jQK4gy/Hmawypg9ky5KpFw1JlHqsog=;
        b=sCnph527cqaZd16EQl+/G/INa+kK9PEZg/Zcg0WiXo4a/69pHkyuXm2XEmq5Binxgb
         yWiSFYxpwjEJRfigOdWocinm9VUfnD0Jv3aZRxMZRoILz6sXrWYd46HHLYWmtnA2Pfdq
         zffWp5/wrzBDLKojdAJ54RO/wvTcOiCIbygSCwkD3rkjTB0t/V8BVLpaLJuvKPnXGmbF
         sI9Of64afaTrVSXdlblnWTcMW7K9kQ+o6bRfmWpO6OMEqjXZotGqhKjmE3ZpPJp8lu9K
         UTEXer7SyYaPqvXR9wJ/TBHgWNqj8a0GtRDVTYAEE/b31jxKoWKZFx2b6sPceuEuYqzZ
         k58Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=1Jo9+9GX;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8B9c+8PA6py37jQK4gy/Hmawypg9ky5KpFw1JlHqsog=;
        b=L6dERy0gxovslgp3GioT/F37LkYqlIupBtgueJ16XxSlUXsMw+iF8MQTpL3AdidDnW
         cDy5599Ynr9c8ow3kZzu9QVRkegw1S3TPrdswDw/OThZgdjwD04Sj6MBUl01pkpefq4/
         0WwuTxo0qJ5GbcRcuXQmeL+WJHnz2jKmRUgNyQjFwQGCkg9Nk+HPLnBhevoI90Yz+RMW
         0rLeW1ukb2/Pk3ZRpXB1578WSu9d7/vGCslUkH6bcUQmsRDTGIGYTTJtr2kyBdSwN3G9
         LlbFMK/YCuiGMc26jff/yefBDKhsNqqWzUP7XZRY6TEEYX3jVbKdxtx32vUBQ5lggDpz
         4m1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=8B9c+8PA6py37jQK4gy/Hmawypg9ky5KpFw1JlHqsog=;
        b=IF8KrND/MYVb5L5p6h/OOBOjnxOXpBBz8vNSh+MlB9QQKoyoQCdjplUh5TkLflMaQI
         eo5xOJOVW/NRNnodlnMfC8zy894NsdpuhaXOKxwqMI9QS1F9V/DMUJ5YW8ToHTaLWezN
         GVKWsXR3nopUao+x86/p5N/FKpMFNwX5EoD6/sFWr5zQ7R37vlUXq9Y6E6+VbGh1H/Ac
         opSFfU7sidM8/LzUTQkul+3YrG8h8WKr+0nr7DoH5bv0+8C+7+uXOOrmVEfUTmwaoKZt
         uLZ/O3UfNBvPdHSkpVnJuuZCnps68g6dY0BH7duMVUFN/HttiF8Dijx0mjNUf9B8PDee
         6ZAw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXtHm0047Coq+5xdy8haE5zkYUHJfEYRHs0K8K8bNGTZAYK3SSZ
	wYjnHvFehEgUmHmQg4LDTYE=
X-Google-Smtp-Source: APXvYqyF0dJbVEHj/gaWTGQ5sXWzj1wT5AWtw61YfMIJ939HP2ZU7sYzUNHeWRbwIRYw3N9kq2K4Uw==
X-Received: by 2002:ac8:554b:: with SMTP id o11mr12272334qtr.36.1581930552799;
        Mon, 17 Feb 2020 01:09:12 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6214:321:: with SMTP id j1ls2019016qvu.6.gmail; Mon, 17
 Feb 2020 01:09:12 -0800 (PST)
X-Received: by 2002:ad4:55ec:: with SMTP id bu12mr12027397qvb.107.1581930552259;
        Mon, 17 Feb 2020 01:09:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581930552; cv=none;
        d=google.com; s=arc-20160816;
        b=W/ceckdTn10oIyQYwkCWAaZZRiftZSpG7x6S2zX1awmBqNLSUSf5rjYHF/5eL/m5I1
         niz++kzVI/0yojU26rp9RwW+SQzQwdpg3n3RIzLQrWyFzQjPu0eb6CbD2Q8Qo9EnjP6+
         ZwIO2tSWb0ohUuBjqyqGhNDR4FnX47Y9xa95VNn/nYweXCFyFGJQCJpyLHDCm3w7S9cw
         ThBETngVfK67sMCvuQrzewivQavnZ/fi+xV27JssFXABK2pGPlGvkOsz+f5XAnS6x0uR
         nZU9frYTakJlkuw6dZ09rXAu82ByCqBiRClAva6+TS6HMWOrkE5BEpq7XK8FyEOHYFf0
         BeRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=hEiItx//El0nB9bEeazU9inwWkvXZm+/ixfq26Ps/TM=;
        b=jbGu5cLWp3dqUK07zFSsqDxwrSNPDTqunobFn42PLl1zLMCXkQbzVR9rAAwwRxjfOZ
         n27inAksIDmWqOdpW0Y0Yygm992+3AUeBb23g5oQUQpyz1CjCpYSY/A1DWoXRA81UicC
         mmsKuAPUdZ2an2TFTQMTHodjwaZyoP6u137tePJqMQol1mIHIwirdctGOOQTNjikxIqg
         MX+nx6rDMTrd7XHRfgeFVh2Oo85y28pdWpeaBkgIgKwZjBrPMrHIKG0pzxAZcCnIdEnL
         FdUXuetcMyWvl7if06Qv+kahsuDmYDp+IKsSIWiR+Jb3biMaw1g6YBmln7Rsj+hbaFFJ
         K6CQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=1Jo9+9GX;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-24.smtp.github.com (out-24.smtp.github.com. [192.30.252.207])
        by gmr-mx.google.com with ESMTPS id c19si703404qtk.5.2020.02.17.01.09.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Feb 2020 01:09:12 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) client-ip=192.30.252.207;
Received: from github-lowworker-6b40fdd.va3-iad.github.net (github-lowworker-6b40fdd.va3-iad.github.net [10.48.16.64])
	by smtp.github.com (Postfix) with ESMTP id 190546A050B
	for <jailhouse-dev@googlegroups.com>; Mon, 17 Feb 2020 01:09:12 -0800 (PST)
Date: Mon, 17 Feb 2020 01:09:12 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/096ee0-ca7123@github.com>
Subject: [siemens/jailhouse] 5c5f2e: core, x86: Remove unneeded bitops.h
 inclusions
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=1Jo9+9GX;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.207 as
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


Compare: https://github.com/siemens/jailhouse/compare/096ee03151b4...ca7123a5c58d

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/096ee0-ca7123%40github.com.
