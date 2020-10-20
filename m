Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBI5LXL6AKGQE2HPTH5Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3e.google.com (mail-yb1-xb3e.google.com [IPv6:2607:f8b0:4864:20::b3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCE7293605
	for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Oct 2020 09:45:41 +0200 (CEST)
Received: by mail-yb1-xb3e.google.com with SMTP id k7sf1191738ybm.13
        for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Oct 2020 00:45:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603179940; cv=pass;
        d=google.com; s=arc-20160816;
        b=oDDEJf4j/JOF+zXwhdaHZFfnXCXzZyjVpv9L9/wIpvkSZvtJR9oRoD/mJMffXKXrVc
         SAfvUAD58472lP1eq42zveKthqakvQS171iPP4X7rznASfKD0ea5lAqzdXW6GK2PLTww
         71+KVLhwmTp85c+ICQUspf0D+UK0FThqYwe7iDitbI/lB2euRRCdXGIgUVbBFxczEbza
         mB57LYuHJuqEpKy6m5XNi0G1I4BcgRGqVJtO+PRuTuA81P3hn9W8Njr2VBa3dOKvtHqY
         NBqXwyMnrWj1tzoPH7UwKfYzufTdQGVWvRgdaw/1rKXvbkGDu018RYulbWEuqvDubqVV
         bDNQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:message-id
         :date:subject:to:from:dkim-signature;
        bh=pCWAZU3TTURgPqOdV9YO+VVQIJeRjb0WeY6LKW/1uuo=;
        b=r1jXyf2WSEodmEgNgtwkoMHdG5KeS0tefyXcuBa7D27puyhVLkYuBAv4OvQSqrZoJD
         ohWUVv389F3srRLx0ea1wptYMQb8x1YnwUaxdCatSiMubxuY1LwEABYEFV9S58XW0j31
         t+1IGOeA4+hPHkhaIXTKWX2sOz28uSlkOzUCBTn/wzXlPwajs2DLesQx/GR9PUAP5T31
         I4KqA/IMa9hUkjGoicCrHZQpHP2HdOubQ15uoGH8x4MWqJevuQtEUbvrbF9lZwkF6raK
         Oc09ZmT8I2dWAeceExIpCbIpr7Sn4ay2smzMWWqmo+X1bINGjlyfhlLHXaSHpg/QWBXj
         bo1Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=BtuWA7dA;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=pCWAZU3TTURgPqOdV9YO+VVQIJeRjb0WeY6LKW/1uuo=;
        b=X9yHDQne9hFdY7JeCzZPvk0qUBpV+0GLngFmo0BIuhOu6v8fkWuG8Libnesk8TEhUu
         HiBVrVPu8nXF3cB6A/PxYw2uhjP1vvH4uLR7Z/6hrhfIsWism/dAjX7JT2zJj/uixXN4
         Ys2/+j2uZ8WjPwSfghF2fmYuWPWD6TlNK3VJVqjtUjVaTV3+Ov750Cfp7rVUv3wzcaaC
         q3UpDzJ0NSLbq4VU74iKOhgJ5vRE01RVLeKwMlxoNW8z8Lgg27UX0n7dbF6uCvt4d6Fl
         afdy9mVv5mdML7/uSM1BDhendPqe6LHrG2JfzO5mltdO4W2QW1QePJ8sHemzWDOJDQYn
         SGcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=pCWAZU3TTURgPqOdV9YO+VVQIJeRjb0WeY6LKW/1uuo=;
        b=KZ6qWBAKRq+UouRpINhoRoD3sL7Sv2V88JKjavftshGJWET7tQexSVHYVwnkWc3Lt7
         9HLF/AG4rqVlggSbmdUUuSIXfRamyBiBiIw+ciBeO80QbrLzso8bsiJkzHUjvFBa2OYg
         AS5w8BEBv2pSmmFJFCywaLcGzPysWw0g9C5U9OUUUsHl9vYCBpDOKAgmg/RoslFIDcZq
         VDu1JPZ6PL9OPhKtL84SXiwcb4LH0Oq4wweYN5Pk9PLfetq6moCh55A0NrA//rxWaXCF
         mpPaSIFk7odgK+z1Jk2soyVbLJpE7STQb+YiR2Z0R5vx1qIqFVCIRaLZrkhKBG+rkArK
         Z1ew==
X-Gm-Message-State: AOAM530C+pUpWr+gDU8cmCmQaTEBLHsHq6FPDYzahZsyoriUnB75K16R
	ucraYhgkWtSkLBOgUgJA0v8=
X-Google-Smtp-Source: ABdhPJzPv3CXZYwE1NIG3IlVpKJTPkV72y+Cw/Q4bmk9zSBjg8tsNwF/6CLUVHCLI8EQRaYxggHjkw==
X-Received: by 2002:a25:6fc5:: with SMTP id k188mr2364653ybc.195.1603179940288;
        Tue, 20 Oct 2020 00:45:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:3f81:: with SMTP id m123ls203830yba.1.gmail; Tue, 20 Oct
 2020 00:45:39 -0700 (PDT)
X-Received: by 2002:a25:cf4e:: with SMTP id f75mr2376451ybg.449.1603179939473;
        Tue, 20 Oct 2020 00:45:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603179939; cv=none;
        d=google.com; s=arc-20160816;
        b=lISEZnGLFOlqDLSK39w5hY5JOaZEZcEVFML00Z+n+zzrQe3a0ba0/y8ydh/7eMX92W
         hg7le1/34P6NBww0yWu7a2MbYtSrQJgXJGcM+lu63+tIv/kSnirB3qJaEc3gNjcLkHmq
         FloAStjjR4PIYG90kIJEwZPfrWvTbT0lc0oTZQnSiiS4bE4Lg9O15J4ExvzhKInhL5GA
         ssM896FUB/Be+hGxEFXmts5wBRUZP1Xr315V1TZ0LJV3mLWjMBWGdXX8fWrWtcmpq4ti
         aOMtnz6asR2i/rxmqgAI7N5xCBAF+k8JEb3C34mH/s0Jlj4rSHr0Cj6NprmyhANQyHuP
         SYCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=MaXAvYJ92z48lTxozrN+EdJTwgMElt+CI9D7/zsVwG8=;
        b=LxiyZZzVtoG3KWGS9v/jhc/Xelg1JoqG5XIcVVJ7SOHsQeBtuSSciYExUXNIW9Mj++
         /sVe5Lfz4yanFqHjsss6IOWLsJFAWmYaTgTgG7ozAcSxgUT7gc4YY5P6CefjTexatEk8
         4cPHqHFCOH3cAGtL1+oYLeblwqpOuU7cPLwU79gHTKj9QkEpGOZeQEtOaL4+5PNsGBfn
         p4eLnfd/CIVB9WQOOWBvfFJOLNCyetsK1oQchMM/slNAVREly0hzybf/DNlZP9vrs8hs
         N4k/v/Im74nB9WCi2OIOI+CPVMsbXLhLZmDOgBXkAlkcopAxpuAkRQLjTbRaqmydhVPk
         IuIg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=BtuWA7dA;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id t12si73656ybp.2.2020.10.20.00.45.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Oct 2020 00:45:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09K7jdka041017;
	Tue, 20 Oct 2020 02:45:39 -0500
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09K7jdIP029089
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 20 Oct 2020 02:45:39 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 20
 Oct 2020 02:45:38 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 20 Oct 2020 02:45:38 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09K7jaR4011198;
	Tue, 20 Oct 2020 02:45:37 -0500
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH 0/3] configs: arm64: Add support for k3-j7200-evm
Date: Tue, 20 Oct 2020 13:15:22 +0530
Message-ID: <20201020074525.7941-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=BtuWA7dA;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Nikhil Devshatwar <nikhil.nd@ti.com>
Reply-To: Nikhil Devshatwar <nikhil.nd@ti.com>
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

J7200 is a new SoC from Texas instruments which is targeted for
automotive networking and Gateway applications.

k3-j7200-evm is the board with this SoC, which is similar to the
k3-j721e-evm evaluation board.
Add support for root cell, baremetal and Linux inmate cell configs
to support this new platform.

Nikhil Devshatwar (3):
  configs: arm64: Add support for k3-j7200-evm board
  configs: arm64: Add inmate demo config for j7200-evm board
  configs: arm64: Add Linux demo for k3j7200-evm board

 configs/arm64/dts/inmate-k3-j7200-evm.dts | 351 +++++++++++++++++++++
 configs/arm64/k3-j7200-evm-inmate-demo.c  | 128 ++++++++
 configs/arm64/k3-j7200-evm-linux-demo.c   | 238 ++++++++++++++
 configs/arm64/k3-j7200-evm.c              | 359 ++++++++++++++++++++++
 4 files changed, 1076 insertions(+)
 create mode 100644 configs/arm64/dts/inmate-k3-j7200-evm.dts
 create mode 100644 configs/arm64/k3-j7200-evm-inmate-demo.c
 create mode 100644 configs/arm64/k3-j7200-evm-linux-demo.c
 create mode 100644 configs/arm64/k3-j7200-evm.c

-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201020074525.7941-1-nikhil.nd%40ti.com.
