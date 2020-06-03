Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBIEO373AKGQES7QBZ7A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC651ED3C5
	for <lists+jailhouse-dev@lfdr.de>; Wed,  3 Jun 2020 17:52:00 +0200 (CEST)
Received: by mail-lf1-x13d.google.com with SMTP id 125sf930279lfk.19
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Jun 2020 08:52:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591199520; cv=pass;
        d=google.com; s=arc-20160816;
        b=sOVexNwO+elcUDZFokCje4HBlK57utgyaBOv9szMmqFY0POV69T834YH8HbChqmzdW
         GF8NULhTg5Kktsv2T2Wri2LlVmxGBCEcTEEeUHpCP4xZScr8YiGtKxROPPdd6A5IA+cz
         qlzL+4NNodrXRtHenGgvJ4vLAW/5RH8o8VsuF3ckvEEj1FZtZ2+/aCosKeiB6k5v5UnT
         LQwWS+cH7zlkv9T35eLgI+pkuKvOVULt3/X5z/CR31IBIxM2Zd8T/hlJ9SjsKyab62XK
         PbiA6POi8io1b2W/+QH3rnQDhIY92ktjMsAk3fIjyBRiyDsoX/bGYlBlenmnjRUCRho+
         xbfg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:to:from:sender:dkim-signature;
        bh=r37FJrvq3a0JDbu04v9weXmS7VCKNK2uZwgk7Yn4Mc8=;
        b=vL6oRpyIULvrfHoCiWzffpMCH1TqEeYKv6TijmjKM4zHAP7gwXEWQgpmaPtrDgh0Dp
         RSEmxP9jkxdLCdE8f4ChjEOIZ+B8uU+KVefo/jaz9fRaRGmIKCn6RP69eZMxt6Q4Ck8V
         Xf5NL3G3IjDuAfNE1R9nNsCeK+8Jp27jBF6SHHyvZoi8aboQAANIDWxV7fji5y06s+3r
         51B0aDtwaPcox66kFi62JCCs3kPM8fufmcrSRuAlbB+wqdKgAYaemiGhrirY8YdivsCr
         +cEz2oEgU0B1GkYOS+KqCZ4A4dvK0cU47mkFTD3tvUyNG1c6fGu/hmVgYjxeA1Yaf6D7
         KfHw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=r37FJrvq3a0JDbu04v9weXmS7VCKNK2uZwgk7Yn4Mc8=;
        b=AxobTPzhnbxMH/LVqlr2ob4G3dNQR+WHF2HlUEN1mowuxQOuXatfiDO8zJE4foCbZf
         2JxdlRLfF9sgT5m7s7uIgt1tQEOFM27vrXuebbfaoyZTcJP9KA3R5a2TpjGXI5+Vwa5m
         kkak2jzlFgC5/qq6QVJwRZBb3FY1CC/p2cfbgPEVOdZSuK3tg01h9h97KbexQlgFaIcz
         xHjidrRViN5LB+ThN4jHCpByP5/CWJ6ko/suZu3niQ3ln5w9A3L8mDv6xSUkwEVqwmNk
         XzbIKkZdQ6yBDpy8mA2RLVYdZiQhfAd7RNxDKRdO06tyTWRmMrt4KMjQz5BXkDu42t6+
         DBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=r37FJrvq3a0JDbu04v9weXmS7VCKNK2uZwgk7Yn4Mc8=;
        b=SxPtRAoTnaU17KFwzjUjBnpnhtXG2yoeKa5zFC/TuTnE7GynE8lua2k6M+tUJ5spV6
         SOKxPZhOvyMGQ0BBhwp2tyWUdSKh1wu74gWphI7T3CnJX+RQq0QOvygNvqi95eqbPUEd
         99kmnKGgy/h6nrfEH4ipIR/mVZDa/3ji9MS2KCJU/Ny9z2mL3Np3Mp6HUa8OCEpmhhn6
         N2zagMSaoW+f3vISnDRgN5vOspyNmhHpEg8S6GIAZXB5GFD4T5ZCXjAK/Dz0mjNLVN/z
         DCHYNVEUXomu03wqqMiYQXhnErs8/jkkDHMvN/0J+L31B14NynPN3/tma/CQNIX1qObG
         KeWQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5309Wcat8eDN88KNfqc1q6yB8fPIXcCZ+ZD2wkqImajatFeEZtSv
	xglgpSB4hUvNyES+erNQOQI=
