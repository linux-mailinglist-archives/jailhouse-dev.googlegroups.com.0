Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBKMTUH5QKGQEUXDMRGI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd40.google.com (mail-io1-xd40.google.com [IPv6:2607:f8b0:4864:20::d40])
	by mail.lfdr.de (Postfix) with ESMTPS id CA600271AEC
	for <lists+jailhouse-dev@lfdr.de>; Mon, 21 Sep 2020 08:35:22 +0200 (CEST)
Received: by mail-io1-xd40.google.com with SMTP id b16sf9254311iod.17
        for <lists+jailhouse-dev@lfdr.de>; Sun, 20 Sep 2020 23:35:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600670121; cv=pass;
        d=google.com; s=arc-20160816;
        b=jFmIfSXb20SS3Ke+KW/tgrF8f4ixnuiQ6elBeyBEfrK7OgCoIpBMvd3mnblBGDHGbo
         gqVFwwD3/hBGMcmL2MTEQ1XTY+hPyOAwgiXb7CHme7G88XbBoGjTaqCq5qTXbOnvxCLh
         Z3SbP2Mg5xJlvj/i171bXCNg8rI6aUpxTnEtpqQCBdraKrall6ht7lKDzMl5RruJW+SM
         YleaiwS305eoZA0PlUbiRIocCvs+NTioEacG+xwyr2iCiI+TLqvQr71/ddpRC5xVaIci
         piml6H9w7jqur0NkKW195Y1F4CnYLHsTXk1wILX4jretKGkyE/o5Na4DDk8JFbjxZf2W
         8Lcw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=Xmh99wU+Wuy0O7tzl+ovCqN9/WZ0gjU056Tk8mk1tYo=;
        b=Td557Bim79sdW0SxKNo3o706h8VDq01r69IHPHKQEsy7kob21Zpmot8CmlCUlkjynR
         PvvHhpc1GnrF4Jyvst150BaMR6ocb/5jFGWesS0MH5ClMxmvTIAnHnIMsJAFVeI/HTRA
         bLwGCwuuz/6nYGjP0eZL1lQMS2OCkfrzBaj0jcJuNHvql3gT4/kbk3CNewhJGTC7DX/W
         FbbvapTswn47hymtl/Av4wTUJLql1CrgBt0Pd4Wxgry+h9JwGhH6SGvawZHGmvuepsyl
         ck7tGGh5IlCGvu+TXdSWrxUmcG7DTQPA1jLgxrdtLHcbXUdz9Nz0220apApMeBb/F23+
         hAwA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=VtMnC4Uv;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.208 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=Xmh99wU+Wuy0O7tzl+ovCqN9/WZ0gjU056Tk8mk1tYo=;
        b=VawI3LNA8MMlvmQNcoCiAnAGxuYBPHzzwQltRNCQsyv1dxMXtdVZeZERUtxevsBevV
         mHMVxG4IitT0ehmCsCl+WqCRSkBg3ZI0JbvuUqtsZpgYT8tdYHKK4uFx+Pe8+iwPM+yc
         I1Mz8ecwrtb6HcEuBJvFvIdvns4rz/S4o/ELiE6WPcsuWb7qXgEFg7o36LCQ/yEFvPsa
         +2OmtWorGSvrkxB+Bqa9HzhS3uo0gKtqbik9xNdOMwPvr2WHYnIJ106BWLA9CiGFE0l7
         duA07VTQUo6WsmatAJhpr7gnkikHYesiYGiIpZgDhr2MzNWOf1k6RZb2af7xL74rAgeH
         KWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Xmh99wU+Wuy0O7tzl+ovCqN9/WZ0gjU056Tk8mk1tYo=;
        b=q72dp+vozvHSTGerjRs1esit6RiJ3zU0fCk1KauxFILmfiFzeJfSmffP8Q37gudVET
         7Q58qDlFjZXVYJO1lB1nR0ao9hqlZwdO2F928ZTeZ9tqYDEFaurdRmArUmgp2JlbLurt
         hZ1rVE7ll4p25+ztedAh9+w66VIswW9AFjPav0/gJFD+ZgLo1nQvan5HNWeM+tlzvA7G
         xAHp1BmpRwc2u/qCluSP5Ny3N1bn4dQuXcTJen++tnsbDSQr6uhDbpObwLRqIbjTBxyu
         x5YqsqmPAEjjtc24In1cpnTepsyYco60fCnPCSN8KBg0gpnx1XySkO2dCwEzHgHSP4JX
         lAjQ==
