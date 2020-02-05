Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBVMG5LYQKGQEDV64SYA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 007CD1527D2
	for <lists+jailhouse-dev@lfdr.de>; Wed,  5 Feb 2020 09:56:53 +0100 (CET)
Received: by mail-wr1-x43a.google.com with SMTP id 50sf861452wrc.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 05 Feb 2020 00:56:53 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580893013; cv=pass;
        d=google.com; s=arc-20160816;
        b=qqHGYIW5nTL3kG3/3MMjlCQNXXFsRhhcARCxOfBVzHBl8iRh1UDloyzJx1unQd33R4
         0LckitwWOON+AygRnE9hNvq5A2cJuYmHwdBOgiP/mQ/eg+w+353imhIlhz62tyxacDUS
         ilCSn4dfvojTSv2p/d4b+/PAnI2XVkfIq4/3Pfp8dYdaly4nPwiTGXyVkAip3v1p5vhu
         l2kWhv9DVRgWmPzq+6kYvzRackpQnOXgvePJgCDRVjIZCPgNXDGRHhmIywFkpykLjgGc
         z1RfVUXCfHK/RNxygZ7P69mozDp4f0fa3CkuB0FddAPnYt3FendKap8tGmSlT02xrGki
         9ZcA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=mc8hoEqqE9jWXs9PMmeGF+hEvkD8/1lSvTuDWt5P290=;
        b=JA82fPudzEVt9e1ePCTLOX9ust0ppDtwntnXAcwu/D2nRex+qxKVQdq7LUHWGMGDk0
         XiJdUqtNlzPTIipVXYtjmwkRql4nfjE7Oj0W1yhYweamtdxR9nyqr0rxCxrWIXEHt0C8
         LyBlDXzqzg03n8/PgP+txk99mJXxW6WjkV/3qqv4HebhSPTHYV36rr0sBKOK5436SoYr
         rKLNBws4DzYymTOWafNfF3k2wq1UcaFoA/BZnTcVQ7BNBcahhB17tgQfLdcnNfPAksUz
         rbZEvHiB4jIsDO3OfdiyzAQ/VHAzRA5mid3mnt6sxo9ni0gCRD/at6TewP3zJzIVo3aq
         Be/g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=mc8hoEqqE9jWXs9PMmeGF+hEvkD8/1lSvTuDWt5P290=;
        b=mbjjEASJ1OUgBqHnoMtc+H25G8mi6hquhnPuzJAP8cnSYwiBN15LwZ3S9yITGua+34
         dBT6SgN6xCYj8loaVLDEVBwyA1OyzHUjA/HHOwADiwFApxq8Lf6KMGFXH1OA4Pk3wBib
         nbGKxSduQUFVjPq43WTxak63XNNlWqKMlkH/RwhHcnKHt9Iap5GUw9655hsU2sLPyhdK
         pTkLQyPn05ExIjnl8CLONw+nergYEPqMN3r+lMd+wc8VzLNJ//wzTT3wqDnKghd7gSnb
         BDjDlZ35iMeF1fF6bU3yYPYlol6ZCQLYjMByuqhgoX2zQoIu82OW3tTL4e+3unmLtE5f
         b6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=mc8hoEqqE9jWXs9PMmeGF+hEvkD8/1lSvTuDWt5P290=;
        b=AjmVlE8Xwwy936Uk8U7RlrSeaOPzjCNLUJm90PY5W7EaaW3uMNTQH4/VVKbuz+p4VO
         jTznWUQnS6tEPkHaQ5bINZm6sh5SURlMy+DvO80mqYfSDa0Mq8j0OrtkI29NWKhEDaOE
         OHvN3jBPFXHCPkd5cLC3ndmKdoU7Gv3KF+m4vEnpuT+qHF2bTptUacqb6KzNVDgiMJdw
         vxy0r1MlGuoMH8JW2UUir2YabA1kMTZbOT/aQb9UP52eIXXJ4nncvc2sL/Pc7388ms/Y
         WnhgBfauzjmFvcLkLnBE9iHgaqw3GEyHKqNws/TcGQvebdiuRNpf598ZzSlLvL2Ebyfn
         zRRA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXdyWJoDMNKd/uBaQ0c8NqtyAkBvlO7axwJw0gKJndoZY2/0vv6
	wdK495YOxuTzYimyoELRFzg=
X-Google-Smtp-Source: APXvYqwWChMCKZryh9QLIfR6wz1utjZOq1YwFLlZUdflYi+5g7IcOTjKug7j00DmL2gu04s4+Puzmw==
X-Received: by 2002:a05:6000:1251:: with SMTP id j17mr29211534wrx.210.1580893013696;
        Wed, 05 Feb 2020 00:56:53 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c4d0:: with SMTP id g16ls946236wmk.2.canary-gmail; Wed,
 05 Feb 2020 00:56:52 -0800 (PST)
