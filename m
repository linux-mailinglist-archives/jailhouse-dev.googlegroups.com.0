Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBP4CXDVQKGQEZC6ONHI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 6319FA60EB
	for <lists+jailhouse-dev@lfdr.de>; Tue,  3 Sep 2019 07:59:28 +0200 (CEST)
Received: by mail-wm1-x33e.google.com with SMTP id n11sf2377327wmc.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 02 Sep 2019 22:59:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567490368; cv=pass;
        d=google.com; s=arc-20160816;
        b=F+fEgreFXR3kF5jIHNQxuEo+aANtHKgoveUkZru31CCAizPo2GXJWrCPAuOMfUW2id
         JyLd0orQYoLTalXPyQ5m/rZk0rv+F/xeGjrk4pM5//9RXOdz2AwyLc8LB11Z8R/p5jn6
         NT0W+jRSN3WZTGn9kdTzTpJfGAnSSoJ4H2wDuKKY148tu1r/I1HZvDUn4Kq8HAkVgR8a
         hkxA+XFLj3J4zfM4eyGxN0UhE1AW5NxGZ0yARJEh97Ip943my8rNT1D7ZRAmmXRRLNP8
         nHEdgMl2L8OIGCv30/m9drNRx1Q1jR+p4vVoHnIZfRUq3YVqEerK6ZaDLR+H8A1idnGa
         qlDg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=CN55E3lVHsbs1uv70xkTk7/QvqSRusy2LKFARvuvZRI=;
        b=zeWktpqZARjakuc05uXpTHZk5+Szy9habslvpwfco7WW0cFNNM3EJn4uuvFJVVNQNq
         EC6rX5xLXQzwAFwaDWGmPbyw2SEMgAwIekeDmeiBoSWBQWmdC48yqYzARlYYvJP8rycg
         j11q8Eq1rtB2morivR6KCSkol4iMOTWoJk9pKT7ZMkuUoPnm5feuvEZM4rgVk0F8HUmb
         he9bQ0QArDqIb2CwlfbxxsDdmeX5unrxjgrtRwLtM7jlBTKBMMfktLfmk3YIPJTC6ftJ
         sZQBkjTKp7RxG+K8TlfhUBMbuCJKnD21Vs0phFLx22FE9pfxYJoyakPnN9z7WMEpNsWL
         KAmA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=CN55E3lVHsbs1uv70xkTk7/QvqSRusy2LKFARvuvZRI=;
        b=WHXCMy4jFPj9Q6S7dGno1pzbx2OrVPlSJrbGUCPpMb12EtWLDy+SMK4Hnx7TrEVH/+
         uoY9eXZv1Cus7yZ8Pe+vg2Cg9XkldtrIZO/3SkBtsuUxnaWiBrlhwdLDbHwyDds5j6D6
         IqkRxWUC4TrMcedl7tNEoIFl9Vea7uMamziVC6dUfOr9zctDhRjFPSaiwt01E7HTdRir
         OegYxRaMVVeEeI4QfO4w263zZgafMMEh+ZEJ3entBPF+fSzYtfHP+769ecFCVHpJKW18
         DRUX1ws2lQ22LO1mhnwDWyiwmcLcBuCA2yE7yEYcnlDdb3J4u9eCLaeh/xY8Of91VBRs
         tCjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=CN55E3lVHsbs1uv70xkTk7/QvqSRusy2LKFARvuvZRI=;
        b=kafXBjak19RY5iUyCtZ+KvIFk8wHvALo3h8aXMBlL9vVkpyM+wusHdoU0WGGeuIyDQ
         ycbV0Yktxr4GWU+DPF5ylvymPMwLlAPZz33peMJ9V5TBcqOM4i1EPQ87at6Oywwdd439
         cvt+FiZFtVFlqgAw8maOep4d4rhJtco7EzT6rIFJ3ZNTu/v7f+4voWuANlM9Q1o2ccm/
         oHdo5pB7rw1ThC0YE870xeWjHbZXSHnIXeKMeGMOhceyXwaClweakVBqWsb/OjHo9mb6
         00nAv5e57kFqFLrrCRtEtN1bhrnA8cV0BwS3AZQLSknJ48UbONRAwrCLAhB20NLYViHv
         zZVQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVAsqQ2DBAPIUwhKKdm3rGvZgNs57rvkK6P+S0JzNwKrzEEnmHO
	kuaPSYFV9vs4hnwsmZbdUhw=
