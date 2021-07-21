Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBWPY4CDQMGQELJZZIQQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x1037.google.com (mail-pj1-x1037.google.com [IPv6:2607:f8b0:4864:20::1037])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B223D124C
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Jul 2021 17:25:15 +0200 (CEST)
Received: by mail-pj1-x1037.google.com with SMTP id t11-20020a17090ae50bb02901757bad7139sf1106351pjy.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Jul 2021 08:25:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1626881114; cv=pass;
        d=google.com; s=arc-20160816;
        b=jFBlenT323MPbkxF7k6FE+8bH5EWG8/CtLzvJlFXFoS29EwtHF0ASk6BjlXKsnTyq7
         fzvq1PC3oICAT6fGHAYR9MyxImjwqzzJe63cmivzpW53TYMCBXTPY3ofch6THAIBVVoH
         uMiMDMNZbXGpgHGSspvpaDBbzh+snuux4vRRuOe7TE/XC7Rhcmt5wvMUQK1xcik69r92
         NWSM0nZEx/gIp6GyTbHsEQlYen/VPOx2No4woAr38msgWGv6FkBYoFjEoGQbZuqiNV9B
         6s5VCCtOs81fR0KQ7G+D3yazO4P2yt065Gcs+kG1bj34Cg1ZFqNRkIWBJZnMeNdqXpl1
         7KRg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=9BF3vDlW0h1TKSHCwJYri4qocnfg1whP7jWJ1YlGQlA=;
        b=0hqtxTRknSECql7uaNtuTb9pp8h+h8jjXjbS3PYtcdcEgH2Fp1RIlYdXFi7lPQYXVb
         1YLR10/05RXXNs5rhrJtMDMOh/J5GZCn3L2PD1t0nHbvNO5eyc7KyaS//suXiEdlg16l
         0K3noHdXzSUvnk3dhY3k25jjDQupggm0ynnJDaiM2q8ZBuNX1Q+Nb5hDBKMPb6BfmaL/
         Vkk2eKv9v0vZtDqjRBQG6b90SsmSFfBYtuFiTVQDw/t9hBibWzSRGj3lU4y13Qa9+usD
         QwCu4gjIsiDlONUj82P4juPbTp8vhb3ugI3uOHVss9HrNjsuwYdsSELBKtMxKzZvkUlF
         hnHw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@github.com header.s=pf2014 header.b=cs4mA3xl;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.211 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=9BF3vDlW0h1TKSHCwJYri4qocnfg1whP7jWJ1YlGQlA=;
        b=p9r3WMR6OU+/D3MT7GyKDua7x9cGnzX+INkaGREIdZxWOkrwmML5EKKeEtoyGCOFxy
         ojdfUzod258kZE9Qsl2iPx1GO2ixPu3UuiV4N6wrq9LNs1In/1OESqpA+CCaAGb7skxS
         oJ0zy2yEt8NN71V32Zn+YAC2OI+vfpEnNVsVNCcLkpbvvITJ9sT7i092Aqz9naFR7awB
         rGEkaw5czOQ+5pbbt9hhtwnes7Ls5QP4pCp1u8aC25UHpNytMZ4L9Px0IaXiSa65pcOq
         tj4y5PoD0xGxtYjkk+zV6Sc09t5QWaKVhy8iRwaLWEQ5xLmrzOZmj4YLliljp9Owc7rK
         xm/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=9BF3vDlW0h1TKSHCwJYri4qocnfg1whP7jWJ1YlGQlA=;
        b=X7H2KbScg06LQdZtXLzwNUHOzDOfXo/48y44VknsZOBwI31mPWENhVonnmusosGrWl
         GVsQhKNvz2vsuWML9PV475efDS0o+CFsCj7uUSIzNo4RModHTlFQLt6MsOuAhgi1BWYN
         Ay7O5SirhPAYakTYomxSXVwu/e5vreVFidJ9M0oa+UIstAznR1wNkwHrVbVY1akTrjgp
         jaCzT4/+wZcsD+4BozcgfNaGZrpd0+5EfQXAaIxyuSATjtt+b6Ghn6Y22A8Md/ZIpopo
         UoykuetgNSvmUynL29GGvDT0PeiDR2UtmAofSaa6ozi1xRiZ6T6yO+gF05ofAU0vuduR
         eGkQ==
