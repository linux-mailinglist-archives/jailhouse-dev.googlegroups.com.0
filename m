Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBYVXXH3AKGQERYJHCQQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd3a.google.com (mail-io1-xd3a.google.com [IPv6:2607:f8b0:4864:20::d3a])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D841E41F9
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 14:24:03 +0200 (CEST)
Received: by mail-io1-xd3a.google.com with SMTP id a2sf12091386iok.11
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 05:24:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590582242; cv=pass;
        d=google.com; s=arc-20160816;
        b=VcSW/XpD+SRSrx1HuMTBCtXTRn718GcdYPOZMayh20cjSSF8MldCAx8uhE/+vBxADg
         z4cE48kIIfKPn7souYP2T1U59I1nfhrDufT8r08jQGibB/fN31lK2JKSTlSUQ7A0d1AJ
         5hGxRDYg+TIT5061HeEWPmfpScxYUckel/bxyXOE5rJdqc7T1mkXqmt8Z8EAB594OU1k
         9PvosKuTWNmVhQ0yV4/I7UZ2FgREMuDxNpo3zfpL2BMnMsNbx7NZw03uTK9FiDLvfRZp
         ADkVxxNadg7SEVLjKBS38Bj44xRMKglpZujEdNsys9AehPM69GhqxvZog3DPJDvrshyK
         1YIw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=rGXE7v//vT7dBtwJOkfTgkOU0LyQntue40ZufwTP7wg=;
        b=BTX9xiNlUDPRYDjCiYmm7UwlM1+RFZSdbr51EVlh15UbPcL54KtkfCoR3SQ+joutAv
         mlezDdhNpLrirKiewgFyjU8EPqImqdUoZXhh9usjxGVdk2KT4ELA2pBnuxmG6BfQu8qJ
         osUwz0SGfZ8hiiw6anU8tc+WC5whpbFosQZBdYFyDloVpQmQillUiBPQGwfO5HHaoCSd
         U3xPmqNLBVSKWL43ai19jm0GgQqYpzL8AaN9+rNYd1pDakR1yBX+LVIpu3s8NCU28JdL
         YTaTMeA2Bi6siZrvZjuAnReUf9BByBryAQUdry6H3Zm/r/NogPf6UvHWc7eVea19kBXi
         +tBQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b="MYlCGj/i";
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=rGXE7v//vT7dBtwJOkfTgkOU0LyQntue40ZufwTP7wg=;
        b=LPRAiRntk1egd8PB9w+/ayyOYRkfw3k0xaxjyjpnmMwNxum9P5AFXNdEFKJ6v5JAQS
         K24xF8V1+i+AZzpgH9Js0pLZit5N9ffepCXm6K7OL8bXjpgo5hM6l02x2RotF2jSmahi
         l+kFZsyKzVbN/tBpIoSPay3c8t3ydyDWJ/4Jdv/w9Igh2SlZVP6iN8r/23qz0eZxVaXb
         dpmr3T/2czE//cdIrzLxn+gOsTB4oB17Wac1xE6oLTb7MtpOflyR9txixpm+a0wftyhu
         qo+X12FGM6RWHm1AESsVztBCykKIA/9lfB09fFK02YezBkm9EIjEPKHPYy50bc4gY9LV
         C5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=rGXE7v//vT7dBtwJOkfTgkOU0LyQntue40ZufwTP7wg=;
        b=MBM8bvgR8BP31UySeBg+LgKO0fog42qFd5e/MG27M2s/5FhItF9z2JIkCtKOMWAkN4
         MxUleUV1hLpPj6UC5DRtfZ+YDMVk4ISYaflRX981vJZcWI2C3mZHbrUZNBI3UI0Mqs58
         u2s0UJX4sNz+Q2H7DcXlyMMmngjAI0NYej6lZMprg9ERGZbDWmnrZOV9GBiv9yFkrjkM
         WlGQpLQEPbpNh88xUIG7EmRoc9I6xU+wLdX6mkhEcmOCDSXNhDUWTuNAqC/rOP4mCyha
         x0eP9bz9RNuME4T+6KMbTKjiXYEuimipQWZnNwhFj0X+vvTQ3g7W7bCV17VU2mC25fJb
         f9Hw==
X-Gm-Message-State: AOAM530RxeGXWV8ViNwLGgpNg2AxDFw45fO9uK8wj/Rgib5HrSjETFJG
	lKbBzPzWAycJzqEcjcf4s/U=
