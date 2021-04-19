Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBMPD66BQMGQEV2E6LUY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id B7606364CD6
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 23:10:09 +0200 (CEST)
Received: by mail-lf1-x139.google.com with SMTP id p28-20020a056512329cb02901ae653ca592sf1523766lfe.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 14:10:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618866609; cv=pass;
        d=google.com; s=arc-20160816;
        b=kZ1Jgv9/p9gF8vPy88JhjN+yUmCzcI5L/DXtT2jl7rTdR+duN2/GuQGEeNR4tVbWXU
         qjuw6jzs9D0x8+pVZ9zE6D7X9LmAqaRQXfZMnJFhq6UC8JP7aIZf+U7HBLDQwIT4CXJV
         kQWspMkyrCXz8K/5AA4/k+LjPcmfviyQgyWNRswLMLjmrVHmlg3pUBfGaxG2we1MkAgg
         km/EHjp1D5mN9pCaRWTtW6ySr4YNjjB2fkuYapr29PjX9eLVBmPfN7LSaSDGxDdcgiCF
         5IOG8zmtOvUzjTaKDmM6mAuSKOIeUTTL/OStNsiCaVCOLIIQT8Lx6vsVoFYfU3pdAEFC
         quJg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:to:from:sender:dkim-signature;
        bh=OgnD/3JmqGHWxFji4338H6wcssIZdFQxfqhqDT9vE4g=;
        b=kFcI8IQF1+gorRXZExFCR8Mc6qITpAc6IJCxpk+4Z4dXKj45kb2lClVw2t5PRP1CWe
         A4TQJ+x63MrxWiq29LPn7W2Cs7YUFreIyntY/5KxJjvP3KudeGpIdG80kA1gI06Vl+vs
         thgAkByjExPS2AJgUPqlo8Ub2Od1EKS7Cvm8fe9C0ohLJs2tDvPqYbXOi0ohKpBjjuOV
         aY+lQ9CCBteTQ3uD4b6A878gSFWozzEylEFy/OplHMloO4rSIKmENfpgikEA8JDY8Yr6
         E/ct6xcIU1imv5fBfOJYteNWflo76fFbsSSa8tpaA9GWCugLKc6dXgBx6HhYCPaLxzKs
         XgEw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OgnD/3JmqGHWxFji4338H6wcssIZdFQxfqhqDT9vE4g=;
        b=qkpX12KChhFsS7gpm0v98xDgUMD+Qq35MhpEcAPLL/zCqgxZ9okt7p3aAjg8qBXRc9
         pB9paoqBqC8AfKjwsW3/UzuDvNChTUT0OdFGnoFmQpulXjbx1HGD79wINsuzPqo3pOdE
         1UqiX1JMHgSBMGYlXfIq9LWhnnPOXhdv7VnglRnE7oaaGVYmuBO/lLv3feL6PvSDsD6A
         IF5vuWb2ae38lreUOi3DcLa+UaB7K9Wb7fpJ0oV5iaHuTO4ND9StbXZgcoIAszna5/MY
         uMSizb0JbGzdlYUCMjPtoUmMhA/HAY6s0R5ooIVUNnBLp/0M3iRoVO0+/14NubKsepet
         x1qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=OgnD/3JmqGHWxFji4338H6wcssIZdFQxfqhqDT9vE4g=;
        b=Zi2YV1Mn9Z3hKv5UfZOesm73gq8rNVTHILID4An8WfErb/tJNojnajLj0VDR8taTTd
         XSGxLcDu4MAeDcuPipB2GML3x1rYtkkmAsfUOVAMszjqasKNjC7h9k2BKyohoKbbUlJc
         svADF/Tj4G8pPWqB86go/v8U56x02bot9Aq1c2rQnTjtq/cW/Pa3k/tXmqa7iF4S8g32
         6KLee7tn6fF76j4hlhmxgmXQ/V7EVSAmUz6WZaUf9Dx5jT5dxHt2fVvrM1oZvx+xiMBe
         /Nv/QX/LG2qjezVooeRntNvcQzTZN9WGZDc0R2mNknqXa4pHWx1YiRGu+FQQczu6UBVu
         uDEQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532zjYAGr9o0XV9NqExUhh+wVt0Kz237sLXPM/rHqWEfcWszlInj
	N4mzJ5aDBtPCRCGer+iwujA=
