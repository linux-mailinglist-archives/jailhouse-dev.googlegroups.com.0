Return-Path: <jailhouse-dev+bncBCPOXAO4SYIBBVUTTPZAKGQEJS3SOWI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BC515E296
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Feb 2020 17:24:55 +0100 (CET)
Received: by mail-ed1-x539.google.com with SMTP id f13sf7927336edy.21
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Feb 2020 08:24:55 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581697495; cv=pass;
        d=google.com; s=arc-20160816;
        b=uqEholD+JlbMsyP4BLUnr7/RBEw+IWc3yRGDMDnJWnlSxvPYO1cWm/3NKZN31FpQNr
         S5E3KR6+ZLEGH3MnzGUf+Cyfg1jQxPmT30fCBhM3tu4QZWo3F0RJoEdd+xraGdXKYhTT
         1DjnMVLh4Z1bOg38DX8CfgcqyVr39QKDscliRb5EEVV3CZH/KXKBcNS/UdWN7HEonVLh
         bjgFFXVEiOj1OHQlmY/EA+mkXnK2BoMuG99EbywW3yLw+5QuI3oT/EhGQUmBdlmYl9nW
         YG0hhRysdAFDMe4VXM9PijGF+fhIZYhJvVhNGup5ejqdZoBVDEkI+INRQZdVeE7uakYq
         vz6w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=Vei1soRoPNxdTibcrfqwKuYGVob0tew1u0iu/t5uSbo=;
        b=Xl0lorCTy/8sSJ2Cv9KCqUoyVs9KcCUKsps0sWvIZ6eL8GlJu+kE237XK5cr3qcdxS
         JT5u61fTEeNfDxWwrdV6XLOCl6JOScCxRZCAK4GqaVDutv9dIlabwxBR0ASWbCIQe3p9
         efgYOiavBOddogou9GrAcXi8Ntopmz9CR7ErDUSoddH02OMcE/dZIokOI2VjiQvxtKR3
         fEGzHXPHHajVSnpU9kIVMTN9zbUquf0iajCn/8+3AG3UaVM+M8KnItHXphEP1GC5VZ4T
         4r27wAyUtO87X9syjUG5kZ/h9zogxId3YwaTTRnQxVi9OMSMnFKd40or58sa324LNRJq
         De8A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=mzHfHNKi;
       spf=pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2a00:1450:4864:20::341 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Vei1soRoPNxdTibcrfqwKuYGVob0tew1u0iu/t5uSbo=;
        b=ov8+MksfqLn8pbW03CsyVxBqjq0jfjo7g4qhWbGXU9s2E0pykoks0ReqBDRqkFa+S3
         3kPPrhpU5Z5WjEGyQrEqVXCKpJtowU0G17U63P2PRrsbISGfTQYPM1wv1kbkctD/r+3Y
         dX3kNxbbuBow/nARyJstqjGUwXr7u9c+7R8IXDsG3+UXvNzNP3Q5UfhxlzwgkFlCyva1
         oDoqnvAo6rwZFPouP2DbMCK3ccqah/kQdk21k4fscf/V7FzqxM0cllYBFXoa/sBUxODf
         tDvejimyaj9rOj/e66WCxaBrBoZylOzdFpqomZZ1Fs2a30POFHxVrymFmIOEFUBP3wv1
         6G3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Vei1soRoPNxdTibcrfqwKuYGVob0tew1u0iu/t5uSbo=;
        b=V5lrWOMm2EDtCaw5Sa0Ot8jLJPoQFFgC7fLi6pDSROU1kwA2OpbrF3z4bgusAKvt/p
         Qsq7IoVAI3swIoQ0ghp+c0Kk3aWwCe8OlJkfmsYpFAfr5AtpATZRg33FFCkaH0xOTuaB
         I8h7r4SpP8vgOdWfBXneJIZvnW7g1DrY2c0zA4/+oVva9yhChfIy/vtJqLopupqXy7Vp
         WBAfuKqqBwYPkmD8CNTFmIyPwU1ykqyfGXSgfW4g7QoWKfgpHBXalM8hpqdszVuaQRBh
         zLX7a7t3MejK8KQseLbaLFCkyjBt/0idQxOZi45E3cxUGYSDII39OAHjqCnjdUGJrFm6
         8aFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Vei1soRoPNxdTibcrfqwKuYGVob0tew1u0iu/t5uSbo=;
        b=Xx3H94gYSe48KCt7BNbUK3Mrzq3ESIN8IvAkjCfCEHENlyULA3YvJ3ZbgEGI2kUCN+
         q2r9PNfUrfB1EHdcHuXAf48v2NZbNKSkIHcYE6mKXCLU+omO0W2tWCQFhagWjmt6EwwW
         4g84UQPsIVADExeJ172EgDM/SQ5HpJgOYenKdgPxlRlEvjvapTVbNAGSnITLmeh4sUro
         x09kvYK2sozfC+Dvz+QzJc/YNeFhsnzqxlrdLX+q20/V48rrLxJ2zDBXCmVt6s/3Wcwl
         T5jPz6u8bT2GAXw41CtS1nQw5vvRaMVqw5n35x9bATy5tZAfgeKoNzafujaGC32UFqyi
         C1uA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWnLDaCN1R6a5++sUfZ0KFSypVnWR1T/Vk8kMGT1UGSqisdoAAe
	46y8SxfifEeWIukl1BwhunA=
