Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBVM2W35AKGQEZ6SP3TY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63c.google.com (mail-ej1-x63c.google.com [IPv6:2a00:1450:4864:20::63c])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C85258488
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Sep 2020 01:52:54 +0200 (CEST)
Received: by mail-ej1-x63c.google.com with SMTP id m24sf1094086ejr.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 31 Aug 2020 16:52:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598917974; cv=pass;
        d=google.com; s=arc-20160816;
        b=F5U9nEk8wG3O/xAmRhjMfZD8jrWELitKV3pnEzfZOgp/Dt1ZpdcSQczc2E9ECpXbyU
         LkH4SnAMZvCz+2UysYg5NhZlJRFU7Q4oNo+Cq1vs+9xD4d0hrIzZv097DBQj1/B3WvCJ
         noUIZLduq/AflmDuFEFznVE0Zi1F7P3FrBu05QIS2UHCXB+j4sopXSYb6I+DHv+By8Q/
         5Lv2P+mcV+rtl2UAHQ6p0KG3UQoLFLXPqja1U7KowsefhtNUj6m01M/jcHnAM4LGbiJp
         Pq35tLdcPs9M1fjTOwm5OFNQG5aOEnC2iok9cw5CZ7hbeiMjENCjDhoOfj8W/wGc93Xv
         HRLw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:to:from:sender:dkim-signature;
        bh=5+jvbQO4qTwGUVjhNS84E/NZbH8TA8EtAifv/pP+7bo=;
        b=NuQK5ZCIe7ZSPVaZUsYemJ3NzmqQocGC4FXhruFGEGJ6aDohoPsJOGVad0JyIH7Eox
         tCYuP4JXK667kfjLIeC3UkN10bUJEP5uRroPEJkcc9GokBnp7vG4fI+/RvatZNXWb758
         YL+9Jf9uOX5Ik47tI6JE1J+ezJOfS+igzd5dVkigOm419ofKumJWBIhlebR0EE419BYi
         x6zFajBqntU5aM6tDdoLggr77WxipJl1cs5mmr90eT11UKP8kwiDNFNb5hw+X6q5oSCN
         IoIT24q67h07zxvPfsjUsHVyHduNZkBtmLBmGPKS0SU/l2XlZRzuxOsY5m24Ny25jh8O
         Q2Wg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5+jvbQO4qTwGUVjhNS84E/NZbH8TA8EtAifv/pP+7bo=;
        b=MtOYboHgstoNSY7peIkYfpBrrp+Ut6rM+o3s673K3uMw0Lu2G15eGCQQbF5BsUitCG
         cIgiLimW3Zucgn7sAD8oOnj3ZQUrRP5CVMgCbcZpAV9ugR02RzmWDMwnnirwHwqLmtXu
         1fQnfh3mGVNWtrQAYtcn3x3m2K1kOZHzOeyJG2VuAFgbBuhbZEXWitXx3tP7eBKfCEt5
         OeDx0PNu/xFMqTbUqbHy6KMx3tWhSzoqx2Hb41iJ1dKEcDd44CT87NnO90c8xm0OTyz0
         M5GTjjRxPrbVxqiXKw01aUAl8aq2Tk1kPGPGcVK5UaONb7LdswcLQoPQ+RQ/65vxgayw
         Y16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5+jvbQO4qTwGUVjhNS84E/NZbH8TA8EtAifv/pP+7bo=;
        b=Id+PZqEA7/12uJi27/yZU1TLJP9FNa5Jkp2tNKdDdcSqiwKAsl4assxbSYiWtDGNus
         E1uCV5stY9PkyZ7rkK4ObO39JC1VMeUSqw+mwSdFuBO3Xi6ej0Il4M9Jzj9ftXmiyY8g
         qfl08yycS0G5tiMkKjP1FUVsXt5WlJb0CvM2WSbUknDWVVhm32toSiFMJ1A50OxQXpKk
         PujgdDbZnwQVEr3LU5nk2NuJSbJS0N/FlsRO5cSmzReVwX8kYyNljWgHW0rRXsMG49Cc
         q93va+0Hp8sTFfOaAcZaVnOCkicB/+8LshrpOkSVUAFTktqttyerhPFIn9A4CnWt2HbJ
         j1rA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533e6+Qw70gB1gSDpY5kaQ042RLJLgrKriJWqP+C2iYt1uEGd/s8
	TAdEkeyEbaVUY+QwNC+z6/Q=
