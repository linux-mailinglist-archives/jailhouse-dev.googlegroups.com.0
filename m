Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBXXN4SGAMGQEOT2UT4A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7FA457FEE
	for <lists+jailhouse-dev@lfdr.de>; Sat, 20 Nov 2021 18:56:46 +0100 (CET)
Received: by mail-wm1-x33f.google.com with SMTP id l187-20020a1c25c4000000b0030da46b76dasf7725805wml.9
        for <lists+jailhouse-dev@lfdr.de>; Sat, 20 Nov 2021 09:56:46 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1637431006; cv=pass;
        d=google.com; s=arc-20160816;
        b=DjPJ8/rUrusF/4hTDBf+EKLEcGicFvQMhBoEdZLlxMISVuIaSf9loeKWUXvEHblzLr
         HtHLUpVsJHXIc50G5UQ1LqV0pxQRSGU373H0q5zrqKa+DFVe7zfOEFSW3Lki0Neyx8Tf
         u8dBgl0Y0bB7OaZ0cFYVoHKPdpAckLsChfrcAOr8V3JF4k6FnZCM2D95zAu7FIII40Gj
         a2AFFwCunSUdFYDMtUfOLNk1UAT80Z59vSmrHFqc/xJKJQePmvB1TPqhNoWIJn7S7baQ
         od+MmayHzq/x+r7ZTFA/3raXteoSvUFV/4kJ83mCQeQEjVghCTo8t/E1sDt8v411M10Z
         YFGA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=GcgulQWe9O0kqbwJd8ApeggGH59AkuRS7axxpo84AuY=;
        b=FVvkwwHi3ZbjP6x20669bx7WA16Y1IwNKSBoVxH4RSRVwE6z8vGbBNUpOtX/P17iBP
         JWLn+VrI4SFzyIN52Me0IOQMB142B5/ker9oHOoIJbU+PYK3lUFdsbPl9ZeEiog7IRts
         ROEtI1tWnlrU6HPtai4fPeQ2jZBbVoDC1GHYF+AgEheyf5XNDp6xogLPbsCXDlqHP9Ng
         q5PS3S8FRZCo7YNihz76uEkMFAbrOqMfKD0Jw/47DFCBV/una03jViIQ1Wd3Ei+GYP7O
         XJ/RbxhppTQR2XB1LUr+cWgI2s7jBtI8hb6zvIGsQTF6fQ42FCNcgCIBabYwOOAgWCBd
         jAnA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=BZnn61PR;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GcgulQWe9O0kqbwJd8ApeggGH59AkuRS7axxpo84AuY=;
        b=V76pLrH9eipzNPh2d1l1Ajoy7vCwDp7M+twVrYbIpAOgSCMDDZmjSpWh99ZBDc8WKI
         t48GkBtTVHbgQJ/8pZzov+oEr9c/xQS1jKgIXF2tf5TIHzsV09f/q8SiB86Q01aRgzZ+
         /CfRgn8vx4NP9hCqLMIZV33P/n/UzdwXmRo6YHiYu27YEnzOMq5mUxT5/M104huKvlH2
         AntMUHKZNgnKEF7E6H2Fn2XpdYDMt0sXULj2npcc3J7/idcoAxCJ2bYxqBrJwhrswYWz
         j3K1lrH+03z4nGiudF0tf5XGCrZVleK7SP4rWLiE9kj1qXlxgRuAMOmJNVTjvu5KFK3Z
         z3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GcgulQWe9O0kqbwJd8ApeggGH59AkuRS7axxpo84AuY=;
        b=P93x2G0K3oxTnBM5kJnwmOaAA3YUJXDwz6uLyij4iABJkMxEc4NHgihz9+4fL7ThP4
         pFwHNcs61b0gdHxsYMFS7ayj7FzSBYX4WN5RfvzEtkCIsxqo0GjijBlKqXJ2rbQkR8il
         ZXtUdpSZp2a01s3Kai2n4Asr4OWQzH/9N9Uqv3vOsf3NZ5LNc6arKTf2lfSpbCfVHza+
         3a0eyHgjV3228TUiVnCO0TkpobdNWLTbUDVCHQMzQao/xMfPHOe/kcjfGsQHlRpx4ys0
         3PP9Dy7lrCxZN/zAhE0TbwiP3IcJqGJ2uPZWh3SkABmjD7eQQT8DzrLKUa/rAJGWz/u3
         O7pA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533NmjDvGhV6kjTiQzn0O8Af2fPTX32xcf3FS+e7sw9CEVSdB6qT
	JCzpi9N5rOMD2unwE8LerJw=
