Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBU5S53XAKGQESJME4AI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C3B108A76
	for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Nov 2019 10:05:24 +0100 (CET)
Received: by mail-lj1-x23b.google.com with SMTP id o20sf2733374ljg.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Nov 2019 01:05:24 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1574672724; cv=pass;
        d=google.com; s=arc-20160816;
        b=0/dcJvSZu3apzhidziIHg5vdv+zJ0PFHQVx0jRHniceOAHqL8YEzF/daGsG61FChzw
         E6dZS7uYAgU5qd1RKA43/NOc63Lnh2tJJJPLKK2CQznmaWdowyM65TFxVXtQk5yR9llN
         Q3QASsNweymR5Fb7iW+K6VfzF93IZoZpO/b2N0C+1Vixm/ER2YJVrpS9O3a++WsoT5+2
         4/9WdMAkjY8mbMg3Ld1YcmOd65WM5JBVj5JLTGUM6lfBM+FB4yj+SLiPN8dseF/HNraC
         ut2R7GYRyAQs3AChlqJPjpFFZfVoM870CbGr+eKDsmOYRxKjUm+YHG86zmQETwymSP/Q
         nD/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=+Nfhah0wekW0L9QvG5E0lOmlFFiSeFoODBerCHwUz7o=;
        b=aUBJHzqjgHvsLchjl4TEBn52dIoWK3DxncjZqaAvmKTtUNrhwqpoADlEU/HANWUOYz
         D+dqKvofSBXtron57FYiGCofoIMl9LIFZdYT6nLIb5AySdNLnEh00LhmcfS6l3i0Jxuk
         6yCt0Pykg0GWTZX08D2t8+5uIS/ROnuSCZdf8X9WEwmW5o9hMuRtvZMyJOIpD1zb+fsG
         bMyfV5XlPCSTuQsD6iht7chXUnf4c4y+fNFkMTV2NDr/rAs8wMn02z5GE77EL0iH9Ceu
         +l16JEnQ7QMYrQzwSiA3Ruey/TDhTmAYwH5+1Nd34u0RTibLYTYc4bUHVq/L6CUV39Gq
         KbjA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=+Nfhah0wekW0L9QvG5E0lOmlFFiSeFoODBerCHwUz7o=;
        b=Vux7tOMdOKdCgmEdBW4TSLijng/rAx2DbuMSovrEdWFpIGiMtRZGfZM+ePdBzhs5yb
         4b8LW3HEaDd2AO5vpboMShUi4sae1vbokBIPykhyFjWFY7FtJXrfmyK0aYWXl9zdxvKn
         V2dzJg1ziQZaclG2f1qF6GikH69mjYpUaxA1as1N7PpW8Jl+UD7j0TusDHRmLSZxgL4A
         oOScu79ygK+gkf/ZLWXy40EeLJYj381MzSjioCiZomn+5IZJV76zLofukat//sFhQ8PW
         9fuu1FCOgVugZ58hTI4g5/bhcVAjz5ZwCfK77PAshJeInQ5hUyVQstQ4hxmEWjT4NAtK
         tyTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=+Nfhah0wekW0L9QvG5E0lOmlFFiSeFoODBerCHwUz7o=;
        b=MxrEVb9WeNvN/8jxPyQVD1EuA7HZS4KO1kTFi99BhlV8eRrt0/msAzHQDH0JnUL2rE
         D7WL/qopRShabgdOO9sWImYddmTor2Rl7Uc3sxqxUwc0ycmS8VQrelqU/k4bXsQoHOo2
         YztErvq/I3u20UYp3JI6IPMUG3OG038b/qm2n5GDK2NqTd8xG84BcZMtd8VgQICRNV0w
         fobIbMgQXnWBj0Hsy5FdP4IvHZWsbXj5BBvJ/Q7/sl3906GTAJ9hD/rEw7w1xwtnsuu5
         9SuUJF9TkeFC2Nh/M2a8YAjiV0NoiuKp/hRJLBXycVAQd8FeKcBNjqD40Q3qsm0L8wtb
         wMnw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWBNzJL5woUZRUzgDE4tPZReNIk40OIQW+n4IirC5cLTRA7vqN+
	tUplFw0fNEXdsDEgAR3DxS4=
