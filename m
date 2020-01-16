Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBSXYQDYQKGQEUO5UEIA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id C607913D7F5
	for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jan 2020 11:34:50 +0100 (CET)
Received: by mail-wr1-x43c.google.com with SMTP id w6sf9054882wrm.16
        for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jan 2020 02:34:50 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579170890; cv=pass;
        d=google.com; s=arc-20160816;
        b=ghy7DMJWewn0bMbteLrQxI6rk6K+pKN7a0xzE+bAbyEjY8oSjWEKED6m/AV4cWU84C
         OMViMqIULgkvdOC3HARpSDF/8gbBbsQdno9zUx0SdR6BvJLEfoyELj+fj4mpJflbfq4N
         B/CRyMlvSolYVA9SYYdgAr5dcxJ1ACzFYPh/nOaBXiK1ftb+jfriG3SGbOhyxUExcjVH
         toE6fx4rIQKSiXZA2D21+iKXEttY7gLxwaD6SiLabfeAXp4WNPdD8M18W7u/qQLn4Atm
         Bf0r9W8bQ1mMczuwUkbk/OeAl28Vj/ZmftMbfKjV3LkCUwfpRaEijmNsvQtSvqwtH1pw
         DiXg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=DWUwKt71thEMN3/t1OVBZzwvcGjnAiXmHawoYwAhllk=;
        b=qNsLmCP1YYLTO/B3jA24ls7Mj9DjbUOnviQlu83x/aCjMrxLadYTL+wXKMzuqlX/Aw
         xqie9VNqbTTOLx7UQzfUkxKREMDZnu1c3fDy/uq/i/9GS9oVxwf+hmHgVU0/OIjNJW1W
         unUXacWNYjP6rpp+PNX5XeKxSEJC3zArDqZwqXQUtX54UtX3emL3c2vb2SsJx70o+G7A
         hXsyhztFcAcAenXfowh3ov9nNk1z47ZinbnQsX2Q5I+WajtrPGI25uHATFnaL0GfPWBY
         IENZaEkzix9vyjq1I9jHCEGHRmThu4/OEOiOucBTlSIYJ8YORa1lQTIvnDq3UXTtHHep
         Yu7g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=DWUwKt71thEMN3/t1OVBZzwvcGjnAiXmHawoYwAhllk=;
        b=apVt48rVviHwbzcD5l8f7JCuqzLM7qDhRG8XCM7Ezw9V33U2ECE/m94efProXM9gr1
         HDeYmSCQYxNMiV/6eF9uG7bYrZYv1Elo6jr0OKOZD5zwybgCeDzAWxdTxx6gvgi2B+5m
         rfT3EIWehOy/8kBS/+kN3v/8+45+nLwJaOaD+bMrvodvXxyBmTYDsQ5dv3tHSZmWMpy9
         sePQpkqlV8cSYOK0fjTYkN2I9Ou+IuTmUEnnHgXSEz12azFsSOQhokl9bUR5PQRgiNAI
         NilXn76KM1pG4W+dX2FVcOZt6knDkjW9g7P0XueCc6MxaIshAX39xgxso6HthcqFjvzd
         5xQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=DWUwKt71thEMN3/t1OVBZzwvcGjnAiXmHawoYwAhllk=;
        b=kGr+Wff3VknsVOIz01h4uB7HSRS/M/ZyMH3x7NfGpoaezkmHaQImaSJbJdoa2HA+WP
         t8JiGaRZVkmsmAzZzn1N3gStauNKq9BhZVkW6Gu6TXNc89LRrwZP27mHGO/u4jBo/C/q
         oLPN8XlT9MZtQ2xLj0yTC24mjQwS2ZkVJ3VTalNPDjHkZMhGkbMLEp2umN6spIMw6xWn
         Mm91q8ga6qDtNRg68CjO75MnjdYWa95Ie4E6NwduOMijUqRJLzwKpvlVTasyPYyczTGt
         FRIIXcVqYtbpCS+xw9/ByfvqWjxIpKnvEf0xqero8aBsHupnI0U4AWIn2YJhFjsvTwr7
         F+9A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV6/mVHnl0CJVeCF7Yq+p3E0Lvb12bHYtGGKmPDzR8TBxDSqg0E
	MW/lvoSNCcYX6q5kBRVeuds=
X-Google-Smtp-Source: APXvYqzmgnoYonX0Ln8dSJF3PEVGg8vN5pkVkcl/fNJdYKoQnN9uWUmLHYCsQo2mwzas8zEnAxshZQ==
X-Received: by 2002:adf:9427:: with SMTP id 36mr2549447wrq.166.1579170890367;
        Thu, 16 Jan 2020 02:34:50 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:3c43:: with SMTP id j64ls1020149wma.5.gmail; Thu, 16 Jan
 2020 02:34:49 -0800 (PST)
