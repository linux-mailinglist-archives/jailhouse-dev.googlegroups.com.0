Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBL46T2CQMGQECJX4JWY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 743D138C531
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 12:45:04 +0200 (CEST)
Received: by mail-lj1-x239.google.com with SMTP id i27-20020a2ea37b0000b02900f2c58a2986sf8649378ljn.15
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 03:45:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621593904; cv=pass;
        d=google.com; s=arc-20160816;
        b=EHifvlwhg1RxLktL9pwuUi2O+2GVnWeYV4W/Bnp+pTHN44TNlUpdfQFJ0BssZ3S64a
         3SBRQXS8YhfMzoUPgKJHpWyvEvD6jittjgwSnwBz/0ViZT9b3UA2Fkm3FASmC6lrYlFI
         hbAmHe+N/aPf4ev0gBqPQZKi7gS63qPxd16yYVjmEbo9DDpK4h0ietNw58jhdWDQE0pU
         DlFdtywOSUs6nRPgANM5N/qnPiwKcrg+aA/mZyh1EaOeJRq7FQTT2hv2uO6UXt6XJKSH
         W5t/UK/shXYgEGufiY45/Ky+STL+oIAypouWRqkocgtpEkAO8vJ4fdicBUkBUROSYMhh
         9Prw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=H7yKW3RXYsP8YtwxrC+5LEkNEp9jCZ7yPYZUHNE5ZKc=;
        b=MCIbUIGcoyI0WC1dY1T29d8ZRwSEWDDfJX7mpuasMNWkRYZkI2vVtR3tXpFFm2VIbV
         kSg7KOKiorxTN3Ft/hHerimgnWzVthEqKdg5DSZTaHHjxYvN61/cG4hhAdgDjmK8slvS
         VCi6J40MssdUEsuF+Wq7SnJ1/tznXo1lfi85b1RQMf//ETRL4/0oJTs4C5d9mpbtJnYn
         EcAkmhWHmhnxS8eJozFnZ2mCgJ0UIbf1x9QmPvxWXML9whE0Xoyd1h+1yURpTFtpgUPw
         +OEafHhouSkaWs1Jb8+lyln4RoOZgIYorUSJaOcL1L+IXPSlOlJcuZj7HycBkurfhIRX
         czIA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=H7yKW3RXYsP8YtwxrC+5LEkNEp9jCZ7yPYZUHNE5ZKc=;
        b=SMaASVD6YpqkQxKwNI34n2m20g/gQj0PjuU6iT09nZHyAc1zGbG4M7SWuGyoTFNTug
         XOMd+lUxTT3siEh6sUbAKrHECYmsmEMu9RRIZDn64HR53g5N2Cg9UR5sTugf4z/5bt+Z
         yyKorSJeJDY144qm9JK2LelVrjrqEL+qwvt+WC0ge+HS5fR+Smxe13y/0S2MmH05QXKl
         CvVGa7vA5w3sMIw4vtmkY405xeDXCVxzrdKob3BKN4S0ABv/asgsMrur2mQCVbcxlQXF
         pKWbuf6YgxEhMPucgD0MdOcZft/DIhx5YGLEONFjW1XGYUlb8Zrf9b2J6Zx1EZIirO2s
         v2ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=H7yKW3RXYsP8YtwxrC+5LEkNEp9jCZ7yPYZUHNE5ZKc=;
        b=PPH+ptKx0yl7f9lc9Q/v6dKhySQSCkwfgzKlZzSu68D0wRJ+PubUGcpyLUgW8mrUSR
         1IYOYg91ZwJJsfO5nVcSo6G5I40QCYysgmV9Vi6uEJT0W/mBlBuu9wpBDeszNw4zlSrY
         dzKGw0D2mo4Y8ofY8j+V/hfsm/Xfe5IaOajpsDklgtu4d56elF3IffnDLwlFYk/GLl+4
         HBunf8N+qqm+i0Uv8DB3incyehP9CNRBrBnYmG2iobMp3eE06Yt2YgiDmJNBvEsEmvFv
         YUrZkVZefb88BenB6DNzAMxwGolLxqoi5v6AbA6d+5EHSB7Ew0qrDN3diXGyZmMKkXPv
         fLDw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532BD1YZgrzlWuaktOftoyTBnh98CtsO+erjarFmLZx8rjXh5+IS
	Q/CmUP6kwrWTIbkOrEnyHyM=
