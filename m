Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBAE5W2PAMGQE6MM3TEA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 501A36771DA
	for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Jan 2023 20:29:05 +0100 (CET)
Received: by mail-wm1-x33e.google.com with SMTP id c7-20020a1c3507000000b003d355c13ba8sf6327994wma.6
        for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Jan 2023 11:29:05 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1674415745; cv=pass;
        d=google.com; s=arc-20160816;
        b=0lbm4BSDZ74HBlVf/uJW9/szEzoxVZz18RnItKDcaphb8jnPxDdiNKKxOSwILsGA1m
         0/g+cobODh3b5GAcZtsTJ+Y7KKBKnF3hhu8M1qOEc3IJAuRqS1m7NOsTVZ2aToYtvGR8
         x4bY0zwCt3exGEdVeGRj2b3V6T1ap8KjfpYr/9tNbfwF+fdGQXaPnwNNO2Zy6jjW2YW0
         nZup/eaww2/6H7CU5NxRGWNgFqPpj0binYEnmxHM6iRt5bWuAD4j4QUwaHyu9PRZTlny
         onriTnsFy3IVxZ0QwB7DWhqOu5KF29Is8gNWT2Wrb1PDiTvgwKvFoITmCaUwIaa6RZm1
         yOsw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:feedback-id:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:sender:dkim-signature;
        bh=BJA7SqwZhdkdj439d6SedSj49SL0qc0TKAZA3Bumoac=;
        b=VVbtJ6RuslI0ucXw0k5//jt5R9Fnzl4Xy/p5Yr7rG6uOcw41LY4xXMFrq9bXEb/5P+
         5HTpxs6F8as+IXRhtevNKuxSnvhRF1Cidila+OI90qHmyOe/2P8Kop3UCbNBty7mglDb
         Zww/ms3stzJPGLXijEwPZfKhoq21XGfEdr7MV3K4kI0lPN3xJNkU5yu0AYKLjbpp1Bu4
         nmQMPEivuK3c2acNqIJUOs79LRrJ6diGesr8n9/jsev57yQlIKZyCdbj8LDAjfgvgO4H
         8+iHTeSGvx/5H3fAIfEcvPimYRbcYGINNamrjucVabRDbgxvkHEYzF2CzF5LtlpTrc8g
         GAkQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=fm1 header.b=Hn4Uu+t0;
       spf=pass (google.com: domain of fm-294854-202301221929023c341b2da700f3b19a-wwyff3@rts-flowmailer.siemens.com designates 185.136.65.225 as permitted sender) smtp.mailfrom=fm-294854-202301221929023c341b2da700f3b19a-WwYFF3@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:feedback-id:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJA7SqwZhdkdj439d6SedSj49SL0qc0TKAZA3Bumoac=;
        b=Ah2PauJN+uPh/UHIMN30D6y+dYElv6NpFUYZUXcPwOze8jVP5dIh3BcF+/gMnGXaH+
         EJkRBzWz+CBllw3NZhDrtZwT01Z4VZtjR6Tj4eZZYcE3UQxxZ4vbPeaQyW7yaA5kNbty
         nF3NpqfXOH6gw6V5pGR2UHqegEWkiBIzIKy3aRSm1cZkJAMVZd9NRU81YLTo6PQ5NcoL
         ZrZ0SXCu+nvTDPZEht9e8dlq3dqqaYaHkdkDEVdd+pT+s2OA1pYV/xXUjAKe7hgfzAZd
         bZsmIoxSm5W7Hv+iYwDQJZnbYfqeSm3k2sB9fVb1NKV1N9splldMyi5GOGprUB8Vwz7+
         cQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:feedback-id
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BJA7SqwZhdkdj439d6SedSj49SL0qc0TKAZA3Bumoac=;
        b=JvBfio6FGnNdTGT8mK2by+4cEmWONpKaaxyQJGGF9PQsKZB1YiqUJTbp8iqm8p7EK/
         Li7HlPuPmq1Q/HVnJXDG3JPS2hAqF0FNMuuaHLP2kpCGsL+imoJ/TQv8Jz5eM6CH7zd6
         /fnjpBV0ykggb9ReJe2CNKE3smxuEabn+FMzkwivINI9bI9y5gi6ING/2NEE+XIRm7UF
         kERMnTEbd4dzAZvegDlfVUNAzPwEXO1H5/Z2BxSQWaIEVo3LBMP7fDeNspNGK8ITT9XX
         /x/6Ab/9jmTHhq6EwYjsBx8KoWNJUFJHa2nW2p1JCGBVIXTQyG9gbfGhtpgy1kFPCjjc
         WWag==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kogy6tCVkZMRSFLQTYzRndxa9Tmxb+HVzeKJyna6zDwZSZ+QcOe
	ZAD2h4rXhY7nhsu/g13Cu2s=
