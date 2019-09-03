Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQECXDVQKGQEP2RMEAI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C11DA60EF
	for <lists+jailhouse-dev@lfdr.de>; Tue,  3 Sep 2019 07:59:29 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id h3sf9854625wrw.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 02 Sep 2019 22:59:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567490369; cv=pass;
        d=google.com; s=arc-20160816;
        b=T4CVfydAbrzPNkhlbRIoLuH3kv2HzEj30HkRhYJw7+MrI/VAsPnbX46QYvKjSPSfoU
         NOEPSMXXzF1eKeGNrMnjWQugQ6JbCQdT59ld06RDNC2ULkWdkujYWp9s4l/C3xD5MKzU
         Yd6YYVZNdQT1nvMqr5NP87pCH+IkSZOFM2d1b0ijr3cU+yOLo3cHzM/XNgNHRf04aoRM
         KSO89DhfpYaT+FoLC8lYehh1+tg1W6/lOAU1MxwdjAF0P6XLAsDUZivhfuz8oEOfHlCX
         dCqhB8ytWuD1ZPZXaie6ymUNvFCLAVBBwAaYnzG68dkDGdMHyln17ztrs8nxyEICqd5e
         y7ng==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=hSKKjUtnVXcJqPNyZD/iJeQ80pQWP9uE+y5+8MK+mOw=;
        b=JxpqqxogWL2Hgg6DmsPVmCv32dWTe9Cjf6CwWoGQPJf6FA1JDLMNHYYayqdaANtKqH
         4ny2QGpPcfBXLaiAOqT0ITn300m0XQTsyk6I6koY7kaveW3Fm0KLwtq0FUAzGgQh5CWC
         53UjYLZOutBmXbq4eZ+fFfuNE8m3xau1J9zfn0vPp4lePPM/ebF9QwvnEJsi2WzSPWyf
         JCRGaE3aQu89Me1ZqWldU62n5gHNMIiifP3igfqf566UVe8VC2Vco8vTpA6DjeDIj9MJ
         daMwXaAQtJSavhag7xPzaPtozzgryaHGA6FToXPVrdTweoJZRoDbiwxTUZDTh4bTqoHO
         +M/w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=hSKKjUtnVXcJqPNyZD/iJeQ80pQWP9uE+y5+8MK+mOw=;
        b=f5bMpu9OT+nj9qoKvGUE5b0k966nd2F+uN3GpJ6vI2IS0tj2t2utnn9a2ulz1gvDus
         Lde1AJpVsVq8HfgXwZggOD9p+VgFDGeT3KqqrQyLF3KkdkJCKTIRBHWGnoHcKOZy54ju
         cPRlMpU2hvTshlTQLWS9YadfAFIaV37nvw8cWHPqYg/3gof3+x0Tr2TZ2yBLKZ4USBHS
         IucfSt3p8gGtg8FgeawPb9PxjEkydlWOabx4ak2RJBNceQkHKRzcmWcm7OGE+1k7P/OZ
         WVxTXLgjyWjr6ZXjT2IxhJ5MwpEkvgKSto3rkp/hKPnISYQjqtIw6GgRpJCX1w/4cjx0
         wYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=hSKKjUtnVXcJqPNyZD/iJeQ80pQWP9uE+y5+8MK+mOw=;
        b=boUgUm1NtvT/oCBcgdqEPdAwZhLwrdYMuPQhSmITUOwCgkJ3JXxYjCll65fGfu/mIZ
         laNYiS7LF1fZBnEZlX/P7a6Y8ijZLcLminumtUkpne5l9BBOcvZj5uFzMilCfcnYYpcO
         XMcKeyrx9tcuA8fHpVJRosJBsDtOF8Hcfk9b9q1phh+aGU+iUon5ZaDTsZ/gAahencGN
         7M17K2nUCGCEgjYaHColU7PFlYPOqSx28bJRQcz66Fc7gu2Ny/6ko8RU0zBFd/KPpMcO
         TecvvNRlIpuO7AzLXvRzJ0Yn8RFkPnsCc1JDsE5IFOuAas+jDPY5lNtQdmcVJdM8my50
         UwRw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW4OOSBk0KDU8VyyGFi7cman4FBbJmI2a/OYIOouzHUlF5TYPmy
	OkCXSQxaEcNogMsKqFxdKQ8=