X-Received: by 2002:a1c:740b:: with SMTP id p11mr4651954wmc.78.1580893012934;
        Wed, 05 Feb 2020 00:56:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580893012; cv=none;
        d=google.com; s=arc-20160816;
        b=tc34uz1LcuU+6dA77NbNgM8x6uF+F/YfC8C0o92T5UJOEP1AWVwiBLheVGSEctk41p
         PgguGpU2LF7QEOFSnbE0NcBPThWKeWhyeewfx3N+NaMgzXIYeAqPTW1bTmOSiH2nYHcO
         mvxM/u6rBsrmX8YR5GP+tncCN+mlaGMp15lEHvhJPR1zFwkTfU6A5ufE4Pk6Xwi2RheS
         6W8kbM8pr/puJpGlA5/ORemIH8Ng2uAfz7nXIxe8JE0T9G6KDPyNp6WJKcPhApsyB83M
         9cStPR3IRfvFqcLqnOahiA3BicK4e2/6DDR5juEJBaydUV9VYfFqMyXLVrWibmYK3F+V
         WUxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=WO8rwVugwXuplgPHrBv6IVQM+ygMnoRwxkrQ9atOdng=;
        b=L57wCYDx0oIHa9TE/iUZjuaGfh5sMFgvvPYa0c0VAG4iJ1GED3krS/h7BPmIWg0HeD
         kJustnN16SjHJ9j1h4q3JEZIAV8ISC4xxHuSyShXxMZsWCFtCN3NmNesNJHhn6NTgers
         s8DJA2/U0DPVxAsH9hy4qCdAcGG6ZflUgAbNu9smAR+KUREs+SHuGb+g4fbx7XqDZdXM
         roKFQ3OW/E3rGZqPx22wW6X7OJzTt4vvmHXr5/kc1YBurIy9mt6whchcgqLKpna8cAAE
         t2J1sQD07wTSGwqZjMdwyqxkOZ4clm+8YCfWMtlfavtWSc1O8XV2/IPZMIdHmMB7gLJw
         4vaA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id e21si351074wme.1.2020.02.05.00.56.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Feb 2020 00:56:52 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 0158uqvp031856
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 5 Feb 2020 09:56:52 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.54.219])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 0158up0m006156
	for <jailhouse-dev@googlegroups.com>; Wed, 5 Feb 2020 09:56:52 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 2/7] crosstool-ng-microblaze: Switch to github download
Date: Wed,  5 Feb 2020 09:56:46 +0100
Message-Id: <dcd072fbd8e8908480e0697452d010e6e43ed116.1580893011.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1580893010.git.jan.kiszka@siemens.com>
References: <cover.1580893010.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1580893010.git.jan.kiszka@siemens.com>
References: <cover.1580893010.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

crosstool-ng.org is down for a couple of days. Better us the more
reliable github source. This just requires some minor adjustments to
paths and the rules file because github packages a git snapshot, not a
real release package. The snapshot also already contains a debian
folder, but we better rely on our version that is tuned for the
microblaze use case - and known to work.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .../crosstool-ng-microblaze/crosstool-ng-microblaze_1.24.0.bb    | 9 +++++----
 recipes-devtools/crosstool-ng-microblaze/files/debian/rules      | 1 +
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/recipes-devtools/crosstool-ng-microblaze/crosstool-ng-microblaze_1.24.0.bb b/recipes-devtools/crosstool-ng-microblaze/crosstool-ng-microblaze_1.24.0.bb
index 021c83c..35bf71f 100644
--- a/recipes-devtools/crosstool-ng-microblaze/crosstool-ng-microblaze_1.24.0.bb
+++ b/recipes-devtools/crosstool-ng-microblaze/crosstool-ng-microblaze_1.24.0.bb
@@ -1,7 +1,7 @@
 #
 # Jailhouse, a Linux-based partitioning hypervisor
 #
-# Copyright (c) Siemens AG, 2019
+# Copyright (c) Siemens AG, 2019-2020
 #
 # Authors:
 #  Jan Kiszka <jan.kiszka@siemens.com>
@@ -14,17 +14,18 @@ inherit dpkg
 DESCRIPTION = "Microblaze toolchain built by crosstool-ng"
 
 SRC_URI = " \
-    http://crosstool-ng.org/download/crosstool-ng/crosstool-ng-${PV}.tar.xz \
+    https://github.com/crosstool-ng/crosstool-ng/archive/crosstool-ng-${PV}.tar.gz \
     file://debian/ \
     file://defconfig"
-SRC_URI[sha256sum] = "804ced838ea7fe3fac1e82f0061269de940c82b05d0de672e7d424af98f22d2d"
+SRC_URI[sha256sum] = "36c0067a2da265aa88f8d91c1647d152c98a100b8e2ce416cf47dedf08c069e9"
 
 TEMPLATE_FILES = "debian/control.tmpl"
 
-S = "${WORKDIR}/crosstool-ng-${PV}"
+S = "${WORKDIR}/crosstool-ng-crosstool-ng-${PV}"
 
 do_prepare_build[dirs] = "${DL_DIR}/crosstool-ng"
 do_prepare_build() {
+    rm -rf ${S}/debian
     cp -r ${WORKDIR}/debian ${S}
     deb_add_changelog
 
diff --git a/recipes-devtools/crosstool-ng-microblaze/files/debian/rules b/recipes-devtools/crosstool-ng-microblaze/files/debian/rules
index b5234da..5eb6f2d 100755
--- a/recipes-devtools/crosstool-ng-microblaze/files/debian/rules
+++ b/recipes-devtools/crosstool-ng-microblaze/files/debian/rules
@@ -14,6 +14,7 @@ DPKG_EXPORT_BUILDFLAGS = 1
 include /usr/share/dpkg/default.mk
 
 override_dh_auto_configure:
+	test -e configure || ./bootstrap
 	./configure --enable-local
 
 override_dh_auto_build:
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/dcd072fbd8e8908480e0697452d010e6e43ed116.1580893011.git.jan.kiszka%40siemens.com.
