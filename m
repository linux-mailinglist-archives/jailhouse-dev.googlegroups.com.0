Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBFPF4SGAMGQEMRKBDMA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id E4324457FE2
	for <lists+jailhouse-dev@lfdr.de>; Sat, 20 Nov 2021 18:38:29 +0100 (CET)
Received: by mail-wm1-x33e.google.com with SMTP id 144-20020a1c0496000000b003305ac0e03asf7718617wme.8
        for <lists+jailhouse-dev@lfdr.de>; Sat, 20 Nov 2021 09:38:29 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1637429909; cv=pass;
        d=google.com; s=arc-20160816;
        b=yiqJiHFUcfZAlzzz7G1Ai07rWb/JehKbbEUCsKa7iJopB1Jx3tP4iNgoIFnQFbgbNR
         nJMgkm2aWtvu0TeNEVaxNFx+E3bbkYoDd1lkdMWx3hV/yJNtEP+/zll7KRMXS6e7HuC6
         s7d9UZElXFPcsPb5+VByE8s+x7YdlLrNUtv/6u+E5qRw46dyC4fviWq/fl3T9bAusABt
         Kv64aglIKnO8DuDDuVDnYrcDq6JodAaWGCrm03LMDU7AZ3epV7o4Kn3kr+z5EQg6UabX
         wD4Bx6sGxK3F+QdDuBZW7NPYdodQ5EsZvmUv3x9C6McsEJJhJY0iGAqIu5tc1jLUQInE
         gHPg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:cc:to:subject:from:sender:dkim-signature;
        bh=R+FhsFT381k6KJSU1TLEHNFj+C6bs6Vyio2RKI9xgRU=;
        b=W1ovYmHECXnHroJZBuaTDhvJPvoHfIrtd7a/iS2eBehWxgmfgmPAGmhkrExxwnblT2
         PK+7zGTegBYJzcjWehKMoXPDRAlP1GWcdB6lIJoZVSym5wsprDD4lcmRzP59xu1qvAoD
         B0FLjUDDicK5jKEAoMnOKX/0ppWnup1qOTHnnVBsFFdUz11k+4KohPNjSKYnBuUYl/xu
         Pl5O41ekMb53EVgx74DxE04Yiq5+LqObJdh6jiEbgc73XIDEreLdSqWxAgc/crmeaqiZ
         lEMvDVnl2hy2yhzFrFpQX5AoKJ1A70IWIFCGhf60WUMrIA64M97J+6O55kyiQObW1o/Z
         gclg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=JIz90oIa;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=R+FhsFT381k6KJSU1TLEHNFj+C6bs6Vyio2RKI9xgRU=;
        b=CDDvq2yTskO5g8v9ooS4i/xPAD6Nz+uu6YvIgVrj6c1JzrPPhpOycWRO4GRmTakaze
         w7Bw0/A5AkrnLrWf+TiyDERlhjwasjV/naxWCcny8NOKsZsXiTMVnQcYcSh2YmZnhp3E
         YAXvgTTUMCyiQjzZLBG4IhDLwhQyFqgL596OZhW23+lZ31bZaM8tq8/L/sU3e1s6rMD2
         yWYLI3xl2Cg/l2py+XnHKcqPSxzT2DvtPMTHTmPuZNXAIPCw8RxSoHO2pM/Q9nHxjFph
         hezIzqcGPSKgnVhYDBfCYN+pPldaoLYtIuTvJNiw6+tSTiw6E07CO2v2Fz4yPUG4oQO7
         Tw5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:subject:to:cc:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=R+FhsFT381k6KJSU1TLEHNFj+C6bs6Vyio2RKI9xgRU=;
        b=k7N6iaG9YYyBRszahtoMeFjtsgW1l45acsTJSKNcCc553KNX3JRT3qQBvWmUJFIjEH
         QNNVaZnYLi3169UIBNNMQbnd+Plk66B38dw1jKH0n7uX3/Ra7Q07ASBUasdZzBerLc7B
         TujL19OrXO7HbTKsMpjCjLJR8OMZttE9fgnj4mqLvcXGDNSR61eOxRPrD8HuCSLiTNsW
         G0fgzzZVDd2wSjV8dhTr/oeczx6UriIqnB8eitEbSSrEQhVpxOnlCRhpLZyDralCR53t
         cJsagV22LzW8/EnitVH90CnQ/8zfl0UXcAojKBaRWpO4+mpDSWq+LLi0Tkp/PvceWvsh
         3WFQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531dSGP1Dkk+EfeeGhDx7cT/+8xPKaVGPhXqkKdOf9DBL5mF6U4X
	Dkzvw6jKUMy8R69HbeStasc=
