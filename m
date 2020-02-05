Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBVEG5LYQKGQEFATV7WY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9771527D0
	for <lists+jailhouse-dev@lfdr.de>; Wed,  5 Feb 2020 09:56:53 +0100 (CET)
Received: by mail-wr1-x439.google.com with SMTP id x15sf837706wrl.15
        for <lists+jailhouse-dev@lfdr.de>; Wed, 05 Feb 2020 00:56:53 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580893013; cv=pass;
        d=google.com; s=arc-20160816;
        b=Wn6QeHzSoU1p5ixLK6AwDuy38ycBPf9irGVJa7ZoUzK/CF6x2slBD7C/oiLTxjD4TM
         6dh1imGVFj1a9XaVwI4FKczYhbD6zOENawozhzDhs7CTphMX8bX5CebEYb+gAN2/Mf91
         XmiUkksPm6u0LPvFD+jT3kicqN7Oum7XjvfMWb6r4N2DGueUxQWcV+2Y7/595OcXUVSG
         MNQTMqTNDt5sSXa1Rbmw/4SQaFlpRZ4gBvy+D9MeaFm3v8oGtUK4B9WFCUzXaLcNm1BV
         A3acL2EYrDA8ky7bezP6dQre137tYt1Luq2dKxF1dYOgQHGAypDKF5hxE/afYyZyZile
         XfoA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:date:subject:to:from
         :mime-version:sender:dkim-signature;
        bh=faZqSwGLyZ9/Enmp8cyyBGFwddEinLCYd24aD1ctdDo=;
        b=n3cT22Dsb+BIW/xLMObGk1kvU9wqys3v5PQsiRPh9FPjthsVU45vzEi44LzAheXSnI
         5jMfTmL6EzPtiOb23OSa5CJv7kNj2iE20cwgn4IOPVhq0LPZ7zmJAeMYFHOTgGMvOId6
         GTFod8kUo9qbbHesQARRPzh1hmGQWd5t0FJufq6A5SYJjpIRgQwKSqR4ciWWP1W+vecF
         ZjeAtfz2QDy24lRsx1gSgHeHHYlAftdx7H9CbCRxZqpyCt10rZewbXwK6jiyuYHfeCQo
         szW6gRKcYNs6qbw//pPQK4715/QsTABY08XpUisicM9t2pKruc+B5PwBBlpPtlXmx+5g
         jpiQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=faZqSwGLyZ9/Enmp8cyyBGFwddEinLCYd24aD1ctdDo=;
        b=PRP7sU9P99lSnvk+f2tFJ+96l3zIlsURqJAtAb/p9ZPGRnH4zTk0kCFC1Cz0vTkJWf
         oP5QGOJxgpcB8q3uQplUhi/lKclDlkHZoA6LTBNNnuYJKB2teHen1vO6EoRX3zhSYytS
         hXr//d2NbgzXB+iMB8p8eBADWHAaaiS66Jilz/wIRt/DTQY7veZowJoFnyee/wndrcZv
         oiXG4H1k89RHF/fWAJAMv6FppvmlTjJjRWT4NEI/xSVW+iLNSCEThmcomtauSssbo+7P
         1FKewKUfIta1dtNcAQTtCHTUYen45uIOZgLEgjqQfxMNn9PeeuQ4YPdsP3oxax6nBi7C
         CM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=faZqSwGLyZ9/Enmp8cyyBGFwddEinLCYd24aD1ctdDo=;
        b=QHIxvwmFTS/2M4MIiH+nCIYiTXD+az5XUzVVLntq1YJV9T69GhT8cqX9f8lY09rk/9
         KwziJRU55/pv7phrk7q20jQ0wDz5xH8xY9d3Z/7SVlv6PEJRPrbHdifeQUSurwiG8wfI
         fi7YOZWgc50UPdnp4ecUzyRywdI8TvgS1spw93l83WeduLIQjZVilaR8V1gGDfo3EBdm
         JtI/A5xoNY/a/5kRkoa0zqU823umFjmXxSimZ+8pmijkpViEvzi9GGaL24tdp/+A81YD
         KCfJCicyCqH+EmUUIFb5XVuQaM8oN2vWOuR/lEipWlEnte4eqoAtx910NAfay7Vx8Y+x
         qrdA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVp/H2PV/EGvdOL1tp88vAehc2nyxmUX3AWmJ5o3gePmQuf+rhy
	Y0j9k4seq6M5rYCWpLvhs+g=
