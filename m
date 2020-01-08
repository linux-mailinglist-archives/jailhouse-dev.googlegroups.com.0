Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBQHV23YAKGQEA7A4VIY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33b.google.com (mail-ot1-x33b.google.com [IPv6:2607:f8b0:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 078C713402F
	for <lists+jailhouse-dev@lfdr.de>; Wed,  8 Jan 2020 12:19:30 +0100 (CET)
Received: by mail-ot1-x33b.google.com with SMTP id z3sf1480979oto.22
        for <lists+jailhouse-dev@lfdr.de>; Wed, 08 Jan 2020 03:19:29 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578482369; cv=pass;
        d=google.com; s=arc-20160816;
        b=sg/h21wfMC+Ql0Fp0t7mseYkMeZqvP4bWJyakIrZN+gS6dp10trCqNvBeg6+tEL92h
         2vyc76hO7mU5K9d1GRrupnH0c8bh+bFJX6cbVtwOU4NrhA3xCwzpaLUS+LcOIHyp9+FF
         f0xhZXOTT4yvnN8LYzp0P3YuhfkOXAsWLfpG6ehC2bjsz7tVO4+SNnCuo2N76nlnpgiC
         AgX5IaVLS5Nkdo3YFk3oktvXUYtFj9n5pTXjyrhKfMEs5DfaJDoLyUYs8I31GSE6mOQp
         XtuoeyEsKkzwERX+dufIZW0wvRnw6F6rLrQoG07mV7hJhdDOG7W64QYRm3nl2gwF/rWW
         0W2Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=Xl8Ep5LkGJ7J5n6KhdnuHsKFvZfZims7dvQH58ou2aE=;
        b=ZNFPGDuyKTmo3xQKwTLPnnSb/jBb9Fo5qVz1wsHB1pzXkDRoP5RXJ7F+FsyN48sSBF
         Dz+Ga1qmYaQeW5e+QjpJgNgFH2xd96kqpcxquE5Lz+Df9/dziEDxn90pTOHEiG5Ufq2u
         y/JvKSdhcZFG+sWMDrsLCHWtBf9mwNQdwl52rJfta/AnW7cGpB9DPC5xBLCs7fzmNm/5
         zTRlOSzKNzWXqEDWVE79q6mzveN7CyiCNVW9h6Rvx9GyRptBDnxFhLIgyMkzRnyWDpUS
         OlhPUS7BvBq9mx2ytUgNZh14HVQrXQoFsUvHWbvcm1XrawcQ5cJH303mt4ROP+Gs1eZd
         sJ6Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=AB74eFZj;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=Xl8Ep5LkGJ7J5n6KhdnuHsKFvZfZims7dvQH58ou2aE=;
        b=bIMVkm3IT51SzUSlj7qbnR82C2P+J2s8jbvxS0BACAT6FAize8SWuYSPcprtTwasIh
         +CWoboWaW3ZuHdMKZ1p+Nzy9TJaa2qh74dkwInwps5y3OYS6kbETbEFgRk+uijPc/Cag
         f6hYKqhGZZwffwDo5fzatGjHZ4TPn5Gn5elyBuonmeUUpDu+Tg60e/tyFlShgan5sb1B
         RgtU9XeKhrtzh2M8iV+Exw+ddhO8UxQVSr3Vwq6GXzp1nw/haX7uuGQdfxZql4QC0G5x
         8isq7bGGQrTZ5T6QR78SadmVNt3aE3CukOSMQHUHpfu6dNq5NW7Ozt1kAxgEiMNK3buU
         BWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Xl8Ep5LkGJ7J5n6KhdnuHsKFvZfZims7dvQH58ou2aE=;
        b=QGCQLQm8Toe3x4U2Ltsyc+QNLuhj1ssJsjE81PFw6lifwy3OQ5rntOs5vg/OPCn+Qu
         lRaKsaBlKS3d+sosxhVmhzKYdYpxCXpDqXdZ07jOuQ7K9TPf5yo4KAetujuL/VndemGQ
         GF5wS+yNW6QbyflyuqlYS6Z/49CdBMaa9tB9X1pbHoXoEVxYN+EIYa3FoZwhBeoEr8bF
         FFLZvaMsHMQjnsbSUHhV584WwoLDCv82s2qpgPreVw04o9De0EID4eXvWASEyZaSIkSi
         YRrcC6JHVOONHVawW4dWZfBDNqr7XnECdBM4eBd+skGAr9bXhnvqJNWwjtXhp7MBELp5
         3xBw==
X-Gm-Message-State: APjAAAWimAgweKFT5IZTS2W2Izr+Qv3OKZH8aQtcsdCeqOrtcdQYyiRi
	qNuohkrFNouS3AVoRMxZ6Zw=
X-Google-Smtp-Source: APXvYqyBpeea/NySoH9P8GnN9AVxkt/ee/eGUCNRtKp4wuw4tJA65w2LHajBFBo2hSCFe/M6QPOd7g==
X-Received: by 2002:a05:6808:aba:: with SMTP id r26mr2511139oij.4.1578482368855;
        Wed, 08 Jan 2020 03:19:28 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:469a:: with SMTP id z26ls548807ote.8.gmail; Wed, 08 Jan
 2020 03:19:28 -0800 (PST)
X-Received: by 2002:a9d:74d8:: with SMTP id a24mr3947933otl.100.1578482368220;
        Wed, 08 Jan 2020 03:19:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578482368; cv=none;
        d=google.com; s=arc-20160816;
        b=mBS7LI5y4xLlBZMVMiJufaX3dbpGawyhehIjqkVwTQQ1RBd7PX0KSqF89akm/wDCBi
         hWMC/5DGH503SfZOU8RiSCdOsMJU66JcxcmO+lPF6meadQehhkTKX8JXRowsRIVPoaX2
         JRnEkIlgLNqB2nFNra46AqvylCygJoRXciDNFGkvGGggqK2Uq7whUcmJsBpJwNu18Gg8
         9N2Ivhul6hFh3q9ha9AhKVJGO8lvF28SNA6YahpK//ftv9+piDYP7fmcGpXD9PfsiWcf
         Y+GanKuK9TCNmfUsukyn1aITBoRzsklPTKRFBJeTUC5cz32zSi9///phyc5iClfLvnCW
         u0eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=bgsuWkO7ELQMwJgLyk/1Hc/lMwreGK7/I3X98G/aX1A=;
        b=UzKIhoX4SV5iHWrlrsf5yFsdL+89S9GaFsfTxMLpaUCRfHRX+KiqflnqVhKXg9c5tB
         pddF/hzknNaXf3jt0C5KgTK+df51oC3o85fcbwLxblBqqWZkO12GAXv1I2UYGLjun6nO
         Rbd5/H1Y8L5w4URnfWQejwUICejW0MVVC/BfM/ryEoQRgT6webOQM9K0dy0AqEffatfD
         Rsgh3+jxw22yU2QUtVNzl4s9vS2gacAWvzEpgVwKd4/0WLHWcKwd2bxjdPRSg0l83u7C
         cj2zhzI5SbHja48Q//LSqV0SMeFsdLaCqFingzBTWYTzHBVMLG7REi0XPPVNsWNHERqo
         Qnnw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=AB74eFZj;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id p5si179015oip.3.2020.01.08.03.19.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Jan 2020 03:19:28 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 008BJSDW061175;
	Wed, 8 Jan 2020 05:19:28 -0600
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 008BJSFB032056;
	Wed, 8 Jan 2020 05:19:28 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 8 Jan
 2020 05:19:27 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 8 Jan 2020 05:19:27 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 008BJPDq021746;
	Wed, 8 Jan 2020 05:19:26 -0600
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: <jan.kiszka@siemens.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [PATCH v2 0/5] Add support for Texas Instrument's Peripheral Virtualization Unit
Date: Wed, 8 Jan 2020 16:48:20 +0530
Message-ID: <20200108111825.14280-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=AB74eFZj;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted
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

This series adds support for TI PVU as an iommu unit.
PVU is a 2nd stage only IOMMU which provides realtime address translation.

J721e has 3 instances of PVU and all the DMA traffic can be routed via PVU
when running inside a virtual machine.

Changes from v1:
* New patch1 for avoiding warning when unmap is called from cell_destroy
* Split the patch affecting amd fields into separate one
* SMMU fixes are sent in another series

Nikhil Devshatwar (5):
  core: Update cell_state while destroying the cell
  configs: Introduce tipvu IOMMU specific fields in platform_data
  arm64: ti-pvu: Add support for ti-pvu iommu unit
  configs: arm64: k3-j721e-evm: Add PVU IOMMU devices in platform_data
  configs: arm64: k3-j721e-evm: Add stream ids for devices behind IOMMU

 configs/arm64/k3-j721e-evm-linux-demo.c       |   7 +
 configs/arm64/k3-j721e-evm.c                  |  36 ++
 hypervisor/arch/arm-common/include/asm/cell.h |   7 +
 .../arch/arm-common/include/asm/iommu.h       |   1 +
 .../arch/arm-common/include/asm/ti-pvu.h      | 129 ++++
 hypervisor/arch/arm-common/iommu.c            |   5 +-
 hypervisor/arch/arm64/Kbuild                  |   3 +-
 hypervisor/arch/arm64/ti-pvu.c                | 581 ++++++++++++++++++
 hypervisor/control.c                          |   2 +
 include/jailhouse/cell-config.h               |  17 +-
 10 files changed, 781 insertions(+), 7 deletions(-)
 create mode 100644 hypervisor/arch/arm-common/include/asm/ti-pvu.h
 create mode 100644 hypervisor/arch/arm64/ti-pvu.c

-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200108111825.14280-1-nikhil.nd%40ti.com.