X-Received: by 2002:a7b:c190:: with SMTP id y16mr5408002wmi.107.1579170889588;
        Thu, 16 Jan 2020 02:34:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579170889; cv=none;
        d=google.com; s=arc-20160816;
        b=Ix4gVPqVKIWmZSHOMWa8FqwRkb9Nr3cD6L+P1dTvZJ58pL/6ylynzSz3JRQxKw0XCB
         2phZ/WVslj+kZu3Zoj7phqyZTZMOapLwCNI1iKxvirZMatmiGH3DE5Mcux+kVpPG1/3S
         LwzLgszZqGW4xzdc06OPZLUZ+7KBQ/AKRSTDiahe/K5+lHAM8aj/Ra2EDxhooVee45b7
         fREB3Vkae1hs5Kywl2JV+lXLvBU58DBjkvmKs1SFyD9urfBaa1Am6kOt6qrrCVIVHjXc
         4B4jD90CLW5JNpnzhoZivOeTpQKLjBDbwZ4nLBye5l+vMDW5RbSe5GR1Grj56endiBSw
         f1yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=4piJCzKrtc2AcNr+40iPvkBmXaWkg7PqfyqnWbeZeWs=;
        b=GjNQTs5sxbukfcUSjNehmCFqWKpUMN433QvAV69adWKx8WhvvaJMlDEhVVK6ljloha
         YSvlB2NarR1wKLyxYPyMOfmX6Wr0ZcSz1Z239Rzq/wkn2Kxrlf2tRscP4jpO/Fok1P62
         VD+3Gi2vefhFGmT9wTvZJjntwXfj1OWzMV/WZx787LsaRDCd59Zu82dLxtUaU0czOsgO
         qy50EW4hEiZURAre4U1Il30MyXqnUvbzJ40U5sM/QxzIHqXi9M53lAzSYN/tiH47RGeV
         jwjsUrctWbc166OraeAGXu6dRVp8014bvDWes6ZrDI7hrTuNzqTKMFe9eUFdLYrZLI3a
         RasA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id u9si833688wri.3.2020.01.16.02.34.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Jan 2020 02:34:49 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 00GAYnq3029223
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 16 Jan 2020 11:34:49 +0100
Received: from md1f2u6c.ad001.siemens.net ([139.23.78.127])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 00GAYmQE031623
	for <jailhouse-dev@googlegroups.com>; Thu, 16 Jan 2020 11:34:49 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 04/18] non-root-initramfs: Include ivshmem-demo from Jailhouse
Date: Thu, 16 Jan 2020 11:34:33 +0100
Message-Id: <48f89d618757250dce33fade9d37237b93648272.1579170887.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1579170887.git.jan.kiszka@siemens.com>
References: <cover.1579170887.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1579170887.git.jan.kiszka@siemens.com>
References: <cover.1579170887.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

Pull the ivshmem-demo code from current Jailhouse, build it for the
targets and install it in the initramfs images. This allows to test
ivshmem in non-root Linux cells.

This recipe change is avoiding a direct dependency on the Jailhouse
package for obtaining the source file so that changes to the latter do
not start to trigger the lengthy non-root-initramfs build. There aren't
many changes to the demo application in Jailhouse expected, so this
should be fine.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 recipes-core/non-root-initramfs/files/amd64-config              | 2 +-
 recipes-core/non-root-initramfs/files/arm64-config              | 2 +-
 recipes-core/non-root-initramfs/files/armhf-config              | 2 +-
 recipes-core/non-root-initramfs/files/build-ivshmem-demo.sh     | 8 ++++++++
 recipes-core/non-root-initramfs/non-root-initramfs_2019.02.2.bb | 5 +++++
 5 files changed, 16 insertions(+), 3 deletions(-)
 create mode 100755 recipes-core/non-root-initramfs/files/build-ivshmem-demo.sh

diff --git a/recipes-core/non-root-initramfs/files/amd64-config b/recipes-core/non-root-initramfs/files/amd64-config
index ccf4537..4a96858 100644
--- a/recipes-core/non-root-initramfs/files/amd64-config
+++ b/recipes-core/non-root-initramfs/files/amd64-config
@@ -360,7 +360,7 @@ BR2_SYSTEM_DEFAULT_PATH="/bin:/sbin:/usr/bin:/usr/sbin"
 # BR2_TARGET_TZ_INFO is not set
 BR2_ROOTFS_USERS_TABLES=""
 BR2_ROOTFS_OVERLAY="$(TOPDIR)/../overlay"
