Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB7XIZT7QKGQEGSSHSTI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AC52E988E
	for <lists+jailhouse-dev@lfdr.de>; Mon,  4 Jan 2021 16:30:07 +0100 (CET)
Received: by mail-lf1-x13b.google.com with SMTP id q13sf17210356lfd.16
        for <lists+jailhouse-dev@lfdr.de>; Mon, 04 Jan 2021 07:30:07 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1609774207; cv=pass;
        d=google.com; s=arc-20160816;
        b=RkON6QTufQ77TBU/o4/Um66taKAYn+eU81ChYYgktKMd1IarbYsDy2MR6ND/Rwle7M
         573LR+iDAiBoiHJzbxVEWuv22u1bg1dJE19xvXLU9G6t2AZUZ0oE4DJggY2y3Mt5Mda7
         5f9OIyzqDSrW8fuFg7oJOqbf/s/y9pKFa8K33bwgyICQBLBgsoCIMvIoGgedbtJuDL8f
         cc8tON+4NMO13yqU+py+DWL1c3E2s9Qf8lqDII3Re3YnTTR+YAVqfIi0D77LYEjMY2jb
         hv70i25mihzKCvArNZiJ9Bp4xCx1yJX6wZgJQMpoo5/GYtJVw5uMbHqizx1a5N0sf92M
         hb2w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=rcwCNKpMHhTdFc8GrlBJKNJYETDOmxwVvrr9toOVl+k=;
        b=qLCF2k3uk8/cJsGWr9d4x4RKJUEVQ9lC/Dmr6j3opvNsLre9NBSFM2K0TK6BRAHpKW
         TSzMZl/sVF851PnWv+frckA0nn75vLw0OziWtoaqasfG4tLHTXNrFHnqsh69dPNvedXw
         FLInBMSjdvLpRwkfUbez9rrbjlpDIMAasbAmtgmiHX7IbFibElIu6OFTAYxQlyi/J+ZI
         cDT3/RE8wdKUvWwpLzmYhdLjfhc57HJWlyVurRJXzrMcdS7F5/aq53rNm2ZTE+WGzUYK
         pGyMFkmEb/RiHkPhCHIV6XbJw8pYLR/0Mn1pUo2JvBwmIGg6eie9K7DCmAuccdvHYz1y
         rWMA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="RMxqhd/N";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rcwCNKpMHhTdFc8GrlBJKNJYETDOmxwVvrr9toOVl+k=;
        b=NEt7bOaF8K4osHL0brnlXwJUbey/BHgyLbbqxFC/C348Np66YH/JCbgjTvXmRWvPHS
         Anu8RV4MV9pue4Px07O3xQqyOuibE4RXMJuPCG/2qpfLahjZwvwsEKM1+iChBNQPE7hp
         0V1Ub+8LjrSh+4/1z74R4hMMj4f8cux8IG2ORRvkDXZSmcTupwc+xO1KprERbZA3X27h
         mPzarP0/Ne6b3wXScILCtMroUNkv6BN7A59DZco7EKBxSDYMXu5VgV9xJxx5UFdyAKFz
         r0wBqy5ngkmr/SFrfHePLAcChqeZ+P1XkCgOGbTOvQap/T6unlF8/DCl4S/eUrLB2N8v
         tbjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=rcwCNKpMHhTdFc8GrlBJKNJYETDOmxwVvrr9toOVl+k=;
        b=Ua9haFoKerofv5gSvKnBOg1GHcy+WThCJPgQEL18sVMXfnNVrfq7uBQ2+s1PSCs0Qi
         gYCohjENpjcV72ZTKFBvimIdoTQwJegjcBMJHvV0WjXoXtf1FGX68M4ZXV3kcFNLGYb4
         gylkM7HpbKhsGmdbLAIj90LHrTae0firG0wIjXsX+nWjYkbhwxWXlq5/KtvEKkWgHYKs
         Zp5k+GENlUVC6nl8YyfcLw2nhYQ5CP/7jSq6PftNu9MpZnJjyis5UnQsYukTNd4c/Ijs
         3GvXdtu0MJvt/jOmLa40vsXj6pPKQuzZOzAVAHn6ae5P+WU5RNsUjyO3eGYjgQEmLVfW
         IRBQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531rcS3l2CYhTiNxnO/aHWaKbkMoCrZRecrLTsPmi30c6ilQ/h6C
	zpSWra5q6zWYCS+lMn6ZDFY=
