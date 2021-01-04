Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBJODZP7QKGQESI25C3I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id E03202E92A7
	for <lists+jailhouse-dev@lfdr.de>; Mon,  4 Jan 2021 10:36:37 +0100 (CET)
Received: by mail-wr1-x43f.google.com with SMTP id n11sf12912408wro.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 04 Jan 2021 01:36:37 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1609752997; cv=pass;
        d=google.com; s=arc-20160816;
        b=O9w7w1J/F+4Y168jyGBb7TmWqP9f1pSVZykECnGSPyUg1fKf46YdgJB3hKOQfbFNu+
         b2RDRaNiT2C5RfLuSBBqRwkdiZ6tpYfnTMsIUhsxAzdwq19KIGvAh62Y5X+nnNiLt6Kp
         +9T7UUketXkpvRj8iVTm6oZtHCRxX18ejaaKEVj1Nc89iKlGDDH8dh5Y8qjDjuQVcqNP
         xCZYpclwhOGXc52xn1ogMCQrYDOZ1TtHpetrHM7KqTfG+4QzJtpsw2PFSwISkKzenrd9
         R3bwQIx6xfT/DRp1mT1EKq+hXHWJIuQjDjBxFETgHFI3JRvDuBZrUezEFJ6iZzvL4n7P
         nHCA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=NOEqubgokfUHdexsVVzaspht4zSkFJxT0xEQsfhZTiA=;
        b=hm2Suqixe3E8MeCgJq5BFM9Ex1j8Esgud21fZasV7+pReizm0ZkgphI4VKz5Za+Bzk
         DQLIVYkmr6zTfIx5P0scRgMm6C5GFrHH2qMXTNlw5fz5ZW/T3nRKSKEmJdaP+KdPnLGM
         UuN++SoZHE5/gA1Mk0+W2XgdFiGxciH5/ZH8dFJ1Ote4/Oq/8q5Bk7uTa8YmnFwj0Jbg
         MtZsRHmnQr/zGX1F5GjhMlF6euXpayY2KXrrMQq7g/OMmUqIN1sq1zvIYT0JN6uP9vBK
         qeEBdWczadMBhIan5IDMj9Bd5UhKFfUyHsQ3gZ3mcOX0S5yvEIZKCmCJjOoPIHand17F
         vtqw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=RDDjLNGl;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=NOEqubgokfUHdexsVVzaspht4zSkFJxT0xEQsfhZTiA=;
        b=D+u1tx7c3rUEbRiVu5NRiv2fZPD7XfS23ornb5NVuoDPENJDJy0r0uaFlu4JxJVqlQ
         aRQsgXFO43ODb6LbwDs/EMJNkIwNmBlp/BISv2y4rDTI7YY6zDX/iF3dFnReUfIGx9as
         PFd8eEp7c2cQbIY5wYq6Iv4ravNKF8Fm8GPdkLJsivWycMYl+3z74eMSUV2pi62LFucW
         Y9yWkBeIv8TzznUEqipgIjoTPqMGhbKuFpCTVeNlWeEsMweNOFKmzQqjN6h0er+oI629
         Z5K+YUK9/3MBKjwEik9MWNcoPvsbkQxIMBPGunkWATlZgoSpTaw+bJ/eBzeOA64QokoT
         Q3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=NOEqubgokfUHdexsVVzaspht4zSkFJxT0xEQsfhZTiA=;
        b=Nrpy3N8nNzq4Dq+Ch+JxAjMHDkfKXarkq0iVDkovukNQUb0MwKDtF3y1vG2gQjsI1a
         Djn0eHyNIHGg3mTtzxmtGMKzCvOabkpEAkUh2KQm6XCvJhKvyV6sOcIIycocYLr+2wYb
         GF1AKnWuZOQVd0OmevyCF3UTpVhBLBrI1hDHCSdJTZLh0Q3pwGS2CJvZTI1lS1aJhNUs
         LsxZHU26ZzvvNlgsEvITOEnIj2uRBRdnsi8kC1tk57LeVn+qf7tOigvqtFU7E4NWBjjV
         DxzzwE3p0hJjq6C6xeKMaY7/177aSSRnoKDTHqgHUsoK94W9bmdF/9NTO8ZpWXRS9rBN
         U9iA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532Uz4qEF+m1bpdk7AT1wysxq4xgAyGaBZc/bx3ScXS74FHdKV3u
	PNUp2byUCSQnPI71A+t+oXY=
