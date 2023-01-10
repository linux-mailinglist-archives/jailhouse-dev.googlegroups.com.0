Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBT5K66OQMGQEZPL4EII@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AF8664DE1
	for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Jan 2023 22:14:56 +0100 (CET)
Received: by mail-wm1-x33e.google.com with SMTP id n9-20020a05600c3b8900b003d9f14e904esf3592014wms.9
        for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Jan 2023 13:14:56 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1673385296; cv=pass;
        d=google.com; s=arc-20160816;
        b=Pk7+FNMWF5iQ0LiqseqEl1UFVzjMDQbbulQv+7J5SMjgMs2hAhi91sgQETyWY81lM9
         4gHkiBao87D2VIacOxO8MeAsX5Y0yWMA8OhBfmOoziVBL5ngr3nJMdH9L65fEPS/axDB
         3orhqTysaUwlQ1eab5mV9skSZ5mUzqk7os1WNOofVPbpLWoMsxgJtPF7jiRK+FVbVTri
         T+g2FE0PXA1eJR7L35p7tmtvk4YEKteEU0IlMdZYSvd9iaruyw+Odk6tnTV/El+mk/Ni
         nHNbL24y6pVL88qpQGkc2C4FQPBBjfPK7oPHGpYBWBFkLNr7cCZCyBpAFodm/YO4f/RX
         i9LA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=VQfd338KcnV09+u3K2/D19nUtRmhVqJDziQ/RGMH5As=;
        b=vZbjHpR9e1XR3kEPv+1D9IzXacdxnGrXvrasl7OF2zJA923mLGCTsFxmeXNRZUBzoE
         HkCrgXjfH3md7Hyo9nfSPSYHzmvstfw6w6+M8qYV5AQel4wz5/wNZWrBYzZzohP5oze5
         jFgUhMVyEiazcAtyGzrx1vSjaDLZpqi5Mvtuss1m3OMEspXm160pY0yFbrKNdhrInMKR
         hgaQMft0El6YX3VSfrlYs4Q/x05alF3NTtaSs44gVR518sy+NrwKl9zYxXk62kh1nqww
         9T0lav1bE8cmOf37rsje/RWYT549WUBjahPrkSHGpedrHkaw7V930PJ0ra5IYZFE5LPY
         hU9g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=kZHr1XM+;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:message-id:date:subject:cc:to:from
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=VQfd338KcnV09+u3K2/D19nUtRmhVqJDziQ/RGMH5As=;
        b=BWhxBYKhQ94PpCwm5ZLfi0hEvwfltGVDthm9n5A1S8TJVVemL3JbY02EOPHp/XS8gf
         qiVsAlOT4CUre54zlNMBbDTOcjG0celKIGyznB6yD9bayR4zp/k7IsrJwrXjgMXO/OYB
         PQhTx9TMk3q/l4rAZEFoSirUsRhBz3RWT30Ll8c9ITPrSlsNS3Mj5VMVpVPFewsmf9tl
         Ovzeg9AVYqjEdd9NERuHmDSA0TqGjyjTdRJhEcLMYbBO8NNBwXGXKLCdCdaICnyLI3G1
         Qnw7tp0s6TIPUhmSf5bsgrsegCbnF8lNdl4aLiHRr3TqkFn+g+QBrXTjMOmJaUusULgA
         ftFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :message-id:date:subject:cc:to:from:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VQfd338KcnV09+u3K2/D19nUtRmhVqJDziQ/RGMH5As=;
        b=YI4Bpx29djrGV5+/nvgtxvVMkfd0TO7OGHrd9VANO9dsGjRbxwa7bkD1uFBybANZfJ
         kdo2fwiTRT3989wzprlxKlnMAChCiXs7CP4e6IbSuqQ4xUMb5ffNk0WOl9wSo0FaL+Qv
         UrXyVA6ty9k5EIHDiQGK1wwPtIscUhYbFCO7ORofjGxRF95X03Rly9HxwPXGNRg4FHHz
         +ukRbShiSdwKYoJHP1UeC5YAol1UWDbObY9v7BBwPxOMVXz/pOHtKZ0rN4PSBXB2c3jS
         ywc5D5o0QQC6uXwOoS/mM27Q1khemrv4yJFNA53cCdxPiptncmFqQjVyWYtY6hxybQEw
         H3VQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2koQJIFFXI2az9Iwq28uC/YP0FjV9l4/qJpHycRRiCMPD81onD4N
	uw/4kdkInBNaxPgHBxo+pCc=
X-Google-Smtp-Source: AMrXdXtaiZuag+w8YGlD0/gYRpv2efSW5AAEZQ/02ksQYu29bL6RQptpCtrk511K4uZ7oWzx0sV+Bg==
X-Received: by 2002:a05:600c:1c20:b0:3cf:8e62:f907 with SMTP id j32-20020a05600c1c2000b003cf8e62f907mr4412272wms.7.1673385296358;
        Tue, 10 Jan 2023 13:14:56 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:f409:0:b0:3d9:bb72:6814 with SMTP id z9-20020a1cf409000000b003d9bb726814ls4115wma.3.-pod-control-gmail;
 Tue, 10 Jan 2023 13:14:54 -0800 (PST)
X-Received: by 2002:a05:600c:4496:b0:3d3:47b7:569e with SMTP id e22-20020a05600c449600b003d347b7569emr49460931wmo.2.1673385294418;
        Tue, 10 Jan 2023 13:14:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673385294; cv=none;
        d=google.com; s=arc-20160816;
        b=Vn87KVhH0MX2sOA6I2jFm6u+fu/3+WMTkrx6Hj9Tn22tL/jlO+gayssjpRDRGg8cvS
         RRGe5WvAd9H4cr+cr61mP5MexMHLlyOHvkgKkGF0AJKmMV6iY6LevBCXm0mD9FcqiuON
         YBgblqnIlLm6W7VaLpP3MgNBpoVybCA2vy8M3FBtadlyaI9gVi0elyoqxDg01rgbJ2CP
         wDDMzIZKP1sVEFWgkRJgBk5zuuNtEbeL4BE+g3j9LyXQo47hTcZcoiizj7osHs3sDw3y
         G8/r4KbPy8r7AcFJZqEe3J9BskOWDT5BMUjIx9Yvgozh43G+nrh8u404xp74W49fk8/U
         mVGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=eO/7sPzsdqD5Dg12yuWgVcxBiat7rh/lXVQVivx9uqI=;
        b=nRSy1uCGoO1s8luAzYsACCZeZW48lsMEJCD9i8JbWToZarjyzqqj4/FyExKwni7z9D
         9zhFw8FFcFjU20fOSN1Ogg3jYaO6ojTgfI9WO7CrBqVjD1S9a2K3x0Mpt+weNYHfeiYT
         9z1rXXQa43hvWp2KcGaQom9tW2407g8Qu1WedjoMsLyroRASRzU4KjK7n8PP4eSsTfdX
         uSVK9LB7JdAs+f8seCnyIB5vZ+2C7VBnq2whjrqNjwy6RorzSZJmehDoYhZDei5Hkt06
         KZCKIj794Onybefo8GbeFSX4Gsb8HnEZUB0amHR2enNvFz4RphnC2voLiSX2B8Fd3ta0
         uMMw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=kZHr1XM+;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id e22-20020a05600c4e5600b003d9c73c820asi127183wmq.3.2023.01.10.13.14.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 13:14:54 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4Ns3VP6HH9zyNp;
	Tue, 10 Jan 2023 22:14:53 +0100 (CET)
Received: from atlantis.binary.kitchen (2001:638:a01:8013::226) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 10 Jan 2023 22:14:53 +0100
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Stefan Huber
	<stefan.huber@oth-regensburg.de>, Andrej Utz
	<andrej.utz@st.oth-regensburg.de>