X-Google-Smtp-Source: APXvYqyW8xwL10PUWzfJPRWThAIG2lkwJYEuvePEEH/zc4iPM4ArMu17LnBulKFgBVWHIA17gTOdqA==
X-Received: by 2002:adf:ecc7:: with SMTP id s7mr42308023wro.215.1567490368071;
        Mon, 02 Sep 2019 22:59:28 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:a78e:: with SMTP id q136ls3223997wme.1.gmail; Mon, 02
 Sep 2019 22:59:27 -0700 (PDT)
X-Received: by 2002:a1c:4108:: with SMTP id o8mr20751916wma.129.1567490367414;
        Mon, 02 Sep 2019 22:59:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567490367; cv=none;
        d=google.com; s=arc-20160816;
        b=cJGHyGKmyYCBjoKHBUTqtwdYKq1C8RNL2GY0uFTm5pSBWSmkXt4mneGfifH67eFcTk
         PWuigCf4hMHiQLtnhzhcK46LJeHHlv0IKrTaEgCS166ciBBjdwjk9r8w9gT9FKRok2Ut
         r544bzaOEx/o6FSkFQqALMYHicSlRxEm3T7eaDMUm2E0w1R2JUUY6wtBBRweb72DHxoE
         Aass4INJ+Pzdp1xN+UqxEEGgZ1RLCl0Lx/xv4Bfd6D2s6G6TpxJQh14aJwPAptC6OXuQ
         byS6gqJZmbqUxa6+pDNp1Ls3X7k2fZ4+HQZ/eMhvJCfH/ife9oGzWgz0OvMd7oTKZPdD
         gopA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=5JnNOLsVBOzPKWYVmOU6E6hYWifoNR8iYJOH9FvxuD0=;
        b=Hw7ptVcPhfmBl2vOnhagnq9cDh37xUKkx4F/0j5k+LFcMBeirlGH4sEhWYWS/LhvVX
         wmlB4IaGpyX3f5k9QX3AMxV6mnxtNTDaJc+FBS7NVoK4mM/B+K9WqAdBTpEoxyIrzfBW
         vKGuM30yNWdYoF0zi5of11jOB4ppNtyHQCX1ZbJ8Laibrq4LpwU/lztwwicUQAR1a0Yk
         RfyHxhuyCXH9XAiBvKO/owW8dlA8A94bQs9FYzZ4fV43aKNK2yKefcc2hil8wIziFvDq
         +rx8djxH+s+5VO5awX5GvjUqUVCpRMfl51xZ0eF8mNgVvZjFBqstrJCksk2Ss4+RJ10f
         YbsA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id l14si687780wmc.1.2019.09.02.22.59.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Sep 2019 22:59:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x835xRci029637
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 3 Sep 2019 07:59:27 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.40.78])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x835xPkR010486
	for <jailhouse-dev@googlegroups.com>; Tue, 3 Sep 2019 07:59:26 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 04/13] Add crosstool-based Microblaze toolchain
Date: Tue,  3 Sep 2019 07:59:16 +0200
Message-Id: <b33dfa92e20dd5b6abd090e87b38a1ad21a617ee.1567490365.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1567490365.git.jan.kiszka@siemens.com>
References: <cover.1567490365.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1567490365.git.jan.kiszka@siemens.com>
References: <cover.1567490365.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

This will be needed for building the PMU firmware for the Ultra96. The
default gcc version 8 of 1.24 does not generate a working firmware, so
we fall back to gcc 7.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .../crosstool-ng-microblaze_1.24.0.bb              | 32 +++++++++++++++++++
 .../crosstool-ng-microblaze/files/debian/compat    |  1 +
 .../files/debian/control.tmpl                      | 13 ++++++++
 .../crosstool-ng-microblaze/files/debian/rules     | 37 ++++++++++++++++++++++
 .../crosstool-ng-microblaze/files/defconfig        | 10 ++++++
 5 files changed, 93 insertions(+)
 create mode 100644 recipes-devtools/crosstool-ng-microblaze/crosstool-ng-microblaze_1.24.0.bb
 create mode 100644 recipes-devtools/crosstool-ng-microblaze/files/debian/compat
 create mode 100644 recipes-devtools/crosstool-ng-microblaze/files/debian/control.tmpl
 create mode 100755 recipes-devtools/crosstool-ng-microblaze/files/debian/rules
 create mode 100644 recipes-devtools/crosstool-ng-microblaze/files/defconfig

