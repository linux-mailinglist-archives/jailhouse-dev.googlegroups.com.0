Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCNOWP5AKGQE7GFW5MQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A1A2577CB
	for <lists+jailhouse-dev@lfdr.de>; Mon, 31 Aug 2020 12:55:06 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id n11sf548798ljc.16
        for <lists+jailhouse-dev@lfdr.de>; Mon, 31 Aug 2020 03:55:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598871306; cv=pass;
        d=google.com; s=arc-20160816;
        b=DPqHyfeleyNjLL2iTqXqerkyGdSZSmQ2EKgr7K+5xL/u+uwuXSHHz1nR56UejJqO7t
         rOW4QkfQ4Uzt3gkLI8BQWrAW1pPx6spsK/wJiuHxtXGnNhKbHUCO6CLwPN2tNBBJ/nB0
         yrun0SeZE1Vv06r23OfPPqXJYCiyhJhHp9DfrwjhjVG8Ifp3LgArdq0X2d/KJ0fn4M7j
         QPq6vk3B32bY4GQ2eNl4RSW/ifpAHakPV40uRpyA4RQe+zhEloIPcEps4D/XN2aJJ7VX
         XO0EOPocGbU+F8itK8KWerWxYCz7/ZZlFJ/f4byXyVZS5t4A+7naApiLfMwFEgjqVjhX
         Shsg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:to:from:subject
         :sender:dkim-signature;
        bh=GVxwvP32EBxsCKU8ZhSFWm68eoRyCTMOeebiWS3N6Tw=;
        b=XtVf5Lja8Y587udaO8F30HqZxt3SbUPA2zdBKGdV8xV8sT1zXTP3yA7KSzsyWG3QUG
         lLUclsHB/0Uax4W23yAKhxcEgIaCBg0vKPOqjeBCHujEApi9NBtdv9zFT8SRl/F5cyhn
         YMw1xPlsTOuntu1idcVzxo7sIiP4Ox/B8WWvzdSnW8ltLLOjWK+dI9rzOO/xqu9z/5uk
         +ifTPnx1jqoIYHYYZQN9Qro5RAFp6KSkYikx54UjkeywA17bJS51cbRp/7/CSWSgrqDR
         V0GNmWQ3raZeezWzzGOfJ8aOb8tpRPXLT9vfNvbBiRKxLGXElEirqukWA+vFxTMtwIR5
         NNmg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=GVxwvP32EBxsCKU8ZhSFWm68eoRyCTMOeebiWS3N6Tw=;
        b=JOBWygKAIM26wO3qSUsvXVGnkPXTzeruz3sBiVapDbSqFansqXyUfBkTsDnhpOYa5s
         86jX9x7QguB678AIf/qSLay0izIKgSGs13jL7zm/wDNxm4W2gKYulIkKhgfyzKFuWupG
         fZkBKWMQZEq0qgYYiX8KSjqrfYeg7+sPBORKpKdlg+8x2pB4C1fkuXmTigjREsdrYbHl
         McwVC4eQre906qNpNTre3LvhovSbrQjEBkUPOt7qTBUlYVUQGfqAeGhKlAMeSUeuZoJ5
         3jqdjqZwglEq1U/MkMZDT0N+zrXg5qZe0KlSvdrjOQ8Kez/0UEe+wX6uICqiAftlsieO
         KN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=GVxwvP32EBxsCKU8ZhSFWm68eoRyCTMOeebiWS3N6Tw=;
        b=EmkWzX3Y0JhuHKNMsEXnL/9wdAeIXbnbIRzvQepDjUkmv0DKgHd1tRGmES7Hh//QFi
         h/ndw2ccb2tgxX2Ua6a4iabncUveENtUSVVuXxbPznbL5oRNN5xeIiWRJAT/1IM5Uzdq
         91OqUodnEjX3BINjgt19Jg5kpIkcf6PQN/LL+m3h8/pjKKe3eSn6Gqe1OMnxbhoOUPc9
         DNnnNW8TRMOTQFxFFoLLjG5n0Jd7JnYlBadYg0Y0AL/x1DTeK3TLJfusnnQLMEfOiyfn
         Sknn7a3N4tgaoNDgYN0Pvm8Hpi9k12HEr3pcw4JIDIIAZnC14VWQnZJKFfCFHq95OTEX
         8Xpg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530eRZOTD1lfGkllwlLxqpgFrk6XjrChLqa8r4YPmefmqkVfLbzN
	CTzg+iPKlS8YR5q40Ll4ZSI=