X-Google-Smtp-Source: APXvYqyZpIC92Cj9fzoQQwLLQwK4xK1Ih9O8f3jWv8g3pAAkuXEg+e1ZVICErp/KCzt8ZqxjtQXYTg==
X-Received: by 2002:a05:651c:1117:: with SMTP id d23mr21847997ljo.90.1574672723590;
        Mon, 25 Nov 2019 01:05:23 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4184:: with SMTP id z4ls1602492lfh.9.gmail; Mon, 25 Nov
 2019 01:05:22 -0800 (PST)
X-Received: by 2002:ac2:5395:: with SMTP id g21mr19954360lfh.50.1574672722037;
        Mon, 25 Nov 2019 01:05:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574672722; cv=none;
        d=google.com; s=arc-20160816;
        b=va2oIgIR2LPEXeuivXje2Y5YTvYHN3W0jT2H7+I8JRDCMJQ7XamZE8a2dQMUevB7rc
         zWEotYBQ/PyAWYIZ1zxDDlLxRgNVDFdg/dDV4lb0zXVV5GNp0EO+gcADaAUgpGL4YUn4
         ESgQOPIP7jXlhhMyqW31UVRB74zJ4FDN7L5Ea2Z0GCSySMvXZZWqqXxR9o49ejj20ZWi
         87VuXhwJDdgu7vGHhdeMGGvrowireJMuR/nuDH4bC+ETBJTgbKbHdJHomJiDSO/vtybq
         Gwxg1TzSSgKMWVLr5USC5uCB5xHV6no5loND11Nmna1+gPsJO/bvqz10gVrHanV1DTUR
         sleA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=8gDrGTPTNDFth9SFUAvMvrkJszMeAV3UWIwt9VMzsUo=;
        b=NqyKuCwVHDamDrYQq7bkhjSGMmrPALFZqlQYXhwn9V/Qcu9cdytYgw2oxaDDtsEjEi
         mrGVwd33XkpdrR0NIo0ZqJIrIsehlxW4JyV3D/lPe6jtwkAVoLjuLo/as1HTCJE1Hcea
         BzsZbn4+CVUfGarDNH32UDQTkmW2Mr6XtyZpl6dGHI/y1z5VEKxwrbEnSGzVbiuVd03I
         F3q5azxRC4jZJINvV9uXIm1eqpPYmxE4eE4GaaU0YJqNUl7ei69/fA11QVxqrIlfCOjR
         K753nXvfVtkNPs6o0YzDKNJtvtn62iCVBqEFvOVs9YS+0DTzJ3VfEucuhzjacmk7lb5u
         X0Xw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id f11si389172lfm.2.2019.11.25.01.05.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Nov 2019 01:05:21 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id xAP95LR1001672
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 25 Nov 2019 10:05:21 +0100
Received: from md1f2u6c.ad001.siemens.net ([139.22.116.118])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id xAP95Ia4030833
	for <jailhouse-dev@googlegroups.com>; Mon, 25 Nov 2019 10:05:20 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 3/3] u-boot-ultra96: Import fsbl and bitstream binaries
Date: Mon, 25 Nov 2019 10:05:17 +0100
Message-Id: <65a0331f1eb530e420a97423ccd0623a41907741.1574672717.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1574672717.git.jan.kiszka@siemens.com>
References: <cover.1574672717.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1574672717.git.jan.kiszka@siemens.com>
References: <cover.1574672717.git.jan.kiszka@siemens.com>
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Our public source, an OpenSUSE contrib rpm, is no longer available for
direct download. So it's no longer avoidable to adopt the two generated/
pre-built binaries we need to compile boot.bin. They originate from

https://build.opensuse.org/package/show/devel:ARM:Factory:Contrib:Zynq:ZCU100/zynqmp-hdf
https://build.opensuse.org/package/show/devel:ARM:Factory:Contrib:Zynq:ZCU100/zynqmp-fsbl

That's a bitstream for the Ultra96 which enables the console UART and a
fitting first-stage bootloader. Both are originally generated by the
proprietary Xilinx toolchain. The fsbl is then widely available in
source code, but the some binary-only bit require a specific, old
toolchain to link against. Trying that path would likely end up in
pulling most of petalinux.

