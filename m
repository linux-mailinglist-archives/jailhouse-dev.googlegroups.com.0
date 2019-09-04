Return-Path: <jailhouse-dev+bncBDL2JD42SEIBB4GYX3VQKGQEEH4SAJA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x63f.google.com (mail-pl1-x63f.google.com [IPv6:2607:f8b0:4864:20::63f])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F743A8208
	for <lists+jailhouse-dev@lfdr.de>; Wed,  4 Sep 2019 14:22:10 +0200 (CEST)
Received: by mail-pl1-x63f.google.com with SMTP id d11sf5311584plo.6
        for <lists+jailhouse-dev@lfdr.de>; Wed, 04 Sep 2019 05:22:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567599728; cv=pass;
        d=google.com; s=arc-20160816;
        b=rrEC3Qp6HeHwKck9370O2HHlAEH/X4ONEiGFDCxzc1yHpTcPeg2LzlesUl+/vqjp7D
         ehWkoOHttLGF90WmK37F3ATfAxA6TW7amrpn5xtOFNEb7Dgz10M/Y2cZ1tKxkJCaAzFf
         GRjYH124+6TxYgkupewAkptYxB23O+gf+XIiv6Nxej9lj2k6vrfulFLoZJneXAPJi4MO
         OxovpP+JlaHDV7uxHqfjjDdjvWe4uDOh9Nwx4v0mr87xHT97ZGAL38CA6k5QebBtoj33
         MntMsyBknXzlheaKyB0j/T8LjxYOxm9JBgdv+eIRW9sUaCauQHz2526EDPbG7imKqmuZ
         HDcQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=f2hcVENlUIwiGdyYg3KR/1izS4pWcBA7ovoGbhHI5yE=;
        b=XKzanOzHZumteHrUalY08SCh0gJWj6gMeuz4ucutMr6uyFDpV1ZVmck8Z+tqKfU6Bx
         m5SFlof3rzJuavKNRoLe924GBGTHtB8YFiUbkYzUXmQziceBtef0E1asfNPqZeoOpoPO
         LJ0nOvJ3uvQeZk9+VUBVGIEh8mKVhK9xAnbdlKjNzk4X0bkb/QNieP6rKzXIbgifRejC
         F/oSPJKidFoIMFO4f9tasQjkqZ4XZgQ3gIG+89CIkzkfESZQKmGPC1hI0kSLAdN0xCnc
         u5lSXVS66GMtnhuq/nK8e+hJXVRVF8eiWZLRVGlx0fl/WPFJeaMHE9wqIv++bvZM8QVF
         pk8Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Gj5H8+X4;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=f2hcVENlUIwiGdyYg3KR/1izS4pWcBA7ovoGbhHI5yE=;
        b=fF5Q22CA0kW08F8U0HbFQtmEHZ06kE1keVAehkd637BISFYiDL/dQwarBP5HoDr+rU
         rrjMVnnMNhH6ayH5IgmSQQTk6SHWaZk1ZAwijGUfPUTkOIKPFnCa8acZNTITdkUB78sT
         tJL4ekdI0Td5MdbT0Ri4S54yCMIF0o55jxGooVcVg+fFfvF0ylSFTPJPNvy0JMdfL95r
         1b20gANGcbaUj8kZJvf2iaI6LRZ1ZuOJYFIVFwZ9R3IbM2xn3z2shh98GjdfuH8pWFJs
         QrcYkQ5XpcFdPRHrTctNrGUMISJdrl1xjfzPl8AcIlblqsCSMPy+RG0ctmOXlS35KAkr
         yiLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=f2hcVENlUIwiGdyYg3KR/1izS4pWcBA7ovoGbhHI5yE=;
        b=uECBlEYmkYsbK6/uElkTsEQ+WZAsAd2eYLYaxILMjr/BPAczoROYvDAGkDStUWU156
         W2ketzXO4DuhBLoRna9Ifz5i6Gwnp4IL66+X7IZLzZuAQMMXO1Id1lHE73K+tBsYNRku
         OTwfz9ZTOKYPLYJu9Ld0Z0Pzl4D+4XfQDunIGw4Gdr9w2symTLdAK+BAkR2Vv4WMVTQP
         k2j1H97w0G4t0W9lAHP2MO1BClekw63u7rzpict+ehurY0hSPN6IAcABJ96NSSeMaOO3
         8rGu9k/+0BNzoXEFw5Sj0l4Ib+l/RyMEVHNX+DEqELbyFfzjenO1hrYo5cdKLN5pL3Ue
         JjbQ==
X-Gm-Message-State: APjAAAVIYhLgRysXs3XoRDxs5VTqmR1f3vwz0Ri95v/FvgNVetn1wttQ
	2YWleO8nTQ8/M4fReu2P/3I=
