Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBOWLT7ZAKGQETJ2ARAA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD1A15FE71
	for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 13:36:11 +0100 (CET)
Received: by mail-lj1-x23d.google.com with SMTP id z2sf4317848ljh.16
        for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 04:36:11 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581770171; cv=pass;
        d=google.com; s=arc-20160816;
        b=j4ZwIUPWmHcQvW28TJO+gzpJWC+RZWVeowJ4TSKyM4Z4AXGaFdm1ZVD0KGvUbC55LH
         wc2MzqA9PONZzHS+dqh70qlX9I3TnJ9UbS6Z5rBWTzHJ2YWCDuoxIujNm5FvDZT6to6/
         aBXRqKv1K6YsJ+JXBqk/IAjTeAban9VNzh3wGCU9gSgrKSSinzvSdCKBRN11so7dk1TV
         BKDXmvH3q1pBzHtV1vXU2UkoBbW18yNvIxwrgeipuGMp887VTfBAKfs7Cw++rLKalWYo
         Op9Mc1YZSECfMkU8B3pdxl7dmU1XL6tj5pYTFcd/6IHFCU7iNyHAK9PBljumlYMuyN1F
         +bhA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:date:subject:cc:to:from
         :mime-version:sender:dkim-signature;
        bh=GlWsJVTTyCqCTL1pR0SHPCI6osQzfqjH3KqWKrLTwak=;
        b=m+4nGzo2xHyJMqcjmgwJJS1XpALGUjjZTNmM52IQ1mioss9eTXMcYwmmKRtsH315aH
         UngFglkrqoM/AbmOxEEmAo+hjCVXm7tnTjY+RLMVjPH5Jcc4Pb3CZ+oz+oTVEF8ztopt
         8IC43prURzQ6366WpyAZNmUYDTLiCLrumJOOZ8qyiWHFFJY+XlLh0wYUrpOxe9k+m/Dc
         3d6RF8vUxBJLoUMTU5w7u91GLLlbwqTkKvsKF+PhB7FTX6EMI3hgOJSiqm19QiDAd4Z9
         9gSH0f96VKK4zpzcdCYnAovSPPEPwMfuUYD8Lwyg8ekASmCIyMpaC6O15wuK3LrSMS0I
         r3UQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=mcxIukqi;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GlWsJVTTyCqCTL1pR0SHPCI6osQzfqjH3KqWKrLTwak=;
        b=FN9soUIm7vUYKNS6qQh0i5HplYwzQTrnFShrmpceupzGaYThESBEg2P0DtZjRseLxZ
         TJu/KdO8xtpMPuAOFd9pDZUJzb9+IzQ5LWg0//yFYGFA/JvUe+rla5waTiR0MiKKlszr
         UEUqcbZGrbwaQycWIXjy8YST1+6owY6J0YA3ibSD/Cd5bVytMPd/94kOsWeuHAv2Ah8e
         pDOV3MXaXL5BDK25wOS7IClktWVIEGIQSHljW5Ji79pbCXjDFBqSzeD4Ba5H98Jnh+Mm
         xrqg75aavQFAWclNA2KOwCkaujrqZEjbwqgdUJIQGVmnBbMGvxEAI/md8ymj6nrwDbHk
         Rxww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=GlWsJVTTyCqCTL1pR0SHPCI6osQzfqjH3KqWKrLTwak=;
        b=Xi4OclnSPvIhf0rRwA6xTdFRV5hE7ZYrgPZbkLwpgPKU5gERBvQ/t+SeqcDzql7t9f
         l05whnIb2R8p8N5oqR5xEGrDaQUnE+aathDRFedGyXvLmJ2WHBRTlxC47oy+aFASzaH4
         tvK9OGcEU7NGfo5Tg6E8oHc/Zulue6aCvq6Y2fgxc+Vrp4tK2e/eDrvpVl8p8HY+fJND
         kJ45ippkmvAKR5hO63kUJXEY7+Tgb2XMIs1nNlHVXosMBgD7txaD3CrpsaRkIAjfpo1d
         KXyenmuOe3bzqZUuCFxG/W1JdEWDG4pOBq9Md6xmtovb2oU8zA6VKNADLbmH3bsEUdEP
         5MiA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWPD+1oa40EM2KKVGJiR7Wx84T9PRJ36qyh6KnNpMjpq6AhDwH8
	U0P9P4eXFiEkpJIqB4Rzuxc=
X-Google-Smtp-Source: APXvYqyew2gKOpXw4LZlGi22WHRiGPSu/mirmEDITx1iUiwdBRqaPiJzoq8N+DXQCRuTNdQwIGWc+g==
X-Received: by 2002:a2e:3e10:: with SMTP id l16mr4792446lja.286.1581770171104;
        Sat, 15 Feb 2020 04:36:11 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8544:: with SMTP id u4ls956826ljj.6.gmail; Sat, 15 Feb
 2020 04:36:10 -0800 (PST)