Yes, this is a huge mess. We just didn't invent it.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 recipes-bsp/u-boot/files/ultra96-fsbl.elf.LICENSE  |  27 ++++++++++++++++++
 recipes-bsp/u-boot/files/ultra96-fsbl.elf.xz       | Bin 0 -> 35000 bytes
 recipes-bsp/u-boot/files/ultra96.bif.tmpl          |   4 +--
 recipes-bsp/u-boot/files/ultra96.bit.LICENSE       |  31 +++++++++++++++++++++
 recipes-bsp/u-boot/files/ultra96.bit.xz            | Bin 0 -> 37672 bytes
 .../u-boot/u-boot-ultra96_2019.07-atf2.1.bb        |   9 ++----
 6 files changed, 62 insertions(+), 9 deletions(-)
 create mode 100644 recipes-bsp/u-boot/files/ultra96-fsbl.elf.LICENSE
 create mode 100644 recipes-bsp/u-boot/files/ultra96-fsbl.elf.xz
 create mode 100644 recipes-bsp/u-boot/files/ultra96.bit.LICENSE
 create mode 100644 recipes-bsp/u-boot/files/ultra96.bit.xz

diff --git a/recipes-bsp/u-boot/files/ultra96-fsbl.elf.LICENSE b/recipes-bsp/u-boot/files/ultra96-fsbl.elf.LICENSE
new file mode 100644
index 0000000..1947ed3
--- /dev/null
+++ b/recipes-bsp/u-boot/files/ultra96-fsbl.elf.LICENSE
@@ -0,0 +1,27 @@
+Copyright (C) 2014 Xilinx, Inc.  All rights reserved.
+
+Permission is hereby granted, free of charge, to any person obtaining a copy
+of this software and associated documentation files (the "Software"), to deal
+in the Software without restriction, including without limitation the rights
+to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+copies of the Software, and to permit persons to whom the Software is
+furnished to do so, subject to the following conditions:
+
+The above copyright notice and this permission notice shall be included in
+all copies or substantial portions of the Software.
+
+Use of the Software is limited solely to applications:
+(a) running on a Xilinx device, or
+(b) that interact with a Xilinx device through a bus or interconnect.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
+OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+SOFTWARE.
+
+Except as contained in this notice, the name of the Xilinx shall not be used
+in advertising or otherwise to promote the sale, use or other dealings in
+this Software without prior written authorization from Xilinx.
diff --git a/recipes-bsp/u-boot/files/ultra96-fsbl.elf.xz b/recipes-bsp/u-boot/files/ultra96-fsbl.elf.xz
new file mode 100644
index 0000000000000000000000000000000000000000..ef4a09fde145102abdff0998cc34ce327780fb27
GIT binary patch
literal 35000
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%0DQOOBbWq@2D2U*=|3&I70X(lJ}pF~qw
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
Ykpj@*2f_9Sn6boX`vL#}000D8T1+(3Z~y=R

literal 0
HcmV?d00001

diff --git a/recipes-bsp/u-boot/files/ultra96.bif.tmpl b/recipes-bsp/u-boot/files/ultra96.bif.tmpl
index 4ff0638..8281fb0 100644
--- a/recipes-bsp/u-boot/files/ultra96.bif.tmpl
+++ b/recipes-bsp/u-boot/files/ultra96.bif.tmpl
@@ -11,8 +11,8 @@
 
 image : {
 	[pmufw_image] /usr/share/zynqmp-pmufw/executable.elf
-	[bootloader, destination_cpu=a5x-0] ../usr/share/zynqmp/fsbl.elf
-	../design_1_wrapper.bit
+	[bootloader, destination_cpu=a5x-0] ../ultra96-fsbl.elf
+	../ultra96.bit
 	[destination_cpu=a5x-0, exception_level=el-3,trustzone] ../arm-trusted-firmware-${ATF_PV}/build/zynqmp/release/bl31/bl31.elf
 	[destination_cpu=a5x-0, exception_level=el-2] u-boot.elf
 }
diff --git a/recipes-bsp/u-boot/files/ultra96.bit.LICENSE b/recipes-bsp/u-boot/files/ultra96.bit.LICENSE
new file mode 100644
index 0000000..10f6a42
--- /dev/null
+++ b/recipes-bsp/u-boot/files/ultra96.bit.LICENSE
@@ -0,0 +1,31 @@
+/******************************************************************************
+*
+* Copyright (C) 2016 - 2017 Xilinx, Inc.  All rights reserved.
+*
+* Permission is hereby granted, free of charge, to any person obtaining a copy
+* of this software and associated documentation files (the "Software"), to deal
+* in the Software without restriction, including without limitation the rights
+* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+* copies of the Software, and to permit persons to whom the Software is
+* furnished to do so, subject to the following conditions:
+*
+* The above copyright notice and this permission notice shall be included in
+* all copies or substantial portions of the Software.
+*
+* Use of the Software is limited solely to applications:
+* (a) running on a Xilinx device, or
+* (b) that interact with a Xilinx device through a bus or interconnect.
+*
+* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+* XILINX CONSORTIUM BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
+* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+* SOFTWARE.
+*
+* Except as contained in this notice, the name of the Xilinx shall not be used
+* in advertising or otherwise to promote the sale, use or other dealings in
+* this Software without prior written authorization from Xilinx.
+*
+******************************************************************************/
diff --git a/recipes-bsp/u-boot/files/ultra96.bit.xz b/recipes-bsp/u-boot/files/ultra96.bit.xz
new file mode 100644
index 0000000000000000000000000000000000000000..c57f7118da3d4ca7e68f30e0296d67337ea51dac
GIT binary patch
literal 37672
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%0Acb2lrL}Tfdc(pKDS4U3okQRg<V;9|
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

literal 0
HcmV?d00001

diff --git a/recipes-bsp/u-boot/u-boot-ultra96_2019.07-atf2.1.bb b/recipes-bsp/u-boot/u-boot-ultra96_2019.07-atf2.1.bb
index 14f5879..8e80388 100644
--- a/recipes-bsp/u-boot/u-boot-ultra96_2019.07-atf2.1.bb
+++ b/recipes-bsp/u-boot/u-boot-ultra96_2019.07-atf2.1.bb
@@ -18,14 +18,12 @@ require recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_${ATF_PV}.inc
 SRC_URI += " \
     ftp://ftp.denx.de/pub/u-boot/u-boot-${U_BOOT_PV}.tar.bz2;name=u-boot \
     file://0001-Revert-tools-Makefile-fix-HOSTCFLAGS-with-CROSS_BUIL.patch \
-    https://download.opensuse.org/repositories/devel:/ARM:/Factory:/Contrib:/Zynq:/ZCU100/standard/aarch64/zynqmp-fsbl-2017.1-7.2.aarch64.rpm;name=fsbl \
-    https://download.opensuse.org/repositories/devel:/ARM:/Factory:/Contrib:/Zynq:/ZCU100/standard/noarch/zynqmp-hdf-20180326-4.3.noarch.rpm;name=hdf \
+    file://ultra96.bit.xz \
+    file://ultra96-fsbl.elf.xz \
     file://ultra96.bif.tmpl \
     file://ultra96-rules \
     "
 SRC_URI[u-boot.sha256sum] = "bff4fa77e8da17521c030ca4c5b947a056c1b1be4d3e6ee8637020b8d50251d0"
-SRC_URI[fsbl.sha256sum] = "6f420f4cb049eb4ddd981fb9a1c964db9771e359dc51385a886bbcb27a9a616e"
-SRC_URI[hdf.sha256sum] = "246bef07b16cace18cc7c270dedcec89913b64fa623e590461250e3e038f88fd"
 
 TEMPLATE_FILES += "ultra96.bif.tmpl"
 TEMPLATE_VARS += "ATF_PV"
@@ -41,8 +39,5 @@ S = "${WORKDIR}/u-boot-${U_BOOT_PV}"
 do_prepare_build_append() {
     cp ${WORKDIR}/ultra96-rules ${S}/debian/rules
 
-    unzip -u -d ${WORKDIR} ${WORKDIR}/usr/share/zynqmp/system.hdf \
-        design_1_wrapper.bit
-
     echo "boot.bin /usr/lib/u-boot/ultra96" > ${S}/debian/u-boot-ultra96.install
 }
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/65a0331f1eb530e420a97423ccd0623a41907741.1574672717.git.jan.kiszka%40siemens.com.
