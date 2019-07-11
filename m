Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBI7GTPUQKGQEAZQ4MNI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBDD65321
	for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jul 2019 10:28:19 +0200 (CEST)
Received: by mail-wm1-x33b.google.com with SMTP id y130sf1472473wmg.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jul 2019 01:28:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562833699; cv=pass;
        d=google.com; s=arc-20160816;
        b=zdVeZ51NLjx/QC4D54VtO5TYUHFD4R4Y2Q7LCyVskL5YMCpP+y8fEt/DE2mMM5bOBI
         9WjeltkMCvxHrwzmqfbhfwNTHcvmN+nZqj5mtxanxzorRrw30bpAKGhIIHhNfXGKNPsp
         4VTyJP/Ii3lAMIpZeC9w6wSBUces6d2edsOs8UZQX+3sm8uJHj62IsS+DBvtaQQoaa4A
         VxIbHIZyFniRKVdwQMtyFU6Y4LCa7T0Z4YY0XrnQaVdENAW19iyb160pQ9+WxuWbOnpp
         iX0tQ+UYM7DmA2EuHVP36T33mS3yvCrc9AbwLlGWxfuQliDI889Y5j8olEC0Db2hkpVw
         Hi2Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=AP7HU7q54JkegdiK34Bqi8rBFuhoky64rycwsuJM6eg=;
        b=rMvuwgAtvQS8jd+S5fm4Gs9N5PqOmszkoBYPIMaS33mzpKs0onUjFgRdAr/eOLaJE/
         AE7edBAgWCXdQHhw++xhGNA1bq25HH5t0xIHCr9gxdKTBLCtnmckJEuQDw6WLjoKeNfc
         yEizAJmk4T7A3qssyj/GG4LV7+WH/h3D5n4tUzpjlakI7A5MZYiljzDQhvbhaAUxFGnV
         4owr1F6Px5czLQkFmi5PcQLAGp/A7lsoYVXMb5AV4zkPmyvAxQnq4Ye3Ki3iu3SZt82L
         D1jATjYJqHItMLweUJQD4+1bqPH+6dbeJL75lmoSzc9N/fOOngcMAFL3yoPJrUEcQ0Ft
         fVIw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=AP7HU7q54JkegdiK34Bqi8rBFuhoky64rycwsuJM6eg=;
        b=AXGC42HEKs9cmUAhP3sQHbKXx6S/r+s3GeZwlEB4y3z13q9FLQkzxvgajVFgmt/hRq
         YJFXiVFUcD5UITl8JgTdl8xA3H2y5qgddYD7A7qxDi99EfWWO46fevG15gn3IBSbZ9pb
         z4GMd7CS2Q401wHLbRQRH3hhFqvAnSzeg0M6oMtMoVbcb9Uy76M4q9bNyyyZl+eb3cCs
         3JnclvnhYj3BR6eiFbv4P45UdAJhZXjgfEY4sLZhzLrV4w4cwW8G/uRZd5u23kvYV83t
         HLajPNcRKDkh8fktnILJGnlhFb7qrzIw+2rcAujkQbee7YHBqXiO4ZE6ENzFWpwRX/yo
         QG0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=AP7HU7q54JkegdiK34Bqi8rBFuhoky64rycwsuJM6eg=;
        b=T8Sie7mDLmyOETX4me1AhyqlRO1oGUAgFrq+09fgGwwPGhdC/ghWzLZA6lPzkHdGjJ
         nM+qQwHwtsfHwJcv7D1SBG7o4a8LUM5NElZpH4yIlLnKDgw353up42Vc68T7ZIo5P6ms
         MsI6QqySOq0d1myp0tu7cGGwkfmxqDRuQaV5/4QywHEzrC5ABxvQCzkTFyJSR+uRo0o3
         Ul4eL5JRSSY8DQi5OAjJZ4KaW2D+fDcXDwzeu2rV1lsAGOk0Hod2tRg/j/0lB2m5dmgc
         //4d1Ha6g31pkMTv15FY6xZ1J/D5vTNch2y7lVUEjz1EgrtHbUHUxFdiI/lsLKCNrL+p
         lj1Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXa2T9xPNt5zkESR1asMqJPIYqAbr0Du5AiWTR/JJpT/gF1m1e+
	8mQdPVd9Pa4icYQL8msOuWU=
X-Google-Smtp-Source: APXvYqytMwnYBRFA6j3y3e3R8pBOibT7Kcaqk7+hvEqahPLa3hSoxZdovoPbB+XA0iCtMK6i+bmyoA==
X-Received: by 2002:a5d:5348:: with SMTP id t8mr3366330wrv.159.1562833699284;
        Thu, 11 Jul 2019 01:28:19 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:bac4:: with SMTP id w4ls1594255wrg.13.gmail; Thu, 11 Jul
 2019 01:28:18 -0700 (PDT)