X-Google-Smtp-Source: ABdhPJw4YAntycpU8mFXRlaG6pzcXOT/51FvRnM2b7PD+uvin9hEB9wBlM47lACdAfA5ri1+bk0+rg==
X-Received: by 2002:a05:6512:330d:: with SMTP id k13mr30608897lfe.173.1609774206968;
        Mon, 04 Jan 2021 07:30:06 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:1a5:: with SMTP id c5ls13655763ljn.10.gmail; Mon,
 04 Jan 2021 07:30:05 -0800 (PST)
X-Received: by 2002:a05:651c:104c:: with SMTP id x12mr37401746ljm.266.1609774205444;
        Mon, 04 Jan 2021 07:30:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609774205; cv=none;
        d=google.com; s=arc-20160816;
        b=sJVkz5C2tZvrwp2UoE7CftG+5lwdNcaFRNTOAtpa9lSwYA0xbSMUv6diG23H6sgC3+
         KhJ78BZwvUfRLi7LpMkbnTE743JJ0iFF72nMKDQAbpYnF3SVc9T5SvutWuH6+EuM+NdU
         zNLA0NAGF/H01NAq8PNl1hrHktZsM1HxdbK7kTM+l9B2KKDsT1Vq/QnYgfeDUfvZ7HUf
         wv2v9dRRi68GGV12O26uWP0RImyhAsYPqG3c9VsV34Cj3AQSyVdXo9ZIClT58f3P2ts1
         uR1/qGBal14xGQ0PArS0am60fvynCwjDyWYGrduZtt9cTM0apOncv/R8aRTgmTFD3/xr
         IkVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=i62I+y0S9+oPS0d6l+qn7LS/TX19YYoO4gADX+7NaeM=;
        b=sDVZt21fjjbL/50qAVefXu4fpV8QblKy7HzTaRrR9vhu/zhaiG978IkBJ/kxQTuVZd
         BSeHVH/Hw8FZxycBldLwo3cvdS4rHDIqWDjSfCUv7K500afChsuqRjDuFUNdx//suBf6
         +uLogE0nEjsf1BH2Mru7j6QKINobEhAz7I6zw0Yldr4DUFl8/vl7uubrafxmw/6jiaVf
         ieJukdfFmXqjqZnzdC5LQ6hJOmbc9Rflpht6tW+kIbqL2EWzj3GlRIhANUfm6QmrdcU6
         SX6R3ws07jHhgBVUoaUgmL4s2g6WYAmJ3VapOCSneoIx3vHdH2iulJNnWUDJIPgMGwa9
         yT+w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="RMxqhd/N";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id a136si696810lfd.5.2021.01.04.07.30.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 07:30:05 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([88.215.87.53]) by smtp.web.de
 (mrweb105 [213.165.67.124]) with ESMTPSA (Nemesis) id
 1MiuOk-1kK4BE1eSq-00empE; Mon, 04 Jan 2021 16:30:04 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Lokesh Vutla <lokeshvutla@ti.com>,
	Nikhil Devshatwar <nikhil.nd@ti.com>,
	Peng Fan <peng.fan@nxp.com>,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v2 0/9] Various ARM-related fixes, 32-bit QEMU target
