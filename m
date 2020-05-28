Return-Path: <jailhouse-dev+bncBDXPDIF3WYKRBCU4X73AKGQEJSWFGJQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6841E6443
	for <lists+jailhouse-dev@lfdr.de>; Thu, 28 May 2020 16:43:23 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id p24sf814322wmc.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 28 May 2020 07:43:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590677002; cv=pass;
        d=google.com; s=arc-20160816;
        b=oNbtZ3j/KgrCtL6s2WpK5KqG32+Fz8yvzEqqN+BaTG2WdwhqhiNIuTWaRGe3pYK4O2
         TZJnuD51bIMKf2abqfSYn4Ym3L76JUUSSULOC9pqydQBd3ZIG7RJS7jshpnaUeUDnaff
         Aj+tW3xjOpFJukGIQt6rN9oy8R4DON8/+MFT8dFmYShk5E0T77n7YGeXL+GRqsyfImZ0
         8RFopfdeKvmhJ/S0dMBoneOJ39eTNNQtlEyq9c55J4S8xkKkQYfkiXJgKHst8fVIEBqf
         M+1jIRhQ5oclMy1SNJ/vRLTWtQy5LAnwzU96aOn/ooF3B9AYUUfuE65cNebCpIyUKQGY
         RNIA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature
         :dkim-signature;
        bh=1D0ub213D5MK3USDSFAXaV7/egbAJ47bPwmSlMfrwNQ=;
        b=wVoocTz8N+qp73t5Yxxxe6GyUpwoT2YNcxf0K+xBc+T/pw3gEmL3sJNcGbeFUiXtyE
         b1t04TxaTwmo5Dvn9D0JIoD0eQsESSsHwfCnIlzS7W1AlLahFCNuJ1f91fIR/CgPd0mw
         vIhweWWr2xrg2uzjUMTdxePKXLf6Mjastydh5q/TmftWTD+AB/MYRru8279MAU/rA0dB
         XJ1C3Rf0DELvtaElxTnbErCldiGqajLgUqYE0f3RJYAOuZPXFsjzgrXh6D7zak1El4Ha
         ju9paS3M2EmSI8e8ssSBgCOSrToVaxL3Z3DrICYbFdcMA9D1UhHZ6YRVCdRq4Zrvx6B0
         W5HA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=SlKOPPEd;
       spf=pass (google.com: domain of mariomintel@gmail.com designates 2a00:1450:4864:20::62a as permitted sender) smtp.mailfrom=mariomintel@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1D0ub213D5MK3USDSFAXaV7/egbAJ47bPwmSlMfrwNQ=;
        b=aoMc+K862OxNX/qltEMCNjh+pgIyLzkvw4d58E3ayjIg3MOKolL3cMeDlgB3Cn08HB
         0DNEj1lIkZ5LdRvLyrut93KHcY332xrRw3whubaILpXFIc+JeHGodWVLeSRZvAJbavjE
         uU5pEX0bgp1O6zPN+d32CPQR5k436PBL0pjgl0T6CpmOTae12HSPuT+4RrObhPyPLjm5
         VQFUrT1KFmxRebti6hJmmeTWyCY5ZBlTIh9Xdp9PMOvwtrrhAA08u7NYo/29aCfCzRUW
         BeTdq0Ei4xxemlWCE3x8+GuMRQwn/XUkwngNCP9Oi5xLUNtEUndmU6pgEkhlZWUpYAch
         IKyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1D0ub213D5MK3USDSFAXaV7/egbAJ47bPwmSlMfrwNQ=;
        b=UoXqt4n2i3nYm1A1g4+WiPVUl4MM6PVdUKmEEvNHuaHN7Gx06SZjCQbxZRUHYXkoR6
         SGLRrE6MTrM5aQzExj2WyIYBzjXStgXVv2r0wQpapKIOM/V5eABQiBis1dkixJUJQRRJ
         CcutzReohfTHG0ZHYvOJkmG3I1vMo4kPk1JeLnEHkhFq06EV4ds0XTXrqJx6YUsfqTQH
         CKfsigzLCWwDT+j4sVctoD2oS+3nhDfe6HflguatbxK+kYXx1qBGvl0LIutSPyjly0XC
         f4iTiiOj5tGU/NPglPfZali2gqIQJRzeL8RoHpbCN32WIioLwoYIQTWh5WJByF8xVebc
         YR/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1D0ub213D5MK3USDSFAXaV7/egbAJ47bPwmSlMfrwNQ=;
        b=hn6w6Ao7UHGV5Ayn0+GVqID+WZB4l9jy9GABfOsBMmr81oSH+eFRwaVWrQ9zqyDNaq
         OqHAzmxEEs5Dgfqm64quM1qTJjMv/Mv7FT7CtkH54tqSnkwfZExecomAXU4Hk1Pl+KM1
         jxeM6kfipCtmNW7tSEUnqWWQDgDEEdNG1f9lBorkMPsas2pOPQiIqi0EKCyo8QKQ0IlU
         T/p6Nwniwb/v2uoli2GtmFI6Qs6fYXy9bjowLulnCR+lovf6eKqHBTem2yIys1Eenzw5
         80BLhQ88ZeHLHlwa6qppStu+Yk/AUx/ERrwhL64czSjiSKspm1EZXvyfx60WftY1lDJi
         q9CQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533dB2ZcHeATa24yKk6yyUs7ze/QdVxdKQMLZ4XApYyS+T3TGIJ1
	l9PpGxA5UBvAGYsFG3POtmY=