X-Received: by 2002:adf:db50:: with SMTP id f16mr3640043wrj.214.1562833698646;
        Thu, 11 Jul 2019 01:28:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562833698; cv=none;
        d=google.com; s=arc-20160816;
        b=nY/1j2VjG6oLa4qefNEIG0kK/nZrXOSuVtm3gYkuBLuxPg+n0NrHeICU5oBwZYKMgJ
         URTF3sji+V8yr0cuzHAmDthsiVNjxfw+017W9rHnOf3HkWum7nz1b1lVToZoWylgID/r
         DltEgoZrLxrDE4AF3KUsBJKDIeEELsBeJaF+yvg/T7N1sH42zfqiixfY1vpIimcNAYTS
         VHnw3cKDfFvzfFR6jVsyjOj3xhac+ssZOowBJaJhVTefGEExtJGbS9xy0O4SZbZCoSpe
         uKUBN0XmQefouzdwCyuGSpC0I7qXFE0CcCxtYV/XB3lqeClJKG5GIoFTY7j/ooruWy1n
         Ob5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=1Z1VYUlumnSYegusdCFhx1VK7aFJjbrXfi8zR+Awhgk=;
        b=fE+9JnKX0vcJ528Upk4ufgfSHpqjN/cMRcLRNGTCNz+2LeKSr+9xXg3pbUBpSBRHLV
         S+xiHEyv/AltO1wLSFxY6dJC0b0VzCfN1GbmiEWE/380M05fVR17iBdMf+98IQe8afF1
         /FCXCfv2rImoOzYbAfRJZvM1NnWBVVw5bfYrSLfs6tPrEjxf4X38boVM9zO+ZvojZ18M
         aHxvf3VoqjyWk+i+nNwHZM96BL8jwvP6X42I624e6c+YdPsnk4Bi4Nnc9ZulXb26bZT5
         HDxp1TpryjXaK4ArekNaqljYJKZ/QkrZnrOMwUVEIgFarMmWOLFWLgqLIJMtqzWLVZS2
         7bhw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id f13si492857wmc.3.2019.07.11.01.28.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jul 2019 01:28:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x6B8SIDb003504
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 11 Jul 2019 10:28:18 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.22.161])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x6B8SG7P010515
	for <jailhouse-dev@googlegroups.com>; Thu, 11 Jul 2019 10:28:18 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 3/8] Update to latest Isar next
Date: Thu, 11 Jul 2019 10:28:11 +0200
Message-Id: <8e31430a8a1b54e92fda3e1b1e02aab4878139bd.1562833696.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1562833696.git.jan.kiszka@siemens.com>
References: <cover.1562833696.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1562833696.git.jan.kiszka@siemens.com>
References: <cover.1562833696.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

This currently requires to set HOST_DISTRO explicitly. Furthermore, the
way the root password is set has been changed and the filenames of
kernel and initrd artifacts.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 conf/distro/jailhouse-demo.conf | 5 ++++-
 kas.yml                         | 2 +-
 start-qemu.sh                   | 7 ++-----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/conf/distro/jailhouse-demo.conf b/conf/distro/jailhouse-demo.conf
index 374f98d..6479317 100644
--- a/conf/distro/jailhouse-demo.conf
+++ b/conf/distro/jailhouse-demo.conf
@@ -11,11 +11,14 @@
 
 require conf/distro/debian-stretch.conf
 
+HOST_DISTRO ?= "debian-stretch"
+
 KERNEL_NAME ?= "jailhouse"
 
 WKS_FILE = "${MACHINE}.wks"
 
 PREFERRED_VERSION_jailhouse-${KERNEL_NAME} ?= "0.10"
 
+USERS += "root"
 # 'root'
-CFG_ROOT_PW = "oC3wEGl799tZU"
+USER_root[password] = "oC3wEGl799tZU"
diff --git a/kas.yml b/kas.yml
index b41f71f..0c2a7a3 100644
--- a/kas.yml
+++ b/kas.yml
@@ -21,7 +21,7 @@ repos:
 
   isar:
     url: https://github.com/ilbers/isar
-    refspec: 207c160fbd745833a3da25525a71106baacf623b
+    refspec: 59c7dd2b8b3172d53de1c7a39fbd49751193559a
     layers:
       meta:
 
diff --git a/start-qemu.sh b/start-qemu.sh
index 4c7be1d..34dfd82 100755
--- a/start-qemu.sh
+++ b/start-qemu.sh
@@ -65,13 +65,10 @@ esac
 IMAGE_PREFIX="$(dirname $0)/build/tmp/deploy/images/qemu-${DISTRO_ARCH}/demo-image-jailhouse-demo-qemu-${DISTRO_ARCH}"
 IMAGE_FILE=$(ls ${IMAGE_PREFIX}.ext4.img)
 
-KERNEL_FILE=$(ls ${IMAGE_PREFIX}.vmlinuz* | tail -1)
-INITRD_FILE=$(ls ${IMAGE_PREFIX}.initrd.img* | tail -1)
-
 shift 1
 
 ${QEMU_PATH}${QEMU} \
 	-drive file=${IMAGE_FILE},discard=unmap,if=none,id=disk,format=raw \
 	-m 1G -serial mon:stdio -netdev user,id=net \
-	-kernel ${KERNEL_FILE} -append "${KERNEL_CMDLINE}" \
-	-initrd ${INITRD_FILE} ${QEMU_EXTRA_ARGS} "$@"
+	-kernel ${IMAGE_PREFIX}-vmlinuz -append "${KERNEL_CMDLINE}" \
+	-initrd ${IMAGE_PREFIX}-initrd.img ${QEMU_EXTRA_ARGS} "$@"
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8e31430a8a1b54e92fda3e1b1e02aab4878139bd.1562833696.git.jan.kiszka%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