X-Google-Smtp-Source: APXvYqwMciBDUljGOhPqgr5UvEKf40EOnZoIQh3kwX/OaII+yLKdzX1U1EfejMUaXlpZQeEOANH/sA==
X-Received: by 2002:a17:902:7781:: with SMTP id o1mr7401053pll.238.1567599728754;
        Wed, 04 Sep 2019 05:22:08 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:83cb:: with SMTP id j11ls4870155pfn.5.gmail; Wed, 04 Sep
 2019 05:22:08 -0700 (PDT)
X-Received: by 2002:a62:ce8a:: with SMTP id y132mr45558215pfg.240.1567599728435;
        Wed, 04 Sep 2019 05:22:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567599728; cv=none;
        d=google.com; s=arc-20160816;
        b=P0csFWpa3l8tWv6ah3snJtGUngnMDj7L2TCZPptkkuk2bN9S7WSD2sK8oYX8+0vW+t
         fo8UuFwag6U2ePwo0Tyh2/8R6KWqN1/s6w8SB9c8UlbCQpztC0YuzDjeSqlYPyXAd+1t
         wVgTXriixyB7RagOCzORZOmDkOOsMC44ABu+GmJm+zXg7L6gFW7Wyt0UGYqSvnoHF0W2
         p7V2FG5mQ11CrAIYuOMasy9mzAtDLvO/kUl5I0N6owuwSkKMDkUpYAhgHGh7uumK5jqM
         dBybw8qWBv7dABJrZDkhedLqUg3ya77BzeDPrYjGX2hm+QvclDv0CybztZatvIN25zLA
         KCnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=uCzLKXK2oPzMONRv83uuuX2o/0FUbenlYB7Lxd76NxE=;
        b=n7O6AT+O2pIXgkgRrsdyr1wZ/BJ3WuymlQEFg3e91f1Y9TeiNuqbNJXdv8b8CgzTQZ
         1CoCy5aVVqGTliufl1NFvZtbv2zl3bFROdZAU3D5jm+V+kIqf/EcZCBYliOuq2ILwwLs
         1+I96sd1bxIHu/Fge+aWKj7VuuVUdkGPTp/XneKe/qCagHS4YriXGaHrFhC4tUD1R2Ao
         ALKS2UxpaZlR4SiGH730PcLAX0jpk4SPtbMAU3Nunn7E9UC6NDTi6x8TeVLS+4VajyYr
         Hmq5zJGHOPAZvsMjBsVLJdLa1UpmqWG3SX2atIhRntACU61/8mEsXanhUwsu4NUwzwia
         pOUg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Gj5H8+X4;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id w4si33334pjn.2.2019.09.04.05.22.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Sep 2019 05:22:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x84CM7n4119307;
	Wed, 4 Sep 2019 07:22:07 -0500
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x84CM7ac121027
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 Sep 2019 07:22:07 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 4 Sep
 2019 07:22:06 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 4 Sep 2019 07:22:07 -0500
Received: from NicksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x84CM4PF116363;
	Wed, 4 Sep 2019 07:22:05 -0500
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>,
        <lokeshvutla@ti.com>
CC: Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [PATCH v3 0/4] Initial support for j721-evm board
Date: Wed, 4 Sep 2019 17:51:59 +0530
Message-ID: <1567599723-19589-1-git-send-email-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=Gj5H8+X4;       spf=pass
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

This series adds support for the Texas Instrument's j721e-evm board.
The J721E SoC belongs to the K3 Multicore SoC architecture platform
for automotive applications such as infotainment, cluster, premium
Audio, Gateway, industrial and a range of broad market applications.

Nikhil Devshatwar (4):
  inmates: uart-8250: Add MDR quirk for enabling UART
  configs: arm64: Add support for k3-j721-evm board
  configs: arm64: Add gic and uart demos for j721-evm board
  configs: arm64: Add Linux demo for j721-evm board

 configs/arm64/dts/inmate-k3-j721e-evm.dts | 285 +++++++++++++++++++++++++
 configs/arm64/k3-j721e-evm-gic-demo.c     |  72 +++++++
 configs/arm64/k3-j721e-evm-linux-demo.c   | 242 +++++++++++++++++++++
 configs/arm64/k3-j721e-evm-uart-demo.c    |  72 +++++++
 configs/arm64/k3-j721e-evm.c              | 340 ++++++++++++++++++++++++++++++
 include/jailhouse/console.h               |   7 +-
 inmates/lib/uart-8250.c                   |   3 +
 7 files changed, 1020 insertions(+), 1 deletion(-)
 create mode 100644 configs/arm64/dts/inmate-k3-j721e-evm.dts
 create mode 100644 configs/arm64/k3-j721e-evm-gic-demo.c
 create mode 100644 configs/arm64/k3-j721e-evm-linux-demo.c
 create mode 100644 configs/arm64/k3-j721e-evm-uart-demo.c
 create mode 100644 configs/arm64/k3-j721e-evm.c

-- 
2.7.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1567599723-19589-1-git-send-email-nikhil.nd%40ti.com.