X-Google-Smtp-Source: ABdhPJxvxPoLSPDHCDoTy6IaJ95nZCh64cS4dEold5UOKpJt8bc9bEAkJvur1r314BJK/bDs2vzFHg==
X-Received: by 2002:a7b:cc11:: with SMTP id f17mr12105630wmh.122.1637429909575;
        Sat, 20 Nov 2021 09:38:29 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:f1c2:: with SMTP id z2ls3412551wro.2.gmail; Sat, 20 Nov
 2021 09:38:28 -0800 (PST)
X-Received: by 2002:a5d:6211:: with SMTP id y17mr19280086wru.97.1637429908777;
        Sat, 20 Nov 2021 09:38:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637429908; cv=none;
        d=google.com; s=arc-20160816;
        b=SIEy6/58Q1mUnOJ6gUgr9Hb8VD2w9r34M+lXNEHw0xdu2uzxL/rLMcFnv1kBefFkmN
         wnPaD9Gp419uaDwzGA4mijMfVwvSUsDXRl9kmxGyIe3r2Dtu/sYlKXkqImL2LUhuw/H2
         bpNAqZsnQ7Q792xCdWIrzwHR6kdfZIBimwUv0AhaNaWHmpqdRWrgbbVY/Hn/8ZzQv7l8
         ze/qLqoAxtGl8WWJ5sk6r1VAmK5zvukbz6kEztT4oDtN1gScClcrcFnnQKEtxQVfQiSS
         YK2Y9QbftRo76FOH1Is2n0PeQRYNy1EbXnT5fZfWHpNQnNbbAQj3Iqkf99OakizQOTwA
         8zVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:cc:to:subject:from:dkim-signature;
        bh=ParvXowjVGV8VCoOuwFXSm4psJrBFHc1RTfHoB11Cyw=;
        b=dve81rhRsVkhJXWCZd6R7EoZdyVdNQCoUXuvk6XPFqXhbro25stDkHBzMeSSEGi+R6
         mj2SeKwD5w/PnV5F/36ozP2lQu35XDlJKjIsgQAppGnM1OIjaFqobY+Rzk8yf0osic4N
         LZUwmPG6bwKUyxc1XSP3pwMUsdUzizoNFdNbCRF2qqc5pF0EueGlx+X90gO1V88nxmOG
         av1U4wzA7Fk/dVMk27kqzNSf7r5yaro8h0QVo+8knA3yNhqT/vHBccD5Db6N8jCG5tCD
         uMmEF5G2niysuu52ArmM6CQNTfR+phvNolDIK1DutQFFxGvGgPh39ZSk+T5LoFLobtbf
         6Izg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=JIz90oIa;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id p11si1079025wms.3.2021.11.20.09.38.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Nov 2021 09:38:28 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.84.132]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N2SP7-1mf2zM1hol-013SML; Sat, 20
 Nov 2021 18:38:27 +0100
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH] rpi-firmware-brcm80211: Remove obsolete package
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Luigi De Simone <luigi.desimone3@gmail.com>
Message-ID: <0504d918-6c5e-54e2-17bf-81ac081cabc1@web.de>
Date: Sat, 20 Nov 2021 18:38:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:OweWKJkQXHeUhkC5HtO8EP3LE13QI6cjZc+lw9W7I1LS0+HpGPS
 F7YVRGVO1DAzsUxZPWa5SjRotenFHc+z7+KJc7aZGJ4BRrPs7n+H14Pw3ZELbUtl4L3aqBL
 gdf3xfhQy73/goV7W6joqx/tgsGcaMQaSv3IGz2jhWbiwJ2lPzkdAHxW6YI5rwfeMMh9eaJ
 xMOidJzpe8Ky4KlE/od/g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:JSOhuaQrmmE=:R0anB+zZpFWC9UWY8+H4BQ
 7mUBbmsLO55kUVFN6E8Vju73uSngmOjycDhop+cdq6Jy9+MmtDYYkQBvNSO2tSCuitMqZ9ySu
 1TrZzfILOvOWYt7xWp1qleX5RMrZhcIoBjgRXAHjvF6ZA0QDQbZg4zrhby9nnq+KerLaDZqG7
 Tp3eIuWbpUC7VQ3V0PRXXdHQCcgnSFcqsyt4mLKhI64ZiOU9Yy8zFLimPHIxPv8pDstoHTJeV
 JQw1wYtj+Mn6s/922GmCdwZtH7UDU39aX0fcOSC6TbgJIWZqLrw44GjC11GQ/24ZU5j4IbBDg
 voUREfJPBcqK7KVtEdosNU4911ntcH2HSzguBsJMVnhF7Hah9CHj3R4aC8Po0pPaDjs6cOS0k
 DY5XvJy+tJOU1VgNg3jSRFMDjb8AoLJVSDWytQ4VOkpymiDo4lYpTkN37R8vVSojWeAeJFmS2
 inW4OMP++DegWEpAGRc5n3i/7N4g+qMed4KMHlmDPw/CFTBCwpb8sC9TLl2QDFiDrN+31RueJ
 1bYHJiUsgY/tU3DhDzM2h+hNlEaxJ+AIA483L3JXAzTA/fXFzLBzRqlq92wj99RHJFBqsVjt/
 kyazJQC3ZWUupAjvC/L4HKC6GdUwQunc53sDiWAwFPIm1PO08rV9uTiK2Jv08WXFfmVnU8bZ3
 t63C3qHNgserYmJvE3p2Ypm1dipvmSa6oarh20ea44TSjZxNqIHEcGLcGOMJxepTbBJ9JhXJB
 cQ4ZwCaoT+hiI9lP0sl8NJuTBkmgLO/g1/lKe6poplCveFLT3fVRNZlQ4YRU23EO5ghE2O/pY
 blDftz9GrElMlivl7HTiAVt2a4JYpSkZN0f7wJC+kncSAWFBWAi8iF6Je35Va2dsqncjYG94j
 lUEsIBQjuROUhaeJOP5q/fbCZ1tLepwR2cAkNyXFSD+tAUeA8SFpLlZprrImDnc3VM3DI5692
 eMctdY0iHCfL+eNK6mfHjskVP2AD+VcUpWSmXpY8/PO4rD7766pNN6FJ1l4GgsRbUyL+fvOwc
 izLovfvqqjBTFEIKwjyRyU4rXsWTaLld2+C9XRnGYhuXC4mJTDa4cmyMzyKO4IY+KvsU4kRiG
 6glBMfZXWzWoIM=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=JIz90oIa;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=web.de
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

