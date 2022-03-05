Return-Path: <jailhouse-dev+bncBDOPPN7U7ANRB3VGROIQMGQE3KPEZCQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3244CE25A
	for <lists+jailhouse-dev@lfdr.de>; Sat,  5 Mar 2022 04:05:18 +0100 (CET)
Received: by mail-wm1-x337.google.com with SMTP id c19-20020a05600c0ad300b00385bb3db625sf3210915wmr.4
        for <lists+jailhouse-dev@lfdr.de>; Fri, 04 Mar 2022 19:05:18 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1646449518; cv=pass;
        d=google.com; s=arc-20160816;
        b=XxCMHpuoOkDPLtmaOYQ+mIviloFrjByCn8lEwxgj7is5DY1peeyuYJ9aUQWAkm4fE8
         KRHwSLXe1vU+Tg0Zg9N4eT4ECfavROjft+m5s+wk/wi71MWLKQgnlLG3AQMhVRWTUGLx
         h4kJMSaOK8+Q2Jj3WFpr6CQe+jX/ypruM+HFFqzf6ocnpOD5og9+lwwPrAIz1cWZxHDk
         MSXo53c797JEqHEodx5M0kTf4h1o0xurU9L9+hJkMLUIDGm2WW3A4WWtJVk4Z/WxNbGc
         XDmE/Rh5OpdPxNIS18W3Q9BTdwbO2uu3cEfZFCyXokpLWZp3GQdUbAJw7BSkPdYY08Si
         BScg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=L8WtpeUZkj2seeeMRh3VKwe0h5nXQrr3FRiWpOoqYRs=;
        b=cUnZP+7+H3Qwm0D38Za354a4rdGHam+EWfFniCwFB9ybRjAwNO11itZq822e1sw9Ma
         hvHAYMcoG8G68zRIQG0D6OAH7hj/Wrdy1rzG4Dps9+UT4v1SyWp9ZFf4qQpPRiJtBev0
         5qTf3TlK4jGLFGJe7tlqLgoTh6AATPQJJksTXkDKotqXaxAeZe1NmAlTkto20TR7XeEk
         QUWcn80b+4cExXzZOj2T1otQC+GMdn5vJmTJpOfrwKvMSPt4dkW+4/6Asc84kIGioWd1
         joFOIXoyEJZokHc1XS3ATw6vfnYMwzjb42EQvVQsRaHIVMC+sMNt1B+tBpnla3MY6O8f
         YbBw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b="lmiPHm/i";
       spf=pass (google.com: domain of mranostay@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=mranostay@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=L8WtpeUZkj2seeeMRh3VKwe0h5nXQrr3FRiWpOoqYRs=;
        b=PSvdN0oWXM3Ifr9epYGXJUwRf3gKFV9W0Ei2hSzwju8jwjc8peNqnffR41pgreSzHy
         P8qiB+ia7MPWKYxpT5U4wK/eZglEhzvQEdWFfNzLjFcUzzlEwckHbdzLI9xotIWF3LhA
         3ndD9oIejjXeO+NElODgzm24LOdMBHnQ8s494Q29b4dHc0NxvOxfu3nP19fYcmxMVU+l
         b7owaHXkcpX9JPIsxltd/YHUpwdjlaixhrmpijPsbUReEq2WSlBryJtcobkH5M4lz3yv
         SY1vii21IjezAnCXAstNSrVgjRiIifOCwa4/YTBJQyiZXNbaURDfFIkYFhZ0J0+OjvlC
         M5Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=L8WtpeUZkj2seeeMRh3VKwe0h5nXQrr3FRiWpOoqYRs=;
        b=qFAzoEZlL7MZXWhEpOlINuFKe5aysfj/VGZd6b+4dLjdGu+ZkwypA1xPf2EaO82WJe
         eRHGxz2LQCca1Z8i9Gz2Ggp2tulkd4qzP/IRBGimiynhlYfukVicta9qfJ88FTF3HVy9
         jTl+aPY/7zgeCKciu1lUxb9gC9EOrreNOoywEZ8yEpVCG6oL4uY82JBHtiOmVC2rOiuF
         PlQyYjHlquarPuT3lubV8EyoWxWCY3ulgvQ701RNKYP72f4uT8weXnj3nxJANb3mHmAP
         RCGt3mpgRy0YzSqsrUtn9p4GEBeRqkj1wv1w2SZOYWtq0jgn0LqBvymbW2UbKULhMR5m
         tFLA==
X-Gm-Message-State: AOAM532gzGb3l4nZ1o9DoBC9cSi2TWmlUHlqOc8zGe/9jdokegKxrptn
	Ws6/Xa7ZNz9CB2WyPNIVtpY=
X-Google-Smtp-Source: ABdhPJxj5rolKHuAkQHdcGBK/nk2cF+ZcU1Totr3/G2eSKJHL1RKViOFwrMa1vV2jkI3pNLMVwxGqQ==
X-Received: by 2002:adf:ab09:0:b0:1f0:1208:5123 with SMTP id q9-20020adfab09000000b001f012085123mr1057601wrc.146.1646449518666;
        Fri, 04 Mar 2022 19:05:18 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:2bc2:0:b0:386:8897:8f1 with SMTP id r185-20020a1c2bc2000000b00386889708f1ls4228878wmr.2.canary-gmail;
 Fri, 04 Mar 2022 19:05:17 -0800 (PST)
X-Received: by 2002:a05:600c:4881:b0:381:1f8f:5299 with SMTP id j1-20020a05600c488100b003811f8f5299mr897540wmp.149.1646449517524;
        Fri, 04 Mar 2022 19:05:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646449517; cv=none;
        d=google.com; s=arc-20160816;
        b=zS9q5ep4eknaoxUl9WIzdCJKXA7xefRkoN8j3HRz96alyi+AYlU2SBS4J1Aab9OpNx
         3g4DkfVY+t1A+wgzxDb8pSimnuSwaaMsILuYy9oz47VICG5onJY83A1QJ7F2cEhAzSPC
         8OmOrkWNKFahcPR1/kad3cMxB4gGulnD88v5M0qmmP2pZoN3amyuU98eeDLuUppa3nPK
         fZy8J+KmaL15WE9GAzihDFyFNc0SOsii4dmdzveaoF1OU1j4ojPXPjHB/5rOkwDU8NrP
         yUdN8NCfpR0MFJZbknjiTJkk0pu2NQSYfBcjgCbx6P1/5cST3y/DP1FZjx0Lf9XGLvFB
         +ljQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=b6bgLhie2pCEPH19zQAqj0+7RvzuTeWNh3OrjGslYsQ=;
        b=YyTwKDCqEcLHsytOTpSNgwdVpUe9kArtj/duNypCoqrgCZwCvyp4qNB6giTQ/1nLDp
         GRhh9F5v10qbVG2sCwDI1dR+lq4QDDg/vzVNGwg2BIBS1J3dQtqqVnDdig3tOiBPpVlB
         3cJ035H0nmRTSDUqXySNNhi+j+ImJGPGHjwal3TyEqyWkPi0OfuJZAhLo1QfgttBGFSP
         MZukRcEaiR/x6xIfQUV5kndNBycObNKFPXRyWMjLK2xCFnYy0dTsR9bbbHqPCkE4j6pI
         EP4G70pIXwWICRJlEeKynvZpcHF6nZUOfPpmRNE4nncXFxSUEsetZdDF9PDabPe0VDwb
         7tSQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b="lmiPHm/i";
       spf=pass (google.com: domain of mranostay@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=mranostay@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id i12-20020a5d558c000000b001ea830df1aasi393622wrv.7.2022.03.04.19.05.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Mar 2022 19:05:17 -0800 (PST)
Received-SPF: pass (google.com: domain of mranostay@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22535GkJ106164
	for <jailhouse-dev@googlegroups.com>; Fri, 4 Mar 2022 21:05:16 -0600
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22535G2p031642
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <jailhouse-dev@googlegroups.com>; Fri, 4 Mar 2022 21:05:16 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 4
 Mar 2022 21:05:15 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 4 Mar 2022 21:05:15 -0600
Received: from ubuntu.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22535Bvm123249;
	Fri, 4 Mar 2022 21:05:13 -0600
From: "'Matt Ranostay' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: Matt Ranostay <mranostay@ti.com>
Subject: [PATCH v2 0/4] configs: k3-am654-idk eMMC and IVSHMEM changes
Date: Fri, 4 Mar 2022 19:04:54 -0800
Message-ID: <20220305030458.2938-1-mranostay@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: mranostay@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b="lmiPHm/i";       spf=pass
 (google.com: domain of mranostay@ti.com designates 198.47.19.141 as permitted
 sender) smtp.mailfrom=mranostay@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Matt Ranostay <mranostay@ti.com>
Reply-To: Matt Ranostay <mranostay@ti.com>
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

This patchset enables eMMC access from the linux demo inmate for the
k3-am654-idk platform, and additionally adds a ivshmem demo interface.

Changes from v1:
* Re-order patchsets so ivshmem changes come before eMMC changes
* Split out eMMC enablment to its own inmate configuration

Matt Ranostay (4):
  configs: arm64: change k3-am653-idk memory window
  configs: arm64: increase PCI memory window for k3-am654-idk inmate
  configs: arm64: add ivshmem demo to km-am654-idk platform
  configs: arm64: add emmc inmate configuration for k3-am654-idk

 .../arm64/dts/inmate-k3-am654-idk-emmc.dts    |  45 ++++
 configs/arm64/dts/inmate-k3-am654-idk.dts     |   2 +-
 configs/arm64/k3-am654-idk-linux-demo-emmc.c  | 208 ++++++++++++++++++
 configs/arm64/k3-am654-idk-linux-demo.c       |  55 ++++-
 configs/arm64/k3-am654-idk.c                  |  51 ++++-
 5 files changed, 350 insertions(+), 11 deletions(-)
 create mode 100644 configs/arm64/dts/inmate-k3-am654-idk-emmc.dts
 create mode 100644 configs/arm64/k3-am654-idk-linux-demo-emmc.c

-- 
2.30.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220305030458.2938-1-mranostay%40ti.com.
