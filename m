Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBLXB42KQMGQEWOHLNFY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AC155B9E4
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:29:18 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id p6-20020a05600c358600b003a0483b3c2esf2236561wmq.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:29:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656336558; cv=pass;
        d=google.com; s=arc-20160816;
        b=VJ3lFQHWrzY2ZV+uPsS5laeSfuRWzVZulGuntWO5XwLyAqR5LTQmWXaNgffOEaduC7
         nzd/736D2reihcpp29RbWdDeIkdra9moPmRtOvz/EN2luAarI4zWqgDAVINSIXbm11hO
         n8pYejSahNkUtZrP2z4hOA6ijIKfgDwZWI6pDYL1qTg3djwE/cm4LrSepzwyo1bvmCC4
         Pe6toBnNEKA2kvKvcMPol/mLGSVNa8211yYpyc0nfoLg5LkGYqP6HjOzb7LF1iJHogpa
         m0RY0gKGxovmEXXkpJZfTDgl8A8ayPl2fX1HCYV8nA+RPxTuqOdxm3hBzpCbZkDbxje/
         tYXw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:sender
         :dkim-signature;
        bh=EfuKJ6QUX7lXT2nFJ9swwJD1UsZZjOZRu9G0bzQWgyg=;
        b=xWwco9+/Q0tLYsxBl+Mg++7cTKYymQw/eEGEFzaclauTXW0T6GMOvx9THGK/AOirwP
         5CE29vOMUSD1QMYzKdMRxs2g9vjR3AF4n/7yXkglP0gYDnj2Wn0pUaUPKM2Y7AsRIP1A
         yUbIZjpyCLoDfX7He1lwmUMOwxmrJzBbU7pAPPp4ZyQWN0q9PrE5dH/6CjJGmIeNXrFW
         YXp5h+QrqXYlg8VV/pY4oIElTAiCp3MV+/kUl9EfjhPIbM27/gukql7xq171KfSF+nHu
         AuZM3vZDXmMgMHaYcT97iMG4xdBdT6kHR2lh+EhcqnO0bPHMfVgXb7Mdgrazy//vsGbq
         gW2w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=pO8ld+s2;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=EfuKJ6QUX7lXT2nFJ9swwJD1UsZZjOZRu9G0bzQWgyg=;
        b=McqFrDkOrdedVw76yg2kgjpB4A4V+GD4jH3YFfAlFsEFHsA/BxFhQbEeZX8g/r2WM4
         7lk6oZw08OobQNu7SnJn/E55hyfkrxgovsszz2QekCqVseKrU5grQ7CQXjyN+/ico8ts
         ITlhdCysTqluzV4VitH3sRgCw33UBuN5XBj3kVOkJy3AnJNiBDLI9AMHZjs3wdfFEApy
         7z3AxObHrT1af70o3LKj9oSIhEVVUvNqr3z2BN1wDm829M//uJ8EyX5uo2nclodSvZec
         /U4YfgBzqxGxzKWYboVbY4qoSWGAMxj7LsqNwV6C5NmH0ejbXmHFk265J4Ry+cIiRFme
         98iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=EfuKJ6QUX7lXT2nFJ9swwJD1UsZZjOZRu9G0bzQWgyg=;
        b=0EvTZ6D2PA+LaF2QP6LhRKGOFaEiscKuw9JphAh9jjd+zx66qA0tXSCkv9PINviKsX
         5J8yWb8wLn3TCOPXxPmgMY6/qfR9niI2FdW4XNUZQ+0ZQa0eHu8IB0jPfSPGevn6VQxz
         5UahKpMTtfCwxMS3MUurNJR6UrCJnOCuBCrAZjO2u8IkNcnXzOKaDsEWjqOOtXYj8uXF
         zRWycTT/zB+Bc0QSloKVYwWaD3/S0sx7z+R051SpEd0IEzDtjIHmfTrREXJLKKy9+tm4
         XG48W2gt4CBm0hOzCE8Gzr++WUqE1DjF+dUMQ8t531r9CRd00Iup2Cc5918Cu23fZcBW
         woWA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora8F9zc/DRb45Ypf9f5ro9ntCkjN549QNk/GPipLf0pkwMO7bhyv
	ZYG06rONH0dFS/CXdB+CkFg=
