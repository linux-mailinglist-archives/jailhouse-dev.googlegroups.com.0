Return-Path: <jailhouse-dev+bncBDXPDIF3WYKRBQMWX73AKGQEWGX5PIY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4B81E63FC
	for <lists+jailhouse-dev@lfdr.de>; Thu, 28 May 2020 16:31:29 +0200 (CEST)
Received: by mail-lf1-x137.google.com with SMTP id w27sf4819067lfq.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 28 May 2020 07:31:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590676289; cv=pass;
        d=google.com; s=arc-20160816;
        b=iqEnZ4aUvekPTb9teYRCoA0rNAFjCeHacJR7M+5iMZ2zy+1rsVmtL2hvQTkz/BHNIX
         LE4uDIYKSh1mbov7Q2EKnns4vI7pTzyfw5/bVD19My2eBwERUz1VsQay7hrd+AxtGPjs
         +t5bqkLDEy7EkXPviFbkoNcuXtjy5xDE3qM/a5znYKxJHYLueXwzMNnJdafU1hT7iFKa
         pnbCyHLn9Vy+R5d61/J5ftOYmOZ1cFDqqHcuQrMKTbq3C/tcUbGcNzRJBESXlf8XLXxi
         jUKjMzhQK/g54RfcBL92X1PWSjfAw5TQMldgiymZw3ygzylXvCHyVU4f4tg0w7AqkxyG
         XUtQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature
         :dkim-signature;
        bh=uwjWoWSoQ+UG3pSdNdcepmRttgzkSVT2IXZNnCMSy9Q=;
        b=ZxaM4Uu2OAxJaeltmL+AMvdBP5JjICzPdf7wBGkDwOG50cry5RdjCwJgWy8fO9vQIr
         57TpfuEWotxLm8VMRUEOjtyBnCZJgZ18dW5mP1T3tC/iEaphj7XFhbq5nRli9xZtYzGD
         5DOFQSPw0R9qTGmLoAndaq0atBh5nPXazkC0+SxGttqX83YMaE5RYSo7fLoXnGUB8kDs
         LIfXbo6qfb5Rw8beKtPVLxvo2iLtEIQIbBlNpLodCjElGq5YhBzQnWbmA6mD5ui0iQ0d
         xQYasnurKSsO4LVogrvRehEJD0hItSVAr96WMT98p0b1mu0cW3wrHP01PehbWhsT6bLk
         wf8g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=iO6aMVnd;
       spf=pass (google.com: domain of mariomintel@gmail.com designates 2a00:1450:4864:20::52b as permitted sender) smtp.mailfrom=mariomintel@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=uwjWoWSoQ+UG3pSdNdcepmRttgzkSVT2IXZNnCMSy9Q=;
        b=rLtq8u9Fz1rSEJASJW5BGAZowpsohRHt7OK8VOGt/yZNpYXsN1BXEJ3lKeL/PHh1xA
         p98jIvqjk1wQFNdxUgdFMZE12PAPljb0rc70fXihLstOULL4IlF2rrwbetqpBa5HQgiF
         VXI0bMCEEZh2+oIXzYayUeHEcQ5cTnUHy1PlIeS4k5pdlV8JSQ0tf8HlCqusDw9RW9BA
         uZIWZGZaRepEVX+9kEjMXF+IZYRPDazju0oCyiNibJ5YUDUt0UHLUR0C/xZuNw2XZl4a
         tSh8TTgfDrk48IlgGD/VDGs72314H1LNXjKBsT84yw2kAN6VMycB81UYXTJ5PkulyPnR
         ASxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=uwjWoWSoQ+UG3pSdNdcepmRttgzkSVT2IXZNnCMSy9Q=;
        b=konrMN9mlDIixaj5EMXo7PeMf1AkhsQ7m9BHEE4mvdzyhuRFXlT8hT/EhmiilLiXww
         LclrW39YdssYRVxisEGYVEZEj3kvtzlbPO7fmSlhxMRBTjHkQiC6VpExVPO0mfm4X9zG
         qVnEGWfRn4WAR4fIOqsaVRBnlugvJ3a7mgo+looxr0paSOkdVTtmFW3exHZqoQcZL5l7
         NXOgkhtjncpnK0VB/dJwEJQm6yOA3O6pPJ4Oh1VMMMBz1jpoDW6sAxolLw8jDPJR4Azr
         wg+VVNwup0bt1ogcItxHGpPBM3QqXAyGMmyJWUmbs/BCeQgGcmWX7wA078BIsHdjnJ+y
         cGrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=uwjWoWSoQ+UG3pSdNdcepmRttgzkSVT2IXZNnCMSy9Q=;
        b=SHa9iBJqmSxNZV4vQYc8OhfE45Z2HIV8PDVYVMqrNGXxn0U8i4i6v9qDYqT140YbAu
         ydyzFYsbN1L9/GmkV3RpW8vOTxt7jX436OhsQsWaEHWRI5o/E8yI4EmjLXBFHfayco3h
         8pH5wHndkk84JsOgubuHzZjIsF21iZfTeF72ZgpdJF5KhmuFhZHdM8mA3ctRs99ayORf
         26+LsbG8aGSUYsSvzqbwpE3yBDiTn4KW8xo7k/J2tBMFWpJQGXzOASu3Umdu8nUlQxG/
         zy6AnICSr+NTW3lMFCyv+4dimcoK5K8E/WPS8JXuTicPmvc9eb9ZzMtNSSWYhF6iytnX
         hN6A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53195ZcxpbwsllavH4UdrfnPQedXbNLoQu9SKgcgJpsOqd6r1G22
	QpKswftLecVjR8KGhL+rSJA=
