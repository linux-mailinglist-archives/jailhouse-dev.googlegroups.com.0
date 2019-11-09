Return-Path: <jailhouse-dev+bncBCR25IHM6ANBB7P3TTXAKGQEJ7RVGBY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5E7F61BE
	for <lists+jailhouse-dev@lfdr.de>; Sat,  9 Nov 2019 23:30:22 +0100 (CET)
Received: by mail-ed1-x538.google.com with SMTP id f22sf7478481edj.14
        for <lists+jailhouse-dev@lfdr.de>; Sat, 09 Nov 2019 14:30:22 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1573338622; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ie4AfzmYpygXXfJofDMqHzCQC+Y6ewt8US4j0jZQw6QDNv6zlK0dYg7eEUClLsqNvT
         2uER93DudbTs4XsbtuPk9VjGNpgWxFDA7bv9lFE3/Xjbpdx6DQrOAx4zSf5t/AkKreW2
         7sAk7bOW6J4IDnK06dUvHxEXKm5WrX6WXT/+e5YoSIrn/tcpW2i1HcrS9dvtZXV2MCHQ
         2A3m/OSWIak6rKLjM7XzlMsauRRLdnrNHUxiFkJhRbJsRXsI/leamgyMx/Lwy2CGyLGS
         daftF8L/Uu15+OlyiNbxqxrB8C9gJrg+Q36uihTM5pRdPf9BCPe9NySliajZJjvp0svw
         BQ+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature:dkim-signature;
        bh=WvOnZzQshLHp4ro49WeqVtnVKw2Y8B5LeXeX3kLc/bU=;
        b=CK2DZsIaoKl9XUyjVgZakoi1tDoqTgPsvEM3BdWZjnTQx4VzASycaidIcXIbiB3Lra
         Al9oBdw+L40+GfoEJFQLwuG5wtvTp99rN3dllTYFF2rK0/DiEqIHFiHOhiTcUop/Fm5n
         mHBalLBsLcRyLoe/3k1RLZiaVK7CnmtmlUSiySbWvozh4l88kNpMeAIM7B3I5VNY/UrQ
         sSa62dSYEDfXPsQ/RNNTqnDCqC4DGPYGIJrQoJ+LgI0XI23XkwU4i07LTOY22Qoo+T74
         WEGqGQCnKj4h0RZkXkM+HON6juSo/ahGSSa/5BnNHKfyzRYCJAP6/vvO2gu9wrkYusIP
         UNOg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=LaBFYldv;
       spf=pass (google.com: domain of fontaine.fabrice@gmail.com designates 2a00:1450:4864:20::443 as permitted sender) smtp.mailfrom=fontaine.fabrice@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WvOnZzQshLHp4ro49WeqVtnVKw2Y8B5LeXeX3kLc/bU=;
        b=DBhh0HWD4cJmM/p+j98WuO5uwMPdSFCJHMnnUuL1d0/8jYW2i8jjG5aPsd89UdhYBt
         7bBWZIwNXbs0B2lUO7nHeXLFIa+FhTVaeUvWpJy6KpnBVB/77TxArVjgDzCMyMGsAPH+
         46c253Hy0s9h8RwfQdNjtnnjRG2vCBkbJw5Mfl8RLB7BNHq8hpgoosJ1AurnU07JZbvg
         oQ0o3AODmCRjA+wFzxLTUKOVgSyJn4PjXMS6MfXoVKk387X1hByI6DBk4fl6kEgijQTt
         xUOnlZwsGOTkS5ky6sCyOSjB/DiIJlQGPIUJApqga9Oo2o7NGEzYSmrsNhwrKD+BIQRp
         kbjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=WvOnZzQshLHp4ro49WeqVtnVKw2Y8B5LeXeX3kLc/bU=;
        b=Ba7EMCNjXopkrnNiMBe+d/ZHK1X9iNI3E6F9MPtQVtevtPvslAC4CEeDuzRzx/xgMi
         azFR7r1+U1ew2x7hnez9e3jUEU9u1ZDj1Ryh79ydh3JlQekA34vxrhWoQ/TAI34Ma2Tw
         L1MrCOu7pMbu/eddGube9C7cnYImL3oepdRtlad6g4z6ZR+mhsLI/+aPvADlVVSn/hIN
         MWXUAfPnA/q9zJXr/XRPe3PzMmz3DanViJi5zd2q8wiIZvHY5MxYid5Kdc5Afa3xxrec
         epG+sZn4ePy3kL0CrTYKaABmjdZEsqsUOm3IjEhFEee/mXSsf3JatOmvXYckyBTKf1Pe
         BTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=WvOnZzQshLHp4ro49WeqVtnVKw2Y8B5LeXeX3kLc/bU=;
        b=kuCP8m+Fby7rvztZfNIyx9DjlLWSPzsKZJ6gEZqMtdW9vAt6I0f7dHlmvDkYyZTBsi
         D+sc7irB7GHEKGtZs0geIGk5f67CLrrmrnIh/9D7dwONGchGW0eMQ9GZUeKfx1HCRZVR
         MI9YFkd7eIq2nktzKOsu2MxC/4RTLwhNeM5DQhUMCD9R7mnJ3VaCuXtXNHWbAYeRU3Qf
         h1kRwBCShI5IES7jmxS/YiIwJO86ZzS+pNhLjbq1JILpvqH8tBlBueR7ZZZT9XpZfMF1
         8J42UP5SZNloB8wuned/hDYKLlJC+5A+8A9x1MJ7Wllqw8o/C94SkbbAebhZH3Rk19SR
         sJuQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX7zQUfxKRgqIsKkoS+Oy3kfwu5YrFPBH4HT6duwOg5tdhs8hDt
	0+Zm/6+2xRJwgzGsdifRkss=