X-Google-Smtp-Source: AGRyM1vufOdH9QEel36R8OLLxnoOt1GSRE7dMG1wd+j3IoBtnxVIYXrBNjOebl+N5flDuV/igOO0tQ==
X-Received: by 2002:adf:fb08:0:b0:21b:af81:2ffd with SMTP id c8-20020adffb08000000b0021baf812ffdmr12436861wrr.685.1656336558644;
        Mon, 27 Jun 2022 06:29:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:eb04:0:b0:21b:b3cc:1640 with SMTP id s4-20020adfeb04000000b0021bb3cc1640ls13083180wrn.1.gmail;
 Mon, 27 Jun 2022 06:29:17 -0700 (PDT)
X-Received: by 2002:a05:6000:983:b0:21b:90e1:220c with SMTP id by3-20020a056000098300b0021b90e1220cmr12018487wrb.232.1656336557082;
        Mon, 27 Jun 2022 06:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656336557; cv=none;
        d=google.com; s=arc-20160816;
        b=YbetGLARcvKJpKo4S/AiGG/9jBlDiwkQ8En7vV02XNZtklwx2nw7Hj/zA0sNCDvd5I
         T7je0nv3XCjwZwDiifRVwkAr7Vcsc0DTIG/GVNrE5yWv5MhOn2nSM5x7XFofKibMXmcg
         4WGHBmSvUpbbacDJWXu0SEgxRWSBdmFKRqO6elNhI2AAU0/CFwHj9+MbbH8Xc2Xpov/y
         blPrNJldzO4FTndxwbJWq9DwhtEPScGHTSjfK6R75IkiDuQZ6hMRrWCmwAshht+h3Gb2
         VNh+d52O1DvE+SUBC5HXafv+y59eGp/9MVhYuoQREeKMsLCx+MAGvthUMjFIjN62dz8D
         l5wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=lnFUKrCPELrCOBLiNhInWdptruB08v5Axm3dNbb4RAA=;
        b=ifB6Ia4hj/iIU/IxK1U/bPOJ/55tjut5QUKCkjRu/M1rrD84tCEO6dpJ1hJVgig4dy
         h4yfqNwUzX2c0sfWvid1tI4uU3XAnEQeUvFQXZrT8MRnHeJcgWI9mzDIN+FHSv3oVnl9
         TKNWOBYyCtae0QGM23RjsJe21BXUGLMY6L9slAuUgln0wTF63CsPQ7ujGkNYu76LjBqQ
         yNgMXLrPX9MTxNt5ucYvGRFWCsBMxjDr0Y9zRbHuvkI5jyrY1LmINONXyvKJZX1dDBrd
         U5pCaWAiFOpBnOlaUXUWSt94DxtUWhMIgi31uTWtQDn+aRl53fEnqnJolVF6dERiR9p2
         nqWw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=pO8ld+s2;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id k24-20020a7bc318000000b0039c4d96e9efsi878633wmj.1.2022.06.27.06.29.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:29:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4LWpV44ygFzxpy;
	Mon, 27 Jun 2022 15:29:16 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:29:16 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 00/42] RISC-V support for Jailhouse
Date: Mon, 27 Jun 2022 15:28:23 +0200
Message-ID: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=pO8ld+s2;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

tl;dr: this is a first approach towards RISC-V support in Jailhouse. It wor=
ks,
but there are still some open architectural discussions that have to be
addressed.

Hi,

this is the first RFC series for RISC-V support in Jailhouse. The series wa=
s
initially developed by Konrad Schwarz at SIEMENS in context of the SELENE
project [0], and later extended by Stefan an me (see Contributors below) at=
 OTH
Regensburg.

The series is not yet ready to be integrated, but I think it's a good start=
ing
point to have first discussions about the architectural aspects and directi=
ons
of the RISC-V port.