X-Google-Smtp-Source: ABdhPJxFlB+hbG07mo0Wm9+Fo66QPb/gjUB8Pb4O8PrBxrP+fHqjHw9ZQJTqoJZ17IHSZ37arap3QA==
X-Received: by 2002:a5d:464c:: with SMTP id j12mr19746965wrs.150.1637431006638;
        Sat, 20 Nov 2021 09:56:46 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4092:: with SMTP id o18ls3451375wrp.1.gmail; Sat, 20 Nov
 2021 09:56:45 -0800 (PST)
X-Received: by 2002:a5d:680b:: with SMTP id w11mr19920350wru.345.1637431005879;
        Sat, 20 Nov 2021 09:56:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637431005; cv=none;
        d=google.com; s=arc-20160816;
        b=u/j06lRL8hf4GFoSVWH8RIEWH7qntrKqCXQ2uvb5gMByWq6PPUjm00yPNzKH3E+xYx
         pVeXaVQcMDCMQtAV6UFWk/SbuUmD5oTYHt+ibAWBs0A5Qy1YapE2wLWkqPpsrJKtTM0K
         LhgSUUbN8z/5SiQUmyv5WbMmFgOM9yT+tYffmF9+im2dC2++5Nl32MOYzG1NopsxOYyA
         NU/p/s+bmIIU/USjNN4DbLCmN2XQDJPlDe/xxTWWB2rIAmmOmT/o5AKzmxUxcOiXc5ek
         4ezWUtMAAEn2ACTMoJFZc2Bjsk5TxFwN5DS+H9/IKWGwjtNjD7+ZKhlAoq9BpCdijtXT
         XiKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=+YSTt18+Qsse7KDQ3D1QLJOARjlakyPCLeDe4OxAnlo=;
        b=CSn2YeoujvrmNt6rmNxembIa5Q/37L+BVHdE//TTScxlDBwDqNRj/93mWP2LkVVKiS
         sCJFnUcXva65+YfQVaGD3Mv7st/Jsk1r4j0RpVL2HpLmDvCVcMj/3UjSKI9dUOCjFUuX
         Od0fdyYWxe41lCr2ndjGL3NOqjmhefzLTk4joxjct0qPrsn7SKwHwaVscsiSfnG4IZo6
         rXngQAWYrojgQQ8kTUovrGSznyoijpE/w+CBjoA+NCgerGd6tcjy6E6DSULZMlyPXGda
         cTA4Ydld31n2v7GjM08+qeprnnsByOVnTSIr8CUV+o3qYeOhf3ATA6xw6E8QzaI7tR93
         2GRw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=BZnn61PR;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id c2si1574923wmq.2.2021.11.20.09.56.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Nov 2021 09:56:45 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([88.215.84.132]) by smtp.web.de
 (mrweb005 [213.165.67.108]) with ESMTPSA (Nemesis) id
 1M4KNZ-1moDca1igj-000Tkr for <jailhouse-dev@googlegroups.com>; Sat, 20 Nov
 2021 18:56:45 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 4/4] Add kas menu support