X-Gm-Message-State: AOAM532sHBW5lZwrK8oBnZ01ZU6eSDZvry9GTo/x+EYmptZ+64Aptgoz
	K/OdTC8c8SnMSp2C8VzN1Lo=
X-Google-Smtp-Source: ABdhPJzFpX/05J1XmZ88pGnrhMdSAXwULK8mM25AkiHdPvlt+lR2vGrpO/vyvmuqiZjVDIV/Dnnp1w==
X-Received: by 2002:a5e:820d:: with SMTP id l13mr36435949iom.3.1600670121722;
        Sun, 20 Sep 2020 23:35:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a92:a814:: with SMTP id o20ls3138795ilh.5.gmail; Sun, 20 Sep
 2020 23:35:21 -0700 (PDT)
X-Received: by 2002:a92:8b41:: with SMTP id i62mr29831466ild.9.1600670121112;
        Sun, 20 Sep 2020 23:35:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600670121; cv=none;
        d=google.com; s=arc-20160816;
        b=lRh4HSeAbuRgAnE8RTg3CfX6Gig/uRWRdsRwrLEM9vmjyVQRADk3oUHFZ5Rf+7ZMue
         xsfSmCEPVuysCfjNfCFttWARdDYvX6TXhj3FvFdj9FDQXku6oo8fjzU3Eui4CilYLoxa
         IdWvmo249RhRd5ugMFol+woUHID/nGB7ls4qY7I8/kUcvPTyBWnrhofoIMRRf6RPz/Ud
         mWBp0RMQbI/qLM17IAHSOfMv0XgotKi8SLpqFaW2K/1DwUuWYLhvUismlat4vzgnDUPm
         tn+zp82yXClG8ap/1myzheR3VzigOO2fUpv3ng4TwgxIX4bNHPKn2x6eDwvbyS6n2RPw
         YKBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=976t76zR27dp18W5+ym2Q3ZyZKTJkp3eAxNxvTA27C8=;
        b=RhsDgTOBGYuVYJxIqr2KzAa3TXPWssJ9bcsrg4HkBHcgdlJop0V+zexWVTJecC9KPm
         qReZ91bdMA0FJz7kIr42JbT4fYbMqTN0GeBEmVu5T/CgWi4HwVncsEx/FkuLO5+II577
         LfDNf0UkMjGcdUSQHS6PblJjeOcYJibt+vvr1Pb1+RD9VjdzBrBiZKOvHk1qDrnZKfKY
         e/ZK1UTay2MtR/fyLptYsKNPWhpxZayiscofLMuFUuH4kV1wF4/BSi3Qvxt3bxTbg6BB
         5/vW/OHTBPPC4ovG7P6wup/QfOhcFRPCLV4QtCwE52aMDeCtSCAkVZTJnrBs7DogQa8r
         5tpw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=VtMnC4Uv;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.208 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from out-25.smtp.github.com (out-25.smtp.github.com. [192.30.252.208])
        by gmr-mx.google.com with ESMTPS id a5si160559ilr.3.2020.09.20.23.35.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Sep 2020 23:35:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.208 as permitted sender) client-ip=192.30.252.208;
Received: from github-lowworker-f144ac1.va3-iad.github.net (github-lowworker-f144ac1.va3-iad.github.net [10.48.16.59])
	by smtp.github.com (Postfix) with ESMTP id A3697840033
	for <jailhouse-dev@googlegroups.com>; Sun, 20 Sep 2020 23:35:20 -0700 (PDT)