The series adds support for:
  - "wip/new-cpu-config" (by Jan, rebased and ported by Ralf)
  - RISC-V h-extensions (RV64 only)
  - MMU support: SV39, SV48, SV57
  - PLIC interrupt controller
  - Multi-Core non-root cells
  - Basic demo inmates
  - Non-Root Linux support
  - IVSHMEM (IRQs are implemented by virtualising the PLIC, sigh=E2=80=A6)

Target platforms:
  - Qemu virtual targets
  - NOEL-V [1]

Architectural limitations:
  - IRQs arrive in S-Mode, and must be reinjected to VS-Mode. This applies =
for
    IPIs, Timers, and physical IRQs at the PLIC.
  - The PLIC needs full virtualisation, as its design is uncapable for
    virtualisation. Cf.: [2].
  - IPIs are sent via SBI firmware. This requires double trapping (Jailhous=
e +
    SBI), and manual reinjection on receiver site.
  - IPIs can not be parameterised: there's only one single IPI. We have to
    differentiate between management and guest IPIs in software. Sigh=E2=80=
=A6


What is missing and should be discussed:
  - APLIC support (and MSI support)
      The PLIC does not support to be virtualised at all, and we should
      probably add support for the APLIC soon. The question is, if Jailhous=
e
      should still offer support for the PLIC: At the moment, only Qemu
      supports the APLIC, and we don't have a real hardware target.

  - Minor: missing support for jailhouse-config-check, support for
    jailhouse-linux

  - Prioritisation of vIRQs: they have lowest prio.
      vIRQ support is only suppported for testing / demonstration at the
      moment. Full virtualisation of the PLIC comes at a high cost, as
      priorities of the vIRQs need to be respectes as well. As this level o=
f
      virtualisation is contrary to the concepts of Jailhouse, I deliberate=
ly
      did not implement prioritisation of vIRQs.

  - Stable CPU enumeration:
      On Qemu, for example, the mapping from logical CPU ID to physical HAR=
T ID
      differs each boot. Hence, Jailhouse's static enumeration may drift. T=
his
      is only a problem for jailhouse cell stats, as erroneous CPUs will be
      addressed. We need to stabilise CPU enumeration. The driver will drop=
 a
      warning if CPU mapping differs.

  - Some spots need better locking and testing. E.g., IPI handling needs be=
tter
    locking.

  - There are some overlaps with arm-common/arm64; see irq handling, bitops=
.
    Should we factor those bits out?

Linux support:
  - We need this single downstream patch [3]. Patches can be found on the b=
ranch
    ralf/riscv-jailhouse/V10.

Contributors:
  - Konrad Schwarz, Siemens (base support, first draft)
  - Ralf Ramsauer, OTH (exception handling, control flow, reworked PLIC sup=
port)
  - Stefan Huber, OTH (inmate support)
  - Jan Kiszka, Siemes (wip/new-cpu-config)

Besides this patch series, there's a testbed for jailhouse on RISC-V that e=
ases
debugging and development [4].

The series can also be found here [5].

  Ralf

[0] https://www.selene-project.eu/
[1] https://www.gaisler.com/index.php/products/processors/noel-v
[2] https://github.com/riscv/riscv-plic-spec/blob/master/riscv-plic.adoc
[3]  https://github.com/lfd/linux/commit/e4c207ca00395c0fec578ae9b79b6f6a61=
5fddeb
[4] https://github.com/lfd/jailv-testbed
[5] https://github.com/lfd/jailhouse/tree/ralf/riscv/V8

Konrad Schwarz (1):
  core: riscv: implement paging structures