X-Received: by 2002:a2e:888b:: with SMTP id k11mr4944543lji.197.1581770170033;
        Sat, 15 Feb 2020 04:36:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581770170; cv=none;
        d=google.com; s=arc-20160816;
        b=JSTCpzRlQlwhE/2FvFOAIOmFoEz3E2WgBv2OB77FQWiflP8rx8mKljHDvFPi1dFnPL
         0u/bfLSnumcxzqs9Jlbf/mvB2/Lcmkza+Aj7Uc+ro6wvDlr6Rz6GoJpmtw0y75NvHF/w
         XyQOAInrJe5fnFnGzjIagGskRFvvBegdjB2/+FU5HI9apOJmrWMulbTNWqi4Ww2Sd3TG
         KzJjAOMD97gP+Xd7qsiMtprsAFkNcLRs0GoghA7hI7sKN1JviLjlGLURXF3mjCmVR47v
         YIB+1w6JP0nrs0iJC8f9+UjNIg2oatAIx3Ztxan+FL4xY4a0VgHX+nluCzVrtF+8LE1G
         05XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=7GJvH2brRDXOP6lKvUekxECDmbKNWk36PePbGkDiI8Y=;
        b=Ppvit23qifTEC7y91a1NgtNUPyvdzwGpzqeOFx/memLs+Ky4DlHqkxD/JeppjHKNmK
         Oo3fkL5+lPKTIojBQbZY6MgOQAYjXr6hfeqr5w9wTB4H1qXENiDWW/iWf9sSHEg/T003
         Wr2o4DnHWve/kHm/TIQuH1CAB5OkxQpk4ZgmBewSW8HmtTHVosGv6jb4Y9Hp2/zdyrHu
         BbugZOjZsb+1LJt1syNqKmiZS0mYQy5fYs/KeUumokxQXfas4SgI784G4OaT7rgjJPHc
         0VY6R5LsL+a4FaOa7yhTZDnxaPNSs962iyP7JhOQo47jx0YAVHzxcA4Y/ng/igBUaUwA
         6fvA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=mcxIukqi;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id b10si428236lfi.1.2020.02.15.04.36.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2020 04:36:10 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([95.157.55.156]) by smtp.web.de
 (mrweb002 [213.165.67.108]) with ESMTPSA (Nemesis) id
 0Lr2Dz-1jfb900pz1-00ef3r; Sat, 15 Feb 2020 13:36:09 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH 00/12] Assorted cleanups, LF-CR reordering
Date: Sat, 15 Feb 2020 13:35:52 +0100
Message-Id: <cover.1581770164.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
X-Provags-ID: V03:K1:PwtxBU9zvKdxjm8gz/c3lGqD30QLd/nkwmN1XIm+iWZwaKe9MwZ
 IkhuXeaJPAsgX5CRx+smDuRavd44zSirHBZwi8AE31t89g3xzDQxT9sj0GxOZgxfV0Jf4zi
 DA++a5tiogcsLJORA05hlpa1Fle1diW9v/4SeYyH+IlC+0NG3ZR48QDgPNp0GPlCmliVtuE
 9J0/yhTJ/WCiTZZ5Kdldw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:P4mmIoUk5/s=:tfeLWTOdwk7v9jg/zoopq6
 a1yBBulSvC6lv6jZP7teKFBV3tlJckqSB37HwPiz9RjnzKqvZvccXx+di4hLuIqSNhZzOrlng
 9Te09BFdGML97ug+H1gZyqHWQ0AA+8VnFun5MGvLLJCZpXXJtMeakwiQBAr+zQ8DmMjozMmlF
 jIlWituEA9pAOUcVAMqjMfLsNFnyLiCk7rTNIRTGnp905f/NrSqCfbwfy4bbaxKdjTPLXeWFe
 sU5lNu4p+iJHgzPxpWsUiL1vBkkKWJUejJowYL96km56lPhBOqKs1sb8dL/zv1yFTdcNV2G8q
 ZNcsocbNbpVACp6jq9gYjFs2NPBAkK6B9C75aHb4ySIsWAJ6j/jncXYNxa5XXo1TSByrKXaB8
 Fxjrd0OKfnwMaK85DIJhHQ2ZidcxMZ6ZiMn4lgxmS2oXfAqnbG/VdQbywzex7eGvg/DDA7i9a
 eo2DsxwrK2vat+gVNwy3SFCe1YRaVnQnDFVUc4AyMUpu3ILJLAkqAgGZNsZ55MNUu+tC5hP6c
 JED3h173pvlNCWAsc5iXAVhaxokZZHRnHAPWMrTNggZb9Re02BrK4BT9Nq2d8fPQI0YahY7dK
 Od3vsOYz1Llj6t2JB0U9chNwwSfICCCmM+lIVN6jenJENdmDFLQHwnTr3IgAT7uc3lvZ7XX9y
 dGTNyyNZ24rkS8mFco1zmhgpwqSffZ4X3zkgj519xkqVlJJrslrfn+VIsqUnzmdlMiw4WdhMm
 BBSZLaD9P4VAgGHJs/JEJFSukYX1Z025PGHbaUqDeh5LUTVZAa0nkKX26UJBR+mtRBlmMzV7G
 YkSs66+eE6tA1rAFuzFGCN+8byG42Q/T1/FfkqZAmGIdu57dyTaOkfbEZp+qCDbDK3r+ia0OZ
 mY1uo288GcgavMLbs61xKZaWSTFWwehRO25AUMOxrbqjxOb7LAxjRRg8sNNmvgubgDo5anEQk
 qMLGKteMATkFe+O9/XlSB/ljwINPzGI92Yy+L0SopGUpcJIFdf7M/V5+GbqXCTmFrxAxIfzsB
 +cgJ8KIPV662ZdhHTtJaG4OXsyMTivuCuR604Ydiuok//s+ao1WxfV5DtbPVr1wQ9hwKQ8yQ/
 cuZytzDvmfcIG6yAX9V2If9pximZq5AH0FVrxyxq/1bjhQ+S9zfly260VXGwuB8hskZQrHBbr
 OklQomSQNHX+myhQ0wWyzFgYoM8yfXOWd3zxHQ69r18flZcBTNzeDdjCZDXCbNRXUANcsUNPI
 tmYGxn4kkIRvJTO2G
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=mcxIukqi;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