X-Google-Smtp-Source: ABdhPJyzGoL98atwmu43Wxj15eL/8oKYfxFoIw8gpfI/hXgzkub15cVlww3i4u4g+vwZfvOEb/O+Jg==
X-Received: by 2002:a2e:8186:: with SMTP id e6mr1781532ljg.252.1590676289245;
        Thu, 28 May 2020 07:31:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:43bb:: with SMTP id t27ls469419lfl.3.gmail; Thu, 28 May
 2020 07:31:28 -0700 (PDT)
X-Received: by 2002:a19:e346:: with SMTP id c6mr1842239lfk.177.1590676288423;
        Thu, 28 May 2020 07:31:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590676288; cv=none;
        d=google.com; s=arc-20160816;
        b=Rn8t8VzBWJ5zjrlc71/DwO6mXhndmyFDBmZCoKjjcqctH1OHI3foTvkx6OjMY/qgCT
         Dfx3OEUbUJpgKAiEyBsUpA/moyZpf8TTMmqyEWo7APzD7tqz5hGhacoTGMTYzFZmj92M
         BaatKRPG38u76gUTcksabWSElRqpX2t4pomzjZQ06IrkyJa0oVUa+fepdBq5eTiCOQfH
         pAXGKBFgyODFnjMwP8geZPSCPiV3ELzZu5zo7y5P6cPEvI1hSBKnZGjbuq6Xk6GRh2Wv
         28oJ7JA7kDcuLFpFbiKV5XIcPd6aAjuVc6m1ywhZCDV6H5RJ6yTZ1b/dXdbnxGN0EJjc
         I9zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=T4fiWEy9w2SxGFqD7Jh2dCa3p+wvUipykd6/MJQUiIc=;
        b=pS/1gqLQjpbyORjpKvMBMIoFwyPJXLYLgNhQ7imy8d868Y2ix4tSAgSQvFa9WQ+uDo
         l0DfjdtC+7QdR9+gNJteq7K0s/b2g5C9dQadaa9cXqvhOUTNqqIbBvX+petD/QGO5Ni2
         0J+wCbJ7t/4wncKjr7XtPZFF2hTeBJcc5beGunQCTsop5Uj3lq0FWWbJUI/HH0W4POvj
         0mckXUBgK/+0rVMOEfQOCUfVRBeyZ8538+sz7zeXZ4fumL4iWGPz4UjYPaYxiQnFecCI
         cJX/2wyAo3mBjHXAa9cYSzAV8MGkLuopcxxLyWJdGAFvf1B9aEnWXgMEC7zPdXLVbmsC
         QN+g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=iO6aMVnd;
       spf=pass (google.com: domain of mariomintel@gmail.com designates 2a00:1450:4864:20::52b as permitted sender) smtp.mailfrom=mariomintel@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com. [2a00:1450:4864:20::52b])
        by gmr-mx.google.com with ESMTPS id f16si414058lfm.0.2020.05.28.07.31.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2020 07:31:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of mariomintel@gmail.com designates 2a00:1450:4864:20::52b as permitted sender) client-ip=2a00:1450:4864:20::52b;
Received: by mail-ed1-x52b.google.com with SMTP id bs4so259719edb.6
        for <jailhouse-dev@googlegroups.com>; Thu, 28 May 2020 07:31:28 -0700 (PDT)
X-Received: by 2002:a05:6402:1c1e:: with SMTP id ck30mr3368825edb.154.1590676288175;
        Thu, 28 May 2020 07:31:28 -0700 (PDT)
Received: from localhost.localdomain (static.88-198-216-42.clients.your-server.de. [88.198.216.42])
        by smtp.gmail.com with ESMTPSA id l11sm5061411edw.55.2020.05.28.07.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 07:31:27 -0700 (PDT)
From: Mario Mintel <mariomintel@gmail.com>
To: buildroot@buildroot.org
Cc: jailhouse-dev@googlegroups.com,
	ralf.ramsauer@oth-regensburg.de,
	Mario Mintel <mariomintel@gmail.com>
Subject: [PATCH 2/2] package/jailhouse: add option to choose custom repo/branch
Date: Thu, 28 May 2020 16:31:32 +0200
Message-Id: <20200528143132.48501-3-mariomintel@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200528143132.48501-1-mariomintel@gmail.com>
References: <20200528143132.48501-1-mariomintel@gmail.com>
MIME-Version: 1.0
X-Original-Sender: mariomintel@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=iO6aMVnd;       spf=pass
 (google.com: domain of mariomintel@gmail.com designates 2a00:1450:4864:20::52b
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200528143132.48501-3-mariomintel%40gmail.com.
