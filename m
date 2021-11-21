Return-Path: <jailhouse-dev+bncBDH5LQU54QDBBEVZ5OGAMGQE2LXUSGY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x740.google.com (mail-qk1-x740.google.com [IPv6:2607:f8b0:4864:20::740])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D80458742
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Nov 2021 00:56:04 +0100 (CET)
Received: by mail-qk1-x740.google.com with SMTP id a10-20020a05620a066a00b0046742e40049sf13514948qkh.14
        for <lists+jailhouse-dev@lfdr.de>; Sun, 21 Nov 2021 15:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=q826lRm1swLeysn7ZNK0aNgJV0rwb8e3tS6Ck5PZeHU=;
        b=XB3hXL1RNbzhd4m0+2yaUtigjLJlStBnFw1+B12s/Wg3/QLRSV3mlsPpAFnwIeKdLN
         KWEQHZfnnb9gsxHNHxxoYSXCOSVqrd2S1w/uoN5xTCWCs3ZmhlVe9lvNYsFg37ZmudF4
         nrx2QbGFrRmqQ5pZNXGeJ9reia/tGVnJHJ3+I4HuKjwGlQOm4UUrA7CxGY1C4xU2LpTL
         b1/8hyKgzbdqXFURtx6oKSZsf2lUKS/Fj4Q+/pu3rLEQaQ5ra71nOyf5EGN61DdKjTFn
         xXdjE+UOFdDW8p85y/jbYQxJzuUgIpzKKSMt+IYBKHuRkXqp0c3ay5pAEdy7bN8qAOmo
         vpbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=q826lRm1swLeysn7ZNK0aNgJV0rwb8e3tS6Ck5PZeHU=;
        b=aX0jTPvFq9Vjrxn6Qj38SEfJsZa7+WmwEYMmVtCnn+BKrMWKemFhdG1Y7aMdJbl5MU
         lNMKCXpbUGfyiAVHGcAa8kPxnDWJHfJUCwSexc71EFvCxNSwN8Z++nqG6OKHH/HsD8kG
         zxDFTE7BRSz9iFP02hX+9jsazfm8o43yZU2vku4/FnTV1D7Zw7rEBDdGF3tldPuhKQdI
         OBWOvDrO0CPia6jz3qWnGw5ehJn1COAwZBPiO0Vfwv+DdFOC7MufwH5JFBY+Xdg0vSK5
         /HNd3ILVxc/zao392atxEEbOejPGgFKXuQkp78rgDIGSsmJcjUA4/GM7Dl0c2DDRNzd5
         qHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=q826lRm1swLeysn7ZNK0aNgJV0rwb8e3tS6Ck5PZeHU=;
        b=tu/n54BM1YpjMS8Ehwaa/zAxa+N12suBy1CMpbtdu0VcOWGRPYmshA2EcTLzlBlLJu
         wK1p2cRn+Rfm+Z0oCe5YKOBJ9ynJc7KtzamBSvZA0Dyz24vpEQ602+DrQjHs3/qPEfaq
         1PV9JQ4rlrTeIYx1YFlvqXV9T8fP79omMlanAH4wNVY1XaKdt2GdXA88x0ypP32UpxaN
         aYAryeQlwX7/AgNN4IHemGiAioNcqRG8pRe4PYS9EdKLcSgGVzVwkJ3jiwkGSyA4hSIb
         NU5pVueBBhuidnuNnfV66CoxgjZq7Nm4uS8kmjlNodMakKZDHb+vY8XJSQrQa+EnbwA4
         ZESg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5332bEUo2I7kQYNsBPBQurAt/tiXKmKSZG2bVc7sISx+bUpPrRB3
	RtaqPKf0FJHvGPb2tO1uzyg=
X-Google-Smtp-Source: ABdhPJy/mLS+rJB9/AbM3fB+RFTmyjTGxM6h1VH0cfx1sxJkqqTIsXOax0TcZhsteYTY/Z1ANxXNJA==
X-Received: by 2002:a0c:eb49:: with SMTP id c9mr94548451qvq.30.1637538962989;
        Sun, 21 Nov 2021 15:56:02 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:40cc:: with SMTP id g12ls3201613qko.4.gmail; Sun,
 21 Nov 2021 15:56:02 -0800 (PST)
X-Received: by 2002:ae9:de02:: with SMTP id s2mr46315342qkf.215.1637538962173;
        Sun, 21 Nov 2021 15:56:02 -0800 (PST)
Date: Sun, 21 Nov 2021 15:56:01 -0800 (PST)
From: "luigi.d...@gmail.com" <luigi.desimone3@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <bb08169b-1e0b-44d4-8c45-69c0f349e15dn@googlegroups.com>
In-Reply-To: <0a01dd4ca08e9e2163c76bf043a06e8a2fa88bec.1637430993.git.jan.kiszka@web.de>
References: <cover.1637430993.git.jan.kiszka@web.de>
 <0a01dd4ca08e9e2163c76bf043a06e8a2fa88bec.1637430993.git.jan.kiszka@web.de>
