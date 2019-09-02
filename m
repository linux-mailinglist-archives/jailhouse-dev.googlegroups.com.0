Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBPM4WPVQKGQEJHE4PGY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC52A50E7
	for <lists+jailhouse-dev@lfdr.de>; Mon,  2 Sep 2019 10:09:33 +0200 (CEST)
Received: by mail-wr1-x43c.google.com with SMTP id a17sf8430502wrr.10
        for <lists+jailhouse-dev@lfdr.de>; Mon, 02 Sep 2019 01:09:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567411773; cv=pass;
        d=google.com; s=arc-20160816;
        b=kPPW7FPdBNQZpyQkpRd3AJcDqcpMqfGAlH6nzn6TFpDX56RhCDmIsUrldH7i0czuiG
         ulufOAXYpV3aF4ybgM+VN8jHILUsb30cboEdvMNmcW/BIRqHn5LuhKo+1Rp2Xn04nmH6
         /WnL6ixBsHQ7vKG3XqjBgaESu2hlYSKycM8cBkFu/ZePE9ZVNJHN5SeC/JVznyLm91fi
         snfgja+SKuFhbvwJKJ13jSLyPsEYS1bmAPFAJveu2BYkA/utxjJ0fj3ev/UOmP5Cpk22
         UMrppa0GtNJtf5gyWdxkMFetcA+2mNcxYv9U8Uc8il3NnYgZRg1XHBC2J96DrDb5CCF0
         2wzw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:cc:references:to:from
         :subject:sender:dkim-signature;
        bh=rCrt834ZiIlQSqr9Z05CSfHSHGdonluuD3S7wkgbJLA=;
        b=tgEtXf3TNwSXzakyS5guZqZZLyImx8cECqxxqUhJLWK+g6ZeNxVYPmTs+9lNfMdVwr
         uZDS8NyeWu44+pchSgaI25hL1ywCLB2ZY5JI1YiqgsNY2Zy4uVpd3guvioO4EHnpaa1s
         mpG9C2bBtHp878s5PTY8dMu7fdpqc6FAw1mSrJ7TzkdOAHII1g5BUaviQVKnv944ccNo
         ppow57ZdVn/nX955rQbTaKeUvsEbB623Up84BrOVvydLvZxZSrceknrWHU3C2gFcIRgE
         ViBnITQaJykdm4xxW9zBdP94S7ZW4AayD0oIXTCHGDz3Yhad8IUI++D90l7hEWt8eVQg
         LHBg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:cc:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=rCrt834ZiIlQSqr9Z05CSfHSHGdonluuD3S7wkgbJLA=;
        b=bd3u6XThuiJ6/dEE8ClH7hEdSVqTSGsMr+FNtF5Md4TbdpOyfRwis61kVfwP0N4EGp
         1WYAu75zDaUKQjR9br6a34xDXy2WiIvu5vbI5ONjOllzWV+fjFUYmHsZDBoUoR5Zh79e
         fn5VKPdRThSLeXlizEi54G1nECMFd2wFsD7FsNtzwzYs7oGPYF1h3Tm9c8ywNSiibMMa
         qOww5gOw008+/9qCyw7du+KwKmxBTf7sBvts+qOkGDwyWCQRS3b8WXImIxkR67/8B5mY
         pQccXqcHN5dnBsv9FGqCfLgEAaDfMFdURjCDdbamH7FPWDZvdCfgLKyJpk5SkNPyzLOr
         khaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:cc:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=rCrt834ZiIlQSqr9Z05CSfHSHGdonluuD3S7wkgbJLA=;
        b=nFI0rgVIqfKP/QsDcg4kL4eJ5xE88tD5b/AHxRAgpHWTBeQMd0tNRnN7+DHsHrR/P0
         /n5WV8F+EEzjuD8F1FQ6JSjuJsgi22crDBF3Zaey7IKduipz7nDePpYf6nmYtM8kMu/0
         BAUJAZE6rn/ssgVqPCTwbJt5bUFX+k10N3D+92lHGqes5ghCZxIlYmqgwIF+Dh6oOHXT
         xr1VmhHgLPJB8gsmdvTW8KqLa8eL5+a1ARQkQ7weRPtPtCHd+LaNNjWXfUto6iu5oewz
         oRHuHOAMW/yz2h0Jz6WXKmn/XLPz2UiIzCj8eXplN6jrjuX2wgHNKP1ogFT6eHa1+bY7
         X9OQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWskOxXeNEVIXuLhUQ840zI/WT633eJta37UAbPsbR6UDWm1SBo
	6YLRYR/14PLFuTuD3dkCFXs=
X-Google-Smtp-Source: APXvYqwScAP5y3BIL66nLMqINNGxVUicLNy56x7K0FBLjFdQc/aoBSw6xqsx+fdAlE92oXmwiNzoWg==
X-Received: by 2002:a1c:a796:: with SMTP id q144mr26217040wme.15.1567411773124;
        Mon, 02 Sep 2019 01:09:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:550:: with SMTP id k16ls927388wmc.1.canary-gmail;
 Mon, 02 Sep 2019 01:09:32 -0700 (PDT)
