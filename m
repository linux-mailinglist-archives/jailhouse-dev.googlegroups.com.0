Return-Path: <jailhouse-dev+bncBCZKXDNMZALBBZ5IY7WQKGQEQD262IY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id A6565E3868
	for <lists+jailhouse-dev@lfdr.de>; Thu, 24 Oct 2019 18:42:15 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id l5sf15908843edr.10
        for <lists+jailhouse-dev@lfdr.de>; Thu, 24 Oct 2019 09:42:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571935335; cv=pass;
        d=google.com; s=arc-20160816;
        b=rXdmLhcbnpa2R3i/kuab0x02qEXMMR6vg+df6Mi3pCnpx/T8azfTNhlXMXE2aQkTZH
         IgB53Li79xdawSnVYESgqBljTKVbfdcw3ka6NM6FiLPZPafgV5wKrV2IWuMkBuBQTbZH
         QhTIBeqbH4L52xdUaGmaRzZ6KohoCZ73kYvZUki6Xr0rvj0CyM1+8Qhh7yc6plj/H7t/
         bab8anTlYP3OLKHrPOyTMst3j4ui1OANPvcxShMgsXl0DrWM1X3KTLTMlg2lVb+3N/vn
         sRSL5G/x3QkUkSACyyRJX0lJ03kMXvwHhSmKIDH4WTlV7CXDHBqIUb0pKsvwEVpsSqXa
         8z5w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=oVgXYqdrLWkq+ai/fFwp5GyDG7kQvZzh6zui8+IQNvA=;
        b=x4/ZbHGYpBuULChPSLaqfjAPeZ+Ns65cLoX15ekx9vvLKdnKUHbfneDZFioLtzTbnM
         x1fqMm9wSZgOr2TvNG86PEOLA7utplrJbsHVOulz7NS2GZgZ2AYPkKyq5dwNSttqbMU8
         g4p0cSucEW3egOgOUNdO35+KwM7MR8mbPg9B0BaXqJCrbwEAWUK3x0dP3CxWrfBtFusj
         s1RLYxyynhvJ607IpEyLOHIa5SlyCYrOyEFrQhW00NLCfRzDX2/DWq6otoJLv8B8/Yt0
         rsME0hfaFrHvmyULFv1mqhZweyCBb/fffiNHeFmWNoB3YxRkeOqL029ADqInbClg6qjP
         9ipw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=AgzM+6ui;
       spf=pass (google.com: domain of alexlargacha@gmail.com designates 2a00:1450:4864:20::443 as permitted sender) smtp.mailfrom=alexlargacha@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=oVgXYqdrLWkq+ai/fFwp5GyDG7kQvZzh6zui8+IQNvA=;
        b=gSkWWzSfx8epyvyPID6o7gy9NqPUWFQfERJG/A1usuwsTi1Jwixee+wMeVieUjwGsL
         dzSdaLwJUYRBozUTA6qa2yLRbhqyluGAX6UEnT1TvFFsNHcU/X9sP/qZBwQD04GBKV7F
         yMrNxgBlewypEwaYEKvTQ14wD5KUhVjBZZwKUJTPsrYBUQpXXyMpF2mriVRmKl/M+gP0
         k49n4NlCmRe5QiMeWuvECQ6ms/6ADPpTlPV8ip0X/kaQ/yhRerPXUYItFtiILXF69Bis
         8FC1fwvx0aD4MOENObmBjzF1QmKtW6EvTI7CFZC8uZiRi8P4UY/EQ+fANxes0xZ/efBm
         1JAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=oVgXYqdrLWkq+ai/fFwp5GyDG7kQvZzh6zui8+IQNvA=;
        b=ghVQEN/avrM25aRpDs3gUNaSc9zW3fbtIP21sBTeot+agkvehMqYVgqkmCoEURFDLI
         yWGu1J2N3WC8g3SP2Wlr7LVcKvvkO1qbQezbV736H89k+evnFcRPG2m7S/FTRG6OXiAK
         Ytc6JKIR0g8u8/H9iHqM9OZNzdACQ8r5smxNJAsoBg1aeNiMi0jBjHgYFHgOZZLFlcMT
         czimjof/uf/R7uLp4qUYS+m1b7uKqvBiHqAuzzhbfvVEF/YsmYepJGK2krB5Bx41zOjS
         W42u+G/vhuGMDA5eFT+kovECCuS55TAtpZ3yLGqBJKz8DGDXdocfNQDL1rVqIeGFsBn9
         wH/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=oVgXYqdrLWkq+ai/fFwp5GyDG7kQvZzh6zui8+IQNvA=;
        b=dq0B3iSg/w4+agZL7nH9ftPEW0ltkLiKc27l/Jnh8+yrTKKQxqIcbp+s5qBM/1vd4H
         /BOwHmMcOTV9P9/IPH2xqqC4FcHLBrcsxpfLrocHrkCknVA9vgzRVTwQW24tssVOlt6r
         o+nrHEnL0KbHOdzgvv9wVenwYfcEavftJS51eMegOcAVjwNTHXgGR3siFPyXU4vrfz3b
         LsQqwnd3cFSfsS/pckFFbcL9zeeZIBXP4NkK2wm0EjGXHMS38h+xVkovU1H0XKpWUozM
         rBkXvUVn7jv8kClnSNwq5Ust0KS8LeaNWlZ4sIEDOvKhVlzD3H9cNaqVvDYrLnRH2FsV
         Z00g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXnqvKs/uxRk+SN+CROGMWr1qYRCXRyi/qksmN10tXvWRsX/z7w
	xPuZ3Zd/HkewZTLv5o1wa/4=