X-Google-Smtp-Source: APXvYqxsTd+rxhXzoU0o+Lkb9tjlTEuuV7eEX/12tq/niE854UWrroC9aZOD/y4vvJJ5l6EBguYA7Q==
X-Received: by 2002:a5d:68c6:: with SMTP id p6mr1531277wrw.188.1567490369263;
        Mon, 02 Sep 2019 22:59:29 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:c143:: with SMTP id r64ls4174913wmf.0.canary-gmail; Mon,
 02 Sep 2019 22:59:28 -0700 (PDT)
X-Received: by 2002:a7b:c4c6:: with SMTP id g6mr41939457wmk.52.1567490368505;
        Mon, 02 Sep 2019 22:59:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567490368; cv=none;
        d=google.com; s=arc-20160816;
        b=KTmskoeOG860/qgzJzFju1tbe/hm4O27uzzM4+o5x3AQ39aF6i4jE4zW1nU/KOX9Qc
         bRZDZfi0S8879Xvn7xk+3ndOHzgPHuC6/IgCa+6b0v6RHekZa/itoq7rKbhP7bNZHU2w
         l4Ah/OHuDm/h+MqE8CF13Y9VenLun8HCzmjmy5RRvuzp9d2qvEIvMBzBLSN0AiKUrjYl
         i3pFlkRw7LHIA6jAz/ADmes2D09vBqP9UyRB2qWuGI1kvfTc31MunNUUtNywiunUCAqJ
         CUzTJSkKsQdZoUFhKOkRaZUB/uNWQtYKUILvCesMr8GfACbJUri9jwE9ARzw+jmnsOVB
         EcTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=nV64JzBOom1xn4AcT/3DwAOt0mBTF+/BWM8TD7Es0Ms=;
        b=IdhCZyCMaXggFZc5gSUpXzaCiHrydooZCJJvpCGBDBdCaE27NH4wZpgDVJRaozPeF6
         +jszm9O6Jz4hz8Ul8DyfaQm4VGJ2US0OPGuafqoVwYhDKkWXFz+zWV8JVzUDGuz/qJ9/
         CVbpowA5E8c8Y4GX4EcjKrZZA/iB2hiYE/2fAMquAoAicP8tuY5z+URHuXXxppIaHtqN
         TASoQyh7uIVX3wrmiDYkEggJPDaafbTgs5Q+TtEEoGwPvVCwpMatAEImsz0HTV0kk94V
         2zxYuIf82eCQKLBtWQhPre6R5Z+gmvi8LZBPF905UQBiHWnsQIRQ9qJAWY038P2UlNBa
         W/DQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id r1si481853wrp.3.2019.09.02.22.59.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Sep 2019 22:59:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x835xSqx009966
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 3 Sep 2019 07:59:28 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.40.78])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x835xPkV010486
	for <jailhouse-dev@googlegroups.com>; Tue, 3 Sep 2019 07:59:28 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 08/13] jailhouse: Use template mechanism for Debian control files
Date: Tue,  3 Sep 2019 07:59:20 +0200
Message-Id: <19b2b9d47045107d8b6dc00da9b4707f926f38b8.1567490365.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1567490365.git.jan.kiszka@siemens.com>
References: <cover.1567490365.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1567490365.git.jan.kiszka@siemens.com>
References: <cover.1567490365.git.jan.kiszka@siemens.com>
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

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 recipes-jailhouse/jailhouse/files/debian/changelog    |  5 -----
 recipes-jailhouse/jailhouse/files/debian/control      | 13 -------------
 recipes-jailhouse/jailhouse/files/debian/control.tmpl | 13 +++++++++++++
 recipes-jailhouse/jailhouse/jailhouse.inc             |  6 ++++--
 4 files changed, 17 insertions(+), 20 deletions(-)
 delete mode 100644 recipes-jailhouse/jailhouse/files/debian/changelog
 delete mode 100644 recipes-jailhouse/jailhouse/files/debian/control
 create mode 100644 recipes-jailhouse/jailhouse/files/debian/control.tmpl

