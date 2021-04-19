Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBW7B66BQMGQEAXFHBYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 966FB364CC8
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 23:06:35 +0200 (CEST)
Received: by mail-ed1-x53b.google.com with SMTP id bf25-20020a0564021a59b0290385169cebf8sf4448647edb.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 14:06:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618866395; cv=pass;
        d=google.com; s=arc-20160816;
        b=BySZDYuFOnPkzrhvUS0OlRSbh5kr6LdJOWb5OncXRtcMGUEKa5Q61lIgZQIoZCZ6jS
         0MCavJPKp3PdtoIgIm8lZ5SF4OaWixGydC2FixWic0EgHJfAal/DsxrJScA94HpdNocu
         sMpZcP/opVNCDIB3T5erXi0gIibSo+GIcyVCexIaRoUbeOXqHiFQGB6phrd+c6mkMUw3
         EVej2fyXyGZcGKus/7Tinb34ZNgMQzShnTD4G0TUD5AORHbh37o+QD44Y02IEMIW+JzO
         gYDa6ftsBPru+/dD8Wxe3BnFUhhOBjdZ3uauqp2cwRqaloG4Nc6fePDi07QmEO9a356i
         hMUQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=HQ/JImrRSA/ZA9CS/a8GgeqfEs+giANTw1LftEJHlkA=;
        b=m+Mb1xCnb1b5DyJt3s1YBOJnAb91kAMRXoi1WJmqEm5wukh9aLX+sQG4IU5LEH3KVk
         b55zeKAX7uSrFx+cr+bafCCHTi93x1Gm3rW3IdHhgiSYhIVJLgpsei8jPHMnswgnHY/z
         m6pls4LlqlU1y3AqiBln1f5K46mvxLI5FTp7flOeNuCo8AlNEP+jNL4nfFFkG4gZRMgk
         rtfVglhkK3X6QHKkUaLNbRhX516YZh7AK8A4opSuwfwTadUm5pDeBgq8Vf964+bwo9HJ
         RrjgJXIUnj0hhNCoKGky1b3LO/ATC7Oz0uzA7UwqADh0vKFhgLe90QI7TSHA9C79Hpsg
         AdvQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HQ/JImrRSA/ZA9CS/a8GgeqfEs+giANTw1LftEJHlkA=;
        b=cLnBD8bpcw6MULr820U44Uj9QH3guVEz7OaBZQN+lD5LswO+RghaCzPaDysLF90GB/
         zjgjaS3jHJIyC2bKeBCOuwc19pmLjmEkdUoepK7hSkjp+utf1qNeFwLGN/TCJT0iGOAX
         coTr1ZniYN0A1f75R18XCsuiwz60JJr5MtosGqJPJ2UYgIv+XfQewQSqIunmm8Phkbtl
         a9K2X+YuABXjWHKLU+dz5IkqeDsx2ujRJafMlc34uBdQ8xQ6UrWnahcA+llsGSopiZQn
         8/oN76LL7EHkApu5ld+ZTCVE3vhCUTBiiJcEKT8CJcvHOqiDnrykV/AmXa/KlR83eAEH
         SRbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HQ/JImrRSA/ZA9CS/a8GgeqfEs+giANTw1LftEJHlkA=;
        b=WQqHGXDTMTFDF3vF0FTldHxxgtVgBWPpVa8IDYOVb9gi3D6c5mET2ja+XR7WE7aWQk
         CS2qj8vrJuniWLSAmxoIGyf4rCNuZi8EFZWr6+7pE/5fnLk3U07Up/EwWmwdtkp1IgH3
         zRGd7ttirfxHubYgtIVJnf/BTqaeKyg4T0ZcEBTT1yE4wcvSDMnR2JamCGgrUUc30A7A
         RsDX9v2RNx67Gxt/i+/ARp8DX/9WqQ48xrKiBIPuTN57gtxRA/0E2FvCbJTgiX9lBN4H
         XrwOzrS3K1T6fsfNhRbT1aL0RgtbhD5CVD+7t4xsngIbrwRM/aFlqvhBWh8JSnMEvfxR
         oNdQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531Jj29ifAujsDCcRjXzbsp152EpFFSFd7/VeCydDnwrt0MPelxZ
	lpPOF1iVWK1TgdU2dgSyDFs=
X-Google-Smtp-Source: ABdhPJzkCUZGgXVpGVSUy9WoKmOLUE4cT/JFbk3SSy43qSpaTPchhhDkrWb+kKgO+fS2HN7V1P4E+g==
X-Received: by 2002:a17:906:4eda:: with SMTP id i26mr24009958ejv.301.1618866395329;
        Mon, 19 Apr 2021 14:06:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:4c2:: with SMTP id n2ls2853294edw.2.gmail; Mon, 19
 Apr 2021 14:06:34 -0700 (PDT)
X-Received: by 2002:aa7:c1c8:: with SMTP id d8mr28004737edp.236.1618866394250;
        Mon, 19 Apr 2021 14:06:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618866394; cv=none;
        d=google.com; s=arc-20160816;
        b=G8bzz59XKIYZcwhf7jsA3ij3nigiya2KltkPja7quGa8N8J+SIww0hImQw09eVr7o3
         WgbQlwBi+L4t5UcRLU3huK3F2VLqv/Qj2Ta36mURyDqE0NyTJR8j6KZ/5BgdK6Jsn2QM
         Np9bltlYgbqCtcGkxqJmmZA5egEq93UCGmEugs8E2GC0QQOseGXSVDYb7mGPFhm3ZN2z
         XxhGlf0udox8cCKCTKGncFgdfdn1qO8pwcsUPGKUYJkRCn1JG51Li3BDb++nVlkFORsn
         HAlbfdq7ZokiH+76ijw7Eghg63m94Omh7awP7eduMCHkjPFVEAalQ8SMU/MBd9vvYPMn
         JV+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=j9mI0xq6SatQGzQRaWiOZzeM5+xP2Q01N+DnleesbQ0=;
        b=LALUmWgjihLdD1i8vOfDwgHcPDUrASKOHCjlaI6c/KsgcAhf5+mr/Z0KrCEwj59QtN
         j0wpchblJLBnVMLS2sxE8BmilGx4ftPqz85PuZuyYqKngt3rfcIOIWNRJHC+fq/KcWfQ
         CDo6MaFlH3ld+iqjeHiyu2evaX7XxLSCzQ0dM0PSyS/Dv/G/BTibrWbDkXdL5wXArxwV
         K+Zanmu6/5neGZs5al91gNCgzKPNRPAOhFR3M9BlbGS5HQwO/RoTuty/gN6INXIykcmE
         Vj6IV6aoTl1bcqcRhewpob+EkM7iInghciqZY1PIYCeM69T4yKKhiyZ+LgGqjmUyo4F4
         ziHw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id r21si1169415ejo.0.2021.04.19.14.06.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Apr 2021 14:06:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 13JL6Xvg022645
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 19 Apr 2021 23:06:33 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.240.116])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 13JL6Tpi015242
	for <jailhouse-dev@googlegroups.com>; Mon, 19 Apr 2021 23:06:33 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v2 15/20] trusted-firmware-a-ultra96: Add patches needed for 5.10 kernel
Date: Mon, 19 Apr 2021 23:06:24 +0200
Message-Id: <130971a3270ce09a3c6019f0b898dcaccbf0234c.1618866389.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1618866389.git.jan.kiszka@siemens.com>
References: <cover.1618866389.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/130971a3270ce09a3c6019f0b898dcaccbf0234c.1618866389.git.jan.kiszka%40siemens.com.
