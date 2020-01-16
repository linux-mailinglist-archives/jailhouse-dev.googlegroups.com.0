Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBS7YQDYQKGQEJH4YGQA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 945B813D7FD
	for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jan 2020 11:34:51 +0100 (CET)
Received: by mail-wr1-x43d.google.com with SMTP id k18sf9147960wrw.9
        for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jan 2020 02:34:51 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579170891; cv=pass;
        d=google.com; s=arc-20160816;
        b=C+fS6lq0V/2pP0HEJAfKX9iZfmpq7XH961zzNdf4+iJrT8deVeC3TeasUDJXDoriEK
         c+G1K9QVZjEXb7/N4fLsgiWXO0sBW2KiwfKUzf8u7jmbSzDfXhFDpm/VVHzSpaikURuC
         sGxLNMOcn207Gb4IDH7B6mAWHJoyQfLMXSw/BUVZJ1bAIlmxlejYtSeJBgaUR4+3JIWO
         gy270CP+7yplRNzTCNsohjihjOH0xmJWKUiYdwoKcxDK1jcHiJpvOVPaayOxDOspl58x
         P/bpYvqinIZUN9zjHtV1O+T7o6bj1e4d1juDd6ytLtP1B2+My6nKLU7e2RqeR7pqK6Wy
         fF7Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=oJF7Bb0PyaS4OrmV3ss1+qtFX5CZZu9KBOY4mlc81s0=;
        b=AjeOnowb/2iCq+YfQTJiyC40T4PpGR7IHJoiDamEbj2pO84dvo7V+xsU/sj4nYxp4n
         EVfqeFeBuUePfaFDtrmD3zi46sLFXcSNJ4pKZLZjfMMWBSGEMv+/G3yxTP4bD1DSHgHg
         QPvx3P7vMmmWxSvDxfs0xkJ+LkPrt3eiAOTp+Dc7Xt9ZoNHr9fM/+sQP7Iu+Z9fBuTUn
         Fpq5fuCLpGwFR0Spqwpu91SSG60wB6nMKnscHwxIn9XtDIdGZ7r2OfdJ8KsdI1piCW+4
         T5IfDSOePtWbTXVoNpIrKzyjrh/+1/Tn9bHVZgRt8dnhqWN7CfoNEg4lIHJO46UDy6+m
         U/tA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=oJF7Bb0PyaS4OrmV3ss1+qtFX5CZZu9KBOY4mlc81s0=;
        b=nQ8jvH1xwZXIwV4G5qfgZ6xFnegrGOteaVPSvSpFKqtTzLy+gd443meLz5H5qXJwXE
         rasJtnXzH+5lx6LlWjg79LGxGdfKg0mQhx7RBdf5PK+59gPKNzJtjWbWesAoQB5dkJ9u
         hdsdD3Zmny+zyp8p2vw+uj+8hKxEg+8rfYNCh1IDWdPur5vV1gQ1AAFGL3siskLPtRHC
         zEvHsZx4wWVoLHBQ4qcuzb/ONGck69owU3fIa7EZNSlg6QWNqm6UTRITP/gmcC8Xdv5V
         aV/OsKO0rnoa9fxnqfhR84CSTdiA42VxB0219XXH/mVgqpvNlMeoEtndBUgysnGCHw2m
         G2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=oJF7Bb0PyaS4OrmV3ss1+qtFX5CZZu9KBOY4mlc81s0=;
        b=IfhXKdNDwgoABiqx5d+IiE6k/++Ybl5YpySRcdqvLMtNelPPOvk3tOJjktUK5fELs2
         l2zQkN4TNqm7RufJSKefu9SPWUTpKnEBEaBlrXPC4I0G+DdJSWfeGfVKVPINt5VceOOo
         tg2Y/6W54w6bXaus/5Y5trxQtaajvMB+eL0Eu6CW1PTaQMjpq7V8XwezgDcIAoWxqY6p
         QnEFyv7LZe3qor49zG67je7O03zy78k1d97d7ZvLsUAVt8dwTsaJMvO7F4UDhKw27Mmj
         HQkmqqwYGdeShjwayLHiiEzNXkxnhVeNUAHtpfTDk1s8ojPS5XZ4YdmQwDxcQZqmnJr4
         Q0TA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWwzYZ0Bwsc159R3ILTXr4UUoh9/ZaK/dyoyG269meVivyiyHIi
	ij9z5DyltgcMkzMn/oJsbmI=
X-Google-Smtp-Source: APXvYqx/MXH9kiYnoeRkW+FJCPTmoOAlNKV8PE2+7ptTxHFsBVRjyT55ZMkEw7K+Y5nmNjxLYXk62A==
X-Received: by 2002:a05:600c:1050:: with SMTP id 16mr5686335wmx.20.1579170891322;
        Thu, 16 Jan 2020 02:34:51 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:6385:: with SMTP id x127ls1029683wmb.2.gmail; Thu, 16
 Jan 2020 02:34:50 -0800 (PST)
