Return-Path: <jailhouse-dev+bncBCB7D7MXMMINLG5X5QCRUBDHG5V7G@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa3c.google.com (mail-vk1-xa3c.google.com [IPv6:2607:f8b0:4864:20::a3c])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFE0C0183
	for <lists+jailhouse-dev@lfdr.de>; Fri, 27 Sep 2019 10:52:39 +0200 (CEST)
Received: by mail-vk1-xa3c.google.com with SMTP id l63sf2230063vkd.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 27 Sep 2019 01:52:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1569574358; cv=pass;
        d=google.com; s=arc-20160816;
        b=UXK+afhPH8RztBx8RR8gO4rRN0Wkfs0D3NwkcaIJe/QyZowT/XQVOAjO4koWREG5Ax
         34PwXqarUXFp9lAqlPRe0a0J/EQ1UBdqZcGBWb3Asp3lA5YB/DiyywCwUeG15Dx6rGxw
         RcazTLKIsLV3NaPTGKD9Fvdb/t9whVhkd15n5HQeaym+M3ZYPdQb37UfauBQMSYYyiOV
         1POoK/itjg67XJfDNUPjNcQ/HuhDna/gvpl4pZ5JDDsHBsM8yXB24Ip7vctJ4T6lG1ST
         M77LrsAIZ5NGz7PBClCJsZ2L1Qh6dUVJEP7c6J8a99t2mx9usERFACJHu2kPb8BMcEka
         bv7A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=+V6GAYiksFY0tyaRERjkqia+3AW7k3s+EcZhnhJIUn0=;
        b=UrwB8Vfx5yQ++qPqhHcIl+c4dPmN046PveL/mzTgFTTHB/Kr7BSHKMQtkPaIiHo5QP
         21DQwhwwtQ/4Rp6mobpvXNeEyvB1dkzlHZJEYi5Qh2BpcmSZNOyPD2dATRR+oVhXgTPC
         sUFY3we1qKJ6IPjG2WM/gpk3vW7FgW7QvztMKIk0euNQytKlP6zn0Ho9iCgbbuBeM+7b
         kVO4+U6/LP/SqJ63/DQD004ycGBgoJzxt+YbnV0cn9YekI57779BtW3kYb6Li5mnIImG
         SgC5mFxmtRRpKfqgUQLbJuiS9cPL7xz6IbXbPyFOK8AX3oI/yk5T+D3S5/hyWOkQkfep
         Mwdw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ic6a35ru;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=+V6GAYiksFY0tyaRERjkqia+3AW7k3s+EcZhnhJIUn0=;
        b=R8/gQFhDp8PBjqNxcktnzh9csX2hQGxrn+gapgT4e/2QIib/6BCMSLJshhasQ/MTNM
         2mK1C99RvF5z6eoKrxYSNaTsO1jU0F+1zxBVswOmokjENgvosAlvvx3lwYsEnPPWmqQi
         im4V2gJcURD970/ZrZvTNFEfapUFuKYvxdfym/eYV+7BtZomcOVf3joaK5Pcku4xBNmT
         s/hCXWQWSjczAMNz8mGhHHRpYm/IO0/DPHsNBpbVTD1McEl+dU6pDglOVA/gKktsuD6w
         gZQXHubccBKVVZ7G1mnIbGQtfWgE+Dn6EcuPLRx0TqcnZpE5FbdvKf536M7Jfokrbt97
         rBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=+V6GAYiksFY0tyaRERjkqia+3AW7k3s+EcZhnhJIUn0=;
        b=VIwFw+MAgBXMvRlor2TNav3PnC7bhToG8vXkghic1xoPCygmAxNrN2NsIeywIiXrh5
         OPsMgKwSI1kb3Mmx3YTNuTwudIugwUfcheitjLPV6mjZ/7Ua+/pv/ZpZHNhaKpLWXV5s
         +r4laQDnyTF/c7PZXohXdfUaUjUIhzmpzeqS4LHX5PKq9YVuxKi/HhdOj7SD/uf18Xw1
         QmWpdiFIYUYEpk3K7/uAMjAfqeIvp6z+Vc9WpiLlI1p53FE9O7+hj9JTPjw0pvpT2mZ+
         xrCtjqxC3vYK9FFw52QRextYTTah37fvtGBsov6Fv+B0LQC1kzAXkWKDQ5kbPXb3LBCb
         jfLA==
X-Gm-Message-State: APjAAAWU9wfHhejZ0SG3cWYFVPTRv/RRVtDAhprHqQgeNUryJ3VVJKoM
	SgSrW9RErGSDxvyc/GhFJCE=