Date: Mon,  4 Jan 2021 16:29:50 +0100
Message-Id: <cover.1609774198.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:rGSglx4dg0e1fXOMQzOwEZQcjcP8INdSj24OaxK+b/yQNlxmWB/
 LKAs32Gqpk/Ay+xZnowKxGDgvyobLIg++l7hE+SGz0VUAdFjdbnMDiV+liSA5iL+JMkLpds
 3iCTHfAF1qJfdq8C3h45MtjcxHsnunY5HU5HuzR9tiARqTK3oladWkUhFRTkD6QWxlcprYz
 +mI+HXyxohtg8B0h7vYZA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ChqbkDer99Q=:AxGzCYw3nIpGkfOyzfIu6O
 rfjS8SngOF9s1+7iLGxBZHeRC/HTfA5Gn7qNbaoemr0OAAFuSvfSrO99MoOPcmn8p9WKDIS/y
 OqZUvzcJm2MQHMEGr67W+xd9MhzdLzJNHI1gi9SmbZGVT4OSKouonhfMvRvZuSSseNEsI4yqd
 0UGMeflnDsNX+FUIISqlsZJE+FjkIcnCovqD2kVmA5JTPTLEvsrN9SZsmSIwwnoPXgBLjgP+y
 5PW5rNMJglSA8fds76ApdBJauh5UYqVKUM5b7652Qyr1ItALbazy6bnAzWScdwejab0GhYRHM
 bgXxgVWuPVOKfYi7hFFuadz383aaF64Ab3exwwJ5FPX1NRZoZHvGzktOvCy8sffHtwucTh0aR
 MiGWhuHMlwDAw00G42XZJF5QrEueeNSF6Zw1EY04RAhsyp+CCwKnqLiPU4hibfsxURp95Tldi
 ENvSavIfr1k9bOHlNbEn7XBc9Lej1HkEIxcWso+f+7TBdAR8Ea3EXjqiHWUVBO2Atn/40e6zl
 QRaSMGR0PQqDc08+b97b+QNXqMwztTZUkN/eqPKU0wF4TT7mXJ7qCIij8oLYp9voWDHtbDzyS
 P7L0OXHc2MHeiPVP+ZMy22sRsSC7Wdgu9eUApg617PaGGD+tiLS8BJsZ2BcLAb4KREqEGbIDB
 ZjqV4i+SZx+Cz/LC/dG53fvM2Ydn4UXM639tg5IWtMK+OK3jDP1nXZRkOXuDsuH/C6DsbuLvt
 HUi33NlmNMD0YhZIMBrmDvaeo+EGnC7Oc8YxHFS/FBw+Uva/HMxTKnFx/W01JJfwRekhrTXAm
 MEJpGRf6fO8X4ONsPG2zB2aXOb1BlWX3BPwuzcxxOLxPXEs878+JLMkd1KdtU7Ht1hKxGr9NT
 Q6/PPtsawQ5Til2z/RQA==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b="RMxqhd/N";       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
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

Changes in v2:
 - fixed patch 8: we could crash on platforms that do not support SMCCC
   when blindly forwarding the feature check
 - added fix for ivshmem-demo

Please review carefully.

Jan


CC: Jan Kiszka <jan.kiszka@siemens.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>
CC: Nikhil Devshatwar <nikhil.nd@ti.com>
CC: Peng Fan <peng.fan@nxp.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Jan Kiszka (9):
  arm: Enforce soft-float ABI
  arm: entry: Drop broken attempt to restore CPSR
  arm: Fix access to SPSR from EL2
  inmates: arm: Enforce soft-float ABI
  configs: arm: Add QEMU target
  arm-common: Account for SMCCC versions > 1.1
  arm-common: Add handling of SMCCC_ARCH_WORKAROUND_2 requests
  arm-common: Return original SMCCC_ARCH_WORKAROUND_* feature queries
    codes
  tools: ivshmem-demo: Account for basename modifying the input string

 configs/arm/dts/inmate-qemu-arm.dts           | 105 ++++++++++++
 configs/arm/qemu-arm-inmate-demo.c            | 132 +++++++++++++++
 configs/arm/qemu-arm-linux-demo.c             | 152 +++++++++++++++++
 configs/arm/qemu-arm.c                        | 154 ++++++++++++++++++
 .../arch/arm-common/include/asm/percpu.h      |   3 +-
 hypervisor/arch/arm-common/smccc.c            |  24 ++-
 hypervisor/arch/arm/Makefile                  |   4 +-
 hypervisor/arch/arm/control.c                 |   2 +-
 hypervisor/arch/arm/entry.S                   |   2 -
 hypervisor/arch/arm/mmio.c                    |   4 +-
 hypervisor/arch/arm/setup.c                   |   2 +-
 hypervisor/arch/arm/traps.c                   |  10 +-
 hypervisor/arch/arm64/setup.c                 |   2 +-
 inmates/Makefile                              |   4 +-
 tools/demos/ivshmem-demo.c                    |  20 ++-
 15 files changed, 588 insertions(+), 32 deletions(-)
 create mode 100644 configs/arm/dts/inmate-qemu-arm.dts
 create mode 100644 configs/arm/qemu-arm-inmate-demo.c
 create mode 100644 configs/arm/qemu-arm-linux-demo.c
 create mode 100644 configs/arm/qemu-arm.c

--
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1609774198.git.jan.kiszka%40web.de.