X-Google-Smtp-Source: APXvYqz2lz1DRjshXyDjc5sR99aeXjXcGCA+w9KTtfHWlosXGiZ5qPC5Z2qgLKAoAFH6MDHBRK3udQ==
X-Received: by 2002:a1c:ddc3:: with SMTP id u186mr4472916wmg.103.1580893013185;
        Wed, 05 Feb 2020 00:56:53 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fc89:: with SMTP id g9ls515224wrr.5.gmail; Wed, 05 Feb
 2020 00:56:52 -0800 (PST)
X-Received: by 2002:adf:d4ca:: with SMTP id w10mr29155867wrk.53.1580893012328;
        Wed, 05 Feb 2020 00:56:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580893012; cv=none;
        d=google.com; s=arc-20160816;
        b=f6R2X9a4imdFxZvpIgfp2VTPCGlOWuaSXcXZhKFyvQYOx+G3hz8refJdNyi+ThwrOm
         /ARxYIaOaSPu9kxHzAbJWQkCCcnarb+jG5BnmZWMQIF0ZEcp1vCt704Rb094sRxuSlYx
         5OivYQ0m3JOFEWyzob6Lfk5vw1kagbPNbHQNiEJd9817EvCSgsQTCRWLrqMJXhtsoUIg
         Elwyuuch5dMtJBQ1JreKYS2Xiyw+lobf/LrimyOhUSChS2EcBTrub/lMHkOSKOSFCjpw
         ybnzy3xCDjYcjPerPhKPiZtSkQ4Ow28GsG0oZT8VfRbGK8zW4TBWomav54RzO5ZwOd28
         1yMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:to:from;
        bh=SswUXB2UDgM6QK6tCI7crGY1kj14a1KjknP5Sdr/514=;
        b=pK5md3GjJsq29+3+qUdI9LqyeeJXVgeeJklmHwEj2mg4RyCMOK6/A/klOrPfxQXsTV
         3PjeBwSnsgxW34pq54OV1F6C/aguDkrk38xBWXD8RANw0cqNAqRLmOkROS/hHE4hqSBX
         VyN5jpPhDp99UV/9A1hid9NPVUnRC46w1hFL24RBl0ag4SEr0qXoFBUqEA8e3vcocfBP
         xY3VrXn0VGMw16gH0kHfJaRS7pGOq0Iq3qKv8P3T0AJT1Tg6nKFELEIxdjU/ZM/SOd2Q
         EDbYetdMgqhT2saTiCK0AMqeF4hbhN2vk2BkHXR4FHOqzKrPP95MsFrPPy1Qqce2L27Q
         I34w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id m2si293567wmi.3.2020.02.05.00.56.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Feb 2020 00:56:52 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 0158upqw013010
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 5 Feb 2020 09:56:52 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.54.219])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 0158up0k006156
	for <jailhouse-dev@googlegroups.com>; Wed, 5 Feb 2020 09:56:52 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 0/7] Update to Jailhouse 0.12 and refresh some packages
Date: Wed,  5 Feb 2020 09:56:44 +0100
Message-Id: <cover.1580893010.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