X-Received: by 2002:a1c:7f54:: with SMTP id a81mr13569056wmd.100.1567411772504;
        Mon, 02 Sep 2019 01:09:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567411772; cv=none;
        d=google.com; s=arc-20160816;
        b=XBbDj8SqCdkTum7nh+Ws+t4L97u/km9Y/B6pwUxy9Dp9OpURJzuSbWpbcVY+Wh4kWu
         st16aNclE6pLOf6T4OD8My/z2YyKOkOg3Jx6LwcBv/B/03XXrjWDCN/27E9s/jgCWjAU
         1CaP5Q0qB8t1p90BWhTgvIrNWTw24TfaBTHnjo1c+Yu74eyuJZ4mj0Ii8LL765Z5vfUJ
         awa2h5IdXIj67jOjCguTZCYT46x2hBgkDqDt/oJWHYxmsURVUv+s7/SRGn03vK4nTM6/
         Ixu/pOr9OCeUcbN39VpU5fvegS1QFSldDNLejPKBQFdSsuZT8zuB+M07FN3JXFXXsuKO
         TeoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:cc:references:to:from:subject;
        bh=oolONeICFEnlDrq8GUUgHXPYQcEX5EIba2J2jvnoyAM=;
        b=VUbkw7w6uw2fqXRK85ABse/Yjx/yq7YmaPXveaWEeJCnafyizktRl7yK3fhUheQMUP
         1jg7AT6AQJCPvucA40YoFqTaOcRyCziETr7Ns1nlRpxVICBO1/D1QCv3TtMVPTQT4Kxp
         TddoMvWXvibkehFeXR46J0RZHfBh2ZDRS+Cu5ySGFMZnu2ynz285nl6wcCdZ7G0OkGAl
         HUK6eVKbCh9c2cOKkf6JZ2oaUmPc/48VxYnK1FJK6pDHzt6JCfm58iVu00Ieyv8IfVWl
         0V7Xl/PsOPEENh77S7WRUjSxBbWswX/a1tWawWGau6KI8DdnNf/rzQx023udtWnEWDqa
         V0qQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id w17si770500wmk.1.2019.09.02.01.09.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Sep 2019 01:09:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id x8289RHv015874
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 2 Sep 2019 10:09:27 +0200
Received: from [167.87.32.192] ([167.87.32.192])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x8289Q2D021462;
	Mon, 2 Sep 2019 10:09:27 +0200
Subject: [PATCH v2] ci: Update build environment to Ubuntu 18.04
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
References: <f2377f95-78fc-4c83-0eb0-204babeb51e6@siemens.com>
Cc: Steven Seeger <steven.seeger@flightsystems.net>
Message-ID: <08337573-b545-aff2-315b-174504c4caf2@siemens.com>
Date: Mon, 2 Sep 2019 10:09:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f2377f95-78fc-4c83-0eb0-204babeb51e6@siemens.com>
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

From: Jan Kiszka <jan.kiszka@siemens.com>

This allows to switch to gcc 8 which may report issues earlier.

Powerpc does not build with gcc 8 and even also 7, so go with 6.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---

Changes in v2:
 - switch back to gcc 6
 - switch to gcc 8 for the rest

Steven, any chance we get ppc to a newer gcc? Are the issues

https://travis-ci.com/xenomai-ci/xenomai/jobs/229976797#L786
https://travis-ci.com/xenomai-ci/xenomai/jobs/229922504#L3071

fixed in newer 4.14 releases?

 .travis.yml | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index 671c551f72..15efb7ccb1 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -1,15 +1,16 @@
 language: c
-dist: xenial
+dist: bionic
 cache: ccache
 
 addons:
   apt:
     packages:
-      - gcc-aarch64-linux-gnu
+      - gcc-8
+      - gcc-8-aarch64-linux-gnu
       - libc6-dev-arm64-cross
-      - gcc-arm-linux-gnueabihf
+      - gcc-8-arm-linux-gnueabihf
       - libc6-dev-armhf-cross
-      - gcc-powerpc-linux-gnu
+      - gcc-6-powerpc-linux-gnu
       - libc6-dev-powerpc-cross
       - u-boot-tools
 
@@ -20,6 +21,10 @@ env:
     - CCACHE_MAXSIZE=400M
 
 install:
+  - sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 800
+  - sudo update-alternatives --install /usr/bin/aarch64-linux-gnu-gcc aarch64-linux-gnu-gcc /usr/bin/aarch64-linux-gnu-gcc-8 800
+  - sudo update-alternatives --install /usr/bin/arm-linux-gnueabihf-gcc arm-linux-gnueabihf-gcc /usr/bin/arm-linux-gnueabihf-gcc-8 800
+  - sudo update-alternatives --install /usr/bin/powerpc-linux-gnu-gcc powerpc-linux-gnu-gcc /usr/bin/powerpc-linux-gnu-gcc-6 800
   - git clone --depth 1 --branch ${IPIPE_REV} ${IPIPE_KERNEL} ${KDIR}
 
 before_script:
@@ -46,6 +51,8 @@ before_script:
   - ln -s /usr/bin/ccache ~/ccache/arm-linux-gnueabihf-gcc
   - ln -s /usr/bin/ccache ~/ccache/powerpc-linux-gnu-gcc
   - export PATH=~/ccache:$PATH
+  - ${CROSS_COMPILE}gcc --version
+
   - pushd ${KDIR}
   - make -j $(nproc) ${KERNEL_DEFCONFIG}
 
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/08337573-b545-aff2-315b-174504c4caf2%40siemens.com.