X-Gm-Message-State: AOAM533I/FH6kKiFFftk1jfeWDBgpZH4ztGQXj728kn2mcDXjwK8vuGb
	qglRyqf8bqbuHI4FgThILKc=
X-Google-Smtp-Source: ABdhPJzOM1HbqwdgZ9b2JuwTbi/E0epdLAoykSl6WXtZx0LtBMXuj4NQ4mnPNBBeaozIdMhI/PneFQ==
X-Received: by 2002:a63:c04a:: with SMTP id z10mr21019865pgi.99.1626881113826;
        Wed, 21 Jul 2021 08:25:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:e787:: with SMTP id cp7ls1412331plb.10.gmail; Wed,
 21 Jul 2021 08:25:13 -0700 (PDT)
X-Received: by 2002:a17:90a:34ca:: with SMTP id m10mr4496628pjf.158.1626881113169;
        Wed, 21 Jul 2021 08:25:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626881113; cv=none;
        d=google.com; s=arc-20160816;
        b=nsIZRHohidRSpB9sfy2DnU8PEN6Ah3rCItANqHxvg8TC+Gp7bk6l/eXqeuxiWe2IOX
         orHdoCJKV656045cynsPLVT6h7ZWxEe/83FWfhpzsiu35hXYMQFbF1/M3GBuz1kbS2y0
         UxQNX5964GxG2GcS2FDsvjbBjMJxGuyJipJNZk9vyH0G09dFNjlnQXf3L95vEwA5ZpOS
         aVYQjLfU0mYHZJs3uWW1mMNbz1bI4Pji2acTBBPdtN8EmmwyXecsIUX3bKMpT1PdhLYU
         JAJgbDYZXBH/VrvrIZU6phncv03NuNwx9YEuiAkWpx6kwt04WcGKFqht/N8gZ/0Mcm7H
         2pkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=aziUWJ9WQRGFmdYpevxI0GNwULQWx8jM0xNCQP4Hjmg=;
        b=t/hneblB5iciya/DJS/v7HSNicOMCo8nvVKZdawheORkWz31jSo9Q0FO5CsAT4bB0G
         pq+ptCAzysVKbgg5yHGRE+fC395ykKv7P6z6/UHCUIz2CI71iBd3n4y3hMLVrzW+t9bm
         LRnCru/ueO8vUpVp8PJWbX8KoK+S5FW+cmTKr3sgFIeK98YBHq+TQSNc1ulZCCyekLpV
         ewwPHm/fVQJ9WqRU7orjzctFmZBPdvr2py3gNMaXC41a+JLkNeabzhu181mT6swEcyNm
         WvZkTVvmywoijJh1eTQkWPmHJvemePts38dF5m+CdZjIQ7RMAI+e0IEvIlL0kp9hYR2u
         IpTw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@github.com header.s=pf2014 header.b=cs4mA3xl;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.211 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=github.com
Received: from out-28.smtp.github.com (out-28.smtp.github.com. [192.30.252.211])
        by gmr-mx.google.com with ESMTPS id t1si2900084pgj.4.2021.07.21.08.25.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Jul 2021 08:25:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.211 as permitted sender) client-ip=192.30.252.211;
Received: from github.com (hubbernetes-node-3386cc9.ash1-iad.github.net [10.56.110.67])
	by smtp.github.com (Postfix) with ESMTPA id 5DE09900385
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Jul 2021 08:25:12 -0700 (PDT)
Date: Wed, 21 Jul 2021 08:25:12 -0700
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/6d9c51-630001@github.com>
Subject: [siemens/jailhouse] 1fdaf4: paging: correct a comment to bitmap of
 used pages
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@github.com header.s=pf2014 header.b=cs4mA3xl;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.211 as
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

  Branch: refs/heads/next
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/6d9c51-630001%40github.com.