X-Google-Smtp-Source: APXvYqwwThEck/P1kdGxSvW77+FAT4VUWpNfc0rtygJUer9aEaPLC2d6XzHa9tRAv8i2rYIBk9B2lg==
X-Received: by 2002:a1f:8593:: with SMTP id h141mr3900009vkd.7.1569574358362;
        Fri, 27 Sep 2019 01:52:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ab0:6181:: with SMTP id h1ls306409uan.7.gmail; Fri, 27 Sep
 2019 01:52:37 -0700 (PDT)
X-Received: by 2002:ab0:42c5:: with SMTP id j63mr65470uaj.5.1569574357656;
        Fri, 27 Sep 2019 01:52:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569574357; cv=none;
        d=google.com; s=arc-20160816;
        b=YKU2XG5rB4vi0QY3mEQVJHK4xDZgw0R0jX07d6jznWHSjV2tQD/yriLPZe1IHoLweI
         862Wf8QHPkP3UJY4FM4ceuwodQxEWZwF49zheiKfuqgrb4lM+6SBCYXgGV+29AWi4isI
         pY7luxihwGbqyx6UESskz0G658KE10IIGeuWR62eQyNzbpN2VHNgibnVRjGAhSkKMCDh
         4ElctWvEQpZfXnwUcJwcnrRL56d3/mLbo9XTgOAbT5RVOytANab4W4vyJw0gW0D1/knV
         nt5YCUHbSt7ZMdBXiNykrTUh6wwXpRPV19fzGGXWd+YsuSYGnDH9f6wID9CCEtBUg1J0
         PNaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=pkVPfQhSLbbNhRYLo9QoyvZTFmcZaLlUamqAAAwvGV0=;
        b=pKdNjGDqUcUzMCuRRfLKzqcpS11mmWpEW4EUmFUOSmS7nTeYZKInIHIufpE8QhofZf
         wckbX3hZZRldxUB/gI8tX813AAgtb8hQr46TnNcT2Y7BGHO2Bwog8+5hiBqvmO9+5azO
         y6v3X+1Zy/TRjpw7Ox7biG6vHxiKdW1OXM4id8oMcvPypMBDsbmd9V5Aa81pdH23uRVj
         oCuugvVcQFnbgIwnQ5PNOWUVVbnJWVJoeZ19ZhXuDR9rAfXzYsW7aBw1oGr7gWf/ixS1
         yqOp6lnaNWBjOxCq+yS2FoXrx8TJjo8m1/TNPN7+4mm7dY6ubgQPzi2d35FDSyNHh+Rs
         Okpg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ic6a35ru;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id u65si59685vsb.0.2019.09.27.01.52.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Sep 2019 01:52:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of lokeshvutla@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8R8qaOo073403;
	Fri, 27 Sep 2019 03:52:36 -0500
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8R8qa0f101750
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 27 Sep 2019 03:52:36 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 27
 Sep 2019 03:52:36 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 27 Sep 2019 03:52:28 -0500
Received: from uda0131933.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8R8qX0D099819;
	Fri, 27 Sep 2019 03:52:34 -0500
From: "'Lokesh Vutla' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: Jan Kiszka <jan.kiszka@siemens.com>,
        Jailhouse
	<jailhouse-dev@googlegroups.com>
CC: Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        Lokesh Vutla
	<lokeshvutla@ti.com>
Subject: [PATCH] tools: cell-linux: arm: Do not page align the ramdisk size
Date: Fri, 27 Sep 2019 14:21:42 +0530
Message-ID: <20190927085142.23081-1-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: lokeshvutla@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=ic6a35ru;       spf=pass
 (google.com: domain of lokeshvutla@ti.com designates 198.47.23.248 as
 permitted sender) smtp.mailfrom=lokeshvutla@ti.com;       dmarc=pass
 (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Lokesh Vutla <lokeshvutla@ti.com>
Reply-To: Lokesh Vutla <lokeshvutla@ti.com>
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

When updating linux initrd size in inmate DT, the size is aligned
to page. Because of this some initrd images were not able to mount
by inmate as Linux is seeing junk at end of specified initrd.
Pass the exact initrd size to the Linux kernel.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 tools/jailhouse-cell-linux | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/jailhouse-cell-linux b/tools/jailhouse-cell-linux
index 242761a3..e43f8e42 100755
--- a/tools/jailhouse-cell-linux
+++ b/tools/jailhouse-cell-linux
@@ -317,7 +317,7 @@ class ARMCommon:
 
         ramdisk_size = 0
         if args.initrd:
-            ramdisk_size = page_align(os.fstat(args.initrd.fileno()).st_size)
+            ramdisk_size = os.fstat(args.initrd.fileno()).st_size
             # leave sufficient space between the kernel and the initrd
             decompression_factor = self.default_decompression_factor()
             if args.kernel_decomp_factor:
-- 
2.23.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190927085142.23081-1-lokeshvutla%40ti.com.