X-Google-Smtp-Source: APXvYqyFL/cTSUDeINzAWY7XLnNb2hwPBJKEfQ80C5GcJRbzrsWsgn/faWnjYZaNu+k8eBQLWk9MTg==
X-Received: by 2002:a17:906:5381:: with SMTP id g1mr38745122ejo.159.1571935335303;
        Thu, 24 Oct 2019 09:42:15 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:64b:: with SMTP id u11ls1539188edx.16.gmail; Thu,
 24 Oct 2019 09:42:14 -0700 (PDT)
X-Received: by 2002:a05:6402:3072:: with SMTP id bs18mr25975054edb.120.1571935334743;
        Thu, 24 Oct 2019 09:42:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571935334; cv=none;
        d=google.com; s=arc-20160816;
        b=08F2kOFEsQlIYOqCXgKotoI9mt3mgM8rEgozWgx+7Rh7+VyTKz0gtqQXPwx9DPg7ZX
         E5piwSntAloA8nGBDI26dqmp77wQTJii+NdH94H9KI/7yy8w5W/j2gx7iyx/7kBc1x0R
         cGXSQT5RWdAw7hcyM2i9njiYw5vmulqnBazm2btGNhlSD9WX67lsE4Q7rBFjZS3oJzh9
         sH0ox/ZbE8cTvoNml2CaknluLpgjaHE5hX6962tdlEJmMMbOB3eKzM/HSEBsAxDH6SlA
         XwV3OFoX7jZpPjs3Q9LTZEe69GhOg2Glr2tWyJS074pKD0cbwZ1a3qqiP+YjeGXqAy3I
         +MNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=+9jQ276ihVkB4H3M4LWFMv121WVvpiHcKY50BZ7WaQ4=;
        b=Zwp6pz8bf1AHW49GT1ZFZqJcRc+kRGokyknWBUx0NJrXWjBwJSy39XcShmxVAzw9VL
         qNl9EWVv6zeiBlP4v1gZ9a7bmV8LUZOfdjka/slCqz+KH7HLkz60LHvAf9ZUWTCJAPfC
         nsOPUCNWgR+o6jdumnw16HxCR1kRxXU0QQJfvyiaim6qKVME4d/ZM2/Zu6qa6fAsPyKH
         QqqvrBEs/zlRCWos/k6g/MEut+qsqcPw+FvuOy3p6x0MEIsiPMEJA4VVkM8fIKUPp0Q4
         x6cnkDNKvFFifdwBFVEg1eHMTK/pi6Bsc6e7q13LJDUaoHZgsrEKz2Sus9tpo6cnR0kl
         wh5Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=AgzM+6ui;
       spf=pass (google.com: domain of alexlargacha@gmail.com designates 2a00:1450:4864:20::443 as permitted sender) smtp.mailfrom=alexlargacha@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com. [2a00:1450:4864:20::443])
        by gmr-mx.google.com with ESMTPS id q17si813965edi.1.2019.10.24.09.42.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2019 09:42:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of alexlargacha@gmail.com designates 2a00:1450:4864:20::443 as permitted sender) client-ip=2a00:1450:4864:20::443;