Date: Sat, 20 Nov 2021 18:56:34 +0100
Message-Id: <0a01dd4ca08e9e2163c76bf043a06e8a2fa88bec.1637430993.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1637430993.git.jan.kiszka@web.de>
References: <cover.1637430993.git.jan.kiszka@web.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Ad04MmAvx+uvHEIH5NBvWpzglUDahP0CO6hZBN0AmtyJY/pPpEF
 3RKtCc8/oSPsImjXPqvDP8QVk7k9pZ8Lv5hbIUlJw7RDP4aWwFE282PPM3TE6gRdTQRvFGf
 Rn2dzEwpPCcOEBFpiMjL3ftpyvWuI47R7dxTaOtatKh19QV8l9S+mJQ+Cs0pjh61BgHMUR2
 BUEqRIqZCSuSCHZMktSlg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9PGDaDw+vag=:xXOKAR4M+baTPacH7/TCtG
 rqbxiagrkZw3AhY6NHnTlh/OZulwwZ4G/PPaDPHWuTGyKCjZpMjCJSCgn37JCn+/8lR0AFpHU
 F9DH23B8xdcGMoQ+uMwxSddV1uLlXDbNkSXHbT/RteJombdBjfHuQTYXwu/BEhnmuv+r7c4J/
 etbIkb7TFFACeX4Ku5t5CfCrXJ/BOKAv5zOiIJTcmLSmXi5goSs0x6Ik6A5j1u1q5xyg9/Jql
 MWNXDemXMf8oWw2c5XREX+y4dYEZPoQY4PhClpvQ/nuLhwt991qB3oyCFvsmgoBFIQ5+FBsq/
 DsCbZNuqH2YxPZ2FkIVBzPFe/NQx1OBPSYncMgBQUC0gXjFUYfj7T2K5ueifsrc2/HTNHSqf2
 E4H4qEnhxvV9/ObkEy67YGGHTCQ1oL2JoR5stG1QovVbGoa7GDsjUaTTVBWVzgAcRfd4M/66q
 w55bXdRlZDuhvV7wFuYdEedOIPZNTA5KmhPnrrB3QipJY7bmn74Lv9TB2EElC8QSHAO487xvq
 2Y2Xlf+rIV6JnvEYCsNHdH5NYHhwcLPwzoSLuHDvCmB+cUgLl+pP5GoFp8xnmdnGl2JH88JSQ
 4VrD3u/A5FccW4ytzjoOH/t+yBM+JXl/wwIJtRL39vmHcgcrUXiXXVX2JeqoKj8xYs31O8TKW
 QYC+GEjOZTZoGIUrH5GDQWA1x+ANvZHUM1xyNhZELbfjoSae+HgykrewPEqVw0zaeZZVTED1X
 EnB/mAHbGA+sIwXuSdohso+XeD72N4fA2cBF2Unoj8VfCBJK8CQYlmJQnR2aZlrDiqI/9jk1R
 vPbxtLM9Lc+BptAk2y1uA3nbdu0MTodMCnJi65B6y3UuXSs2yGWV1SLYtLVeIBRDZU9IMpeJI
 9EtJ1exLxsJ6tMn38cwU6LHM7hjnTO0quVP3Ay6792nRaiXHpsMngoH9za1IAbdG5d4UNjeEp
 A56BzF9on3ESG9j3vMzOQZ2Em7oeYLa4j98iLnFDWyG6c9M7s7m+Km0VcGZwKZACDzpChjnzD
 kcvMjngjb7QD2AWUpkNfhB6JTKeYN7c1C01T4jdzCEWE2FegXNMjJqj44xQMHdeVFDaOwy5Y6
 P66dbcaIJxgvks=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=BZnn61PR;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=web.de
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

Replace the build-images.sh script with the new kconfig-based menu of
kas. For CI purposes, we can grab the full list of targets simply by
filtering the Kconfig file for "mc:..." strings.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .gitignore      |   1 +
 .gitlab-ci.yml  |   6 +-
 Kconfig         | 154 ++++++++++++++++++++++++++++++++++++++++++++++++
 README.md       |   6 +-
 build-images.sh | 102 --------------------------------
 images.list     |  13 ----
 6 files changed, 161 insertions(+), 121 deletions(-)
 create mode 100644 Kconfig
 delete mode 100755 build-images.sh
 delete mode 100644 images.list

diff --git a/.gitignore b/.gitignore
index fe0ae1a..381f14e 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,3 +1,4 @@
 build/
 isar/
 recipes-core/customizations/local.inc