X-Google-Smtp-Source: ABdhPJzhlmDg/dhjmVzw/Lc7BkQtdafKP5o2jX388lB2e39QjNx5F65ozgwpNnrmOCjAaU/NzI7wWg==
X-Received: by 2002:a92:9e16:: with SMTP id q22mr5184700ili.17.1590582242372;
        Wed, 27 May 2020 05:24:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:9718:: with SMTP id h24ls2281914iol.9.gmail; Wed, 27 May
 2020 05:24:01 -0700 (PDT)
X-Received: by 2002:a6b:bc85:: with SMTP id m127mr20135012iof.89.1590582241897;
        Wed, 27 May 2020 05:24:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590582241; cv=none;
        d=google.com; s=arc-20160816;
        b=KLA7uySCq6IM4BxONLFiQqXoV9B9tuWC6slqw9BP3QSspQqMgvFlojIT2wsFPwf26x
         dTjhgnZlpoF6q3cxIiNWr8E8Rz+3LprgbNRQIvV4ioqklgYRt3PlQokdTBtjUjHsmMpB
         JvUiZVbLxADKQPn3n5ci3H95MULF1YEUvpi0vQ9offzAvhbDa8FqXn2MZgEcUogCeaHh
         75EgiIgbfYapnx8mSDmPwxgvsnGndaAfVD//Wu7CVMOpk93MjGEPdZxcAIBBxh6Ae1l8
         YlLTo34SuzwJmoO1M5t7hdIlzgb+ZUFO0wvpyF6A6HjN92ep3aDHRJwPiU8wvUpxfVjU
         OhSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=NoMzeHxLF4Y5Tuo4UVIhzFfRudGQmL2Qci0IpgGUjUY=;
        b=Sbad+K9EtEY9745vAVcyDCsrIVxkxCubyPqANsgDBEgf1HxwKjWe2CDS9OUGyg9hV1
         E3pppKpUvTD6gXjLon4lLm+W2dgsRGDt69ko9RcognRd38tJSQP9PxTh/h2NngrTY+ed
         m/VjZpXYsqziHya+e1T+gd1RgaNRSomzUU7uYAKgxwumLSZ8rDoEyzcyR68zy+q4eYI+
         xdJJYsHR1uGgzwEd9Pr2nuftyEkVI8pYTz0/0Dlf6S6rzmpzdvG1y0APYTsgH1RtUTNM
         42cKcy10VqTTIflbEGPc8tahJpMzAMdmL1Qa5avoNJ5JPY3QIo/ouuMSqKGMQktkXLia
         bpUw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b="MYlCGj/i";
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id s66si165362ild.2.2020.05.27.05.24.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 May 2020 05:24:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04RCO1s0005808;
	Wed, 27 May 2020 07:24:01 -0500
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04RCO1N7112004
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 27 May 2020 07:24:01 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 27
 May 2020 07:24:01 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 27 May 2020 07:24:01 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04RCNxM0076356;
	Wed, 27 May 2020 07:24:00 -0500
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>
CC: <lokeshvutla@ti.com>
Subject: [PATCH v1 0/5] arm64: k3-j721e config fixes
Date: Wed, 27 May 2020 17:53:53 +0530
Message-ID: <20200527122358.14723-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b="MYlCGj/i";       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: <nikhil.nd@ti.com>
Reply-To: <nikhil.nd@ti.com>
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

From: Nikhil Devshatwar <nikhil.nd@ti.com>

This series fixes few issues with the jailhouse cell
config files. It adds required memory regions for
fixing crashes due to accessing few devices.

Also, remove some obsolete device partitioning
which is no longer supported in the 5.4 kernel.
We will add only when the drivers are upstreamed to
mainline kernel.

Kishon Vijay Abraham I (1):
  configs: arm64: k3-j721e-linux: Add GIC ITS Mem region

Nikhil Devshatwar (4):
  arm64: dts: k3-j721e-evm: Add pinmux for main_uart1
  configs: arm64: k3-j721e-linux: Add USB mem_regions
  configs: k3-j721e-evm-linux-demo: Remove unsupported device
    partitioning
  configs: arm64: k3-j721e-evm: Fix failure with PCIe

 configs/arm64/dts/inmate-k3-j721e-evm.dts | 12 ++++
 configs/arm64/k3-j721e-evm-linux-demo.c   | 79 +++++------------------
 configs/arm64/k3-j721e-evm.c              | 32 +++++++--
 3 files changed, 53 insertions(+), 70 deletions(-)

-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200527122358.14723-1-nikhil.nd%40ti.com.
