Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBN757TYAKGQEHCLVH2A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x338.google.com (mail-wm1-x338.google.com [IPv6:2a00:1450:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAAE13C964
	for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jan 2020 17:32:56 +0100 (CET)
Received: by mail-wm1-x338.google.com with SMTP id n17sf83550wmk.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jan 2020 08:32:56 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579105976; cv=pass;
        d=google.com; s=arc-20160816;
        b=bgLvOxEug3r1Dj301s1rwQqzMq9FYXGryY+OYpkR1TdjA9n3rKsOekP0aeVawvlb+G
         SAj4ovBNZTJ81VEwdkrTirRNb+xU5fxheRjQH+yQjeVe5Wq0q+26wKcSt6tlCHMa3w/P
         67I615AOIGgZJV+D68yLYFijbmrxTRoU5yE/oqRphSHNGnLeWvFIoS+MofxrJzrhyU6s
         hcbtBSftLVeHQQGANzHbUqjzzcH6/N2qxAjW1814N2KJ6lEIpaidhfXLRvpUaA4DIbRV
         eKDbbZCZHHZ79DzrZhbf1NVcOi01asMXarT/mfB6ylPY6GHX3D7oXNo2dRBiLm98XPGQ
         LJkA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=19bsavDT1ohBmXe2xfnUUHLl3rVxUPVmWAnmghLXcok=;
        b=nR/GlephM63W5HlMySEa+ebSiuMH48krcNBgZ2RxUYPHL3ZX8Ls68aRxAuiKHQ1DYC
         nE+2xdoddmTQnEecw2K43Vd9n4odLJtietbzYfPGE0ka5Oh0vxDjQBgrtVPIkNRL3kvn
         1lr/i/Sne3a3BKRNdGFGMgI40EmoSeLMSFEmzQkgwae+9kBfbSPmVbj5IMcmd2ECfa6q
         cYVz4tYbeLWsgCcjL57HiyUNxaPuAl3okvr9VPfwxOZXLuPr331w0uFPa8GS55XQCloA
         WLRd9xSYKk2htL1xYMUjlqyX6arNkYCdHEqKrdJIpoSxEsxUNOkGxMhGiKL8LOJvdk5O
         nYJQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@github.com header.s=s20150108 header.b=RAFC3Z2c;
       spf=pass (google.com: domain of bounces+848413-32fa-jailhouse-dev=googlegroups.com@sgmail.github.com designates 167.89.101.199 as permitted sender) smtp.mailfrom="bounces+848413-32fa-jailhouse-dev=googlegroups.com@sgmail.github.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=19bsavDT1ohBmXe2xfnUUHLl3rVxUPVmWAnmghLXcok=;
        b=spb0C/sPqcEF6/A9yrXwRh5b5vYL2SIZNQf5okNINHldTSefj3wM49WZ1uArnRbEtv
         M44QRYo2Mz6N4HVgU5sOmmsWX4OVlYThNMeShlyZZT7jWA+/lrW3jwGllnRRL+PDo2OM
         Whq2BLpa9e6NvHUH4GOhJuSp/vT1Vgj8NMLfgaBbXcun7WOKbNgY9eVBfWpU1ZDsuWyX
         ozNExKlH1TELQtZIRcPJIKnC/N14H/6xHqTnvxGKzWzfse2pWIODAIFfRh5H32TA4/XI
         yvWvjcPYS02AKdQH6pcu30aMdw2GDBP+zGYMiwJJMEgjI2gxBDF015vjlXfMRgXw4Opi
         /egA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=19bsavDT1ohBmXe2xfnUUHLl3rVxUPVmWAnmghLXcok=;
        b=aHVvoGFxwqt/p6sfVQt11Ya01omgW4BGQNiIHwsU89BgzR0D1cllBR6FKMd9HfPOwP
         s3kxnRNQSE9ePo/XeGGy1S7LTPACuoy87hUv8PCboWMu5MJWccofh1IH3mi2kf3gr75m
         2j8RvM5YnGDTDOOdOEHRInb5wP/bY4S9tNPZq3PkoG1IjJwAHbX3ziGbY9kcSc5HPWGL
         8PAaGeaB+OyrwwTuISGMZLoc6085MsAD0m6s2CkosDkyrtHRYrWl8pgZy0p7hPx18CsJ
         bbVmF5jmt2ZSebPdkeg3pngjlF83OqZyupD/wZMxxm+Tmyw9/WtIsxIJXP3ydOwfL2Fp
         S9YA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWXhk70ZKSSvtgF2qGLVQZSbMteO0VR1dcnvzbSEeD5V6+TssQe
	/DfIDtvgLLCNvqK5qhies0Q=
X-Google-Smtp-Source: APXvYqwKH2IKiha8hGv9OwWdF2VqtEJphLZNx7ONsrztxUQDS+mWOgYTxhSoPRoYFwyG/ualVpQRUA==
X-Received: by 2002:a5d:6748:: with SMTP id l8mr16921095wrw.188.1579105976171;
        Wed, 15 Jan 2020 08:32:56 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:e913:: with SMTP id q19ls1734431wmc.3.canary-gmail; Wed,
 15 Jan 2020 08:32:55 -0800 (PST)
X-Received: by 2002:a1c:1f56:: with SMTP id f83mr685717wmf.93.1579105975403;
        Wed, 15 Jan 2020 08:32:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579105975; cv=none;
        d=google.com; s=arc-20160816;
        b=OY8o/K0SY9eJJsQ+y+0E0heHQlzk6CeMyCCE83VTlsocfZOQBo2ba8B2Izxwuzo+Sp
         OtxZeNkOLnkTxwa1CBfu1wfDCzqLzVoeKsCmR54i8+OjHxC0kkMb0iegJzfIYItACIYt
         zQ6YA+p7xdAlfN6gV+JKsyF3JRLIZNoKb+LHX4ewcOidpLgBVO6Ry9oHwIW/R66Jg+BK
         QD/rWAgVW/bWeDUpWRmJ4sgUcLOmHVkKifgD49GqpAz66DwZ0BS1KU0VHBaPLY+2u6dx
         oXvrb/rwcwJKu42rPMlEpMn/aAui3jN7noEzP6OBfOjPb9ZkH+UwaVRMY/fStOWDmyZP
         7MXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=VXzTHT3lIe555gapYH7Up+mjksrj+7NUIbpIKgV12uo=;
        b=F3KIaEgbvOcuPjIDVMQ4OFKfe6M9+/fFEF9AUokT5FjwHkNwfOQKiEZyW1zjg8qlkJ
         cOCyaUVXlkOrZ8EKUjhdlZlSBTEWONl7YRVBAb4ARWGB8/boA7kUpLyGrnr38nNslwYY
         rbbbmerBEyWkb7jCXFLiFdt3h0LHlRO3wVx9rCDZ/RO7zEw8uip4TfZvX9toRV+Eialm
         qN+cCLRO+H6nWlF7paUOC69le5TUNq07m897NGJ2ZohObM0KgWgulCR1C/p+rfdaqQfa
         atCJAOeTaRxH5HKRyvgbYyaN2BYok2Fw2Ea6oIdL5kKaSVTm7qwebqB5CcnAayZfMm9g
         IIgw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@github.com header.s=s20150108 header.b=RAFC3Z2c;
       spf=pass (google.com: domain of bounces+848413-32fa-jailhouse-dev=googlegroups.com@sgmail.github.com designates 167.89.101.199 as permitted sender) smtp.mailfrom="bounces+848413-32fa-jailhouse-dev=googlegroups.com@sgmail.github.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from o8.sgmail.github.com (o8.sgmail.github.com. [167.89.101.199])
        by gmr-mx.google.com with ESMTPS id t131si14905wmb.1.2020.01.15.08.32.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Jan 2020 08:32:55 -0800 (PST)
Received-SPF: pass (google.com: domain of bounces+848413-32fa-jailhouse-dev=googlegroups.com@sgmail.github.com designates 167.89.101.199 as permitted sender) client-ip=167.89.101.199;
Received: by filter0509p1iad2.sendgrid.net with SMTP id filter0509p1iad2-28436-5E1F3EB4-3C
        2020-01-15 16:32:52.749287687 +0000 UTC m=+67471.090043723
Received: from github-lowworker-39b4a70.va3-iad.github.net (unknown [140.82.115.9])
	by ismtpd0046p1mdw1.sendgrid.net (SG) with ESMTP id 3ZH0bOFBTbqqgVvSZzn1Zw
	for <jailhouse-dev@googlegroups.com>; Wed, 15 Jan 2020 16:32:52.626 +0000 (UTC)
Received: from github.com (localhost [127.0.0.1])
	by github-lowworker-39b4a70.va3-iad.github.net (Postfix) with ESMTP id 650F07C0DC7
	for <jailhouse-dev@googlegroups.com>; Wed, 15 Jan 2020 08:32:52 -0800 (PST)
Date: Wed, 15 Jan 2020 16:32:52 +0000 (UTC)
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/9eb860-005fe3@github.com>
Subject: [siemens/jailhouse] 4bb52e: configs: Add support for Raspberry Pi 4
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-SG-EID: pPXi/rPJQPi62kCfLxCWuZgGuBKOrlmtAko8KHFyNL4g3DSINqZUCeFiwr+z338mgtNWzdat96wMab
 Zaka9SasbIYGDWSEOadjC7KAAx66GEW0JwMLId3xd10b9KawL2jlVeiG5ZwPzwfl3UqsJ/odlkuHtx
 n23oW1mCPaIiRwcweMAtF4s5q6oWX206V5lBpVSLsCVOYgIvY+UKkmK6dWi7WltkapIFkcVam03Grl
 4=
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@github.com header.s=s20150108 header.b=RAFC3Z2c;       spf=pass
 (google.com: domain of bounces+848413-32fa-jailhouse-dev=googlegroups.com@sgmail.github.com
 designates 167.89.101.199 as permitted sender) smtp.mailfrom="bounces+848413-32fa-jailhouse-dev=googlegroups.com@sgmail.github.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
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
  Commit: 4bb52eeca50b9af8280ad570919aea141787d9fc
      https://github.com/siemens/jailhouse/commit/4bb52eeca50b9af8280ad570919aea141787d9fc
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-15 (Wed, 15 Jan 2020)

  Changed paths:
    A configs/arm64/dts/inmate-rpi4.dts
    A configs/arm64/rpi4-inmate-demo.c
    A configs/arm64/rpi4-linux-demo.c
    A configs/arm64/rpi4.c

  Log Message:
  -----------
  configs: Add support for Raspberry Pi 4

This adds the system config, an inmate demo and a linux demo with dts
for running Jailhouse on the Raspberry Pi 4. Configs are designed for
the smallest, 1 GB variant. Models with more memory needs adjustments
or have to like like having 1 GB only.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 005fe368e11b27bb20f0ddd47b968ca9b5235c00
      https://github.com/siemens/jailhouse/commit/005fe368e11b27bb20f0ddd47b968ca9b5235c00
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-15 (Wed, 15 Jan 2020)

  Changed paths:
    M inmates/lib/arm-common/pci.c

  Log Message:
  -----------
  inmates: arm-common: Fix indention

Use tab instead of spaces.

Reported-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/9eb8608a209b...005fe368e11b

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/9eb860-005fe3%40github.com.