X-Google-Smtp-Source: ABdhPJwiTrntzdYjFn/lxZtov5z/K9/BpN88Fv+vMu8tj1Gv4IT/OrqlP74YrJ+nSfRRvNLH3WxeWg==
X-Received: by 2002:adf:f707:: with SMTP id r7mr4131777wrp.390.1590677002783;
        Thu, 28 May 2020 07:43:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:5224:: with SMTP id i4ls2900759wra.0.gmail; Thu, 28 May
 2020 07:43:22 -0700 (PDT)
X-Received: by 2002:a5d:5001:: with SMTP id e1mr4174896wrt.56.1590677002242;
        Thu, 28 May 2020 07:43:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590677002; cv=none;
        d=google.com; s=arc-20160816;
        b=fW4KS9gVlGrXEZzEOLP8/XYo19iJggp5ZWOEZHwI1UCP+kSe7yctrteGeegWqcRCao
         cT7WGhetRmSAiHjID1WiuO62GARk9Y4L6PwzINIdYmNTnmMr+MsBMe4xPtmen+QsxWrx
         heZdRm9oBkoAhQ+p9T/h82b/2gII3y8uSk0YrlP7/DQdu5RIMbgUlCp716Y7CaesFUQP
         OOjNSUcTqZmYHl9CiZXBh/zRJhC4K8H2olr2b6Z2PfFeNPHsyqbdzgE2+pBEjZU3AbE0
         N7aKXnicKoz5x0WV0K47Vwd0vdEp8EWcpN5+XLzaQ8ylsl2iD5HVubhfpxZexyoEKKEK
         Z+Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=T4fiWEy9w2SxGFqD7Jh2dCa3p+wvUipykd6/MJQUiIc=;
        b=cAEiS3SpGSbWjL4YM+NK5iEnFehgYioW4IgegudSqiRSlfgnzgsOAdKcb+glQgxGhx
         cUfdCEGOwx8T4I8YIqKfFbOWBQSbrwFMMP8eFviBUgMxN6MIDQ3pMM5f4j1O8NUR0p3w
         SW2hPfAoicHDC6pQZ8F988wTd6f31wfxZnFK9P30R7D2MPCReiYgnRlhay1tV1QnQKkI
         cghhhKcf61k+MZZi/B+D2WIP2CYa69gEtOODwvZK/qtLcajPTAgP4iA7Z3+IUHBnPKO3
         mdZodRAyCWGBzIGOxEi7/1bBtV3vDNBSVaxCW9YFCQ2pkoTjfotL2MJitnBlJ5B7l55W
         E+Tg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=SlKOPPEd;
       spf=pass (google.com: domain of mariomintel@gmail.com designates 2a00:1450:4864:20::62a as permitted sender) smtp.mailfrom=mariomintel@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com. [2a00:1450:4864:20::62a])
        by gmr-mx.google.com with ESMTPS id q8si337460wra.2.2020.05.28.07.43.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2020 07:43:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of mariomintel@gmail.com designates 2a00:1450:4864:20::62a as permitted sender) client-ip=2a00:1450:4864:20::62a;
Received: by mail-ej1-x62a.google.com with SMTP id nr22so266112ejb.6
        for <jailhouse-dev@googlegroups.com>; Thu, 28 May 2020 07:43:22 -0700 (PDT)
X-Received: by 2002:a17:906:f1cf:: with SMTP id gx15mr3181032ejb.471.1590677001940;
        Thu, 28 May 2020 07:43:21 -0700 (PDT)
Received: from localhost.localdomain (static.88-198-216-42.clients.your-server.de. [88.198.216.42])
        by smtp.gmail.com with ESMTPSA id l8sm1710147ejz.52.2020.05.28.07.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 07:43:21 -0700 (PDT)
From: Mario Mintel <mariomintel@gmail.com>
To: buildroot@buildroot.org
Cc: jailhouse-dev@googlegroups.com,
	ralf.ramsauer@oth-regensburg.de,
	Mario Mintel <mariomintel@gmail.com>