X-Google-Smtp-Source: APXvYqxJNLXisMwLCppFJ8V2whai+9MnfFGBQhk75NgULkHp47Vdex0QiWc96DKx+Jk5ozzIXBxbtQ==
X-Received: by 2002:a17:906:1542:: with SMTP id c2mr15312006ejd.80.1573338622186;
        Sat, 09 Nov 2019 14:30:22 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:f092:: with SMTP id v18ls1120538edl.9.gmail; Sat, 09 Nov
 2019 14:30:21 -0800 (PST)
X-Received: by 2002:a50:f987:: with SMTP id q7mr18121135edn.205.1573338621256;
        Sat, 09 Nov 2019 14:30:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573338621; cv=none;
        d=google.com; s=arc-20160816;
        b=TwsMPO6RdmZWPDPYt/tYbKy1pYRQORp/eBI8tQAOFxUVN4g50pk4fhdsvmK0/8lyQK
         F2XuBilslvdTUO0yAzjibpFMcU1A29Gh4GL463ZoCBk0ALrFEjk37Ys+0rUXhUnuhrMr
         IhBT5e6zry79wVDZR6RKFv7Cuup99sPXbY6lXoYbz1KPM6FcC7UeTpHvZxIgpWEdqUzT
         FT2b/iEuiwVhlLLc+83mOIZu3u2oKqZpvV8En1csWsKjUCLEmD5sonMNN4QhNp/Rmect
         rXDDumgoCKXTEMiu+ra5PJZza/uDOVAmi4vEvCLZG+ThGx4rmXBQu6FCBr6NDQzrWEIn
         xieg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=K8V7NrUkP3dIXoljipbXZnD2aZsoXkoEITjWNC5209s=;
        b=Gn9gLI0hVagG/4o6IS7iet0h+MwOmJZVUqQ0+JT/Vr5CGdNF4cBAUylaC2ydrRVx2X
         QMR2neOGYp3IbRdTDFSacGwvXZSm+ssu7R4eD1tnfPAo47Fwi06aPQSX8goquYmQg+lp
         lS2KgGz6P+ndcYFH0UywNxLKjgDxzY6hCr+xPgqDboYx9KO12d+gpvrkJqqlhliOrAyP
         ByCM7PlRD13Ct9h3zq/VgUNwaTl5v+R8tZI03YRbjQGldE01SXyIUHRYsCHq6uvI7ocV
         S6JpjIwPdvCPwxlnOr9XQIR+q74ogUOb6mexRn49HHV5Tq0as2vHmMnOXeqWG9euc2X6
         ZgzQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=LaBFYldv;
       spf=pass (google.com: domain of fontaine.fabrice@gmail.com designates 2a00:1450:4864:20::443 as permitted sender) smtp.mailfrom=fontaine.fabrice@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com. [2a00:1450:4864:20::443])
        by gmr-mx.google.com with ESMTPS id z18si798632edd.5.2019.11.09.14.30.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Nov 2019 14:30:21 -0800 (PST)