X-Google-Smtp-Source: ABdhPJzMIqLpOGHdSQhXkI9ACx0Nz7+Ogn2/cG1cam7Xu74ZmNP/HYHS9UC2+Y+O94PLvnndz9PJzQ==
X-Received: by 2002:a05:6512:2351:: with SMTP id p17mr1740030lfu.319.1621593904027;
        Fri, 21 May 2021 03:45:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:6c0b:: with SMTP id h11ls1144680ljc.3.gmail; Fri, 21 May
 2021 03:45:02 -0700 (PDT)
X-Received: by 2002:a2e:b54b:: with SMTP id a11mr6523730ljn.459.1621593902736;
        Fri, 21 May 2021 03:45:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621593902; cv=none;
        d=google.com; s=arc-20160816;
        b=EyI4EJo2WHqFbtDpDLtsz5eDZlKt4zypF1/OfIM+Z24IsrbIIIOIB0UhoqxYng/Zt2
         Q8O0maqNIYKEpbzYmeeNVzTP664GablOl17Wee5s0YAXP6y4v9jFo03lbdZq47C1ZRNO
         YXqckcVL6soD3SfgQSocz6bT/bqogLTzmQC1WXb/uKxXR4qP6izu+kcdc5AT4QCqFBUq
         vs/MYlUEl2n+S/Ilb90XwFCxsk0Sgjr2nhATwUc0p1MH57M8c4uZO8UxiABFPTcPUxTV
         0cai9L7apLtIO4iCRbtVB/T5dsLAmjzvcgQPUJfMmHcGDdVI3zU+bKXHKdjKa4vFZp4o
         7ctQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=j9mI0xq6SatQGzQRaWiOZzeM5+xP2Q01N+DnleesbQ0=;
        b=oEBSqesTO623g8MP7uhYzizTpuXVHQ8/X6QaMZzvBjX6kkf9Z+stlg9niICPtvOOVn
         mZgDBOeFPHctG5l3u3hAOvDqLSViZHU/UDm7EoYORe00FawUFRW7ztG0htTKJ4A6xsOf
         s7jyY7ixFayjmS9hBMPUpkc7Z59ucjmGsyEx0CjHWyqsdmgHQMkP8gWGsOdYhbbuDEky
         Rm7iz5wO1y/uu2fq2oUfrv3cYcmA4x28zPcKzboIF3N+/hp3w3Tzc7eN/U09Wf+wywea
         VxL651ZqVrr6jhgw49nTdlnaMGD4Jl4nKdKtZ7DyFNkAraTPsLKM+lv156YatfqYFmmc
         a3dg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id k35si160569lfv.3.2021.05.21.03.45.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 03:45:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 14LAj21M024598
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:45:02 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.240.49])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 14LAbYcK032504
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:37:38 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v3 15/22] trusted-firmware-a-ultra96: Add patches needed for 5.10 kernel
Date: Fri, 21 May 2021 12:37:27 +0200
Message-Id: <abf72869fd2d02ad83f625726c77556bad77ff42.1621593454.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1621593454.git.jan.kiszka@siemens.com>
References: <cover.1621593454.git.jan.kiszka@siemens.com>
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Those two are needed in order to boot 5.10 which switched to clock
management via firmware.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 ...-errors-related-to-clock-gate-permis.patch | 45 ++++++++++++
 ...-error-codes-to-match-Linux-and-PMU-.patch | 71 +++++++++++++++++++
 .../trusted-firmware-a-ultra96_2.4.bb         |  5 ++
 3 files changed, 121 insertions(+)
 create mode 100644 recipes-bsp/trusted-firmware-a/files/0001-zynqmp-pm-Filter-errors-related-to-clock-gate-permis.patch
 create mode 100644 recipes-bsp/trusted-firmware-a/files/0002-zynqmp-pm-update-error-codes-to-match-Linux-and-PMU-.patch

