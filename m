Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBPVNWP5AKGQEW3NJKMY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 734422577C3
	for <lists+jailhouse-dev@lfdr.de>; Mon, 31 Aug 2020 12:53:51 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id 33sf3091441wre.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 31 Aug 2020 03:53:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598871231; cv=pass;
        d=google.com; s=arc-20160816;
        b=A8QywyCi89Yl6CVBqvAqz6UKxWSuFN6xwTQbE5J3tbK0aUH+6yFfTD2e4zRUw6X9mm
         gQ2y+epdXsKfWhhDAkJmA/5YIuQx7L3/VYsKcDS7TyDS855BXULdx8iGUBQs7cmmDm2A
         CBfn19xvON/BmrIvxT9rakrNMewfnWqQZDw4rvwdmYGi7DPmzrO+7ViomEMsQGy20FzA
         PCDPFUF4u9z0GEEEwhRrZlv3M911q7ZtDGzdWyeZo3fNsMGibSEbUjRmcsbiV/wQut5e
         73HmXSV1wkBXUTOZRBdq7EGOa+oKtFmqhSwl/g2XrvbS0Ja5BTBV+lctkLxuvTsE1Gmd
         UIcQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:to:from:sender:dkim-signature;
        bh=v8neCOUQPm1rFG9Gz0eljmAiTKpBR6789TMaIVNlAMU=;
        b=zxQoJn1jP/NoZzIb/JiaBs3FtCUMpD4s8g6FGEZjmouvhv4qgvMTCh3bmz0KuouEQo
         PCjwbIeFoZMcLJEMhLVPVgO7+EtDo51WLeHOBCFDy3vyDUw9V583JZrQzLISZIJp623R
         Dn0t4lStJ/cx00d+I15bteiAM6brGfdxL1lKPLi/HVVg/tqGdU7/KpuyyQqGNlNXUeMD
         iLkDXgWIfOnJnCrTPOg4AWXT37tknmbcaMtlADDhOXdseOtNM+SqqllDEix5diZhaD/j
         QYj94MtJRzgGwlmtunchr4pRQkwS62sEVMXQiTdRUDcp7ySSseioaYpsfjqHFM3zqD6O
         p5wg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=v8neCOUQPm1rFG9Gz0eljmAiTKpBR6789TMaIVNlAMU=;
        b=ihnYYZjU6Zkk4zMjvYxZBNMhSY4bgcHI3HwMEI1Lom5Jsa477RNxn76qT5vDcAD/WA
         ZkKf3YAv9vsHT1ZMP7jvQS9C0IITS0ErwqYgXVZMJj5XD2shEsxFrg0wIqSoVcb7hGF5
         QHSMF1Q5t01j3dI/D4+d5Jo0aC6lLTD21ZGa8uiwoBLWIJCfbSgW3WqyRsnzJ9xPbf62
         FzxkBYVQzWE2GwjmzElHUsubXQ1aQrIk/BFl+0WYL6ik8HxUOUvmkOrXitzAT8bQlcwt
         JPhrwhKGFn0TSia1Orjm08u75uDpC8LIvmy5IDmVlfy7csZdc2+U9qJWB6pQFoJ4Lckq
         IQmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=v8neCOUQPm1rFG9Gz0eljmAiTKpBR6789TMaIVNlAMU=;
        b=GfRHsp6fyOd1dKBh+RIJNwHV47qswmBF6/DOrKmg+bEPpYeW1G7fvWUBtSnJjCWlpS
         v1gXWPBTc8rly/LoZEP8GLbss/GZKPSaKTuQ0lJ2tUkItIkmFAfYHlP5tbUVGkz2bpl+
         0asj1U7s3sa/2VORfm4uDEiTcCutkjfn4zDA59KbVU63ybTygSmUIwkLuU2sf3kjeK3A
         jT+TzjEU72eTJ1pr09JiIyPnK9XLk7ZwN9gLjMoI9MRU5oDEEzSEAY/WvhsrXJ887y5R
         Gn0X/9kQq7sHBPt7qi7xjZSAipv1JDy/eZpiM+jPrmbSGYBjYKJE+tf+YXCyhP+Dm2cv
         +kaw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5310/MnAi8m9yF5iHMBKxfo1T4WLKC2VBjTwK6I/5G3KWkb0AVZ2
	1wGjYnDLZHMmunlQ+OLfDz0=
X-Google-Smtp-Source: ABdhPJwSroaw9iYbfWjcJXrHuQjV2VSGVcGcEUITb0I2IsXc5QAAX3QkwbdR5nSvrVWHnTEqgcmHTw==
X-Received: by 2002:a5d:684b:: with SMTP id o11mr1151533wrw.101.1598871231195;
        Mon, 31 Aug 2020 03:53:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:a58a:: with SMTP id o132ls479994wme.3.gmail; Mon, 31 Aug
 2020 03:53:50 -0700 (PDT)
