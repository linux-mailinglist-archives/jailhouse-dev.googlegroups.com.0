Return-Path: <jailhouse-dev+bncBCB7D7MXMMIJ7CFK5ICRUBDRVM2M6@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x340.google.com (mail-ot1-x340.google.com [IPv6:2607:f8b0:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 672768466F
	for <lists+jailhouse-dev@lfdr.de>; Wed,  7 Aug 2019 09:56:17 +0200 (CEST)
Received: by mail-ot1-x340.google.com with SMTP id 20sf9683826oty.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 07 Aug 2019 00:56:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1565164576; cv=pass;
        d=google.com; s=arc-20160816;
        b=JBjzLpscxrFXYoVNQwf0Yznw3S9Pi3rqxaZbsjBhlTzzdQKkynrsyHsgMXvDPz2B0N
         k4ht0DJ0FDS3E9YDQaMCr5ZNXwDRQ3RJ+a4V+ok4fApmXiq7qpKVu3oWZMO48fLcSibf
         1ceAiKprQNycdYrUUd5csU4GFuS0B8/zL17EM4jLFo4RzPo17QuQKaw8fpsslHzK06qj
         D0qfxV67tSFvXb8n05iPDiUpHDKHacRux2yM6+yv6i3ZWykQWldVUhiWIGzeluHlKFTv
         GvmAXi9LNu2LEpmBvkSxXI5c8MdNt6y8pFzcZYF6UC40+0RTGgQw8bmyttR0LecbWxLS
         jnZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=2A8aGwpogCaAjD835zCDUumYlQcf5dkfLR3fuUvSBsY=;
        b=Dj3ega/8xbG3/KUGP7Pm6Txd0lcO5sQ+6AH4zJO/ZsVhmQtQnxthirwH118xSkWoKZ
         LI8g4/sASy6gc03Vbbp0ZnD401bqchlZPtPoVZnbpkou4+7QYqsvCP8OyvyCsP093h9q
         H7Ta4GQ3ZoROkl7p9xeqaouVqZB+o3dkH/SPl3uaMqZQD/c/LYLdIjliXZYwoVlKxuQu
         u/Qa4pASWJX5RXSOe6CJa+zkQr87myxD6x2JwK7MI4l7o5yQ+vhU2Jzuy7bc3cDvGHfH
         GkYCOrYlKJIGsDGQERYa82HF1ZQNrhlUZBWnp9xq0SXlC2DlMmabCD/LY+bet7W+vmBX
         y6qQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=KysvDWJB;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=2A8aGwpogCaAjD835zCDUumYlQcf5dkfLR3fuUvSBsY=;
        b=LavsEZDaeu7rUBSrZjnpzKvknMVKfru5dXytLsP/vYMwMfJdI22VmAk9f2Q+ype7yf
         D3k1bK/XzV8IXaIR5zp28tY3pcliu82rBfP6kKkf2C40Uk0BVbq3zu3+yK2hImNIbAt5
         PEkSUPP0smCHEl1xy4Jb1S9j6c7IjIj3UQuTXNwfslVaAx8ZheMXq2Q3f+I9myJaw96U
         W1xXG3U9svNXZyXP88XMb4FvyJCEmHUvdBIeMSDwDi2bChRx/MDB18QHEePpNMj2YUKW
         kzj0XgLNTyssgHK+cnxXs3HP3LRrAQBS8j8JjmACxDPRCoV+0OGqdfLa9CiAjIyf2OJ2
         +S8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2A8aGwpogCaAjD835zCDUumYlQcf5dkfLR3fuUvSBsY=;
        b=oVSrBJLz9DUJRWJvtrlfif1FxEqID9gKx1vX9juxgxVIK4qUwjHmhsjSHVNIE3NUd+
         II1WZ/SFHpJoqSXy3fF11lGgV2bpjpvjLnPopYWsTvnpCfqQler1mDR682I8qrA9Z3C4
         pGP0i8mCjhUXrdlb69qR2Tth/dEzdUC3eOP0PzNq4nXYwGUD29LeVh7FNX5otBPyOSH7
         ftGbD3+fQKTDV24MTw7uYinISQdLl0EKCC1OOZ0H6nWmo4WO+lytdSHjWLGt8Eq2uf2O
         gYobftW/+CgBoOdSXnZylYCkJ50HkHDvVpN+LnI3QJhIl8M/G6yP1YSzYDDUK/LS3CAd
         /8gA==
X-Gm-Message-State: APjAAAVB8+O52Mj/O78zc3WEq72lbqpsTEluFnnE28LTV823iKNMa4ql
	OWLf0+hx6C1Eh2fIAJn5qJA=
X-Google-Smtp-Source: APXvYqzzzIRxSOpPz0sor7zLPUafm5OcMStcvZAjMaikL30nPnH2BC9zwAa+X5vUpMzFFjBQbi+9Qw==
X-Received: by 2002:a5d:8c97:: with SMTP id g23mr7894326ion.250.1565164575827;
        Wed, 07 Aug 2019 00:56:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5e:8910:: with SMTP id k16ls2082861ioj.10.gmail; Wed, 07
 Aug 2019 00:56:15 -0700 (PDT)
X-Received: by 2002:a5d:9ec4:: with SMTP id a4mr7623200ioe.125.1565164575314;
        Wed, 07 Aug 2019 00:56:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565164575; cv=none;
        d=google.com; s=arc-20160816;
        b=cT9SOGF/hhw0TQJBd3i8cKIdD0EVehL8dW8jV0QXYM9j0r4DNRzd2QXwhERwvbEsfX
         aAr6zhaml/CG6jLRX50dcBOOiujieTJxQCfyG8cVKuuLpKDXS3wjB8vQ+stvtMR49+LD
         lcRtAmgoZx+U4w84MC3Lft9O/UWVbf04/ywuVeoWtDR9zCbvzz1rqHi7FV2ANrqCyWjA
         rDKBPlSC4jS54NbFVZMiAfIfp94Pj1gCYVripn7gMabyduVqFWwQi4tJOETwm9Ra2rWd
         ePsK9oKxG7cxMvwn+9JAnqeRuI9s4KKp0Ss6g1V1R8sdIqCxvpywQlSEoJO+89m45xKo
         D75g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=oERkDicNm1r40vVdiNilWcM5dRnUeK0mZ9TSVN31i+U=;
        b=tchUvjAtuqVOLFSqpZRmpct5aNN8EGanHw/Q3GnbRA1c94SQ3Qq2+Y0XFIEVA1/cr5
         4Ru/x1/8JIFmpR3cpZ7a/LeT3AWAUnLo/s24jIBoIYI7b4NKaagHcuGyGgUzRA6y/58F
         Qt2ThcGDQ+IslJ2oFhMI6oIeEPs+H8kMReCU0I2p5nqu8ricL2QO7oNAORrjYbxJIbU9
         iLOQJqpoOZb9B1kHuIZnyT5SeNaebPo09NYSJSojHJHriQiUq+7uW825OalNeDui1d2m
         nGPaSKF0AgZQCMfGIovagjqhtooJtr8lVQ/uyfCZIpE+MCyKRKs1w5ElB14OUbSPpZp7
         d5+g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=KysvDWJB;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id m3si3180158ioc.4.2019.08.07.00.56.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Aug 2019 00:56:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of lokeshvutla@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x777uEbt126293;
	Wed, 7 Aug 2019 02:56:14 -0500
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x777uEA0059441
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Aug 2019 02:56:14 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 02:56:13 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 7 Aug 2019 02:56:13 -0500
Received: from uda0131933.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x777uBmS128703;
	Wed, 7 Aug 2019 02:56:11 -0500
From: "'Lokesh Vutla' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: Jan Kiszka <jan.kiszka@siemens.com>,
        Jailhouse
	<jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Tero Kristo
	<t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        Nikhil Devshatwar
	<nikhil.nd@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v5 0/6] arm64: iommu: Add support for SMMUv3 stage 1 and 2 translations
Date: Wed, 7 Aug 2019 13:25:24 +0530
Message-ID: <20190807075530.30444-1-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190801112648.6569-1-lokeshvutla@ti.com>
References: <20190801112648.6569-1-lokeshvutla@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: lokeshvutla@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=KysvDWJB;       spf=pass
 (google.com: domain of lokeshvutla@ti.com designates 198.47.23.249 as
 permitted sender) smtp.mailfrom=lokeshvutla@ti.com;       dmarc=pass
 (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Lokesh Vutla <lokeshvutla@ti.com>
Reply-To: Lokesh Vutla <lokeshvutla@ti.com>
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

Limitations are mentioned in the 5th patch and work left in the 6th
patch.


Changes since v4:
- Start the IOMMU #define values with 1
- Dropped a redundant if check in iommu_count_units
- Added mmio_register_unmap in smmuv3_cell_exit

Lokesh Vutla (1):
  arm64: iommu: smmu-v3: Add support for smmu v3 configuration from
    config files

Nikhil Devshatwar (3):
  iommu: x86: Generalize iommu definition
  arm-common: Introduce iommu functionality
  core: Add stream id list in the cell config

Pratyush Yadav (2):
  arm64: iommu: smmu-v3: Add data structure initialization and stage 2
    for SMMUv3
  arm64: iommu: smmu-v3: Add support for stage 1 translations

 configs/x86/f2a88xm-hd3.c                     |    1 +
 configs/x86/qemu-x86.c                        |    1 +
 hypervisor/arch/arm-common/Kbuild             |    2 +-
 hypervisor/arch/arm-common/control.c          |    2 +
 hypervisor/arch/arm-common/include/asm/cell.h |    4 +
 .../arch/arm-common/include/asm/iommu.h       |   36 +
 hypervisor/arch/arm-common/iommu.c            |   44 +
 hypervisor/arch/arm-common/mmu_cell.c         |   20 +-
 hypervisor/arch/arm64/Kbuild                  |    2 +-
 hypervisor/arch/arm64/smmu-v3.c               | 1999 +++++++++++++++++
 hypervisor/arch/x86/amd_iommu.c               |    9 +-
 hypervisor/arch/x86/vtd.c                     |    2 +
 include/jailhouse/cell-config.h               |   23 +-
 pyjailhouse/sysfs_parser.py                   |    3 +
 tools/jailhouse-cell-linux                    |    5 +-
 tools/jailhouse-hardware-check                |    2 +-
 tools/root-cell-config.c.tmpl                 |    1 +
 17 files changed, 2142 insertions(+), 14 deletions(-)
 create mode 100644 hypervisor/arch/arm-common/include/asm/iommu.h
 create mode 100644 hypervisor/arch/arm-common/iommu.c
 create mode 100644 hypervisor/arch/arm64/smmu-v3.c

-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190807075530.30444-1-lokeshvutla%40ti.com.
