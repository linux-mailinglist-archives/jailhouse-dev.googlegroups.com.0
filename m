Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBCET42DQMGQEKDJAJZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23a.google.com (mail-oi1-x23a.google.com [IPv6:2607:f8b0:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C82D3D2662
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Jul 2021 17:06:49 +0200 (CEST)
Received: by mail-oi1-x23a.google.com with SMTP id w134-20020aca498c0000b029025a12f99699sf4137132oia.16
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Jul 2021 08:06:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1626966408; cv=pass;
        d=google.com; s=arc-20160816;
        b=xYYESMk6gTKXyaKvPoJoOPjpvjj2PeU+e7Mky5txv32YoG8hGMLaK/G1koV4wr5epL
         vzBuFGN/l+O8agLYdikl0Su0795KKXUvqptIMZhXpZ/Bv+XwDTRosF4a1t7CU7f/vBPA
         hZRZHS14gb7LP2LB3Y3yo2jEGHmZl93y+LJQSnLiyvfQaI4XRBnuDCLx5ulipK+OOacN
         odoSC34IUa7EQ2XTIbsOKfsecFHNVCtkKgJPTY/utXemBmf6tZqGyuTgzuP0UlgY8TDX
         VBTVRA5mn01ZeWlmZTiPINrRj6KE+1TOOt3hUbfhbdUwlS4aQ6qGihlVkuM5u8+uT7qt
         wKow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=BVF4hI0AhJD90oDtE6m2qKvufTCoyZxdSVc7Pe0YJhQ=;
        b=Ko0yQNR5rk9XqBfwi6bZVqsW7Mh+RmVQApGicU8WID2+16X5IiLlr3UPEqFpw84nO6
         ipwGSHU2p+VMo+Fb3CSDt81mmY686EvUhwhMQpnCFkDyzHOKez+dw4PSZb1jVApkI8YV
         hE6usS2ZLviesKxc+Rvuqs8UPyIvOQF9R4VBwQoAcyV1hBsko5l5JJN6zF4wM1nAGpl5
         0nYt7fGuoaztR7xjVZRcOLAYedanYmsGJMT2Bq6OeSIc4prk+PqaNdNX4x3MZTYk5YiA
         jmyoIQCc7psjRBX1+CRCoBaqLJIIlTX84sCdLH5zzJs/olaylWpkW06HJCt29fEIeEjO
         vjmw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@github.com header.s=pf2014 header.b=x2eDSm6M;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=BVF4hI0AhJD90oDtE6m2qKvufTCoyZxdSVc7Pe0YJhQ=;
        b=e+ANPwodKWRABv3LxSx/K5FMDhn+LOTOdeT+JKRMxiQ8Bd/p2eHQUFHe5fHPzTFWtT
         xN9DMZl0KUnOD/fm/Pg2co8MU7PyHX55llKgZR/bU8TEdSgBqR3Ns7tyvBMrHvAQAakY
         3tmCw8KgCB2oVOm2lzUrzQDyxcwjqamE2CngVjXc1vUJEmhSxevP59iYT7cIxoXZGD5n
         BLmyJWgqy0rRKWt+4Ou6osnE382I+W60YFpLESN8O2/0QUXvQML+s+lK3kul+m/c4jRz
         WI03542z5NSd+GBvzNAiooky3jrOl6SHDTcKEVHhPlvXBvVuwNBtOZmFQGobopasEw7e
         WECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=BVF4hI0AhJD90oDtE6m2qKvufTCoyZxdSVc7Pe0YJhQ=;
        b=NeqywsZr5DarIgHPIKkCoOK0ncbIsa7w0GJH/5khldMRVDx2MeYCz7oSQ0WW3PctpY
         1dpWeljaPJwD5O9o5EoFKmJrhx+U4qXNhgdafGD4iyr78NvZ41V+XZx9lY5wzAgg86h1
         HoP3tZrNSzQJQg/PvrNHftZbQasp7bM7ZKq7hFlzquBKnMl9EvJvZPNHZTNpUA2fcl/6
         Ro6GKWOFh5tjIy7zcEaAQ7dtMXiEhDsGcMs+cKbBzc9JnQYY5zSz5V7rJtM+6G8oj3P4
         lKvNaKupUvNJW8PmsaVClCvqGJfA5aY/gdUc74mqyHkmYpnYgNwURQISTWk/AnY2V8ES
         gXvA==
X-Gm-Message-State: AOAM532QHxjxqyFD43gD0VVcWW+SMzqKyHtc4aQYbh3/VpmwzxUqJ844
	110m7yosXff0gMOX2O2mLn8=
X-Google-Smtp-Source: ABdhPJwPXV2FnPOtniAv937YodRk1DXzTJmQyIYfayeq+0FIN/3TsFOFLrxn9xXa7y7ciShQVdOeHw==
X-Received: by 2002:a05:6820:228:: with SMTP id j8mr5910290oob.3.1626966408519;
        Thu, 22 Jul 2021 08:06:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:bb5:: with SMTP id 50ls1826405oth.6.gmail; Thu, 22 Jul
 2021 08:06:48 -0700 (PDT)
X-Received: by 2002:a9d:a6c:: with SMTP id 99mr129332otg.21.1626966408016;
        Thu, 22 Jul 2021 08:06:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626966408; cv=none;
        d=google.com; s=arc-20160816;
        b=NvI9A0CMzdy2OguDY3omaOqSguv45Jwfy6pjb6FnsYTeYtQvbmSTL03HyA1dYaBH5j
         youV3OSaQJemFfD56r+1w0AzdPsBm0RGptABYuTHL033SRBlXOlQwn/GHQUvvMS+lWcb
         I8v0JAVQgj8vjj+S8nTcTMDhhaYbwcQhmYNQRqdk5TRiWzPB1Ak8IImzkmP2c6Y1FjcJ
         wlDWoInLCMbtNBQlqXP2pkdtImUkdKrK+4MQSLC8jK992tOloryuXwzjaIp7mwAFjTdq
         fYa60X8U2aVeMjQM7p+ZGungZWj4IQaO+42lvDhnFTIlx5tj9ABn4STmBLQ8RkgL5CZS
         5tsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=ix4C2faWX6IhgWdpIhdJtoeHezeRFsLFzgl9HgxIEFU=;
        b=XpCz3BSTuhneWAUn0clKwVKTf4ETqqV0+d0Jl8L1rXhOMnzAFFo3RNsLYwOoxlTzPJ
         YIgBKQDW0H5YzFhF7rY/RB5QsCs2WN7p0JKL6kQFQtLJCxqnV+peEegqgASSJtexNS5P
         2WGZsr4tUwYFmA6faK71MM0VUEJDr4rOyKHVSUVYCEO1NoEvmoz0NB/8oDTbWa6VPyyF
         vE2dy//HNA7wSLEAPPgNNncWv2FtS5U+QpxwuvaglOOeXHufm82JqLpprHOn5dNUd6Vy
         agS4fJp6BzVdjtkYHjh4u+mVIYKCFupARxhJSgAGfI96Z3qsX8W54vRM6vvLDEh5E/ua
         ihfg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@github.com header.s=pf2014 header.b=x2eDSm6M;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=github.com
Received: from out-23.smtp.github.com (out-23.smtp.github.com. [192.30.252.206])
        by gmr-mx.google.com with ESMTPS id d15si2103139oiw.0.2021.07.22.08.06.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Jul 2021 08:06:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) client-ip=192.30.252.206;
Received: from github.com (hubbernetes-node-c16bbf9.ac4-iad.github.net [10.52.125.49])
	by smtp.github.com (Postfix) with ESMTPA id 9837A600A95
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Jul 2021 08:06:47 -0700 (PDT)
Date: Thu, 22 Jul 2021 08:06:47 -0700
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/master/6d9c51-630001@github.com>
Subject: [siemens/jailhouse] 1fdaf4: paging: correct a comment to bitmap of
 used pages
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@github.com header.s=pf2014 header.b=x2eDSm6M;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.206 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass
 (p=REJECT sp=REJECT dis=NONE) header.from=github.com
X-Original-From: Jan Kiszka <noreply@github.com>
Reply-To: Jan Kiszka <noreply@github.com>
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

  Branch: refs/heads/master
  Home:   https://github.com/siemens/jailhouse
  Commit: 1fdaf40c11ebe09053b49f412f54a0a7f41de1b9
      https://github.com/siemens/jailhouse/commit/1fdaf40c11ebe09053b49f412f54a0a7f41de1b9
  Author: Dongjiu Geng <gengdongjiu1@gmail.com>
  Date:   2021-06-10 (Thu, 10 Jun 2021)

  Changed paths:
    M hypervisor/include/jailhouse/paging.h

  Log Message:
  -----------
  paging: correct a comment to bitmap of used pages

The used_bitmap member in struct page_pool is a base address,
so correct the comment to make it is easily understood.

Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 9a493890c09c618ab21f3f8579a6dd1fd1ac086f
      https://github.com/siemens/jailhouse/commit/9a493890c09c618ab21f3f8579a6dd1fd1ac086f
  Author: Florian Bezdeka <florian.bezdeka@siemens.com>
  Date:   2021-07-21 (Wed, 21 Jul 2021)

  Changed paths:
    M scripts/include.mk
    M tools/Makefile

  Log Message:
  -----------
  Makefile: Update build dependency from python to python3

Some distributions are about to switch to Python 3 support only.
This means that /usr/bin/python, which is Python 2, is not available
anymore. Hence, switch scripts to use Python 3 explicitly.

Not that the PYTHON3 variable might be defined by the Makefile in
KDIR already, so depending on which make target is being called it
might be defined already.

Upstream kernel has the PYTHON3 variable for some time and is now
going to move away from pyhton2 as well.

Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: a2aed84fe918c3c6ca5e60db29aaef6751c76772
      https://github.com/siemens/jailhouse/commit/a2aed84fe918c3c6ca5e60db29aaef6751c76772
  Author: Florian Bezdeka <florian.bezdeka@siemens.com>
  Date:   2021-07-21 (Wed, 21 Jul 2021)

  Changed paths:
    M scripts/arm64-parsedump.py
    M tools/jailhouse-cell-linux
    M tools/jailhouse-cell-stats
    M tools/jailhouse-config-check
    M tools/jailhouse-config-create
    M tools/jailhouse-hardware-check

  Log Message:
  -----------
  tools: Update shebang from python to python3

On Debian 11 systems /usr/bin/python will no longer exist due to the
deprecation of Python 2. According to [1] the unversioned python
packages must not be used as build dependencies, dependencies,
recommendations or suggestions. So moving to the versioned python3 seems
the only remaining option.

[1] https://www.debian.org/doc/packaging-manuals/python-policy/#unversioned-python-commands

Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: fb37d16f7f9df172877fc76631e4fccefceda29c
      https://github.com/siemens/jailhouse/commit/fb37d16f7f9df172877fc76631e4fccefceda29c
  Author: Florian Bezdeka <florian.bezdeka@siemens.com>
  Date:   2021-07-21 (Wed, 21 Jul 2021)

  Changed paths:
    M pyjailhouse/config_parser.py
    M pyjailhouse/extendedenum.py
    M pyjailhouse/sysfs_parser.py
    M scripts/arm64-parsedump.py
    M tools/jailhouse-cell-linux
    M tools/jailhouse-cell-stats
    M tools/jailhouse-config-check
    M tools/jailhouse-config-create
    M tools/jailhouse-hardware-check

  Log Message:
  -----------
  tools/scripts: Remove python2 specific code

We are now calling python3 via shebang, so no need to care about
python2 anymore.

Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 85aa7b0f1755d966c953b9c2ce9e2858df6b01f9
      https://github.com/siemens/jailhouse/commit/85aa7b0f1755d966c953b9c2ce9e2858df6b01f9
  Author: Florian Bezdeka <florian.bezdeka@siemens.com>
  Date:   2021-07-21 (Wed, 21 Jul 2021)

  Changed paths:
    M CONTRIBUTING.md
    M Documentation/setup-on-banana-pi-arm-board.md

  Log Message:
  -----------
  doc: Migrate docs from python 2 to python 3

Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 630001202caec85370fb4f956e581f51109e490c
      https://github.com/siemens/jailhouse/commit/630001202caec85370fb4f956e581f51109e490c
  Author: Dongjiu Geng <gengdongjiu1@gmail.com>
  Date:   2021-07-21 (Wed, 21 Jul 2021)

  Changed paths:
    M hypervisor/arch/arm-common/irqchip.c

  Log Message:
  -----------
  irqchip: Avoid set irq target twice for root cell

When enable hypervisor, it is no need to set irq
target twice for root cell, otherwise it will waste time.

Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/6d9c51d0bd81...630001202cae

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/master/6d9c51-630001%40github.com.