X-Google-Smtp-Source: AMrXdXsyVnmVOwH/tNMzwfzS2gjv3nmXGnzifOh8Qw6LNywhtplQLEEifmVXrkUALwFTScmhpiCqDw==
X-Received: by 2002:a05:600c:15cb:b0:3c6:bd12:ac68 with SMTP id v11-20020a05600c15cb00b003c6bd12ac68mr1189652wmf.123.1674415744904;
        Sun, 22 Jan 2023 11:29:04 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:4f93:b0:3cf:9be3:73dd with SMTP id
 n19-20020a05600c4f9300b003cf9be373ddls7052098wmq.3.-pod-canary-gmail; Sun, 22
 Jan 2023 11:29:03 -0800 (PST)
X-Received: by 2002:a05:600c:b54:b0:3c6:e60f:3f6f with SMTP id k20-20020a05600c0b5400b003c6e60f3f6fmr21482415wmr.38.1674415743388;
        Sun, 22 Jan 2023 11:29:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674415743; cv=none;
        d=google.com; s=arc-20160816;
        b=jGCrvJsvdljZvSXdvZhBb7YxHANImA81i22/Gl/dzgkGbn9155rSpoYZK9euHxCPPn
         l8JjLZx0IdzkKOgiKyQnyFyE0btFkqxIXxj+iqT6fqV2dvb047haiAjaSrFjsFuUKck8
         /4GdL5fwsEn3sQtYEjYyqvsyhBt7vcd0ESwnCnzYAmU5DWKagu45PnRV1FD9i7Cs0vPt
         GFsQz+cxvSjbG4gmI+Uh6DnoskVVTrKw0Xjb/mAuJcOo2swioQk+1QWWs0Aww56LS6AU
         BasokAQmr2KysWSTQvLmI5qXsVFzqg2lLI8uJJgJOYL/EKxeF0Ct4sFl1dfRmNghCH6r
         8sKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=feedback-id:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=jVrhC9aRrLPTqc0FweT7SCeu1H1rktxoFd86QGghXGs=;
        b=E4e2TYiENdS0MVPHFI/CYXonPHZHir6Y4ySgJmL3I1Ma7VAjaqgbpkrUmKvAm61XjB
         uTl3l9SVJ7vgGkuY9lT+S0+QCWArEWajromnWa0BXb+bvRE0jECI3azRIvFO5en+HLyJ
         w68QRE9Ox18Kc74DsePSAYGeI8Tjv35ZBk9jqs+nHywHYthzn1MdLx58OSrtqkonl22U
         fg3jE+7KH7iFtFt9YoXv+MtgmCKG3b8d0iZxGj2SQHiWoawBmepZESpf66DCVGqfT2R0
         o5jIDVFPP6HrLAvr6azJbirPc3w8wfHE+bJlbJYMiBHxFhf6nTMcZI0cCdyPl7ycM+lM
         mMpQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=fm1 header.b=Hn4Uu+t0;
       spf=pass (google.com: domain of fm-294854-202301221929023c341b2da700f3b19a-wwyff3@rts-flowmailer.siemens.com designates 185.136.65.225 as permitted sender) smtp.mailfrom=fm-294854-202301221929023c341b2da700f3b19a-WwYFF3@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net. [185.136.65.225])
        by gmr-mx.google.com with ESMTPS id r6-20020a1c2b06000000b003db0037852esi637170wmr.0.2023.01.22.11.29.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Jan 2023 11:29:03 -0800 (PST)
Received-SPF: pass (google.com: domain of fm-294854-202301221929023c341b2da700f3b19a-wwyff3@rts-flowmailer.siemens.com designates 185.136.65.225 as permitted sender) client-ip=185.136.65.225;
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202301221929023c341b2da700f3b19a
        for <jailhouse-dev@googlegroups.com>;
        Sun, 22 Jan 2023 20:29:03 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 03/14] scripts: Add config checker script