X-Received: by 2002:a1c:7d0c:: with SMTP id y12mr354608wmc.103.1598871230412;
        Mon, 31 Aug 2020 03:53:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598871230; cv=none;
        d=google.com; s=arc-20160816;
        b=G6205IhXSbroSd8eJrB91MPK2uhM9l1lUSsDHQvLX3zVHWBX0iQhbUguawO+7FzvYs
         3l6ACHfJW3vS3Y2PIiQHf532CRPBR29VfFeEViXKOZhxfVGXfE738Z5mWLSYgNcIcpGS
         wn0orpO3kPljoA9EFfILxwh1ZsaLU7awleZXgkEDgpqgPvZNjq/oX83g+eNS+RjKF5f/
         Qjxw9hKD5Oh2UACNTwkHenWa2FqiVAvzs6ccCOkiCMpAgGguFLFCQ5i8ryIVOz1yRpia
         55dCH5OIhkRmQ6AkENwGNs/44J8lcx0M46xzIk6EeRFsYMuNKfDdAMl78ca0v2Nj68is
         H58g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from;
        bh=4sE36CnuHcjyCViYeOpWy1Lw76geNSWh4S1f4dMvEwc=;
        b=BDW1nT0Z2XsyWEPXrsI/YtF7lNJ2Uzlv3nfQFShxj9xIJp6WPtxbZzLT2HDgNqOTl/
         XoM/D/KB5zp222RcyDBhOmDp5m0WDtlaOy6n46AlTL8UNLOyEaLRi/uDb2GSvK/2rPaL
         qacGhKhrW2GPGvbx9X1EESIgpTxnX/NGgjmTBqCli+8iM+oc4Dfldy1+QTIyCbOBF22q
         TpPBIcPitVksVlBt3PTyzM9P2zH0+8ayLhaZhZLtrS3qnl5czpm3IxiwoUDcroXelZj1
         ZhvX5u0Uz56XUDD8SEDWiyCAME7AVUsu1+GuZkN4/we9yKXktJMf+o6tHja1pqlTKe8Z
         Plgw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id w2si65113wrr.5.2020.08.31.03.53.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 Aug 2020 03:53:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 07VArnNE023773
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 31 Aug 2020 12:53:50 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.39.104])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07VArnQg026382
	for <jailhouse-dev@googlegroups.com>; Mon, 31 Aug 2020 12:53:49 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 0/5] Updates, support for all RPi4 variants
Date: Mon, 31 Aug 2020 12:53:44 +0200
Message-Id: <cover.1598871229.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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

See patches for details.

Jan

Jan Kiszka (5):
  jailhouse: Add GICv2-related upstream fix to 0.12
  linux-jailhouse: Update stable kernel versions
  Update to kas 2.2
  Update Isar revision
  rpi-firmware: Switch to overlay-based RAM reservation to support all
    variants

 .gitlab-ci.yml                                |   2 +-
 build-images.sh                               |   2 +-
 images.list                                   |   2 +-
 kas.yml                                       |   2 +-
 recipes-bsp/rpi-firmware/files/cmdline.txt    |   1 -
 .../rpi-firmware/files/debian/cmdline.txt     |   1 +
 .../files/{ => debian}/config.txt             |   1 +
 .../files/debian/jailhouse-reservation.dts    |  21 ++
 .../files/debian/rpi-firmware.install         |   8 +
 recipes-bsp/rpi-firmware/files/rules          |   8 +
 .../rpi-firmware/rpi-firmware_1.20200212.bb   |  24 +-
 ...d-support-for-RPi4-with-more-than-1G.patch | 306 ++++++++++++++++++
 ...on-gicv2-Fix-byte-access-to-ITARGETR.patch |  52 +++
 recipes-jailhouse/jailhouse/jailhouse_0.12.bb |   2 +
 ....4.42.bb => linux-jailhouse-rpi_5.4.59.bb} |   4 +-
 ...4.bb => linux-jailhouse-rt_5.4.58-rt35.bb} |   4 +-
 ...se_5.4.43.bb => linux-jailhouse_5.4.61.bb} |   4 +-
 17 files changed, 421 insertions(+), 23 deletions(-)
 delete mode 100644 recipes-bsp/rpi-firmware/files/cmdline.txt
 create mode 100644 recipes-bsp/rpi-firmware/files/debian/cmdline.txt
 rename recipes-bsp/rpi-firmware/files/{ => debian}/config.txt (80%)
 create mode 100644 recipes-bsp/rpi-firmware/files/debian/jailhouse-reservation.dts
 create mode 100644 recipes-bsp/rpi-firmware/files/debian/rpi-firmware.install
 create mode 100644 recipes-bsp/rpi-firmware/files/rules
 create mode 100644 recipes-jailhouse/jailhouse/files/0001-configs-arm64-Add-support-for-RPi4-with-more-than-1G.patch
 create mode 100644 recipes-jailhouse/jailhouse/files/0002-arm-common-gicv2-Fix-byte-access-to-ITARGETR.patch
 rename recipes-kernel/linux/{linux-jailhouse-rpi_5.4.42.bb => linux-jailhouse-rpi_5.4.59.bb} (62%)
 rename recipes-kernel/linux/{linux-jailhouse-rt_5.4.43-rt24.bb => linux-jailhouse-rt_5.4.58-rt35.bb} (65%)
 rename recipes-kernel/linux/{linux-jailhouse_5.4.43.bb => linux-jailhouse_5.4.61.bb} (62%)

-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1598871229.git.jan.kiszka%40siemens.com.