X-Google-Smtp-Source: APXvYqwTjIHeXMkKoaIrzbb78WrM6uwAWK/x8tloqFy11Up3soeL4EkHtTVN3YhDME8VF6rTdoHIag==
X-Received: by 2002:a17:906:c78b:: with SMTP id cw11mr3708233ejb.262.1581697494886;
        Fri, 14 Feb 2020 08:24:54 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:177c:: with SMTP id da28ls1654515edb.8.gmail; Fri,
 14 Feb 2020 08:24:54 -0800 (PST)
X-Received: by 2002:a05:6402:1ac4:: with SMTP id ba4mr3596848edb.201.1581697494061;
        Fri, 14 Feb 2020 08:24:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581697494; cv=none;
        d=google.com; s=arc-20160816;
        b=IoiF9EZ783H9SfgHdF3Eh3Zv+XA5f5K/1TW24Ds2o6o8KCqYLvktdwUAlVtpDAzWWN
         CsNib62Nt/0lMf1D4rEfuZYm2p8umfcn9pVsimyQ/yCxpLgcaJe5u/2zG6v/rMl7LwDF
         XbT1cq2le52WftlgBwX3ppCFFV84l+pZYlsYloq4qOt6ZjTlfNYWcPj7lfYxKxWtDEgM
         OOxgWi8J03to9W4E0RbnCkhjuCJhDomd8qdiiZdC1S9P4iQ1uT5JA5rnLLKjcrbvyz4x
         IyUGjQ2u3qrP5FqUSx8Aju47Q7r2icWobks038E0CYFNn2TscelJWswnRQA0nBe/SEVq
         YhEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=g0rSFXcou1ijd90xbcfF6jhylVtD+B6eQG/E9Xb6DE8=;
        b=JJelLIrnah5btDE/4xEa+QXp1Pfn8CeKESb08tGh5wtz/j0oCwZO2/J4syRureaOiQ
         3Dj7UDpjUAlmdajXykyCuw1Bg71H6PYoZ3spu5J26cL8Sx86l45PhpjiczRRbsoepOKX
         xI44OneJnI7OUAhX3Zmstz/RRPS7UEWiWwJziVQ9LKGYjKd4E/3pzz8fjakzijdccrj4
         hSdGQeKKtquO7KGwmxqiKGUvuoII5qSvSPbO1Em/QP4I9qheI6EDFhWtB14aVI2rSBBK
         fKoL6rpl8RijpN1sJ44IauwF0iCHIem8dPeAQ6ga9LlsqX8rLmJg2ISkST4QaeskcH+D
         8fag==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=mzHfHNKi;
       spf=pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2a00:1450:4864:20::341 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com. [2a00:1450:4864:20::341])
        by gmr-mx.google.com with ESMTPS id cw13si168176edb.2.2020.02.14.08.24.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2020 08:24:54 -0800 (PST)
Received-SPF: pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2a00:1450:4864:20::341 as permitted sender) client-ip=2a00:1450:4864:20::341;
Received: by mail-wm1-x341.google.com with SMTP id a6so11266114wme.2
        for <jailhouse-dev@googlegroups.com>; Fri, 14 Feb 2020 08:24:54 -0800 (PST)
X-Received: by 2002:a1c:488a:: with SMTP id v132mr5557280wma.153.1581697493004;
        Fri, 14 Feb 2020 08:24:53 -0800 (PST)
Received: from oxygen.mgc.mentorg.com (nat-sch.mentorg.com. [139.181.36.34])
        by smtp.gmail.com with ESMTPSA id s22sm7721336wmh.4.2020.02.14.08.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2020 08:24:51 -0800 (PST)