Subject: [PATCH v2 1/3] configs: enrich configs with architecture information
Date: Tue, 10 Jan 2023 22:14:42 +0100
Message-ID: <20230110211444.9897-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::226]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=kZHr1XM+;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

This has two advantages:
  - Automatic architecture detection in python tooling
  - Sledgehammer sanity check when enabling jailhouse / creating cells

This commit just adds the field in the cell/sysconfig, adds the fields
to the configs and aligns the config checker that it will not break for
the moment.

Logic is added later, config revision got increased.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 configs/arm/bananapi-inmate-demo.c            |  1 +
 configs/arm/bananapi-linux-demo.c             |  1 +
 configs/arm/bananapi.c                        |  1 +
 configs/arm/emtrion-rzg1e-inmate-demo.c       |  1 +
 configs/arm/emtrion-rzg1e-linux-demo.c        |  1 +
 configs/arm/emtrion-rzg1e.c                   |  1 +
 configs/arm/emtrion-rzg1h-inmate-demo.c       |  1 +
 configs/arm/emtrion-rzg1h-linux-demo.c        |  1 +
 configs/arm/emtrion-rzg1h.c                   |  1 +
 configs/arm/emtrion-rzg1m-inmate-demo.c       |  1 +
 configs/arm/emtrion-rzg1m-linux-demo.c        |  1 +
 configs/arm/emtrion-rzg1m.c                   |  1 +
 configs/arm/jetson-tk1-inmate-demo.c          |  1 +
 configs/arm/jetson-tk1-linux-demo.c           |  1 +
 configs/arm/jetson-tk1.c                      |  1 +
 configs/arm/orangepi0-inmate-demo.c           |  1 +
 configs/arm/orangepi0-linux-demo.c            |  1 +
 configs/arm/orangepi0.c                       |  1 +
 configs/arm/qemu-arm-inmate-demo.c            |  1 +
 configs/arm/qemu-arm-linux-demo.c             |  1 +
 configs/arm/qemu-arm.c                        |  1 +
 configs/arm64/amd-seattle-inmate-demo.c       |  1 +
 configs/arm64/amd-seattle-linux-demo.c        |  1 +
 configs/arm64/amd-seattle.c                   |  1 +
 configs/arm64/espressobin-inmate-demo.c       |  1 +
 configs/arm64/espressobin-linux-demo.c        |  1 +
 configs/arm64/espressobin.c                   |  1 +
 configs/arm64/foundation-v8-inmate-demo.c     |  1 +
 configs/arm64/foundation-v8-linux-demo.c      |  1 +
 configs/arm64/foundation-v8.c                 |  1 +
 configs/arm64/hikey-inmate-demo.c             |  1 +
 configs/arm64/hikey-linux-demo.c              |  1 +
 configs/arm64/hikey.c                         |  1 +
 configs/arm64/imx8dxl-inmate-demo.c           |  2 ++
 configs/arm64/imx8dxl.c                       |  1 +
 configs/arm64/imx8mm-inmate-demo.c            |  1 +
 configs/arm64/imx8mm-linux-demo.c             |  1 +
 configs/arm64/imx8mm.c                        |  1 +
 configs/arm64/imx8mn-inmate-demo.c            |  1 +
 configs/arm64/imx8mn-linux-demo.c             |  1 +
 configs/arm64/imx8mn.c                        |  1 +
 configs/arm64/imx8mp-inmate-demo.c            |  1 +
 configs/arm64/imx8mp-linux-demo.c             |  1 +
 configs/arm64/imx8mp.c                        |  1 +
 configs/arm64/imx8mq-inmate-demo.c            |  1 +
 configs/arm64/imx8mq-linux-demo.c             |  1 +
 configs/arm64/imx8mq.c                        |  1 +
 configs/arm64/imx8qm-inmate-demo.c            |  1 +
 configs/arm64/imx8qm-linux-demo.c             |  1 +
 configs/arm64/imx8qm.c                        |  1 +
 configs/arm64/jetson-tx1-inmate-demo.c        |  1 +
 configs/arm64/jetson-tx1-linux-demo.c         |  1 +
 configs/arm64/jetson-tx1.c                    |  1 +
 configs/arm64/jetson-tx2-inmate-demo.c        |  1 +
 configs/arm64/jetson-tx2.c                    |  1 +
 configs/arm64/k3-am625-sk-inmate-demo.c       |  1 +
 configs/arm64/k3-am625-sk-linux-demo.c        |  1 +
 configs/arm64/k3-am625-sk.c                   |  1 +
 configs/arm64/k3-am654-idk-linux-demo.c       |  1 +
 configs/arm64/k3-am654-idk.c                  |  1 +
 configs/arm64/k3-am654-inmate-demo.c          |  1 +
 configs/arm64/k3-j7200-evm-inmate-demo.c      |  1 +
 configs/arm64/k3-j7200-evm-linux-demo.c       |  1 +
 configs/arm64/k3-j7200-evm.c                  |  1 +
 configs/arm64/k3-j721e-evm-inmate-demo.c      |  1 +
 configs/arm64/k3-j721e-evm-linux-demo.c       |  1 +
 configs/arm64/k3-j721e-evm.c                  |  1 +
 configs/arm64/ls1028a-rdb-inmate-demo.c       |  1 +
 configs/arm64/ls1028a-rdb-linux-demo.c        |  1 +
 configs/arm64/ls1028a-rdb.c                   |  1 +
 configs/arm64/ls1043a-rdb-dpaa-linux-demo.c   |  1 +
 configs/arm64/ls1043a-rdb-inmate-demo.c       |  1 +
 configs/arm64/ls1043a-rdb-linux-demo.c        |  1 +
 configs/arm64/ls1043a-rdb.c                   |  1 +
 configs/arm64/ls1046a-rdb-inmate-demo.c       |  1 +
 configs/arm64/ls1046a-rdb-linux-demo.c        |  1 +
 configs/arm64/ls1046a-rdb.c                   |  1 +
 configs/arm64/ls1088a-rdb-inmate-demo.c       |  1 +
 configs/arm64/ls1088a-rdb-linux-demo.c        |  1 +
 configs/arm64/ls1088a-rdb.c                   |  1 +
 configs/arm64/ls2088a-rdb-inmate-demo.c       |  1 +
 configs/arm64/ls2088a-rdb-linux-demo.c        |  1 +
 configs/arm64/ls2088a-rdb.c                   |  1 +
 configs/arm64/macchiatobin-inmate-demo.c      |  1 +
 configs/arm64/macchiatobin-linux-demo.c       |  1 +
 configs/arm64/macchiatobin.c                  |  1 +
 .../arm64/miriac-sbc-ls1046a-inmate-demo.c    |  1 +
 configs/arm64/miriac-sbc-ls1046a-linux-demo.c |  1 +
 configs/arm64/miriac-sbc-ls1046a.c            |  1 +
 configs/arm64/pine64-plus-inmate-demo.c       |  1 +
 configs/arm64/pine64-plus-linux-demo.c        |  1 +
 configs/arm64/pine64-plus.c                   |  1 +
 configs/arm64/qemu-arm64-inmate-demo.c        |  1 +
 configs/arm64/qemu-arm64-linux-demo.c         |  1 +
 configs/arm64/qemu-arm64-zephyr-demo.c        |  1 +
 configs/arm64/qemu-arm64.c                    |  1 +
 configs/arm64/rpi4-inmate-demo.c              |  1 +
 configs/arm64/rpi4-linux-demo.c               |  1 +
 configs/arm64/rpi4.c                          |  1 +
 configs/arm64/ultra96-inmate-demo.c           |  1 +
 configs/arm64/ultra96-linux-demo.c            |  1 +
 configs/arm64/ultra96.c                       |  1 +
 configs/arm64/zynqmp-zcu102-inmate-demo.c     |  1 +
 configs/arm64/zynqmp-zcu102-linux-demo-2.c    |  1 +
 configs/arm64/zynqmp-zcu102-linux-demo.c      |  1 +
 configs/arm64/zynqmp-zcu102.c                 |  1 +
 configs/x86/apic-demo.c                       |  1 +
 configs/x86/e1000-demo.c                      |  1 +
 configs/x86/f2a88xm-hd3.c                     |  1 +
 configs/x86/imb-a180.c                        |  1 +
 configs/x86/ioapic-demo.c                     |  1 +
 configs/x86/ivshmem-demo.c                    |  1 +
 configs/x86/linux-x86-demo.c                  |  1 +
 configs/x86/pci-demo.c                        |  1 +
 configs/x86/qemu-x86.c                        |  1 +
 configs/x86/smp-demo.c                        |  1 +
 configs/x86/tiny-demo.c                       |  1 +
 include/jailhouse/cell-config.h               | 22 ++++++++++++++-----
 pyjailhouse/config_parser.py                  | 14 ++++++------
 119 files changed, 142 insertions(+), 12 deletions(-)