Subject: Re: [jh-images][PATCH 4/4] Add kas menu support
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1682_56790158.1637538961561"
X-Original-Sender: luigi.desimone3@gmail.com
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

------=_Part_1682_56790158.1637538961561
Content-Type: multipart/alternative; 
	boundary="----=_Part_1683_554629079.1637538961561"

------=_Part_1683_554629079.1637538961561
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Jan,

I've tried to build RaspPI4 with next branch.

This is the log error for=20
./build/tmp/work/jailhouse-demo-arm64/isar-bootstrap-target/1.0-r0/rootfs/d=
ebootstrap/debootstrap.log:

Resolving deb.debian.org (deb.debian.org)... 146.75.62.132,=20
2a04:4e42:7f::644
Connecting to deb.debian.org (deb.debian.org)|146.75.62.132|:80...=20
connected.
HTTP request sent, awaiting response... 200 OK
Length: 87944 (86K) [application/x-debian-package]
Saving to:=20
=E2=80=98/build/tmp/work/jailhouse-demo-arm64/isar-bootstrap-target/1.0-r0/=
rootfs//var/cache/apt/archives/partial/zlib1g_1%3a1.2.11.dfsg-2_arm64.deb=
=E2=80=99

     0K .......... .......... .......... .......... .......... 58% 7.94M 0s
    50K .......... .......... .......... .....                100%=20
2.54M=3D0.02s

2021-11-21 23:51:22 (4.21 MB/s) -=20
=E2=80=98/build/tmp/work/jailhouse-demo-arm64/isar-bootstrap-target/1.0-r0/=
rootfs//var/cache/apt/archives/partial/zlib1g_1%3a1.2.11.dfsg-2_arm64.deb=
=E2=80=99=20
saved [87944/87944]

*chroot: failed to run command =E2=80=98/bin/true=E2=80=99: No such file or=
 directory*

Il giorno sabato 20 novembre 2021 alle 18:56:46 UTC+1 Jan Kiszka ha scritto=
:

> From: Jan Kiszka <jan.k...@siemens.com>
>
> Replace the build-images.sh script with the new kconfig-based menu of
> kas. For CI purposes, we can grab the full list of targets simply by
> filtering the Kconfig file for "mc:..." strings.
>
> Signed-off-by: Jan Kiszka <jan.k...@siemens.com>
> ---
> .gitignore | 1 +
> .gitlab-ci.yml | 6 +-
> Kconfig | 154 ++++++++++++++++++++++++++++++++++++++++++++++++
> README.md | 6 +-
> build-images.sh | 102 --------------------------------
> images.list | 13 ----
> 6 files changed, 161 insertions(+), 121 deletions(-)
> create mode 100644 Kconfig
> delete mode 100755 build-images.sh
> delete mode 100644 images.list
>
> diff --git a/.gitignore b/.gitignore
> index fe0ae1a..381f14e 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -1,3 +1,4 @@
> build/
> isar/
> recipes-core/customizations/local.inc
> +.config.yaml*
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 354fd1f..08e9d19 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -10,9 +10,9 @@ all:
> - export https_proxy=3D$HTTPS_PROXY
> - export ftp_proxy=3D$FTP_PROXY
> - export no_proxy=3D$NO_PROXY
> - - while read MACHINE DESCRIPTION; do
> - KAS_TARGET=3D"${KAS_TARGET} mc:${MACHINE}-jailhouse-demo:demo-image";
> - done < images.list
> + - for TARGET in $(grep "\"mc:" Kconfig | sed 's/.*"\([^"]\+\)"/\1/'); d=
o
> + KAS_TARGET=3D"${KAS_TARGET} ${TARGET}";
> + done
> - export KAS_TARGET
> - cd ..
> - kas build jailhouse-images/kas.yml
> diff --git a/Kconfig b/Kconfig
> new file mode 100644
> index 0000000..0d0e65c
> --- /dev/null
> +++ b/Kconfig
> @@ -0,0 +1,154 @@
> +mainmenu "Jailhouse Reference Images"
> +
> +config KAS_INCLUDE_MAIN
> + string
> + default "kas.yml"
> +
> +config KAS_BUILD_SYSTEM
> + string
> + default "isar"
> +
> +comment "Targets to be built"
> +
> +config TARGET_QEMU_AMD64
> + bool "QEMU/KVM Intel-x86 virtual target"
> + default y
> +
> +config KAS_TARGET_QEMU_AMD64
> + string
> + depends on TARGET_QEMU_AMD64
> + default "mc:qemu-amd64-jailhouse-demo:demo-image"
> +
> +
> +config TARGET_QEMU_ARM
> + bool "QEMU ARM virtual target"
> +
> +config KAS_TARGET_QEMU_ARM
> + string
> + depends on TARGET_QEMU_ARM
> + default "mc:qemu-arm-jailhouse-demo:demo-image"
> +
> +
> +config TARGET_QEMU_ARM64
> + bool "QEMU ARM64 virtual target"
> +
> +config KAS_TARGET_QEMU_ARM64
> + string
> + depends on TARGET_QEMU_ARM64
> + default "mc:qemu-arm64-jailhouse-demo:demo-image"
> +
> +
> +config TARGET_ORANGEPI_ZERO
> + bool "Orange Pi Zero (256 MB edition)"
> +
> +config KAS_TARGET_ORANGEPI_ZERO
> + string
> + depends on TARGET_ORANGEPI_ZERO
> + default "mc:orangepi-zero-jailhouse-demo:demo-image"
> +
> +
> +config TARGET_NUC6CAY
> + bool "Intel NUC (NUC6CAY, 8 GB RAM)"
> +
> +config KAS_TARGET_NUC6CAY
> + string
> + depends on TARGET_NUC6CAY
> + default "mc:nuc6cay-jailhouse-demo:demo-image"
> +
> +
> +config TARGET_Q7_AL_E3940
> + bool "MSC Q7-AL-E3940-24N0211I"
> +
> +config KAS_TARGET_Q7_AL_E3940
> + string
> + depends on TARGET_Q7_AL_E3940
> + default "mc:q7-al-e3940-jailhouse-demo:demo-image"
> +
> +
> +config TARGET_ESPRESSOBIN
> + bool "Marvell ESPRESSObin (1 GB edition)"
> +
> +config KAS_TARGET_ESPRESSOBIN
> + string
> + depends on TARGET_ESPRESSOBIN
> + default "mc:espressobin-jailhouse-demo:demo-image"
> +
> +
> +config TARGET_MACCHIATOBIN
> + bool "Marvell MACCHIATObin"
> +
> +config KAS_TARGET_MACCHIATOBIN
> + string
> + depends on TARGET_MACCHIATOBIN
> + default "mc:macchiatobin-jailhouse-demo:demo-image"
> +
> +
> +config TARGET_HIKEY620
> + bool "LeMaker HiKey (Kirin 620 SoC, 2 GB edition)"
> +
> +config KAS_TARGET_HIKEY620
> + string
> + depends on TARGET_HIKEY620
> + default "mc:hikey620-jailhouse-demo:demo-image"
> +
> +
> +config TARGET_ULTRA96_V1
> + bool "Avnet Ultra96 v1"
> +
> +config KAS_TARGET_ULTRA96_V1
> + string
> + depends on TARGET_ULTRA96_V1
> + default "mc:ultra96-v1-jailhouse-demo:demo-image"
> +
> +
> +config TARGET_ULTRA96_V2
> + bool "Avnet Ultra96 v2"
> +
> +config KAS_TARGET_ULTRA96_V2
> + string
> + depends on TARGET_ULTRA96_V2
> + default "mc:ultra96-v2-jailhouse-demo:demo-image"
> +
> +
> +config TARGET_RPI4
> + bool "Raspberry Pi 4 (1-8 GB editions)"
> +
> +config KAS_TARGET_RPI4
> + string
> + depends on TARGET_RPI4
> + default "mc:rpi4-jailhouse-demo:demo-image"
> +
> +
> +config TARGET_PINE64_PLUS
> + bool "Pine64+ (Allwinner A64, 2 GB edition)"
> +
> +config KAS_TARGET_PINE64_PLUS
> + string
> + depends on TARGET_PINE64_PLUS
> + default "mc:pine64-plus-jailhouse-demo:demo-image"
> +
> +
> +comment "Image options"
> +
> +config RT
> + bool "Use Preempt RT kernel"
> + help
> + Use Preempt RT kernel for root and non-root cell. Typical RT tests
> + are included in the image.
> +
> +config KAS_INCLUDE_RT
> + string
> + depends on RT
> + default "opt-rt.yml"
> +
> +
> +config LATEST
> + bool "Build latest Jailhouse version"
> + help
> + Build Jailhouse from 'next' branch in git, rather than from the
> + last release.
> +
> +config KAS_INCLUDE_LATEST
> + string
> + depends on LATEST
> + default "opt-latest.yml"
> diff --git a/README.md b/README.md
> index 2fb7ebd..b5895e3 100644
> --- a/README.md
> +++ b/README.md
> @@ -18,8 +18,8 @@ The host-side requirements are:
> - kvm_intel module loaded with parameter `nested=3D1` (for qemu-x86 image=
 on
> kernel < 4.20)
>
> -To build a target image, just run `build-images.sh` and select one (or
> -both) of the QEMU targets. The generated image can then be executed usin=
g
> +To build a target image, just run `./kas-container menu` and select one=
=20
> (or
> +more) of the QEMU targets. The generated image can then be executed usin=
g
> `start-qemu.sh ARCHITECTURE`. Currently supported are `x86` (only works o=
n
> Intel CPUs so far), `arm64` and `arm` as architectures. On x86, make sure=
=20
> the
> kvm-intel module was loaded with `nested=3D1` to enable nested VMX suppor=
t.
> @@ -28,7 +28,7 @@ kvm-intel module was loaded with `nested=3D1` to enable=
=20
> nested VMX support.
> Quickstart for Physical Targets
> -------------------------------
>
> -Call `build-images.sh` and select the desired target. Afterwards, flash=
=20
> the
> +Call `./kas-container menu` and select the desired target. Afterwards,=
=20
> flash the
> image on an empty SD card, e.g.:
>
> dd=20
> if=3Dbuild/tmp/deploy/images/orangepi-zero/demo-image-jailhouse-demo-oran=
gepi-zero.wic.img=20
> \
> diff --git a/build-images.sh b/build-images.sh
> deleted file mode 100755
> index da24867..0000000
> --- a/build-images.sh
> +++ /dev/null
> @@ -1,102 +0,0 @@
> -#!/bin/sh
> -#
> -# Jailhouse, a Linux-based partitioning hypervisor
> -#
> -# Copyright (c) Siemens AG, 2018-2019
> -#
> -# Authors:
> -# Jan Kiszka <jan.k...@siemens.com>
> -#
> -# SPDX-License-Identifier: MIT
> -#
> -
> -usage()
> -{
> - printf "%b" "Usage: $0 [OPTIONS]\n"
> - printf "%b" "\nOptions:\n"
> - printf "%b" "--latest\tBuild latest Jailhouse version from next" \
> - "branch.\n"
> - printf "%b" "--rt\t\tBuild with PREEMPT-RT kernel.\n"
> - printf "%b" "--all\t\tBuild all available images (may take hours...).\n=
"
> - printf "%b" "--shell\t\tDrop into a shell to issue bitbake commands" \
> - "manually.\n"
> - exit 1
> -}
> -
> -JAILHOUSE_IMAGES=3D$(dirname "$0")
> -KAS_CONTAINER=3D${KAS_CONTAINER:-${JAILHOUSE_IMAGES}/kas-container}
> -KAS_FILES=3D"${JAILHOUSE_IMAGES}/kas.yml"
> -CMD=3D"build"
> -
> -while [ $# -gt 0 ]; do
> - case "$1" in
> - --latest)
> - KAS_FILES=3D"${KAS_FILES}:${JAILHOUSE_IMAGES}/opt-latest.yml"
> - shift 1
> - ;;
> - --rt)
> - KAS_FILES=3D"${KAS_FILES}:${JAILHOUSE_IMAGES}/opt-rt.yml"
> - shift 1
> - ;;
> - --all)
> - KAS_TARGET=3D
> - while read -r MACHINE DESCRIPTION; do
> - KAS_TARGET=3D"${KAS_TARGET} mc:${MACHINE}-jailhouse-demo:demo-image"
> - done < "${JAILHOUSE_IMAGES}/images.list"
> - shift 1
> - ;;
> - --shell)
> - CMD=3D"shell"
> - shift 1
> - ;;
> - *)
> - usage
> - ;;
> - esac
> -done
> -
> -if [ -z "${KAS_TARGET}" ]; then
> - echo "Available images demo images:"
> - IFS=3D" "
> - MACHINES=3D
> - NUM_MACHINES=3D0
> - while read -r MACHINE DESCRIPTION; do
> - MACHINES=3D"${MACHINES} ${MACHINE}"
> - NUM_MACHINES=3D$((NUM_MACHINES + 1))
> - echo " ${NUM_MACHINES}: ${DESCRIPTION}"
> - done < "${JAILHOUSE_IMAGES}/images.list"
> - echo " 0: all (may take hours...)"
> - echo ""
> -
> - printf "Select images to build (space-separated index list): "
> - read -r SELECTION
> - [ -z "${SELECTION}" ] && exit 0
> -
> - IFS=3D" "
> - KAS_TARGET=3D
> - for IDX in ${SELECTION}; do
> - if [ "${IDX}" -eq 0 ] 2>/dev/null; then
> - KAS_TARGET=3D
> - for MACHINE in ${MACHINES}; do
> - KAS_TARGET=3D"${KAS_TARGET} mc:${MACHINE}-jailhouse-demo:demo-image"
> - done
> - break
> - fi
> -
> - N=3D1
> - for MACHINE in ${MACHINES}; do
> - if [ ${N} -eq "${IDX}" ] 2>/dev/null; then
> - KAS_TARGET=3D"${KAS_TARGET} mc:${MACHINE}-jailhouse-demo:demo-image"
> - break
> - fi
> - N=3D$((N + 1))
> - done
> - if [ ${N} -gt ${NUM_MACHINES} ]; then
> - echo "Invalid index: ${IDX}"
> - exit 1
> - fi
> - done
> -fi
> -export KAS_TARGET
> -
> -${KAS_CONTAINER} ${CMD} "${KAS_FILES}"
> diff --git a/images.list b/images.list
> deleted file mode 100644
> index 4e500fd..0000000
> --- a/images.list
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -qemu-amd64 QEMU/KVM Intel-x86 virtual target
> -qemu-arm QEMU ARM virtual target
> -qemu-arm64 QEMU ARM64 virtual target
> -orangepi-zero Orange Pi Zero (256 MB edition)
> -nuc6cay Intel NUC (NUC6CAY, 8 GB RAM)
> -ipc127e SIMATIC IPC127E (2 cores / 2 GB edition)
> -espressobin Marvell ESPRESSObin (1 GB edition)
> -macchiatobin Marvell MACCHIATObin
> -hikey620 LeMaker HiKey (Kirin 620 SoC, 2 GB edition)
> -ultra96-v1 Avnet Ultra96 v1
> -ultra96-v2 Avnet Ultra96 v2
> -rpi4 Raspberry Pi 4 (1-8 GB editions)
> -pine64-plus Pine64+ (Allwinner A64, 2 GB edition)
> --
> 2.31.1
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/bb08169b-1e0b-44d4-8c45-69c0f349e15dn%40googlegroups.com.