Date: Sun, 20 Sep 2020 23:35:20 -0700
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/master/6d7eed-756216@github.com>
Subject: [siemens/jailhouse] a8d033: Documentation: fix display resolution
 number
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=VtMnC4Uv;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.208 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass
 (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
X-Original-From: Jan Kiszka <noreply@github.com>
Reply-To: Jan Kiszka <noreply@github.com>
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

  Branch: refs/heads/master
  Home:   https://github.com/siemens/jailhouse
  Commit: a8d033c65dbb8667fc795e16aa4ce60dd45b18f0
      https://github.com/siemens/jailhouse/commit/a8d033c65dbb8667fc795e16aa4ce60dd45b18f0
  Author: Daniel Sangorrin <daniel.sangorrin@toshiba.co.jp>
  Date:   2020-08-27 (Thu, 27 Aug 2020)

  Changed paths:
    M Documentation/debug-output.md

  Log Message:
  -----------
  Documentation: fix display resolution number

I was wondering why the configuration size didn't match
the multiplication and then I realised there was an
errata.

Signed-off-by: Daniel Sangorrin <daniel.sangorrin@toshiba.co.jp>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 7bcab7c38b2c853ec068b35d61205ef660fceaac
      https://github.com/siemens/jailhouse/commit/7bcab7c38b2c853ec068b35d61205ef660fceaac
  Author: Jakub Luzny <jakub@luzny.cz>
  Date:   2020-08-27 (Thu, 27 Aug 2020)

  Changed paths:
    M configs/arm64/dts/inmate-rpi4.dts
    M configs/arm64/rpi4-inmate-demo.c
    M configs/arm64/rpi4-linux-demo.c
    M configs/arm64/rpi4.c

  Log Message:
  -----------
  configs: arm64: Add support for RPi4 with more than 1G of memory

Add the required memory regions to support 2G, 4G and 8G RAM variants
of the Raspberry Pi 4. Tested on all the bigger variants, not on 1G, as I don't
have one on hand and it's not available anymore.

Also moved the memory used by Jailhouse for the hypervisor and cells from
0x30000000 to 0x20000000 to avoid conflict with GPU memory. That is fine for
gpu_mem setting of up to 256. The memory is supposed to be reserved using
reserved-memory node in the device tree.

To support variants with >2G RAM, the PCI MMIO config space was moved into the
ARM Local Peripherals address range, into free space behind the GIC.

Signed-off-by: Jakub Luzny <jakub@luzny.cz>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 8e1aea00f77d1c1a4b2313255966b741c2f1fd93
      https://github.com/siemens/jailhouse/commit/8e1aea00f77d1c1a4b2313255966b741c2f1fd93
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-08-29 (Sat, 29 Aug 2020)

  Changed paths:
    M hypervisor/arch/arm-common/gic-v2.c

  Log Message:
  -----------
  arm-common: gicv2: Fix byte access to ITARGETR

Byte-size write accesses overwrote all fields the issuing cell owned,
not only the target byte. And byte-size read accesses may have returned
the wrong value. This was broken since the beginning, just wasn't
stressed properly so far. Latest jailhouse-enabling/5.4-rpi revealed it
finally.

Fixes: ee6b35ba9037 ("arm: GICv2: handle SPI routing")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 7b2876158c416ecd40e53bcc6b4c9080dc51931a
      https://github.com/siemens/jailhouse/commit/7b2876158c416ecd40e53bcc6b4c9080dc51931a
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-08 (Tue, 08 Sep 2020)

  Changed paths:
    M Kbuild
    M configs/Makefile
    M hypervisor/Makefile
    M hypervisor/arch/arm-common/Kbuild
    M hypervisor/arch/arm/Kbuild
    M hypervisor/arch/arm64/Kbuild
    M hypervisor/arch/x86/Kbuild
    M inmates/lib/arm/Makefile
    M inmates/lib/arm/Makefile.lib
    M inmates/lib/arm64/Makefile
    M inmates/lib/arm64/Makefile.lib
    M inmates/lib/x86/Makefile
    M inmates/lib/x86/Makefile.lib
    A scripts/always-compat.mk
    M tools/Makefile

  Log Message:
  -----------
  kbuild: Avoid deprecated 'always'

Switch to 'always-y' as suggested by 5.9.

For older kernels, we need to set 'always' to 'always-y'. This has to
happen conditionally in order to avoid warnings from 5.9 onward.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 67e4de38a3f8c37a429f68019a79a2c387d66fa4
      https://github.com/siemens/jailhouse/commit/67e4de38a3f8c37a429f68019a79a2c387d66fa4
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-08 (Tue, 08 Sep 2020)

  Changed paths:
    M driver/main.c

  Log Message:
  -----------
  driver: Adjust to kernel 5.8 and 5.9

Several things changed and require tuning:

 - __get_vm_area is gone, switch to __get_vm_area_caller which now
   requires another kernel patch to export it (pointless to try
   RESOLVE_EXTERNAL_SYMBOL since 5.7)

 - cr4_init_shadow was hidden from modules; set/clear VMXE directly
   instead so that the shadow is aligned to the real state; no action
   needed on AMD as EFER is carrying SVME

 - include asm/apic.h explicitly for lapic_timer_period

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 5f4f0b1f3588e6059424b23854a9550d1713957f
      https://github.com/siemens/jailhouse/commit/5f4f0b1f3588e6059424b23854a9550d1713957f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-08 (Tue, 08 Sep 2020)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: Fix wording of parse_iomem_tree comment

Makes it easier readable. No functional changes.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 3dbdf11d94a9ac58d9dd213e95ba32781b0f021c
      https://github.com/siemens/jailhouse/commit/3dbdf11d94a9ac58d9dd213e95ba32781b0f021c
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-08 (Tue, 08 Sep 2020)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: Filter out AMD IOMMU memory regions

In case they are enabled while parsing the tree. Analogously to DMAR on
Intel, except that we do not need to keep them.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 2e8103b044df491e469f143479347823d556ca42
      https://github.com/siemens/jailhouse/commit/2e8103b044df491e469f143479347823d556ca42
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-08 (Tue, 08 Sep 2020)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: Return true size from IORegion

Avoid having to override the size method in PortRegion and rather do the
correct calculation in IORegion already. This does not affect the
rounding in MemRegion.size.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: b57f5dc5384d8619c98a94e34898658c7db9c2cb
      https://github.com/siemens/jailhouse/commit/b57f5dc5384d8619c98a94e34898658c7db9c2cb
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-08 (Tue, 08 Sep 2020)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: Always walk reserved regions with children

Newer kernels and/or certain platforms (seen on AMD R1505G) list a all
PCI resources and some ACPI resources behind a top-level reserved
region. Skipping it leaves the config fairly incomplete.

Also fix up a trivial flake8 reporting at this chance.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: c242d88ba13ff143a05dba0b043eb6b891236ec5
      https://github.com/siemens/jailhouse/commit/c242d88ba13ff143a05dba0b043eb6b891236ec5
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-08 (Tue, 08 Sep 2020)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: Factor out MemRegion.is_ram

To be reusing for merging RAM regions.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 756216b9d1e1f5b908db35c8dfb1c87d6600e053
      https://github.com/siemens/jailhouse/commit/756216b9d1e1f5b908db35c8dfb1c87d6600e053
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-08 (Tue, 08 Sep 2020)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: Merge adjacent RAM regions

The kernel tends to report regions that are not page-aligned but
directly adjacent. Adding them as-is into the config will make accesses
fail because the regions will end up as incompletely configured sub-page
regions. Detect such cases and merge the regions.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/6d7eed9ccf14...756216b9d1e1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/master/6d7eed-756216%40github.com.