Ralf Ramsauer (40):
  driver: RISC-V: check for availability of h-extensions
  driver: sysfs: prepare for exit accounting on RISC-V
  core: riscv: define MMIO accessors
  core: riscv: Add CSR definitions
  core: riscv: introduce asm/bitops.h
  core: riscv: add processor.h
  core: riscv: Define percpu fields
  core: riscv: introduce global sbi_ecall.h
  core: riscv: introduce asm/sbi.h
  core: riscv: add platform information
  core: riscv: implement the hypercall interface
  core: riscv: introduce cell-specific fields
  core: riscv: add dbg-write helper
  core: riscv: implement library routines
  core: riscv: implement PCI support
  core: riscv: paging: add headers
  core: riscv: add asm-defines.c
  core: riscv: introduce traps.c
  core: riscv: Hypervisor entry code
  core: riscv: implement arch_send_event
  core: riscv: Add spinlock primitives
  Documentation: Add some documentation
  core: riscv: implement control.c
  core: forward original HV memory location
  core: riscv: implement setup.c
  arm-common: export for_each_irqchip-macro
  riscv: Add plic implementation
  core: riscv: implement trap handlers
  inmates: riscv: add timer demo
  riscv: inmates: propagate hartid
  riscv: inmates: implement Linux Loader
  configs: riscv: qemu: add system configs
  configs: riscv: qemu: add tiny demo config
  configs: riscv: qemu: Add linux-demo
  configs: riscv: noelv: Add system configs
  configs: riscv: noelv: add tiny demo
  configs: riscv: noelv: Add linux inmate config
  core: riscv: plic: introduce vIRQ support
  configs: riscv: add ivshmem-net devices
  driver: riscv: Add vPCI support

