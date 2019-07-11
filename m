Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBIXGTPUQKGQEVSF2QAY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C5165322
	for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jul 2019 10:28:19 +0200 (CEST)
Received: by mail-lf1-x13d.google.com with SMTP id k25sf396012lfj.10
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jul 2019 01:28:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562833699; cv=pass;
        d=google.com; s=arc-20160816;
        b=nhudsk+aVn2t7d0F1QJAAGk3kNsgpfArN4BKko0mnlFEPcOQPHYRLJbS2RMQSQQ29i
         DFujB49F+KRlOHTXI1pXjVkEKDuVI92wD6d8UE5yfsp85NPeuMIJEdPtIhBFkxJcCXTC
         WpApetH2Qe029NeJLQY6yFCxcN5+Mto91np4RZiMmKjRY2CmbWsA+uei00eXMCoXJNJU
         pX1VFBBH1DuFUVHnwCFUxDld8MK+DDoPoGrn7eUVeKXpwSB2e/YoF1I9BaVG0FpDZ/F2
         5FCUHPslL9iuoySs3PXa7JExElWcvG10XNcly8EfdWLvMBnvG1NNAa523isdcapR9Q2D
         lEEQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:date:subject:to:from
         :mime-version:sender:dkim-signature;
        bh=JqR90awoZmAJWjtvSVia5wxvHAI54JcyEYi8YAhc+Ic=;
        b=LDQRseS6uMddiWON+d0QBWXkSzGl3ldvs841ICyl0puwNLH/FPL03EOCnn6JOC2x9l
         KH5Twxtx7PMOPR4xFKqycQoyyF7hX9hJmXs8X5jWd9lRefaKLlqk18WDWnVPdIOPwz4Z
         axBLTAYDwa4GDdi1+86otSShCOFYQz4oE9+2i59o2C7rb72Vs2/lM2Nj++5HZUVnOEBz
         mqpKg0du5HP8F5DWej42Hdp+u/CT6+Pn+ZaYdMK19H+bl1qiFz5qYB9DvT46Kr6FoLjI
         D8AVUC918ySYPBQYMUdxAIwkVlkfl1q8FfQVjwdhCuE7ZUCLu855jbKVnzQCLPiMHWHF
         ZGDQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JqR90awoZmAJWjtvSVia5wxvHAI54JcyEYi8YAhc+Ic=;
        b=lMD7sJoVQ8gW7q/3+hBJ2kvujL1hmq63uKmMYA6kv7mTheWd+0s08ZItRawyGH3AZf
         36C7PY4zrli1MoDrLeG1ec5ZWuF4VPkdgeR/f/bsXG/n2WLsNhFsYsY9ZRHZzkYlczNL
         tOL99vmataKgX52tfgrbwUUDCKzW+5r4d0KKoAzn4gtxWKhkmndJyhWq4NhR23wu74xb
         5WCE4OhgTFUfO3NzghoFporM2yYpUSZukU0N62iB9g9C1+SatxeABGzAFyMZo540YTND
         bTgyckgFEtYwdJEFzhaByADuoS9So2eLmmH2AbYcwo6gjQkkK+/DrhDNYJczYJTHlLhy
         0qsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=JqR90awoZmAJWjtvSVia5wxvHAI54JcyEYi8YAhc+Ic=;
        b=TyMji1wp/tmyAjS0ZzAxzEYIprQPFI7mL1ozrlRW6r1E6VOOxi+GaBucCBI542uVh0
         M7um8TUId3eY8CpL+XjWYN/imtjBetdhGzvrX0xR1F7sjHuz32fdEtKJPa1BISQMRSLI
         TqbnOOuAkem4nva6OoD3WjlR2I76EImyeqsI16F4lU4c8ylEm8sEz+hpCAX/7Rv7bFlM
         6MLSJ3GFKbMH9c4r8RoPjdulM7z/vZr3iOiCRJq2hIRnu6c4o0ckMe+pTtuURhSBs9up
         qusZAIYTkzjk2pXBC08WiQa02w1oPAIrkQ/LGc6rLnZk0cvfh9f3fiCsxdetBck6y9dv
         ds5g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX8M+aMwkKCPc5SGwPNEmqmRfqLnLb9lQo8rgscsn0dFuLGZPOM
	RdRgSujVcjww5TWxVTKcbM0=
X-Google-Smtp-Source: APXvYqy2QziJbrTYO33Ekt3DQj73biJRg9J/ZSmvAn54QbHrpd8tvqLeY1/Yse1uSmCIY6MOrc1ygw==
X-Received: by 2002:a2e:7a19:: with SMTP id v25mr1678310ljc.39.1562833699094;
        Thu, 11 Jul 2019 01:28:19 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9dc8:: with SMTP id x8ls622419ljj.2.gmail; Thu, 11 Jul
 2019 01:28:18 -0700 (PDT)