diff --git a/configs/arm/bananapi-inmate-demo.c b/configs/arm/bananapi-inmate-demo.c
index a83aff88..9b13634b 100644
--- a/configs/arm/bananapi-inmate-demo.c
+++ b/configs/arm/bananapi-inmate-demo.c
@@ -24,6 +24,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM,
 		.name = "bananapi-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm/bananapi-linux-demo.c b/configs/arm/bananapi-linux-demo.c
index 9819091e..cf3a2db7 100644
--- a/configs/arm/bananapi-linux-demo.c
+++ b/configs/arm/bananapi-linux-demo.c
@@ -26,6 +26,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM,
 		.name = "bananapi-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm/bananapi.c b/configs/arm/bananapi.c
index 4e566380..01089b81 100644
--- a/configs/arm/bananapi.c
+++ b/configs/arm/bananapi.c
@@ -25,6 +25,7 @@ struct {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
 			.phys_start = 0x7c000000,
diff --git a/configs/arm/emtrion-rzg1e-inmate-demo.c b/configs/arm/emtrion-rzg1e-inmate-demo.c
index d8f21a70..3fdd7345 100644
--- a/configs/arm/emtrion-rzg1e-inmate-demo.c
+++ b/configs/arm/emtrion-rzg1e-inmate-demo.c
@@ -24,6 +24,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM,
 		.name = "emtrion-emconrzg1e-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm/emtrion-rzg1e-linux-demo.c b/configs/arm/emtrion-rzg1e-linux-demo.c
index b76b8e84..027d37d4 100644
--- a/configs/arm/emtrion-rzg1e-linux-demo.c
+++ b/configs/arm/emtrion-rzg1e-linux-demo.c
@@ -26,6 +26,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM,
 		.name = "emtrion-emconrzg1e-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm/emtrion-rzg1e.c b/configs/arm/emtrion-rzg1e.c
index f392bf00..4bfe02bd 100644
--- a/configs/arm/emtrion-rzg1e.c
+++ b/configs/arm/emtrion-rzg1e.c
@@ -26,6 +26,7 @@ struct {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
 			.phys_start = 0x7c000000,
diff --git a/configs/arm/emtrion-rzg1h-inmate-demo.c b/configs/arm/emtrion-rzg1h-inmate-demo.c
index 11695b75..92c669a7 100644
--- a/configs/arm/emtrion-rzg1h-inmate-demo.c
+++ b/configs/arm/emtrion-rzg1h-inmate-demo.c
@@ -24,6 +24,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM,
 		.name = "emtrion-emconrzg1h-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm/emtrion-rzg1h-linux-demo.c b/configs/arm/emtrion-rzg1h-linux-demo.c
index a41c94dd..48d47dc1 100644
--- a/configs/arm/emtrion-rzg1h-linux-demo.c
+++ b/configs/arm/emtrion-rzg1h-linux-demo.c
@@ -26,6 +26,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM,
 		.name = "emtrion-emconrzg1h-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm/emtrion-rzg1h.c b/configs/arm/emtrion-rzg1h.c
index 26fa624a..9469213b 100644
--- a/configs/arm/emtrion-rzg1h.c
+++ b/configs/arm/emtrion-rzg1h.c
@@ -26,6 +26,7 @@ struct {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
 			.phys_start = 0xbc000000,
diff --git a/configs/arm/emtrion-rzg1m-inmate-demo.c b/configs/arm/emtrion-rzg1m-inmate-demo.c
index b406b8bd..4c425716 100644
--- a/configs/arm/emtrion-rzg1m-inmate-demo.c
+++ b/configs/arm/emtrion-rzg1m-inmate-demo.c
@@ -24,6 +24,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM,
 		.name = "emtrion-emconrzg1m-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm/emtrion-rzg1m-linux-demo.c b/configs/arm/emtrion-rzg1m-linux-demo.c
index 75f34e72..bf0775cc 100644
--- a/configs/arm/emtrion-rzg1m-linux-demo.c
+++ b/configs/arm/emtrion-rzg1m-linux-demo.c
@@ -26,6 +26,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM,
 		.name = "emtrion-emconrzg1m-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm/emtrion-rzg1m.c b/configs/arm/emtrion-rzg1m.c
index 4ee1a40c..22f5e859 100644
--- a/configs/arm/emtrion-rzg1m.c
+++ b/configs/arm/emtrion-rzg1m.c
@@ -26,6 +26,7 @@ struct {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
 			.phys_start = 0x7c000000,
diff --git a/configs/arm/jetson-tk1-inmate-demo.c b/configs/arm/jetson-tk1-inmate-demo.c
index a4dd0a34..4ab2935d 100644
--- a/configs/arm/jetson-tk1-inmate-demo.c
+++ b/configs/arm/jetson-tk1-inmate-demo.c
@@ -28,6 +28,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM,
 		.name = "jetson-tk1-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm/jetson-tk1-linux-demo.c b/configs/arm/jetson-tk1-linux-demo.c
index 52e11c1e..bbbe1306 100644
--- a/configs/arm/jetson-tk1-linux-demo.c
+++ b/configs/arm/jetson-tk1-linux-demo.c
@@ -26,6 +26,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM,
 		.name = "jetson-tk1-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			 JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
diff --git a/configs/arm/jetson-tk1.c b/configs/arm/jetson-tk1.c
index f815218d..f73fcead 100644
--- a/configs/arm/jetson-tk1.c
+++ b/configs/arm/jetson-tk1.c
@@ -28,6 +28,7 @@ struct {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
 			.phys_start = 0xfc000000,
diff --git a/configs/arm/orangepi0-inmate-demo.c b/configs/arm/orangepi0-inmate-demo.c
index bcbf4823..c62a4bcc 100644
--- a/configs/arm/orangepi0-inmate-demo.c
+++ b/configs/arm/orangepi0-inmate-demo.c
@@ -26,6 +26,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM,
 		.name = "orangepi0-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm/orangepi0-linux-demo.c b/configs/arm/orangepi0-linux-demo.c
index af0dd1a6..fe71b9a9 100644
--- a/configs/arm/orangepi0-linux-demo.c
+++ b/configs/arm/orangepi0-linux-demo.c
@@ -26,6 +26,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM,
 		.name = "orangepi0-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			 JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
diff --git a/configs/arm/orangepi0.c b/configs/arm/orangepi0.c
index c24344e0..bb95d2bd 100644
--- a/configs/arm/orangepi0.c
+++ b/configs/arm/orangepi0.c
@@ -25,6 +25,7 @@ struct {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
 			.phys_start = 0x4f800000,
diff --git a/configs/arm/qemu-arm-inmate-demo.c b/configs/arm/qemu-arm-inmate-demo.c
index 3f835d9e..c6838190 100644
--- a/configs/arm/qemu-arm-inmate-demo.c
+++ b/configs/arm/qemu-arm-inmate-demo.c
@@ -26,6 +26,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM,
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm/qemu-arm-linux-demo.c b/configs/arm/qemu-arm-linux-demo.c
index e0124baa..ce12798a 100644
--- a/configs/arm/qemu-arm-linux-demo.c
+++ b/configs/arm/qemu-arm-linux-demo.c
@@ -26,6 +26,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM,
 		.name = "qemu-arm-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
diff --git a/configs/arm/qemu-arm.c b/configs/arm/qemu-arm.c
index 4a3eac7b..241e0aba 100644
--- a/configs/arm/qemu-arm.c
+++ b/configs/arm/qemu-arm.c
@@ -27,6 +27,7 @@ struct {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
 			.phys_start = 0x7fc00000,
diff --git a/configs/arm64/amd-seattle-inmate-demo.c b/configs/arm64/amd-seattle-inmate-demo.c
index d920804c..c5b8b1f9 100644
--- a/configs/arm64/amd-seattle-inmate-demo.c
+++ b/configs/arm64/amd-seattle-inmate-demo.c
@@ -24,6 +24,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/amd-seattle-linux-demo.c b/configs/arm64/amd-seattle-linux-demo.c
index f4ed12d7..7ddcaa45 100644
--- a/configs/arm64/amd-seattle-linux-demo.c
+++ b/configs/arm64/amd-seattle-linux-demo.c
@@ -26,6 +26,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "linux-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/amd-seattle.c b/configs/arm64/amd-seattle.c
index 6409d934..7a65d9ad 100644
--- a/configs/arm64/amd-seattle.c
+++ b/configs/arm64/amd-seattle.c
@@ -25,6 +25,7 @@ struct {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
 			.phys_start = 0x83e0000000,
diff --git a/configs/arm64/espressobin-inmate-demo.c b/configs/arm64/espressobin-inmate-demo.c
index 921b93b0..b93d8cdb 100644
--- a/configs/arm64/espressobin-inmate-demo.c
+++ b/configs/arm64/espressobin-inmate-demo.c
@@ -24,6 +24,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/espressobin-linux-demo.c b/configs/arm64/espressobin-linux-demo.c
index c326b6d5..3f3806ed 100644
--- a/configs/arm64/espressobin-linux-demo.c
+++ b/configs/arm64/espressobin-linux-demo.c
@@ -26,6 +26,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "ESPRESSObin-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/espressobin.c b/configs/arm64/espressobin.c
index 1b75f6d7..dc03ac80 100644
--- a/configs/arm64/espressobin.c
+++ b/configs/arm64/espressobin.c
@@ -27,6 +27,7 @@ struct {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
 			.phys_start = 0x3fc00000,
diff --git a/configs/arm64/foundation-v8-inmate-demo.c b/configs/arm64/foundation-v8-inmate-demo.c
index 2dda3adf..bd4e7751 100644
--- a/configs/arm64/foundation-v8-inmate-demo.c
+++ b/configs/arm64/foundation-v8-inmate-demo.c
@@ -24,6 +24,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/foundation-v8-linux-demo.c b/configs/arm64/foundation-v8-linux-demo.c
index 842afe9f..c101628c 100644
--- a/configs/arm64/foundation-v8-linux-demo.c
+++ b/configs/arm64/foundation-v8-linux-demo.c
@@ -25,6 +25,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "linux-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/foundation-v8.c b/configs/arm64/foundation-v8.c
index 7a632491..c32424a0 100644
--- a/configs/arm64/foundation-v8.c
+++ b/configs/arm64/foundation-v8.c
@@ -24,6 +24,7 @@ struct {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
 			.phys_start = 0xfc000000,
diff --git a/configs/arm64/hikey-inmate-demo.c b/configs/arm64/hikey-inmate-demo.c
index ce5eb91b..f7e62178 100644
--- a/configs/arm64/hikey-inmate-demo.c
+++ b/configs/arm64/hikey-inmate-demo.c
@@ -24,6 +24,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/hikey-linux-demo.c b/configs/arm64/hikey-linux-demo.c
index cb6e101c..d3dcd7c4 100644
--- a/configs/arm64/hikey-linux-demo.c
+++ b/configs/arm64/hikey-linux-demo.c
@@ -26,6 +26,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "hikey-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/hikey.c b/configs/arm64/hikey.c
index 4aadfaae..996f5340 100644
--- a/configs/arm64/hikey.c
+++ b/configs/arm64/hikey.c
@@ -25,6 +25,7 @@ struct {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
 			.phys_start = 0x7c000000,
diff --git a/configs/arm64/imx8dxl-inmate-demo.c b/configs/arm64/imx8dxl-inmate-demo.c
index 089a0b8d..7da204d2 100644
--- a/configs/arm64/imx8dxl-inmate-demo.c
+++ b/configs/arm64/imx8dxl-inmate-demo.c
@@ -23,8 +23,10 @@ struct {
 		.revision = JAILHOUSE_CONFIG_REVISION,
 		.name = "gic-demo",
 #ifdef USE_AARCH32
+		.architecture = JAILHOUSE_ARM,
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG | JAILHOUSE_CELL_AARCH32,
 #else
+		.architecture = JAILHOUSE_ARM64,
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 #endif
 		.cpu_set_size = sizeof(config.cpus),
diff --git a/configs/arm64/imx8dxl.c b/configs/arm64/imx8dxl.c
index f70826b1..77c0b5a1 100644
--- a/configs/arm64/imx8dxl.c
+++ b/configs/arm64/imx8dxl.c
@@ -23,6 +23,7 @@ struct {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
 			.phys_start = 0xbfc00000,
diff --git a/configs/arm64/imx8mm-inmate-demo.c b/configs/arm64/imx8mm-inmate-demo.c
index 5791b945..7d2c5c18 100644
--- a/configs/arm64/imx8mm-inmate-demo.c
+++ b/configs/arm64/imx8mm-inmate-demo.c
@@ -23,6 +23,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/imx8mm-linux-demo.c b/configs/arm64/imx8mm-linux-demo.c
index 49272607..f3cc312c 100644
--- a/configs/arm64/imx8mm-linux-demo.c
+++ b/configs/arm64/imx8mm-linux-demo.c
@@ -28,6 +28,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "linux-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/imx8mm.c b/configs/arm64/imx8mm.c
index 2556ac31..966d94b0 100644
--- a/configs/arm64/imx8mm.c
+++ b/configs/arm64/imx8mm.c
@@ -25,6 +25,7 @@ struct {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
 			.phys_start = 0xb7c00000,
diff --git a/configs/arm64/imx8mn-inmate-demo.c b/configs/arm64/imx8mn-inmate-demo.c
index 6f04a5b3..2b77c3f5 100644
--- a/configs/arm64/imx8mn-inmate-demo.c
+++ b/configs/arm64/imx8mn-inmate-demo.c
@@ -23,6 +23,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/imx8mn-linux-demo.c b/configs/arm64/imx8mn-linux-demo.c
index 3644b6d1..cdbb5481 100644
--- a/configs/arm64/imx8mn-linux-demo.c
+++ b/configs/arm64/imx8mn-linux-demo.c
@@ -28,6 +28,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "linux-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/imx8mn.c b/configs/arm64/imx8mn.c
index 91d088ae..e47e7ad1 100644
--- a/configs/arm64/imx8mn.c
+++ b/configs/arm64/imx8mn.c
@@ -25,6 +25,7 @@ struct {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
 			.phys_start = 0xb7c00000,
diff --git a/configs/arm64/imx8mp-inmate-demo.c b/configs/arm64/imx8mp-inmate-demo.c
index 127392df..ecbd7bb6 100644
--- a/configs/arm64/imx8mp-inmate-demo.c
+++ b/configs/arm64/imx8mp-inmate-demo.c
@@ -23,6 +23,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/imx8mp-linux-demo.c b/configs/arm64/imx8mp-linux-demo.c
index 22793c2a..d208714c 100644
--- a/configs/arm64/imx8mp-linux-demo.c
+++ b/configs/arm64/imx8mp-linux-demo.c
@@ -28,6 +28,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "linux-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/imx8mp.c b/configs/arm64/imx8mp.c
index 7fbf6ef7..ec94fc6e 100644
--- a/configs/arm64/imx8mp.c
+++ b/configs/arm64/imx8mp.c
@@ -25,6 +25,7 @@ struct {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
 			.phys_start = 0xfdc00000,
diff --git a/configs/arm64/imx8mq-inmate-demo.c b/configs/arm64/imx8mq-inmate-demo.c
index d1d518df..b28a0dac 100644
--- a/configs/arm64/imx8mq-inmate-demo.c
+++ b/configs/arm64/imx8mq-inmate-demo.c
@@ -23,6 +23,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/imx8mq-linux-demo.c b/configs/arm64/imx8mq-linux-demo.c
index 03e67a94..04aea30d 100644
--- a/configs/arm64/imx8mq-linux-demo.c
+++ b/configs/arm64/imx8mq-linux-demo.c
@@ -23,6 +23,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "linux-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/imx8mq.c b/configs/arm64/imx8mq.c
index e853e5f2..e51683ae 100644
--- a/configs/arm64/imx8mq.c
+++ b/configs/arm64/imx8mq.c
@@ -25,6 +25,7 @@ struct {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
 			.phys_start = 0xfdc00000,
diff --git a/configs/arm64/imx8qm-inmate-demo.c b/configs/arm64/imx8qm-inmate-demo.c
index 1170a35f..8ab216cd 100644
--- a/configs/arm64/imx8qm-inmate-demo.c
+++ b/configs/arm64/imx8qm-inmate-demo.c
@@ -23,6 +23,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/imx8qm-linux-demo.c b/configs/arm64/imx8qm-linux-demo.c
index 0d2d91c9..b0e8eaf5 100644
--- a/configs/arm64/imx8qm-linux-demo.c
+++ b/configs/arm64/imx8qm-linux-demo.c
@@ -24,6 +24,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "imx8qm-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/imx8qm.c b/configs/arm64/imx8qm.c
index 052a58d4..9cb3c278 100644
--- a/configs/arm64/imx8qm.c
+++ b/configs/arm64/imx8qm.c
@@ -25,6 +25,7 @@ struct {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
 			.phys_start = 0xfdc00000,
diff --git a/configs/arm64/jetson-tx1-inmate-demo.c b/configs/arm64/jetson-tx1-inmate-demo.c
index 1cfbe7f7..99a704ce 100644
--- a/configs/arm64/jetson-tx1-inmate-demo.c
+++ b/configs/arm64/jetson-tx1-inmate-demo.c
@@ -24,6 +24,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "jetson-tx1-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/jetson-tx1-linux-demo.c b/configs/arm64/jetson-tx1-linux-demo.c
index c5f2d811..ec303535 100644
--- a/configs/arm64/jetson-tx1-linux-demo.c
+++ b/configs/arm64/jetson-tx1-linux-demo.c
@@ -32,6 +32,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "jetson-tx1-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			 JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
diff --git a/configs/arm64/jetson-tx1.c b/configs/arm64/jetson-tx1.c
index c9dbec87..4c3320ff 100644
--- a/configs/arm64/jetson-tx1.c
+++ b/configs/arm64/jetson-tx1.c
@@ -28,6 +28,7 @@ struct {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
 			.phys_start = 0x17c000000,
diff --git a/configs/arm64/jetson-tx2-inmate-demo.c b/configs/arm64/jetson-tx2-inmate-demo.c
index ed1a7d97..98d3a27d 100644
--- a/configs/arm64/jetson-tx2-inmate-demo.c
+++ b/configs/arm64/jetson-tx2-inmate-demo.c
@@ -19,6 +19,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "jetson-tx2-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/jetson-tx2.c b/configs/arm64/jetson-tx2.c
index 58f7d488..28e7578c 100644
--- a/configs/arm64/jetson-tx2.c
+++ b/configs/arm64/jetson-tx2.c
@@ -30,6 +30,7 @@ struct {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
 			.phys_start = 0x271000000,
diff --git a/configs/arm64/k3-am625-sk-inmate-demo.c b/configs/arm64/k3-am625-sk-inmate-demo.c
index 49edd62d..053de528 100644
--- a/configs/arm64/k3-am625-sk-inmate-demo.c
+++ b/configs/arm64/k3-am625-sk-inmate-demo.c
@@ -26,6 +26,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/k3-am625-sk-linux-demo.c b/configs/arm64/k3-am625-sk-linux-demo.c
index a3385efc..09bece78 100644
--- a/configs/arm64/k3-am625-sk-linux-demo.c
+++ b/configs/arm64/k3-am625-sk-linux-demo.c
@@ -30,6 +30,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "k3-am625-sk-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/k3-am625-sk.c b/configs/arm64/k3-am625-sk.c
index 2e5c3aef..4c77e7fe 100644
--- a/configs/arm64/k3-am625-sk.c
+++ b/configs/arm64/k3-am625-sk.c
@@ -25,6 +25,7 @@ struct {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
 			.phys_start = 0xdfc00000,
diff --git a/configs/arm64/k3-am654-idk-linux-demo.c b/configs/arm64/k3-am654-idk-linux-demo.c
index 3937dff3..ac7a75d0 100644
--- a/configs/arm64/k3-am654-idk-linux-demo.c
+++ b/configs/arm64/k3-am654-idk-linux-demo.c
@@ -30,6 +30,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "k3-am654-idk-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/k3-am654-idk.c b/configs/arm64/k3-am654-idk.c
index 48b8f867..544ca50b 100644
--- a/configs/arm64/k3-am654-idk.c
+++ b/configs/arm64/k3-am654-idk.c
@@ -25,6 +25,7 @@ struct {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
 			.phys_start = 0x8dfc00000,
diff --git a/configs/arm64/k3-am654-inmate-demo.c b/configs/arm64/k3-am654-inmate-demo.c
index 00367471..8c60648f 100644
--- a/configs/arm64/k3-am654-inmate-demo.c
+++ b/configs/arm64/k3-am654-inmate-demo.c
@@ -25,6 +25,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/k3-j7200-evm-inmate-demo.c b/configs/arm64/k3-j7200-evm-inmate-demo.c
index c916b439..eea1cb5a 100644
--- a/configs/arm64/k3-j7200-evm-inmate-demo.c
+++ b/configs/arm64/k3-j7200-evm-inmate-demo.c
@@ -27,6 +27,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "k3-j7200 inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/k3-j7200-evm-linux-demo.c b/configs/arm64/k3-j7200-evm-linux-demo.c
index 1fc98bf8..28d6e361 100644
--- a/configs/arm64/k3-j7200-evm-linux-demo.c
+++ b/configs/arm64/k3-j7200-evm-linux-demo.c
@@ -31,6 +31,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "k3-j7200-evm-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/k3-j7200-evm.c b/configs/arm64/k3-j7200-evm.c
index cc452157..afa54b2b 100644
--- a/configs/arm64/k3-j7200-evm.c
+++ b/configs/arm64/k3-j7200-evm.c
@@ -26,6 +26,7 @@ struct {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
 			.phys_start = 0x89fa00000,
diff --git a/configs/arm64/k3-j721e-evm-inmate-demo.c b/configs/arm64/k3-j721e-evm-inmate-demo.c
index 45a9202f..cf4026d9 100644
--- a/configs/arm64/k3-j721e-evm-inmate-demo.c
+++ b/configs/arm64/k3-j721e-evm-inmate-demo.c
@@ -27,6 +27,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
index af6a5a2f..ff7b23a7 100644
--- a/configs/arm64/k3-j721e-evm-linux-demo.c
+++ b/configs/arm64/k3-j721e-evm-linux-demo.c
@@ -32,6 +32,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "k3-j721e-evm-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
index 19f9d967..3a1c4a6d 100644
--- a/configs/arm64/k3-j721e-evm.c
+++ b/configs/arm64/k3-j721e-evm.c
@@ -27,6 +27,7 @@ struct {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
 			.phys_start = 0x89fa00000,
diff --git a/configs/arm64/ls1028a-rdb-inmate-demo.c b/configs/arm64/ls1028a-rdb-inmate-demo.c
index 8b45a9ed..1b1bedc1 100644
--- a/configs/arm64/ls1028a-rdb-inmate-demo.c
+++ b/configs/arm64/ls1028a-rdb-inmate-demo.c
@@ -23,6 +23,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/ls1028a-rdb-linux-demo.c b/configs/arm64/ls1028a-rdb-linux-demo.c
index e2cb01af..c965fa4f 100644
--- a/configs/arm64/ls1028a-rdb-linux-demo.c
+++ b/configs/arm64/ls1028a-rdb-linux-demo.c
@@ -23,6 +23,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "linux-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/ls1028a-rdb.c b/configs/arm64/ls1028a-rdb.c
index 6027772b..2feec366 100644
--- a/configs/arm64/ls1028a-rdb.c
+++ b/configs/arm64/ls1028a-rdb.c
@@ -23,6 +23,7 @@ struct {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
 			.phys_start = 0xfba00000,
diff --git a/configs/arm64/ls1043a-rdb-dpaa-linux-demo.c b/configs/arm64/ls1043a-rdb-dpaa-linux-demo.c
index 89552b16..028ddf49 100644
--- a/configs/arm64/ls1043a-rdb-dpaa-linux-demo.c
+++ b/configs/arm64/ls1043a-rdb-dpaa-linux-demo.c
@@ -23,6 +23,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "linux-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/ls1043a-rdb-inmate-demo.c b/configs/arm64/ls1043a-rdb-inmate-demo.c
index 25645745..53a65e3c 100644
--- a/configs/arm64/ls1043a-rdb-inmate-demo.c
+++ b/configs/arm64/ls1043a-rdb-inmate-demo.c
@@ -23,6 +23,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/ls1043a-rdb-linux-demo.c b/configs/arm64/ls1043a-rdb-linux-demo.c
index afc10ede..30be3538 100644
--- a/configs/arm64/ls1043a-rdb-linux-demo.c
+++ b/configs/arm64/ls1043a-rdb-linux-demo.c
@@ -23,6 +23,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "linux-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/ls1043a-rdb.c b/configs/arm64/ls1043a-rdb.c
index 892dc444..e1d3c48e 100644
--- a/configs/arm64/ls1043a-rdb.c
+++ b/configs/arm64/ls1043a-rdb.c
@@ -23,6 +23,7 @@ struct {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
 			.phys_start = 0xc0000000,
diff --git a/configs/arm64/ls1046a-rdb-inmate-demo.c b/configs/arm64/ls1046a-rdb-inmate-demo.c
index 6c992caa..b98051da 100644
--- a/configs/arm64/ls1046a-rdb-inmate-demo.c
+++ b/configs/arm64/ls1046a-rdb-inmate-demo.c
@@ -23,6 +23,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/ls1046a-rdb-linux-demo.c b/configs/arm64/ls1046a-rdb-linux-demo.c
index 6bba61fb..a2efa1b3 100644
--- a/configs/arm64/ls1046a-rdb-linux-demo.c
+++ b/configs/arm64/ls1046a-rdb-linux-demo.c
@@ -23,6 +23,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "linux-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/ls1046a-rdb.c b/configs/arm64/ls1046a-rdb.c
index d05c1628..7291fda7 100644
--- a/configs/arm64/ls1046a-rdb.c
+++ b/configs/arm64/ls1046a-rdb.c
@@ -23,6 +23,7 @@ struct {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
 			.phys_start = 0xfba00000,
diff --git a/configs/arm64/ls1088a-rdb-inmate-demo.c b/configs/arm64/ls1088a-rdb-inmate-demo.c
index 3caee05d..226ff2e8 100644
--- a/configs/arm64/ls1088a-rdb-inmate-demo.c
+++ b/configs/arm64/ls1088a-rdb-inmate-demo.c
@@ -23,6 +23,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/ls1088a-rdb-linux-demo.c b/configs/arm64/ls1088a-rdb-linux-demo.c
index ee8b18e9..d98d6ca1 100644
--- a/configs/arm64/ls1088a-rdb-linux-demo.c
+++ b/configs/arm64/ls1088a-rdb-linux-demo.c
@@ -23,6 +23,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "linux-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/ls1088a-rdb.c b/configs/arm64/ls1088a-rdb.c
index cb93df1e..d73703ae 100644
--- a/configs/arm64/ls1088a-rdb.c
+++ b/configs/arm64/ls1088a-rdb.c
@@ -23,6 +23,7 @@ struct {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
 			.phys_start = 0xfba00000,
diff --git a/configs/arm64/ls2088a-rdb-inmate-demo.c b/configs/arm64/ls2088a-rdb-inmate-demo.c
index bbc6812c..bdc069ef 100644
--- a/configs/arm64/ls2088a-rdb-inmate-demo.c
+++ b/configs/arm64/ls2088a-rdb-inmate-demo.c
@@ -23,6 +23,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/ls2088a-rdb-linux-demo.c b/configs/arm64/ls2088a-rdb-linux-demo.c
index b20e6f17..2a531a48 100644
--- a/configs/arm64/ls2088a-rdb-linux-demo.c
+++ b/configs/arm64/ls2088a-rdb-linux-demo.c
@@ -23,6 +23,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "linux-inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/ls2088a-rdb.c b/configs/arm64/ls2088a-rdb.c
index 421ac7da..d84ba10b 100644
--- a/configs/arm64/ls2088a-rdb.c
+++ b/configs/arm64/ls2088a-rdb.c
@@ -23,6 +23,7 @@ struct {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
 			.phys_start = 0xfba00000,
diff --git a/configs/arm64/macchiatobin-inmate-demo.c b/configs/arm64/macchiatobin-inmate-demo.c
index 9c76f606..92d74b98 100644
--- a/configs/arm64/macchiatobin-inmate-demo.c
+++ b/configs/arm64/macchiatobin-inmate-demo.c
@@ -24,6 +24,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/macchiatobin-linux-demo.c b/configs/arm64/macchiatobin-linux-demo.c
index ad29bbd5..5ed76c91 100644
--- a/configs/arm64/macchiatobin-linux-demo.c
+++ b/configs/arm64/macchiatobin-linux-demo.c
@@ -26,6 +26,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "MACCHIATObin-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
diff --git a/configs/arm64/macchiatobin.c b/configs/arm64/macchiatobin.c
index db158824..f8e078e2 100644
--- a/configs/arm64/macchiatobin.c
+++ b/configs/arm64/macchiatobin.c
@@ -27,6 +27,7 @@ struct {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
 			.phys_start = 0x13fc00000,
diff --git a/configs/arm64/miriac-sbc-ls1046a-inmate-demo.c b/configs/arm64/miriac-sbc-ls1046a-inmate-demo.c
index 39e97888..1e7fd2bc 100644
--- a/configs/arm64/miriac-sbc-ls1046a-inmate-demo.c
+++ b/configs/arm64/miriac-sbc-ls1046a-inmate-demo.c
@@ -24,6 +24,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/miriac-sbc-ls1046a-linux-demo.c b/configs/arm64/miriac-sbc-ls1046a-linux-demo.c
index 841c21a4..e925797a 100644
--- a/configs/arm64/miriac-sbc-ls1046a-linux-demo.c
+++ b/configs/arm64/miriac-sbc-ls1046a-linux-demo.c
@@ -27,6 +27,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
diff --git a/configs/arm64/miriac-sbc-ls1046a.c b/configs/arm64/miriac-sbc-ls1046a.c
index 96a7139e..fc4493e8 100644
--- a/configs/arm64/miriac-sbc-ls1046a.c
+++ b/configs/arm64/miriac-sbc-ls1046a.c
@@ -27,6 +27,7 @@ struct {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
 			.phys_start = 0xc0000000,
diff --git a/configs/arm64/pine64-plus-inmate-demo.c b/configs/arm64/pine64-plus-inmate-demo.c
index 73cde95c..7cb6fbfc 100644
--- a/configs/arm64/pine64-plus-inmate-demo.c
+++ b/configs/arm64/pine64-plus-inmate-demo.c
@@ -25,6 +25,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/pine64-plus-linux-demo.c b/configs/arm64/pine64-plus-linux-demo.c
index 1d099906..50b75b40 100644
--- a/configs/arm64/pine64-plus-linux-demo.c
+++ b/configs/arm64/pine64-plus-linux-demo.c
@@ -26,6 +26,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "pine64-plus-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			 JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
diff --git a/configs/arm64/pine64-plus.c b/configs/arm64/pine64-plus.c
index c824ca78..bc2f524e 100644
--- a/configs/arm64/pine64-plus.c
+++ b/configs/arm64/pine64-plus.c
@@ -27,6 +27,7 @@ struct {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
 			.phys_start = 0xbc000000,
diff --git a/configs/arm64/qemu-arm64-inmate-demo.c b/configs/arm64/qemu-arm64-inmate-demo.c
index 6863ce24..3246c7d6 100644
--- a/configs/arm64/qemu-arm64-inmate-demo.c
+++ b/configs/arm64/qemu-arm64-inmate-demo.c
@@ -26,6 +26,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/qemu-arm64-linux-demo.c b/configs/arm64/qemu-arm64-linux-demo.c
index d8096e8e..258b1850 100644
--- a/configs/arm64/qemu-arm64-linux-demo.c
+++ b/configs/arm64/qemu-arm64-linux-demo.c
@@ -26,6 +26,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "qemu-arm64-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
diff --git a/configs/arm64/qemu-arm64-zephyr-demo.c b/configs/arm64/qemu-arm64-zephyr-demo.c
index e5e36237..a4ae1dfa 100644
--- a/configs/arm64/qemu-arm64-zephyr-demo.c
+++ b/configs/arm64/qemu-arm64-zephyr-demo.c
@@ -28,6 +28,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "qemu-arm64-zephyr-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
diff --git a/configs/arm64/qemu-arm64.c b/configs/arm64/qemu-arm64.c
index 2e9fcde6..e58c7db6 100644
--- a/configs/arm64/qemu-arm64.c
+++ b/configs/arm64/qemu-arm64.c
@@ -27,6 +27,7 @@ struct {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
 			.phys_start = 0x7fc00000,
diff --git a/configs/arm64/rpi4-inmate-demo.c b/configs/arm64/rpi4-inmate-demo.c
index 1bc244f5..311c036b 100644
--- a/configs/arm64/rpi4-inmate-demo.c
+++ b/configs/arm64/rpi4-inmate-demo.c
@@ -26,6 +26,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/rpi4-linux-demo.c b/configs/arm64/rpi4-linux-demo.c
index f93c564a..d818c5c5 100644
--- a/configs/arm64/rpi4-linux-demo.c
+++ b/configs/arm64/rpi4-linux-demo.c
@@ -26,6 +26,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "rpi4-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
diff --git a/configs/arm64/rpi4.c b/configs/arm64/rpi4.c
index 68bb1a24..a41c4545 100644
--- a/configs/arm64/rpi4.c
+++ b/configs/arm64/rpi4.c
@@ -27,6 +27,7 @@ struct {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
 			.phys_start = 0x1fc00000,
diff --git a/configs/arm64/ultra96-inmate-demo.c b/configs/arm64/ultra96-inmate-demo.c
index c61130a1..a94d03c5 100644
--- a/configs/arm64/ultra96-inmate-demo.c
+++ b/configs/arm64/ultra96-inmate-demo.c
@@ -26,6 +26,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/ultra96-linux-demo.c b/configs/arm64/ultra96-linux-demo.c
index f1f32fd2..6b4ce7cb 100644
--- a/configs/arm64/ultra96-linux-demo.c
+++ b/configs/arm64/ultra96-linux-demo.c
@@ -26,6 +26,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "Ultra96-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/ultra96.c b/configs/arm64/ultra96.c
index 93e2ee83..0387450d 100644
--- a/configs/arm64/ultra96.c
+++ b/configs/arm64/ultra96.c
@@ -26,6 +26,7 @@ struct {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
 			.phys_start = 0x7fc00000,
diff --git a/configs/arm64/zynqmp-zcu102-inmate-demo.c b/configs/arm64/zynqmp-zcu102-inmate-demo.c
index 304b4cda..c7b8a0db 100644
--- a/configs/arm64/zynqmp-zcu102-inmate-demo.c
+++ b/configs/arm64/zynqmp-zcu102-inmate-demo.c
@@ -24,6 +24,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "inmate-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/zynqmp-zcu102-linux-demo-2.c b/configs/arm64/zynqmp-zcu102-linux-demo-2.c
index 76ed8064..3905f5bd 100644
--- a/configs/arm64/zynqmp-zcu102-linux-demo-2.c
+++ b/configs/arm64/zynqmp-zcu102-linux-demo-2.c
@@ -26,6 +26,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "ZynqMP-linux-demo-2",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			 JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
diff --git a/configs/arm64/zynqmp-zcu102-linux-demo.c b/configs/arm64/zynqmp-zcu102-linux-demo.c
index 32e38089..1d8e00a3 100644
--- a/configs/arm64/zynqmp-zcu102-linux-demo.c
+++ b/configs/arm64/zynqmp-zcu102-linux-demo.c
@@ -26,6 +26,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.name = "ZynqMP-linux-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,
 
diff --git a/configs/arm64/zynqmp-zcu102.c b/configs/arm64/zynqmp-zcu102.c
index 492dc566..cd5f6089 100644
--- a/configs/arm64/zynqmp-zcu102.c
+++ b/configs/arm64/zynqmp-zcu102.c
@@ -28,6 +28,7 @@ struct {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_ARM64,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
 			.phys_start = 0x800000000,
diff --git a/configs/x86/apic-demo.c b/configs/x86/apic-demo.c
index d014f267..c62befee 100644
--- a/configs/x86/apic-demo.c
+++ b/configs/x86/apic-demo.c
@@ -25,6 +25,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_X86,
 		.name = "apic-demo",
 		.flags = JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
 
diff --git a/configs/x86/e1000-demo.c b/configs/x86/e1000-demo.c
index 8ae31220..58868c0c 100644
--- a/configs/x86/e1000-demo.c
+++ b/configs/x86/e1000-demo.c
@@ -27,6 +27,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_X86,
 		.name = "e1000-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
diff --git a/configs/x86/f2a88xm-hd3.c b/configs/x86/f2a88xm-hd3.c
index b529e6a6..85f201d2 100644
--- a/configs/x86/f2a88xm-hd3.c
+++ b/configs/x86/f2a88xm-hd3.c
@@ -32,6 +32,7 @@ struct {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_X86,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
 			.phys_start = 0x3a000000,
diff --git a/configs/x86/imb-a180.c b/configs/x86/imb-a180.c
index 05f7279a..02cc0fbe 100644
--- a/configs/x86/imb-a180.c
+++ b/configs/x86/imb-a180.c
@@ -31,6 +31,7 @@ struct {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_X86,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
 			.phys_start = 0x3a000000,
diff --git a/configs/x86/ioapic-demo.c b/configs/x86/ioapic-demo.c
index 863b3ea7..a224036b 100644
--- a/configs/x86/ioapic-demo.c
+++ b/configs/x86/ioapic-demo.c
@@ -26,6 +26,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_X86,
 		.name = "ioapic-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
diff --git a/configs/x86/ivshmem-demo.c b/configs/x86/ivshmem-demo.c
index 4c24193f..8738c70a 100644
--- a/configs/x86/ivshmem-demo.c
+++ b/configs/x86/ivshmem-demo.c
@@ -27,6 +27,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_X86,
 		.name = "ivshmem-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
diff --git a/configs/x86/linux-x86-demo.c b/configs/x86/linux-x86-demo.c
index 0703c5b9..b24a1d16 100644
--- a/configs/x86/linux-x86-demo.c
+++ b/configs/x86/linux-x86-demo.c
@@ -36,6 +36,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_X86,
 		.name = "linux-x86-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			 JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
diff --git a/configs/x86/pci-demo.c b/configs/x86/pci-demo.c
index a4115744..137fd2e9 100644
--- a/configs/x86/pci-demo.c
+++ b/configs/x86/pci-demo.c
@@ -27,6 +27,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_X86,
 		.name = "pci-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
index c4d7ecfc..cdd3dd6d 100644
--- a/configs/x86/qemu-x86.c
+++ b/configs/x86/qemu-x86.c
@@ -31,6 +31,7 @@ struct {
 	.header = {
 		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_X86,
 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
 		.hypervisor_memory = {
 			.phys_start = 0x3a000000,
diff --git a/configs/x86/smp-demo.c b/configs/x86/smp-demo.c
index 35bf9504..98b32bd7 100644
--- a/configs/x86/smp-demo.c
+++ b/configs/x86/smp-demo.c
@@ -24,6 +24,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_X86,
 		.name = "smp-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED,
diff --git a/configs/x86/tiny-demo.c b/configs/x86/tiny-demo.c
index 464c7acb..6d5fbac9 100644
--- a/configs/x86/tiny-demo.c
+++ b/configs/x86/tiny-demo.c
@@ -25,6 +25,7 @@ struct {
 	.cell = {
 		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
 		.revision = JAILHOUSE_CONFIG_REVISION,
+		.architecture = JAILHOUSE_X86,
 		.name = "tiny-demo",
 		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG |
 			JAILHOUSE_CELL_TEST_DEVICE |
diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 6b54e34b..17d59306 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -46,11 +46,20 @@
 #define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
 #endif
 
+/*
+ * Supported architectures of Jailhouse. Used in the header of system and cell
+ * configurations, as well as in python tooling for automatic architecture
+ * detection.
+ */
+#define JAILHOUSE_X86		0
+#define JAILHOUSE_ARM		1
+#define JAILHOUSE_ARM64		2
+
 /*
  * Incremented on any layout or semantic change of system or cell config.
  * Also update formats and HEADER_REVISION in pyjailhouse/config_parser.py.
  */
-#define JAILHOUSE_CONFIG_REVISION	13
+#define JAILHOUSE_CONFIG_REVISION	14
 
 #define JAILHOUSE_CELL_NAME_MAXLEN	31
 
@@ -73,7 +82,7 @@
 #define CELL_FLAGS_VIRTUAL_CONSOLE_PERMITTED(flags) \
 	!!((flags) & JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED)
 
-#define JAILHOUSE_CELL_DESC_SIGNATURE	"JHCELL"
+#define JAILHOUSE_CELL_DESC_SIGNATURE	"JHCLL"
 
 /**
  * The jailhouse cell configuration.
@@ -82,7 +91,8 @@
  * structure.
  */
 struct jailhouse_cell_desc {
-	char signature[6];
+	char signature[5];
+	__u8 architecture;
 	__u16 revision;
 
 	char name[JAILHOUSE_CELL_NAME_MAXLEN+1];
@@ -305,7 +315,7 @@ struct jailhouse_pio {
 		.length = __length,	\
 	}
 
-#define JAILHOUSE_SYSTEM_SIGNATURE	"JHSYST"
+#define JAILHOUSE_SYSTEM_SIGNATURE	"JHSYS"
 
 /*
  * The flag JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE allows the root cell to read
@@ -320,8 +330,10 @@ struct jailhouse_pio {
  * General descriptor of the system.
  */
 struct jailhouse_system {
-	char signature[6];
+	char signature[5];
+	__u8 architecture;
 	__u16 revision;
+
 	__u32 flags;
 
 	/** Jailhouse's location in memory */
diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
index 7a7f48a3..e60b2ce9 100644
--- a/pyjailhouse/config_parser.py
+++ b/pyjailhouse/config_parser.py
@@ -19,7 +19,7 @@ import struct
 from .extendedenum import ExtendedEnum
 
 # Keep the whole file in sync with include/jailhouse/cell-config.h.
-_CONFIG_REVISION = 13
+_CONFIG_REVISION = 14
 
 
 def flag_str(enum_class, value, separator=' | '):
@@ -135,13 +135,14 @@ class PIORegion:
 
 
 class CellConfig:
-    _HEADER_FORMAT = '=6sH32s4xIIIIIIIIIIQ8x32x'
+    _HEADER_FORMAT = '=5sBH32s4xIIIIIIIIIIQ8x32x'
 
     def __init__(self, data, root_cell=False):
         self.data = data
 
         try:
             (signature,
+             self.arch,
              revision,
              name,
              self.flags,
@@ -157,7 +158,7 @@ class CellConfig:
              self.cpu_reset_address) = \
                 struct.unpack_from(CellConfig._HEADER_FORMAT, self.data)
             if not root_cell:
-                if signature != b'JHCELL':
+                if signature != b'JHCLL':
                     raise RuntimeError('Not a cell configuration')
                 if revision != _CONFIG_REVISION:
                     raise RuntimeError('Configuration file revision mismatch')
@@ -233,7 +234,7 @@ class IOMMU:
 
 
 class SystemConfig:
-    _HEADER_FORMAT = '=6sH4x'
+    _HEADER_FORMAT = '=5sBH4x'
     # ...followed by MemRegion as hypervisor memory
     _CONSOLE_FORMAT = '32x'
     _PCI_FORMAT = '=QBBH'
@@ -245,11 +246,10 @@ class SystemConfig:
         self.data = data
 
         try:
-            (signature,
-             revision) = \
+            (signature, self.arch, revision) = \
                 struct.unpack_from(self._HEADER_FORMAT, self.data)
 
-            if signature != b'JHSYST':
+            if signature != b'JHSYS':
                 raise RuntimeError('Not a root cell configuration')
             if revision != _CONFIG_REVISION:
                 raise RuntimeError('Configuration file revision mismatch')
-- 
2.39.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230110211444.9897-1-ralf.ramsauer%40oth-regensburg.de.