+.config.yaml*
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 354fd1f..08e9d19 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -10,9 +10,9 @@ all:
     - export https_proxy=$HTTPS_PROXY
     - export ftp_proxy=$FTP_PROXY
     - export no_proxy=$NO_PROXY
-    - while read MACHINE DESCRIPTION; do
-          KAS_TARGET="${KAS_TARGET} mc:${MACHINE}-jailhouse-demo:demo-image";
-      done < images.list
+    - for TARGET in $(grep "\"mc:" Kconfig | sed 's/.*"\([^"]\+\)"/\1/'); do
+          KAS_TARGET="${KAS_TARGET} ${TARGET}";
+      done
     - export KAS_TARGET
     - cd ..
     - kas build jailhouse-images/kas.yml
diff --git a/Kconfig b/Kconfig
new file mode 100644
index 0000000..0d0e65c
--- /dev/null
+++ b/Kconfig
@@ -0,0 +1,154 @@
+mainmenu "Jailhouse Reference Images"
+
+config KAS_INCLUDE_MAIN
+	string
+	default "kas.yml"
+
+config KAS_BUILD_SYSTEM
+	string
+	default "isar"
+
+comment "Targets to be built"
+
+config TARGET_QEMU_AMD64
+	bool "QEMU/KVM Intel-x86 virtual target"
+	default y
+
+config KAS_TARGET_QEMU_AMD64
+	string
+	depends on TARGET_QEMU_AMD64
+	default "mc:qemu-amd64-jailhouse-demo:demo-image"
+
+
+config TARGET_QEMU_ARM
+	bool "QEMU ARM virtual target"
+
+config KAS_TARGET_QEMU_ARM
+	string
+	depends on TARGET_QEMU_ARM
+	default "mc:qemu-arm-jailhouse-demo:demo-image"
+
+
+config TARGET_QEMU_ARM64
+	bool "QEMU ARM64 virtual target"
+
+config KAS_TARGET_QEMU_ARM64
+	string
+	depends on TARGET_QEMU_ARM64
+	default "mc:qemu-arm64-jailhouse-demo:demo-image"
+
+
+config TARGET_ORANGEPI_ZERO
+	bool "Orange Pi Zero (256 MB edition)"
+
+config KAS_TARGET_ORANGEPI_ZERO
+	string
+	depends on TARGET_ORANGEPI_ZERO
+	default "mc:orangepi-zero-jailhouse-demo:demo-image"
+
+
+config TARGET_NUC6CAY
+	bool "Intel NUC (NUC6CAY, 8 GB RAM)"
+
+config KAS_TARGET_NUC6CAY
+	string
+	depends on TARGET_NUC6CAY
+	default "mc:nuc6cay-jailhouse-demo:demo-image"
+
+
+config TARGET_Q7_AL_E3940
+	bool "MSC Q7-AL-E3940-24N0211I"
+
+config KAS_TARGET_Q7_AL_E3940
+	string
+	depends on TARGET_Q7_AL_E3940
+	default "mc:q7-al-e3940-jailhouse-demo:demo-image"
+
+
+config TARGET_ESPRESSOBIN
+	bool "Marvell ESPRESSObin (1 GB edition)"
+
+config KAS_TARGET_ESPRESSOBIN
+	string
+	depends on TARGET_ESPRESSOBIN
+	default "mc:espressobin-jailhouse-demo:demo-image"
+
+
+config TARGET_MACCHIATOBIN
+	bool "Marvell MACCHIATObin"
+
+config KAS_TARGET_MACCHIATOBIN
+	string
+	depends on TARGET_MACCHIATOBIN
+	default "mc:macchiatobin-jailhouse-demo:demo-image"
+
+
+config TARGET_HIKEY620
+	bool "LeMaker HiKey (Kirin 620 SoC, 2 GB edition)"
+
+config KAS_TARGET_HIKEY620
+	string
+	depends on TARGET_HIKEY620
+	default "mc:hikey620-jailhouse-demo:demo-image"
+
+
+config TARGET_ULTRA96_V1
+	bool "Avnet Ultra96 v1"
+
+config KAS_TARGET_ULTRA96_V1
+	string
+	depends on TARGET_ULTRA96_V1
+	default "mc:ultra96-v1-jailhouse-demo:demo-image"
+
+
+config TARGET_ULTRA96_V2
+	bool "Avnet Ultra96 v2"
+
+config KAS_TARGET_ULTRA96_V2
+	string
+	depends on TARGET_ULTRA96_V2
+	default "mc:ultra96-v2-jailhouse-demo:demo-image"
+
+
+config TARGET_RPI4
+	bool "Raspberry Pi 4 (1-8 GB editions)"
+
+config KAS_TARGET_RPI4
+	string
+	depends on TARGET_RPI4
+	default "mc:rpi4-jailhouse-demo:demo-image"
+
+
+config TARGET_PINE64_PLUS
+	bool "Pine64+ (Allwinner A64, 2 GB edition)"
+
+config KAS_TARGET_PINE64_PLUS
+	string
+	depends on TARGET_PINE64_PLUS
+	default "mc:pine64-plus-jailhouse-demo:demo-image"
+
+
+comment "Image options"
+
+config RT
+	bool "Use Preempt RT kernel"
+	help
+	  Use Preempt RT kernel for root and non-root cell. Typical RT tests
+	  are included in the image.
+
+config KAS_INCLUDE_RT
+	string
+	depends on RT
+	default "opt-rt.yml"
+
+
+config LATEST
+	bool "Build latest Jailhouse version"
+	help
+	  Build Jailhouse from 'next' branch in git, rather than from the
+	  last release.
+
+config KAS_INCLUDE_LATEST
+	string
+	depends on LATEST
+	default "opt-latest.yml"
diff --git a/README.md b/README.md
index 2fb7ebd..b5895e3 100644
--- a/README.md
+++ b/README.md
@@ -18,8 +18,8 @@ The host-side requirements are:
 - kvm_intel module loaded with parameter `nested=1` (for qemu-x86 image on
   kernel < 4.20)