X-Google-Smtp-Source: ABdhPJzhVfZ6Ea4EnWzqBVYayMTleLAOetQbAsGVF8/WFBSQa31BJ+BKSwlzHIxMTUGjx8Orc/bRmw==
X-Received: by 2002:a19:4b89:: with SMTP id y131mr104322lfa.16.1591199520213;
        Wed, 03 Jun 2020 08:52:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9a8b:: with SMTP id p11ls560984lji.9.gmail; Wed, 03 Jun
 2020 08:51:59 -0700 (PDT)
X-Received: by 2002:a2e:8ec9:: with SMTP id e9mr2528780ljl.152.1591199519265;
        Wed, 03 Jun 2020 08:51:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591199519; cv=none;
        d=google.com; s=arc-20160816;
        b=O+zUnbFx1XBMqRKDEmDGt9j4daHMhW1zP2UdMeS2TPB8dkWOPaDcPFQ2q5uGyqw3wX
         EEDIDybCUn5yfxQIRRmsznu1h2s87ziCDUNEEekSdjxXJjCiSh/vuJoluGY6fuKsVMHr
         eqbqho0TkF0iBZWG1NMAniD8XI9FYw/zHUT7JkdiQ8XcGItlnqAxGci49enif9ip7pKm
         0H2pARME+3Rfu4oGewRoeXaVeZRXPLUVMi4iBZcOzkBks3UGBhVS1l7oPMMvjqKKXY6z
         /9hJT5QqaY/HwjKvOUViJMPNOQIPWwsaj6Fy5cqf5B7OfY4ZSyEymwKMGluLHo6PBYaA
         XTDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from;
        bh=jWT/x77p0U0U79Y28nHMshOONNLZuurg9AWYa1CQF08=;
        b=U5J9+hL5qzhHmBQVJ8MnvHQOO8079Z0vgwG1L2gLZ8UM/YdMv3HQw/66HMMxgvg09X
         ALJpE1ciWYxTdbLVy8b9DCWiOVVRQqJQo7HQ9hjpldyHit2RTJYuCSb6/yl3qK/wbL16
         W+EbaC/qBZfWeGQ2aEvWNPqwQGYPYASQo0NDS3Y06ouAyMHVJHMG2d1pQbAeOrWZ7w1Z
         LFrq3XBWJRxC6WNoLoEHXrnSDomt/0zwf7JliCjrf1+MroZW7NsuOQR5epmjrLzZ6hHm
         iDHxl2SyUV+ecQDwbbAtAvl7mfSvD5K+eRupdA8bexDhw3ihRFcE4EQAlWiZJoYQtf+R
         OGSw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id o10si142554ljp.3.2020.06.03.08.51.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jun 2020 08:51:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 053FpwFv017200
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 3 Jun 2020 17:51:58 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.36.189])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 053FpwjR008838
	for <jailhouse-dev@googlegroups.com>; Wed, 3 Jun 2020 17:51:58 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 0/4] Just some updates
Date: Wed,  3 Jun 2020 17:51:54 +0200
Message-Id: <cover.1591199517.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

No new features, just a few updates of Isar, kernel and kas.

Jan

Jan Kiszka (4):
  u-boot-*: Do not use ftp URLs anymore
  Update Isar revision
  linux-jailhouse: Update stable kernel versions
  Update to kas 2.1.1

 .gitlab-ci.yml                                                | 2 +-
 build-images.sh                                               | 2 +-
 kas.yml                                                       | 2 +-
 recipes-bsp/u-boot/u-boot-macchiatobin_2019.10-atf2.2.bb      | 2 +-
 recipes-bsp/u-boot/u-boot-pine64-plus_2019.10-atf2.2.bb       | 2 +-
 recipes-bsp/u-boot/u-boot-ultra96_2019.10-atf2.2.bb           | 2 +-
 ...-jailhouse-rpi_5.4.29.bb => linux-jailhouse-rpi_5.4.42.bb} | 4 ++--
 ...se-rt_5.4.28-rt19.bb => linux-jailhouse-rt_5.4.43-rt24.bb} | 4 ++--
 .../{linux-jailhouse_5.4.31.bb => linux-jailhouse_5.4.43.bb}  | 4 ++--
 9 files changed, 12 insertions(+), 12 deletions(-)
 rename recipes-kernel/linux/{linux-jailhouse-rpi_5.4.29.bb => linux-jailhouse-rpi_5.4.42.bb} (62%)
 rename recipes-kernel/linux/{linux-jailhouse-rt_5.4.28-rt19.bb => linux-jailhouse-rt_5.4.43-rt24.bb} (65%)
 rename recipes-kernel/linux/{linux-jailhouse_5.4.31.bb => linux-jailhouse_5.4.43.bb} (62%)

-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1591199517.git.jan.kiszka%40siemens.com.