X-Google-Smtp-Source: ABdhPJwVwv/qcm/n3L3gf66CYfFT3NgBGtAsXHbTEZdwaE/4GZvslSjEOOIVYMS2alCF2SK0ehpi4Q==
X-Received: by 2002:a2e:b88b:: with SMTP id r11mr12683915ljp.227.1618866609242;
        Mon, 19 Apr 2021 14:10:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9a48:: with SMTP id k8ls4626384ljj.10.gmail; Mon, 19 Apr
 2021 14:10:08 -0700 (PDT)
X-Received: by 2002:a2e:b52a:: with SMTP id z10mr12213781ljm.320.1618866608155;
        Mon, 19 Apr 2021 14:10:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618866608; cv=none;
        d=google.com; s=arc-20160816;
        b=iL6F5NEA17RaRcvCr98m5uML4poFgDNC3rK+ela/q9fe7/kilE3bQkX92Vdp2MCsUK
         uQ/Iv5M6AUHdnsUH/imrY/0lpxEUmtzy1mcaIPsFtv5DevKccYKNorf24INEUNkN1aMO
         ASRmlebA6MZWcly5pMqdIpmvsjdc+upiiRzJzsa7ftD4wen50awXxlLDS5FTitugfbIr
         zLj/WZk264DWTL6s0pSt2Lij+v4d/NGQWkF+K6DvnxGbo9qrFyF+qsKbqRHYs9MQZohv
         EysEFs5q2xvDa+ZFU3ZIiuHtRNR36+oA/+SOGenfs4mot0QWyuPmOHTEP6CJcXjRBh5S
         8iVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from;
        bh=eO0NuarxJk8XnjFjlr19avEKP/NHCbGQk0BEU1KcwEY=;
        b=yvS9iMUz58XEVdw0lvRr3//WjX/VA+kVtujfcQPADOB8uXQ7ASPcF6tMRMP5LjxmGK
         ztsGEhPZpdJTWHNoWTZO/vfTsRFPb25rds9pVe1mdsTbS9Y+ux5oNuIDIVdLKkX37vCR
         m+GBecV7ZGXkQVsQi8U5TVKGyzG2bEOI9BIj9PPTIUUNvPaYZArqWEL52BM72/Qu7NLt
         NJHpfZ0DaZHezTtzOF94QzbgXb2EHUTkg+8lRnX/qph/Y4Qssu8m+HCgXd8cf+tIOWSQ
         aWAocVsVTSySYuMy5O1t6sxYTNPLehISS8N+D+QWKSFtR5DUVWYO3qWUW+Pu05uQIzgc
         FjHg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id z3si629167lfu.12.2021.04.19.14.10.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Apr 2021 14:10:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 13JLA7gO026755
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 19 Apr 2021 23:10:07 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.240.116])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 13JL6TpT015242
	for <jailhouse-dev@googlegroups.com>; Mon, 19 Apr 2021 23:06:30 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v2 00/20] Updates, consolidations, QEMU 32-bit ARM support
Date: Mon, 19 Apr 2021 23:06:09 +0200
Message-Id: <cover.1618866389.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

It turned out that we need more changes in order to move to kernel 5.10
and that attemping to keep support for Jailhouse 0.12 is futile. So this
switching to "--latest" for all builds early in the series, then adds
the 32-bit QEMU target, more updates and finally the switch to kernel
5.10. The kernel update also includes dropping the RPi4 tree in favor of
upstream.

Not yet included is preintegration of SDEI on the Ultra96 targets. But
that can truly come on top later.

Jan