Received-SPF: pass (google.com: domain of fontaine.fabrice@gmail.com designates 2a00:1450:4864:20::443 as permitted sender) client-ip=2a00:1450:4864:20::443;
Received: by mail-wr1-x443.google.com with SMTP id t1so10810769wrv.4
        for <jailhouse-dev@googlegroups.com>; Sat, 09 Nov 2019 14:30:21 -0800 (PST)
X-Received: by 2002:a5d:6203:: with SMTP id y3mr14624648wru.142.1573338620674;
        Sat, 09 Nov 2019 14:30:20 -0800 (PST)
Received: from kali.home (lfbn-1-3732-187.w86-229.abo.wanadoo.fr. [86.229.230.187])
        by smtp.gmail.com with ESMTPSA id v9sm9344744wrs.95.2019.11.09.14.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2019 14:30:19 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: jailhouse-dev@googlegroups.com
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Subject: [PATCH] tools/Makefile: fix install of jailhouse-config-collect
Date: Sat,  9 Nov 2019 23:30:45 +0100
Message-Id: <20191109223045.26043-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Original-Sender: fontaine.fabrice@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=LaBFYldv;       spf=pass
 (google.com: domain of fontaine.fabrice@gmail.com designates
 2a00:1450:4864:20::443 as permitted sender) smtp.mailfrom=fontaine.fabrice@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

Since commit 37bc6c12a1b365250c0dcdd82ae1ac5a869898e1,
jailhouse-config-collect is not installed anymore on target as HELPERS
is updated after install-libexec target so fix this mistake

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 tools/Makefile | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/tools/Makefile b/tools/Makefile
index c7dbc734..7f4d00ff 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -35,8 +35,24 @@ KBUILD_CFLAGS += $(call cc-option, -no-pie)
 BINARIES := jailhouse
 always := $(BINARIES)
 
+HAS_PYTHON_MAKO := \
+	$(shell $(PYTHON) -c "from mako.template import Template" 2>/dev/null \
+	&& echo yes)
+
+ifeq ($(strip $(HAS_PYTHON_MAKO)), yes)
+always += jailhouse-config-collect
+HELPERS := jailhouse-config-collect
+
+else  # !HAS_PYTHON_MAKO
+
+$(info WARNING: Could not create the helper script to generate \
+	   configurations on remote machines \
+	   ("jailhouse-conf-collect"). You need Python and the \
+	   Mako library for it.)
+endif # !HAS_PYTHON_MAKO
+
 ifeq ($(strip $(PYTHON_PIP_USABLE)), yes)
-HELPERS := \
+HELPERS += \
 	jailhouse-cell-linux \
 	jailhouse-cell-stats \
 	jailhouse-config-create \
@@ -62,22 +78,6 @@ install::
 		   Python and pip in order to install them.)
 endif # !PYTHON_PIP_USABLE
 
-HAS_PYTHON_MAKO := \
-	$(shell $(PYTHON) -c "from mako.template import Template" 2>/dev/null \
-	&& echo yes)
-
-ifeq ($(strip $(HAS_PYTHON_MAKO)), yes)
-always += jailhouse-config-collect
-HELPERS += jailhouse-config-collect
-
-else  # !HAS_PYTHON_MAKO
-
-$(info WARNING: Could not create the helper script to generate \
-	   configurations on remote machines \
-	   ("jailhouse-conf-collect"). You need Python and the \
-	   Mako library for it.)
-endif # !HAS_PYTHON_MAKO
-
 MAN8_PAGES := jailhouse.8 jailhouse-cell.8 jailhouse-enable.8
 
 define patch_dirvar
-- 
2.23.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191109223045.26043-1-fontaine.fabrice%40gmail.com.
