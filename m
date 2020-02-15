Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBWGDT7ZAKGQELA7TTSA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x539.google.com (mail-pg1-x539.google.com [IPv6:2607:f8b0:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id F266F15FE4E
	for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 13:19:37 +0100 (CET)
Received: by mail-pg1-x539.google.com with SMTP id v30sf7947531pga.22
        for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 04:19:37 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581769176; cv=pass;
        d=google.com; s=arc-20160816;
        b=mAjDBlEi8rPsA0T2/39So4EaFW99w74DcbQwYNGHZqyxrFBWiO00taRXouQGPJq4V/
         SGQMQb52+xQ2WvsTNfrDO0OxQyECopyH37joIjX6J2+xpUqYkVh0dRuGbQi5dLPg0j8Q
         O6dn6J1IICPU3AWVWmq/BEIBxnNYOcgTiEkYoZjiX2Eckp9uvfnU0190Y+r/g+QQy99b
         SaSCC6CLdy9zdGGdc+H9u2PZhgTsTXyyksjMrCqjYR2VptUY7XX0vsa9h8gsQyFQhhFx
         zjgeRLCfLFt4JkvFD5im4e3R5GoZ0V7wXEa/cFQcgMGpxtDEAbgQKruqhiMBHLOSiqor
         MmCg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=PF6aWLvC//osXwPUAuI3X0i42w78LVYkKzYl8cpyd0k=;
        b=GFzC+ZENt4kqJqFZre8G32X80+H66HeMpfpDq+plYxW10BRzA3DCFd7jB4NeE6+cwf
         xaa4LqJiQZ1L6u5t8xMU4/hi2RyO8JFxpLZJOANkuW8LGeLLUAlOB1qedM9bSoulcI2K
         Bp7JvxLPTgJ+2N7u2FyxSLzgb7xXslYaWe53Aqm69ciqtCd/+gs1sWglYWYZ/c1Gugb+
         d8g9TxpBFDSt9XtOFrd+RDsbAonk67bFQpv6+M3XhHb1viFWX5KySh9cPN+dFVo/BY/t
         LhLm77x4c5cL1Kh7GoZ6bH/Zn1l6aRRkJUBF8m0iXK8houa2XnMc9YaitJJRvCDcqGKA
         o7fw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=tpg1FFTx;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.196 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PF6aWLvC//osXwPUAuI3X0i42w78LVYkKzYl8cpyd0k=;
        b=aDORWHbuvKFhp8Yf7a0LXSqV5FgWMRrP7U8FBqsoA7g83HeXvMIQyNhX+ZBWaseffi
         4z8zyQ1+suGOiGLenigcK3tVnPiYiMD/xej0BR5IdpxDtZqgdsQb3813w1QPQoJlKky2
         7B4EbsN/QhL/vS71rfFCOdsku96tYfVmaBY8dXTA2hdobRCOIpeqbuxpU5g8fbo+JXfU
         VSOQRmCrIyHjJsPpDHGTli+f5R2IjFANdxPwX+XAGgr1Bx5WRCnxUsGU1tmw9Ww41X9F
         rC75uvGQHitbTPabOvCUZE/SLhbtZlHKP1QLUpAytaTUD21YKeNQskGE6WwK5WKCCGDH
         JHkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=PF6aWLvC//osXwPUAuI3X0i42w78LVYkKzYl8cpyd0k=;
        b=bOmQ3rFGJcIUurgstBXcls/LrSi9cu2mxxMIL5PbqtCQ5gCgl5xCH/SwG6Fpz2N0Tg
         Z/FMSgu9FxVbthkcw8wFvP0VTS6ppuVx2q9EiasZDhf1Qa0FxmHtk6l2e+aRgLA7F6Ct
         X2k0pJ69cz5PX0Fv4Jq77Bjb/AcDGGAkjpVIn1G4xRO5YnJ6YiCO5xRi7hUa/H9NWHPU
         5J3d24JvX0QbCH5x0Pw9aeP5KZqTtf5Ywd0Uqm9oPRVh8YoDn95TwrcQCY1BZoppP1sC
         6R6fMRflPmARsGgbFocIlMWLVNGjSEgye7hOejmX7QjiMX/Cow6XMqQ6rwKse0vdKSpg
         +4RA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUpYxLM3t6QcIk+s8uAbR1kqIYgwUi1mzKLBtcLsIiws3jBSu50
	QBNBsb3XisDWLnMaOoCg1Nw=
X-Google-Smtp-Source: APXvYqykpXRL9v97QYJejPtl7iBWrX20v9WJGuLCcKolVHU7PGNXcTfyJjJW23DJFDkjNupixjXg4w==
X-Received: by 2002:a17:902:868e:: with SMTP id g14mr7933390plo.87.1581769176548;
        Sat, 15 Feb 2020 04:19:36 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:2a04:: with SMTP id q4ls3478303pgq.6.gmail; Sat, 15 Feb
 2020 04:19:35 -0800 (PST)
X-Received: by 2002:a65:56c6:: with SMTP id w6mr8722941pgs.167.1581769175861;
        Sat, 15 Feb 2020 04:19:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581769175; cv=none;
        d=google.com; s=arc-20160816;
        b=DXsfHab0BxfmjT0vuhFEXnyz7J6jgFEiuBOfEsvhikGtzTIXl5V2AsMPNaA1KJaOUY
         SRWL4byXKOVM1J6xnpeF7Ar/2V6MhtxRaQLjBKYbf+sfjdZqOwIDx1GFm0Y+Oe+7ETXP
         rgYP8TYBCXxaxbxvvIYmU89VFjPLtR8oJdaSvJ3skSJaLcgQkqQqMK6kiRi4tCOqcdE4
         7objKfyB5JTEgxKpTO1vDhYCROnGoPg1/54lmVJ479RdrtzQ/8td18aQFQU6rTT32Aiv
         r6pzX6uDeouSqnK0mLAN1phffksb2CW8GlAuKJGcjuyaoTDK6FJ3A8S8lM2C/yzG1rwg
         EqFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=OqK4hn7YLskgruWk6Y9AhSjow6AuqfTiB3dIGSyOthw=;
        b=fti2YnFsM+utZa+htV2glCqGUwqk6tS2gH7iKiMod2sutc6ZMnDd7OxpuLkPruG/96
         kgoP55RHL8Fs1Gy8H32Iecom4CT6YZDqoso2lxIqFYkySEpD7ReRao6+rMP8H5FubBzg
         dREOP1X6maugz16AnGTLnNHPUvrBS7zZcImcPlAAYqtwtS603XFVwfqDW6Y5Wtg4WS6v
         jwT+KoocBm6qm7L7vyieWRHXpjGF6cv/ytusJrADTemxIglkTsTYstcPk/83O4tppLup
         SiB6GNgvo8IAObTpr502PTC1KjF3I2id4CvG82NNf14dZH2g1hMBjHEdRVw2wrN3UC7U
         DkzQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=tpg1FFTx;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.196 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-5.smtp.github.com (out-5.smtp.github.com. [192.30.252.196])
        by gmr-mx.google.com with ESMTPS id j10si346600pgg.2.2020.02.15.04.19.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Feb 2020 04:19:35 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.196 as permitted sender) client-ip=192.30.252.196;
Date: Sat, 15 Feb 2020 04:19:34 -0800
From: Vijai Kumar K <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/master/92db71-5dbdcb@github.com>
Subject: [siemens/jailhouse] 7e538d: configs: arm/arm64: Fix vPCI IRQ
 assignment of Lin...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=tpg1FFTx;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.196 as
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

  Branch: refs/heads/master
  Home:   https://github.com/siemens/jailhouse
  Commit: 7e538dd94667a1426c4a694f8bd9c6071ac41b88
      https://github.com/siemens/jailhouse/commit/7e538dd94667a1426c4a694f8bd9c6071ac41b88
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-05 (Wed, 05 Feb 2020)

  Changed paths:
    M configs/arm/bananapi-linux-demo.c
    M configs/arm/jetson-tk1-linux-demo.c
    M configs/arm64/espressobin-linux-demo.c
    M configs/arm64/hikey-linux-demo.c
    M configs/arm64/jetson-tx1-linux-demo.c
    M configs/arm64/k3-am654-idk-linux-demo.c
    M configs/arm64/k3-j721e-evm-linux-demo.c
    M configs/arm64/macchiatobin-linux-demo.c
    M configs/arm64/ultra96-linux-demo.c
    M configs/arm64/zynqmp-zcu102-linux-demo-2.c
    M configs/arm64/zynqmp-zcu102-linux-demo.c

  Log Message:
  -----------
  configs: arm/arm64: Fix vPCI IRQ assignment of Linux configs

By moving the ivshmem devices for virtual network one slot up, we also
changed their IRQs. Adjust the irqchip configs accordingly.

Fixes: 68b8ff84ae8d ("configs/arm/bananapi-linux-demo.c")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: a35bb08187d4aa03f5cd5d26355bf0155c6563a0
      https://github.com/siemens/jailhouse/commit/a35bb08187d4aa03f5cd5d26355bf0155c6563a0
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-13 (Thu, 13 Feb 2020)

  Changed paths:
    M driver/main.c

  Log Message:
  -----------
  driver: Account for constant name changes in 5.6

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: eb101d0d853c8546d701aac4ccab3c251877a4d1
      https://github.com/siemens/jailhouse/commit/eb101d0d853c8546d701aac4ccab3c251877a4d1
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-13 (Thu, 13 Feb 2020)

  Changed paths:
    M driver/sysfs.c

  Log Message:
  -----------
  driver: Do not WARN if a cell CPU is missing in the root cell

This error will be reported by jailhouse_cmd_cell_create via -EBUSY and
is no reason to create a kernel warning.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


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


Compare: https://github.com/siemens/jailhouse/compare/92db71f257fa...5dbdcbc720c9

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/master/92db71-5dbdcb%40github.com.