Jan Kiszka (7):
  jailhouse: Update to 0.12
  crosstool-ng-microblaze: Switch to github download
  linux-jailhouse: Update to 5.4.17[-rt9] and rpi/5.4.16
  arm-trusted-firmware: Give download artifact meaningful name
  rpi-firmware: Give download artifact meaningful name
  non-root-initramfs: Update to buildroot 2019.11.1
  Update README

 README.md                                          |   13 +-
 conf/distro/jailhouse-demo.conf                    |    2 +-
 .../arm-trusted-firmware_2.2.inc                   |    2 +-
 .../rpi-firmware/rpi-firmware_1.20190925.bb        |    2 +-
 recipes-core/non-root-initramfs/files/amd64-config |  395 +++++--
 recipes-core/non-root-initramfs/files/arm64-config |  399 +++++--
 recipes-core/non-root-initramfs/files/armhf-config |  412 +++++--
 ...019.02.2.bb => non-root-initramfs_2019.11.1.bb} |    4 +-
 .../crosstool-ng-microblaze_1.24.0.bb              |    9 +-
 .../crosstool-ng-microblaze/files/debian/rules     |    1 +
 .../files/0001-arm-Fix-build-with-gcc-8.patch      |   56 -
 ...-arm64-Fix-vPCI-IRQ-assignment-of-Linux-c.patch |  170 +++
 ...1-x86-Permit-root-cell-to-enable-CR4.UMIP.patch |   28 -
 ...ic-Rework-and-fix-redir-entry-programming.patch |  115 --
 .../jailhouse/files/linux-nuc6cay-demo_0.11.c      |   94 --
 recipes-jailhouse/jailhouse/files/nuc6cay_0.11.c   | 1234 --------------------
 recipes-jailhouse/jailhouse/jailhouse.inc          |    9 +-
 recipes-jailhouse/jailhouse/jailhouse_0.11.bb      |   26 -
 recipes-jailhouse/jailhouse/jailhouse_0.12.bb      |   16 +
 recipes-jailhouse/jailhouse/jailhouse_latest.bb    |   11 +-
 ...-rpi_5.4.8.bb => linux-jailhouse-rpi_5.4.16.bb} |    4 +-
 ...4.5-rt3.bb => linux-jailhouse-rt_5.4.17-rt9.bb} |    4 +-
 ...ailhouse_5.4.7.bb => linux-jailhouse_5.4.17.bb} |    6 +-
 23 files changed, 1101 insertions(+), 1911 deletions(-)
 rename recipes-core/non-root-initramfs/{non-root-initramfs_2019.02.2.bb => non-root-initramfs_2019.11.1.bb} (87%)
 delete mode 100644 recipes-jailhouse/jailhouse/files/0001-arm-Fix-build-with-gcc-8.patch
 create mode 100644 recipes-jailhouse/jailhouse/files/0001-configs-arm-arm64-Fix-vPCI-IRQ-assignment-of-Linux-c.patch
 delete mode 100644 recipes-jailhouse/jailhouse/files/0001-x86-Permit-root-cell-to-enable-CR4.UMIP.patch
 delete mode 100644 recipes-jailhouse/jailhouse/files/0001-x86-ioapic-Rework-and-fix-redir-entry-programming.patch
 delete mode 100644 recipes-jailhouse/jailhouse/files/linux-nuc6cay-demo_0.11.c
 delete mode 100644 recipes-jailhouse/jailhouse/files/nuc6cay_0.11.c
 delete mode 100644 recipes-jailhouse/jailhouse/jailhouse_0.11.bb
 create mode 100644 recipes-jailhouse/jailhouse/jailhouse_0.12.bb
 rename recipes-kernel/linux/{linux-jailhouse-rpi_5.4.8.bb => linux-jailhouse-rpi_5.4.16.bb} (62%)
 rename recipes-kernel/linux/{linux-jailhouse-rt_5.4.5-rt3.bb => linux-jailhouse-rt_5.4.17-rt9.bb} (65%)
 rename recipes-kernel/linux/{linux-jailhouse_5.4.7.bb => linux-jailhouse_5.4.17.bb} (52%)

-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1580893010.git.jan.kiszka%40siemens.com.