X-Google-Smtp-Source: ABdhPJxK4+e4mtR8u0mMw5oE8xIA9tZvHgxyWpqh5gRyidG2LrGUAgp1fd85IRzY2EdowOUgmGzpiQ==
X-Received: by 2002:aa7:ce81:: with SMTP id y1mr3281050edv.51.1598917973936;
        Mon, 31 Aug 2020 16:52:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:f849:: with SMTP id ks9ls1887722ejb.11.gmail; Mon,
 31 Aug 2020 16:52:53 -0700 (PDT)
X-Received: by 2002:a17:906:1542:: with SMTP id c2mr3279421ejd.533.1598917973072;
        Mon, 31 Aug 2020 16:52:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598917973; cv=none;
        d=google.com; s=arc-20160816;
        b=qfteRCEQ9mT5RZj/K825K4OI952A8BqNgxJbi6mrl413LgMl3B2iAA+sEI/Cg/Ib9R
         ka1luFWtDS+t+fYMKQHhVZ8xeT0plPzhiZCdz+n1EFZmXMHo+BCoptTUg8hBOtZWEVqX
         5FkSXsixBSnvxvy//SkLqIIGtCgCsmuCOZUhDQLY86k/ZbxOZIoCQx4OJLZmj0gqUrbr
         rH0qjB6V8/toijfFTtRVlWJsCfqFZDPEPJTWUoUgerMwzJt8h6gC363LOK65T0zQk39j
         FXGX45ertsbAYACvz1bGqqlfORZsVwrnwLKoVRn4CQqKYlBwKCezBiAZqwVJayvnW7s6
         qb2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from;
        bh=/PILQXRJXqsmc1deKgmMwmqjfySrFqWk8yuvd3GYgKY=;
        b=qjsWQoZR+cFRc4c4RJJgEW2kbjZC6BzYK3ncXD5yXnX8/5zpvlKh9LUcbNF73txUfo
         WsWVZWmaFKu3Y/uja5hfTr02IJQZcWvwj4KvA/0to6vwdhBxtQBBTOsGWNtY4CAAWGvz
         CDTzwyzlmxc6JeleIkEPx8FMv29WR5JxNSr+Wv2ZlQrXXcDCkKT5uA06LhywyWMJWOSM
         pngfZuvTZ9gVUmefPEeh5B2DjGKk7HSDT82fjtASXISuhb0W0owk+YRf2NeRElI7OLfz
         CLnTqRHY8DKktoC7TsU5YH7WGn9o4wW0RyiYMQOv+0nWU5WKwulQlRDe2qW+F3CZdM8N
         5+xw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id ca8si160601ejb.0.2020.08.31.16.52.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 Aug 2020 16:52:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 07VNqq16001871
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 1 Sep 2020 01:52:52 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.128.15])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07VNqorG007358
	for <jailhouse-dev@googlegroups.com>; Tue, 1 Sep 2020 01:52:51 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v2 0/7] Updates, support for all RPi4 variants
Date: Tue,  1 Sep 2020 01:52:43 +0200
Message-Id: <cover.1598917969.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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

Compared to v1, now with the NUC6CAY/IPC127E fix fixed and with
truly(TM) working RPI4 2-8 GB editions.

Jan