X-Received: by 2002:a05:600c:294:: with SMTP id 20mr5231284wmk.97.1579170890611;
        Thu, 16 Jan 2020 02:34:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579170890; cv=none;
        d=google.com; s=arc-20160816;
        b=UIk6DZnW9CviRi9OofNk92I6uI2HVvZm0PTbMqedITuE+h1eQb6odt7rg3YZ5bDZXb
         zvs8u6Ea0/gfzjn/UrtUwPw84Y8G4v2/fvRKZn0rAhFujc+Fz8JWZPe7gwHEzVnoyWA9
         Jdk/Q1Z03LkkaihCtWwdOUBpYnCzJH36LxnDXkCE+KOepCXYy8P+envhKj4qmoNkejuL
         sj2UXMWi5V3lu+q8F+4kqWWZJnLTSYP9QQinBRpAWtbwrat+IgzRwNOTftG0/08KtowP
         HVedE1vaRXtpo3scV8rLgHXWt7rmKxp89QnEDhl2P8sXJcBSIpjLRqlKBxF3FOfQ0VwT
         Z0pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=9h5v6NfGYfxUhxuNHdPSPODlzw1hhWGonffoo5Hp8rk=;
        b=rnUAY8FknybUNfTzZkigbxAGNMv9OCCg3hUfuibzk+me3PvPCLvzWYna+lxoaSnBge
         V4RV78nldyc77jV+VF71UWwsuDggtJPwe91Eb8vylndhw7+Q178UK9FXeACWYA903csk
         gj7jjp54VrJ+qTSRYsu630f6W0YJll6jWgI8wvWM/aLF6f33gtET4aQBzflzmqUrRYVQ
         LHlo5wj97DYh8kQdgbDLf2a7WTptTU9S0xIO2DdpA9AWGc0w5G0RlwJ2TZAJK0pXJwgo
         0KyACjVqzYsvqJXh8P5w2BEC7kTzAAgEt1VCAA66xgj3xuUBXS0Za23ivJE0nIFDnLyV
         601w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id m2si430149wmi.3.2020.01.16.02.34.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Jan 2020 02:34:50 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 00GAYo8U032089
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 16 Jan 2020 11:34:50 +0100
Received: from md1f2u6c.ad001.siemens.net ([139.23.78.127])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 00GAYmQQ031623
	for <jailhouse-dev@googlegroups.com>; Thu, 16 Jan 2020 11:34:50 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 16/18] customizations: Add RPi 4 support
Date: Thu, 16 Jan 2020 11:34:45 +0100
Message-Id: <a8da1c93aa96e331c62f192fb4c94ad0c17675da.1579170887.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1579170887.git.jan.kiszka@siemens.com>
References: <cover.1579170887.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1579170887.git.jan.kiszka@siemens.com>
References: <cover.1579170887.git.jan.kiszka@siemens.com>
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

Nothing special about this for the RPi 4, just needs the right names.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 recipes-core/customizations/files/.bash_history-rpi4 | 14 ++++++++++++++
 recipes-core/customizations/files/postinst-rpi4      |  1 +
 2 files changed, 15 insertions(+)
 create mode 100644 recipes-core/customizations/files/.bash_history-rpi4
 create mode 100644 recipes-core/customizations/files/postinst-rpi4

diff --git a/recipes-core/customizations/files/.bash_history-rpi4 b/recipes-core/customizations/files/.bash_history-rpi4
new file mode 100644
index 0000000..3595205
--- /dev/null
+++ b/recipes-core/customizations/files/.bash_history-rpi4
@@ -0,0 +1,14 @@
+jailhouse enable /etc/jailhouse/rpi4.cell
+jailhouse console
+jailhouse cell create /etc/jailhouse/rpi4-inmate-demo.cell
+jailhouse cell load inmate-demo /usr/libexec/jailhouse/demos/gic-demo.bin
+jailhouse cell start inmate-demo
+jailhouse cell stats inmate-demo
+jailhouse cell destroy inmate-demo
+jailhouse cell linux /etc/jailhouse/rpi4-linux-demo.cell \
+                     /boot/vmlinuz* \
+                     -d /etc/jailhouse/dts/inmate-rpi4.dtb \
+                     -i /usr/libexec/jailhouse/demos/rootfs.cpio \
+                     -c "console=ttyS0,115200 ip=192.168.19.2"
+ssh 192.168.19.2
+jailhouse disable
diff --git a/recipes-core/customizations/files/postinst-rpi4 b/recipes-core/customizations/files/postinst-rpi4
new file mode 100644
index 0000000..2dde661
--- /dev/null
+++ b/recipes-core/customizations/files/postinst-rpi4
@@ -0,0 +1 @@
+# Nothing to do
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a8da1c93aa96e331c62f192fb4c94ad0c17675da.1579170887.git.jan.kiszka%40siemens.com.