------=_Part_1683_554629079.1637538961561
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Jan,<div><br></div><div>I've tried to build RaspPI4 with next branch.<=
/div><div><br></div><div>This is the log error for ./build/tmp/work/jailhou=
se-demo-arm64/isar-bootstrap-target/1.0-r0/rootfs/debootstrap/debootstrap.l=
og:</div><div><br></div><div><div>Resolving deb.debian.org (deb.debian.org)=
... 146.75.62.132, 2a04:4e42:7f::644</div><div>Connecting to deb.debian.org=
 (deb.debian.org)|146.75.62.132|:80... connected.</div><div>HTTP request se=
nt, awaiting response... 200 OK</div><div>Length: 87944 (86K) [application/=
x-debian-package]</div><div>Saving to: =E2=80=98/build/tmp/work/jailhouse-d=
emo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/cache/apt/archives/parti=
al/zlib1g_1%3a1.2.11.dfsg-2_arm64.deb=E2=80=99</div><div><br></div><div>&nb=
sp; &nbsp; &nbsp;0K .......... .......... .......... .......... .......... =
58% 7.94M 0s</div><div>&nbsp; &nbsp; 50K .......... .......... .......... .=
....&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 100% 2.54M=3D0.=
02s</div><div><br></div><div>2021-11-21 23:51:22 (4.21 MB/s) - =E2=80=98/bu=
ild/tmp/work/jailhouse-demo-arm64/isar-bootstrap-target/1.0-r0/rootfs//var/=
cache/apt/archives/partial/zlib1g_1%3a1.2.11.dfsg-2_arm64.deb=E2=80=99 save=
d [87944/87944]</div><div><br></div><div><b>chroot: failed to run command =
=E2=80=98/bin/true=E2=80=99: No such file or directory</b></div><br></div><=
div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">Il giorno =
sabato 20 novembre 2021 alle 18:56:46 UTC+1 Jan Kiszka ha scritto:<br/></di=
v><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-le=
ft: 1px solid rgb(204, 204, 204); padding-left: 1ex;">From: Jan Kiszka &lt;=
<a href data-email-masked rel=3D"nofollow">jan.k...@siemens.com</a>&gt;
<br>
<br>Replace the build-images.sh script with the new kconfig-based menu of
<br>kas. For CI purposes, we can grab the full list of targets simply by
<br>filtering the Kconfig file for &quot;mc:...&quot; strings.
<br>
<br>Signed-off-by: Jan Kiszka &lt;<a href data-email-masked rel=3D"nofollow=
">jan.k...@siemens.com</a>&gt;
<br>---
<br> .gitignore      |   1 +
<br> .gitlab-ci.yml  |   6 +-
<br> Kconfig         | 154 ++++++++++++++++++++++++++++++++++++++++++++++++
<br> README.md       |   6 +-
<br> build-images.sh | 102 --------------------------------
<br> images.list     |  13 ----
<br> 6 files changed, 161 insertions(+), 121 deletions(-)
<br> create mode 100644 Kconfig
<br> delete mode 100755 build-images.sh
<br> delete mode 100644 images.list
<br>
<br>diff --git a/.gitignore b/.gitignore
<br>index fe0ae1a..381f14e 100644
<br>--- a/.gitignore
<br>+++ b/.gitignore
<br>@@ -1,3 +1,4 @@
<br> build/
<br> isar/
<br> recipes-core/customizations/local.inc
<br>+.config.yaml*
<br>diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
<br>index 354fd1f..08e9d19 100644
<br>--- a/.gitlab-ci.yml
<br>+++ b/.gitlab-ci.yml
<br>@@ -10,9 +10,9 @@ all:
<br>     - export https_proxy=3D$HTTPS_PROXY
<br>     - export ftp_proxy=3D$FTP_PROXY
<br>     - export no_proxy=3D$NO_PROXY
<br>-    - while read MACHINE DESCRIPTION; do
<br>-          KAS_TARGET=3D&quot;${KAS_TARGET} mc:${MACHINE}-jailhouse-dem=
o:demo-image&quot;;
<br>-      done &lt; images.list
<br>+    - for TARGET in $(grep &quot;\&quot;mc:&quot; Kconfig | sed &#39;s=
/.*&quot;\([^&quot;]\+\)&quot;/\1/&#39;); do
<br>+          KAS_TARGET=3D&quot;${KAS_TARGET} ${TARGET}&quot;;
<br>+      done
<br>     - export KAS_TARGET
<br>     - cd ..
<br>     - kas build jailhouse-images/kas.yml
<br>diff --git a/Kconfig b/Kconfig
<br>new file mode 100644
<br>index 0000000..0d0e65c
<br>--- /dev/null
<br>+++ b/Kconfig
<br>@@ -0,0 +1,154 @@
<br>+mainmenu &quot;Jailhouse Reference Images&quot;
<br>+
<br>+config KAS_INCLUDE_MAIN
<br>+	string
<br>+	default &quot;kas.yml&quot;
<br>+
<br>+config KAS_BUILD_SYSTEM
<br>+	string
<br>+	default &quot;isar&quot;
<br>+
<br>+comment &quot;Targets to be built&quot;
<br>+
<br>+config TARGET_QEMU_AMD64
<br>+	bool &quot;QEMU/KVM Intel-x86 virtual target&quot;
<br>+	default y
<br>+
<br>+config KAS_TARGET_QEMU_AMD64
<br>+	string
<br>+	depends on TARGET_QEMU_AMD64
<br>+	default &quot;mc:qemu-amd64-jailhouse-demo:demo-image&quot;
<br>+
<br>+
<br>+config TARGET_QEMU_ARM
<br>+	bool &quot;QEMU ARM virtual target&quot;
<br>+
<br>+config KAS_TARGET_QEMU_ARM
<br>+	string
<br>+	depends on TARGET_QEMU_ARM
<br>+	default &quot;mc:qemu-arm-jailhouse-demo:demo-image&quot;
<br>+
<br>+
<br>+config TARGET_QEMU_ARM64
<br>+	bool &quot;QEMU ARM64 virtual target&quot;
<br>+
<br>+config KAS_TARGET_QEMU_ARM64
<br>+	string
<br>+	depends on TARGET_QEMU_ARM64
<br>+	default &quot;mc:qemu-arm64-jailhouse-demo:demo-image&quot;
<br>+
<br>+
<br>+config TARGET_ORANGEPI_ZERO
<br>+	bool &quot;Orange Pi Zero (256 MB edition)&quot;
<br>+
<br>+config KAS_TARGET_ORANGEPI_ZERO
<br>+	string
<br>+	depends on TARGET_ORANGEPI_ZERO
<br>+	default &quot;mc:orangepi-zero-jailhouse-demo:demo-image&quot;
<br>+
<br>+
<br>+config TARGET_NUC6CAY
<br>+	bool &quot;Intel NUC (NUC6CAY, 8 GB RAM)&quot;
<br>+
<br>+config KAS_TARGET_NUC6CAY
<br>+	string
<br>+	depends on TARGET_NUC6CAY
<br>+	default &quot;mc:nuc6cay-jailhouse-demo:demo-image&quot;
<br>+
<br>+
<br>+config TARGET_Q7_AL_E3940
<br>+	bool &quot;MSC Q7-AL-E3940-24N0211I&quot;
<br>+
<br>+config KAS_TARGET_Q7_AL_E3940
<br>+	string
<br>+	depends on TARGET_Q7_AL_E3940
<br>+	default &quot;mc:q7-al-e3940-jailhouse-demo:demo-image&quot;
<br>+
<br>+
<br>+config TARGET_ESPRESSOBIN
<br>+	bool &quot;Marvell ESPRESSObin (1 GB edition)&quot;
<br>+
<br>+config KAS_TARGET_ESPRESSOBIN
<br>+	string
<br>+	depends on TARGET_ESPRESSOBIN
<br>+	default &quot;mc:espressobin-jailhouse-demo:demo-image&quot;
<br>+
<br>+
<br>+config TARGET_MACCHIATOBIN
<br>+	bool &quot;Marvell MACCHIATObin&quot;
<br>+
<br>+config KAS_TARGET_MACCHIATOBIN
<br>+	string
<br>+	depends on TARGET_MACCHIATOBIN
<br>+	default &quot;mc:macchiatobin-jailhouse-demo:demo-image&quot;
<br>+
<br>+
<br>+config TARGET_HIKEY620
<br>+	bool &quot;LeMaker HiKey (Kirin 620 SoC, 2 GB edition)&quot;
<br>+
<br>+config KAS_TARGET_HIKEY620
<br>+	string
<br>+	depends on TARGET_HIKEY620
<br>+	default &quot;mc:hikey620-jailhouse-demo:demo-image&quot;
<br>+
<br>+
<br>+config TARGET_ULTRA96_V1
<br>+	bool &quot;Avnet Ultra96 v1&quot;
<br>+
<br>+config KAS_TARGET_ULTRA96_V1
<br>+	string
<br>+	depends on TARGET_ULTRA96_V1
<br>+	default &quot;mc:ultra96-v1-jailhouse-demo:demo-image&quot;
<br>+
<br>+
<br>+config TARGET_ULTRA96_V2
<br>+	bool &quot;Avnet Ultra96 v2&quot;
<br>+
<br>+config KAS_TARGET_ULTRA96_V2
<br>+	string
<br>+	depends on TARGET_ULTRA96_V2
<br>+	default &quot;mc:ultra96-v2-jailhouse-demo:demo-image&quot;
<br>+
<br>+
<br>+config TARGET_RPI4
<br>+	bool &quot;Raspberry Pi 4 (1-8 GB editions)&quot;
<br>+
<br>+config KAS_TARGET_RPI4
<br>+	string
<br>+	depends on TARGET_RPI4
<br>+	default &quot;mc:rpi4-jailhouse-demo:demo-image&quot;
<br>+
<br>+
<br>+config TARGET_PINE64_PLUS
<br>+	bool &quot;Pine64+ (Allwinner A64, 2 GB edition)&quot;
<br>+
<br>+config KAS_TARGET_PINE64_PLUS
<br>+	string
<br>+	depends on TARGET_PINE64_PLUS
<br>+	default &quot;mc:pine64-plus-jailhouse-demo:demo-image&quot;
<br>+
<br>+
<br>+comment &quot;Image options&quot;
<br>+
<br>+config RT
<br>+	bool &quot;Use Preempt RT kernel&quot;
<br>+	help
<br>+	  Use Preempt RT kernel for root and non-root cell. Typical RT tests
<br>+	  are included in the image.
<br>+
<br>+config KAS_INCLUDE_RT
<br>+	string
<br>+	depends on RT
<br>+	default &quot;opt-rt.yml&quot;
<br>+
<br>+
<br>+config LATEST
<br>+	bool &quot;Build latest Jailhouse version&quot;
<br>+	help
<br>+	  Build Jailhouse from &#39;next&#39; branch in git, rather than from=
 the
<br>+	  last release.
<br>+
<br>+config KAS_INCLUDE_LATEST
<br>+	string
<br>+	depends on LATEST
<br>+	default &quot;opt-latest.yml&quot;
<br>diff --git a/README.md b/README.md
<br>index 2fb7ebd..b5895e3 100644
<br>--- a/README.md
<br>+++ b/README.md
<br>@@ -18,8 +18,8 @@ The host-side requirements are:
<br> - kvm_intel module loaded with parameter `nested=3D1` (for qemu-x86 im=
age on
<br>   kernel &lt; 4.20)
<br>
<br>-To build a target image, just run `build-images.sh` and select one (or
<br>-both) of the QEMU targets. The generated image can then be executed us=
ing
<br>+To build a target image, just run `./kas-container menu` and select on=
e (or
<br>+more) of the QEMU targets. The generated image can then be executed us=
ing
<br> `start-qemu.sh ARCHITECTURE`. Currently supported are `x86` (only work=
s on
<br> Intel CPUs so far), `arm64` and `arm` as architectures. On x86, make s=
ure the
<br> kvm-intel module was loaded with `nested=3D1` to enable nested VMX sup=
port.
<br>@@ -28,7 +28,7 @@ kvm-intel module was loaded with `nested=3D1` to enab=
le nested VMX support.
<br> Quickstart for Physical Targets
<br> -------------------------------
<br>
<br>-Call `build-images.sh` and select the desired target. Afterwards, flas=
h the
<br>+Call `./kas-container menu` and select the desired target. Afterwards,=
 flash the
<br> image on an empty SD card, e.g.:
<br>
<br>     dd if=3Dbuild/tmp/deploy/images/orangepi-zero/demo-image-jailhouse=
-demo-orangepi-zero.wic.img \
<br>diff --git a/build-images.sh b/build-images.sh
<br>deleted file mode 100755
<br>index da24867..0000000
<br>--- a/build-images.sh
<br>+++ /dev/null
<br>@@ -1,102 +0,0 @@
<br>-#!/bin/sh
<br>-#
<br>-# Jailhouse, a Linux-based partitioning hypervisor
<br>-#
<br>-# Copyright (c) Siemens AG, 2018-2019
<br>-#
<br>-# Authors:
<br>-#  Jan Kiszka &lt;<a href data-email-masked rel=3D"nofollow">jan.k...@=
siemens.com</a>&gt;
<br>-#
<br>-# SPDX-License-Identifier: MIT
<br>-#
<br>-
<br>-usage()
<br>-{
<br>-	printf &quot;%b&quot; &quot;Usage: $0 [OPTIONS]\n&quot;
<br>-	printf &quot;%b&quot; &quot;\nOptions:\n&quot;
<br>-	printf &quot;%b&quot; &quot;--latest\tBuild latest Jailhouse version =
from next&quot; \
<br>-		    &quot;branch.\n&quot;
<br>-	printf &quot;%b&quot; &quot;--rt\t\tBuild with PREEMPT-RT kernel.\n&q=
uot;
<br>-	printf &quot;%b&quot; &quot;--all\t\tBuild all available images (may =
take hours...).\n&quot;
<br>-	printf &quot;%b&quot; &quot;--shell\t\tDrop into a shell to issue bit=
bake commands&quot; \
<br>-		    &quot;manually.\n&quot;
<br>-	exit 1
<br>-}
<br>-
<br>-JAILHOUSE_IMAGES=3D$(dirname &quot;$0&quot;)
<br>-KAS_CONTAINER=3D${KAS_CONTAINER:-${JAILHOUSE_IMAGES}/kas-container}
<br>-KAS_FILES=3D&quot;${JAILHOUSE_IMAGES}/kas.yml&quot;
<br>-CMD=3D&quot;build&quot;
<br>-
<br>-while [ $# -gt 0 ]; do
<br>-	case &quot;$1&quot; in
<br>-	--latest)
<br>-		KAS_FILES=3D&quot;${KAS_FILES}:${JAILHOUSE_IMAGES}/opt-latest.yml&qu=
ot;
<br>-		shift 1
<br>-		;;
<br>-	--rt)
<br>-		KAS_FILES=3D&quot;${KAS_FILES}:${JAILHOUSE_IMAGES}/opt-rt.yml&quot;
<br>-		shift 1
<br>-		;;
<br>-	--all)
<br>-		KAS_TARGET=3D
<br>-		while read -r MACHINE DESCRIPTION; do
<br>-			KAS_TARGET=3D&quot;${KAS_TARGET} mc:${MACHINE}-jailhouse-demo:demo-=
image&quot;
<br>-		done &lt; &quot;${JAILHOUSE_IMAGES}/images.list&quot;
<br>-		shift 1
<br>-		;;
<br>-	--shell)
<br>-		CMD=3D&quot;shell&quot;
<br>-		shift 1
<br>-		;;
<br>-	*)
<br>-		usage
<br>-		;;
<br>-	esac
<br>-done
<br>-
<br>-if [ -z &quot;${KAS_TARGET}&quot; ]; then
<br>-	echo &quot;Available images demo images:&quot;
<br>-	IFS=3D&quot;	&quot;
<br>-	MACHINES=3D
<br>-	NUM_MACHINES=3D0
<br>-	while read -r MACHINE DESCRIPTION; do
<br>-		MACHINES=3D&quot;${MACHINES} ${MACHINE}&quot;
<br>-		NUM_MACHINES=3D$((NUM_MACHINES + 1))
<br>-		echo &quot; ${NUM_MACHINES}: ${DESCRIPTION}&quot;
<br>-	done &lt; &quot;${JAILHOUSE_IMAGES}/images.list&quot;
<br>-	echo &quot; 0: all (may take hours...)&quot;
<br>-	echo &quot;&quot;
<br>-
<br>-	printf &quot;Select images to build (space-separated index list): &qu=
ot;
<br>-	read -r SELECTION
<br>-	[ -z &quot;${SELECTION}&quot; ] &amp;&amp; exit 0
<br>-
<br>-	IFS=3D&quot; &quot;
<br>-	KAS_TARGET=3D
<br>-	for IDX in ${SELECTION}; do
<br>-		if [ &quot;${IDX}&quot; -eq 0 ] 2&gt;/dev/null; then
<br>-			KAS_TARGET=3D
<br>-			for MACHINE in ${MACHINES}; do
<br>-				KAS_TARGET=3D&quot;${KAS_TARGET} mc:${MACHINE}-jailhouse-demo:demo=
-image&quot;
<br>-			done
<br>-			break
<br>-		fi
<br>-
<br>-		N=3D1
<br>-		for MACHINE in ${MACHINES}; do
<br>-			if [ ${N} -eq &quot;${IDX}&quot; ] 2&gt;/dev/null; then
<br>-				KAS_TARGET=3D&quot;${KAS_TARGET} mc:${MACHINE}-jailhouse-demo:demo=
-image&quot;
<br>-				break
<br>-			fi
<br>-			N=3D$((N + 1))
<br>-		done
<br>-		if [ ${N} -gt ${NUM_MACHINES} ]; then
<br>-			echo &quot;Invalid index: ${IDX}&quot;
<br>-			exit 1
<br>-		fi
<br>-	done
<br>-fi
<br>-export KAS_TARGET
<br>-
<br>-${KAS_CONTAINER} ${CMD} &quot;${KAS_FILES}&quot;
<br>diff --git a/images.list b/images.list
<br>deleted file mode 100644
<br>index 4e500fd..0000000
<br>--- a/images.list
<br>+++ /dev/null
<br>@@ -1,13 +0,0 @@
<br>-qemu-amd64	QEMU/KVM Intel-x86 virtual target
<br>-qemu-arm	QEMU ARM virtual target
<br>-qemu-arm64	QEMU ARM64 virtual target
<br>-orangepi-zero	Orange Pi Zero (256 MB edition)
<br>-nuc6cay		Intel NUC (NUC6CAY, 8 GB RAM)
<br>-ipc127e		SIMATIC IPC127E (2 cores / 2 GB edition)
<br>-espressobin	Marvell ESPRESSObin (1 GB edition)
<br>-macchiatobin	Marvell MACCHIATObin
<br>-hikey620	LeMaker HiKey (Kirin 620 SoC, 2 GB edition)
<br>-ultra96-v1	Avnet Ultra96 v1
<br>-ultra96-v2	Avnet Ultra96 v2
<br>-rpi4		Raspberry Pi 4 (1-8 GB editions)
<br>-pine64-plus	Pine64+ (Allwinner A64, 2 GB edition)
<br>--
<br>2.31.1
<br>
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/bb08169b-1e0b-44d4-8c45-69c0f349e15dn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/bb08169b-1e0b-44d4-8c45-69c0f349e15dn%40googlegroups.co=
m</a>.<br />

------=_Part_1683_554629079.1637538961561--

------=_Part_1682_56790158.1637538961561--