Date: Sun, 22 Jan 2023 20:28:50 +0100
Message-Id: <051aa4a9d5e96ba29bf407e6bd43046764a7acfb.1674415741.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1674415741.git.jan.kiszka@siemens.com>
References: <cover.1674415741.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-294854:519-21489:flowmailer
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=fm1 header.b=Hn4Uu+t0;       spf=pass
 (google.com: domain of fm-294854-202301221929023c341b2da700f3b19a-wwyff3@rts-flowmailer.siemens.com
 designates 185.136.65.225 as permitted sender) smtp.mailfrom=fm-294854-202301221929023c341b2da700f3b19a-WwYFF3@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Allows to check most root-cell configs along with typically loaded
non-root cells. Except for dual-core targets and x86, each
config/<arch>/<root>.cell is tested along <root>-inmate-demo.cell and
<root>-linux-demo.cell.

Note that the configs have to be compiled for all architectures before
calling the script.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 scripts/check-configs | 90 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100755 scripts/check-configs

diff --git a/scripts/check-configs b/scripts/check-configs
new file mode 100755
index 00000000..7017cc74
--- /dev/null
+++ b/scripts/check-configs
@@ -0,0 +1,90 @@
+#!/bin/sh
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2023
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2.  See
+# the COPYING file in the top-level directory.
+#
+
+topdir=$(readlink -f $(dirname $0)/..)
+
+JAILHOUSE_CONFIG_CHECK=${topdir}/tools/jailhouse-config-check
+
+ONLY_TWO_CELLS=" \
+	bananapi.cell \
+	emtrion-rzg1e.cell \
+	emtrion-rzg1m.cell \
+	espressobin.cell \
+	imx8dxl.cell \
+	jetson-tx2.cell \
+	k3-j7200-evm.cell \
+	k3-j721e-evm.cell \
+	ls1028a-rdb.cell \
+	"
+
+only_two_cells()
+{
+	for match in $ONLY_TWO_CELLS; do
+		if [ "$1" == "${match}" ]; then
+			return 0
+		fi
+	done
+	return 1
+}
+
+run_check()
+{
+	[ -f ${topdir}/configs/${arch}/$2 ] || return
+	if [ -n "$3" ]; then
+		echo -n "Checking $1 $2 $3... "
+		output=$(${JAILHOUSE_CONFIG_CHECK} \
+			${topdir}/configs/${arch}/$1 \
+			${topdir}/configs/${arch}/$2 \
+			${topdir}/configs/${arch}/$3)
+	else
+		echo -n "Checking $1 $2... "
+		output=$(${JAILHOUSE_CONFIG_CHECK} \
+			${topdir}/configs/${arch}/$1 \
+			${topdir}/configs/${arch}/$2)
+	fi
+	if [ $? -eq 0 ]; then
+		echo "ok"
+	else
+		echo "FAILED"
+		if [ -z "${quiet}" ]; then
+			echo "-->>>---"
+			echo "$output"
+			echo "--<<<---"
+			echo
+		fi
+	fi
+}
+
+[ "$1" == "-q" ] && quiet=1
+
+# x86 is special
+arch=x86
+echo "--- x86 ---"
+run_check qemu-x86.cell apic-demo.cell tiny-demo.cell
+run_check qemu-x86.cell ivshmem-demo.cell linux-x86-demo.cell
+
+for arch in arm arm64; do
+	echo "--- ${arch} ---"
+	for root_cell in $(cd ${topdir}/configs/${arch}; grep -l JHSYS *.cell); do
+		if only_two_cells ${root_cell}; then
+			run_check ${root_cell} \
+				${root_cell/.cell/-inmate-demo.cell}
+			run_check ${root_cell} \
+				${root_cell/.cell/-linux-demo.cell}
+		else
+			run_check ${root_cell} \
+				${root_cell/.cell/-inmate-demo.cell} \
+				${root_cell/.cell/-linux-demo.cell}
+		fi
+	done
+done
-- 
2.35.3

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/051aa4a9d5e96ba29bf407e6bd43046764a7acfb.1674415741.git.jan.kiszka%40siemens.com.
