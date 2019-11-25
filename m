Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBT5S53XAKGQE6PYYLDY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id A10AB108A73
	for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Nov 2019 10:05:20 +0100 (CET)
Received: by mail-wr1-x438.google.com with SMTP id m17sf8373284wrn.23
        for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Nov 2019 01:05:20 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1574672720; cv=pass;
        d=google.com; s=arc-20160816;
        b=FOHedZVGrErkHFQehM9EntHLitRtonpoAxy6QgNd5WE5BwlAsdZCs8dCZQ/UU1jmG0
         hb9vlRbc64HjS3gS0jX3Gihva9u04DAggdSPNbrCX6okTeqYTZH+xoc63mRe+hg9OpUg
         Mv3LqQQXoKxr1Oj4MUHsddgJc1buqaGL2GR+2vuUCJAMTbG7TyuAnktiP7cyArnJxM1g
         J++Ou49IE65dxe3v8o7dN4JKvlabrh7r5rJKL7cRJMuO7v2DOWgANK8rmTAQgFW5vgg4
         UYQzzBFdKBUZzRr4Cv45U7sHLHoeVgIJPQQmVwQ5DNAT9yFGK16E1vUPriE6iHB7abej
         2U9A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:date:subject:to:from
         :mime-version:sender:dkim-signature;
        bh=TTZwSHikfGzmzyjhJEe7khvySHXZfB2DKViauZA1l3g=;
        b=uXMewL0VUNE4rEHyKPy6pZU/OKRT9g4i9BuPQbFOvU2PTQqLV6AF7qiPG2WPxswgFm
         OjT8QbpKMYHodC2chYekTT8FAstKYXfczN/QCjqM7giTYI5eStO4cPFHEyPZgDVhQt9l
         5NLhu7BcVdI8dqV2N/+0jkd6MziRk3Zy5G2Ubmng45/F//LLB+6wgHlKpt89ra7Ro/9Z
         LHEhfkBS8tdIqSvalNAIbsogZ05moSrel1qwXH3IQIu99aOBQvF7jsyCk+hjxEde8m1n
         Jidq58vBee3ZeLWgejQmxJs8qY9fGlKCZulfv8NIVzWUPp4FRXLDHHT/+m4vY+lOQQ4I
         5ZWA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=TTZwSHikfGzmzyjhJEe7khvySHXZfB2DKViauZA1l3g=;
        b=Tc4Vl9EpiUGHhyMxoujIoJnN5fgD7sDrCovsdXtTHjmRCfnPxV626jUQwSJ5ooR+Dd
         T7Uj5y7Doip0cJrNaQs/p4L4cP90N9X8h+CozZDPUEcnbTy3tuR11PyFeox6LeC0eqX4
         pL4vK+pEWH2VxgewwXf4Idh5KQ+cAIBzbIJQsvNVznxRvPLd715wh3aErstRONT6gXew
         MMXSM/AfijdrClM2G3NVimPoPcXyAU6khOFkfv1d9yTg/MbfAFbBQZlu9PS+AvLHfrp5
         lpTlXHdKEUXCLuZqIQj0MjD4fr1GXlBAW6T648X3hnHLKu36o7MXm787Iq/hh6VA64XF
         M4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=TTZwSHikfGzmzyjhJEe7khvySHXZfB2DKViauZA1l3g=;
        b=IUG2MyAfwIeeS5Rwd5yxs14MbxoM2wBhu3q4JxK2sdnssL7gA5hz3hawGV11Sz1pC8
         1kUQtQlJyjHmiF9IQdiZnBh2r98imf7gyOB3b2Fnimj993dZNtuvcEVaR0xtW+EzatWp
         8PDGg26qJj2rO1oatFhB5TbolYaZjnXK28tjqpaMiA+fIAuZTfz58nxMMulXenX50fFd
         PfmZ+BMs/KHlFUHQaGuxDdKkRic7aFJ0ixcNrMuClfsMUaXv6/eztdSSCjx+foyo9HK3
         Tua7qr8IhxpyCnHvJOkZwiGZGqByqIJtBA8uSXR15RRMZaynwAdEpoi2uxOrFonGqc6C
         Q6SQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXbCrxeJfdhI4+KBoa4GM3tzr2e32u5HDpGgC336TCu/0MvMXnj
	GHXSffeNtFRrh6J2JrN5hy8=
