Return-Path: <jailhouse-dev+bncBCCMB6PY3AEBBUGX5XUAKGQEJBI4LSY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x53c.google.com (mail-pg1-x53c.google.com [IPv6:2607:f8b0:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCF35D1CF
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jul 2019 16:36:02 +0200 (CEST)
Received: by mail-pg1-x53c.google.com with SMTP id t2sf9708398pgs.21
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jul 2019 07:36:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562078160; cv=pass;
        d=google.com; s=arc-20160816;
        b=QElf3+VeygxwzzEHhsvWvaQC0rAqH8HDhdoLykuS1oNS69COyvMLSxl3IJfzvzu86k
         8cupmQpK1HbbJ+tP+nxlmdI0NYhqZYSePMOctaiq4v0kL1noEmxBf5SC7HLkHhrDpudB
         cr8u5n+fKdJkPHbfl4WAbS9GomDsNcMuuTFY3vqLGZYvA8VL7dKDzumy2XhVZJ4qHaHu
         1DN5gmLc5Qbml3CMiC0h0d2lhso5OqjHMrEcU6LjTcwOvLGaZEqmUb7r6tf0ePX0uHIq
         UCsLvA00AFOUR+NUsPNsSt0rHS3XRgxmL1DnQPcVV5CR11K02u7Y+HeDi9RqyzSSS5Dv
         rtQw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=LKbTn9FACRoECOGTby/sknQjqpkxD9mmqBUKpINolLk=;
        b=SYfKSacP/sZQbutayBRyudtN8tzrMY8Q5Cy7fvDQJWYi6CQKlOOvZb/o+tWe8v5QUD
         FoxKZR8G5dZlJmVudXyGm6UdwttpBQMA6nVb/CpuPE6+0p5w2feO940SWPsowhcHiBvg
         G9+eIDLDy9FLA0w9STRz0gB1FCwDNufONsoX/C0BLWQFxzGYOIzE4Y5fGFpCCvz9VSTd
         u1NtfgbZxpZd+o0AmfcGPKTNy+6EhVNzs2pL0TziD0TrEeZ8Rwpnz6lJqmtqXrdMhzeS
         zNYLAGxoGMzh/FHvEvetmkvTCOHJ8itkXX5oRZczSqFW5Sr9/wWC19bZsA9OzqjezTCP
         o6Gw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Zj9H6Gtk;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=LKbTn9FACRoECOGTby/sknQjqpkxD9mmqBUKpINolLk=;
        b=R5o+60onWLczuL19HaYHNlYYOwOXBn27MyAN9A2pCakgJF4BGKyGZtH7sfHn8+4BoL
         yIxjr20O9hSNq7dbM44cd5XXbIbjkw+NChGpoBdK/8XMo4ae7G8moCzKjikVa7Ka8ikX
         726rXV545QKrYdThdP06XsAmS6Yudm1UFhk0Mm+DjIxtY8n2oqZYLDSw12vbm+2MzxqF
         MFM6yCEZlttmNVshrEbvLdNve2q4bVINmW2A0IyCUiqqkRSrlyQOrc78Fh1AvWlT7Cht
         Q32GsAKxaZRU1lTmeLsLMh1yVb4zEgNHcmZtfre6I24infoB/dAyET+M3zKVCDt0Yr9A
         4gZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=LKbTn9FACRoECOGTby/sknQjqpkxD9mmqBUKpINolLk=;
        b=mHNDMX2nkRZQwo9a16gUm4rGgQBX2hcsB9+PI05MSiLWhL/bLKxFeSc600SWbP65kc
         XR/90StaslZPO1f83HugJedl7XXm28pm84tietZhJk37grSsJV14F69FRG5HxO2mP5ji
         CXoLsEwiIV6am59l+TgHWAB8Vfsk5+3tc25foCo3YvzRBDazszhxIgIVq9Vcw0OP94w7
         uwq6sD28EeHONUZS3jYm9NkRRedX0xTz+RMrRetrwXTKEemL/o+pp9yJ7MACVH17tsXi
         gmfssWWC0aVFtq/k1uHfAoWbfp8rZzTUd7dlJ+IiAtEW9gYN+SuCxJ9rZHPpAA1IIgyP
         sqbQ==
X-Gm-Message-State: APjAAAWcNIekUjhTHRCFNG0FacNSDUBx3d0qwqKhAtsllyeK+eg5GqXd
	VG56xRAAu5I6YRI4sxHaJws=
X-Google-Smtp-Source: APXvYqxnGSMaSF4LHfOh0FGpkrBTdgn0P8j9Y5VX9jxHZPkMvsyWg9KBVdKsrsBIp2sv7MmWwO3IBw==
X-Received: by 2002:a63:d4c:: with SMTP id 12mr31876709pgn.30.1562078160288;
        Tue, 02 Jul 2019 07:36:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:a9:: with SMTP id a38ls4338546pla.5.gmail; Tue, 02
 Jul 2019 07:35:59 -0700 (PDT)
X-Received: by 2002:a17:902:fe10:: with SMTP id g16mr36584960plj.44.1562078159822;
        Tue, 02 Jul 2019 07:35:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562078159; cv=none;
        d=google.com; s=arc-20160816;
        b=Gw7PnPQF6ycIf10/sZ5lYLF0heigvxDZoWY5vvkDAGQQg4LQbwz8FZlrud/ehI0deh
         AfaJin/sxpdA7UyriC2Dle64knyJ16KDQsSw1aSj7+aK9TAa3E5oClMRw65FSAMD74+S
         rMVFkB6UmB6k1cuAqVaaDi9e/jIiKhoQlHEeinifc+uextpffN7nv7vHLJOhD7nOU+gL
         DoOgHKE9+8VWNiW/uu2tEr1rCYJPkMsGNCoOPqQIwDNXulBVNpwd42RuouKmZ4D/jUbC
         pk2/X3NVQvxUEVBojEBZFDZpgiWqmN7Q4Rq3t2/yJ/9kJI172xQ3xT3aQgmYzsxqbmtI
         deag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=cTHKbNa78iOay2LVP1lzDK6+lf+UN9NYEX2GnFrenz0=;
        b=KuvdULMAh0fFJ5xEFVpC63TH2igL2Rci+TlvbxlUx2CPZeFrjV9KRB47hgJgavtjgO
         Hy+lA1td52jEPvXjbleJZe8k4MXDj04PuRiCyA1+xVLYFsdbC0ZeeG7SoyNCkdLhdEiC
         fmD+jXMvebAIDgv02CeYTvqQFZiRwDD6Eny0w2m17ACrTGPNvGGCzqEX/tOdX8uDL7UJ
         TRfab5swFUyPiMqzJW/ETknU3C3b/SgSc97lqeLYQUmSicjERunhOn3ju1pYEbBb1QSb
         MZdfxExkJ7Z7wJzQIpu1WqHWblGgkkcF9JWgClK3XuLkLrRpHFNqtlTHfIALD7Bvgpkf
         MZFA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Zj9H6Gtk;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id n16si630524pgv.4.2019.07.02.07.35.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 07:35:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x62EZx5m086456;
	Tue, 2 Jul 2019 09:35:59 -0500
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x62EZxpi129930
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 2 Jul 2019 09:35:59 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 2 Jul
 2019 09:35:58 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 2 Jul 2019 09:35:58 -0500
Received: from pratyush-laptop.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x62EZtHW022917;
	Tue, 2 Jul 2019 09:35:56 -0500
From: "'Pratyush Yadav' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@siemens.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        William
 Mills <wmills@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
        Pratyush Yadav
	<p-yadav1@ti.com>
Subject: [PATCH 0/6] arm64: iommu: Add support for SMMUv3 stage 1 and 2
Date: Tue, 2 Jul 2019 20:06:01 +0530
Message-ID: <20190702143607.16525-1-p-yadav1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: p-yadav1@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=Zj9H6Gtk;       spf=pass
 (google.com: domain of p-yadav1@ti.com designates 198.47.23.249 as permitted
 sender) smtp.mailfrom=p-yadav1@ti.com;       dmarc=pass (p=QUARANTINE sp=NONE
 dis=NONE) header.from=ti.com
X-Original-From: Pratyush Yadav <p-yadav1@ti.com>
Reply-To: Pratyush Yadav <p-yadav1@ti.com>
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

Hi,

This series adds support for SMMUv3. Stream IDs have been added to the
cell config and they need to be specified in the config before a cell
can use a stream.

The SMMU driver exposes an emulated SMMU to the guests cells by trapping
access to the MMIO registers. This is not emulation in the sense that we
fully emulate the device top to bottom. The emulation is used to provide an
interface to the SMMU that the hypervisor can control to make sure the
inmates are not doing anything they should not. The actual translations
are done by hardware.

The IOMMU definition has been generalised. The AMD and Intel IOMMU
drivers have been updated to use this definition. I am not very familiar
with these drivers, so please do take a look to make sure the changes
are correct and don't create any unwanted problems.

Limitations and work left are mentioned in the 6th patch.

Lokesh Vutla (1):
  arm64: iommu: smmu-v3: Add support for smmu v3 configuration from
    config files

Nikhil Devshatwar (3):
  iommu: x86: Generalize iommu definition
  arm-common: Introduce iommu functionality
  core: Add stream id list in the cell config

Pratyush Yadav (2):
  core: Move unit initialization after memory initialization
  arm64: iommu: smmu-v3: Add support for stage 1 and 2 translations

 configs/x86/f2a88xm-hd3.c                     |   13 +-
 configs/x86/qemu-x86.c                        |    5 +-
 hypervisor/arch/arm-common/Kbuild             |    2 +-
 hypervisor/arch/arm-common/control.c          |    6 +
 hypervisor/arch/arm-common/include/asm/cell.h |    2 +
 .../arch/arm-common/include/asm/iommu.h       |   26 +
 hypervisor/arch/arm-common/iommu.c            |   32 +
 hypervisor/arch/arm-common/mmu_cell.c         |   12 +
 hypervisor/arch/arm64/Kbuild                  |    2 +-
 hypervisor/arch/arm64/smmu-v3.c               | 1988 +++++++++++++++++
 hypervisor/arch/x86/amd_iommu.c               |   52 +-
 hypervisor/arch/x86/include/asm/iommu.h       |    2 -
 hypervisor/arch/x86/iommu.c                   |   10 -
 hypervisor/arch/x86/vtd.c                     |   17 +-
 hypervisor/include/jailhouse/entry.h          |    1 +
 hypervisor/setup.c                            |   14 +-
 include/jailhouse/cell-config.h               |   43 +-
 tools/jailhouse-cell-linux                    |    4 +-
 tools/jailhouse-hardware-check                |    2 +-
 19 files changed, 2163 insertions(+), 70 deletions(-)
 create mode 100644 hypervisor/arch/arm-common/include/asm/iommu.h
 create mode 100644 hypervisor/arch/arm-common/iommu.c
 create mode 100644 hypervisor/arch/arm64/smmu-v3.c

-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190702143607.16525-1-p-yadav1%40ti.com.
For more options, visit https://groups.google.com/d/optout.