X-Google-Smtp-Source: ABdhPJwAjsDeVEpBbVw2i1EQujeO93mAU6YynzIi65euwhjNtPYgvXZozX5l8vJW/AkSUu1xL+vjwQ==
X-Received: by 2002:a1c:790f:: with SMTP id l15mr26358451wme.188.1609752997685;
        Mon, 04 Jan 2021 01:36:37 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:b688:: with SMTP id g130ls8331650wmf.3.canary-gmail;
 Mon, 04 Jan 2021 01:36:36 -0800 (PST)
X-Received: by 2002:a1c:4843:: with SMTP id v64mr26061096wma.186.1609752996642;
        Mon, 04 Jan 2021 01:36:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609752996; cv=none;
        d=google.com; s=arc-20160816;
        b=gGxtUwFH5GgI1jjiWViJ03ja1ztuP2phb9uQ+WV2ZmGsjlmESt8geeNLz+9VKFNkW8
         K0GpqmG/Knx6cNQF3JEQuUNCXQxx55B+jVeK232pKi1gvtgIrirLc/Qq1UAmFOVZF6wf
         Jr6UlIekhkqorAxhTA3mOElkwvderjc2cMAs2zrsixrGHUpXPBphK4ccabOblHXZA0hD
         mPUFEeHB49tyKjVidRDin9RwJ99DnujH0L02Nx0VcZRkiCL6s84Zy7vR4Tk/o/Quo1CR
         Ufy5ayBD0v/J+keLI1ECkYWSb4gPNNU9cFSfYtOFSBly6w4BSKmV3XMPyd0vNmAqfwpd
         T64A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=+VKYyz9cV28zXgsoBhfhnIM6s8iIHse2rOKxkcViUUA=;
        b=pcg+j9VEz7fHT4W7CAeX5H2M5rTKunLdTdCDyQLh2rKYaZ5y2aL22u98O45I57TBpP
         v2zdIEzqChUlM3PJtsi48jFve4fNzgVm/9zDD5hcxvl61wTTSyDeUjSkTgE1+T1mJFfw
         a5IRcd6beOHmQcrkCZfU6ioiFUWjERnPfgYFlGxovKqMbEEV3UjQiTmkK/m5Uq4eMv2U
         5KdvZewOoolgCy+thWWMIy40K3Hdkge490SpOqoTu3E3c38IRYH4OADa1TINDeabVAd8
         NIVI7BpMx8xRfLjqq7/Lsg7Q3fMM11saKLMv4xuLjPFPJnwIs7uUc43P5WMcXE0gXKjv
         KzCw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=RDDjLNGl;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id n8si1942865wrr.0.2021.01.04.01.36.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 01:36:36 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([88.215.87.53]) by smtp.web.de
 (mrweb102 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0MAvGa-1kod2u0fQq-009wtR; Mon, 04 Jan 2021 10:36:36 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Lokesh Vutla <lokeshvutla@ti.com>,
	Nikhil Devshatwar <nikhil.nd@ti.com>,
	Peng Fan <peng.fan@nxp.com>,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH 0/8] Various ARM-related fixes, 32-bit QEMU target