-To build a target image, just run `build-images.sh` and select one (or
-both) of the QEMU targets. The generated image can then be executed using
+To build a target image, just run `./kas-container menu` and select one (or
+more) of the QEMU targets. The generated image can then be executed using
 `start-qemu.sh ARCHITECTURE`. Currently supported are `x86` (only works on
 Intel CPUs so far), `arm64` and `arm` as architectures. On x86, make sure the
 kvm-intel module was loaded with `nested=1` to enable nested VMX support.
@@ -28,7 +28,7 @@ kvm-intel module was loaded with `nested=1` to enable nested VMX support.
 Quickstart for Physical Targets
 -------------------------------

-Call `build-images.sh` and select the desired target. Afterwards, flash the
+Call `./kas-container menu` and select the desired target. Afterwards, flash the
 image on an empty SD card, e.g.:

     dd if=build/tmp/deploy/images/orangepi-zero/demo-image-jailhouse-demo-orangepi-zero.wic.img \
diff --git a/build-images.sh b/build-images.sh
deleted file mode 100755
index da24867..0000000
--- a/build-images.sh
+++ /dev/null
@@ -1,102 +0,0 @@
-#!/bin/sh
-#
-# Jailhouse, a Linux-based partitioning hypervisor
-#
-# Copyright (c) Siemens AG, 2018-2019
-#
-# Authors:
-#  Jan Kiszka <jan.kiszka@siemens.com>
-#
-# SPDX-License-Identifier: MIT
-#
-
-usage()
-{
-	printf "%b" "Usage: $0 [OPTIONS]\n"
-	printf "%b" "\nOptions:\n"
-	printf "%b" "--latest\tBuild latest Jailhouse version from next" \
-		    "branch.\n"
-	printf "%b" "--rt\t\tBuild with PREEMPT-RT kernel.\n"
-	printf "%b" "--all\t\tBuild all available images (may take hours...).\n"
-	printf "%b" "--shell\t\tDrop into a shell to issue bitbake commands" \
-		    "manually.\n"
-	exit 1
-}
-
-JAILHOUSE_IMAGES=$(dirname "$0")
-KAS_CONTAINER=${KAS_CONTAINER:-${JAILHOUSE_IMAGES}/kas-container}
-KAS_FILES="${JAILHOUSE_IMAGES}/kas.yml"
-CMD="build"
-
-while [ $# -gt 0 ]; do
-	case "$1" in
-	--latest)
-		KAS_FILES="${KAS_FILES}:${JAILHOUSE_IMAGES}/opt-latest.yml"
-		shift 1
-		;;
-	--rt)
-		KAS_FILES="${KAS_FILES}:${JAILHOUSE_IMAGES}/opt-rt.yml"
-		shift 1
-		;;
-	--all)
-		KAS_TARGET=
-		while read -r MACHINE DESCRIPTION; do
-			KAS_TARGET="${KAS_TARGET} mc:${MACHINE}-jailhouse-demo:demo-image"
-		done < "${JAILHOUSE_IMAGES}/images.list"
-		shift 1
-		;;
-	--shell)
-		CMD="shell"
-		shift 1
-		;;
-	*)
-		usage
-		;;
-	esac
-done
-
-if [ -z "${KAS_TARGET}" ]; then
-	echo "Available images demo images:"
-	IFS="	"
-	MACHINES=
-	NUM_MACHINES=0
-	while read -r MACHINE DESCRIPTION; do
-		MACHINES="${MACHINES} ${MACHINE}"
-		NUM_MACHINES=$((NUM_MACHINES + 1))
-		echo " ${NUM_MACHINES}: ${DESCRIPTION}"
-	done < "${JAILHOUSE_IMAGES}/images.list"
-	echo " 0: all (may take hours...)"
-	echo ""
-
-	printf "Select images to build (space-separated index list): "
-	read -r SELECTION
-	[ -z "${SELECTION}" ] && exit 0
-
-	IFS=" "
-	KAS_TARGET=
-	for IDX in ${SELECTION}; do
-		if [ "${IDX}" -eq 0 ] 2>/dev/null; then
-			KAS_TARGET=
-			for MACHINE in ${MACHINES}; do
-				KAS_TARGET="${KAS_TARGET} mc:${MACHINE}-jailhouse-demo:demo-image"
-			done
-			break
-		fi
-
-		N=1
-		for MACHINE in ${MACHINES}; do
-			if [ ${N} -eq "${IDX}" ] 2>/dev/null; then
-				KAS_TARGET="${KAS_TARGET} mc:${MACHINE}-jailhouse-demo:demo-image"
-				break
-			fi
-			N=$((N + 1))
-		done
-		if [ ${N} -gt ${NUM_MACHINES} ]; then
-			echo "Invalid index: ${IDX}"
-			exit 1
-		fi
-	done
-fi
-export KAS_TARGET
-
-${KAS_CONTAINER} ${CMD} "${KAS_FILES}"
diff --git a/images.list b/images.list
deleted file mode 100644
index 4e500fd..0000000
--- a/images.list
+++ /dev/null
@@ -1,13 +0,0 @@
-qemu-amd64	QEMU/KVM Intel-x86 virtual target
-qemu-arm	QEMU ARM virtual target
-qemu-arm64	QEMU ARM64 virtual target
-orangepi-zero	Orange Pi Zero (256 MB edition)
-nuc6cay		Intel NUC (NUC6CAY, 8 GB RAM)
-ipc127e		SIMATIC IPC127E (2 cores / 2 GB edition)
-espressobin	Marvell ESPRESSObin (1 GB edition)
-macchiatobin	Marvell MACCHIATObin
-hikey620	LeMaker HiKey (Kirin 620 SoC, 2 GB edition)
-ultra96-v1	Avnet Ultra96 v1
-ultra96-v2	Avnet Ultra96 v2
-rpi4		Raspberry Pi 4 (1-8 GB editions)
-pine64-plus	Pine64+ (Allwinner A64, 2 GB edition)
--
2.31.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0a01dd4ca08e9e2163c76bf043a06e8a2fa88bec.1637430993.git.jan.kiszka%40web.de.