X-Received: by 2002:a2e:781a:: with SMTP id t26mr1682881ljc.28.1562833698133;
        Thu, 11 Jul 2019 01:28:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562833698; cv=none;
        d=google.com; s=arc-20160816;
        b=VdDf9HBy0l6H7yyOPNKGWN3gMAPLQQvilZ/7GEVFcqjP8a+6uZAwrQYplfmbq1ya2q
         1mW5TJ8r9kSdH9Sh3RZLIB3PVBU1h1meJTAtprMWxwaWiVkfSIFhj6EzPm5FcjCqfTve
         loA3h4DYT6oZjltaZcqXno340M9LD13GcHufdz+I23hezdAn3KrjRauVt6zAkYMQrjPr
         ccGbS+3bnWkEj6cC9EmwPZ0L+Pn8rDk2GjpWlHyMDM6d5RK1vFWp1MLsSU6fbaZYLyno
         c+vQ/o3FJWiV5V/De9FT70LEz9gbejRRHyKj23/EocWYkr2hmBLEYkfKQ6LXSutsnGNy
         fmog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:to:from;
        bh=1pfdipDpMvnmVcbWgOAZvHP0JUrgWLr7wUcb+gThL1E=;
        b=S/RI+fzYp5hpS9Zq0Vp4nkx4TfYuNcjnnQjMvVaXduntTySU+7NU6ob7VYSYVDNxiC
         VG4Q46ogGo6rlAVLtKnsFaw3V9P5dnkR+N+1icMfOCuccthqjxutKIKPXf2PKVrZL0jH
         5lUM4dTnLdJLWr7nIXdiCphOZL1nyg5dw2lvd7CjTw5BrwxcDV6d902WJsuhZ+I++axC
         sU8g1oSjVlJjnrR3a4zmC3x+OgV18u1DZCWDp8NOIToGS+BG5E2ZLOCsusvt9bn7k6GB
         FJ9Sb4GB2FtH6vExt6SbTuZ0XXrNL5VelvCF8EfgDs2ivSM+QOzPLOBMOAioR3iGA3TW
         HC6Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id h11si331355lja.0.2019.07.11.01.28.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jul 2019 01:28:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x6B8SHas003444
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 11 Jul 2019 10:28:17 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.22.161])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x6B8SG7M010515
	for <jailhouse-dev@googlegroups.com>; Thu, 11 Jul 2019 10:28:17 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 0/8] Updates for 0.11
Date: Thu, 11 Jul 2019 10:28:08 +0200
Message-Id: <cover.1562833696.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Content-Type: text/plain; charset="UTF-8"
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

Just boring updates for Jailhouse, Isar, kernel and buildroot. This
should set the base for release 0.11.

The first three patches are already in master because I only thought I
had sent them already.

I briefly looked into moving to buster, but that requires more changes,
including a bootloader update (because of fatal compiler warnings). So
this should wait until after the 0.11 release.

Jan

Jan Kiszka (8):
  linux-jailhouse: Update to 4.19.46 and 4.19.37-rt20
  non-root-initramfs: Update to 2019.02.2
  Update to latest Isar next
  linux-jailhouse: Update to 4.19.56 and 4.19.50-rt22
  demo-image: Add machine name to image description
  jailhouse: Update to 0.11
  build-images: Remove no longer needed losetup
  Update Isar revision

 build-images.sh                                    |   1 -
 conf/distro/jailhouse-demo.conf                    |   7 +-
 kas.yml                                            |   2 +-
 recipes-core/images/demo-image.bb                  |   4 +-
 recipes-core/non-root-initramfs/files/amd64-config | 376 ++++++++++++----
 recipes-core/non-root-initramfs/files/arm64-config | 398 +++++++++++++----
 recipes-core/non-root-initramfs/files/armhf-config | 379 ++++++++++++----
 ...018.05.1.bb => non-root-initramfs_2019.02.2.bb} |   4 +-
 .../files/0001-configs-Add-Ultra96-board.patch     | 402 -----------------
 ...onfigs-Add-support-for-MACCHIATObin-board.patch | 489 ---------------------
 ...-orangepi0-Permit-access-to-another-clock.patch |  51 ---
 recipes-jailhouse/jailhouse/jailhouse_0.10.bb      |  18 -
 recipes-jailhouse/jailhouse/jailhouse_0.11.bb      |  14 +
 ...-rt18.bb => linux-jailhouse-rt_4.19.50-rt22.bb} |   4 +-
 ...house_4.19.31.bb => linux-jailhouse_4.19.56.bb} |   4 +-
 start-qemu.sh                                      |   7 +-
 16 files changed, 938 insertions(+), 1222 deletions(-)
 rename recipes-core/non-root-initramfs/{non-root-initramfs_2018.05.1.bb => non-root-initramfs_2019.02.2.bb} (81%)
 delete mode 100644 recipes-jailhouse/jailhouse/files/0001-configs-Add-Ultra96-board.patch
 delete mode 100644 recipes-jailhouse/jailhouse/files/0001-configs-Add-support-for-MACCHIATObin-board.patch
 delete mode 100644 recipes-jailhouse/jailhouse/files/0001-configs-orangepi0-Permit-access-to-another-clock.patch
 delete mode 100644 recipes-jailhouse/jailhouse/jailhouse_0.10.bb
 create mode 100644 recipes-jailhouse/jailhouse/jailhouse_0.11.bb
 rename recipes-kernel/linux/{linux-jailhouse-rt_4.19.31-rt18.bb => linux-jailhouse-rt_4.19.50-rt22.bb} (72%)
 rename recipes-kernel/linux/{linux-jailhouse_4.19.31.bb => linux-jailhouse_4.19.56.bb} (62%)

-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1562833696.git.jan.kiszka%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