diff --git a/recipes-bsp/trusted-firmware-a/files/0001-zynqmp-pm-Filter-errors-related-to-clock-gate-permis.patch b/recipes-bsp/trusted-firmware-a/files/0001-zynqmp-pm-Filter-errors-related-to-clock-gate-permis.patch
new file mode 100644
index 0000000..0c4dc0b
--- /dev/null
+++ b/recipes-bsp/trusted-firmware-a/files/0001-zynqmp-pm-Filter-errors-related-to-clock-gate-permis.patch
@@ -0,0 +1,45 @@
+From e85c1473dc49acb2feb2d552c9a1bad99e2477ca Mon Sep 17 00:00:00 2001
+From: Mirela Simonovic <mirela.simonovic@aggios.com>
+Date: Fri, 24 Aug 2018 17:09:07 +0200
+Subject: [PATCH 1/2] zynqmp: pm: Filter errors related to clock gate
+ permissions
+
+Linux clock framework cannot properly deal with these errors. When the
+error is related to the lack of permissions to control the clock we
+filter the error and report the success to linux. Before recent changes
+in clock framework across the stack, this was done in the PMU-FW as a
+workaround. Since the PMU-FW now handles clocks and the permissions to
+control them using general principles rather than workarounds, it can
+no longer distinguish such exceptions and it has to return no-access
+error.
+
+Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
+Acked-by: Will Wong <WILLW@xilinx.com>
+Signed-off-by: Michal Simek <michal.simek@xilinx.com>
+Change-Id: I1491a80e472f44e322a542b29a20eb1cb3319802
+---
+ plat/xilinx/zynqmp/pm_service/pm_api_sys.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/plat/xilinx/zynqmp/pm_service/pm_api_sys.c b/plat/xilinx/zynqmp/pm_service/pm_api_sys.c
+index b1720d9f6..cd9d597bf 100644
+--- a/plat/xilinx/zynqmp/pm_service/pm_api_sys.c
++++ b/plat/xilinx/zynqmp/pm_service/pm_api_sys.c
+@@ -907,7 +907,13 @@ static enum pm_ret_status pm_clock_gate(unsigned int clock_id,
+ 
+ 	/* Send request to the PMU */
+ 	PM_PACK_PAYLOAD2(payload, api_id, clock_id);
+-	return pm_ipi_send_sync(primary_proc, payload, NULL, 0);
++	status = pm_ipi_send_sync(primary_proc, payload, NULL, 0);
++
++	/* If action fails due to the lack of permissions filter the error */
++	if (status == PM_RET_ERROR_ACCESS)
++		status = PM_RET_SUCCESS;
++
++	return status;
+ }
+ 
+ /**
+-- 
+2.26.2
+
diff --git a/recipes-bsp/trusted-firmware-a/files/0002-zynqmp-pm-update-error-codes-to-match-Linux-and-PMU-.patch b/recipes-bsp/trusted-firmware-a/files/0002-zynqmp-pm-update-error-codes-to-match-Linux-and-PMU-.patch
new file mode 100644
index 0000000..52fd942
--- /dev/null
+++ b/recipes-bsp/trusted-firmware-a/files/0002-zynqmp-pm-update-error-codes-to-match-Linux-and-PMU-.patch
@@ -0,0 +1,71 @@
+From 25308b199ee9bd7ba150f9482c2fc5dab4b557a3 Mon Sep 17 00:00:00 2001
+From: Davorin Mista <davorin.mista@aggios.com>
+Date: Fri, 24 Aug 2018 17:09:06 +0200
+Subject: [PATCH 2/2] zynqmp: pm: update error codes to match Linux and PMU
+ Firmware
+
+All EEMI error codes start with value 2000.
+
+Note: Legacy error codes ARGS (=1) and NOTSUPPORTED (=4) returned by
+current ATF code have been left in place.
+
+Signed-off-by: Davorin Mista <davorin.mista@aggios.com>
+Acked-by: Will Wong <WILLW@xilinx.com>
+Signed-off-by: Michal Simek <michal.simek@xilinx.com>
+Change-Id: I939afa85957cac88025d82a80f9f6dd49be993b6
+---
+ plat/xilinx/zynqmp/pm_service/pm_defs.h | 33 ++++++++++++++-----------
+ 1 file changed, 18 insertions(+), 15 deletions(-)
+
+diff --git a/plat/xilinx/zynqmp/pm_service/pm_defs.h b/plat/xilinx/zynqmp/pm_service/pm_defs.h
+index cae36c9d8..4776d424b 100644
+--- a/plat/xilinx/zynqmp/pm_service/pm_defs.h
++++ b/plat/xilinx/zynqmp/pm_service/pm_defs.h
+@@ -215,26 +215,29 @@ enum pm_opchar_type {
+ 
+ /**
+  * @PM_RET_SUCCESS:		success
+- * @PM_RET_ERROR_ARGS:		illegal arguments provided
++ * @PM_RET_ERROR_ARGS:		illegal arguments provided (deprecated)
++ * @PM_RET_ERROR_NOTSUPPORTED:	feature not supported  (deprecated)
++ * @PM_RET_ERROR_INTERNAL:	internal error
++ * @PM_RET_ERROR_CONFLICT:	conflict
+  * @PM_RET_ERROR_ACCESS:	access rights violation
++ * @PM_RET_ERROR_INVALID_NODE:	invalid node
++ * @PM_RET_ERROR_DOUBLE_REQ:	duplicate request for same node
++ * @PM_RET_ERROR_ABORT_SUSPEND:	suspend procedure has been aborted
+  * @PM_RET_ERROR_TIMEOUT:	timeout in communication with PMU
+- * @PM_RET_ERROR_NOTSUPPORTED:	feature not supported
+- * @PM_RET_ERROR_PROC:		node is not a processor node
+- * @PM_RET_ERROR_API_ID:	illegal API ID
+- * @PM_RET_ERROR_OTHER:		other error
++ * @PM_RET_ERROR_NODE_USED:	node is already in use
+  */
+ enum pm_ret_status {
+ 	PM_RET_SUCCESS,
+-	PM_RET_ERROR_ARGS,
+-	PM_RET_ERROR_ACCESS,
+-	PM_RET_ERROR_TIMEOUT,
+-	PM_RET_ERROR_NOTSUPPORTED,
+-	PM_RET_ERROR_PROC,
+-	PM_RET_ERROR_API_ID,
+-	PM_RET_ERROR_FAILURE,
+-	PM_RET_ERROR_COMMUNIC,
+-	PM_RET_ERROR_DOUBLEREQ,
+-	PM_RET_ERROR_OTHER,
++	PM_RET_ERROR_ARGS = 1,
++	PM_RET_ERROR_NOTSUPPORTED = 4,
++	PM_RET_ERROR_INTERNAL = 2000,
++	PM_RET_ERROR_CONFLICT = 2001,
++	PM_RET_ERROR_ACCESS = 2002,
++	PM_RET_ERROR_INVALID_NODE = 2003,
++	PM_RET_ERROR_DOUBLE_REQ = 2004,
++	PM_RET_ERROR_ABORT_SUSPEND = 2005,
++	PM_RET_ERROR_TIMEOUT = 2006,
++	PM_RET_ERROR_NODE_USED = 2007
+ };
+ 
+ /**
+-- 
+2.26.2
+
diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ultra96_2.4.bb b/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ultra96_2.4.bb
index d4fac2c..5d82d0a 100644
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ultra96_2.4.bb
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ultra96_2.4.bb
@@ -11,6 +11,11 @@
 
 require trusted-firmware-a_${PV}.inc
 
+SRC_URI += " \
+    file://0001-zynqmp-pm-Filter-errors-related-to-clock-gate-permis.patch \
+    file://0002-zynqmp-pm-update-error-codes-to-match-Linux-and-PMU-.patch \
+    "
+
 TF_A_NAME = "ultra96"
 TF_A_PLATFORM = "zynqmp"
 TF_A_EXTRA_BUILDARGS = "RESET_TO_BL31=1 ZYNQMP_CONSOLE=cadence1"
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/abf72869fd2d02ad83f625726c77556bad77ff42.1621593454.git.jan.kiszka%40siemens.com.