Received: by mail-wr1-x443.google.com with SMTP id t16so21721238wrr.1
        for <jailhouse-dev@googlegroups.com>; Thu, 24 Oct 2019 09:42:14 -0700 (PDT)
X-Received: by 2002:adf:f7d1:: with SMTP id a17mr4119921wrq.111.1571935334070;
        Thu, 24 Oct 2019 09:42:14 -0700 (PDT)
Received: from localhost.localdomain (27.red-79-152-66.dynamicip.rima-tde.net. [79.152.66.27])
        by smtp.googlemail.com with ESMTPSA id 26sm3341383wmi.17.2019.10.24.09.42.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 24 Oct 2019 09:42:13 -0700 (PDT)
From: Alex Largacha <alexlargacha@gmail.com>
To: jailhouse-dev@googlegroups.com
Cc: Alex Largacha <alexlargacha@gmail.com>
Subject: [PATCH 3/3] Documentation: brief explanation of board and software setup for jailhouse in UltraZed
Date: Thu, 24 Oct 2019 18:41:58 +0200
Message-Id: <1571935318-25453-4-git-send-email-alexlargacha@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571935318-25453-1-git-send-email-alexlargacha@gmail.com>
References: <1571935318-25453-1-git-send-email-alexlargacha@gmail.com>
X-Original-Sender: alexlargacha@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=AgzM+6ui;       spf=pass
 (google.com: domain of alexlargacha@gmail.com designates 2a00:1450:4864:20::443
 as permitted sender) smtp.mailfrom=alexlargacha@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

Signed-off-by: Alex Largacha <alexlargacha@gmail.com>
---
 Documentation/setup-on-zynqmp-ultrazed3eg.md | 128 +++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)
 create mode 100644 Documentation/setup-on-zynqmp-ultrazed3eg.md

