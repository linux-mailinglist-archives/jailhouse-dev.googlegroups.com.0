Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBMHA2P3AKGQEP3M37TQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43f.google.com (mail-pf1-x43f.google.com [IPv6:2607:f8b0:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AA41EA38D
	for <lists+jailhouse-dev@lfdr.de>; Mon,  1 Jun 2020 14:10:26 +0200 (CEST)
Received: by mail-pf1-x43f.google.com with SMTP id y16sf185040pfp.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 01 Jun 2020 05:10:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591013425; cv=pass;
        d=google.com; s=arc-20160816;
        b=MQ29TjXrIECaNyk8g1qu3oymRei52dsc67pzD0KXVJQv+q48qXvKIisYd55EZHmdaJ
         RaqG/UWF+Hh9qY2HtYdEdrcrY5aa3e3tZrjgwc2R7XOU26kbbYelrdaZjZUNp/V8qp0N
         snuTuppxlAC1Nfh5b69GnNiRapk9uZWdiiwbau4D9EhSMwcSvQ7bqcTcMHobuX94Ya/2
         3vjhvgJjRllRrTen2t1ajLfKtFJiAwVSnHvzK3PSdBeTUNbHVcxeDoynoaBmCjlMt3r7
         +wAymCZtB8D9YZtoRJbBEghndPkaSDvgv+ZFiDAzkdNtKWWybKql/TlY1kO0CkVWdIl0
         SXJg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=ezbTrz7SVOmlwIsSdj8gdn/ZJOz3pKT/JXnTEprWoK0=;
        b=YO3WT8xda37ziOgpVCmAtf786gduVsJ2Fk/zObNYQb/wXYqR/N7njBwrF8Xy9TyyyE
         4yZgYod2e+r8qTMqP+CSSZpk+uO63VObe9Y8cJGZ8ONaqmCS45+Z5fG1mGMRaVuY1aLf
         vpvUxIKWrc5LHXLn919KM867A3AsTx1LIQxLZcc0E1vNDrFo2+s8rLY2AuzK0xt4jBrK
         SfzVNZ2rLJvcSUDah/kqdQ8BW1e5x5yGn3qa8LGcyDQIhbo+9GDlSuwD1aMP6EQbPV6v
         T8GZsl6rB5i2gSNvRB1unzYhKAh0bkXEr6bIxlKRGVrGCNApSXfNlPYy4H39PiEZwhb6
         p8og==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=vhl9guPA;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.196 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ezbTrz7SVOmlwIsSdj8gdn/ZJOz3pKT/JXnTEprWoK0=;
        b=Q43wuo6DXMPBeOd7vNGZezLFneembQqumeK7T7saDOKB/5ueRXFJDaB4DQ2ySKEOdn
         YptLRmTRHyE4B9qcxT8uoT+pWivTVhyoR7Kzf/0xKx2uQ6FF6RAi1YLR2iypxrdZ4p8c
         t4rOQI9i4X5r3gLvKWVhbagXHbsBIRGTdfGyC7ARmiAc36GhGY9ktBE7LAisQb3EKM9J
         GE8j0XfZ2XY7fLyzwGjoQhGZKoxKyQl04i88c7Hv2tKznl+s1wlyE+HnLG7pbBEI7y9e
         AMfTYMvBGb/OQAVh27aTnN1vGchh/9sbnxIsgDRAWAvq1JKtp3F34u7RT2Ib7vssdJJq
         eZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ezbTrz7SVOmlwIsSdj8gdn/ZJOz3pKT/JXnTEprWoK0=;
        b=qnRYRhuBYBx0kgv7o0kz4MIKEZYrT1DJ0BJseKrqTrXA6nsdfgTUXE/8UFISxFr/t9
         16/TQvOLIP0Xg6xJev0sV+3cPir/O9cSbvshIlGtZaPMYV0jEwPoAD23T9TUyvTXf0j4
         uLJkQ9c/sv/eayFROY7Qi+G+QG8ZxDxNscqgi50fkVApst+tvzepa9g5KY2WJedL6IwG
         RWiQVenzqoka1tmxwQ1j/4Ijm2+gqyeySX6JiVX9WGIdu4ETA+ZSuUUreqrDo/TApsRe
         SnTyRIL8EVmFUTOH9g5xRHCs+XnmdwwOiuyWYYe2qdM7x7j672jfalMB0H5yGtHfz9JA
         DruQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531+6maSwJFDn0uolCglS+XACQGYGx9staemMJDuze8zvPZRibl2
	VgOeyR9YFf2Zu3L7vYm8pP8=
X-Google-Smtp-Source: ABdhPJx14rCGrKVJoV7V/xKveP6aYWezD7KB2JJi2TsayKacldrYOojZ7Mw0L4N2dielZqB87XlFLQ==
X-Received: by 2002:aa7:93ac:: with SMTP id x12mr21828676pff.143.1591013424982;
        Mon, 01 Jun 2020 05:10:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:8e4e:: with SMTP id d14ls4897151pfr.0.gmail; Mon, 01 Jun
 2020 05:10:24 -0700 (PDT)
X-Received: by 2002:a62:1b87:: with SMTP id b129mr19890487pfb.162.1591013424305;
        Mon, 01 Jun 2020 05:10:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591013424; cv=none;
        d=google.com; s=arc-20160816;
        b=Ny4TB3eKkwjqTTUUqxBrJqVOLI+jzGWVR+KWMT7+Y15FXQREEVG4PRoFzrVr8qLwdP
         zbpW/TUgAPNdA81RGG4fXMW/ZSrL4WChgMSqY1R88SbFuMpILJ2OiPZE5+zjjekqrkjA
         uaSB+wHFBnP/ZPivChNPziRL3GZPzJgP0YsYnrYPTuzl+j7hzSYngENpkY6W+HUCmgB8
         E7tWl2UmCShLYdgIL/6vTv60RQ6a9+Zs49ovT0ZhX2/Vne8m+8RS+SB6g3/Pe9fjL0cA
         +NqhsMTBo7AAKqrXFq63Lxt/F0dharw+Xh+weI1DALCy+p3TKZo1rLfwdp2Us8y6VD2O
         PpXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=VLEuR/E238ByO9mqkMpYMuAYNQ1C87VovP+yeEMG8es=;
        b=CuZrMo+uEGsrI1A0SVfTOsnITc3fAMBHH6LfNBTB1mJC1t9Y9Amg7v0Cf9Upe8tjOD
         VnOyzPTYNZ6T0kGIcImZNyIqudiS4iKaMzVW8F7PWO4PAUtlGH9zkU6ZWu74LCfezRtd
         Gdpn/UdwANx6V0UWCwKuhOKeIz4WEypY8ksS3Q3RMusIRa7um88XyPAba7ouwkpJBtXp
         Z/pNlT2bHlhm26Mied+IKl8X63gWOwLGS2y76yxXDwT+DUixNrvEAJb2OpnzWSaftTrf
         /zG7oPiebQYMN5L4EnzPuibHmwTQtFXoVisPm1Ge5IYiazEesb6ZR2EgfpTGf+hYh22G
         Z4UA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=vhl9guPA;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.196 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-5.smtp.github.com (out-5.smtp.github.com. [192.30.252.196])
        by gmr-mx.google.com with ESMTPS id ds21si316248pjb.3.2020.06.01.05.10.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jun 2020 05:10:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.196 as permitted sender) client-ip=192.30.252.196;
Received: from github-lowworker-edec459.ac4-iad.github.net (github-lowworker-edec459.ac4-iad.github.net [10.52.18.32])
	by smtp.github.com (Postfix) with ESMTP id DE1339602AF
	for <jailhouse-dev@googlegroups.com>; Mon,  1 Jun 2020 05:10:23 -0700 (PDT)
Date: Mon, 01 Jun 2020 05:10:23 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/15169d-d4ab14@github.com>
Subject: [siemens/jailhouse] b9df7b: configs, core, tools: Pull iommu_units
 out of arch...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=vhl9guPA;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.196 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=github.com
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

  Branch: refs/heads/next
  Home:   https://github.com/siemens/jailhouse
  Commit: b9df7b984d88f627c1973e8aaa4ef21d62117ab9
      https://github.com/siemens/jailhouse/commit/b9df7b984d88f627c1973e8aaa4ef21d62117ab9
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-01 (Mon, 01 Jun 2020)

  Changed paths:
    M configs/arm64/k3-j721e-evm.c
    M configs/x86/f2a88xm-hd3.c
    M configs/x86/qemu-x86.c
    M hypervisor/arch/arm64/iommu.c
    M hypervisor/arch/arm64/smmu-v3.c
    M hypervisor/arch/arm64/ti-pvu.c
    M hypervisor/arch/x86/amd_iommu.c
    M hypervisor/arch/x86/iommu.c
    M hypervisor/arch/x86/vtd.c
    M include/jailhouse/cell-config.h
    M tools/jailhouse-cell-linux
    M tools/root-cell-config.c.tmpl

  Log Message:
  -----------
  configs, core, tools: Pull iommu_units out of arch-specific platform info

This is now used by x86 and ARM, so there is no need to keep the same
field in each arch-specific section of the platform_info structure.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 3bbe8ec295e8fa7183c971345c499080042d4266
      https://github.com/siemens/jailhouse/commit/3bbe8ec295e8fa7183c971345c499080042d4266
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-01 (Mon, 01 Jun 2020)

  Changed paths:
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  cell-config: Rearrange paddings

Use the chance of a config revision bump to update / add padding bytes
so that 32-bit words are 32-bit aligned again.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: e3747ae41359a3b0ef1c0eec9c75895e30c2d555
      https://github.com/siemens/jailhouse/commit/e3747ae41359a3b0ef1c0eec9c75895e30c2d555
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-01 (Mon, 01 Jun 2020)

  Changed paths:
    M tools/jailhouse-hardware-check

  Log Message:
  -----------
  tools: jailhouse-hardware-check: Clean up dead code

This became unused with 064cfe3834cb.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 6fbce3c73e1a2d6df85e1496931bb7cbf6155574
      https://github.com/siemens/jailhouse/commit/6fbce3c73e1a2d6df85e1496931bb7cbf6155574
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-01 (Mon, 01 Jun 2020)

  Changed paths:
    M include/jailhouse/cell-config.h
    A pyjailhouse/config_parser.py
    M tools/jailhouse-cell-linux

  Log Message:
  -----------
  pyjailhouse: Factor out cell config parser

Move the cell configuration parsing classes from jailhouse-cell-linux
into a pyjailhouse module. This will allow reusing the code for the
upcoming config checker.

CellConfig must not terminate the caller anymore but rather raise a
RuntimeError if parsing fails. This can be handled properly by the
caller.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: decc4b2ff6fbcb6b2aff579e5cf0b36454132298
      https://github.com/siemens/jailhouse/commit/decc4b2ff6fbcb6b2aff579e5cf0b36454132298
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-01 (Mon, 01 Jun 2020)

  Changed paths:
    M pyjailhouse/config_parser.py

  Log Message:
  -----------
  pyjailhouse: config_parser: Translate struct.error into RuntimeError

The enables error reporting at an appropriate abstraction level.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ed808e203c04917d3867d7884c881504311d106f
      https://github.com/siemens/jailhouse/commit/ed808e203c04917d3867d7884c881504311d106f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-01 (Mon, 01 Jun 2020)

  Changed paths:
    M pyjailhouse/config_parser.py

  Log Message:
  -----------
  pyjailhouse: config_parser: Add SystemConfig

Add parsing of system configurations. This is so far only processing
essential fields needed to validate the structure and access the root
cell data.

The root cell is parsed via CellConfig. As the embedded root cell
contains no signature and revision, CellConfig needs to be made aware of
this mode.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: e6319890d96ca022bef03db59d3d511033538dc9
      https://github.com/siemens/jailhouse/commit/e6319890d96ca022bef03db59d3d511033538dc9
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-01 (Mon, 01 Jun 2020)

  Changed paths:
    M pyjailhouse/config_parser.py

  Log Message:
  -----------
  pyjailhouse: config_parser: Convert memory region flags into ExtendedEnum

This will allow printing them by name. JAILHOUSE_MEM also inherited from
int so that arithmetic operations continue to work. Ordering matters so
that string conversion is provided by ExtendedEnum, and we will only
fall back to int for integer representation.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: e286a086d33c048a08b4df776c34ff5005cb5d3b
      https://github.com/siemens/jailhouse/commit/e286a086d33c048a08b4df776c34ff5005cb5d3b
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-01 (Mon, 01 Jun 2020)

  Changed paths:
    M pyjailhouse/config_parser.py

  Log Message:
  -----------
  pyjailhouse: config_parser: Add pretty-printing of MemRegion

Will be used by config checker.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: fd5b9418a9270cf969bd04bd12d9144bc764d034
      https://github.com/siemens/jailhouse/commit/fd5b9418a9270cf969bd04bd12d9144bc764d034
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-01 (Mon, 01 Jun 2020)

  Changed paths:
    M pyjailhouse/config_parser.py

  Log Message:
  -----------
  pyjailhouse: config_parser: Add MemRegion overlap helpers

Add helpers that check if two regions overlap in the physical or virtual
address space. Will be used by config checker.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 7e408aefd0aa940f41227ab34648bbd650764d33
      https://github.com/siemens/jailhouse/commit/7e408aefd0aa940f41227ab34648bbd650764d33
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-01 (Mon, 01 Jun 2020)

  Changed paths:
    M tools/Makefile
    M tools/jailhouse-completion.bash
    A tools/jailhouse-config-check
    M tools/jailhouse.c

  Log Message:
  -----------
  tools: Add jailhouse configuration checker

This lays the ground for offline configuration checking. The checker is
mounted as "jailhouse config check", accepting the binary root cell and,
optionally, any number of non-root cells.

So far, only one check is implemented: Finding overlaps of memory
regions within a cell. But already this reveal a number of pending
issues in our in-tree configs.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: c0cd76ad5bda5a9348cdec07271495ce4f4af78f
      https://github.com/siemens/jailhouse/commit/c0cd76ad5bda5a9348cdec07271495ce4f4af78f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-01 (Mon, 01 Jun 2020)

  Changed paths:
    M tools/jailhouse-cell-linux
    M tools/jailhouse.c

  Log Message:
  -----------
  tools: Refactor and align help outputs

Make sure the short option name is printed first. Use a few more telling
metavar names. Finally, align the short help printed by the jailhouse
frontend tool with that of the tool helpers.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: d4ab14554470d8eb1c726d4318626af1b6b25405
      https://github.com/siemens/jailhouse/commit/d4ab14554470d8eb1c726d4318626af1b6b25405
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-01 (Mon, 01 Jun 2020)

  Changed paths:
    M configs/arm64/ultra96-linux-demo.c
    M configs/arm64/ultra96.c

  Log Message:
  -----------
  configs: arm64: Fix ivshmem-net location for ultra96

Apparently a flip in the nibbles.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/15169df2990f...d4ab14554470

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/15169d-d4ab14%40github.com.