Jan Kiszka (20):
  Update Isar revision
  Update to kas 2.4
  Address shellcheck reports
  jailhouse: Enforce selection of latest version
  linux-jailhouse: Generalize armhf config
  customizations: Add QEMU ARM
  Hook up QEMU ARM support
  README: Add QEMU ARM support
  xradio: Update source and firmware
  non-root-initramfs: Update to buildroot 2021.02
  non-root-initramfs: Update ivshmem-demo
  non-root-initramfs: Purge buildroot download cache on cleanall
  wks files: Tune ext4 file systems to not be affected by y2038 issue
  trusted-firmware-a: Update to release 2.4
  trusted-firmware-a-ultra96: Add patches needed for 5.10 kernel
  linux-jailhouse[-rt], wilc: Switch to 5.10
  trusted-firmware-a-rpi4: Add patch to improve memory reservation
  rpi4: Move jailhouse reservation
  rpi4: Switch to upstream 5.10 kernel
  rpi-firmware-brcm80211: Update to latest revision 1:20190114-1+rpt10

 .gitignore                                    |    1 -
 .gitlab-ci.yml                                |    2 +-
 README.md                                     |    4 +-
 build-images.sh                               |   43 +-
 conf/distro/jailhouse-demo.conf               |    4 +-
 .../machine/qemu-arm.conf                     |    6 +-
 conf/machine/rpi4.conf                        |    2 -
 .../multiconfig/qemu-arm-jailhouse-demo.conf  |    6 +-
 images.list                                   |    1 +
 ...de-for-building-custom-Trusted-Firmw.patch |  127 -
 ...emove-unneeded-unconditional-recipes.patch |   32 +
 kas-container                                 |  372 ++
 kas.yml                                       |   12 +-
 opt-latest.yml                                |    2 +-
 opt-rt.yml                                    |    2 +-
 .../rpi-firmware-brcm80211.bb                 |    4 +-
 .../rpi-firmware/files/debian/aliases.dts     |   30 +
 .../rpi-firmware/files/debian/cmdline.txt     |    2 +-
 .../rpi-firmware/files/debian/config.txt      |    2 +-
 .../rpi-firmware/files/debian/jailhouse.dts   |   17 +-
 .../files/debian/rpi-firmware.install         |    1 +
 recipes-bsp/rpi-firmware/files/rules          |    1 +
 ...20200819.bb => rpi-firmware_1.20210303.bb} |    2 +-
 ...se-abspath-to-dereference-BUILD_BASE.patch |  144 -
 ...-fix-gcc-warning-about-uninitialized.patch |   40 -
 ...memreserve-pattern-for-rpi3-and-rpi4.patch |  214 +
 ...-errors-related-to-clock-gate-permis.patch |   45 +
 ...-error-codes-to-match-Linux-and-PMU-.patch |   71 +
 ...=> trusted-firmware-a-macchiatobin_2.4.bb} |    9 +-
 ... => trusted-firmware-a-pine64-plus_2.4.bb} |    0
 ..._2.3.bb => trusted-firmware-a-rpi4_2.4.bb} |    3 +
 ...3.bb => trusted-firmware-a-ultra96_2.4.bb} |    7 +-
 ...e-a_2.3.inc => trusted-firmware-a_2.4.inc} |    6 +-
 .../u-boot/u-boot-pine64-plus_2020.10.bb      |    2 +-
 .../u-boot/u-boot-ultra96-v1_2020.10.bb       |    2 +-
 .../files/.bash_history-espressobin           |    2 +-
 .../files/.bash_history-hikey620              |    2 +-
 .../files/.bash_history-macchiatobin          |    2 +-
 .../files/.bash_history-pine64-plus           |    2 +-
 ...istory-hikey620 => .bash_history-qemu-arm} |    8 +-
 .../files/.bash_history-qemu-arm64            |    2 +-
 .../customizations/files/.bash_history-rpi4   |    2 +-
 .../files/.bash_history-ultra96-v1            |    2 +-
 .../non-root-initramfs/files/amd64-config     | 3799 +---------------
 .../non-root-initramfs/files/arm64-config     | 3756 +---------------
 .../non-root-initramfs/files/armhf-config     | 3885 +----------------
 ....11.1.bb => non-root-initramfs_2021.02.bb} |   10 +-
 ...i4-Move-RAM-reservation-down-by-256-.patch |  257 ++
 recipes-jailhouse/jailhouse/jailhouse_0.12.bb |    1 +
 ...s-xilinx-Remove-dtsi-for-fixed-clock.patch |  237 +
 ...san-Separate-out-clk-related-data-to.patch |   99 -
 ...-xilinx-Add-the-clock-nodes-for-zynq.patch |  581 +++
 ...san-Add-sampling-clock-for-a-phy-to-.patch |  232 -
 ...03-arm64-zynqmp-Add-firmware-DT-node.patch |   37 -
 ...zynqmp-Add-Node-IDs-in-xlnx-zynqmp.h.patch |  109 -
 ...san-Add-support-to-set-clock-phase-d.patch |  160 -
 ...ware-xilinx-Add-SDIO-Tap-Delay-nodes.patch |   44 -
 ...san-Add-support-for-ZynqMP-Platform-.patch |  308 --
 ...irmware-xilinx-Add-DLL-reset-support.patch |   57 -
 ...san-Add-support-for-DLL-reset-for-Zy.patch |   99 -
 ...p-Add-ZynqMP-SDHCI-compatible-string.patch |   52 -
 ...san-Modified-SD-default-speed-to-19M.patch |   64 -
 ...d64_defconfig_5.4 => amd64_defconfig_5.10} |   16 +-
 ...m64_defconfig_5.4 => arm64_defconfig_5.10} |   36 +-
 ...ero_defconfig_5.4 => armhf_defconfig_5.10} |   24 +-
 .../linux/linux-jailhouse-rpi_5.4.59.bb       |   15 -
 .../linux/linux-jailhouse-rt_5.10.27-rt36.bb  |   17 +
 .../linux/linux-jailhouse-rt_5.4.58-rt35.bb   |   17 -
 .../linux/linux-jailhouse_5.10.31.bb          |   15 +
 recipes-kernel/linux/linux-jailhouse_5.10.inc |   27 +
 .../linux/linux-jailhouse_5.4.61.bb           |   15 -
 recipes-kernel/linux/linux-jailhouse_5.4.inc  |   38 -
 ...001-Make-compatible-with-5.8-kernels.patch |  191 +
 recipes-kernel/wilc/wilc_15.2-avnet.bb        |    1 +
 recipes-kernel/xradio/xradio.bb               |    6 +-
 scripts/make_release                          |   10 +-
 start-qemu.sh                                 |   37 +-
 wic/espressobin.wks                           |    2 +-
 wic/hikey620.wks                              |    2 +-
 wic/ipc127e.wks                               |    2 +-
 wic/macchiatobin.wks                          |    2 +-
 wic/nuc6cay.wks                               |    2 +-
 wic/orangepi-zero.wks                         |    2 +-
 wic/pine64-plus.wks                           |    2 +-
 wic/rpi4.wks                                  |    5 +-
 wic/ultra96.wks                               |    2 +-
 86 files changed, 2264 insertions(+), 13249 deletions(-)
 copy recipes-bsp/trusted-firmware-a/trusted-firmware-a-rpi4_2.3.bb => conf/machine/qemu-arm.conf (59%)
 copy recipes-bsp/trusted-firmware-a/trusted-firmware-a-rpi4_2.3.bb => conf/multiconfig/qemu-arm-jailhouse-demo.conf (59%)
 delete mode 100644 isar-patches/0001-Add-recipe-include-for-building-custom-Trusted-Firmw.patch
 create mode 100644 isar-patches/0001-fix-remove-unneeded-unconditional-recipes.patch
 create mode 100755 kas-container
 create mode 100644 recipes-bsp/rpi-firmware/files/debian/aliases.dts
 rename recipes-bsp/rpi-firmware/{rpi-firmware_1.20200819.bb => rpi-firmware_1.20210303.bb} (86%)
 delete mode 100644 recipes-bsp/trusted-firmware-a/files/0001-Use-abspath-to-dereference-BUILD_BASE.patch
 delete mode 100644 recipes-bsp/trusted-firmware-a/files/0001-mv_ddr4_training-fix-gcc-warning-about-uninitialized.patch
 create mode 100644 recipes-bsp/trusted-firmware-a/files/0001-rpi-Use-common-memreserve-pattern-for-rpi3-and-rpi4.patch
 create mode 100644 recipes-bsp/trusted-firmware-a/files/0001-zynqmp-pm-Filter-errors-related-to-clock-gate-permis.patch
 create mode 100644 recipes-bsp/trusted-firmware-a/files/0002-zynqmp-pm-update-error-codes-to-match-Linux-and-PMU-.patch
 rename recipes-bsp/trusted-firmware-a/{trusted-firmware-a-macchiatobin_2.3.bb => trusted-firmware-a-macchiatobin_2.4.bb} (74%)
 rename recipes-bsp/trusted-firmware-a/{trusted-firmware-a-pine64-plus_2.3.bb => trusted-firmware-a-pine64-plus_2.4.bb} (100%)
 rename recipes-bsp/trusted-firmware-a/{trusted-firmware-a-rpi4_2.3.bb => trusted-firmware-a-rpi4_2.4.bb} (72%)
 rename recipes-bsp/trusted-firmware-a/{trusted-firmware-a-ultra96_2.3.bb => trusted-firmware-a-ultra96_2.4.bb} (60%)
 rename recipes-bsp/trusted-firmware-a/{trusted-firmware-a_2.3.inc => trusted-firmware-a_2.4.inc} (65%)
 copy recipes-core/customizations/files/{.bash_history-hikey620 => .bash_history-qemu-arm} (62%)
 rename recipes-core/non-root-initramfs/{non-root-initramfs_2019.11.1.bb => non-root-initramfs_2021.02.bb} (64%)
 create mode 100644 recipes-jailhouse/jailhouse/files/0001-configs-arm64-rpi4-Move-RAM-reservation-down-by-256-.patch
 create mode 100644 recipes-kernel/linux/files/0001-Revert-arm64-dts-xilinx-Remove-dtsi-for-fixed-clock.patch
 delete mode 100644 recipes-kernel/linux/files/0001-mmc-sdhci-of-arasan-Separate-out-clk-related-data-to.patch
 create mode 100644 recipes-kernel/linux/files/0002-Revert-arm64-dts-xilinx-Add-the-clock-nodes-for-zynq.patch
 delete mode 100644 recipes-kernel/linux/files/0002-mmc-sdhci-of-arasan-Add-sampling-clock-for-a-phy-to-.patch
 delete mode 100644 recipes-kernel/linux/files/0003-arm64-zynqmp-Add-firmware-DT-node.patch
 delete mode 100644 recipes-kernel/linux/files/0004-firmware-zynqmp-Add-Node-IDs-in-xlnx-zynqmp.h.patch
 delete mode 100644 recipes-kernel/linux/files/0005-mmc-sdhci-of-arasan-Add-support-to-set-clock-phase-d.patch
 delete mode 100644 recipes-kernel/linux/files/0006-firmware-xilinx-Add-SDIO-Tap-Delay-nodes.patch
 delete mode 100644 recipes-kernel/linux/files/0007-mmc-sdhci-of-arasan-Add-support-for-ZynqMP-Platform-.patch
 delete mode 100644 recipes-kernel/linux/files/0008-firmware-xilinx-Add-DLL-reset-support.patch
 delete mode 100644 recipes-kernel/linux/files/0009-mmc-sdhci-of-arasan-Add-support-for-DLL-reset-for-Zy.patch
 delete mode 100644 recipes-kernel/linux/files/0010-arm64-zynqmp-Add-ZynqMP-SDHCI-compatible-string.patch
 delete mode 100644 recipes-kernel/linux/files/0011-mmc-sdhci-of-arasan-Modified-SD-default-speed-to-19M.patch
 rename recipes-kernel/linux/files/{amd64_defconfig_5.4 => amd64_defconfig_5.10} (98%)
 rename recipes-kernel/linux/files/{arm64_defconfig_5.4 => arm64_defconfig_5.10} (92%)
 rename recipes-kernel/linux/files/{orangepi-zero_defconfig_5.4 => armhf_defconfig_5.10} (95%)
 delete mode 100644 recipes-kernel/linux/linux-jailhouse-rpi_5.4.59.bb
 create mode 100644 recipes-kernel/linux/linux-jailhouse-rt_5.10.27-rt36.bb
 delete mode 100644 recipes-kernel/linux/linux-jailhouse-rt_5.4.58-rt35.bb
 create mode 100644 recipes-kernel/linux/linux-jailhouse_5.10.31.bb
 create mode 100644 recipes-kernel/linux/linux-jailhouse_5.10.inc
 delete mode 100644 recipes-kernel/linux/linux-jailhouse_5.4.61.bb
 delete mode 100644 recipes-kernel/linux/linux-jailhouse_5.4.inc
 create mode 100644 recipes-kernel/wilc/files/0001-Make-compatible-with-5.8-kernels.patch

-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1618866389.git.jan.kiszka%40siemens.com.