Jan Kiszka (7):
  jailhouse: Add GICv2-related upstream fix to 0.12
  linux-jailhouse: Update stable kernel versions
  Update to kas 2.2
  Update Isar revision
  rpi-firmware: Switch to overlay-based RAM reservation to support all
    variants
  rpi-firmware: Update to 1.20200819
  jailhouse: Fix build of x86 configs with latest version

 .gitlab-ci.yml                                |   2 +-
 build-images.sh                               |   2 +-
 images.list                                   |   4 +-
 kas.yml                                       |   2 +-
 recipes-bsp/rpi-firmware/files/cmdline.txt    |   1 -
 .../rpi-firmware/files/debian/cmdline.txt     |   1 +
 .../files/{ => debian}/config.txt             |   1 +
 .../rpi-firmware/files/debian/jailhouse.dts   |  28 ++
 .../files/debian/rpi-firmware.install         |   8 +
 recipes-bsp/rpi-firmware/files/rules          |   7 +
 .../rpi-firmware/rpi-firmware_1.20200212.bb   |  29 --
 .../rpi-firmware/rpi-firmware_1.20200819.bb   |  29 ++
 ...d-support-for-RPi4-with-more-than-1G.patch | 306 ++++++++++++++++++
 ...on-gicv2-Fix-byte-access-to-ITARGETR.patch |  52 +++
 recipes-jailhouse/jailhouse/files/ipc127e.c   |  24 +-
 .../files/{ipc127e.c => ipc127e_0.12.c}       |   0
 recipes-jailhouse/jailhouse/files/nuc6cay.c   |  24 +-
 .../files/{nuc6cay.c => nuc6cay_0.12.c}       |   0
 recipes-jailhouse/jailhouse/jailhouse_0.12.bb |  12 +
 .../jailhouse/jailhouse_latest.bb             |   5 +
 ....4.42.bb => linux-jailhouse-rpi_5.4.59.bb} |   4 +-
 ...4.bb => linux-jailhouse-rt_5.4.58-rt35.bb} |   4 +-
 ...se_5.4.43.bb => linux-jailhouse_5.4.61.bb} |   4 +-
 23 files changed, 484 insertions(+), 65 deletions(-)
 delete mode 100644 recipes-bsp/rpi-firmware/files/cmdline.txt
 create mode 100644 recipes-bsp/rpi-firmware/files/debian/cmdline.txt
 rename recipes-bsp/rpi-firmware/files/{ => debian}/config.txt (86%)
 create mode 100644 recipes-bsp/rpi-firmware/files/debian/jailhouse.dts
 create mode 100644 recipes-bsp/rpi-firmware/files/debian/rpi-firmware.install
 create mode 100644 recipes-bsp/rpi-firmware/files/rules
 delete mode 100644 recipes-bsp/rpi-firmware/rpi-firmware_1.20200212.bb
 create mode 100644 recipes-bsp/rpi-firmware/rpi-firmware_1.20200819.bb
 create mode 100644 recipes-jailhouse/jailhouse/files/0001-configs-arm64-Add-support-for-RPi4-with-more-than-1G.patch
 create mode 100644 recipes-jailhouse/jailhouse/files/0002-arm-common-gicv2-Fix-byte-access-to-ITARGETR.patch
 copy recipes-jailhouse/jailhouse/files/{ipc127e.c => ipc127e_0.12.c} (100%)
 copy recipes-jailhouse/jailhouse/files/{nuc6cay.c => nuc6cay_0.12.c} (100%)
 rename recipes-kernel/linux/{linux-jailhouse-rpi_5.4.42.bb => linux-jailhouse-rpi_5.4.59.bb} (62%)
 rename recipes-kernel/linux/{linux-jailhouse-rt_5.4.43-rt24.bb => linux-jailhouse-rt_5.4.58-rt35.bb} (65%)
 rename recipes-kernel/linux/{linux-jailhouse_5.4.43.bb => linux-jailhouse_5.4.61.bb} (62%)

-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1598917969.git.jan.kiszka%40siemens.com.