diff --git a/Documentation/setup-on-zynqmp-ultrazed3eg.md b/Documentation/setup-on-zynqmp-ultrazed3eg.md
new file mode 100644
index 0000000..51972e4
--- /dev/null
+++ b/Documentation/setup-on-zynqmp-ultrazed3eg.md
@@ -0,0 +1,128 @@
+Setup on Avnet UltraZed-EG SOM + UltraZed-EG IO Carrier Card
+============================================================
+The UltraZed-EG SOM target is based on ZynqMP Ultrascale+. The SoC is a
+quad-core Cortex-A53 and a dual-core R5 real-time processor. The IO Carrier
+Card provides access to the user I/O, PS MIO, 4 PS GTR, etc. Further
+information can be found on
+http://zedboard.org/product/ultrazed-EG
+http://zedboard.org/product/ultrazed-eg-io-carrier-card
+
+The Linux Image which runs Jailhouse has been built with Petalinux 2018.3.
+The bsp for the petalinux project is placed in
+https://github.com/alexlargacha/xilinx_bsps/blob/master/ultrazed_hyp_2018.3.bsp
+Petalinux uses linux-xlnx repository, and in this case it uses the
+xilinx-v2018.3 one, which is based on 4.14 kernel.
+
+
+Image build
+-----------
+In order to build the Linux image with Petalinux it is necessary to set all the
+environmental variables. 
+
+    $ source /opt/pkg/settings.sh
+
+Once petalinux environments are set, the Petalinux project is created with the
+name petalinux_jailhouse. The bsp has to be downloaded.
+
+    $ petalinux-create -t project --template zynqMP -s ./ultrazed_hyp_2018.3.bsp -n petalinux_jailhouse
+
+The Linux project is configured by:
+
+    $ petalinux-config 
+
+A menuconfig window is opened and just enable `Root filesystem type (SD card)`:
+
+    Image Packaging Configuration--->Root filesystem type-->SD card
+
+Save project and exit. It will take some to time to configure the project.
+By default, `CONFIG_OF_OVERLAY` and `CONFIG_KALLSYMS_ALL` should be enabled in
+the bsp kernel configuration, but it's worth checking:
+
+    $ petalinux-config -c kernel
+
+Jailhouse needs the Linux kernel boot parameters `mem=` to be set in order to
+reserve memory for other cells. In this case we chose `mem=1024M`. This can be
+done through the device tree. In petalinux_jailhouse/project-spec/meta-user/recipes-bsp/device-tree/files/system-user.dtsi:
+
+    chosen {
+        bootargs = "earlycon console=ttyPS0,115200 clk_ignore_unused earlyprintk mem=1024M root=/dev/mmcblk1p2 rw rootwait";
+        stdout-path = "serial0:115200n8";
+    };
+
+
+Once modified, save the changes and build the project.
+
+    $ petalinux-build
+
+Generate the BOOT.BIN file with fsbl, bitstream, PMU firmware and u-boot.
+
+    $ petalinux-package --boot --fsbl --fpga --pmufw --u-boot
+
+
+Jailhouse build
+---------------
+To build the project, it is necessary to set the variables `ARCH=` with arm64,
+`KDIR=` with the kernel directory inside the Petalinux project, `CROSS_COMPILE=` 
+with the compiler and `DESTDIR=` with the rootfs directory.
+
+    $ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- KDIR=../petalinux_jailhouse/build/tmp/work/plnx_zynqmp-xilinx-linux/linux-xlnx/4.14-xilinx-v2018.3+gitAUTOINC+eeab73d120-r0/linux-plnx_zynqmp-standard-build DESTDIR=/media/user/rootfs install
+
+This command will add the jailhouse module and its binary.
+
+Testing Jailhouse PL IRQ Demo
+--------------------------
+Copy the `configs/arm64/ultrazed3eg-iocc*.cell` to the rootfs. To test Jailhouse
+it is also interesting to copy `inmates/demos/arm64/pl-irq-demo.bin`. This demo
+creates a periodic interrupt based on the output of a pwm module and calculates its lattency. Once Linux is
+running:
+
+    # insmod /lib/modules/4.14.0-xilinx-v2018.3/extra/driver/jailhouse.ko
+    [   24.309597] jailhouse: loading out-of-tree module taints kernel.
+
+    # jailhouse enable ultrazed3eg-iocc.cell 
+
+    Initializing Jailhouse hypervisor v0.11 (33-g14cf4ea-dirty) on CPU 2
+    Code location: 0x0000ffffc0200800
+    Page pool usage after early setup: mem 45/4066, remap 0/131072
+    Initializing processors:
+     CPU 2... OK
+     CPU 3... OK
+     CPU 0... OK
+     CPU 1... OK
+    Initializing unit: irqchip
+    Initializing unit: ARM SMMU v3
+    Initializing unit: PCI
+    Page pool usage after late setup: mem 65/4066, remap 5/131072
+    Activating hypervisor
+    [   62.077158] The Jailhouse is opening.
+
+    # jailhouse cell create ultrazed3eg-iocc-pl-gic-demo.cell 
+    [  177.289476] CPU3: shutdown
+    [  177.292175] psci: CPU3 killed.
+    Created cell "pl-gic-demo"
+    Page pool usage after cell creation: mem 80/4066, remap 5/131072
+    [  177.303889] Created Jailhouse cell "pl-gic-demo"
+
+    # jailhouse cell load 1 pl-irq-demo.bin
+    Cell "gpio-irq-demo" can be loaded
+    # jailhouse cell start 1
+
+Second UART starts showing jitter data:
+
+    Jailhouse IRQ lattency test ...
+    IRQ fired: lattency 1310 ns
+    IRQ fired: lattency 1230 ns
+    IRQ fired: lattency 1200 ns
+    IRQ fired: lattency 1210 ns
+    IRQ fired: lattency 1230 ns
+    IRQ fired: lattency 1190 ns
+
+
+It possible to see the state of each cell:
+
+    # jailhouse cell list
+    ID      Name                    State             Assigned CPUs           Failed CPUs             
+    0       UltraZed SoM            running           0-2                                             
+    1       gpio-irq-demo           running           3
+
+
-- 
2.7.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1571935318-25453-4-git-send-email-alexlargacha%40gmail.com.