From: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
To: jailhouse-dev@googlegroups.com
Cc: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
Subject: [PATCH v2 2/4] recipes-bsp: Add support for pine64-plus uboot
Date: Fri, 14 Feb 2020 21:54:38 +0530
Message-Id: <20200214162440.27509-2-vijaikumar.kanagarajan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200214162440.27509-1-vijaikumar.kanagarajan@gmail.com>
References: <276d18e9-3f9b-4b93-8f5b-7223a4bea0f5@googlegroups.com>
 <20200214162440.27509-1-vijaikumar.kanagarajan@gmail.com>
X-Original-Sender: vijaikumar.kanagarajan@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=mzHfHNKi;       spf=pass
 (google.com: domain of vijaikumar.kanagarajan@gmail.com designates
 2a00:1450:4864:20::341 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
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

Add support for building pine64-plus u-boot. Use mainline u-boot + ATF.

Build only the necessary envtools. u-boot tools-only build is broken
upstream and hence not supported here.

Signed-off-by: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
---
 recipes-bsp/u-boot/files/pine64-plus-rules    | 32 ++++++++++++++++++
 .../u-boot-pine64-plus_2019.10-atf2.2.bb      | 33 +++++++++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 recipes-bsp/u-boot/files/pine64-plus-rules
 create mode 100644 recipes-bsp/u-boot/u-boot-pine64-plus_2019.10-atf2.2.bb

diff --git a/recipes-bsp/u-boot/files/pine64-plus-rules b/recipes-bsp/u-boot/files/pine64-plus-rules
new file mode 100644
index 0000000..f6340f7
--- /dev/null
+++ b/recipes-bsp/u-boot/files/pine64-plus-rules
@@ -0,0 +1,32 @@
+#!/usr/bin/make -f
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Vijai Kumar K, 2020
+#
+# Authors:
+#  Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+ifneq ($(DEB_BUILD_GNU_TYPE),$(DEB_HOST_GNU_TYPE))
+export CROSS_COMPILE=$(DEB_HOST_GNU_TYPE)-
+SET_CROSS_BUILD_TOOLS=CROSS_BUILD_TOOLS=y
+endif
+PARALLEL_BUILD=-j $(shell echo $$(($$(nproc) * 2)))
+
+override_dh_auto_build:
+	$(MAKE) $(PARALLEL_BUILD) -C ../arm-trusted-firmware-* PLAT=sun50i_a64 bl31
+	$(MAKE) $(PARALLEL_BUILD) $(U_BOOT_CONFIG)
+	BL31=$$(readlink -f ../arm-trusted-firmware-*/build/sun50i_a64/release/bl31.bin) \
+	$(MAKE) $(PARALLEL_BUILD) $(U_BOOT_BIN)
+	$(MAKE) $(PARALLEL_BUILD) $(SET_CROSS_BUILD_TOOLS) NO_SDL=1 envtools
+
+override_dh_auto_install:
+	mv tools/env/lib.a tools/env/libubootenv.a
+
+override_dh_auto_test:
+
+%:
+	CFLAGS= LDFLAGS= dh $@ --parallel
diff --git a/recipes-bsp/u-boot/u-boot-pine64-plus_2019.10-atf2.2.bb b/recipes-bsp/u-boot/u-boot-pine64-plus_2019.10-atf2.2.bb
new file mode 100644
index 0000000..4842ef8
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot-pine64-plus_2019.10-atf2.2.bb
@@ -0,0 +1,33 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Vijai Kumar K, 2020
+#
+# Authors:
+#  Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+U_BOOT_PV="${@d.getVar('PV').split('-atf')[0]}"
+ATF_PV="${@d.getVar('PV').split('-atf')[1]}"
+
+require recipes-bsp/u-boot/u-boot-custom.inc
+require recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_${ATF_PV}.inc
+
+SRC_URI += " \
+    ftp://ftp.denx.de/pub/u-boot/u-boot-${U_BOOT_PV}.tar.bz2;name=u-boot \
+    file://pine64-plus-rules \
+    "
+SRC_URI[u-boot.sha256sum] = "8d6d6070739522dd236cba7055b8736bfe92b4fac0ea18ad809829ca79667014"
+
+U_BOOT_CONFIG="pine64_plus_defconfig"
+U_BOOT_BIN="u-boot-sunxi-with-spl.bin"
+
+BUILD_DEPENDS += ", libssl-dev, swig:native, python-dev:native"
+
+S = "${WORKDIR}/u-boot-${U_BOOT_PV}"
+
+do_prepare_build_append() {
+    cp ${WORKDIR}/pine64-plus-rules ${S}/debian/rules
+}
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200214162440.27509-2-vijaikumar.kanagarajan%40gmail.com.