diff --git a/recipes-devtools/crosstool-ng-microblaze/crosstool-ng-microblaze_1.24.0.bb b/recipes-devtools/crosstool-ng-microblaze/crosstool-ng-microblaze_1.24.0.bb
new file mode 100644
index 0000000..021c83c
--- /dev/null
+++ b/recipes-devtools/crosstool-ng-microblaze/crosstool-ng-microblaze_1.24.0.bb
@@ -0,0 +1,32 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2019
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+inherit dpkg
+
+DESCRIPTION = "Microblaze toolchain built by crosstool-ng"
+
+SRC_URI = " \
+    http://crosstool-ng.org/download/crosstool-ng/crosstool-ng-${PV}.tar.xz \
+    file://debian/ \
+    file://defconfig"
+SRC_URI[sha256sum] = "804ced838ea7fe3fac1e82f0061269de940c82b05d0de672e7d424af98f22d2d"
+
+TEMPLATE_FILES = "debian/control.tmpl"
+
+S = "${WORKDIR}/crosstool-ng-${PV}"
+
+do_prepare_build[dirs] = "${DL_DIR}/crosstool-ng"
+do_prepare_build() {
+    cp -r ${WORKDIR}/debian ${S}
+    deb_add_changelog
+
+    cp ${WORKDIR}/defconfig ${S}
+}
diff --git a/recipes-devtools/crosstool-ng-microblaze/files/debian/compat b/recipes-devtools/crosstool-ng-microblaze/files/debian/compat
new file mode 100644
index 0000000..ec63514
--- /dev/null
+++ b/recipes-devtools/crosstool-ng-microblaze/files/debian/compat
@@ -0,0 +1 @@
+9
diff --git a/recipes-devtools/crosstool-ng-microblaze/files/debian/control.tmpl b/recipes-devtools/crosstool-ng-microblaze/files/debian/control.tmpl
new file mode 100644
index 0000000..c6842da
--- /dev/null
+++ b/recipes-devtools/crosstool-ng-microblaze/files/debian/control.tmpl
@@ -0,0 +1,13 @@
+Source: ${PN}
+Section: misc
+Priority: optional
+Standards-Version: 3.9.6
+Build-Depends: bison, ca-certificates, flex, gawk, help2man,
+               libncurses5-dev:native, libtool-bin, texinfo, wget, unzip
+Maintainer: Jan Kiszka <jan.kiszka@siemens.com>
+
+Package: ${PN}
+# Mis-declare it as arch-independent in order to install it as host tool into
+# the buildchroot - Isar shortcoming
+Architecture: all
+Description: ${DESCRIPTION}
diff --git a/recipes-devtools/crosstool-ng-microblaze/files/debian/rules b/recipes-devtools/crosstool-ng-microblaze/files/debian/rules
new file mode 100755
index 0000000..b5234da
--- /dev/null
+++ b/recipes-devtools/crosstool-ng-microblaze/files/debian/rules
@@ -0,0 +1,37 @@
+#!/usr/bin/make -f
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2019
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+DPKG_EXPORT_BUILDFLAGS = 1
+include /usr/share/dpkg/default.mk
+
+override_dh_auto_configure:
+	./configure --enable-local
+
+override_dh_auto_build:
+	$(MAKE)
+	./ct-ng defconfig
+	unset CFLAGS CXXFLAGS; ./ct-ng build
+
+override_dh_auto_install:
+	dh_install .install/* usr
+
+override_dh_link:
+	dh_link usr/bin/microblazeel-crosstool-elf-gcc usr/bin/mb-gcc
+	dh_link usr/bin/microblazeel-crosstool-elf-ar usr/bin/mb-ar
+
+override_dh_auto_clean:
+	dh_auto_clean
+	[ ! -d .install ] || chmod u+w -R .install
+	rm -rf .build .install
+
+%:
+	dh $@ --parallel
diff --git a/recipes-devtools/crosstool-ng-microblaze/files/defconfig b/recipes-devtools/crosstool-ng-microblaze/files/defconfig
new file mode 100644
index 0000000..13d7dcf
--- /dev/null
+++ b/recipes-devtools/crosstool-ng-microblaze/files/defconfig
@@ -0,0 +1,10 @@
+CT_CONFIG_VERSION="3"
+CT_EXPERIMENTAL=y
+CT_LOCAL_TARBALLS_DIR="/downloads/crosstool-ng"
+CT_PREFIX_DIR="${CT_TOP_DIR}/.install"
+# CT_RM_RF_PREFIX_DIR is not set
+# CT_LOG_TO_FILE is not set
+CT_ARCH_MICROBLAZE=y
+CT_ARCH_LE=y
+CT_TARGET_VENDOR="crosstool"
+CT_GCC_V_7=y
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b33dfa92e20dd5b6abd090e87b38a1ad21a617ee.1567490365.git.jan.kiszka%40siemens.com.