With bullseye, Debian's firmware-brcm80211 contains what was still
missing in buster. Now this duplication breaks the image build.

Fixes: d73b2d97376d ("Update jailhouse-demo distro from Debian 10 to 11")
Reported-by: Luigi De Simone <luigi.desimone3@gmail.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 conf/machine/rpi4.conf                        |  1 -
 .../rpi-firmware-brcm80211.bb                 | 24 -------------------
 2 files changed, 25 deletions(-)
 delete mode 100644 recipes-bsp/rpi-firmware-brcm80211/rpi-firmware-brcm80211.bb

diff --git a/conf/machine/rpi4.conf b/conf/machine/rpi4.conf
index e8985e8..2aa2151 100644
--- a/conf/machine/rpi4.conf
+++ b/conf/machine/rpi4.conf
@@ -31,4 +31,3 @@ IMAGE_BOOT_FILES = " \
     "

 IMAGE_PREINSTALL_append = " firmware-brcm80211"
-IMAGE_INSTALL_append = " rpi-firmware-brcm80211"
diff --git a/recipes-bsp/rpi-firmware-brcm80211/rpi-firmware-brcm80211.bb b/recipes-bsp/rpi-firmware-brcm80211/rpi-firmware-brcm80211.bb
deleted file mode 100644
index 602d8d7..0000000
--- a/recipes-bsp/rpi-firmware-brcm80211/rpi-firmware-brcm80211.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-#
-# Jailhouse, a Linux-based partitioning hypervisor
-#
-# Copyright (c) Siemens AG, 2020
-#
-# Authors:
-#  Jan Kiszka <jan.kiszka@siemens.com>
-#
-# SPDX-License-Identifier: MIT
-#
-
-inherit dpkg-raw
-
-SRC_URI = "https://github.com/RPi-Distro/firmware-nonfree/archive/${SRCREV}.tar.gz;downloadfilename=firmware-${SRCREV}.tar.gz"
-SRCREV = "b66ab26cebff689d0d3257f56912b9bb03c20567"
-SRC_URI[sha256sum] = "033a21d19fbdc7617b8c5b58d4be5951e29be5be787a45875b615f4d4dcf3f5b"
-
-do_install() {
-    cd ${WORKDIR}/firmware-nonfree-${SRCREV}/brcm
-    install -v -d ${D}/lib/firmware/brcm/
-    install -v -m 644 brcmfmac43430-sdio.txt ${D}/lib/firmware/brcm/
-    install -v -m 644 brcmfmac43455-sdio.clm_blob ${D}/lib/firmware/brcm/
-    install -v -m 644 brcmfmac43455-sdio.txt ${D}/lib/firmware/brcm/
-}
--
2.31.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0504d918-6c5e-54e2-17bf-81ac081cabc1%40web.de.