-BR2_ROOTFS_POST_BUILD_SCRIPT=""
+BR2_ROOTFS_POST_BUILD_SCRIPT="$(TOPDIR)/../build-ivshmem-demo.sh"
 BR2_ROOTFS_POST_FAKEROOT_SCRIPT=""
 BR2_ROOTFS_POST_IMAGE_SCRIPT=""
 
diff --git a/recipes-core/non-root-initramfs/files/arm64-config b/recipes-core/non-root-initramfs/files/arm64-config
index 087d10d..fe9e1a2 100644
--- a/recipes-core/non-root-initramfs/files/arm64-config
+++ b/recipes-core/non-root-initramfs/files/arm64-config
@@ -390,7 +390,7 @@ BR2_SYSTEM_DEFAULT_PATH="/bin:/sbin:/usr/bin:/usr/sbin"
 # BR2_TARGET_TZ_INFO is not set
 BR2_ROOTFS_USERS_TABLES=""
 BR2_ROOTFS_OVERLAY="$(TOPDIR)/../overlay"
-BR2_ROOTFS_POST_BUILD_SCRIPT=""
+BR2_ROOTFS_POST_BUILD_SCRIPT="$(TOPDIR)/../build-ivshmem-demo.sh"
 BR2_ROOTFS_POST_FAKEROOT_SCRIPT=""
 BR2_ROOTFS_POST_IMAGE_SCRIPT=""
 
diff --git a/recipes-core/non-root-initramfs/files/armhf-config b/recipes-core/non-root-initramfs/files/armhf-config
index 9a422c8..d5cd5bf 100644
--- a/recipes-core/non-root-initramfs/files/armhf-config
+++ b/recipes-core/non-root-initramfs/files/armhf-config
@@ -422,7 +422,7 @@ BR2_SYSTEM_DEFAULT_PATH="/bin:/sbin:/usr/bin:/usr/sbin"
 # BR2_TARGET_TZ_INFO is not set
 BR2_ROOTFS_USERS_TABLES=""
 BR2_ROOTFS_OVERLAY="$(TOPDIR)/../overlay"
-BR2_ROOTFS_POST_BUILD_SCRIPT=""
+BR2_ROOTFS_POST_BUILD_SCRIPT="$(TOPDIR)/../build-ivshmem-demo.sh"
 BR2_ROOTFS_POST_FAKEROOT_SCRIPT=""
 BR2_ROOTFS_POST_IMAGE_SCRIPT=""
 
diff --git a/recipes-core/non-root-initramfs/files/build-ivshmem-demo.sh b/recipes-core/non-root-initramfs/files/build-ivshmem-demo.sh
new file mode 100755
index 0000000..7a248dc
--- /dev/null
+++ b/recipes-core/non-root-initramfs/files/build-ivshmem-demo.sh
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+eval $(grep ^BR2_ARCH= ${BR2_CONFIG})
+if [ ${BR2_ARCH} = arm ]; then
+    ABI="gnueabihf"
+fi
+
+${BR2_ARCH}-buildroot-linux-uclibc${ABI}-gcc -o $1/usr/bin/ivshmem-demo ../ivshmem-demo.c
diff --git a/recipes-core/non-root-initramfs/non-root-initramfs_2019.02.2.bb b/recipes-core/non-root-initramfs/non-root-initramfs_2019.02.2.bb
index 1e642ee..17d866f 100644
--- a/recipes-core/non-root-initramfs/non-root-initramfs_2019.02.2.bb
+++ b/recipes-core/non-root-initramfs/non-root-initramfs_2019.02.2.bb
@@ -15,11 +15,16 @@ DESCRIPTION = "Linux initramfs for Jailhouse non-root cells"
 
 SRC_URI = " \
     https://buildroot.org/downloads/buildroot-${PV}.tar.bz2 \
+    https://raw.githubusercontent.com/siemens/jailhouse/${SRC_REV_IVSHMEM_DEMO}/tools/ivshmem-demo.c;name=ivshmem-demo \
     file://debian/ \
     file://${DISTRO_ARCH}-config \
+    file://build-ivshmem-demo.sh \
     file://overlay/"
 SRC_URI[sha256sum] = "0250b4e11d4aeba7cb5ac956b56e3069d3136c1e7fd741a658b0ea96c6b35181"
 
+SRC_REV_IVSHMEM_DEMO = "87cc49f944ed756e930b70991726ca5595a30717"
+SRC_URI[ivshmem-demo.sha256sum] = "e7cc426bb009c3c7d99c042ae45760494d8454647fbb042359655ea37ad1dcfc"
+
 S = "${WORKDIR}/buildroot-${PV}"
 
 do_prepare_build() {
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/48f89d618757250dce33fade9d37237b93648272.1579170887.git.jan.kiszka%40siemens.com.