Date: Mon,  4 Jan 2021 10:36:14 +0100
Message-Id: <cover.1609752982.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:0mSdCxOyi8YNTfOchMWsnai3EAW8R5jSgTythOIZ4z2W8KwebPo
 fGypZAysfayDXEah8coPI/2TVpY89+DfbtTrBnff5FOi9YYE121v0QwfGI95mVRe/8CeofK
 jWjV55wclw3LDWL7m6WPtreZceojD1Zv6VCnj8miBy1wGcpt8O3r/uwreoy4OEAj5QM/fAf
 K8Q5154snBGuG7UsXNs1Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:782MtVXX0qQ=:wygdjYsYqxobf42LuAlWBv
 x7Te6rE93weuamde4CWhDqpi1EMfw0w99LeH3Eiv13CFLEasUm9WllqiA+x63jrJt9aPDJfMQ
 XhTJ/vNOJZGMiq9SkSiV6qYVbiLDaJK0jnbBEzeSryaROdUqaxJtQTc1iKj9aaJq1phwbi2nB
 N+4YvLKq+Ma66Z6rbRAnJ1yH+75wAFIRNxh6hl/WW6oWv8Ab/VgrADPmx6XXOQLPE559IIjxr
 jUR88czP3Jjhqzrmwip2EP1+FPiD0Ie/34zYFYRvMsb4IAG59VUFSY8SpRaLBRBR8fx1A7ZsJ
 EJKcsQ2QGs6pJXBvlNqJXgySxqOdvkOB6pHmTQUcXIEd6Tm6wvQ8/1q1ROR129YvsjwAsrW+W
 gJsgKRvbylEIpYsodZZGscATe36UQSmGsyoSTW29LEyJyag/IiJoolwO6tmfAnAFRfNYF0a6F
 3T0SEsCWLE9SRvofjNTmkQqlcCzBnaS5pdnAJRByHU06/ldQrwJnn7kOTj5wEdKgOPQ+ipTtf
 jC3xkbojCwRk0hccNo3p5lcQNWGjpshk6rAFqa6KWQZi8crcWMX6r6tkq8p9W+7X5+mdJigOw
 88iwTNbbBOxcob5gfMMahGg5srk0wqTHlnSG71H+yWnv4NQQJi6OCadEW329bEQTUVV1hpyJx
 LhfomPnbjbFXYCUbNSCNDtyOTFl0TUFoK9XTL6L7BUfthMIU3krUh6sVb5BTa9ceZ5uNcXGfL
 ukKp1yMo0BBqQoBr/2NXNY1M32ItE7oC8ZOdAzHLWHMEgaHLWbjnUYizv1OPiS7R+dJ/Y9dKD
 z07CSMjz81QyUwfIZmiGDiPcJ+Bhn2UnAU2JfL+oMnXfSMRbPC/jceYE7XiCqy22b3dNDTAoY
 thPdTICOi6kQjDplL4OQ==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=RDDjLNGl;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=web.de
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

The first half fixes a number of 32-bit ARM build and runtime issues.
The second half adds SMCCC_ARCH_WORKAROUND_2 pass-through support and
fixes related feature reporting under Jailhouse. Between them is the
addition of a QEMU target for 32-bit ARM.

Please review carefully.

Jan


CC: Jan Kiszka <jan.kiszka@siemens.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>
CC: Nikhil Devshatwar <nikhil.nd@ti.com>
CC: Peng Fan <peng.fan@nxp.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Jan Kiszka (8):
  arm: Enforce soft-float ABI
  arm: entry: Drop broken attempt to restore CPSR
  arm: Fix access to SPSR from EL2
  inmates: arm: Enforce soft-float ABI
  configs: arm: Add QEMU target
  arm-common: Account for SMCCC versions > 1.1
  arm-common: Add handling of SMCCC_ARCH_WORKAROUND_2 requests
  arm-common: Forward all SMCCC_ARCH_WORKAROUND_* feature queries

 configs/arm/dts/inmate-qemu-arm.dts           | 105 ++++++++++++
 configs/arm/qemu-arm-inmate-demo.c            | 132 +++++++++++++++
 configs/arm/qemu-arm-linux-demo.c             | 152 +++++++++++++++++
 configs/arm/qemu-arm.c                        | 154 ++++++++++++++++++
 .../arch/arm-common/include/asm/percpu.h      |   3 +-
 hypervisor/arch/arm-common/smccc.c            |  17 +-
 hypervisor/arch/arm/Makefile                  |   4 +-
 hypervisor/arch/arm/control.c                 |   2 +-
 hypervisor/arch/arm/entry.S                   |   2 -
 hypervisor/arch/arm/mmio.c                    |   4 +-
 hypervisor/arch/arm/setup.c                   |   2 +-
 hypervisor/arch/arm/traps.c                   |  10 +-
 inmates/Makefile                              |   4 +-
 13 files changed, 570 insertions(+), 21 deletions(-)
 create mode 100644 configs/arm/dts/inmate-qemu-arm.dts
 create mode 100644 configs/arm/qemu-arm-inmate-demo.c
 create mode 100644 configs/arm/qemu-arm-linux-demo.c
 create mode 100644 configs/arm/qemu-arm.c

--
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1609752982.git.jan.kiszka%40web.de.