By-catch of ongoing work on a new CPU configuration format and the
RISC-V port. In addition, this reorders the output of linefeed and
carriage return on the debug console of hypervisor and inmates.

See patches for more details.

Jan


CC: Jan Kiszka <jan.kiszka@siemens.com>

Jan Kiszka (12):
  driver: Leave a comment while on_each_cpu(wait=true) does not work
  driver: Remove unneeded masking of cpus_assigned
  core: Share identical PAGE defines via jailhouse/paging.h
  core: Remove DEFINE_SPINLOCK abstraction
  x86: Remove no longer needed include from asm/cell.h
  x86: Remove ifndef from BITS_PER_LONG definition
  x86: Simplify iommu_select_fault_reporting_cpu by using first_cpu
  x86: Stop exporting apic_to_cpu_id array
  ci: Renovate hypervisor config
  Documentation: Remove obsolete description of CONFIG_BARE_METAL
  core: Reorder CR and LF on debug console
  inmate: Reorder CR and LF on debug console

 Documentation/Doxyfile                       |  1 -
 Documentation/hypervisor-configuration.md    | 10 ---------
 ci/build-all-configs.sh                      |  2 +-
 ci/jailhouse-config-amd-seattle.h            |  2 --
 ci/jailhouse-config-banana-pi.h              |  1 -
 ci/jailhouse-config-x86.h                    |  1 -
 ci/jailhouse-config.h                        |  3 +++
 driver/cell.c                                |  3 ---
 driver/main.c                                |  6 ++++++
 hypervisor/arch/arm-common/irqchip.c         |  2 +-
 hypervisor/arch/arm/include/asm/paging.h     |  3 ---
 hypervisor/arch/arm/include/asm/spinlock.h   |  1 -
 hypervisor/arch/arm/mmu_hyp.c                |  2 +-
 hypervisor/arch/arm64/entry.S                |  2 +-
 hypervisor/arch/arm64/include/asm/paging.h   |  3 ---
 hypervisor/arch/arm64/include/asm/spinlock.h |  1 -
 hypervisor/arch/x86/apic.c                   |  2 +-
 hypervisor/arch/x86/include/asm/apic.h       |  1 -
 hypervisor/arch/x86/include/asm/cell.h       |  2 --
 hypervisor/arch/x86/include/asm/paging.h     |  3 ---
 hypervisor/arch/x86/include/asm/spinlock.h   |  2 --
 hypervisor/arch/x86/include/asm/types.h      |  2 --
 hypervisor/arch/x86/include/asm/vmx.h        |  2 +-
 hypervisor/arch/x86/iommu.c                  | 26 ++++++++++-------------
 hypervisor/arch/x86/pci.c                    |  2 +-
 hypervisor/arch/x86/vtd.c                    |  2 +-
 hypervisor/control.c                         |  2 +-
 hypervisor/hypervisor.lds.S                  |  2 +-
 hypervisor/include/jailhouse/paging.h        | 17 +++++++++++++--
 hypervisor/printk.c                          |  2 +-
 hypervisor/setup.c                           |  2 +-
 hypervisor/uart.c                            | 27 +++++++++++++++---------
 inmates/lib/printk.c                         | 31 ++++++++++++++++------------
 33 files changed, 82 insertions(+), 88 deletions(-)
 delete mode 100644 ci/jailhouse-config-amd-seattle.h
 delete mode 100644 ci/jailhouse-config-banana-pi.h
 delete mode 100644 ci/jailhouse-config-x86.h
 create mode 100644 ci/jailhouse-config.h

--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1581770164.git.jan.kiszka%40web.de.