Subject: [PATCH 2/2] package/jailhouse: add option to choose custom repo/branch
Date: Thu, 28 May 2020 16:43:33 +0200
Message-Id: <20200528144333.49268-3-mariomintel@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200528144333.49268-1-mariomintel@gmail.com>
References: <20200528144333.49268-1-mariomintel@gmail.com>
MIME-Version: 1.0
X-Original-Sender: mariomintel@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=SlKOPPEd;       spf=pass
 (google.com: domain of mariomintel@gmail.com designates 2a00:1450:4864:20::62a
 as permitted sender) smtp.mailfrom=mariomintel@gmail.com;       dmarc=pass
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

In addition to official releases of Jailhouse, allow to specify a custom
Git URI + branches. This adds more flexibility for custom
configurations.

Signed-off-by: Mario Mintel <mariomintel@gmail.com>
---
 package/jailhouse/Config.in    | 36 ++++++++++++++++++++++++++++++++--
 package/jailhouse/jailhouse.mk | 17 ++++++++++++++--
 2 files changed, 49 insertions(+), 4 deletions(-)

diff --git a/package/jailhouse/Config.in b/package/jailhouse/Config.in
index 596b4951db..47523747f9 100644
--- a/package/jailhouse/Config.in
+++ b/package/jailhouse/Config.in
@@ -3,18 +3,50 @@ config BR2_PACKAGE_JAILHOUSE
 	depends on BR2_aarch64 || BR2_x86_64
 	depends on BR2_LINUX_KERNEL
 	help
-	  The Jailhouse partitioning Hypervisor based on Linux.
+	  The Jailhouse Linux-based partitioning hypervisor.
 
 	  https://github.com/siemens/jailhouse
 
 if BR2_PACKAGE_JAILHOUSE
 
+choice
+	prompt "Jailhouse Version"
+
+config BR2_PACKAGE_JAILHOUSE_LATEST_VERSION
+	bool "Version 0.12"
+
+config BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT
+	bool "Custom Git repository"
+	help
+	  This option allows Buildroot to get the Jailhouse source code
+	  from a custom Git repository.
+
+endchoice
+
+if BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT
+
+config BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT_URI
+	string "URI of custom repository"
+	default "https://github.com/siemens/jailhouse.git"
+
+config BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT_BRANCH
+	string "Name of Git branch"
+	default "master"
+
+endif
+
+config BR2_PACKAGE_JAILHOUSE_VERSION
+	string
+	default "0.12" if BR2_PACKAGE_JAILHOUSE_LATEST_VERSION
+	default BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT_BRANCH \
+		if BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT
+
 config BR2_PACKAGE_JAILHOUSE_HELPER_SCRIPTS
 	bool "helper scripts"
 	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON_MAKO # runtime
 	help
-	  Python-based helpers for the Jailhouse Hypervisor.
+	  Python-based helpers for the Jailhouse hypervisor.
 
 	  https://github.com/siemens/jailhouse
 
diff --git a/package/jailhouse/jailhouse.mk b/package/jailhouse/jailhouse.mk
index 6356c5a7aa..d134b3d1b4 100644
--- a/package/jailhouse/jailhouse.mk
+++ b/package/jailhouse/jailhouse.mk
@@ -4,10 +4,23 @@
 #
 ################################################################################
 
-JAILHOUSE_VERSION = 0.12
-JAILHOUSE_SITE = $(call github,siemens,jailhouse,v$(JAILHOUSE_VERSION))
+JAILHOUSE_VERSION = $(call qstrip,$(BR2_PACKAGE_JAILHOUSE_VERSION))
 JAILHOUSE_LICENSE = GPL-2.0
+ifeq ($(BR2_PACKAGE_JAILHOUSE_LATEST_VERSION),y)
 JAILHOUSE_LICENSE_FILES = COPYING
+endif
+
+ifeq ($(BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT),y)
+JAILHOUSE_SITE = $(call qstrip,$(BR2_PACKAGE_JAILHOUSE_CUSTOM_GIT_URI))
+JAILHOUSE_SITE_METHOD = git
+else
+JAILHOUSE_SITE = $(call github,siemens,jailhouse,v$(JAILHOUSE_VERSION))
+endif
+
+ifeq ($(BR2_PACKAGE_JAILHOUSE)$(BR2_PACKAGE_JAILHOUSE_CUSTIM_GIT),y)
+BR_NO_CHECK_HASH_FOR += $(JAILHOUSE_SOURCE)
+endif
+
 JAILHOUSE_DEPENDENCIES = \
 	linux
 
-- 
2.26.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200528144333.49268-3-mariomintel%40gmail.com.