Stefan Huber (1):
  riscv: inmates: implement tiny-demo RISC-V

 .gitignore                                    |   1 +
 Documentation/hypervisor-interfaces.txt       |  16 +-
 Documentation/memory-layout.txt               |  20 +-
 configs/riscv/dts/noelv-linux-inmate.dts      | 147 ++++
 configs/riscv/dts/qemu-linux-inmate.dts       | 135 +++
 configs/riscv/noelv-linux-demo.c              | 111 +++
 configs/riscv/noelv-tiny-demo.c               |  63 ++
 configs/riscv/noelv.c                         | 153 ++++
 configs/riscv/qemu-linux-demo.c               | 111 +++
 configs/riscv/qemu-riscv64-tiny-demo.c        |  63 ++
 configs/riscv/qemu-riscv64.c                  | 228 ++++-
 driver/main.c                                 |   8 +
 driver/pci.c                                  |  33 +-
 driver/sysfs.c                                |  15 +
 hypervisor/arch/arm-common/irqchip.c          |   5 -
 hypervisor/arch/riscv/Kbuild                  |   3 +-
 hypervisor/arch/riscv/asm-defines.c           |  27 +
 hypervisor/arch/riscv/control.c               | 228 ++++-
 hypervisor/arch/riscv/dbg-write.c             |  14 +-
 hypervisor/arch/riscv/entry.S                 | 349 +++++++-
 hypervisor/arch/riscv/exception.S             |  91 ++
 hypervisor/arch/riscv/include/asm/bitops.h    |  54 +-
 hypervisor/arch/riscv/include/asm/cell.h      |  13 +-
 hypervisor/arch/riscv/include/asm/control.h   |  13 +
 hypervisor/arch/riscv/include/asm/csr64.h     | 196 +++++
 hypervisor/arch/riscv/include/asm/ivshmem.h   |   1 +
 .../arch/riscv/include/asm/jailhouse_header.h |  24 +-
 hypervisor/arch/riscv/include/asm/mmio.h      |  67 ++
 hypervisor/arch/riscv/include/asm/paging.h    | 119 ++-
 .../arch/riscv/include/asm/paging_modes.h     |  18 +
 hypervisor/arch/riscv/include/asm/percpu.h    |  39 +-
 hypervisor/arch/riscv/include/asm/plic.h      |  28 +
 hypervisor/arch/riscv/include/asm/processor.h |  47 +-
 hypervisor/arch/riscv/include/asm/sbi.h       |  84 ++
 hypervisor/arch/riscv/include/asm/setup.h     |  14 +
 hypervisor/arch/riscv/include/asm/spinlock.h  |  52 +-
 hypervisor/arch/riscv/ivshmem.c               |  36 +-
 hypervisor/arch/riscv/lib.c                   |  25 +-
 hypervisor/arch/riscv/paging.c                | 262 +++++-
 hypervisor/arch/riscv/pci.c                   |  25 +-
 hypervisor/arch/riscv/plic.c                  | 706 +++++++++++++++
 hypervisor/arch/riscv/setup.c                 | 200 ++++-
 hypervisor/arch/riscv/traps.c                 | 803 ++++++++++++++++++
 hypervisor/include/jailhouse/control.h        |   5 +
 hypervisor/include/jailhouse/gen-defines.h    |   8 +-
 hypervisor/include/jailhouse/header.h         |   7 +
 hypervisor/include/jailhouse/mmio.h           |   4 +
 hypervisor/include/jailhouse/paging.h         |   2 +-
 include/arch/riscv/asm/jailhouse_hypercall.h  |  68 +-
 include/arch/riscv/asm/sbi_ecall.h            |  96 +++
 include/jailhouse/cell-config.h               |  11 +-
 include/jailhouse/console.h                   |   1 +
 inmates/demos/riscv/Makefile                  |  20 +
 inmates/demos/riscv/timer-demo.c              |  57 ++
 inmates/demos/riscv/tiny-demo.c               |  19 +
 inmates/lib/include/inmate_common.h           |   1 +
 inmates/lib/riscv/Makefile                    |  46 +
 inmates/lib/riscv/Makefile.lib                |  64 ++
 inmates/lib/riscv/header.S                    |  76 ++
 inmates/lib/riscv/include/inmate.h            | 184 ++++
 inmates/lib/riscv/inmate.lds.S                |  77 ++
 inmates/lib/riscv/irq.c                       | 107 +++
 inmates/lib/riscv/printk.c                    |  61 ++
 inmates/lib/riscv/setup.c                     |  45 +
 inmates/lib/riscv/uart.c                      |  47 +
 inmates/tools/riscv/Makefile                  |  19 +
 inmates/tools/riscv/linux-loader.c            |  25 +
 pyjailhouse/config_parser.py                  |  17 +-
 tools/jailhouse-config-check                  |   9 +-
 69 files changed, 5584 insertions(+), 139 deletions(-)
 create mode 100644 configs/riscv/dts/noelv-linux-inmate.dts
 create mode 100644 configs/riscv/dts/qemu-linux-inmate.dts
 create mode 100644 configs/riscv/noelv-linux-demo.c
 create mode 100644 configs/riscv/noelv-tiny-demo.c
 create mode 100644 configs/riscv/noelv.c
 create mode 100644 configs/riscv/qemu-linux-demo.c
 create mode 100644 configs/riscv/qemu-riscv64-tiny-demo.c
 create mode 100644 hypervisor/arch/riscv/exception.S
 create mode 100644 hypervisor/arch/riscv/include/asm/csr64.h
 create mode 100644 hypervisor/arch/riscv/include/asm/plic.h
 create mode 100644 hypervisor/arch/riscv/include/asm/sbi.h
 create mode 100644 hypervisor/arch/riscv/include/asm/setup.h
 create mode 100644 hypervisor/arch/riscv/plic.c
 create mode 100644 hypervisor/arch/riscv/traps.c
 create mode 100644 include/arch/riscv/asm/sbi_ecall.h
 create mode 100644 inmates/demos/riscv/timer-demo.c
 create mode 100644 inmates/demos/riscv/tiny-demo.c
 create mode 100644 inmates/lib/riscv/Makefile.lib
 create mode 100644 inmates/lib/riscv/header.S
 create mode 100644 inmates/lib/riscv/include/inmate.h
 create mode 100644 inmates/lib/riscv/inmate.lds.S
 create mode 100644 inmates/lib/riscv/irq.c
 create mode 100644 inmates/lib/riscv/printk.c
 create mode 100644 inmates/lib/riscv/setup.c
 create mode 100644 inmates/lib/riscv/uart.c
 create mode 100644 inmates/tools/riscv/linux-loader.c

--=20
2.36.1

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20220627132905.4338-1-ralf.ramsauer%40oth-regensburg.de.