X-Google-Smtp-Source: ABdhPJzh4/glKqrRIM/5hFSWmG3KRGtwyiAa8OeH6fj4rDt/t9VJyQD2YcIOl1aiBhrChXqbMz/PDg==
X-Received: by 2002:a2e:9595:: with SMTP id w21mr424980ljh.334.1598871306269;
        Mon, 31 Aug 2020 03:55:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:1107:: with SMTP id l7ls1510037lfg.2.gmail; Mon, 31
 Aug 2020 03:55:05 -0700 (PDT)
X-Received: by 2002:a19:8856:: with SMTP id k83mr424765lfd.131.1598871305258;
        Mon, 31 Aug 2020 03:55:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598871305; cv=none;
        d=google.com; s=arc-20160816;
        b=TfWNVKpq+KwD4EmT3q3pfY6kUgdjLTfHebsPtRG42oNGK4R+b/NZdBrf4pBlPFw7oD
         xFHjKD1BtYtLMsneP95jX+1P11y0a5l4s9MCgxcQCaXV75eryBfHyKqDi+xEkPUmTWu8
         qh3Xh2dy95eBNwcUcFnXWweMo4X7DaZeExiprcSFv8WrRtGRMhxsVAL/THi8wQsVJX+A
         ogDCZjuWxREzcThr9iHpxb13LWOyzfS8AJtSrrBtgd6OkcKyrh9xi19C/AZAqZO0P3Jl
         6QLefhb/Xo4NgRSf7IZWc1RlDefpK3frZ61DqwBVjslWsShl7sApwsEUcUxrpED+i5ob
         qCkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject;
        bh=Y20LS4AcDYAikzv9CS1oXYUPKhzStSqWIDVaJva7fPQ=;
        b=axqdNTyLESSgrpvL2Fgt43D0Vu684PCA36Mw/daJKKlQEZxyLRtVVnWhNw/RJ0+R95
         W+QQgmukGBxN1IrgBidyK5vq7AcIf6JaXWifInp3Wz+9gRDJH+WHCwHS62vA5d+ukU+M
         eJ9XhjfBN1oAban17stuU3n8NkvXtVj/YuAoZf2KUZncH7T1Xm4axkw+kN7meuXxl59V
         /WlzCxQoX6tlUsy9yriEIsJa0ZoWeuGn0sEPKhh33YYkl+I5KX/HxyzfR3jEQAbq1GYd
         o2nGjGPZJuBM5p7wbOti+IREBCa3R/MhOVcy3yyTkKQPd/ZqGvNyKOxjnc9UIZrl2Ipb
         Ii7Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id w12si224763ljw.5.2020.08.31.03.55.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 Aug 2020 03:55:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 07VAt3aJ017446
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Aug 2020 12:55:03 +0200
Received: from [167.87.39.104] ([167.87.39.104])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07VAt3dC029333;
	Mon, 31 Aug 2020 12:55:03 +0200
Subject: Re: [jh-images][PATCH 5/5] rpi-firmware: Switch to overlay-based RAM
 reservation to support all variants
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com,
        =?UTF-8?B?SmFrdWIgTHXFvm7DvQ==?=
 <jakub@luzny.cz>
References: <cover.1598871229.git.jan.kiszka@siemens.com>
 <5e286f069b8aa2266915b28531e7e11d2cfa1069.1598871229.git.jan.kiszka@siemens.com>