X-Google-Smtp-Source: APXvYqyxgGytztJDBilSqRMm4+vxli/73hlw3dxHunbERnIXjkUJl6Vv+FIolq5VSHe+UU6fNjS3jQ==
X-Received: by 2002:a7b:cc13:: with SMTP id f19mr28396619wmh.81.1574672720283;
        Mon, 25 Nov 2019 01:05:20 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:1b0b:: with SMTP id b11ls8090923wmb.3.gmail; Mon, 25 Nov
 2019 01:05:19 -0800 (PST)
X-Received: by 2002:a1c:6146:: with SMTP id v67mr28088064wmb.102.1574672719403;
        Mon, 25 Nov 2019 01:05:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574672719; cv=none;
        d=google.com; s=arc-20160816;
        b=YXcZJNX55mV2kGeyouT1rWX+7qeX7yONa3UGN6ShmzsxjhBqs1uaD2w0ZYfSmhbBNm
         FG4u6Axr+Ue6cbvIJf6Pwe7Ze2ejXtGG/3QFZFw2NcqOvXjr9rVU1BlcDXKl4hZJxvpV
         lhTx1joQ+G6KgTGWe4CqRmWQX/8HSNQmc7YmNhWeccZw/olFiv+I8FlfJpY3bZ0Gtmcy
         pCSk0/3jHXcptDA7HIIy7FjDq42t3m8vUA+dvKDR/VuSI+uI/67a6XcZkpPUXZ8VLQLa
         +0TD13CfxEWmZ3l+1+N/4lCcGsSUeWQcLqWvJQKHiZGxmwJvOTPygklBMJ/19Vn1DwRi
         WiJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:to:from;
        bh=lUnJOsOWPH2ILJxMZGIFouhUqB/rapc/JrbD7CrzCos=;
        b=x6GTiww44x+DJfc6dm/NoGlAtuOZDeziForIU3ykNGCFcmwe0WH72nPmX8FXGBPPfH
         9bh9UzCvgxC3MITsv/LsBt/yFAvlVP3fKZmHueT2NAy1vF0bDInhekT/wOldkE+TPhF5
         IXIh/lJAMS33Ml29dnlOuMNXl4lSg0kzJxJDAYJ3ph97jRoaRYIQc33sTNDyPCnplXw/
         7LcKkyy++QZQq0lOqHFWf3jSyuABDtQWWpEscUlxJFBqsoSjjhCHQn7KT1l2/BGuOv7O
         GOt64o2B+KQhQeD560EC12eB/oFdXLZsDJgtOTTdoCMk79hd5FXcByQW6aG3jZPalH44
         tFXw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id g3si198255wrw.5.2019.11.25.01.05.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Nov 2019 01:05:19 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id xAP95JcR008708
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 25 Nov 2019 10:05:19 +0100
Received: from md1f2u6c.ad001.siemens.net ([139.22.116.118])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id xAP95Ia1030833
	for <jailhouse-dev@googlegroups.com>; Mon, 25 Nov 2019 10:05:18 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 0/3] Isar update, fix for broken u-boot-ultra96 dependencies
Date: Mon, 25 Nov 2019 10:05:14 +0100
Message-Id: <cover.1574672717.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

See patches for details.

Jan

Jan Kiszka (3):
  Require kas-docker / kas-isar image 2.0
  Update Isar revision
  u-boot-ultra96: Import fsbl and bitstream binaries

 .gitlab-ci.yml                                     |   4 +--
 build-images.sh                                    |   8 +++---
 kas.yml                                            |   2 +-
 recipes-bsp/u-boot/files/ultra96-fsbl.elf.LICENSE  |  27 ++++++++++++++++++
 recipes-bsp/u-boot/files/ultra96-fsbl.elf.xz       | Bin 0 -> 35000 bytes
 recipes-bsp/u-boot/files/ultra96.bif.tmpl          |   4 +--
 recipes-bsp/u-boot/files/ultra96.bit.LICENSE       |  31 +++++++++++++++++++++
 recipes-bsp/u-boot/files/ultra96.bit.xz            | Bin 0 -> 37672 bytes
 .../u-boot/u-boot-ultra96_2019.07-atf2.1.bb        |   9 ++----
 9 files changed, 69 insertions(+), 16 deletions(-)
 create mode 100644 recipes-bsp/u-boot/files/ultra96-fsbl.elf.LICENSE
 create mode 100644 recipes-bsp/u-boot/files/ultra96-fsbl.elf.xz
 create mode 100644 recipes-bsp/u-boot/files/ultra96.bit.LICENSE
 create mode 100644 recipes-bsp/u-boot/files/ultra96.bit.xz

-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1574672717.git.jan.kiszka%40siemens.com.