diff --git a/recipes-jailhouse/jailhouse/files/debian/changelog b/recipes-jailhouse/jailhouse/files/debian/changelog
deleted file mode 100644
index 1993260..0000000
--- a/recipes-jailhouse/jailhouse/files/debian/changelog
+++ /dev/null
@@ -1,5 +0,0 @@
-jailhouse-@KERNEL_NAME@ (@PV@) unstable; urgency=low
-
-  * Generated package.
-
- -- Jan Kiszka <jan.kiszka@siemens.com>  Fri, 29 Dec 2017 00:00:00 +0000
diff --git a/recipes-jailhouse/jailhouse/files/debian/control b/recipes-jailhouse/jailhouse/files/debian/control
deleted file mode 100644
index 817dc5e..0000000
--- a/recipes-jailhouse/jailhouse/files/debian/control
+++ /dev/null
@@ -1,13 +0,0 @@
-Source: jailhouse-@KERNEL_NAME@
-Section: misc
-Priority: optional
-Standards-Version: 3.9.6
-Build-Depends: linux-headers-@KERNEL_NAME@, git,
-               dh-python, python-pip:native, python-setuptools, python-mako:native
-Maintainer: Jan Kiszka <jan.kiszka@siemens.com>
-X-Python-Version: >= 2.7
-
-Package: jailhouse-@KERNEL_NAME@
-Architecture: any
-Depends: ${shlibs:Depends}, ${python:Depends}, linux-image-@KERNEL_NAME@, python-mako
-Description: Jailhouse partitioning hypervisor
diff --git a/recipes-jailhouse/jailhouse/files/debian/control.tmpl b/recipes-jailhouse/jailhouse/files/debian/control.tmpl
new file mode 100644
index 0000000..c8e625f
--- /dev/null
+++ b/recipes-jailhouse/jailhouse/files/debian/control.tmpl
@@ -0,0 +1,13 @@
+Source: ${PN}
+Section: misc
+Priority: optional
+Standards-Version: 3.9.6
+Build-Depends: linux-headers-${KERNEL_NAME}, git,
+               dh-python, python-pip:native, python-setuptools, python-mako:native
+Maintainer: Jan Kiszka <jan.kiszka@siemens.com>
+X-Python-Version: >= 2.7
+
+Package: ${PN}
+Architecture: any
+Depends: ${shlibs:Depends}, ${python:Depends}, linux-image-${KERNEL_NAME}, python-mako
+Description: ${DESCRIPTION}
diff --git a/recipes-jailhouse/jailhouse/jailhouse.inc b/recipes-jailhouse/jailhouse/jailhouse.inc
index 539e9d6..cedd9c2 100644
--- a/recipes-jailhouse/jailhouse/jailhouse.inc
+++ b/recipes-jailhouse/jailhouse/jailhouse.inc
@@ -19,6 +19,9 @@ SRC_URI = " \
     git://github.com/siemens/jailhouse;branch=next \
     file://debian/"
 
+TEMPLATE_FILES = "debian/control.tmpl"
+TEMPLATE_VARS += "KERNEL_NAME"
+
 S = "${WORKDIR}/git"
 
 inherit dpkg
@@ -27,13 +30,12 @@ DEPENDS = "linux-image-${KERNEL_NAME}"
 
 do_prepare_build() {
     cp -r ${WORKDIR}/debian ${S}/
+    deb_add_changelog
     if [ "${DISTRO_ARCH}" != "amd64" ]; then
         # Install device trees only on non-x86 archs as they only exist there
         echo "configs{,/*}/dts/*.dtb etc/jailhouse/dts" >> ${S}/debian/jailhouse.install
     fi
     mv ${S}/debian/jailhouse.install ${S}/debian/jailhouse-${KERNEL_NAME}.install
-    sed -e 's/@PV@/${PV}/g' -e 's/@KERNEL_NAME@/${KERNEL_NAME}/g' \
-        -i ${S}/debian/changelog ${S}/debian/control
 }
 
 dpkg_runbuild_prepend() {
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/19b2b9d47045107d8b6dc00da9b4707f926f38b8.1567490365.git.jan.kiszka%40siemens.com.