Message-ID: <46dbf0c0-68a1-7a62-8cc2-13a5b95d449c@siemens.com>
Date: Mon, 31 Aug 2020 12:55:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <5e286f069b8aa2266915b28531e7e11d2cfa1069.1598871229.git.jan.kiszka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 31.08.20 12:53, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> This is needed to support latest changes in the Jailhouse configuration
> which moved the reservation area in the middle of the RAM. It also opens
> the door for supported the 2 and 4 GB models.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  images.list                                   |   2 +-
>  recipes-bsp/rpi-firmware/files/cmdline.txt    |   1 -
>  .../rpi-firmware/files/debian/cmdline.txt     |   1 +
>  .../files/{ => debian}/config.txt             |   1 +
>  .../files/debian/jailhouse-reservation.dts    |  21 ++
>  .../files/debian/rpi-firmware.install         |   8 +
>  recipes-bsp/rpi-firmware/files/rules          |   8 +
>  .../rpi-firmware/rpi-firmware_1.20200212.bb   |  24 +-
>  ...d-support-for-RPi4-with-more-than-1G.patch | 306 ++++++++++++++++++
>  recipes-jailhouse/jailhouse/jailhouse_0.12.bb |   1 +
>  10 files changed, 359 insertions(+), 14 deletions(-)
>  delete mode 100644 recipes-bsp/rpi-firmware/files/cmdline.txt
>  create mode 100644 recipes-bsp/rpi-firmware/files/debian/cmdline.txt
>  rename recipes-bsp/rpi-firmware/files/{ => debian}/config.txt (80%)
>  create mode 100644 recipes-bsp/rpi-firmware/files/debian/jailhouse-reservation.dts
>  create mode 100644 recipes-bsp/rpi-firmware/files/debian/rpi-firmware.install
>  create mode 100644 recipes-bsp/rpi-firmware/files/rules
>  create mode 100644 recipes-jailhouse/jailhouse/files/0001-configs-arm64-Add-support-for-RPi4-with-more-than-1G.patch
> 
> diff --git a/images.list b/images.list
> index 003fff9..ce93cbb 100644
> --- a/images.list
> +++ b/images.list
> @@ -7,5 +7,5 @@ espressobin	Marvell ESPRESSObin (1 GB edition)
>  macchiatobin	Marvell MACCHIATObin
>  hikey620	LeMaker HiKey (Kirin 620 SoC, 2 GB edition)
>  ultra96		Avnet Ultra96
> -rpi4		Raspberry Pi 4 (1 GB edition)
> +rpi4		Raspberry Pi 4 (1, 2, and 4 GB editions)
>  pine64-plus	Pine64+ (Allwinner A64, 2GB edition)
> diff --git a/recipes-bsp/rpi-firmware/files/cmdline.txt b/recipes-bsp/rpi-firmware/files/cmdline.txt
> deleted file mode 100644
> index 2126fb6..0000000
> --- a/recipes-bsp/rpi-firmware/files/cmdline.txt
> +++ /dev/null
> @@ -1 +0,0 @@
> -console=serial0,115200 root=/dev/mmcblk0p2 rootwait mem=768M
> diff --git a/recipes-bsp/rpi-firmware/files/debian/cmdline.txt b/recipes-bsp/rpi-firmware/files/debian/cmdline.txt
> new file mode 100644
> index 0000000..cafe0e1
> --- /dev/null
> +++ b/recipes-bsp/rpi-firmware/files/debian/cmdline.txt
> @@ -0,0 +1 @@
> +console=serial0,115200 root=/dev/mmcblk0p2 rootwait
> diff --git a/recipes-bsp/rpi-firmware/files/config.txt b/recipes-bsp/rpi-firmware/files/debian/config.txt
> similarity index 80%
> rename from recipes-bsp/rpi-firmware/files/config.txt
> rename to recipes-bsp/rpi-firmware/files/debian/config.txt
> index e66fa16..1eb3a1a 100644
> --- a/recipes-bsp/rpi-firmware/files/config.txt
> +++ b/recipes-bsp/rpi-firmware/files/debian/config.txt
> @@ -9,3 +9,4 @@ enable_uart=1
>  arm_64bit=1
>  enable_gic=1
>  armstub=bl31.bin
> +dtoverlay=jailhouse-reservation
> diff --git a/recipes-bsp/rpi-firmware/files/debian/jailhouse-reservation.dts b/recipes-bsp/rpi-firmware/files/debian/jailhouse-reservation.dts
> new file mode 100644
> index 0000000..546b817
> --- /dev/null
> +++ b/recipes-bsp/rpi-firmware/files/debian/jailhouse-reservation.dts
> @@ -0,0 +1,21 @@
> +/dts-v1/;
> +/plugin/;
> +/ {
> +	compatible = "brcm,bcm2835";
> +
> +	fragment@0 {
> +		target-path = "/";
> +		__overlay__ {
> +			reserved-memory {
> +				#address-cells = <2>;
> +				#size-cells = <1>;
> +				ranges;
> +
> +				jailhouse@20000000 {
> +					reg = <0 0x20000000 0x10000000>;
> +					no-map;
> +				};
> +			};
> +		};
> +	};
> +};
> diff --git a/recipes-bsp/rpi-firmware/files/debian/rpi-firmware.install b/recipes-bsp/rpi-firmware/files/debian/rpi-firmware.install
> new file mode 100644
> index 0000000..701a984
> --- /dev/null
> +++ b/recipes-bsp/rpi-firmware/files/debian/rpi-firmware.install
> @@ -0,0 +1,8 @@
> +boot/bootcode.bin	usr/lib/rpi-firmware/
> +boot/LICENCE.broadcom	usr/lib/rpi-firmware/
> +boot/*.dat		usr/lib/rpi-firmware/
> +boot/*.dtb		usr/lib/rpi-firmware/
> +boot/*.elf		usr/lib/rpi-firmware/
> +boot/overlays/*		usr/lib/rpi-firmware/overlays/
> +debian/cmdline.txt	usr/lib/rpi-firmware/
> +debian/config.txt	usr/lib/rpi-firmware/
> diff --git a/recipes-bsp/rpi-firmware/files/rules b/recipes-bsp/rpi-firmware/files/rules
> new file mode 100644
> index 0000000..7d78ea4
> --- /dev/null
> +++ b/recipes-bsp/rpi-firmware/files/rules
> @@ -0,0 +1,8 @@
> +#!/usr/bin/make -f
> +
> +override_dh_auto_build:
> +	dtc -O dtb -b 0 -@ debian/jailhouse-reservation.dts \
> +	    -o boot/overlays/jailhouse-reservation.dtbo
> +
> +%:
> +	dh $@
> diff --git a/recipes-bsp/rpi-firmware/rpi-firmware_1.20200212.bb b/recipes-bsp/rpi-firmware/rpi-firmware_1.20200212.bb
> index 657ddd7..47e40b9 100644
> --- a/recipes-bsp/rpi-firmware/rpi-firmware_1.20200212.bb
> +++ b/recipes-bsp/rpi-firmware/rpi-firmware_1.20200212.bb
> @@ -9,21 +9,21 @@
>  # SPDX-License-Identifier: MIT
>  #
>  
> -inherit dpkg-raw
> +inherit dpkg
>  
>  SRC_URI = " \
>      https://github.com/raspberrypi/firmware/archive/${PV}.tar.gz;downloadfilename=${PN}-${PV}.tar.gz \
> -    file://cmdline.txt \
> -    file://config.txt"
> +    file://debian \
> +    file://rules"
>  SRC_URI[sha256sum] = "e3b0577beb62d886a45016447bdf8c2d57b794d3d71b502868b16ba82ff8fe43"
>  
> -do_install() {
> -    install -v -d ${D}/usr/lib/rpi-firmware/overlays
> -    install -v -m 644 ${WORKDIR}/firmware-${PV}/boot/bootcode.bin ${D}/usr/lib/rpi-firmware/
> -    install -v -m 644 ${WORKDIR}/firmware-${PV}/boot/LICENCE.broadcom ${D}/usr/lib/rpi-firmware/
> -    install -v -m 644 ${WORKDIR}/firmware-${PV}/boot/*.dat ${D}/usr/lib/rpi-firmware/
> -    install -v -m 644 ${WORKDIR}/firmware-${PV}/boot/*.dtb ${D}/usr/lib/rpi-firmware/
> -    install -v -m 644 ${WORKDIR}/firmware-${PV}/boot/*.elf ${D}/usr/lib/rpi-firmware/
> -    install -v -m 644 ${WORKDIR}/firmware-${PV}/boot/overlays/* ${D}/usr/lib/rpi-firmware/overlays/
> -    install -v -m 644 ${WORKDIR}/*.txt ${D}/usr/lib/rpi-firmware/
> +S = "${WORKDIR}/firmware-${PV}"
> +
> +DEBIAN_BUILD_DEPENDS = "device-tree-compiler"
> +
> +do_prepare_build[cleandirs] += "${S}/debian"
> +do_prepare_build() {
> +    cp -r ${WORKDIR}/debian ${S}
> +
> +    deb_debianize
>  }
> diff --git a/recipes-jailhouse/jailhouse/files/0001-configs-arm64-Add-support-for-RPi4-with-more-than-1G.patch b/recipes-jailhouse/jailhouse/files/0001-configs-arm64-Add-support-for-RPi4-with-more-than-1G.patch
> new file mode 100644
> index 0000000..96d0e83
> --- /dev/null
> +++ b/recipes-jailhouse/jailhouse/files/0001-configs-arm64-Add-support-for-RPi4-with-more-than-1G.patch
> @@ -0,0 +1,306 @@
> +From 7bcab7c38b2c853ec068b35d61205ef660fceaac Mon Sep 17 00:00:00 2001
> +From: Jakub Luzny <jakub@luzny.cz>
> +Date: Wed, 26 Aug 2020 18:16:42 +0200
> +Subject: [PATCH 1/2] configs: arm64: Add support for RPi4 with more than 1G of
> + memory
> +
> +Add the required memory regions to support 2G, 4G and 8G RAM variants
> +of the Raspberry Pi 4. Tested on all the bigger variants, not on 1G, as I don't
> +have one on hand and it's not available anymore.
> +
> +Also moved the memory used by Jailhouse for the hypervisor and cells from
> +0x30000000 to 0x20000000 to avoid conflict with GPU memory. That is fine for
> +gpu_mem setting of up to 256. The memory is supposed to be reserved using
> +reserved-memory node in the device tree.
> +
> +To support variants with >2G RAM, the PCI MMIO config space was moved into the
> +ARM Local Peripherals address range, into free space behind the GIC.
> +
> +Signed-off-by: Jakub Luzny <jakub@luzny.cz>
> +Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> +---
> + configs/arm64/dts/inmate-rpi4.dts |  2 +-
> + configs/arm64/rpi4-inmate-demo.c  | 22 ++++++------
> + configs/arm64/rpi4-linux-demo.c   | 28 ++++++++--------
> + configs/arm64/rpi4.c              | 56 +++++++++++++++++++++----------
> + 4 files changed, 65 insertions(+), 43 deletions(-)
> +
> +diff --git a/configs/arm64/dts/inmate-rpi4.dts b/configs/arm64/dts/inmate-rpi4.dts
> +index 52fd3ac2..ac6d4f58 100644
> +--- a/configs/arm64/dts/inmate-rpi4.dts
> ++++ b/configs/arm64/dts/inmate-rpi4.dts
> +@@ -96,7 +96,7 @@
> + 				<0 0 0 2 &gic GIC_SPI 154 IRQ_TYPE_EDGE_RISING>,
> + 				<0 0 0 3 &gic GIC_SPI 155 IRQ_TYPE_EDGE_RISING>,
> + 				<0 0 0 4 &gic GIC_SPI 156 IRQ_TYPE_EDGE_RISING>;
> +-		reg = <0x0 0xe0000000 0x0 0x100000>;
> ++		reg = <0x0 0xff900000 0x0 0x100000>;
> + 		ranges =
> + 			<0x02000000 0x00 0x10000000 0x0 0x10000000 0x00 0x10000>;
> + 	};
> +diff --git a/configs/arm64/rpi4-inmate-demo.c b/configs/arm64/rpi4-inmate-demo.c
> +index 62442e7c..09dfc1f0 100644
> +--- a/configs/arm64/rpi4-inmate-demo.c
> ++++ b/configs/arm64/rpi4-inmate-demo.c
> +@@ -51,34 +51,34 @@ struct {
> + 	.mem_regions = {
> + 		/* IVSHMEM shared memory regions (demo) */
> + 		{
> +-			.phys_start = 0x3faf0000,
> +-			.virt_start = 0x3faf0000,
> ++			.phys_start = 0x2faf0000,
> ++			.virt_start = 0x2faf0000,
> + 			.size = 0x1000,
> + 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> + 		},
> + 		{
> +-			.phys_start = 0x3faf1000,
> +-			.virt_start = 0x3faf1000,
> ++			.phys_start = 0x2faf1000,
> ++			.virt_start = 0x2faf1000,
> + 			.size = 0x9000,
> + 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> + 				JAILHOUSE_MEM_ROOTSHARED,
> + 		},
> + 		{
> +-			.phys_start = 0x3fafa000,
> +-			.virt_start = 0x3fafa000,
> ++			.phys_start = 0x2fafa000,
> ++			.virt_start = 0x2fafa000,
> + 			.size = 0x2000,
> + 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> + 		},
> + 		{
> +-			.phys_start = 0x3fafc000,
> +-			.virt_start = 0x3fafc000,
> ++			.phys_start = 0x2fafc000,
> ++			.virt_start = 0x2fafc000,
> + 			.size = 0x2000,
> + 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> + 				JAILHOUSE_MEM_ROOTSHARED,
> + 		},
> + 		{
> +-			.phys_start = 0x3fafe000,
> +-			.virt_start = 0x3fafe000,
> ++			.phys_start = 0x2fafe000,
> ++			.virt_start = 0x2fafe000,
> + 			.size = 0x2000,
> + 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> + 		},
> +@@ -91,7 +91,7 @@ struct {
> + 				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_ROOTSHARED,
> + 		},
> + 		/* RAM */ {
> +-			.phys_start = 0x3fa00000,
> ++			.phys_start = 0x2fa00000,
> + 			.virt_start = 0,
> + 			.size = 0x00010000,
> + 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> +diff --git a/configs/arm64/rpi4-linux-demo.c b/configs/arm64/rpi4-linux-demo.c
> +index 9e7fad26..cf36fa22 100644
> +--- a/configs/arm64/rpi4-linux-demo.c
> ++++ b/configs/arm64/rpi4-linux-demo.c
> +@@ -52,39 +52,39 @@ struct {
> + 	.mem_regions = {
> + 		/* IVSHMEM shared memory regions (demo) */
> + 		{
> +-			.phys_start = 0x3faf0000,
> +-			.virt_start = 0x3faf0000,
> ++			.phys_start = 0x2faf0000,
> ++			.virt_start = 0x2faf0000,
> + 			.size = 0x1000,
> + 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> + 		},
> + 		{
> +-			.phys_start = 0x3faf1000,
> +-			.virt_start = 0x3faf1000,
> ++			.phys_start = 0x2faf1000,
> ++			.virt_start = 0x2faf1000,
> + 			.size = 0x9000,
> + 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> + 				JAILHOUSE_MEM_ROOTSHARED,
> + 		},
> + 		{
> +-			.phys_start = 0x3fafa000,
> +-			.virt_start = 0x3fafa000,
> ++			.phys_start = 0x2fafa000,
> ++			.virt_start = 0x2fafa000,
> + 			.size = 0x2000,
> + 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> + 		},
> + 		{
> +-			.phys_start = 0x3fafc000,
> +-			.virt_start = 0x3fafc000,
> ++			.phys_start = 0x2fafc000,
> ++			.virt_start = 0x2fafc000,
> + 			.size = 0x2000,
> + 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
> + 		},
> + 		{
> +-			.phys_start = 0x3fafe000,
> +-			.virt_start = 0x3fafe000,
> ++			.phys_start = 0x2fafe000,
> ++			.virt_start = 0x2fafe000,
> + 			.size = 0x2000,
> + 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> + 				JAILHOUSE_MEM_ROOTSHARED,
> + 		},
> + 		/* IVSHMEM shared memory region */
> +-		JAILHOUSE_SHMEM_NET_REGIONS(0x3fb00000, 1),
> ++		JAILHOUSE_SHMEM_NET_REGIONS(0x2fb00000, 1),
> + 		/* UART */ {
> + 			.phys_start = 0xfe215040,
> + 			.virt_start = 0xfe215040,
> +@@ -94,15 +94,15 @@ struct {
> + 				JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_ROOTSHARED,
> + 		},
> + 		/* RAM */ {
> +-			.phys_start = 0x3f900000,
> ++			.phys_start = 0x2f900000,
> + 			.virt_start = 0,
> + 			.size = 0x10000,
> + 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> + 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
> + 		},
> + 		/* RAM */ {
> +-			.phys_start = 0x30000000,
> +-			.virt_start = 0x30000000,
> ++			.phys_start = 0x20000000,
> ++			.virt_start = 0x20000000,
> + 			.size = 0x8000000,
> + 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> + 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
> +diff --git a/configs/arm64/rpi4.c b/configs/arm64/rpi4.c
> +index 92463184..7b6a7a02 100644
> +--- a/configs/arm64/rpi4.c
> ++++ b/configs/arm64/rpi4.c
> +@@ -1,7 +1,7 @@
> + /*
> +  * Jailhouse, a Linux-based partitioning hypervisor
> +  *
> +- * Test configuration for Raspberry Pi 4 (32-bit, quad-core Cortex-A72, 1GB RAM)
> ++ * Test configuration for Raspberry Pi 4 (quad-core Cortex-A72, 1GB, 2GB, 4GB or 8GB RAM)
> +  *
> +  * Copyright (c) Siemens AG, 2020
> +  *
> +@@ -10,6 +10,8 @@
> +  *
> +  * This work is licensed under the terms of the GNU GPL, version 2.  See
> +  * the COPYING file in the top-level directory.
> ++ *
> ++ * Reservation via device tree: reg = <0x0 0x20000000 0x10000000>;
> +  */
> + 
> + #include <jailhouse/types.h>
> +@@ -18,7 +20,7 @@
> + struct {
> + 	struct jailhouse_system header;
> + 	__u64 cpus[1];
> +-	struct jailhouse_memory mem_regions[12];
> ++	struct jailhouse_memory mem_regions[14];
> + 	struct jailhouse_irqchip irqchips[2];
> + 	struct jailhouse_pci_device pci_devices[2];
> + } __attribute__((packed)) config = {
> +@@ -27,7 +29,7 @@ struct {
> + 		.revision = JAILHOUSE_CONFIG_REVISION,
> + 		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
> + 		.hypervisor_memory = {
> +-			.phys_start = 0x3fc00000,
> ++			.phys_start = 0x2fc00000,
> + 			.size       = 0x00400000,
> + 		},
> + 		.debug_console = {
> +@@ -38,7 +40,7 @@ struct {
> + 				 JAILHOUSE_CON_REGDIST_4,
> + 		},
> + 		.platform_info = {
> +-			.pci_mmconfig_base = 0xe0000000,
> ++			.pci_mmconfig_base = 0xff900000,
> + 			.pci_mmconfig_end_bus = 0,
> + 			.pci_is_virtual = 1,
> + 			.pci_domain = 1,
> +@@ -70,37 +72,37 @@ struct {
> + 	.mem_regions = {
> + 		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
> + 		{
> +-			.phys_start = 0x3faf0000,
> +-			.virt_start = 0x3faf0000,
> ++			.phys_start = 0x2faf0000,
> ++			.virt_start = 0x2faf0000,
> + 			.size = 0x1000,
> + 			.flags = JAILHOUSE_MEM_READ,
> + 		},
> + 		{
> +-			.phys_start = 0x3faf1000,
> +-			.virt_start = 0x3faf1000,
> ++			.phys_start = 0x2faf1000,
> ++			.virt_start = 0x2faf1000,
> + 			.size = 0x9000,
> + 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> + 		},
> + 		{
> +-			.phys_start = 0x3fafa000,
> +-			.virt_start = 0x3fafa000,
> ++			.phys_start = 0x2fafa000,
> ++			.virt_start = 0x2fafa000,
> + 			.size = 0x2000,
> + 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> + 		},
> + 		{
> +-			.phys_start = 0x3fafc000,
> +-			.virt_start = 0x3fafc000,
> ++			.phys_start = 0x2fafc000,
> ++			.virt_start = 0x2fafc000,
> + 			.size = 0x2000,
> + 			.flags = JAILHOUSE_MEM_READ,
> + 		},
> + 		{
> +-			.phys_start = 0x3fafe000,
> +-			.virt_start = 0x3fafe000,
> ++			.phys_start = 0x2fafe000,
> ++			.virt_start = 0x2fafe000,
> + 			.size = 0x2000,
> + 			.flags = JAILHOUSE_MEM_READ,
> + 		},
> + 		/* IVSHMEM shared memory regions for 00:01.0 (networking) */
> +-		JAILHOUSE_SHMEM_NET_REGIONS(0x3fb00000, 0),
> ++		JAILHOUSE_SHMEM_NET_REGIONS(0x2fb00000, 0),
> + 		/* MMIO 1 (permissive) */ {
> + 			.phys_start = 0xfd500000,
> + 			.virt_start = 0xfd500000,
> +@@ -115,10 +117,30 @@ struct {
> + 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> + 				JAILHOUSE_MEM_IO,
> + 		},
> +-		/* RAM */ {
> ++		/* RAM (0M-~762M) */ {
> + 			.phys_start = 0x0,
> + 			.virt_start = 0x0,
> +-			.size = 0x3fa10000,
> ++			.size = 0x2fa10000,
> ++			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> ++				JAILHOUSE_MEM_EXECUTE,
> ++		},
> ++
> ++		/* ~2M reserved for shared memory regions */
> ++
> ++		/* 4M reserved for the hypervisor */
> ++
> ++		/* RAM (768M-4032M) */ {
> ++			.phys_start = 0x30000000,
> ++			.virt_start = 0x30000000,
> ++			.size = 0xcc000000,
> ++			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> ++				JAILHOUSE_MEM_EXECUTE,
> ++		},
> ++
> ++		/* RAM (4096M-8192M) */ {
> ++			.phys_start = 0x100000000,
> ++			.virt_start = 0x100000000,
> ++			.size = 0x100000000,
> + 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> + 				JAILHOUSE_MEM_EXECUTE,
> + 		},
> +-- 
> +2.26.2
> +
> diff --git a/recipes-jailhouse/jailhouse/jailhouse_0.12.bb b/recipes-jailhouse/jailhouse/jailhouse_0.12.bb
> index 67df3fa..c0b5da3 100644
> --- a/recipes-jailhouse/jailhouse/jailhouse_0.12.bb
> +++ b/recipes-jailhouse/jailhouse/jailhouse_0.12.bb
> @@ -17,6 +17,7 @@ SRC_URI += " \
>      file://0002-configs-arm64-Add-inmate-demo-for-pine64-plus-board.patch \
>      file://0003-configs-arm64-Add-Linux-demo-for-pine64-plus.patch \
>      file://0001-inmates-x86-Add-LED-blinking-support-to-apic-demo.patch \
> +    file://0001-configs-arm64-Add-support-for-RPi4-with-more-than-1G.patch \
>      file://0002-arm-common-gicv2-Fix-byte-access-to-ITARGETR.patch \
>      "
>  
> 

Jakub, could you help with validating this? I don't have RPi4 variants
with 2 or 4 GB in reach ATM.

Thanks,
Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/46dbf0c0-68a1-7a62-8cc2-13a5b95d449c%40siemens.com.
